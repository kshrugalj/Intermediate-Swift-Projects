//
//  Bill+Extras.swift
//  BillManager
//

import Foundation
import UserNotifications

extension Bill {
    
    static let notificationCategoryID = "ReminderNotifications"
    
    var hasReminder: Bool {
        remindDate != nil
    }
    
    var isPaid: Bool {
        paidDate != nil
    }
    
    var formattedDueDate: String {
        dueDate?.formatted(date: .numeric, time: .omitted) ?? ""
    }
    
    mutating func removeReminder() {
        guard let id = notificationID else { return }
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        notificationID = nil
        remindDate = nil
    }
    
    private func authorizeIfNeeded(completion: @escaping (Bool) -> Void) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional:
                completion(true)
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, _ in
                    completion(granted)
                }
            default:
                completion(false)
            }
        }
    }
    
    mutating func scheduleReminder(on date: Date, completion: @escaping (Bill) -> Void) {
        var updatedBill = self
        
        updatedBill.removeReminder()
        
        authorizeIfNeeded { granted in
            guard granted else {
                DispatchQueue.main.async {
                    completion(updatedBill)
                }
                return
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Bill Reminder"
            content.body = String(format: "%@ due to %@ on %@",
                                  arguments: [
                                    (updatedBill.amount ?? 0).formatted(.currency(code: "usd")),
                                    updatedBill.payee ?? "",
                                    updatedBill.formattedDueDate
                                  ])
            content.categoryIdentifier = Bill.notificationCategoryID
            content.sound = .default
            
            let triggerDateComponents = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)
            
            let notificationID = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) { error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Notification Error: \(error.localizedDescription)")
                    } else {
                        updatedBill.notificationID = notificationID
                        updatedBill.remindDate = date
                    }
                    completion(updatedBill)
                }
            }
        }
    }
}

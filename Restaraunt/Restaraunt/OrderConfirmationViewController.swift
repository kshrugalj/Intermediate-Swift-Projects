//
//  OrderConfirmationViewController.swift
//  Restaraunt
//
//  Created by Kshrugal Reddy Jangalapalli on 11/17/24.
//
import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet weak var timeRemainingLabel: UILabel!
    
    var minutes: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeRemainingLabel.text = "Thank you for your order! Your wait time is approximately \(minutes!) minutes."
    }
    
    @IBAction func unwindToOrderList(segue: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
}


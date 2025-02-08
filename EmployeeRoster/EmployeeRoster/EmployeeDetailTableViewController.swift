import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    var employeeType: EmployeeType?
    var employee: Employee?
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    
    let nameRow = 0
    let dateLabelCellIndex = 1
    let datePickerCellIndex = 2
    
    var isEditingBirthday = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    func updateSaveButtonState() {
        saveBarButtonItem.isEnabled = employeeType != nil && !(nameTextField.text?.isEmpty ?? true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == datePickerCellIndex && !isEditingBirthday {
            return 0
        }
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == dateLabelCellIndex {
            isEditingBirthday.toggle()
        }
    }
    
    @IBAction func dobChanged(_ sender: UIDatePicker) {
        dobLabel.text = DateFormatter.localizedString(from: dobDatePicker.date, dateStyle: .medium, timeStyle: .none)
        dobLabel.textColor = .black
    }
    
    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let employeeType = employeeType else { return }
        
        let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
        dismiss(animated: true, completion: nil)
    }
    
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect type: EmployeeType) {
        self.employeeType = type
        employeeTypeLabel.text = type.description
        employeeTypeLabel.textColor = .black
        updateSaveButtonState()
        navigationController?.popViewController(animated: true)
    }
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let controller = EmployeeTypeTableViewController(coder: coder)
        controller?.delegate = self
        controller?.employeeType = employeeType
        return controller
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        guard let employeeTypeLabelViewController = segue.destination as? EmployeeTypeTableViewController else { return }
        employeeTypeLabelViewController.employeeType = employee?.employeeType
        employeeTypeLabelViewController.delegate = self
        
        
    }
}

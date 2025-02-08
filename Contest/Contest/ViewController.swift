//
//  ViewController.swift
//  Contest
//
//  Created by Kshrugal Reddy Jangalapalli on 11/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonTouched(_ sender: UIButton) {
        if let text = emailAddressTextField.text, !text.isEmpty {
            performSegue(withIdentifier: "showContest", sender: nil)
        } else{
            shakeTextField()
        }
    }
    
    func shakeTextField() {
        UIView.animate(withDuration: 0.1, animations: {
            let moveRight = CGAffineTransform(translationX: 10, y: 0)
            self.emailAddressTextField.transform = moveRight
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                let moveLeft = CGAffineTransform(translationX: -20, y: 0)
                self.emailAddressTextField.transform = moveLeft
            }) { _ in
                self.emailAddressTextField.transform = CGAffineTransform.identity
            }
        }
    }

    
}


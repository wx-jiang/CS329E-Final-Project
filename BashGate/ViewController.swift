//
//  ViewController.swift
//  BashGate
//
//  Created by Saahir Janmohamed on 10/12/22.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    var segue_state:Bool = false
    let segueIdentifier:String = "loginSegueIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegueIdentifier"{
            if segue_state == true {
                print("in segue true")
                return true
            } else if segue_state == false {
                print("in segue false")
                return false
            }
        }
        return true
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if emailText.text?.isEmpty == true || pwdText.text?.isEmpty == true{
            segue_state = false
            let missingAlert = UIAlertController(title: "Missing content", message: "There are missing informatioon", preferredStyle: .alert)
            missingAlert.addAction(UIAlertAction(title:"OK", style:.default))
            present(missingAlert,animated: true)
        }
    else{
        Auth.auth().signIn(withEmail: emailText.text!, password: pwdText.text!) {
            authResult, error in
            if (error as NSError?) != nil {
                print("error")
                let wrongAlert = UIAlertController(title: "Warning", message: "Wrong email or password", preferredStyle: .alert)
                wrongAlert.addAction(UIAlertAction(title:"OK", style:.default))
                self.present(wrongAlert,animated: true)
            } else {
                print("in success login")
                self.segue_state = true
            }
        }
    }
    }
    
}


//
//  RegisterVC.swift
//  BashGate
//
//  Created by Saahir Janmohamed on 10/12/22.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var pwdText: UITextField!
    @IBOutlet weak var confirmPwdText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    var segue_state:Bool = false
    let segueIdentifier:String = "registerSegueIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        if emailText.text?.isEmpty == true || pwdText.text?.isEmpty == true {
            segue_state = false
            let alert = UIAlertController(title: "Missing content", message: "There are missing informatioon", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default))
            present(alert, animated: true)
            
        }
        else if
            pwdText.text != confirmPwdText.text{
            segue_state = false
            let unequalAlert = UIAlertController(title: "Passwords Unequal", message: "The two input passwords are not consistent", preferredStyle: .alert)
            unequalAlert.addAction(UIAlertAction(title:"OK", style:.default))
            present(unequalAlert, animated: true)
            
        }
        else{
            Auth.auth().createUser(withEmail: emailText.text!, password: pwdText.text!) {
                authResult, error in
                if (error as NSError?) != nil {
                    self.segue_state = false
                } else {
                    self.segue_state = true
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

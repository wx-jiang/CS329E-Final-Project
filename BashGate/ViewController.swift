////
////  ViewController.swift
////  BashGate
////
////  Created by Saahir Janmohamed on 10/12/22.
////
//
//import UIKit
//import FirebaseAuth
//class ViewController: UIViewController {
//
//    @IBOutlet weak var emailText: UITextField!
//    @IBOutlet weak var pwdText: UITextField!
//    var segue_state:Bool = false
//    let segueIdentifier:String = "loginSegueIdentifier"
//    
//    private let imageView: UIImageView = {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height:150))
//        imageView.image = UIImage(named: "Subject")
//        return imageView
//    }()
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(imageView)
//        // Do any additional setup after loading the view.
//    }
//    override func viewDidLayoutSubviews () {
//        super.viewDidLayoutSubviews ()
//        imageView.center = view.center
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: self.animate)
//        animate()
//    }
//    private func animate(){
//        UIView.animate(withDuration: 1, animations: {
//            let size = self.view.frame.size.width * 3
//            let diffX = size - self.view.frame.size.width
//            let diffY = self.view.frame.size.height - size
//            
//            self.imageView.frame = CGRect(x: -(diffX/2),
//                                          y: diffY/2,
//                                          width: size,
//                                          height: size)
//        })
//        
//        UIView.animate(withDuration: 2, animations: {
//            self.imageView.alpha = 0
//        })
//        
//    }
//    
//    @IBAction func loginPressed(_ sender: Any) {
//        if emailText.text?.isEmpty == true || pwdText.text?.isEmpty == true{
//            segue_state = false
//            let missingAlert = UIAlertController(title: "Missing content", message: "There are missing informatioon", preferredStyle: .alert)
//            missingAlert.addAction(UIAlertAction(title:"OK", style:.default))
//            present(missingAlert,animated: true)
//        }
//    else{
//        Auth.auth().signIn(withEmail: emailText.text!, password: pwdText.text!) { [self]
//            authResult, error in
//            if (error as NSError?) != nil {
//                print("error")
//                let wrongAlert = UIAlertController(title: "Warning", message: "Wrong email or password", preferredStyle: .alert)
//                wrongAlert.addAction(UIAlertAction(title:"OK", style:.default))
//                self.present(wrongAlert,animated: true)
//            } else {
//                print("in success login")
//                self.segue_state = true
//                self.performSegue(withIdentifier: segueIdentifier, sender: Any?.self)
//            }
//        }
//    }
//    }
//    
//}
//

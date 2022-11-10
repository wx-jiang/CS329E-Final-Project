//
//  CreatePostVC.swift
//  BashGate
//
//  Created by Saahir Janmohamed on 10/12/22.
//

import UIKit

class CreatePostVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var uploadBtn: UIButton!
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //button function{
    @IBAction func buttonPressed(_ sender: Any){
    if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    print("Button capture")

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = false

                    present(imagePicker, animated: true, completion: nil)
                }
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
            self.dismiss(animated: true, completion: { () -> Void in

            })
            imgView.image = image
        }
    
}

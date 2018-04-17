//
//  ViewController.swift
//  PhotoShare
//
//  Created by Carmine Massei on 17/04/18.
//  Copyright © 2018 iOSFoundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var foto: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        foto.image = selectedImage
//        foto.layer.cornerRadius = 75.0
//        foto.frame = CGRect(x: 10.0, y: 10.0, width: 150, height: 150)
        foto.layer.masksToBounds = true
        
        
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func scatta(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        
//        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.sourceType = UIImagePickerControllerSourceType.camera
        
        image.allowsEditing = false
        
        self.present(image, animated: true){
            
        }
    }
    
    
    @IBAction func condividi(_ sender: UIButton) {
        let activityController = UIActivityViewController(activityItems: [foto.image!], applicationActivities: nil)
        
        present(activityController, animated: true, completion: nil)
    }
    
    
}


//
//  ViewController.swift
//  CameraFilterApp
//
//  Created by Kobie Nikka on 3/4/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    var filter: String = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            self.dismiss(animated: true, completion: nil)
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            let inputImage = image
            let context = CIContext(options: nil)
            
            if let filter = CIFilter(name: filter) {
                let beginImage = CIImage(image: inputImage)
                filter.setDefaults()
                filter.setValue(beginImage, forKey: kCIInputImageKey)
                
                if let output = filter.outputImage {
                    if let cgimg = context.createCGImage(output, from: output.extent) {
                        let processedImage = UIImage(cgImage: cgimg)
                        imageView.image = processedImage
                    }
                }
            }
        }

    

    @IBAction func sepiaButton(_ sender: Any) {
        filter = "CISepiaTone"
    }
    
    @IBAction func chromeButton(_ sender: Any) {
        filter = "CIPhotoEffectChrome"
    }
    @IBAction func noirButton(_ sender: Any) {
        filter = "CIPhotoEffectNoir"
    }
   
    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}


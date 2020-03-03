//
//  ViewController.swift
//  PhotoTaker
//
//  Created by Kobie Nikka on 2/20/20.
//  Copyright © 2020 Kobie Nikka. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var totalPhotos: Int = 0
    var newestPhoto: UIImage?
    var takerController: UIImagePickerController!
    var picture: UIImage? = nil
   
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func takePicture(_ sender: Any) {
        takeIt()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                }
            }
        default:
            return
        }
        let viewFrame = self.view.frame
        scrollView.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: viewFrame.height)
    }

    
    func takeIt() -> Int {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
        totalPhotos += 1
        return(totalPhotos)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        let photo = info[.originalImage] as? UIImage
        addPhotoToStack(theImage: photo!)
    }

    func addPhotoToStack(theImage: UIImage){
        let newButton = ButtonValue()
        newButton.frame = CGRect(x: 0, y: 0, width: 414, height: 300)
        newButton.setImage(theImage, for: .normal)
        newButton.addTarget(self, action: #selector(getButtonsImage), for: .touchUpInside)
        newButton.addTarget(self, action: #selector(whichImageWasClicked), for: .touchUpInside)
        newButton.value = totalPhotos
        newButton.picture = theImage
        stackView.addArrangedSubview(newButton)
        stackView.frame = CGRect(x: 0, y: 0, width: 414, height: (totalPhotos * 300))
        scrollView.contentSize = CGSize(width: 414, height: (totalPhotos * 300))
//        picture = theImage
//        return(picture)
    }
    
    @objc func getButtonsImage(_ sender: ButtonValue) -> UIImage?{
        picture = sender.picture
        return(picture)
    }
    
    @objc func whichImageWasClicked(_ sender: ButtonValue){
//        picture = sender.picture
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "SinglePhotoViewController") as? SinglePhotoViewController else {
            print("cant find viewController")
            return
        }
        
        navigationController?.pushViewController(destinationViewController, animated: true)
        
//        return(picture)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SinglePhotoViewController
        vc.image = picture
        vc.whichPhoto = totalPhotos
        print("prepare function ran")
    }
}


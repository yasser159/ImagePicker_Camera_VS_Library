//
//  ViewController.swift
//  ImagePicker_Camera_VS_Library
//
//  Created by Yasser Hajlaoui on 12/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func chooseImageAction(_ sender: Any) {
        showImagePickerOptions()
    }
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController{
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
    func showImagePickerOptions(){
        let alertVC = UIAlertController(title: "Pick a Photo", message: "Choose a picture from Library or camera", preferredStyle: .actionSheet)
        
        //Image picker for camera
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] (action) in
            //Capture self to avoid retain cycles
            guard let self = self else {
                return
            }
            let cameraImagePicker = self.imagePicker(sourceType: .camera)
            cameraImagePicker.delegate = self
            self.present(cameraImagePicker, animated: true) {
                //Todo
            }
        }
            //Image Picker for Library
            let libraryAction = UIAlertAction(title: "Library", style: .default) { [weak self] (action) in
                //Capture self to avoid retain cycles
                guard let self = self else {
                    return
                }
                let libraryImagePicker = self.imagePicker(sourceType: .photoLibrary)
                libraryImagePicker.delegate = self
                self.present(libraryImagePicker, animated: true) {
                    //TODO
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertVC.addAction(cameraAction)
            alertVC.addAction(libraryAction)
            alertVC.addAction(cancelAction)
            self.present(alertVC, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        
        //print(image)
        
        self.imageView.image = image
        self.dismiss(animated: true, completion: nil)
    }
}

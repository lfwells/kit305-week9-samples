//
//  ViewController.swift
//  CameraExample
//
//  Created by Lindsay Wells on 15/3/18.
//  Copyright © 2018 Lindsay Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,  UINavigationControllerDelegate
{
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func galleryButtonTapped(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("Gallery available")
            
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            print("Camera available")
            let imagePicker:UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            print("No camera available")
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imageView.image = image
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func shareButtonTapped(_ sender: Any)
    {
        if let image = imageView.image
        {
            let shareViewController = UIActivityViewController(activityItems: ["Check out this picture", image], applicationActivities: [])
            present(shareViewController, animated: true, completion: nil)
        }
    }
    
    
    
    //file saving functionality, presented without warranty
    /*
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        print("did finish picking media")
        
        // create a filepath with the current date/time as the image name
        let savePath:String = self.documentsPath()! + "/" + self.presentDateTimeString() + ".png"
        
        // try to get our edited image if there is one, as well as the original image
        let editedImg:UIImage?   = info[UIImagePickerControllerEditedImage] as? UIImage
        let originalImg:UIImage? = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        // create our image data with the edited img if we have one, else use the original image
        let imgData:Data = editedImg == nil ? UIImagePNGRepresentation(editedImg!)! : UIImagePNGRepresentation(originalImg!)!
        
        // write the image data to file
        //imgData.write(to:savePath)
        
        // dismiss the picker
        self.dismiss(animated:true, completion: nil)
    }
    
    // added these methods simply for convenience/completeness
    func documentsPath() ->String?
    {
        // fetch our paths
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        if paths.count > 0
        {
            // return our docs directory path if we have one
            let docsDir = paths[0]
            return docsDir
        }
        return nil
    }
    
    func presentDateTimeString() ->String
    {
        // setup date formatter
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        
        // get current date
        let now:Date = Date()
        
        // generate date string from now
        let theDateTime = dateFormatter.string(from:now)
        return theDateTime
        
    }*/
}


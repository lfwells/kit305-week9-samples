//
//  ViewController.swift
//  SharingExample
//
//  Created by Lindsay Wells on 11/4/18.
//  Copyright © 2018 Lindsay Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var txtInput: UITextField!
    
    @IBAction func shareButtonTapped(_ sender: Any)
    {
        //let shareViewController = UIActivityViewController(activityItems: [txtInput.text], applicationActivities: [])
        
        let shareViewController = UIActivityViewController(activityItems: ["I got the high score on Candy Crush!"], applicationActivities: [])
        shareViewController.excludedActivityTypes = [UIActivityTypePostToFacebook]
        present(shareViewController, animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


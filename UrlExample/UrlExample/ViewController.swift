//
//  ViewController.swift
//  UrlExample
//
//  Created by Lindsay Wells on 15/3/18.
//  Copyright © 2018 Lindsay Wells. All rights reserved.
//

import UIKit
import WebKit //!!!!

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var txtResult: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSearchPressed(_ sender: UIButton)
    {
        let url = URL(string: "https://carers-care.edu.au/request.php") //http request gets a warning
        var urlRequest = URLRequest(url:url!)
        
        // Convert POST string parameters to data using UTF8 Encoding
        let postParams = "q="+txtSearch.text!
        let postData = postParams.data(using: .utf8)
        
        // Set the httpMethod and assign httpBody
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = postData
        /*
         <?php echo "<h1>The text you entered was '".$_REQUEST['q']."'</h1>"; ?>
         */
        
        let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            let str = String(NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!);
            
            DispatchQueue.main.async{ [weak self] in
                if let vc = self
                {
                    vc.txtResult.text = str
                    vc.webView.load(data!, mimeType: "text/html", characterEncodingName: "", baseURL: url!)
                    
                    print(str)
                }
                
            }
        }
        
        task.resume()
    }
    
}


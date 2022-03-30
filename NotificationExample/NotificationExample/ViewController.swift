//
//  ViewController.swift
//  NotificationExample
//
//  Created by Lindsay Wells on 15/3/18.
//  Copyright © 2018 Lindsay Wells. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert, .sound])
        {
            (granted, error) in
            
            /* categories
            let generalCategory = UNNotificationCategory(identifier: "GENERAL",
                                                         actions: [],
                                                         intentIdentifiers: [],
                                                         options: .customDismissAction)
            
            // Register the category.
            let center = UNUserNotificationCenter.current()
            center.setNotificationCategories([generalCategory])
            */
            
            print("this happens each time we grant access")
            if (granted)
            {
                let content = UNMutableNotificationContent()
                content.title = "Reminder"
                content.body = "It's time to use this awesome app"
                content.badge = 1
                
                /*
                content.title = NSString.localizedUserNotificationString(forKey: "Wake up!", arguments: nil)
                content.body = NSString.localizedUserNotificationString(forKey: "Rise and shine! It's morning time!", arguments: nil)
                 */
                
                // Configure the trigger for a 7am message (you will need to change this code to a time near you right now.
                var dateInfo = DateComponents()
                dateInfo.hour = 17
                dateInfo.minute = 44
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
                
                // Create the request object.
                let request = UNNotificationRequest(identifier: "MorningAlarm", content: content, trigger: trigger)
                
                // Schedule the request.
                notificationCenter.add(request) { (error : Error?) in
                    if let theError = error {
                        print(theError.localizedDescription)
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


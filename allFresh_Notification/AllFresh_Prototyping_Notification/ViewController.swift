//
//  ViewController.swift
//  AllFresh_Prototyping_Notification
//
//  Created by Ruby Wang on 2016/10/29.
//  Copyright © 2016年 Ruby Wang. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge,.sound]) { (granted, error) in
            // Enable or disable features based on authorization.
            if granted{
                print("persimisson")
            } else{
                print("error alert")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func notifyButtonTapped(sender:UIButton){
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.title = "AllFresh Reminder"
        content.body = "Food is rotting. Go eat!"
        content.sound = UNNotificationSound.default()
        content.badge = 1

        var alertdate = DateComponents()
        let date = Date()
        let calendar = NSCalendar.current
        alertdate.year = calendar.component(.year, from: date)
        alertdate.month = calendar.component(.month, from: date)
        alertdate.day = calendar.component(.day, from: date)
        alertdate.hour = calendar.component(.hour, from: date)
        alertdate.minute = calendar.component(.minute, from: date)
        alertdate.second = calendar.component(.second, from: date)+5
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: alertdate, repeats: true)
    
        let request = UNNotificationRequest(identifier: "Expire date", content: content, trigger: trigger) // Schedule the notification.
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { error in
            if error != nil{
                print("error")
            }else{
                print("notification scheduled successfully")
            }
        })
    }
    
    func getNotificationSettings(completionHandler: @escaping (UNNotificationSettings) -> Void){
        //getNotificationSettings
        print("hey")
    }
    

}


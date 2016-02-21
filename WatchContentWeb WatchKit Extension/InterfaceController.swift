//
//  InterfaceController.swift
//  WatchContentWeb WatchKit Extension
//
//  Created by Alex Schwartz on 2/21/16.
//  Copyright © 2016 Alex Schwartz. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        var url = NSURL(string: "http://www.applewatchdevelopercourse.com/message.html")
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
            if error == nil{
                let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in self.label.setText(String(urlContent!))
                })
            } else {
                print(error)
            }
        }
        task.resume()
        
        url = NSURL(string: "http://sports.cbsimg.net/images/collegefootball/harbaugh-play-nd.jpg")
        
        task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) -> Void in
            
            if error == nil {
                let urlImage = UIImage(data: data!)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in self.image.setImage(urlImage!)
                })
            } else {
                print(error)
            }
        }
        task.resume()
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var image: WKInterfaceImage!
}

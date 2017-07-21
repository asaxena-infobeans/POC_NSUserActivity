//
//  ViewController.swift
//  POC_SearchAPI
//
//  Created by IBAdmin on 20/07/17.
//  Copyright © 2017 IBAdmin. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setUpSpotLightSearch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setUpSpotLightSearch(){
        /*let attributeSet = CSSearchableItemAttributeSet.init(itemContentType: kUTTypeImage as String)
        attributeSet.title = "Spotlight search feature"
        attributeSet.contentDescription = ""
        attributeSet.keywords = ["Hi", "Hello"]
        let item = CSSearchableItem.init(uniqueIdentifier: "com.infobeans", domainIdentifier: "spotlight.infobeans", attributeSet: attributeSet)
        CSSearchableIndex.default().indexSearchableItems([item]) { (error) in
            if let err = error{
                print(err)
            }
            
        }*/
        
        let activity = NSUserActivity.init(activityType: "com.infobeans.selfie.info")
        activity.title = "Testing User activity"
        activity.userInfo = ["index":"com.infobeans.selfie.info"]
        activity.keywords = NSSet(array: ["Bills","Pay Bills"]) as! Set<String>
        activity.isEligibleForSearch = true
        activity.becomeCurrent()
    }
    

}


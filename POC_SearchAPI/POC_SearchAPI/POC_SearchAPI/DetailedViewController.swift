//
//  DetailedViewController.swift
//  Search
//
//  Created by AppsFoundation on 05/10/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class DetailedViewController: UIViewController, NSUserActivityDelegate {
    
    var bookInfo: BookInfo!

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var bookIndex: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Book Details"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.setUpDataOnView()
        self.initUserActivity()
//        self.setUpSpotLightSearch() /* Search API using CoreSpotlight Framework */
    }
    // MARK: Method for setting up data on the view
    func setUpDataOnView() {
        bookLabel.text = bookInfo.bookName
        authorLabel.text = bookInfo.author
        priceLabel.text = bookInfo.price
    }
    // MARK: Method for initializing activity
    func initUserActivity(){
        // Creating user activity
        let activity = NSUserActivity(activityType: "com.infobeans.selfie.book")
        activity.title = bookInfo.bookName
        var keywords:[String] = []
        if let bookName = bookInfo.bookName as? NSString{
            keywords = bookName.components(separatedBy: " ")
        }
        keywords.append(bookInfo.author)
        keywords.append(bookInfo.price)
        activity.keywords = Set(keywords)
        activity.isEligibleForHandoff = true
        activity.isEligibleForSearch = true
        activity.isEligibleForPublicIndexing = true
        activity.delegate = self
        activity.needsSave = true
        userActivity = activity
        userActivity!.becomeCurrent()
    }
    
    // MARK: Search API using CoreSpotlight Framework
    func setUpSpotLightSearch(){
        let attributeSet = CSSearchableItemAttributeSet.init(itemContentType: kUTTypeImage as String)
        attributeSet.title = bookInfo.bookName
        attributeSet.contentDescription = ""
        var keywords:[String] = []
        if let bookName = bookInfo.bookName as? NSString{
            keywords = bookName.components(separatedBy: " ")
        }
        keywords.append(bookInfo.author)
        keywords.append(bookInfo.price)
        attributeSet.keywords = keywords
        let item = CSSearchableItem.init(uniqueIdentifier: "com.infobeans.selfie.book", domainIdentifier: "spotlight.infobeans", attributeSet: attributeSet)
        CSSearchableIndex.default().indexSearchableItems([item]) { (error) in
            if let err = error{
                print(err)
            }
            
        }
    }

    
    // MARK: NSUserActivity Delegate Methods
     func userActivityWillSave(_ userActivity: NSUserActivity) {
        userActivity.userInfo = ["index": bookIndex!]
    }
    
}

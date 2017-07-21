//
//  BookInfo.swift
//  Search
//
//  Created by AppsFoundation on 05/10/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

class BookInfo: NSObject {
    
    var bookName: String
    var author: String
    var price: String
    
    init(bookName: String, author: String, price: String) {
        self.bookName = bookName
        self.author = author
        self.price = price
    }
    
}

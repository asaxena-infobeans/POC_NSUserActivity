//
//  ListViewController.swift
//  Search
//
//  Created by AppsFoundation on 05/10/15.
//  Copyright © 2015 AppsFoundation. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    fileprivate var bookList: [BookInfo] = []

    @IBOutlet weak var tableView: UITableView!
    private var searchedBookIdentifier: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        // adding few Books information in booklist
        bookList.append(BookInfo(bookName: "God's Little Soldier", author: "Kiran Nagarkar", price: "$153.50"))
        bookList.append(BookInfo(bookName: "The God of Small Things", author: "Arundhati Roy", price: "$250.70"))
        bookList.append(BookInfo(bookName: "Our Moon Has Blood Clots", author: "Rahul Pandita", price: "$169.00"))
        bookList.append(BookInfo(bookName: "A Suitable Boy", author: "Vikram Seth", price: "$180.00"))
        bookList.append(BookInfo(bookName: "English, August: An Indian Story", author: "Upamanyu Chatterjee", price: "$190.00"))
        bookList.append(BookInfo(bookName: "The Inheritance of Loss", author: "Kiran Desai", price: "$160.50"))
        bookList.append(BookInfo(bookName: "The White tiger", author: "Aravind Adiga", price: "$162.00"))
        bookList.append(BookInfo(bookName: "The Blue Umbrella", author: "Ruskin Bond", price: "$179.00"))
        bookList.append(BookInfo(bookName: "A Fine Balance", author: "Rohinton Mistry", price: "$263.00"))
        bookList.append(BookInfo(bookName: "An Obedient Father", author: "Akhil Sharma", price: "$105.00"))
        bookList.append(BookInfo(bookName: "A Matter Of Rats", author: "Amitava Kumar", price: "$82.00"))
        bookList.append(BookInfo(bookName: "An Area Of Darkness", author: "V.S. Naipaul", price: "$186.00"))
        bookList.append(BookInfo(bookName: "The Hungry Tide", author: "Amitav Ghosh", price: "$95.00"))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        self.navigationItem.title = "Books"
        super.viewWillAppear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var bookId: Int?
        if let index = tableView.indexPathForSelectedRow?.row {
            bookId = index
        } else {
            bookId = searchedBookIdentifier
        }
        let controller = segue.destination as! DetailedViewController
        controller.bookInfo = bookList[bookId!]
        controller.bookIndex = bookId!

    }
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        if let index = activity.userInfo?["index"] as? Int {
            searchedBookIdentifier = index
            self.performSegue(withIdentifier: "showDetail", sender: self)
        }
    }

}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "MyCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        cell!.textLabel!.text = bookList[indexPath.row].bookName
        return cell!
    }
  
}

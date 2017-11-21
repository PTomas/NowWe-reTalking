//
//  ViewController.swift
//  Discussion
//
//  Created by Patrick Tomas on 5/21/17.
//  Copyright © 2017 Patrick Tomas. All rights reserved.
//

import UIKit

var topicNum = 0
var headline = NSString()
var dataString = String()
var Array = NSMutableArray()
var arrImageName = NSMutableArray()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var myTableView: UITableView!
    
    var searchBar:UISearchBar = UISearchBar()
    
    let sec: DiscussionVC = DiscussionVC(nibName: nil, bundle: nil)
    
    let thi: PostVC = PostVC(nibName: nil, bundle: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        Array = ["Trump blames Republicans for legislative 'mess'","Kim Wall case: Murder charge sought for Peter Madsen","Charlottesville violence","Ryan tamps down Trump's talk of gov't shutdown if no border wall","Trump tweets cryptically about James Clapper","Several hostages held inside a South Carolina restaurant, where a disgruntled worker shot one person, officials say","Marco Rubio won’t hold town halls – so this teenager crashed one of his fundraisers to hold him accountable","John McCain's daughter slams 'cruelty' of Trump supporter who reportedly called for his death","India's Supreme Court says citizens have a fundamental right to privacy, in a landmark ruling","Workers place tarps over 2 Charlottesville monuments to Confederate generals after city council votes to cover them","CNN fires Kathy Griffin from New Year's Eve show", "Trump cuts Epa Funding by 31%", "Trump Signs Bill Revoking Obama-Era Gun Checks", "Egypt's new NGO law"]//recieve strings from server
        
        arrImageName = ["https://www.wsj.com/,https://twitter.com/i/streams/category/686639666779394072?lang=en,https://news.google.com/news/?ned=us&hl=en"]//recieve strings from server
        
        
        let label = UILabel()
        let barHeight: CGFloat = 86//UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        label.frame = CGRect(x:40, y:30, width:350, height:35)
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.text=("Now You're Talking")
        label.font = UIFont(name:"Avenir-Black", size: 30.0)
        label.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        self.view.addSubview(label)
        
        let Fimage = UIImage(named: "favoritesButton.png") as UIImage?
        let favoritesButton = UIButton(frame: CGRect(x: self.view.frame.width-45 , y: 30, width: 30, height: 30))
        favoritesButton.backgroundColor = UIColor.white
        favoritesButton.setImage(Fimage, for: .normal)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        self.view.addSubview(favoritesButton)
        
        let postimage = UIImage(named: "postImage.png") as UIImage?
        let postButton = UIButton(frame: CGRect(x: 10 , y: 30, width: 30, height: 30))
        postButton.backgroundColor = UIColor.white
        postButton.setImage(postimage, for: .normal)
        postButton.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
        self.view.addSubview(postButton)
        
        let separator = UIView()
        separator.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: 1)
        separator.backgroundColor = UIColor.black
        self.view.addSubview(separator)
        
        let separator2 = UIView()
        separator2.frame = CGRect(x: 0, y: 127, width: self.view.frame.width, height: 1)
        separator2.backgroundColor = UIColor.black
        //self.view.addSubview(separator2)
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 128, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.frame = CGRect(x: 0, y: 87, width: self.view.frame.width, height: 40)
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        searchBar.layer.borderWidth = 1
        searchBar.layer.cornerRadius = 10
        navigationItem.titleView = searchBar
        self.view.addSubview(searchBar)
        
        let topGrad = UIImage(named: "topGrad.png")
        let topGradView = UIImageView(image: topGrad!)
        topGradView.frame = CGRect(x:0, y:108, width:self.view.frame.width, height:15)
        //self.view.addSubview(topGradView)
        
        let bottomGrad = UIImage(named: "bottomGrad.png")
        let bottomGradView = UIImageView(image: bottomGrad!)
        bottomGradView.frame = CGRect(x:0, y:self.view.frame.height-15, width:self.view.frame.width, height:15)
        self.view.addSubview(bottomGradView)
        
        let swipeLeft : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left

        
    }
    
    
    
    func swipe() {
        print("New Post")
        let postVC:PostVC = PostVC()
        
        self.present(postVC, animated: false, completion: nil)
    }
    
    
    func postButtonTapped() {
        print("New Post")
        let postVC:PostVC = PostVC()
        
        self.present(postVC, animated: false, completion: nil)
    }
    
    func favoritesButtonTapped() {
        print("Go to favorites")
        let favVC:FavoritesVC = FavoritesVC()
        
        self.present(favVC, animated: false, completion: nil)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange textSearched: String){
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topicNum = indexPath.row
        headline = ("\(Array[topicNum])" as NSString)
        
        func setLabelInfo(labelInfo: NSString){
            topic.text = labelInfo as String
            
        }
        setLabelInfo(labelInfo: headline)
        
        func setInfo(info: NSString){
            topicString = info as NSString
            
        }
        setInfo(info: headline)
        
        print("Num: \(indexPath.row)")
        print("Topic: \(Array[indexPath.row])")//send to server for first grouping
        
       let discussionVC:DiscussionVC = DiscussionVC()
        self.present(discussionVC, animated: false, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(Array[indexPath.row])"
        cell.textLabel!.font = UIFont(name:"Avenir-Black", size: 30.0)
        cell.imageView?.image = UIImage(named:"WSJButton.jpg")
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        cell.imageView?.layer.borderWidth = 1.0
        cell.imageView?.layer.cornerRadius = 5
        return cell
    }
    
    
}


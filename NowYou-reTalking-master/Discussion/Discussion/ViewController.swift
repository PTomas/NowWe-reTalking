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


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let Array: NSMutableArray = ["Trump blames Republicans for legislative 'mess'","Kim Wall case: Murder charge sought for Peter Madsen","Charlottesville violence","Ryan tamps down Trump's talk of gov't shutdown if no border wall","Trump tweets cryptically about James Clapper","Several hostages held inside a South Carolina restaurant, where a disgruntled worker shot one person, officials say","Marco Rubio won’t hold town halls – so this teenager crashed one of his fundraisers to hold him accountable","John McCain's daughter slams 'cruelty' of Trump supporter who reportedly called for his death","India's Supreme Court says citizens have a fundamental right to privacy, in a landmark ruling","Workers place tarps over 2 Charlottesville monuments to Confederate generals after city council votes to cover them","CNN fires Kathy Griffin from New Year's Eve show", "Trump cuts Epa Funding by 31%", "Trump Signs Bill Revoking Obama-Era Gun Checks", "Egypt's new NGO law"]
    
    var arrImageName: NSMutableArray = [""]
    
    var myTableView: UITableView!
    
    let sec: DiscussionVC = DiscussionVC(nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        var label = UILabel()
        let barHeight: CGFloat = 86//UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        label.frame = CGRect(x:40, y:30, width:350, height:45)
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.text=("What's Talking")
        label.font = UIFont(name:"Avenir-Black", size: 40.0)
        label.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        self.view.addSubview(label)
        
        let Fimage = UIImage(named: "favoritesButton.png") as UIImage?
        let favoritesButton = UIButton(frame: CGRect(x: self.view.frame.width-50 , y: 30, width: 40, height: 40))
        favoritesButton.backgroundColor = UIColor.white
        favoritesButton.setImage(Fimage, for: .normal)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        self.view.addSubview(favoritesButton)
        
        let postimage = UIImage(named: "postImage.png") as UIImage?
        let postButton = UIButton(frame: CGRect(x: 10 , y: 30, width: 40, height: 40))
        postButton.backgroundColor = UIColor.white
        postButton.setImage(postimage, for: .normal)
        postButton.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
        self.view.addSubview(postButton)
        
        let separator = UIView()
        separator.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: 1)
        separator.backgroundColor = UIColor.black
        self.view.addSubview(separator)
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 86, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        let topGrad = UIImage(named: "topGrad.png")
        let topGradView = UIImageView(image: topGrad!)
        topGradView.frame = CGRect(x:0, y:86, width:self.view.frame.width, height:15)
        self.view.addSubview(topGradView)
        
        let bottomGrad = UIImage(named: "bottomGrad.png")
        let bottomGradView = UIImageView(image: bottomGrad!)
        bottomGradView.frame = CGRect(x:0, y:self.view.frame.height-15, width:self.view.frame.width, height:15)
        self.view.addSubview(bottomGradView)
        
    }
    
    func postButtonTapped() {
        //make alert here or link to new view
    }
    
    func favoritesButtonTapped() {
        print("Go to favorites")
        let favVC:FavoritesVC = FavoritesVC()
        
        self.present(favVC, animated: false, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        topicNum = indexPath.row
        headline = ("\(Array[topicNum])" as NSString)
        
        func setInfo(info: NSString){
            topic.text = info as String
        }
        
        setInfo(info: headline)
        print("Num: \(indexPath.row)")
        print("Topic: \(Array[indexPath.row])")
        
       let discussionVC:DiscussionVC = DiscussionVC()
        self.present(discussionVC, animated: false, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(Array[indexPath.row])"
        cell.imageView?.image = UIImage(named:"WSJButton.jpg")
        cell.imageView?.layer.borderWidth = 1.0
        cell.imageView?.layer.cornerRadius = 5
        return cell
    }
    
    
}


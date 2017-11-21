//
//  PostVC.swift
//  Discussion
//
//  Created by Patrick Tomas on 9/7/17.
//  Copyright © 2017 Patrick Tomas. All rights reserved.
//

import UIKit

let topicTextField = UITextField()
let linkTextField = UITextField()

class PostVC: UIViewController, UITextViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        var label = UILabel()
        label = UILabel(frame: CGRect(x:0, y:30, width:350, height:35))
        label.frame.origin = CGPoint(x: self.view.frame.width / 2 - 30, y: 30)
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        label.text="Now You're Talking"
        label.font = UIFont(name:"Avenir-Black", size: 30.0)
        self.view.addSubview(label)
    
        let separator = UIView()
        separator.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: 1)
        separator.backgroundColor = UIColor.black
        self.view.addSubview(separator)
        
        var postLabel = UILabel()
        postLabel = UILabel(frame: CGRect(x: self.view.frame.width/2, y: 90, width: 300, height: 50))
        postLabel.center.x = self.view.center.x
        postLabel.textAlignment = .center
        postLabel.text="Post"
        postLabel.font = UIFont(name:"Avenir-Black", size: 40.0)
        postLabel.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        self.view.addSubview(postLabel)
        
        let linkImage1 = UIImage(named: "TButton.png") as UIImage?//recieve link icon from server
        let linkButton1 = UIButton(frame: CGRect(x: (self.view.frame.width/2)+70, y: 180, width: 100, height: 100))
        linkButton1.layer.cornerRadius = 5
        linkButton1.backgroundColor = UIColor.white
        linkButton1.setImage(linkImage1, for: .normal)
        linkButton1.addTarget(self, action: #selector(linkButton1Tapped), for: .touchUpInside)
        self.view.addSubview(linkButton1)
        
        let linkImage2 = UIImage(named: "WSJButton.jpg") as UIImage?//recieve link icon from server
        let linkButton2 = UIButton(frame: CGRect(x: (self.view.frame.width/2)-185, y: 180, width: 100, height: 100))
        linkButton2.layer.cornerRadius = 5
        linkButton2.backgroundColor = UIColor.white
        linkButton2.setImage(linkImage2, for: .normal)
        linkButton2.addTarget(self, action: #selector(linkButton2Tapped), for: .touchUpInside)
        self.view.addSubview(linkButton2)
        
        let linkImage3 = UIImage(named: "GButton.jpg") as UIImage?//recieve link icon from server
        let linkButton3 = UIButton(frame: CGRect(x: (self.view.frame.width/2)-50, y: 180, width: 100, height: 100))
        linkButton3.layer.cornerRadius = 5
        linkButton3.backgroundColor = UIColor.white
        linkButton3.setImage(linkImage3, for: .normal)
        linkButton3.addTarget(self, action: #selector(linkButton3Tapped), for: .touchUpInside)
        self.view.addSubview(linkButton3)
        
        topicTextField.frame = CGRect(x: (self.view.frame.width/2)-140, y: self.view.frame.height/2 , width: 280, height: 40)
        topicTextField.isUserInteractionEnabled = true
        topicTextField.placeholder = " Topic"
        topicTextField.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        topicTextField.layer.borderWidth = 1
        topicTextField.layer.cornerRadius = 10
        self.view.addSubview(topicTextField)
        
        linkTextField.frame = CGRect(x: (self.view.frame.width/2)-140, y: (self.view.frame.height/2)+80 , width: 280, height: 40)
        linkTextField.isUserInteractionEnabled = true
        linkTextField.placeholder = " Link"
        linkTextField.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        linkTextField.layer.borderWidth = 1
        linkTextField.layer.cornerRadius = 10
        self.view.addSubview(linkTextField)
        
        let separator2 = UIView()
        separator2.frame = CGRect(x: 0, y: self.view.frame.height - 60, width: self.view.frame.width, height: 1)
        separator2.backgroundColor = UIColor.black
        self.view.addSubview(separator2)
        
        let postButton = UIButton()
        postButton.setTitle("Post", for: .normal)
        postButton.setTitleColor(UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0), for: .normal)
        postButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 40.0)!
        postButton.layer.borderWidth = 1
        postButton.layer.borderColor = UIColor.black.cgColor
        postButton.frame = CGRect(x: 0, y: self.view.frame.height - 59, width: self.view.frame.width/2, height: 59)
        postButton.addTarget(self, action: #selector(postTapped), for: .touchUpInside)
        self.view.addSubview(postButton)

        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.red, for: .normal)
        cancelButton.titleLabel?.font = UIFont(name:"Avenir-Black", size: 40.0)!
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.frame = CGRect(x: self.view.frame.width/2, y: self.view.frame.height - 59, width: self.view.frame.width/2, height: 59)
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        self.view.addSubview(cancelButton)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(PostVC.swipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
    }
    
    
    func linkButton1Tapped() {
        print("looking at info")
        UIApplication.shared.openURL(NSURL(string: "https://www.wsj.com/")! as URL)
    }
    
    func linkButton2Tapped() {
        print("looking at info")
        UIApplication.shared.openURL(NSURL(string: "https://twitter.com/i/streams/category/686639666779394072?lang=en")! as URL)
    }

    func linkButton3Tapped() {
        print("looking at info")
        UIApplication.shared.openURL(NSURL(string: "https://news.google.com/news/?ned=us&hl=en")! as URL)
    }
    
    func swipe() {
        print("Cancel Post")
        let trendingVC:ViewController = ViewController()
        
        self.present(trendingVC, animated: false, completion: nil)
    }
    
    func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo!
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.frame.origin.y = -251
        })
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.frame.origin.y = 0
        })
        view.endEditing(true)
    }

    
    func postTapped() {
        print("Post")
        
        var topicSTR = NSString()
        topicSTR = topicTextField.text! as NSString
        print("\(topicSTR)")
        Array.insert(topicSTR, at: 0)//send to server
        
        var linkSTR = NSString()
        linkSTR = linkTextField.text! as NSString
        print("\(linkSTR)")
        arrImageName.insert(linkSTR, at: 0)//send to server
        
        let trendingVC:ViewController = ViewController()
        self.present(trendingVC, animated: false, completion: nil)
    }

    
    func cancelTapped() {
        print("Cancel Post")
        let trendingVC:ViewController = ViewController()
        
        self.present(trendingVC, animated: false, completion: nil)
    }

}

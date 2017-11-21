//
//  DiscussionVC.swift
//  Discussion
//
//  Created by Patrick Tomas on 5/21/17.
//  Copyright © 2017 Patrick Tomas. All rights reserved.
//

import UIKit

var topic = UILabel()
var topicString = NSString()
var linkSTR = NSString()

let no = UIImage(named: "nButton.png")
let noView = UIImageView(image: no!)

let yes = UIImage(named: "yButton.png")
let yesView = UIImageView(image: yes!)

var noLabel = UILabel()
var yesLabel = UILabel()

let addFavButton = UIButton()
var onOff = 0
var addFavImage = UIImage()


class DiscussionVC: UIViewController, UITextViewDelegate {

    var activeField: UITextField?
    var UserBias = 3
    var myString = NSString()
    var myTextField = UITextField.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        onOff = 0
        
        let image = UIImage(named: "trendingButton.png") as UIImage?
        let button = UIButton(frame: CGRect(x: 10, y: 30, width: 30, height: 30))
        button.backgroundColor = UIColor.white
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(trendingButtonTapped), for: .touchUpInside)
        self.view.addSubview(button)
        
        let Fimage = UIImage(named: "favoritesButton.png") as UIImage?
        let favoritesButton = UIButton(frame: CGRect(x: self.view.frame.width-45 , y: 30, width: 30, height: 30))
        favoritesButton.backgroundColor = UIColor.white
        favoritesButton.setImage(Fimage, for: .normal)
        favoritesButton.addTarget(self, action: #selector(favoritesButtonTapped), for: .touchUpInside)
        self.view.addSubview(favoritesButton)
        
        var label = UILabel()
        label = UILabel(frame: CGRect(x:0, y:30, width:350, height:35))
        label.frame.origin = CGPoint(x: self.view.frame.width / 2 - 30, y: 30)
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        label.text="Now You're Talking"
        label.font = UIFont(name:"Avenir-Black", size: 30.0)
        
        let separator = UIView()
        separator.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: 1)
        separator.backgroundColor = UIColor.black
        self.view.addSubview(separator)
        
        topic.frame = CGRect(x: self.view.frame.width/2, y: 90, width: 300, height: 50)
        topic.center.x = self.view.center.x
        topic.textAlignment = .center
        topic.font = UIFont(name:"Avenir-Black", size: 30.0)
        topic.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        self.view.addSubview(topic)
        
        let linkImage = UIImage(named: "GButton.jpg") as UIImage?//recieve link icon from server
        let linkButton = UIButton(frame: CGRect(x: (self.view.frame.width/2)-35, y: 180, width: 70, height: 70))
        linkButton.layer.cornerRadius = 5
        linkButton.backgroundColor = UIColor.white
        linkButton.setImage(linkImage, for: .normal)
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
        self.view.addSubview(linkButton)

        let yimage = UIImage(named: "yButton.png") as UIImage?
        let ybutton = UIButton(frame: CGRect(x: 50, y: 180, width: 50, height: 50))
        ybutton.backgroundColor = UIColor.white
        ybutton.setImage(yimage, for: .normal)
        ybutton.addTarget(self, action: #selector(yButtonTapped), for: .touchUpInside)
        self.view.addSubview(ybutton)
        
        let nimage = UIImage(named: "nButton.png") as UIImage?
        let nbutton = UIButton(frame: CGRect(x: self.view.frame.width - 100, y: 180, width: 50, height: 50))
        nbutton.backgroundColor = UIColor.white
        nbutton.setImage(nimage, for: .normal)
        nbutton.addTarget(self, action: #selector(nButtonTapped), for: .touchUpInside)
        self.view.addSubview(nbutton)
        
        let sourcePreview = UIImage(named: "WSJButton.png") as UIImage?
        let sourceView: UIButton = UIButton(frame: CGRect(x: 0, y: 140, width: self.view.frame.width, height: 450.00))
        sourceView.layer.borderWidth = 1
        sourceView.layer.borderColor = UIColor.black.cgColor
        sourceView.layer.cornerRadius = 10
        sourceView.setImage(sourcePreview, for: .normal)
        sourceView.addTarget(self, action: #selector(sourceButtonTapped), for: .touchUpInside)
        self.view.addSubview(sourceView)

        let myTextView: UITextView = UITextView(frame: CGRect(x: 0, y: 250, width: self.view.frame.width, height: 450.00))
        myTextView.text = " \(myString)"
        myTextView.isUserInteractionEnabled = false
        myTextView.layer.borderColor = UIColor.black.cgColor
        myTextView.layer.borderWidth = 1.0
        myTextView.layer.cornerRadius = 10
        self.view.addSubview(myTextView)
        
        let sendimage = UIImage(named: "sendButton.png") as UIImage?
        let sendButton = UIButton(frame: CGRect(x: (self.view.frame.width/2)+145, y: 625, width: 30, height: 30))
        sendButton.backgroundColor = UIColor.white
        sendButton.setImage(sendimage, for: .normal)
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        self.view.addSubview(sendButton)
        
        addFavImage = (UIImage(named: "favoritesButton.png") as UIImage?)!
        addFavButton.frame = CGRect(x: (self.view.frame.width/2)-175, y: 625, width: 30, height: 30)
        addFavButton.backgroundColor = UIColor.white
        addFavButton.setImage(addFavImage, for: .normal)
        addFavButton.addTarget(self, action: #selector(addFavoritesTapped), for: .touchUpInside)
        self.view.addSubview(addFavButton)
        
        let myTextField: UITextField = UITextField(frame: CGRect(x: (self.view.frame.width/2)-140, y: 620, width: 280, height: 40))
        myTextField.isUserInteractionEnabled = true
        myTextField.placeholder = " ..."
        myTextField.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        myTextField.layer.borderWidth = 1
        myTextField.layer.cornerRadius = 10
        self.view.addSubview(myTextField)
        

        
        self.view.addSubview(label)
        self.view.addSubview(button)
        self.view.addSubview(ybutton)
        self.view.addSubview(nbutton)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        if onOff % 2 == 0 {
            addFavImage = (UIImage(named: "favoritesButton.png") as UIImage?)!
            addFavButton.setImage(addFavImage, for: .normal)
        }
        else{
            addFavImage = (UIImage(named: "favoritedImage.png") as UIImage?)!
            addFavButton.setImage(addFavImage, for: .normal)
            onOff = 1
        }

        let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(DiscussionVC.swipeRight))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(DiscussionVC.swipeLeft))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left

    }
    
    func swipeRight() {
        print("Go to favorites")
        let favVC:FavoritesVC = FavoritesVC()
        
        self.present(favVC, animated: false, completion: nil)
    }
    
    func swipeLeft() {
        print("Go to trending")
        let viewController:ViewController = ViewController()
        
        self.present(viewController, animated: false, completion: nil)

    }
    
    func addFavoritesTapped() {
        //NSKeyedUnarchiver.unarchiveObjectWithData(onOff) as Data!
        onOff += 1
        print("\(onOff)")
        if onOff % 2 == 0 {
            print("remove from favorites")
            favArray.remove(at: 0)
            addFavImage = (UIImage(named: "favoritesButton.png") as UIImage?)!
            addFavButton.setImage(addFavImage, for: .normal)
            onOff = 0
        }
        else{
            print("add \(headline) to favorites")//send topic to server to add to favorites array
            favArray.insert(headline, at: 1)
            addFavImage = (UIImage(named: "favoritedImage.png") as UIImage?)!
            addFavButton.setImage(addFavImage, for: .normal)
            onOff = 1
        }

    }
    
    func sendTapped() {
        print("\(myTextField)")//send to server for group spisific message board
    }
    
    func trendingButtonTapped() {
        print("Go to trending")
        let viewController:ViewController = ViewController()
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    func favoritesButtonTapped() {
        print("Go to favorites")
        let favVC:FavoritesVC = FavoritesVC()
        
        self.present(favVC, animated: false, completion: nil)
    }
    
    func yButtonTapped() {
        print("User would agree with this")
        UserBias = 1
        print("Group:\(UserBias)")//send to server for agree group
        
        yesView.frame = CGRect(x:(self.view.frame.width/2)-40, y:(self.view.frame.height/2)-40, width:80, height:80)
        self.view.addSubview(yesView)
        
        yesLabel.frame = CGRect(x:self.view.frame.width/2, y:(self.view.frame.height/2)+85, width:350, height:45)
        yesLabel.center.x = self.view.center.x
        yesLabel.textAlignment = .center
        yesLabel.textColor = UIColor.black
        yesLabel.text="Agree!"
        yesLabel.font = UIFont(name:"Avenir-Black", size: 30.0)
        self.view.addSubview(yesLabel)
        noLabel.removeFromSuperview()
        noView.removeFromSuperview()
        
        var timer = Timer.scheduledTimer(timeInterval: TimeInterval(2.0), target: self, selector: #selector(timeExpired), userInfo: nil, repeats: false)
    }
    
    func nButtonTapped() {
        print("User would not agree with this")
        UserBias = 2
        print("Group:\(UserBias)")//send to server for disagree group
        
        noView.frame = CGRect(x:(self.view.frame.width/2)-40, y:(self.view.frame.height/2)-40, width:80, height:80)
        self.view.addSubview(noView)
        
        noLabel.frame = CGRect(x:self.view.frame.width/2, y:(self.view.frame.height/2)+85, width:350, height:45)
        noLabel.center.x = self.view.center.x
        noLabel.textAlignment = .center
        noLabel.textColor = UIColor(red: 0.750, green: 0.0, blue: 0.0, alpha: 1.0)
        noLabel.text="Disagree!"
        noLabel.font = UIFont(name:"Avenir-Black", size: 30.0)
        self.view.addSubview(noLabel)
        yesLabel.removeFromSuperview()
        yesView.removeFromSuperview()
        var timer = Timer.scheduledTimer(timeInterval: TimeInterval(2.0), target: self, selector: #selector(timeExpired), userInfo: nil, repeats: false)
    }
    
    func timeExpired() {
        yesLabel.removeFromSuperview()
        noLabel.removeFromSuperview()
        yesView.removeFromSuperview()
        noView.removeFromSuperview()
    }

    
    func linkButtonTapped() {
        linkSTR = ("https://www.google.com/\(topicString)" as NSString)
        print("looking at \(topicString)")
        print("\(linkSTR)")
        let url = NSURL(string: "https://www.google.com/")!
        UIApplication.shared.openURL(url as URL)
        //UIApplication.shared.openURL(NSURL(string: "\(linkSTR)")! as URL)//recieve link for topic from server
    }
    
    func sourceButtonTapped() {
        linkSTR = ("Original link \(topicString)" as NSString)
        print("\(linkSTR)")
        let url = NSURL(string: "https://www.wsj.com/")!
        UIApplication.shared.openURL(url as URL)
        //UIApplication.shared.openURL(NSURL(string: "\(linkSTR)")! as URL)//recieve link for topic from server
    }


    deinit {
        NotificationCenter.default.removeObserver(self);
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

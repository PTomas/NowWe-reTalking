//
//  FavoritesVC.swift
//  Discussion
//
//  Created by Patrick Tomas on 8/23/17.
//  Copyright © 2017 Patrick Tomas. All rights reserved.
//

import Foundation
import UIKit

var favArray: NSMutableArray = [""]

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.frame = CGRect(x:40, y:30, width:350, height:45)
        label.center.x = self.view.center.x
        label.textAlignment = .center
        label.text=("What's Talking")
        label.font = UIFont(name:"Avenir-Black", size: 40.0)
        label.textColor = UIColor(red: 0.0, green: 0.004, blue: 0.502, alpha: 1.0)
        self.view.addSubview(label)
        
        let image = UIImage(named: "trendingButton.png") as UIImage?
        let button = UIButton(frame: CGRect(x: 10, y: 30, width: 40, height: 40))
        button.backgroundColor = UIColor.white
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(trendingButtonTapped), for: .touchUpInside)
        self.view.addSubview(button)
        
        let separator = UIView()
        separator.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: 1)
        separator.backgroundColor = UIColor.black
        self.view.addSubview(separator)
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height - 100))
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
    
    func trendingButtonTapped() {
        print("Go to trending")
        let viewController:ViewController = ViewController()
        
        self.present(viewController, animated: false, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var topicNum = indexPath.row
        
        print("Num: \(indexPath.row)")
        print("Topic: \(favArray[indexPath.row])")
        
        let discussionVC:DiscussionVC = DiscussionVC()
        self.present(discussionVC, animated: false, completion: nil)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(favArray[indexPath.row])"
        cell.imageView?.image = UIImage(named:"WSJButton.jpg")
        cell.imageView?.layer.borderWidth = 1.0
        cell.imageView?.layer.cornerRadius = 5
        return cell
    }

}

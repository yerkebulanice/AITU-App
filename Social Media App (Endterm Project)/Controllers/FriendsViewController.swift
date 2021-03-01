//
//  FriendsViewController.swift
//  Social Media App (Endterm Project)
//
//  Created by Еркебулан on 24.02.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    var all : [All] = []
    var imp : [Important] = []
    var onl : [Online] = []
    
    @IBOutlet weak var tableView1: UIView!
    @IBOutlet weak var tableView2: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var importantFriendTableView: UITableView!
    @IBOutlet weak var allFriendsTableView: UITableView!
    @IBOutlet weak var onlineFriends: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.isHidden = false
        tableView2.isHidden = true
        importantFriendTableView.delegate = self
        importantFriendTableView.dataSource = self
        allFriendsTableView.delegate = self
        allFriendsTableView.dataSource = self
        onlineFriends.delegate = self
        onlineFriends.dataSource = self
        self.allFriendsTableView.register(UINib(nibName: "AllFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "AllFriendsCell")
        self.importantFriendTableView.register(UINib(nibName: "ImportantFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "ImportantFriendsCell")
        self.onlineFriends.register(UINib(nibName: "OnlineFriendsTableViewCell", bundle: nil), forCellReuseIdentifier: "OnlineFriendsCell")
    }
    
    @IBAction func changeTableView(_ sender: Any) {
        if !tableView1.isHidden {
            tableView2.isHidden = false
            tableView1.isHidden = true
        }
        else{
            tableView2.isHidden = true
            tableView1.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        configureData()
    }
    
    func configureData(){
        all.append(All(image: "1", name: "Elon Mask"))
        all.append(All(image: "2", name: "Bill Gates"))
        all.append(All(image: "3", name: "Pablo Stanlay"))
        all.append(All(image: "4", name: "Andrew Tang"))
        all.append(All(image: "5", name: "Jeff Bezos"))
        all.append(All(image: "6", name: "Oscar Wilde"))
        all.append(All(image: "7", name: "Stephen Curry"))
        all.append(All(image: "8", name: "Justin Bieber"))
        all.append(All(image: "9", name: "Ariana Grande"))
        all.append(All(image: "10", name: "Phil Nite"))
        all.append(All(image: "11", name: "Cristiano Ronaldo"))
        all.append(All(image: "12", name: "Steve Jobs"))
        imp.append(Important(image: "1", name: "Elon Mask"))
        imp.append(Important(image: "8", name: "Justin Bieber"))
        imp.append(Important(image: "9", name: "Ariana Grande"))
        imp.append(Important(image: "12", name: "Steve Jobs"))
        imp.append(Important(image: "6", name: "Oscar Wilde"))
        onl.append(Online(image: "3", name: "Pablo Stanlay"))
        onl.append(Online(image: "10", name: "Phil Nite"))
        onl.append(Online(image: "5", name: "Jeff Bezos"))
    }
        
}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.allFriendsTableView{
            return all.count
        }
        else if tableView == self.importantFriendTableView{
            return imp.count
        }
        else if tableView == self.onlineFriends {
            return onl.count
        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.allFriendsTableView, let cell = tableView.dequeueReusableCell(withIdentifier: "AllFriendsCell") as? AllFriendsTableViewCell {
            let item = all[indexPath.row]
            cell.iconImage.image = UIImage(named: "\(item.image).png")
            cell.nameLabel.text = item.name
            return cell
        }
        else if tableView == self.importantFriendTableView, let cell =
            tableView.dequeueReusableCell(withIdentifier: "ImportantFriendsCell") as? ImportantFriendsTableViewCell {
            let item = imp[indexPath.row]
            cell.iconImage.image = UIImage(named: "\(item.image).png")
            cell.nameLabel.text = item.name
            return cell
        }
        else if tableView == self.onlineFriends, let cell =
            tableView.dequeueReusableCell(withIdentifier: "OnlineFriendsCell") as? OnlineFriendsTableViewCell {
            let item = onl[indexPath.row]
            cell.iconImage.image = UIImage(named: "\(item.image).png")
            cell.nameLabel.text = item.name
            return cell
        }
        return UITableViewCell()
    }
    
}

    
    
class All{
    var image = ""
    var name = ""
    convenience init(image: String, name: String){
        self.init()
        self.image = image
        self.name = name
    }
}

class Important{
    var image = ""
    var name = ""
    convenience init(image: String, name: String){
        self.init()
        self.image = image
        self.name = name
    }
}

class Online{
    var image = ""
    var name = ""
    convenience init(image: String, name: String){
        self.init()
        self.image = image
        self.name = name
    }
}



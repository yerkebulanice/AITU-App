//
//  ProfileViewController.swift
//  Social Media App (Endterm Project)
//
//  Created by Еркебулан on 24.02.2021.
//

import UIKit

class ProfileViewController: UIViewController{
    var arr : [Profile] = []
    @IBOutlet weak var profileAvatarImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textStatus: UITextView!
    @IBOutlet weak var tableViewProfile: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(false, animated: false)
            testDataConfigure()
    }
    func testDataConfigure(){
        arr.append(Profile(name: "My profile",image: "person.fill", viewControl: "MyProfileViewController"))
        arr.append(Profile(name: "Friends",image: "person.2.fill", viewControl: "FriendsViewController"))
        arr.append(Profile(name: "Video",image: "video.fill", viewControl: "VideoViewController"))
        arr.append(Profile(name: "Music",image: "music.note.list", viewControl: "MusicViewController"))
        arr.append(Profile(name: "Photos",image: "photo.fill", viewControl: "PhotosViewController"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textStatus.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
    }

}

extension ProfileViewController: UITextViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textStatus.resignFirstResponder()
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileTableViewCell
        let item = arr[indexPath.row]
        cell.nameLabel.text = item.name
        cell.iconImage.image = UIImage(systemName: item.image)
        return cell
    }

}

class Profile{
    var name = ""
    var image = ""
    var viewControl = ""
    convenience init(name: String, image: String, viewControl: String){
        self.init()
        self.name = name
        self.image = image
        self.viewControl = viewControl
    }
}

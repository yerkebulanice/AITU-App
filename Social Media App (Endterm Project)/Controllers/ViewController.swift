//
//  ViewController.swift
//  Social Media App (Endterm Project)
//
//  Created by Еркебулан on 23.02.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func logInButton(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "TabBarController", sender: self)
//        let newVC = UIViewController(nibName: selectedProfile.viewControl, bundle: nil)
//        self.present(newVC,animated: true,completion: nil)
        let vc = storyboard?.instantiateViewController(identifier: "TabBarController") as! UITabBarController
                navigationController?.pushViewController(vc, animated: true)
    
    }
}


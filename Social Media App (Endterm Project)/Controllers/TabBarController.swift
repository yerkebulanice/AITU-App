//
//  TabBarController.swift
//  Social Media App (Endterm Project)
//
//  Created by Еркебулан on 24.02.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        self.performSegue(withIdentifier: "TabBarController", sender: self);
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

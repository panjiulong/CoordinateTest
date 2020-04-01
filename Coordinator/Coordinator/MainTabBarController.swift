//
//  MainTabBarController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    weak var coordinator: (Coordinator & TabbarVCCreateing)?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

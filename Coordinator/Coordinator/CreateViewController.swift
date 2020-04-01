//
//  CreateViewController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController,Storyboarded {

    weak var coordinator:CreateCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "create"
    }

}

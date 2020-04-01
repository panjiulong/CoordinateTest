//
//  NewFutureViewController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

protocol NewFutureAction: AnyObject {
    func enterAPP()
}

class NewFutureViewController: UIViewController,Storyboarded {

    weak var coordinator: NewFutureAction?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func enter(_ sender: Any) {
        coordinator?.enterAPP()
    }
}

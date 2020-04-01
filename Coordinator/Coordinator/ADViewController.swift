//
//  ADViewController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit
protocol ADAction:AnyObject {
    func skipAD()
}
class ADViewController: UIViewController,Storyboarded {
    weak var coordinator: ADAction?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func jumpAD(_ sender: Any) {
        coordinator?.skipAD()
    }

}

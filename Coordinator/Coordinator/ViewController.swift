//
//  ViewController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

protocol Buying: AnyObject {
    func buySubscription(to productType: Int)
}

protocol Creating: AnyObject {
    func createAccount()
}

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: (Buying & Creating)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "hahha"
        view.backgroundColor = .gray
    }

    @IBAction func buy(_ sender: Any) {
        coordinator?.buySubscription(to: 20)
    }

    @IBAction func create(_ sender: Any) {
        coordinator?.createAccount()
    }

}

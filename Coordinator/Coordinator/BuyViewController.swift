//
//  BuyViewController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController,Storyboarded {

    weak var coordinator:BuyCoordinator?
    
    var selectedProduct = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Buy"
        let labl = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        labl.text = "\(selectedProduct)"
        view.addSubview(labl)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
}

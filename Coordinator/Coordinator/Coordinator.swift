//
//  Coordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

protocol Coordinator:AnyObject {
    
    var childCoordinators: [Coordinator] {get set}
    
    var navigationController: UINavigationController{get set}
        
    func start()
}




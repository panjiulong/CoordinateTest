//
//  NewFutureCoordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class NewFutureCoordinator: NSObject,Coordinator,NewFutureAction{
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
     init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = NewFutureViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func enterAPP() {
        let child = TabbarCoordinator(navigationController: navigationController)
        parentCoordinator?.childCoordinators.removeAll()
        parentCoordinator?.childCoordinators.append(child)
        child.start()
    }
    

}

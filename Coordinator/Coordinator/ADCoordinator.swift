//
//  ADCoordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class ADCoordinator: NSObject,Coordinator,ADAction {
    
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ADViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func skipAD() {
       let child = TabbarCoordinator(navigationController: navigationController)
        parentCoordinator?.childCoordinators.removeAll()
        parentCoordinator?.childCoordinators.append(child)
        child.start()
    }
    

}

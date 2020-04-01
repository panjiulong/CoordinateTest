//
//  CreateCoordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class CreateCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var childCoordinators =  [Coordinator]()
    
    var navigationController: UINavigationController
    
     init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func tabbarStart(tabbarVC:MainTabBarController) {
        let vc = CreateViewController.instantiate()
        vc.coordinator = self
//        vc.tabBarItem.title = "345"
        navigationController.pushViewController(vc, animated: true)
//        navigationController = UINavigationController(rootViewController: vc)
        tabbarVC.addChild(vc)
    }
    

}

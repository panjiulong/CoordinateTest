//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit


class BuyCoordinator: Coordinator {

    weak var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    var selectedProduct = 0
    
    init(navigationController: UINavigationController,selectedProduct:Int) {
        self.navigationController = navigationController
        self.selectedProduct = selectedProduct
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = selectedProduct
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func tabbarStart(tabbarVC:MainTabBarController) {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = selectedProduct
        vc.coordinator = self
//        vc.tabBarItem.title = "123"
        navigationController.pushViewController(vc, animated: true)
//        navigationController = UINavigationController(rootViewController: vc)
        tabbarVC.addChild(navigationController)
    }
    
    func didFinishBuying() {
//        parentCoordinator?.childDidFinish(self)
    }
    
    func buySubscription(to productType:Int) {
        let vc = BuyViewController.instantiate()
        vc.selectedProduct = productType
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

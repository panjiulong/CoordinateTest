//
//  ViewControllerCoordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class ViewControllerCoordinator:NSObject, Coordinator,Creating,Buying {
    var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
     init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func tabbarStart(tabbarVC:MainTabBarController) {
        let vc = ViewController.instantiate()
        vc.tabBarItem.title = vc.title
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
//        navigationController = JLNavigationController(rootViewController: vc)
        tabbarVC.addChild(navigationController)
    }
    
    
    func buySubscription(to productType: Int) {
        let child = BuyCoordinator(navigationController: navigationController,selectedProduct:productType)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let child = CreateCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child:Coordinator?) {
        for(index,coordinator) in childCoordinators.enumerated(){
            if coordinator === child{
                childCoordinators.remove(at: index)
                break
            }
        }
    }

}
extension ViewControllerCoordinator:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(buyViewController.coordinator)
        }
        if let createViewController = fromViewController as? CreateViewController {
            childDidFinish(createViewController.coordinator)
        }
    }
}

//
//  TabbarCoordinator.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

protocol TabbarVCCreateing:AnyObject{
    func addChildViewControllers(tabbarVC: MainTabBarController)
}

class TabbarCoordinator: Coordinator,TabbarVCCreateing {
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

     init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabVC = MainTabBarController()
        tabVC.coordinator = self
        addChildViewControllers(tabbarVC: tabVC)
        navigationController.pushViewController(tabVC, animated: false)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }

    func addChildViewControllers(tabbarVC: MainTabBarController) {
        addBuyChild(tabbarVC: tabbarVC)
        addCreateChild(tabbarVC: tabbarVC)
        addThreeChild(tabbarVC: tabbarVC)
    }

    func addBuyChild(tabbarVC: MainTabBarController) {
        let child = BuyCoordinator(navigationController: JLNavigationController(), selectedProduct: 20)
        child.parentCoordinator = self
        child.tabbarStart(tabbarVC: tabbarVC)
        childCoordinators.append(child)
    }

    func addCreateChild(tabbarVC: MainTabBarController) {
        let child = CreateCoordinator(navigationController: JLNavigationController())
        child.parentCoordinator = self
        child.tabbarStart(tabbarVC: tabbarVC)
        childCoordinators.append(child)
    }

    func addThreeChild(tabbarVC: MainTabBarController) {
        let child = ViewControllerCoordinator(navigationController: JLNavigationController())
        child.parentCoordinator = self
        child.tabbarStart(tabbarVC: tabbarVC)
        childCoordinators.append(child)
    }

}

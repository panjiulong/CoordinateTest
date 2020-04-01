//
//  JLNavigationController.swift
//  Coordinator
//
//  Created by PanJiuLong on 2019/7/17.
//  Copyright © 2019 Utimes-MacbookPro. All rights reserved.
//

import UIKit

class JLNavigationController: UINavigationController {

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !viewControllers.isEmpty {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
        if isHairScreen() {
            if var thisframe = tabBarController?.tabBar.frame {
                thisframe.origin.y = UIScreen.main.bounds.height - thisframe.size.height
                tabBarController?.tabBar.frame = thisframe
            }
        }
    }

}

/** 是否是刘海屏*/
func isHairScreen() -> Bool {
    if #available(iOS 11, *), UIApplication.shared.statusBarFrame.height == 44 {
        return true
    }
    return false
}

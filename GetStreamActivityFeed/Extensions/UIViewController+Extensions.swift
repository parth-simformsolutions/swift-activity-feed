//
//  UIViewController+Extensions.swift
//  GetStreamActivityFeed
//
//  Created by Alexey Bukhtin on 15/01/2019.
//  Copyright © 2019 Stream.io Inc. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    
    func add(viewController: UIViewController, to containerView: UIView? = nil) {
        addChild(viewController)
        let containerView: UIView = containerView ?? view
        containerView.addChildViewControllerView(viewController)
        viewController.didMove(toParent: self)
    }
    
    func remove(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    func replace(viewController: UIViewController, with newViewController: UIViewController) {
        guard let containerView = viewController.view.superview else { return }
        viewController.willMove(toParent: nil)
        addChild(newViewController)
        containerView.addChildViewControllerView(newViewController)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
        newViewController.didMove(toParent: self)
    }
    
    private func addChildViewControllerViewToContainerView(containerView: UIView, childView: UIView) {
        containerView.addSubview(childView)
    }
}

extension UIView {
    fileprivate func addChildViewControllerView(_ childViewController: UIViewController) {
        addSubview(childViewController.view)
        
        childViewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
//
//  Coordinator.swift
//  BackToNormal
//
//  Created by Russell Mirabelli on 7/10/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: Coordinator {
    
    init(navigationController: UINavigationController) {
        self.childCoordinators = []
        self.navigationController = navigationController
    }
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    private var listViewController: ViewController?
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            vc.coordinator = self
            listViewController = vc
            navigationController.pushViewController(vc, animated: false)
        }
    }
    
    func showCreateEvent() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CreateEventViewController")
        listViewController?.present(vc, animated: true)
        
    }
}

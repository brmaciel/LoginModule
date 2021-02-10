//
//  LoginRouter.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import UIKit

public class LoginRouter {
    
    weak var view: LoginViewController?
    
    
    // MARK: Create Module
    public static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Login", bundle: Bundle(for: LoginViewController.self)).instantiateInitialViewController() as! LoginViewController
        
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let worker = LoginWorker()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = view
        presenter.router = router
        router.view = view
        
        return view
    }
    
    
    // MARK: - Routing
    
    func didLogin(data: LoginModels.ViewModel) {
        print("goToNextScreen")
        //goToMainMenu(data: data)
    }

    // MARK: - Navigation
    
//    private func goToMainMenu(data: LoginModels.ViewModel) {
//        let destinationStoryboard = UIStoryboard(name: "MainMenu", bundle: Bundle.main)
//
//        let destinationVC = destinationStoryboard.instantiateInitialViewController() as! MainMenuViewController
//
//        MainMenuRouter.createModule(view: destinationVC)
//
//        destinationVC.modalTransitionStyle = .coverVertical
//        view?.present(destinationVC, animated: true, completion: nil)
//    }
    
//    func navigateToNextView(data: LoginModels.ViewModel) {
//        let destinationStoryboard = UIStoryboard(name: <#StoryboardFileName#>, bundle: Bundle.main)
//        
//        let <#destinationVC#>: <#DestinationViewController#>
//        if #available(iOS 13.0, *) {
//            <#destinationVC#> = destinationStoryboard.instantiateViewController(identifier: <#identifierVC#>) as! <#DestinationViewController#>
//        } else {
//            <#destinationVC#> = destinationStoryboard.instantiateViewController(withIdentifier: <#identifierVC#>) as! <#DestinationViewController#>
//        }
//        
//        <#destination#>Router.createModule(view: <#destinationVC#>, data: data)
//        
//        view?.navigationController?.pushViewController(statementsVC, animated: true)
//    }

}

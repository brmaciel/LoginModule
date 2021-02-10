//
//  LoginViewController.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var view_loginCard: UIView!
    @IBOutlet weak var field_email: UITextField!
    @IBOutlet weak var field_password: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var constraint_bottomToButtons: NSLayoutConstraint!
    
    // MARK: Properties
    var interactor: LoginInteractorProtocol?
    var visiblePasswordImage = UIImage(systemName: "eye")
    var hiddenPasswordImage = UIImage(systemName: "eye.slash")
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        delegates()
        setupView()
    }
    deinit { NotificationCenter.default.removeObserver(self) }
    
    
    // MARK: Navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if segue.identifier == "<#segueIdentifier#>" {
    //        let destinationVC = segue.destination as! <#destinationViewController#>
    //        destinationVC.<#property#> = <#someValue#>
    //    }
    // or
    //    if let scene = segue.identifier {
    //        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
    //        if let router = router, router.responds(to: selector) {
    //            router.perform(selector, with: segue)
    //        }
    //    }
    //}
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        //<#component#>.delegate = self
        //<#component#>.dataSource = self
    }
        
    private func setupView() {
        view_loginCard.layer.cornerRadius = 20
        view_loginCard.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        addKeyboardObserver()
    }
    
    
    // MARK: - Methods
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let btnConfirm = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(btnConfirm)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Button Actions
    @IBAction func tapShowHidePassword(_ sender: UIButton) {
        if sender.image(for: .normal) == visiblePasswordImage {
            sender.setImage(hiddenPasswordImage, for: .normal)
            field_password.isSecureTextEntry = true
        } else {
            sender.setImage(visiblePasswordImage, for: .normal)
            field_password.isSecureTextEntry = false
        }
    }
    
    @IBAction func tapLoginButton(_ sender: UIButton) {
        self.view.endEditing(true)
        
        let loginRequest = LoginModels.Request(username: field_email.text, password: field_password.text)
        interactor?.login(request: loginRequest)
    }
    
    @IBAction func tapNewUserButton(_ sender: UIButton) {
        
    }
    
    @IBAction func closeKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}


// MARK: - Access from Presenter
extension LoginViewController: LoginPresenterDelegate {
    func showValidationError(_ errorMessage: String) {
        alert(title: "Aviso", message: errorMessage)
    }
    
    func startRequesting() {
        activityIndicator.startAnimating()
    }
    
    func finishRequesting() {
        activityIndicator.stopAnimating()
    }
    
    func didLogin() {
        field_email.text = nil
        field_password.text = nil
    }
    
    func showLoginError(_ errorMessage: String) {
        alert(title: "Falha ao Logar", message: errorMessage)
    }
}


// MARK: - Keyboard Observer
extension LoginViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(sender notification: Notification) {
        // Find keyboard's height
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        guard let keyboardHeight = keyboardSize?.height else { return }
        
        // Scroll for keyboard's height + 8 (considers the safeArea)
        let extraOffset: CGFloat = 8
        let safeAreaBottom = self.view.safeAreaInsets.bottom
        let bottomInset = (keyboardHeight - safeAreaBottom) + extraOffset
        
        UIView.animate(withDuration: 0.4) {
            self.constraint_bottomToButtons.constant = bottomInset
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillBeHidden(notification: Notification) {
        UIView.animate(withDuration: 0.4) {
            self.constraint_bottomToButtons.constant = 40
            self.view.layoutIfNeeded()
        }
    }
}

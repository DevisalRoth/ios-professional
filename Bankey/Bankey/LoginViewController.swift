//
//  ViewController.swift
//  Bankey
//
//  Created by Chou visalroth on 17/12/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView         = LoginView()
    let signInButton      = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let titleLable        = UILabel()
    let subTitleLabel     = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension LoginViewController{
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8  // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor     = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text          = "Error failure"
        errorMessageLabel.isHidden      = true
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.textAlignment        = .center
        titleLable.text                 = "Bankey"
        titleLable.font                 = titleLable.font.withSize(36.0)
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textAlignment     = .center
        subTitleLabel.numberOfLines     = 2
        subTitleLabel.text              = "Your premium source for all things bacnking!"
    }
    
    private func layout(){
        view.addSubview(titleLable)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Title
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLable.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLable.trailingAnchor, multiplier: 1),
            
        ])
        
        //subTitleLabel
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLable.bottomAnchor, multiplier: 4),
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 6),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subTitleLabel.trailingAnchor, multiplier: 6),
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter:  view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),

        ])
        
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Label error message
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}


extension LoginViewController {
    @objc func signInTapped(send: UIButton){
     
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure(" Username or Password is blank!!")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or Password cannot be blank")
            return
        }
        
        if username == "Chou" && password == "@123" {
            signInButton.configuration?.showsActivityIndicator = true
            let storyboard = UIStoryboard.instantiateViewController
        }else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}


//
//  DummyViewController.swift
//  Bankey
//
//  Created by Chou visalroth on 26/12/23.
//

import UIKit

class DummyViewController: UIViewController{
    
    let label = UILabel()
    let stackView = UIStackView()
    let logoutButton = UIButton(type: .system)
    weak var logoutDelegate: LogoutDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis    = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        // StackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}
extension DummyViewController{
    @objc func logoutTapped(){
        logoutDelegate?.didLogout()
    }
}


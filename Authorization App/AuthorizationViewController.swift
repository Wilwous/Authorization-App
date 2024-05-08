//
//  ViewController.swift
//  Authorization App
//
//  Created by Антон Павлов on 07.05.2024.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    private let build = ViewBuilder.shared
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var emailStack = UIStackView()
    private var passwordStack = UIStackView()
    
    private lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.image = .iconW
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return view
    }()
    
    private lazy var forgotPassword: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
        }))
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("Forgot password?", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
        }))
        button.backgroundColor = .wYellow
        button.layer.cornerRadius = 15
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let or = UILabel()
        or.text = "Or"
        or.textColor = .black
        or.textAlignment = .center
        or.font = .systemFont(ofSize: 16, weight: .bold)
        or.translatesAutoresizingMaskIntoConstraints = false
        
        return or
    }()
    
    private lazy var googleAuthButton: UIButton = {
        let google = UIButton(primaryAction: UIAction(handler: { _ in
        }))
        google.setImage(UIImage(named: "googleIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        google.translatesAutoresizingMaskIntoConstraints = false
        
        return google
    }()
    
    private lazy var signUp: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        var text: UILabel {
            let text = UILabel()
            text.text = "Dont't have an account?"
            text.font = .systemFont(ofSize: 14, weight: .bold)
            
            return text
        }
        
        var button: UIButton {
            let button = UIButton(primaryAction: UIAction(handler: { _ in
            }))
            button.setTitle("Sign Up", for: .normal)
            button.tintColor = .wYellow
            
            return button
        }
        
        stack.addArrangedSubview(text)
        stack.addArrangedSubview(button)
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .wPurple
        addElemens()
        layoutConstrain()
        setupTextView()
    }
    
    private func addElemens() {
        view.addSubview(bannerImage)
        view.addSubview(contentView)
        contentView.addSubview(signInButton)
        contentView.addSubview(forgotPassword)
        contentView.addSubview(orLabel)
        contentView.addSubview(googleAuthButton)
        contentView.addSubview(signUp)
    }
    
    private func layoutConstrain() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            bannerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerImage.heightAnchor.constraint(equalToConstant: 178),
            bannerImage.widthAnchor.constraint(equalToConstant: 178),
            
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 500),
            
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            signInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            
            orLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            
            googleAuthButton.heightAnchor.constraint(equalToConstant: 60),
            googleAuthButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 5),
            googleAuthButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            googleAuthButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            
            signUp.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUp.topAnchor.constraint(equalTo: googleAuthButton.bottomAnchor, constant: 20)
        ])
    }
    
    private func setupTextView() {
        emailStack = build.getTextView(textField: emailTextField, placeholder: "Email")
        passwordStack = build.getTextView(textField: passwordTextField, placeholder: "Password", isPassword: true)
        
        contentView.addSubview(emailStack)
        contentView.addSubview(passwordStack)
        
        NSLayoutConstraint.activate([
            emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            
            passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 20),
            passwordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            passwordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            
            forgotPassword.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 7),
            forgotPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35)
        ])
    }
    
    
}


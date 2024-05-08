//
//  ViewBuilder.swift
//  Authorization App
//
//  Created by Антон Павлов on 07.05.2024.
//

import UIKit

final class ViewBuilder {
    
    static let shared = ViewBuilder()
    
    func getTextView(textField: UITextField,
                     placeholder: String,
                     isPassword: Bool = false) -> UIStackView {
        
        lazy var hidePassword: UIButton = {
            let button = UIButton(primaryAction: action)
            button.setImage(UIImage(systemName: "eye"), for: .normal)
            button.tintColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
        lazy var action = UIAction { _ in
            textField.isSecureTextEntry.toggle()
            
            if textField.isSecureTextEntry {
                hidePassword.setImage(UIImage(systemName: "eye"), for: .normal)
            } else {
                hidePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            }
        }
        
        lazy var placeholderText: UIView = {
            let text = UILabel()
            text.text = placeholder
            text.font = .systemFont(ofSize: 12, weight: .semibold)
            text.textColor = .gray
            text.translatesAutoresizingMaskIntoConstraints = false
            
            let view = UIView()
            view.addSubview(text)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19),
                
                view.heightAnchor.constraint(equalToConstant: 15)
            ])
            
            return view
        }()
        
        lazy var fieldView: UIView = {
            let  view = UIView()
            view.backgroundColor = .wLightGray
            view.layer.cornerRadius = 15
            textField.isSecureTextEntry = isPassword
            
            view.addSubview(textField)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 52),
                
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ])
            
            if isPassword {
                view.addSubview(hidePassword)
                
                NSLayoutConstraint.activate([
                    hidePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    hidePassword.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
            }
            
            return view
        }()
        
        lazy var hStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 7
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(placeholderText)
            stack.addArrangedSubview(fieldView)
            
            return stack
        }()
        
        return hStack
    }
    
    private init() {}
}

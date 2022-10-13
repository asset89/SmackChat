//
//  ViewController.swift
//  SmackChat
//
//  Created by Asset Ryskul on 11.10.2022.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let loginContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20.0
        return stack
    }()
    
    private var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 10.0
        return stack
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect())
        imageView.image = R.image.smack1024()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "SmackChat"
        label.textAlignment = .center
        label.font = UIFont(name: Constants.SMACK_FONT, size: 0)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = Constants.SMACK_COLOR
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        setupLayout()
    }
    
    func setupView() {
        
        self.view.addSubview(loginContentView)
        loginContentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(logoImageView)
        horizontalStack.addArrangedSubview(logoLabel)
        
        
        
    }
    func setupLayout() {
        
        loginContentView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        horizontalStack.snp.makeConstraints { make in
            make.centerX.equalTo(self.loginContentView)
            make.top.equalTo(self.loginContentView.snp.top).offset(120)
            make.width.equalTo(220)
            
        }
        
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
    }


}


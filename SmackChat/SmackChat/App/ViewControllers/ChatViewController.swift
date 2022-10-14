//
//  ChatViewController.swift
//  SmackChat
//
//  Created by Asset Ryskul on 13.10.2022.
//

import UIKit
import SnapKit

class ChatViewController: UIViewController {
    
    //MARK: - custom views & elements
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topView: GradientView = {
        let view = GradientView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = Constants.SMACK_THEME_COLOR
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var leftMenuButton: UIButton = {
        let btn = UIButton()
        btn.setImage(R.image.smackBurger(), for: .normal)
        btn.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    private let topBarLabel: UILabel = {
        let label = UILabel()
        label.text = "Smack Chat"
        label.textAlignment = .center
        label.font = UIFont(name: Constants.SMACK_FONT, size: 0)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    //MARK: - vc lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLayout()
    }
    
    func setupViews() {
        topView.addSubview(leftMenuButton)
        topView.addSubview(topBarLabel)
        mainView.addSubview(topView)
        self.view.addSubview(mainView)
        self.navigationController?.navigationBar.removeFromSuperview()
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func setupLayout() {
        
        mainView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(88)
        }
        
        leftMenuButton.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.top).inset(42)
            make.leading.equalTo(topView.snp.leading).inset(18)
            make.width.height.equalTo(24)
        }
        
        topBarLabel.snp.makeConstraints { make in
            make.bottom.equalTo(topView.snp.bottom).inset(10)
            make.centerX.equalTo(topView.snp.centerX)
            make.width.equalTo(160)
        }
    }
    
    @objc private func buttonClicked(_ sender: UIButton) {
        self.revealViewController().revealToggle(self)
    }

}

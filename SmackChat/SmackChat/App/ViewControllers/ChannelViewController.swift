//
//  ChannelViewController.swift
//  SmackChat
//
//  Created by Asset Ryskul on 13.10.2022.
//

import UIKit
import SnapKit

class ChannelViewController: UIViewController {
    
    private let mainView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "Smack"
        label.textAlignment = .center
        label.font = UIFont(name: Constants.SMACK_FONT, size: 0)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let channelLabel: UILabel = {
        let label = UILabel()
        label.text = "CHANNELS"
        label.textAlignment = .center
        label.font = UIFont(name: Constants.SMACK_FONT, size: 0)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        return label
    }()
    
    private var addChannelButton: UIButton = {
        let btn = UIButton()
        btn.setImage(R.image.addChannelButton(), for: .normal)
        //btn.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    private var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.titleLabel?.font = UIFont(name: Constants.SMACK_FONT, size: 0)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //btn.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    private var avatarImageView: UIImageView = {
       let img = UIImageView()
        img.image = R.image.profileDefault()
        return img
    }()
    
    private lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLayout()
    }
    
    private func setupViews() {
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        self.view.addSubview(mainView)
        self.navigationController?.navigationBar.removeFromSuperview()
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.estimatedRowHeight = 44
        self.tableView.backgroundColor = .clear
        self.tableView.separatorColor = .white
        self.tableView.separatorStyle = .singleLine
        
        
        mainView.addSubview(topLabel)
        mainView.addSubview(channelLabel)
        mainView.addSubview(addChannelButton)
        mainView.addSubview(tableView)
        mainView.addSubview(avatarImageView)
        mainView.addSubview(loginButton)
        
    }
    
    private func setupLayout() {
        mainView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).inset(42)
            make.left.equalTo(mainView.snp.left).inset(18)
        }
        
        channelLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(16)
            make.left.equalTo(mainView.snp.left).inset(18)
        }
        
        addChannelButton.snp.makeConstraints { make in
            make.centerY.equalTo(channelLabel.snp.centerY)
            make.right.equalTo(mainView.snp.right).inset(72)
        }
                
        avatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(75)
            make.left.equalTo(mainView.snp.left).inset(18)
            make.bottom.equalTo(mainView.snp.bottom).inset(30)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImageView.snp.centerY)
            make.left.equalTo(avatarImageView.snp.right).offset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(addChannelButton.snp.bottom).offset(20)
            make.bottom.equalTo(avatarImageView.snp.top).offset(-20)
            make.leading.trailing.equalToSuperview()
        }
        
        
    }
    


}

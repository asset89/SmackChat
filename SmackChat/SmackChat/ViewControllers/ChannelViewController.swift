//
//  ChannelViewController.swift
//  SmackChat
//
//  Created by Asset Ryskul on 13.10.2022.
//

import UIKit
import SnapKit

class ChannelViewController: UIViewController {
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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
    }
    
    private func setupLayout() {
        mainView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
    }
    


}

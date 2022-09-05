//
//  AlertViewController.swift
//  ZARA
//
//  Created by Oscar Rodriguez Garrucho on 5/9/22.
//
//  Copyright (c) 2022 Oscar R. Garrucho. All rights reserved.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//

import UIKit

final class AlertViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: AlertBusinessLogic?
    var router: AlertRoutingLogic?
    var message: String?
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    // MARK: - Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    

    // MARK: - Selectors
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        router?.dismiss()
    }
    
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        titleLabel.text = NSLocalizedString("Alert", comment: "")
        messageLabel.text = message ?? ""
        okButton.setTitle(NSLocalizedString("Accept", comment: ""), for: .normal)
    }
}

// MARK: - AlertDisplayLogic

extension AlertViewController: AlertDisplayLogic {
    
}

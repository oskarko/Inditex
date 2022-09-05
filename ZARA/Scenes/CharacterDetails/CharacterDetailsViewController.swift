//
//  CharacterDetailsViewController.swift
//  ZARA
//
//  Created by Oscar Rodriguez Garrucho on 5/9/22.
//
//  Copyright (c) 2022 Oscar R. Garrucho. All rights reserved.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: CharacterDetailsBusinessLogic?
    var router: CharacterDetailsRoutingLogic?
    var character: Character!
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    @IBOutlet weak var characterLocationLabel: UILabel!
    @IBOutlet weak var characterOriginLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    
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

    
    // MARK: - Helpers
    
    private func configureUI() {
        title = "Character details"
        characterImageView.loadFrom(URLString: character.image)
        characterNameLabel.text = "Name: \(character.name)"
        characterSpeciesLabel.text = "Species: \(character.species)"
        characterLocationLabel.text = "Location: \(character.location.name)"
        characterOriginLabel.text = "Origin: \(character.origin.name)"
        characterStatusLabel.text = "Status: \(character.status)"
    }
}

// MARK: - CharacterDetailsDisplayLogic

extension CharacterDetailsViewController: CharacterDetailsDisplayLogic {
    
}

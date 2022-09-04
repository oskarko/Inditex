//
//  CharacterCell.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterSpecieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterImageView.layer.cornerRadius = 8
    }
    
    func configureCell(with character: Character?) {
        guard let character = character else { return }
        
        characterNameLabel.text = character.name
        characterSpecieLabel.text = character.species
        characterImageView.loadFrom(URLString: character.image)
    }
    
}

extension UIImageView {
    func loadFrom(URLString: String) {
        guard let url = URL(string: URLString) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}

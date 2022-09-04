//  ListCharactersViewController.swift
//  ZARA
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2021 Oscar R. Garrucho. All rights reserved.
//

import UIKit

final class ListCharactersViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: ListCharactersBusinessLogic?
    var router: ListCharactersRoutingLogic?
    
    private var characters: [Character]?
    
    @IBOutlet weak var tableview: UITableView!
    
    
    // MARK: - Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview()
        configureUI()
        interactor?.fetchCharacters()
    }
    

    // MARK: - Selectors

    
    // MARK: - Helpers

    private func setupTableview() {
        let nib = UINib(nibName: String(describing: CharacterCell.self), bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "CharacterCell")
    }
    
    private func configureUI() {
        title = "Rick and Morty!"

    }
    
}

// MARK: - ListCharactersDisplayLogic

extension ListCharactersViewController: ListCharactersDisplayLogic {
    func reloadData(with characters: [Character]) {
        self.characters = characters
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListCharactersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.configureCell(with: self.characters?[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

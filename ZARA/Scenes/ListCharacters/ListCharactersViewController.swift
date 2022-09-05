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
    
    private var characters: [Character] = []
    
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
        interactor?.fetchCharacters(offset: characters.count)
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
    
    func insertItems(with characters: [Character], at indexPathsToReload: [IndexPath]) {
        self.characters = characters
        
        DispatchQueue.main.async {
            self.tableview.insertRows(at: indexPathsToReload, with: .none)
        }
    }
    
    func showAlert(with message: String) {
        DispatchQueue.main.async {
            self.router?.showAlert(with: message)
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListCharactersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.configureCell(with: self.characters[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.characters[indexPath.row]
        router?.showDetails(for: character)
    }
}

// MARK: - UITableViewDataSourcePrefetching

extension ListCharactersViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        // If We're in the last cell, We'll try to fetch automatically
        // the next characters in order to have an infinite scrolling effect.
        if indexPaths.contains(where: isLastCell) {
            interactor?.fetchCharacters(offset: characters.count)
        }
    }
    
    // MARK: - Helpers
    
    // This method helps to calculate if a cell is the last one in the tableView.
    private func isLastCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row == characters.count - 1 && characters.count % Constants.CHARACTERS_BY_PAGE == 0
    }
}


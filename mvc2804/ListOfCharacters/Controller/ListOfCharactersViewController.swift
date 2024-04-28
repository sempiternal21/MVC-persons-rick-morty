//
//  ViewController.swift
//  mvc2804
//
//  Created by Danil Antonov on 28.04.2024.
//

import UIKit

class ListOfCharactersViewController: UIViewController {
    var mainView: CharactersListView { self.view as! CharactersListView }
    let apiClient = ListOfCharactersAPIClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    
    override func loadView() {
        view = CharactersListView()
        
        title = "Persons List"
        
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        mainView.charactersTableView.dataSource = tableViewDataSource
        mainView.charactersTableView.delegate = tableViewDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = dataSource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            //self?.present(characterDetailViewController, animated: true)
            self?.navigationController?.pushViewController(characterDetailViewController, animated: true)
        }
        
        Task {
            let characters = await apiClient.getListOfCharacters()
            print("Characters \(characters)")
            tableViewDataSource?.set(characters: characters.results)
        }
    }
}


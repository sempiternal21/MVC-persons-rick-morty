//
//  CharacterDetailViewController.swift
//  mvc2804
//
//  Created by Danil Antonov on 28.04.2024.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    var mainView: CharacterDetailView { self.view as! CharacterDetailView }
    
    init(characterDetailModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(characterDetailModel)
        title = characterDetailModel.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

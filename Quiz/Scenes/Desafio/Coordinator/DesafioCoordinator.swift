//
//  DesafioCoordinator.swift
//  Quiz
//
//  Created by Development IOS on 25/05/22.
//

import Foundation
import UIKit


class DesafioCoordinator {
    
    
    // MARK: - Atributos self
    
    var window: UIWindow
    var viewModel: DesafioViewModel?
    var controller: DesafioViewController?
    
    
    // MARK: - init
    
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: - Métodos do Coordinator Desafio
        
    func start(Jogador: Jogador){
        print(Jogador)
        viewModel = DesafioViewModel()
        viewModel?.pegarQuestao()
        //viewModel?.viewNagivationsDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = DesafioViewController(viewModel: viewModel, jogador: Jogador)
        window.rootViewController = controller
    }
    
    
    // MARK: - Navegação

    func HomeViewModelGoToDesafio(_ viewModel: HomeViewModel, jogador: Jogador) {
//        ScenesDesafioCoordinator = DesafioCoordinator(window: window)
//        guard let desafioCoordinator = self.ScenesDesafioCoordinator else { return }
//        desafioCoordinator.start(Jogador: jogador)
        
        print("Hello")
    }
    
}


import Foundation
import UIKit
import RealmSwift

class HomeCoordinator: HomeViewModelCoordinatorDelegate {
    
    
    
    
    // MARK: - Atributos self
    
    
    var window: UIWindow
    var viewModel: HomeViewModel?
    var controller: HomeViewController?
    
    
    
    // MARK: -  Atributos para coneção com outras Scenes
    
    //var ScenesDesafio: DesafioViewController?
    var ScenesDesafioCoordinator: DesafioCoordinator?
        
    
    // MARK: - init
    
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: - Métodos do Coordinator Onboarding
    
    func start(idJogador: ObjectId){
        //viewModel = HomeViewModel()
        
        print("Hello")
        
        
    }
    
    // MARK: - Navegação
    
    func HomeViewModelGoToDesafio(_ viewModel: HomeViewModel, jogador: Jogador) {
        ScenesDesafioCoordinator = DesafioCoordinator(window: window)
        guard let desafioCoordinator = self.ScenesDesafioCoordinator else { return }
        desafioCoordinator.start(Jogador: jogador)
    }
    
    
    
}




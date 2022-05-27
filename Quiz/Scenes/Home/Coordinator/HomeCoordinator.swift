
import Foundation
import UIKit
import RealmSwift

class HomeCoordinator: HomeViewModelCoordinatorDelegate {
    
    
    // MARK: - Atributos self
    
    var window: UIWindow
    var viewModel: HomeViewModel?
    var controller: HomeViewController?
    
    
    // MARK: -  Atributos para coneção com outras Scenes
    
    var ScenesDesafioCoordinator: DesafioCoordinator?
        
    
    // MARK: - init
    
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: - Métodos do Coordinator Home
    
    func start(idJogador: ObjectId){
        viewModel = HomeViewModel(id: idJogador)
        viewModel?.viewNagivationsDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = HomeViewController(viewModel: viewModel)
        window.rootViewController = controller  
    }
    
    // MARK: - Navegação
    
    func HomeViewModelGoToDesafio(_ viewModel: HomeViewModel, jogador: Jogador) {
        ScenesDesafioCoordinator = DesafioCoordinator(window: window)
        guard let desafioCoordinator = self.ScenesDesafioCoordinator else { return }
        desafioCoordinator.start(Jogador: jogador)
    }
}




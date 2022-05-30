
import Foundation
import UIKit


class DesafioCoordinator: DesafioViewModelCoordinatorDelegate {
    
    
    // MARK: - Atributos self
    
    var window: UIWindow
    var viewModel: DesafioViewModel?
    var controller: DesafioViewController?
    var jogadorManager: JogadorManager
    
    
    // MARK: - Scene Navegação
    
    var ScenesHomeCoordinator: HomeCoordinator?
    var ScenesCelebracaCoordinator: CelebracaoCoordinator?
    
    
    // MARK: - init
    
    
    required init(window: UIWindow) {
        self.window = window
        self.jogadorManager = JogadorManager()
    }
    
    
    // MARK: - Métodos do Coordinator Desafio
        
    func start(){
        viewModel = DesafioViewModel(manager: jogadorManager)
        viewModel?.pegarQuestao()
        viewModel?.viewNagivationsDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = DesafioViewController(viewModel: viewModel)
        window.rootViewController = controller
    }
    
    
    // MARK: - Navegação

    func DesafioViewModelGoToHome(_ viewModel: DesafioViewModel, jogador: Jogador) {
        ScenesHomeCoordinator = HomeCoordinator(window: window)
        guard let HomeCoordinator = self.ScenesHomeCoordinator else { return }
        HomeCoordinator.start(idJogador: jogador.id)
    }
    
    
    func DesafioViewModelGoToClebracao(_ viewModel: DesafioViewModel){
        ScenesCelebracaCoordinator = CelebracaoCoordinator(window: window)
        guard let CelebracaoCoordinator = self.ScenesCelebracaCoordinator else { return }
        CelebracaoCoordinator.start()
    }
}

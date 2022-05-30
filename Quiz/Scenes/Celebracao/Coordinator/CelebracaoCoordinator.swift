
import UIKit


class CelebracaoCoordinator: CelebracaoViewModelCoordinatorDelegate {

    // MARK: - Atributos self
    
    
    var window: UIWindow
    var viewModel: CelebracaoViewModel?
    var controller: CelebracaoViewController?
    var jogadorManager: JogadorManager
    
    // MARK: - Scene Navegação
    
    var ScenesHomeCoordinator: HomeCoordinator?
    var ScenesCelebracaCoordinator: DesafioCoordinator?
    
    
    // MARK: - init
    
    required init(window: UIWindow) {
        self.window = window
        self.jogadorManager = JogadorManager()
    }
    
    
    // MARK: - Métodos do Coordinator Desafio
    
    func start(){
        viewModel = CelebracaoViewModel(manager: jogadorManager)
        viewModel?.viewNagivationsDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = CelebracaoViewController(viewModel: viewModel)
        window.rootViewController = controller
    }
    
    // MARK: - Navegação
    
    
    func CelebracaoViewModelGoToHome(_ viewModel: CelebracaoViewModel, jogador: Jogador) {
        ScenesHomeCoordinator = HomeCoordinator(window: window)
        guard let HomeCoordinator = self.ScenesHomeCoordinator else { return }
        HomeCoordinator.start(idJogador: jogador.id)
    }
    
    func CelebracaoViewModelReiniciaDesafio(_ viewModel: CelebracaoViewModel) {
        ScenesCelebracaCoordinator = DesafioCoordinator(window: window)
        guard let HomeCoordinator = self.ScenesCelebracaCoordinator else { return }
        HomeCoordinator.start()
    }
}

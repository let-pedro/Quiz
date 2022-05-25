
import UIKit


class OnboardingCoordinator: OnboardingViewModelCoordinatorDelegate {
    
    
    // MARK: - Atributos self
    
    var window: UIWindow
    var viewModel: OnboardingViewModel?
    var controller: OnboardingViewController?

    
    
    // MARK: - Atributos para coneção com outras Scenes
        
    var ScenesHome: HomeViewController?
    var ScenesHomeCoordinator: HomeCoordinator?
    
    
    // MARK: - init
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: - Métodos do Coordinator Onboarding
    
    func start() {
        viewModel = OnboardingViewModel()
        viewModel?.viewNagivationsDelegate = self
        
        guard let viewModel = viewModel else { return }
        controller = OnboardingViewController(viewModel: viewModel)
        window.rootViewController = controller
    }
    
    
    // MARK: - Navegação
    
    func OnboardingViewModelGoToHome(_ viewModel: OnboardingViewModel, jogador: Jogador) {
        ScenesHomeCoordinator = HomeCoordinator()
        guard let HomeCoordinator = self.ScenesHomeCoordinator else { return }
        HomeCoordinator.start()
    }  
}




import Foundation


protocol OnboardingViewModelCoordinatorDelegate: AnyObject {
    func OnboardingViewModelGoToHome(_ viewModel: OnboardingViewModel, jogador: Jogador)
}


protocol OnboardingViewModelAlertasDelegate {
    func FailureCriarJogador(_ error: Error?)
    func FailureNaoExisteJogador()
    func FailureExisteJogador()
}

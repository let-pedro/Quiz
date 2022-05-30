
import Foundation


protocol OnboardingViewModelCoordinatorDelegate: AnyObject {
    func OnboardingViewModelGoToHome(_ viewModel: OnboardingViewModel, jogador: Jogador)
}


protocol OnboardingViewModelDelegate {
    func FailureCriarJogador(_ error: Error?)
    func FailureNaoExisteJogador()
    func FailureExisteJogador()
}

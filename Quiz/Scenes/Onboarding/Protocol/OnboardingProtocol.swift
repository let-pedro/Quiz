
import Foundation


protocol OnboardingViewModelCoordinatorDelegate: AnyObject {
    func OnboardingViewModelGoToHome(_ viewModel: OnboardingViewModel, jogador: Jogador)
}


protocol OnboardingViewModelAlertasDelegate {
    //func SuccessCriarJogador()
    func FailureCriarJogador(_ error: Error?)
    func FailureExisteJogador(_ error: Error)
}

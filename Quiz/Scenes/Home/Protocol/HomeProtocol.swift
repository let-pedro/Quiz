

import Foundation


protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func HomeViewModelGoToDesafio(_ viewModel: HomeViewModel, jogador: Jogador)
}


protocol HomeViewModelAlertasDelegate {
    func FailurePegarJogador(_ error: Error?)
}

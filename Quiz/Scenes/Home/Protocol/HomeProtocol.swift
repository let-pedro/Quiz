
import Foundation


protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func HomeViewModelGoToDesafio(_ viewModel: HomeViewModel)
}

protocol HomeViewModelDelegate {
    func FailurePegarJogador(_ error: Error?)
    func SucessPegarJogador(_ jogador: Jogador)
}


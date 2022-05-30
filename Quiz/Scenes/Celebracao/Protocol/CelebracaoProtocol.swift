
import Foundation


protocol CelebracaoViewModelCoordinatorDelegate: AnyObject {
    func CelebracaoViewModelGoToHome(_ viewModel: CelebracaoViewModel,jogador: Jogador)
    func CelebracaoViewModelReiniciaDesafio(_ viewModel: CelebracaoViewModel)
}


protocol CelebracaoViewModelDelegate {
    func resultadoDesafio(pontuacao: Int)
}

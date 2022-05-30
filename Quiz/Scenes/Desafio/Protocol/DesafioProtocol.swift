

import Foundation


protocol DesafioViewModelCoordinatorDelegate: AnyObject {
    func DesafioViewModelGoToHome(_ viewModel: DesafioViewModel,jogador: Jogador)
    func DesafioViewModelGoToClebracao(_ viewModel: DesafioViewModel)
}


protocol DesafioViewModelDelegate {
    func Failure(_ error: Error?)
    func resultadoVerificacaoResposta(Resposta: RespostaRequest)
    func apresentarQuestao(questao: Question)
}

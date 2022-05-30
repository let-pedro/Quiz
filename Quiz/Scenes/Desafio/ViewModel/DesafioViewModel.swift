
import Foundation



class DesafioViewModel {
    
    
    // MARK: - Variáveis
    
    
    var viewModelDelegate: DesafioViewModelDelegate?
    var viewNagivationsDelegate: DesafioViewModelCoordinatorDelegate?
    var service: DesafioService
    var jogadorManager: JogadorManager
        
    // MARK: - init
    
    
    init(service: DesafioService = .init(), manager jogadorManager: JogadorManager) {
        self.service = service
        self.jogadorManager = jogadorManager
    }
    
    
    // MARK: - Métodos
    
    func pegarQuestao() {
        service.getQuestao(){ result  in
            switch result {
            case .failure(let error):
                self.viewModelDelegate?.Failure(error)
            case .success(let questao):
                self.viewModelDelegate?.apresentarQuestao(questao: questao)
            }
        }
    }
    
    
    func verificarResposta(altSelecionada: String, idQuestao: String){
        let JsonResposta = ["answer": altSelecionada]
        
        service.getResultadoAlternativa(parameters: JsonResposta, id: idQuestao) { result in
            switch result {
            case .failure(let error):
                self.viewModelDelegate?.Failure(error)
            case .success(let Resultado):
                self.viewModelDelegate?.resultadoVerificacaoResposta(Resposta: Resultado)
            }
        }
    }
    
    
    func irParaCelebracao(){
        viewNagivationsDelegate?.DesafioViewModelGoToClebracao(self)
    }
    
    
    func irParaHome(){
        guard let jogador =  jogadorManager.pegarJogadorAtual()  else { return }
        viewNagivationsDelegate?.DesafioViewModelGoToHome(self, jogador: jogador)
    }
    
    
    func DadosJogada(pontos: Int, erros: Int, acertos: Int){
        guard let jogador =  jogadorManager.pegarJogadorAtual()  else { return }
        jogador.updateDadosJogada(pontuacao: pontos, QtErros: erros, QtAcertos: erros)
    }
}

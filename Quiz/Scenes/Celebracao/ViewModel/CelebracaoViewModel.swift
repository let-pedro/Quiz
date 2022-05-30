
import Foundation


class CelebracaoViewModel {
    
    // MARK: - Variáveis
    
    
    var viewModelDelegate: CelebracaoViewModelDelegate?
    var viewNagivationsDelegate: CelebracaoViewModelCoordinatorDelegate?
    var jogadorManager: JogadorManager
    
    
    // MARK: - init
    
    init(manager jogadorManager: JogadorManager) {
        self.jogadorManager = jogadorManager
        resultado()
    }
    
    
    // MARK: - Métodos
    
    
    func resultado(){
        let jogadorAtual = jogadorManager.pegarJogadorAtual()
        guard let jogador =  jogadorAtual else { return }
        
        viewModelDelegate?.resultadoDesafio(pontuacao: jogador.pontuacao)
    }
    
    
    func navigationDeScene(_ botaoPrecionado: Int){
        let jogadorAtual = jogadorManager.pegarJogadorAtual()
        guard let jogador =  jogadorAtual else { return }
        
        
        switch botaoPrecionado {
        case 0:
            viewNagivationsDelegate?.CelebracaoViewModelReiniciaDesafio(self)
        case 1:
            viewNagivationsDelegate?.CelebracaoViewModelGoToHome(self, jogador: jogador)
        default:
            return 
        }
    }
}

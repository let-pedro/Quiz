
import Foundation


public class JogadorManager {
    

    static var jogadorAtual: Jogador?
    
    
    func jogadorAtual(_ jogador: Jogador){
        JogadorManager.jogadorAtual = jogador
    }
    
    
    func pegarJogadorAtual() -> Jogador? {
        return JogadorManager.jogadorAtual
    }
    

    
}

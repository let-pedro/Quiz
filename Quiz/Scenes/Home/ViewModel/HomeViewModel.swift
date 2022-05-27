
import Foundation
import RealmSwift

class HomeViewModel {
    
    
    // MARK: - Variáveis
    
    
    var viewAlertaDelegate: HomeViewModelAlertasDelegate?
    var viewNagivationsDelegate: HomeViewModelCoordinatorDelegate?
    var service: HomeService
    var jogadorAtual: Jogador? = nil
        
    
    // MARK: - init
    
    init(service: HomeService = .init(), id idJogador: ObjectId) {
        self.service = service
        getUsuarioAtual(idJogador)
    }
    
    
    
    // MARK: - Métodos
    
    
    private func getUsuarioAtual(_ idJogador: ObjectId ){
        service.getJogador(idJogador) { result in
            switch result {
            case .failure(let error):
                self.viewAlertaDelegate?.FailurePegarJogador(error)
            case .success(let Jogador):
                self.jogadorAtual = Jogador
            }
        }
    }
    
    
    func irParaDesafio(Jogador: Jogador){
        viewNagivationsDelegate?.HomeViewModelGoToDesafio(self, jogador: Jogador)
    }
}

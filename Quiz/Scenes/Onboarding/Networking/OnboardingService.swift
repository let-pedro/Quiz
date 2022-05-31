
import Foundation
import RealmSwift

class OnboardingService: ObservableObject {
    private(set) var localRealm: Realm?
    
    
    init() {
        iniciaRealm()
    }
    
    
    func iniciaRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config            
            localRealm = try! Realm()

        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    
    
    func criar(_ jogador: Jogador,completion: @escaping(Error?) -> Void){
        guard let localRealm = localRealm  else { return } // coloca alerta caso de erro
        
        do {
            try! localRealm.write {
                localRealm.add(jogador)
                completion(nil)
            }
            
        } catch {
            completion(error)
            print("Erro ao adicionar no relam \(error)")
        }
    }
    
    
    func ExisteJogador(_ nomeJogador: String,completion: @escaping(Jogador?) -> Void){
        guard let localRealm = localRealm  else { return }
        let result = localRealm.objects(Jogador.self).filter("nome = '\(nomeJogador)'").first
        if let jogador = result {
            guard jogador.nome ==  nomeJogador else {
                return
            }
            completion(jogador)
        } else {
            completion(nil)
        }
    } 
}

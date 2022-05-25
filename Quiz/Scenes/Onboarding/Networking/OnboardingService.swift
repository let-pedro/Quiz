
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
            
            localRealm = try? Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    
    
    func criar(_ jogador: Jogador,completion: @escaping(Error?) -> Void){
        guard let localRealm = localRealm  else { return } // coloca alerta caso de erro
        
        do {
            try? localRealm.write {
                localRealm.add(jogador)
                completion(nil)
            }
            
        } catch {
            completion(error)
            print("Erro ao adicionar no relam \(error)")
        }
    }
}

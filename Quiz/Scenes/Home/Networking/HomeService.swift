
import Foundation
import RealmSwift


class HomeService: ObservableObject {
    private(set) var localRealm: Realm?
    
    
    init() {
        iniciaRealm()
    }
    
    
    func iniciaRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try! Realm()
        } catch  {
            print("Error opening Realm: \(error)")
        }
    }
    
    
    
    func getJogador(_ idJogador: ObjectId, completion: @escaping (Result<Jogador,Error>) -> Void) {
        
        if let localRealm = localRealm {
            
            do {
                let jogadorObjetct = localRealm.object(ofType: Jogador.self, forPrimaryKey: idJogador)
                guard let jogador = jogadorObjetct else { return }
                completion(.success(jogador))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    
    
}

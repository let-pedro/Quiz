
import Foundation
import RealmSwift


class Jogador: Object {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var imagePersonagem: String
    @Persisted var nome: String
    @Persisted var pontuacao: Int
    @Persisted var num_error: Int
    @Persisted var num_acerto: Int


    convenience init(imagePersonagem: String, nome: String, pontuacao: Int = 0, num_error: Int = 0, num_acerto: Int = 0 ){
        self.init()
        self.imagePersonagem = imagePersonagem
        self.nome = nome
        self.pontuacao = pontuacao
        self.num_error = num_error
        self.num_acerto = num_acerto
    }
}

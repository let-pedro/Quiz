
import Foundation
import Alamofire

class DesafioService {
    
    private let urlApi: String = "https://quiz-api-bwi5hjqyaq-uc.a.run.app"
    
    func getQuestao(completion: @escaping (Result<Question,Error>) -> Void){
        guard let url = URL(string: "\(urlApi)") else {
            print ("Not found url")
            return
        }
        
        AF.request(url, method: .get).response{ Result in
            guard let data = Result.data else { return }
            do {
                let questaoResult = try JSONDecoder().decode(Question.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(questaoResult))
                }
                
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func getResultadoAlternativa<T: Encodable>(parameters: [String:T], id idQuestao: String, completion: @escaping (Result<RespostaRequest,Error>) -> Void){
        guard let url = URL(string: "\(urlApi)/answer?questionId=\(idQuestao)") else {
            print ("Not found url")
            return
        }

        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default
        ).response { Result in
            guard let data = Result.data else { return }
            do {
                let respostaAlternativa = try JSONDecoder().decode(RespostaRequest.self, from: data)
                completion(.success(respostaAlternativa))

            } catch {
                completion(.failure(error))
                print("Erro: ---- \(error.localizedDescription)")
            }
        }
    }
}

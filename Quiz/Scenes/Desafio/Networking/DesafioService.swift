
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
                completion(.success(questaoResult))
            } catch {
                completion(.failure(error))
            }
        }
    }
}


import Foundation


struct Question: Codable {
    let id: String
    let statement: String
    let options: [String]
}

struct RespostaRequest: Codable {
    let result: Bool
}

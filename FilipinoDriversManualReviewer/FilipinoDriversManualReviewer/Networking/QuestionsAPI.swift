//
//  QuestionsAPI.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import Foundation

class QuestionsAPI: APIClientProtocol {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func fetchDataObject<T: Decodable>(from url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
    
    func fetchDataArray<T: Decodable>(from url: URL) async throws -> [T] {
        let (data, response) = try await URLSession.shared.data(from: url)
        do {
            let decodedData = try JSONDecoder().decode([T].self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
    
    private func loadJSONArray<T: Decodable>(filename: String, type: T.Type) async -> [T] {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Faile to load JSON File \(filename)")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decoded = try JSONDecoder().decode([T].self, from: data)
            
            return decoded
            
        } catch let error {
            debugPrint("error at \(#file) - \(#function): \(error.localizedDescription)")
            fatalError("failed to decode \(error.localizedDescription)")
        }
    }
    
    private func loadJSONObject<T: Decodable>(filename: String, type: T.Type) async -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Faile to load JSON File \(filename)")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            
            return decoded
            
        } catch let error {
            debugPrint("error at \(#file) - \(#function): \(error.localizedDescription)")
            fatalError("failed to decode \(error.localizedDescription)")
        }
        
    }
    
}

protocol QuestionsAPIServiceProtocol {
    func fetchQuestions() async -> ReviewSet?
}


class QuestionsAPIService: QuestionsAPIServiceProtocol, ObservableObject {
    
    private let questionsAPI: APIClientProtocol
    
    init(questionsAPI: APIClientProtocol) {
        self.questionsAPI = questionsAPI
    }
    
    func fetchQuestions() async -> ReviewSet? {
        if let url = URL(string: "http://127.0.0.1:8080/NonProfessionalLightReviewQuestions.json") {
            do {
                
                let reviewSet: ReviewSet = try await questionsAPI.fetchDataObject(from: url)
                return reviewSet
                
            } catch let error {
                
                debugPrint("Error: \(error.localizedDescription)")
            }
            
        }
        return nil
    }

}

class QuestionsLocalDataAPIService: QuestionsAPIServiceProtocol, LocalDataFetchable{
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSONObject<T>(filename: String, type: T.Type) async -> T where T : Decodable {
        
        
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Faile to load JSON File \(filename)")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            
            return decoded
            
        } catch let error {
            debugPrint("error at \(#file) - \(#function): \(error.localizedDescription)")
            fatalError("failed to decode \(error.localizedDescription)")
        }
    }
    
    func fetchQuestions() async -> ReviewSet? {
        await loadJSONObject(filename: "", type: ReviewSet.self)
    }
    
    
}

protocol LocalDataFetchable {
    func loadJSONObject<T: Decodable>(filename: String, type: T.Type) async -> T
}

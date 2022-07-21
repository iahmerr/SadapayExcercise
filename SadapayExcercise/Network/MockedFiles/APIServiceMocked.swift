//
//  APIServiceMocked.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

final class APIServiceMocked: GitRepoService {
    var isFailure: Bool = false
    
    func getGitTrendingRepo(completion: @escaping (Result<GitReposResponse, AppError>) -> Void) {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "TrendingRepoResponse", ofType: "json") else {
            fatalError("File not found")
        }
        
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert to json")
        }
        
        let jsonData = json.data(using: .utf8)!
        let decodedResult = try? JSONDecoder().decode(GitReposResponse.self, from: jsonData)
        isFailure ? completion(.failure(AppError(error: "Error Occured"))) : completion(.success(decodedResult!))
    }
}

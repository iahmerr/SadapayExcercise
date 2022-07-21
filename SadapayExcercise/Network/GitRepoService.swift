//
//  GitRepoService.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

protocol GitRepoService: AnyObject {
    func getGitTrendingRepo(completion: @escaping(Result<GitReposResponse,AppError>) -> Void)
}

final class ApiService: GitRepoService {
    
    private let request: ApiRequest
    init(request: ApiRequest = APIClient()){
        self.request = request
    }
    
    func getGitTrendingRepo(completion: @escaping (Result<GitReposResponse, AppError>) -> Void) {
        let queryItems: [String: String] = ["q": "language%3D+sort:stars"]
        let router: URLRequestConvertible = Endpoint(route: .getTrendingRepositories, method: .get, queryItems: queryItems)
        self.request.performRequest(router: router) { (result: Result<GitReposResponse, AppError>) in
            switch result{
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}

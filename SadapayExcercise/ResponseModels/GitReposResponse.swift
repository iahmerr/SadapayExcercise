//
//  GitReposResponse.swift
//  SadapayExcercise
//
//  Created by Ahmer Hassan on 21/07/2022.
//

import Foundation

struct GitReposResponse: Decodable {
    let total_count : Int?
    let incomplete_results : Bool?
    let items : [Items]?
}

struct Items : Decodable {
    let name : String?
    let owner : Owner?
    let description : String?
    let stargazers_count : Int
    let language : String?
    let license : License?
}

struct Owner : Decodable {
    let avatar_url : String?
}

struct License : Decodable {
    let key : String?
    let name : String?
    let spdx_id : String?
    let url : String?
    let node_id : String?
}


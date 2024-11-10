//
//  CreditScoreResponse.swift
//  LoanApp
//
//  Created by Dongjun Lee on 11/10/24.
//

import Foundation

struct CreditScoreResponse: Decodable {
    let score: Int
    let lastUpdated: String
    let reportedBy: String
}

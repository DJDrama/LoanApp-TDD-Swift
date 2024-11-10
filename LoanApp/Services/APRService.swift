//
//  APRService.swift
//  LoanApp
//
//  Created by Dongjun Lee on 11/10/24.
//

import Foundation

protocol CreditScoreServiceProtocol {
    func getCreditScore(ssn: String) async throws -> Int?
}

struct CreditScoreService : CreditScoreServiceProtocol {
    let baseURL: URL
    
    // this is unmanaged dependency this is the test url provided by the credit score company
    func getCreditScore(ssn: String) async throws -> Int? {
        var url = baseURL
        url.append(path: "/api/credit-score/\(ssn)")
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(CreditScoreResponse.self, from: data)
        
        // real HTTPClient
        return result.score
    }
}



// managed dependency
struct APRService{
    
    // third party service
    private var creditScoreService: CreditScoreServiceProtocol
    
    init(creditScoreService: CreditScoreServiceProtocol) {
        self.creditScoreService = creditScoreService
    }
    
    func calculateAPR(ssn: String) async throws -> Double {
        guard let creditScore = try await creditScoreService.getCreditScore(ssn: ssn) else {
            throw CreditScoreError.noCreditScoreFound
        }
        
        if creditScore > 650 {
            return 3.124
        } else {
            return 6.24
        }
    }
}

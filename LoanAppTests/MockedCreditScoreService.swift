//
//  MockedCreditScoreService.swift
//  LoanAppTests
//
//  Created by Dongjun Lee on 11/10/24.
//

import Foundation
@testable import LoanApp

struct MockedCreditScoreService: CreditScoreServiceProtocol {
    
    var onGetCreditScore: ((String) -> Int?)?
    
    func getCreditScore(ssn: String) async throws -> Int? {
        return onGetCreditScore?(ssn)
    }

}

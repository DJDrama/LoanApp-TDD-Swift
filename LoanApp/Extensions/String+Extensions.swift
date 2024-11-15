//
//  String+Extensions.swift
//  LoanApp
//
//  Created by Dongjun Lee on 11/10/24.
//

import Foundation

extension String{
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isSSN: Bool {
        guard !self.isEmptyOrWhiteSpace else { return false }
        
        let ssnRegex = #"^\d{3}-\d{2}-\d{4}$"#
        let ssnPredicate = NSPredicate(format: "SELF MATCHES %@", ssnRegex)
        return ssnPredicate.evaluate(with: self)
    }
}

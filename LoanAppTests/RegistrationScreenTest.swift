//
//  RegistrationScreenTest.swift
//  LoanAppTests
//
//  Created by Dongjun Lee on 11/10/24.
//

import XCTest
@testable import LoanApp

final class RegistrationScreenTest: XCTestCase {
    
    func testRegistrationFormValid() {
        let testData = [
            ("DJ", "Lee", "123-45-1232"),
            ("HOO", "HAHA", "678-49-1020"),
            ("DID", "DO", "532-15-2444")
        ]
        
        for (firstName, lastName, ssn) in testData {
            let registrationForm = RegistrationForm(firstName: firstName, lastName: lastName, ssn: ssn)
            XCTAssertTrue(registrationForm.isValid, "\(firstName) \(lastName) with SSN \(ssn) should be valid!")
        }
    }
    
    func testRegistrationFormInvalid() {
        let testData = [
            ("DJ", "Lee", "123-45-122"),
            ("HOO", "", "678-49-1020"),
            ("", "DO", "532-15-2444")
        ]
        
        for (firstName, lastName, ssn) in testData {
            let registrationForm = RegistrationForm(firstName: firstName, lastName: lastName, ssn: ssn)
            XCTAssertFalse(registrationForm.isValid, "\(firstName) \(lastName) with SSN \(ssn) should be valid!")
        }
    }
   
    func testIsSSN() {
        let validSSNs = ["123-34-1234", "142-32-1232", "111-44-5555"]
        let invalidSsns = ["", "123", "123124124", "Abc-de-fdfd", "123-45-12312", "12-23-12312", "123-123-123", "123--1231"]
        
        for ssn in validSSNs {
            XCTAssertTrue(ssn.isSSN)
        }
        
        for ssn in invalidSsns {
            XCTAssertTrue(!ssn.isSSN)
        }
    }

}

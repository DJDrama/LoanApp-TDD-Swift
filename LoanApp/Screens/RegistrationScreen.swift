//
//  RegistrationScreen.swift
//  LoanApp
//
//  Created by Dongjun Lee on 11/10/24.
//

import SwiftUI

struct RegistrationScreen: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var ssn: String = ""
    
    private var isFormValid: Bool {
        !firstName.isEmptyOrWhiteSpace && !lastName.isEmptyOrWhiteSpace && ssn.isSSN
    }
    
    var body: some View {
        Form {
            TextField("First name", text: $firstName)
            TextField("Last name", text: $lastName)
            TextField("SSN", text: $ssn)
            Button("Save") {
                
            }.disabled(!isFormValid)
        }
    }
}

#Preview {
    RegistrationScreen()
}

//
//  RegistrationScreen.swift
//  LoanApp
//
//  Created by Dongjun Lee on 11/10/24.
//

import SwiftUI

struct RegistrationForm {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var ssn: String = ""
    
    var isValid: Bool {
        !firstName.isEmptyOrWhiteSpace
        && !lastName.isEmptyOrWhiteSpace
        && ssn.isSSN
    }
}

struct RegistrationScreen: View {
    
    @State private var registrationForm = RegistrationForm()
    
    var body: some View {
        Form {
            TextField("First name", text: $registrationForm.firstName)
            TextField("Last name", text: $registrationForm.lastName)
            TextField("SSN", text: $registrationForm.ssn)
            Button("Save") {
                
            }.disabled(!registrationForm.isValid)
        }
    }
}

#Preview {
    RegistrationScreen()
}

//
//  SignUpScreen.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 05/03/23.
//

import SwiftUI

struct SignUpScreen: View {
    
    private enum FocusedField {
           case email, password
       }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var fieldsEmpty = false
    @FocusState private var isFocused: FocusedField?
    
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.system(size: 25,weight: .semibold))
                    }

                    Spacer()
                    
                }
                .padding(.top, 20)
                .padding(.bottom,30)
                
                
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .minimumScaleFactor(0.01)
                    
                    Text("Insert your email address and add a password to create a new account.")
                        .foregroundColor(.white_30)
                        .font(.system(size: 16, weight: .medium))
                        .lineLimit(2)
                    
                }
                .padding(.bottom, 40)
                
                //MARK: Textfields
                VStack(spacing: 30){
                    //email
                    VStack(spacing: 15){
                        HStack{
                            Text("Email")
                                .foregroundColor(fieldsEmpty ? Color.red_error : .white)
                                .font(.system(size: 10,weight: .semibold))
                            
                            Spacer()
                        }
                        
                        ZStack(alignment: .leading){
                            if email.isEmpty{
                                Text(verbatim:"example@mail.com")
                                    .foregroundColor(Color.white_30)
                                    .font(.system(size: 15))
                                    .textInputAutocapitalization(.none)
                            }
                            TextField("", text: $email)
                                .focused($isFocused, equals: .email)
                                .onSubmit {
                                    self.isFocused = .password
                                }
                                .submitLabel(.next)
                            
                        }
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(self.isFocused == .email ? Color.purple_primary : .clear, lineWidth: self.isFocused == .email ? 1.2 : 0)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white_10))
                                .frame(height: 40)
                                
                        )
                    }
                    
                    //password
                    VStack(spacing: 15){
                        HStack{
                            Text("Password")
                                .foregroundColor(fieldsEmpty ? Color.red_error : .white)
                                .font(.system(size: 10,weight: .semibold))
                            
                            Spacer()
                        }
                        
                        ZStack(alignment: .leading){
                            if password.isEmpty{
                                Text(verbatim:"Enter password")
                                    .foregroundColor(Color.white_30)
                                    .font(.system(size: 15))
                                    .textInputAutocapitalization(.none)
                            }
                            
                            if showPassword{
                                TextField("", text: $password)
                                    .focused($isFocused, equals: .password)
                                    .onSubmit {
                                        self.isFocused = nil
                                    }
                                    .submitLabel(.done)
                            }else {
                                SecureField("", text: $password)
                                    .submitLabel(.done)
                                    .focused($isFocused, equals: .password)
                                    .onSubmit {
                                        self.isFocused = nil
                                    }
                            }
                            
                            HStack{
                                
                                Spacer()
                                
                                Image(systemName: showPassword ? "eye" : "eye.slash")
                                    .foregroundColor(showPassword ? .white : Color.white_30)
                                    .font(.system(size: 15))
                                    .onTapGesture {
                                            showPassword.toggle()
                                    }
                                
                            }
                        }
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(self.isFocused == .password ? Color.purple_primary : .clear, lineWidth: self.isFocused == .password ? 1.2 : 0)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white_10))
                                .frame(height: 40)
                        )
                    }
                    
                    
                    //forgot password
                    NavigationLink {
                        LoginScreen()
                    } label: {
                        HStack {
                            Text("Already have an account? log in")
                                .foregroundColor(.purple_primary)
                            .font(.system(size: 12,weight: .regular))
                            
                            Spacer()
                        }
                    }


                    

                }
                
                Spacer()
                
                //continue button
                NavigationLink {
                    if email.isEmpty || password.isEmpty {
                        AboutYouScreen()
                    }
                } label: {
                    PrimaryButton(label: "Continue")
                        
                }
                
                .padding(.bottom, 20)
                
                
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .padding(.horizontal,20)
            
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.dark)
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}

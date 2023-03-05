//
//  AboutYouScreen.swift
//  Vibe-TV
//
//  Created by Abdel Baali on 05/03/23.
//

import SwiftUI

struct AboutYouScreen: View {
    
    private enum FocusedField {
           case firstName, lastName
       }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var firstName: String = ""
    @State var lastName: String = ""
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
                    Text("About you")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .minimumScaleFactor(0.01)
                    
                    Text("We love to get to know each other, tell us a little bit about yourself")
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
                            Text("First name")
                                .foregroundColor(fieldsEmpty ? Color.red_error : .white)
                                .font(.system(size: 10,weight: .semibold))
                            
                            Spacer()
                        }
                        
                        ZStack(alignment: .leading){
                            if firstName.isEmpty{
                                Text(verbatim:"Jhon")
                                    .foregroundColor(Color.white_30)
                                    .font(.system(size: 15))
                                    .textInputAutocapitalization(.none)
                            }
                            TextField("", text: $firstName)
                                .focused($isFocused, equals: .firstName)
                                .onSubmit {
                                    self.isFocused = .lastName
                                }
                                .submitLabel(.next)
                            
                        }
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(self.isFocused == .firstName ? Color.purple_primary : .clear, lineWidth: self.isFocused == .firstName ? 1.2 : 0)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white_10))
                                .frame(height: 40)
                                
                        )
                    }
                    
                    //password
                    VStack(spacing: 15){
                        HStack{
                            Text("Last name")
                                .foregroundColor(fieldsEmpty ? Color.red_error : .white)
                                .font(.system(size: 10,weight: .semibold))
                            
                            Spacer()
                        }
                        
                        ZStack(alignment: .leading){
                            if lastName.isEmpty{
                                Text(verbatim:"Doe")
                                    .foregroundColor(Color.white_30)
                                    .font(.system(size: 15))
                                    .textInputAutocapitalization(.none)
                            }
                            
                            TextField("", text: $lastName)
                                .focused($isFocused, equals: .lastName)
                                .onSubmit {
                                    self.isFocused = nil
                                }
                                .submitLabel(.done)
                        }
                        .padding(.horizontal,20)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(self.isFocused == .lastName ? Color.purple_primary : .clear, lineWidth: self.isFocused == .lastName ? 1.2 : 0)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.white_10))
                                .frame(height: 40)
                        )
                    }
                    
        

                }
                
                Spacer()
                
                //continue button
                NavigationLink {
                    if firstName.isEmpty || lastName.isEmpty {
                        HomeView()
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

struct AboutYouScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutYouScreen()
    }
}

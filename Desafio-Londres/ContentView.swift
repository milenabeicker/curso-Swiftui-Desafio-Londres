//
//  ContentView.swift
//  Desafio-Londres
//
//  Created by Milena Kessia on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var userName = ""
    @State var password = ""
    @State var toggleIsOn = true
    @State var showAlert = false
    @State var showSheet = false
    let password1 = "654321"
    
    var body: some View {
        Form{
            Section(header: Text("IrmandadeSwift")
                .padding(.bottom, 50)
                .frame(minWidth: 0, idealWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: 0, alignment: .bottom)
                .foregroundColor(.black)
                .font(.largeTitle)
                .textCase(nil)
            ){
                TextField("Username",text: $userName,prompt: Text("Username"))
                SecureField("Password",text: $password,prompt: Text("Password"))
                
                VStack{
                    Toggle("Lembrar de mim", isOn: $toggleIsOn)
                        .padding(.bottom, 60)
                    Button("Entrar"){
                        print("Clicou o botão")
                        if password == password1 {
                            showSheet = true
                        }else {
                            showAlert = true
                        }
                    }
                    .frame(width: 100, height: 40)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .background(.purple)
                    .cornerRadius(10)
                    .padding(30)
                    .sheet(isPresented: $showSheet ){
                        HStack{
                            VStack(spacing: 10){
                                Text("BEM VINDO, SACI")
                                    .font(.system(size: 55).weight(.medium))
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: 180, height: 8, alignment: .leading)
                                    
                            }
                            Text("👊🏽")
                                .font(.system(size: 100))
                        }
                        .padding(.bottom, 120)
                        Button {
                            showSheet.toggle()
                            print("Foi clicado")
                        } label: {
                            Text("Sair")
                                .foregroundColor(.purple)
                                .font(.system(size: 25))
                                .underline()
                        }
                    }
                }
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Senha incorreta"), message: Text("Tente novamente"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

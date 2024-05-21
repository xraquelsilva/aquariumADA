//
//  AlertaCampoObrigatorio.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 21/05/24.
//

import SwiftUI

struct AlertaTime: View {
    
    @Binding var failedInput: Bool
    
//    let title: String
    let message: String
    
    
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if failedInput {
                ZStack {
                    Color(.black)
                        .opacity(0.5)
                        .onTapGesture {
                            close()
                        }
                    VStack {
                        
                        Text(message)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.color333030)
                            .font(.system(size: 16))
                            .frame(width: 230)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding()
                        Spacer()
                        
                        Button {
                          close()
                        } label: {
                            Text("OK")
                                .font(Font.custom("LilitaOne", size: 17))
                                .foregroundStyle(.color254E5C)
                        }
                        
                    }
                    .padding()
                    .frame(width: 270, height: 140)
                    .background(.secondarycolor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
//                    .overlay {
//                        HStack {
//                                    Spacer()
//                                    .padding()
//                                  }
//                                }
                                .shadow(radius: 20)
                                .padding()
                                .offset(x: 0, y: offset)
                                .onAppear{
                                  withAnimation(.default) {
                                    offset = 0
                                  }
                                }
                }
                          .ignoresSafeArea()
                        } else {
                          EmptyView()
                        }
                      }
        
        func close () {
            withAnimation(.spring()) {
                offset = 1000
                failedInput = false
            }
        }
    }
    
    #Preview {
        AlertaTime(failedInput: .constant(true), message: "Você precisa selecionar uma linguagem do amor para continuar", action: {})
    }

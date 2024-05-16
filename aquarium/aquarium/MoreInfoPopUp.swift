//
//  MoreInfoPopUp.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 15/05/24.
//

import SwiftUI

struct CustomDialog: View {
    
    @Binding var isActive: Bool
    
    let title: String
    let message: String
    
    
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if isActive {
                ZStack {
                    Color(.black)
                        .opacity(0.4)
                        .onTapGesture {
                            close()
                        }
                    VStack (alignment: .leading, spacing: 8.0)  {
                        
                        Text(title)
                            .padding()
                            .foregroundStyle(.secondarycolor)
                            .font(.system(size: 32))
                        
                        Text(message)
                            .foregroundStyle(.secondarycolor)
                            .font(.system(size: 20))

                        Text("E elas são divididas em cinco:")
                            .foregroundStyle(.secondarycolor)
                            .font(.system(size: 20))
                        
                        VStack (alignment: .leading, spacing: 12) {
                            Text("1. Palavras de afirmação: demonstração de afeto por meio de elogios . Você ama declaraçãozinhas!")
                                .foregroundStyle(.secondarycolor)
                                .font(.system(size: 18))
                            
                            
                            Text("2. Toque físico: o carinho é demonstrado por meio de abraços e gestos. Você gosta de ficar agarradinho!")
                                .foregroundStyle(.secondarycolor)
                                .font(.system(size: 18))
                            
                            
                            Text("3. Tempo de qualidade: o amor é convertido em tempos exclusivos com as pessoas que amamos. Você ama passar tempo juntinho!")
                                .foregroundStyle(.secondarycolor)
                                .font(.system(size: 18))
                            
                            
                            Text("4. Atos de serviço: ações são muito valiosas, representando momentos de ajuda. Você ama dar forcinha!")
                                .foregroundStyle(.secondarycolor)
                                .font(.system(size: 18))
                            
                            
                            Text("5. Presentes: o amor é revelado por meio de presentes. Você ama dar lembrancinhas!")
                                .foregroundStyle(.secondarycolor)
                                .font(.system(size: 18))
                            
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
                    }
//                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 365, height: 736)
                    .background(.color3E6390)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        
                        HStack {
                                    Spacer()
                                    VStack {
                                      Button {
                                        close()
                                      } label: {
                                        Image(systemName: "xmark.circle.fill")
                                          .font(.title2)
                                          .fontWeight(.medium)
                                      }
                                      .tint(.secondarycolor)
                                      .opacity(0.5)
                                      Spacer()
                                    }
                                    .padding()
                                  }
                                }
                                .shadow(radius: 20)
//                                .padding()
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
                isActive = false
            }
        }
    }
    
    #Preview {
        CustomDialog(isActive: .constant(true), title: "O que é linguagem do amor?", message: "O amor é expressado de formas diferentes e a maneira que você o manifesta é o que chamamos de linguagem do amor.", action: {})
    }


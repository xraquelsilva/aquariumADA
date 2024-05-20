//
//  PopUpPresents.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 16/05/24.
//

import SwiftUI

struct Presents: View {
    
    @Binding var isResultPresents: Bool
    
    
    let title: String
    let message: String
    
    
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if isResultPresents {
                ZStack {
                    Color(.black)
                        .opacity(0.5)
                        .onTapGesture {
                            close()
                        }
                    VStack (alignment: .leading, spacing: 4.0)  {
                        
                        Text(title)
//                            .padding()
                            .foregroundStyle(.secondarycolor)
                            .font(Font.custom("LilitaOne", size: 32))
                            .frame(width: 276, alignment: .topLeading)
                            .padding()
                        
                        Text(message)
                            .foregroundStyle(.secondarycolor)
                            .font(Font.custom("LibreFranklin", size: 16))
                            .frame(width: 180, alignment: .topLeading)
                            .padding(.leading)
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: 361, height: 365)
                    .background(.color254E5C)
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
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Image(ImageResource.peixinhos)
                                    .frame(width: 263, height: 138)
                            }
                            .padding()
                        }
                                }
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
                isResultPresents = false
            }
        }
    }
    
    #Preview {
        Presents(isResultPresents: .constant(true), title: "VOCÊ TEM X.XX% DO SEU TEMPO LIVRE!", message: "NÃO ESQUEÇA DE PRESENTAR UM AMIGO HOJE!", action: {})
    }



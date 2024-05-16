//
//  PopUpActs.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 16/05/24.
//

import SwiftUI

struct ActsOfService: View {
    
    @Binding var isResultActsOfService: Bool
    
    
    let title: String
    let message: String
    
    
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if isResultActsOfService{
                ZStack {
                    Color(.black)
                        .opacity(0.5)
                        .onTapGesture {
                            close()
                        }
                    VStack (alignment: .leading, spacing: 17.0)  {
                        
                        HStack {
                            Text(title)
                                .padding()
                                .foregroundStyle(.secondarycolor)
                                .font(Font.custom("LilitaOne", size: 32))
                                .frame(width: 270, alignment: .topLeading)
                        }
                        
                        Text(message)
                            .foregroundStyle(.secondarycolor)
                            .font(.system(size: 20))
                            .frame(width: 204, alignment: .topLeading)
                        
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
                                Image(ImageResource.cavalinhosmarinhos)
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
                isResultActsOfService = false
            }
        }
    }
    
    #Preview {
        ActsOfService(isResultActsOfService: .constant(true), title: "VOCÊ TEM X% DO SEU TEMPO LIVRE!", message: "NÃO ESQUEÇA DE AJUDAR UM AMIGO HOJE!", action: {})
    }



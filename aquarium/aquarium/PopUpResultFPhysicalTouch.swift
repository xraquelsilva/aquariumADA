//
//  PopUpResultFPhysicalTouch.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 16/05/24.
//

import SwiftUI

struct PhysicalTouch: View {
    
    @Binding var isResultPhysicalTouch: Bool
    
    
    let title: String
    let message: String
    
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if isResultPhysicalTouch {
                ZStack {
                    Color(.black)
                        .opacity(0.5)
                        .onTapGesture {
                            close()
                        }
                    VStack (alignment: .leading, spacing: 4.0)  {
                        
                        Text(title)
                            .foregroundStyle(.secondarycolor)
                            .font(Font.custom("LilitaOne", size: 32))
                            .frame(width: 276, alignment: .topLeading)
                            .padding()
                        
                        Text(message)
                            .foregroundStyle(.secondarycolor)
                            .font(Font.custom("LibreFranklin", size: 20))
                            .frame(width: 178, alignment: .topLeading)
                            .padding(.leading)
                        Spacer()
                        
                    }
                    
//                    .fixedSize(horizontal: false, vertical: true)

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
                                Image(ImageResource.corais)
                                    .frame(width: 218)
                            }
                            .padding(.horizontal)
                        }
                                }
                                .shadow(radius: 20)
                                
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
                isResultPhysicalTouch = false
            }
        }
    }
    
    #Preview {
        PhysicalTouch(isResultPhysicalTouch: .constant(true), title: "", message: "NÃO ESQUEÇA DE ABRAÇAR UM AMIGO HOJE!", action: {})
    }

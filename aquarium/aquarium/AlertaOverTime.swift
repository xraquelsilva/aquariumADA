//
//  AlertaOverTime.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 22/05/24.
//

import SwiftUI

struct AlertaOverTime: View {
    
    @Binding var inputFailed: Bool
    
//    let title: String
    let message: String
    
    
    let action: () -> ()
    
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        
        if inputFailed {
                ZStack {
                    Color(.black)
                        .opacity(0.5)
                        .onTapGesture {
                            close()
                        }
                    VStack {
//                        Spacer()
                        Text(message)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.color333030)
                            .font(.system(size: 16))
                            .frame(width: 245)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .padding()
                        Divider()
                            .background(.color254E5C)
                            .opacity(0.5)
                        Spacer()
                        Button {
                          close()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 270, height: 21)
                                    .foregroundColor(Color.secondarycolor)
                                    
                                Text("OK")
                                    .font(Font.custom("LilitaOne", size: 17))
                                    .foregroundStyle(.color254E5C)
                            }
                        }
                        
                    }
                    .padding()
                    .frame(width: 270, height: 140)
                    .background(.secondarycolor)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
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
                inputFailed = false
            }
        }
    }
    
    #Preview {
        AlertaOverTime(inputFailed: .constant(true), message: "O seu dia está no limite de 24 horas", action: {})
    }

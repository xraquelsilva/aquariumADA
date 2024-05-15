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
            Color(.white)
                .opacity(0.1)
                .onTapGesture {
                    close()
                }
            VStack {
                Text(title)
                    .padding()
                
                Text(message)
                
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            close()
                        } label: {
                            Image(systemName: "xmark")
                        } .tint(.black)
                    }
                    Spacer()
                }
                .padding()
            }
            .shadow(radius: 20)
            .padding(30)
            .offset(x: 30, y: offset)
            .onAppear {
                withAnimation(.spring()) {
                    offset = 0
                }
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
    CustomDialog(isActive: .constant(true), title: "Mais sobre", message: "testando", action: {})
}

//
//  ContentView.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var loveLanguage: String? = nil
    
    @State var hourWorkStudy: Int? = nil
    
    @State var hourMeals: Int? = nil
    
    @State var hourRest: Int? = nil
    
    @State var hourTransport: Int? = nil
    
    @State var extraHours: Int? = nil
    
    var body: some View {
        ZStack (alignment: .top){
            Color.backgroundcolor
            ZStack {
                VStack (alignment: .leading, spacing: 12.0) {
                    
                    ZStack (alignment: .center) {
                        
                        ZStack(alignment: .center) {
                            Color(.color254E5C)
                                .frame(maxWidth: .infinity)
                                .frame(height: 180)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 0,
                                        bottomLeadingRadius: 50,
                                        bottomTrailingRadius: 50,
                                        topTrailingRadius: 0,
                                        style: .circular
                                    )
                                )
                                .shadow(color: Color(red: 0.2, green: 0.19, blue: 0.19).opacity(0.25), radius: 2, x: 0, y: 3)
                            
                        }
                        
                        Image(ImageResource.titulo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 213, height: 117)
                        
                    }
                    
                    ScrollView {
                        VStack (alignment: .leading, spacing: 12.0){
                                Text("Olá, peixinho!")
                                    .foregroundStyle(.color333030)
                                    .font(.system(size: 24))
                                    .bold()
                                Text("Esse aplicativo é para te ajudar a reservar tempo para usar com as pessoas que você ama a partir da sua linguagem do amor.")
                                    .foregroundStyle(.color333030)
                                    .font(.system(size: 18))
                                
                                //aqui o dropdown
                                
                                
                                
                                
                                
                                //aqui o slider
                                
                                VStack (alignment: .leading, spacing: 15.0){
                                    Text("Quantas horas você gasta com trabalho e/ou estudos?")
                                    TextField("Quantidade de horas gastas nessa atividade", value: $hourWorkStudy, format: .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 15.0) {
                                    Text("Quantas horas você gasta, em média, nas refeições?")
                                    TextField("Quantidade de horas gastas nas refeições", value: $hourMeals, format: .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 15.0) {
                                    Text("Quantas horas você tem de lazer?")
                                    TextField("Quantidade de horas reservadas para lazer", value: $hourRest, format: 
                                    .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 15.0) {
                                    Text("Quantas horas gasta em locomoção?")
                                    TextField("Quantidade de horas em transporte", value: $hourRest, format: .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 15.0) {
                                    Text("Se alguma atividade não tiver sido incluída, coloque aqui a quantidade de horas que você também usa em atividades diversas")
                                    TextField("Quantidade de horas também em uso", value: $hourRest, format: .number)
                                }
                                
                                Button(action: processFreeTime, label: {
                                    ZStack {
                                        Color(.secondarycolor)
                                        Text("CALCULAR")
                                            .foregroundStyle(.primarycolor)
                                            .bold()
                                    }
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                })
                                .frame(width: 311, height: 50)
                                .frame(maxHeight: 50)
                                .frame(maxWidth: .infinity)
                            }
                        .padding()
                    }
                }
                .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            }
            

        } .ignoresSafeArea()
            
    }
    
    func processFreeTime() {
        //calculo em si
    }
}

#Preview {
    ContentView()
}

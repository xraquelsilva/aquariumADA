//
//  ContentView.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    @State var loveLanguage: String? = nil
    
    @State var loveLanguageSelect: String? = nil
    
    @State private var hour: Float = 3
    
    @State private var isEditing = false
    
    @State var hourWorkStudy: Int? = nil
    
    @State var hourMeals: Int? = nil
    
    @State var hourRest: Int? = nil
    
    @State var hourTransport: Int? = nil
    
    @State var extraHours: Int? = nil
    
    
    var body: some View {
        
        ZStack {
            ZStack (alignment: .top)
            {
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
                            
                            VStack (alignment: .leading, spacing: 18.0){
                                Text("Olá, peixinho!")
                                    .foregroundStyle(.color333030)
                                    .font(.system(size: 24))
                                    .bold()
                                Text("Esse aplicativo é para te ajudar a reservar tempo para usar com as pessoas que você ama a partir da sua linguagem do amor.")
                                    .foregroundStyle(.color333030)
                                    .font(.system(size: 18))
                                ZStack {
                                    VStack {
                                        Button(action: {
                                            isActive = true
                                        }, label: {
                                            Text("Mais sobre linguagem do amor")
                                                .foregroundStyle(.color3E6390)
                                                .frame(maxWidth: .infinity)
                                                //sublinhar esse texto
                                                
                                            
                                        })
                                    }
                                }
                                
                                
                                VStack (alignment: .leading, spacing: 8.0){
                                    Text("Qual a sua linguagem do amor?")
                                }
                                
                                DropDownPicker(
                                    selection: $loveLanguageSelect,
                                    options: [
                                        "Tempo de qualidade",
                                        "Toque físico",
                                        "Palavras de afirmação",
                                        "Presentes",
                                        "Atos de serviço"
                                    ]
                                )
                                .frame(width: 345, height: 50)
                                .frame(maxWidth: .infinity)
                                
                                
                                VStack (alignment: .leading, spacing: 8.0 ){
                                    Text("Quantas horas você passa acordado no dia?")
                                    Slider(value: $hour, in: 1...23)
                                        .accentColor(.primarycolor)
                                        
                                    Text("\(hour, specifier: "%.0f")")
                                }
                                
                                VStack (alignment: .leading, spacing: 8.0){
                                    Text("Quantas horas você gasta com trabalho e/ou estudos?")
                                    TextField("Quantidade de horas gastas nessa atividade", value: $hourWorkStudy, format: .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 8.0) {
                                    Text("Quantas horas você gasta, em média, nas refeições?")
                                    TextField("Quantidade de horas gastas nas refeições", value: $hourMeals, format: .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 8.0) {
                                    Text("Quantas horas você tem de lazer?")
                                    TextField("Quantidade de horas reservadas para lazer", value: $hourRest, format:
                                                .number)
                                }
                                
                                VStack (alignment: .leading, spacing: 8.0) {
                                    Text("Quantas horas gasta em locomoção?")
                                    TextField("Quantidade de horas em transporte", value: $hourRest, format: .number)
                                }
                                
    //                            VStack (alignment: .leading, spacing: 8.0) {
    //                                  Text("Se alguma atividade não tiver sido incluída, coloque aqui a quantidade de horas que você também usa em atividades diversas")
    //                                TextField("Quantidade de horas também em uso", value: $hourRest, format: .number)}
                                
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
                                .frame(width: 345, height: 50)
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
            CustomDialog(isActive: $isActive, title: "O que é linguagem do amor?", message: "O amor é expressado de formas diferentes e a maneira que você o manifesta é o que chamamos de linguagem do amor.", action: {})
        }
        
    }
    
    func processFreeTime() {
        //calculo em si
    }
    
}

struct DropDownPicker: View {
    
    @Binding var selection: String?
    var options: [String]
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                HStack {
                    Text(selection == nil ? "Selecione uma opção" : selection!)
                        .foregroundColor(selection != nil ? .color333030 : .primarycolor)
                                        
                    Image(systemName: "chevron.down")
                        .foregroundColor(.color333030)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: 345, height: 44)
                .background(.white)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    withAnimation(.easeInOut(duration: 0.25)) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray)
            }
            .frame(height: size.height)
        }
        .frame(height: 50)
        .zIndex(zindex)
    }
    
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                HStack {
                    Text(option)
                    
                    Image(systemName: "checkmark")
                        .opacity(selection == option ? 1 : 0)
                }
                .foregroundStyle(selection == option ? Color.primarycolor : Color.color333030)
                .animation(.none, value: selection)
                .frame(height: 40)
                .contentShape(.rect)
                .padding(.horizontal, 15)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        selection = option
                        showDropdown.toggle()
                    }
                }
            }
        }
        .transition(.move(edge: .top))
        .zIndex(1)
    }
}

#Preview {
    ContentView()
}


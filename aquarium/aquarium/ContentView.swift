//
//  ContentView.swift
//  aquarium
//
//  Created by Raquel Silva dos Santos on 13/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    @State var isResultPhysicalTouch: Bool = false
    
    @State var isResultWordOfAfirmattion: Bool = false
    
    @State var isResultQualityTime: Bool = false
    
    @State var isResultPresents: Bool = false
    
    @State var isResultActsOfService: Bool = false
    
    @State var loveLanguage: String? = nil
    
    @State var loveLanguageSelect: String? = nil
    
    @State private var hoursSleep: Float = 8
    
    @State private var isEditing = false
    
    @State var hourWorkStudy: Float = 2
    
    @State var hourMeals: Float = 2
    
    @State var hourRest: Float = 2
    
    @State var hourTransport: Float = 2
    
    @State var result: Double? = nil
    
    @State var inputFailed = false //soma acima de 24h
    
    @State var faildInput = false //nao preencheu campo obrigatório
    
    
    let tituloAlerta = "O seu dia está no limite de 24 horas"
    
    let tituloAlertaCampoAusente = "Você precisa selecionar uma linguagem do amor para continuar"
    
    var hoursTotal: Float {
        hoursSleep + hourWorkStudy + hourMeals + hourRest + hourTransport
    }
    
    var hoursTotal1: Float {
         hourWorkStudy + hourMeals + hourRest + hourTransport
    }
    
    var hoursTotal2: Float {
        hoursSleep  + hourMeals + hourRest + hourTransport
    }
    
    var hoursTotal3: Float {
        hoursSleep + hourWorkStudy + hourRest + hourTransport
    }
    
    var hoursTotal4: Float {
        hoursSleep + hourWorkStudy + hourMeals + hourTransport
    }
    var hoursTotal5: Float {
        hoursSleep + hourWorkStudy + hourMeals + hourRest
    }
    
    var isOverDay: Bool {
        hoursTotal > 24
    }

    
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
                                    .font(Font.custom("LilitaOne", size: 24))
                                    .bold()
                                Text("Esse aplicativo é para te ajudar a reservar tempo para usar com as pessoas que você ama a partir da sua linguagem do amor. Afinal, vivemos em um grande aquário com a nossa rede de apoio.")
                                    .foregroundStyle(.color333030)
                                    .font(.system(size: 18))
                                ZStack {
                                    VStack {
                                        Button(action: {
                                            isActive = true
                                        }, label: {
                                            Text("Mais sobre linguagem do amor")
                                                .underline()
                                                .foregroundStyle(.color3E6390)
                                                .frame(maxWidth: .infinity)
                                            
                                        })
                                    }
                                }
                                
                                
                                VStack (alignment: .leading, spacing: 8.0){
                                    Text("Qual a sua linguagem do amor?")
                                        .font(.system(size: 18))
                                }
                                
                                DropDownPicker(
                                                selection: $loveLanguageSelect,
                                                options: loveLanguageOptions.allCases.map { $0.rawValue }
                                            )
                                .frame(width: 345, height: 50)
                                .frame(maxWidth: .infinity)
                                
                                
                                VStack(alignment: .leading, spacing: 5.0) {
                                    Text("Quantas horas você dorme por dia?")
                                        .font(.system(size: 18))
                                    Slider(value: Binding(
                                        get: {
                                            self.hoursSleep
                                        }, set: {
                                            if hoursTotal1 + $0 <= 24 {
                                                self.hoursSleep = $0
                                            } else {
                                                inputFailed = true
                                                self.hoursSleep = 24 - hoursTotal1
                                                
                                            }
                                        }),
                                        in: 1...16,
                                        step: 1
                                    )
                                    {
                                        Text("Horas de sono")
                                    } minimumValueLabel: {
                                        Text("5")
                                    } maximumValueLabel: {
                                        Text("16")
                                    }
                                    .accentColor(.primarycolor)
                                    .padding(.horizontal)
                                    Text("\(hoursSleep, specifier: "%.0f")")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.primarycolor)
                                        .font(Font.custom("LibreFranklin", size: 18))
                                }
                                
                                VStack (alignment: .leading, spacing: 5.0){
                                    Text("Quantas horas você gasta com trabalho e/ou estudos?")
                                        .font(.system(size: 18))
                                    Slider(value: Binding(
                                        get: {
                                            self.hourWorkStudy
                                        }, set: {
                                            if hoursTotal2 + $0 <= 24 {
                                                self.hourWorkStudy = $0
                                            } else {
                                                inputFailed = true
                                                self.hourWorkStudy = 24 - hoursTotal2
                                                
                                            }
                                        }),
                                        in: 1...10,
                                        step: 1
                                    )
                                    {
                                        Text("Horas de trabalho/estudo")
                                    } minimumValueLabel: {
                                        Text("0")
                                    } maximumValueLabel: {
                                        Text("10")
                                    }
                                    .accentColor(.primarycolor)
                                    .padding(.horizontal)
                                    
                                    Text("\(hourWorkStudy, specifier: "%.0f")")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.primarycolor)
                                        .font(Font.custom("LibreFranklin", size: 18))
                                }
                                
                                VStack (alignment: .leading, spacing: 5.0) {
                                    Text("Quantas horas você gasta, em média, nas refeições?")
                                        .font(.system(size: 18))
                                    Slider(value: Binding(
                                        get: {
                                            self.hourMeals
                                        }, set: {
                                            if hoursTotal3 + $0 <= 24 {
                                                self.hourMeals = $0
                                            } else {
                                                inputFailed = true
                                                self.hourMeals = 24 - hoursTotal3
                                                
                                            }
                                        }),
                                        in: 1...5,
                                        step: 1
                                    )
                                    {
                                        Text("Horas para refeição")
                                    } minimumValueLabel: {
                                        Text("1")
                                    } maximumValueLabel: {
                                        Text("5")
                                    }
                                    .accentColor(.primarycolor)
                                    .padding(.horizontal)
                                    
                                    
                                    Text("\(hourMeals, specifier: "%.0f")")
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.primarycolor)
                                        .font(Font.custom("LibreFranklin", size: 18))
                                }
                                
                                
                                VStack (alignment: .leading, spacing: 5.0) {
                                    Text("Quantas horas você tem de lazer?")
                                        .font(.system(size: 18))
                                    Slider(value: Binding(
                                        get: {
                                            self.hourRest
                                        }, set: {
                                            if hoursTotal4 + $0 <= 24 {
                                                self.hourRest = $0
                                            } else {
                                                inputFailed = true
                                                self.hourRest = 24 - hoursTotal4
                                                
                                            }
                                        }),
                                        in: 1...8,
                                        step: 1,
                                     
                                    label: {
                                        Text("Horas em transporte")
                                    }, minimumValueLabel: {
                                        Text("1")
                                    }, maximumValueLabel: {
                                        Text("8")
                                    })
                                    .accentColor(.primarycolor)
                                    .padding(.horizontal)
                                    
                                    Text("\(hourRest, specifier: "%.0f")")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.primarycolor)
                                        .font(Font.custom("LibreFranklin", size: 18))
                                }
                                
                    
                                
                                VStack (alignment: .leading, spacing: 5.0) {
                                    Text("Quantas horas gasta em locomoção?")
                                        .font(.system(size: 18))
                                    Slider(value: Binding(
                                        get: {
                                            self.hourTransport
                                        }, set: {
                                            if hoursTotal5 + $0 <= 24 {
                                                self.hourTransport = $0
                                            } else {
                                                inputFailed = true
                                                self.hourTransport = 24 - hoursTotal5
                                                
                                            }
                                        }),
                                        in: 1...5,
                                        step: 1,
                                     
                                    label: {
                                        Text("Horas em transporte")
                                    }, minimumValueLabel: {
                                        Text("1")
                                    }, maximumValueLabel: {
                                        Text("5")
                                    })
                                    .accentColor(.primarycolor)
                                    .padding(.horizontal)
                                    
                                    Text("\(hourTransport, specifier: "%.0f")")
                                        .frame(maxWidth: .infinity)
                                        .foregroundColor(.primarycolor)
                                        .font(Font.custom("LibreFranklin", size: 18))
                                }
                                
                                Button(action: {
                                    _ = processFreeTime(for: loveLanguageSelect) }, label: {
                                    ZStack {
                                        Color(.primarycolor)
                                        Text("CALCULAR")
                                            .foregroundStyle(.secondarycolor)
                                            .font(Font.custom("LilitaOne", size: 24))
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
                .scrollDismissesKeyboard(.immediately)
                .alert(tituloAlerta, isPresented: $inputFailed) {
                    Button("OK", role: .cancel, action: {})
                }
                .alert(tituloAlertaCampoAusente, isPresented: $faildInput) {
                    Button("OK", role: .cancel, action: {})
                }
                
            } .ignoresSafeArea()
            
            let resultFormatted = String(format: "%.1f", result ?? 0)
            
            MoreInfoPopUp(isActive: $isActive, title: "O que é linguagem do amor?", message: "O amor é expressado de formas diferentes e a maneira que você o manifesta é o que chamamos de linguagem do amor.", action: {})
            
            if isResultPhysicalTouch {
                PhysicalTouch(isResultPhysicalTouch: $isResultPhysicalTouch, title: "VOCÊ TEM \(resultFormatted)% DO SEU TEMPO LIVRE!", message: "NÃO ESQUEÇA DE ABRAÇAR UM AMIGO HOJE!", action: {})
            }
            
            if isResultPresents {
                Presents(isResultPresents: $isResultPresents, title: "VOCÊ TEM \(resultFormatted)% DO SEU TEMPO LIVRE!", message: "NÃO ESQUEÇA DE PRESENTAR UM AMIGO HOJE!", action: {})
            }
            
            if isResultQualityTime {
                QualityTime(isResultQualityTime: $isResultQualityTime, title: "VOCÊ TEM \(resultFormatted)% DO SEU TEMPO LIVRE!", message: "NÃO ESQUEÇA DE PASSAR TEMPO COM UM AMIGO HOJE", action: {})
            }
            
            if isResultActsOfService {
                ActsOfService(isResultActsOfService: $isResultActsOfService, title: "VOCÊ TEM \(resultFormatted)% DO SEU TEMPO LIVRE!", message: "NÃO ESQUEÇA DE AJUDAR UM AMIGO HOJE!", action: {})
            }
            
            if isResultWordOfAfirmattion {
                WordsOfAfirmattion(isResultWordOfAfirmattion: $isResultWordOfAfirmattion, title: "VOCÊ TEM \(resultFormatted)% DO SEU TEMPO LIVRE!", message: 
                            "NÃO ESQUEÇA DE LEMBRAR QUE AQUELA PESSOA É ESPECIAL!", action: {})
            }
            AlertaTime(failedInput: $faildInput, message: "Você precisa selecionar uma linguagem do amor para continuar", action: {})

        }
        
    }
    
    func processFreeTime(for loveLanguageSelec: String?) -> Float {
        let totalHours: Float = Float(24 - hoursSleep)
        var sumAtiv: Float = 0
        
        sumAtiv = hourWorkStudy + hourTransport + hourMeals + hourRest
            
        let freeTime = totalHours - sumAtiv
        let freeTimePorc = (freeTime / totalHours) * 100 // resultado em porcentagem

        result = Double(freeTimePorc)
        
        if let loveLanguage = loveLanguageSelec {
            switch loveLanguage {
                
            case "Palavras de afirmação":
                if freeTimePorc >= 0 {
                    isResultWordOfAfirmattion = true
                } else {
                    isResultWordOfAfirmattion = false
                    inputFailed = true
                }
            
            case "Toque físico":
                if freeTimePorc >= 0 {
                    isResultPhysicalTouch = true
                } else {
                    isResultPhysicalTouch = false
                    inputFailed = true
                }
                
            case "Tempo de qualidade":
                if freeTimePorc >= 0 {
                    isResultQualityTime = true
                } else {
                    isResultQualityTime = false
                    inputFailed = true
                }
                
            case "Presentes":
                if freeTimePorc >= 0 {
                    isResultPresents = true
                } else {
                    isResultPresents = false
                    inputFailed = true
                }

            case "Atos de serviço":
                if freeTimePorc >= 0 {
                    isResultActsOfService = true
                } else {
                    isResultActsOfService = false
                    inputFailed = true
                }

            default:
                break
            }
        }
        else {
            faildInput = true
        }
        
        return freeTimePorc
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
                        .foregroundColor(selection != nil ? .primarycolor : .color333030)
                                        
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
                    .stroke(.color333030)
                    .opacity(0.2)
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
                        .foregroundStyle(.colorF2412F)
                }
                .foregroundStyle(selection == option ? Color.colorF2412F : Color.primarycolor)
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

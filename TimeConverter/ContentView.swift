/// Source:
/// https://www.hackingwithswift.com/100/swiftui/19

import SwiftUI



struct ContentView: View {
    
    // MARK: - Property wrappers
    @State private var startTimeUnit: TimeUnit = .minute
    @State private var convertedTimeUnit: TimeUnit = .second
    @State private var startValue: Double = 1
    
    @FocusState private var inputFieldIsActive: Bool
    
    
    
    // MARK: - Properties
    let timeUnits: Array<TimeUnit> = [
        .second, .minute, .hour, .day
    ]
    
//    let formatter: NumberFormatter = {
//        let formatter = NumberFormatter.init()
//        formatter.numberStyle = .decimal
//        return formatter
//    }()
    
    
    
    // MARK: - Computed properties
    
    var convertedTime: Double {
        
        switch (startTimeUnit, convertedTimeUnit) {
        case (.second, .second): return startValue
        case (.second, .minute): return startValue / 60
        case (.second, .hour): return startValue / (60 * 60)
        case (.second, .day): return startValue / (60 * 60 * 24)
            
        case (.minute, .second): return startValue * 60
        case (.minute, .minute): return startValue
        case (.minute, .hour): return startValue / 60
        case (.minute, .day): return startValue / (60 * 24)
            
        case (.hour, .second): return startValue * (60 * 60)
        case (.hour, .minute): return startValue * 60
        case (.hour, .hour): return startValue
        case (.hour, .day): return startValue / 24
            
        case (.day, .second): return startValue * (24 * 60 * 60)
        case (.day, .minute): return startValue * (24 * 60)
        case (.day, .hour): return startValue * 24
        case (.day, .day): return startValue
        }
    }
    
    
    var body: some View {
        
        Form {
            Section(header: Text("convert")) {
                // Text("\(startValue)")
                TextField("Your start value...",
                          value: $startValue,
                          // formatter: formatter)
                          format: .number)
                .focused($inputFieldIsActive)
            }
            Section(header: Text("from")) {
                Picker("From:",
                       selection: $startTimeUnit) {
                    ForEach(timeUnits,
                            id: \.self) {
                        Text($0.rawValue)
                    }
                }
                   .pickerStyle(.segmented)
            }
            
            Section(header: Text("to")) {
                Picker("To",
                       selection: $convertedTimeUnit) {
                    ForEach(timeUnits,
                            id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section(header: Text("end result")) {
                Text("\(convertedTime.formatted())")
            }
        }
        .keyboardType(.numberPad)
        .toolbar(content: {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done",
                       action: {
                    inputFieldIsActive.toggle()
                })
            }
        })
    }
}





// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
    }
}

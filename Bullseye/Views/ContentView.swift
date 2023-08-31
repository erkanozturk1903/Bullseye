
import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()



    var body: some View {
        VStack{
            Text("🎯🎯🎯\nPUT THE BULLSEYE ASCLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
                .kerning(2.0)
            Text(String(game.target)) 
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack{
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button("Hit Me") {
             alertIsVisible = true
            }.alert(
                "Hello there!",
                isPresented: $alertIsVisible,
                actions:{
                    Button("Awesome") {
                     print("Alert closed")
                    }
                },
                message: {
                    var roundedValue: Int = Int(sliderValue.rounded())
                    Text("""
                    The slider's value is \(roundedValue).
                    You scored \(game.points(sliderValue: roundedValue)) points
                    round.
                    """)
                }

            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

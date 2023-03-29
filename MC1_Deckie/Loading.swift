import SwiftUI
import Foundation

struct LoadingScreenView: View {
    
    @State private var fontSize = 32.0
    
    var body: some View{
        
        if #available(iOS 16.0, *) {
            
            
            NavigationStack {
                ZStack{
                    // 백그라운드 비디오 들어가야함
                    
                    VStack{
                        
                        Image("loading")
                            .resizable()
                            .frame(width: 448, height: 80)
                        
                        
                        
                    }
                    
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StatsScreenView()){
                        Text("넘어가기 버튼")
                            .foregroundColor(Color.black)
                            .frame(width: 100, height: 60, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray))
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}




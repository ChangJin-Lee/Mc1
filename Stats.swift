import SwiftUI
import Foundation

struct StatsScreenView: View {
    
    var body: some View{
        
        
        
        if #available(iOS 16.0, *) {
            NavigationStack {
                
                Text("상태창")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 200){
                    
                    VStack(spacing: 50){
                        
                        Image("surgeon")
                            .resizable()
                            .frame(width: 270, height: 150)
                        
                        Image("surgeon")
                            .resizable()
                            .frame(width: 270, height: 150)
                        
                        Image("surgeon")
                            .resizable()
                            .frame(width: 270, height: 150)
                        
                    }
                    
                    VStack(spacing: 50){
                        
                        Image("surgeon")
                            .resizable()
                            .frame(width: 270, height: 150)
                        
                        Image("surgeon")
                            .resizable()
                            .frame(width: 270, height: 150)
                        
                        Image("surgeon")
                            .resizable()
                            .frame(width: 270, height: 150)
                        
                    }
            
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ThirdScreenView()){
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

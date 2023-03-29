import SwiftUI
import Foundation

struct ThirdScreenView: View {
    
    @State private var isNight = false
    
    var body: some View{
        
        if #available(iOS 16.0, *) {
            
            
            NavigationStack {
                ZStack {
                    
                    Color(isNight ? .black : .white).ignoresSafeArea(.all)
                        .animation(.easeIn)

                    HStack{

                        
                        Text("""
                            아카데미에서의 첫 발표를 성공적으로 마친 팀 꿀빵은
                             지금까지의 여정에 대한 회고를 시작했다.
                             그들은 아고라를 거쳐 모두가 즐거웠던 발표에 만족함과 동시에
                            빠르게 지나간 시간을 느끼며
                              아쉬움으로 복잡한 감정에 사로잡혔다.
                            """)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(isNight ? .white : .black)
                        
                        
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button("낮과 밤 바꾸기"){
                        isNight.toggle()
                    }
                    
                    NavigationLink(destination: FourthScreenView()){
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


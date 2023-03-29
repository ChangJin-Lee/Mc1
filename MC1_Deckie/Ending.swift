import SwiftUI
import Foundation


struct EndingScreenView: View {
    @State var isAnimating: Bool = false
    @State var contentsText: String = "아카데미에서의 첫 발표를 성공적으로 마친 팀 꿀빵은 지금까지의 여정에 대한 회고를 시작했다. 그들은 아고라를 거쳐 모두가 즐거웠던 발표에 만족함과 동시에 빠르게 지나간 시간을 느끼며 아쉬움으로 복잡한 감정에 사로잡혔다.아카데미에서의 첫 발표를 성공적으로 마친 팀 꿀빵은 지금까지의 여정에 대한 회고를 시작했다. 그들은 아고라를 거쳐 모두가 즐거웠던 발표에 만족함과 동시에 빠르게 지나간 시간을 느끼며 아쉬움으로 복잡한 감정에 사로잡혔다."
    @State var contentsText1: String = "팀꿀빵"

    var body: some View{

        ZStack{
            Color.black.ignoresSafeArea(.all)

            VStack(spacing: 200){
                Text(contentsText)
                    .font(.system(size: 65))
                
                Text("감사합니다")
                    .font(.system(size: 100))
                
                Image("logo").resizable().frame(width: 600, height: 300)
            }
            .padding(10)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .foregroundColor(.white)
            .offset(y: isAnimating ? -4000 : UIScreen.main.bounds.size.width)
            .animation(.easeIn(duration: 8), value: isAnimating)
            .rotation3DEffect(.degrees(30), axis: (x: 1.0, y: 0.0, z: 0.0))
            .onAppear(perform: {
                isAnimating = true
            })
        }

    }
}


import SwiftUI
import AVFoundation
import AVKit


struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)

        let fileUrl = Bundle.main.url(forResource: "VideoWithBlock", withExtension: "mov")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)

        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)

        playerLooper = AVPlayerLooper(player: player, templateItem: item)

        player.play()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct ContentView: View {

    @State var isLoading: Bool = true
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    @State var animationTick = false
    
    var body: some View {
        
        
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height+100)
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {

                        
                        Image("logo")
                            .resizable()
                            .frame(width: 600, height: 300)
                            .multilineTextAlignment(.center)
                        
                        Spacer().frame(height: 50.0)
                        
                        NavigationLink(destination: ThirdScreenView()){
                            Image("logo")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .multilineTextAlignment(.center)
                            
                        }
                        
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
}

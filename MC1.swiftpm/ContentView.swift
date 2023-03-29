import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView(){
            Home()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct DetailView: View {
    var body: some View{
        HStack{
            Text("hello!")
        }
    }
}
struct Home: View {
    public let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        @State private var selection = 0
    let images = ["sample","sample","sample","sample","sample"]
    
    var body: some View{
        
        
        VStack(spacing: 100){
            
            ZStack{
                Image("titletext")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, -180)
                    .frame(width: 1100)
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
                
                HStack {
                    Text("chapter 1. Coding")
                    Spacer().frame(width: 800)
                    Text("STAGE").padding(.horizontal, -600)
                }
                .padding(.vertical, -145)
            }
            
            
            HStack{
                Image("left")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 700)
                    .offset(x: -10,y: 0)
                
                VStack{
                    
                    TabView(selection : $selection){
                        
                        ForEach(0..<5){ i in
                            Image("\(images[i])")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        
                    }.tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                        .onReceive(timer, perform: { _ in
                            
                            withAnimation{
                                print("selection is",selection)
                                selection = selection < 5 ? selection + 1 : 0
                            }
                        })
                        .frame(width: 750, height: 600, alignment: .trailing)
                        .offset(y: 30)
                    
                    
                    Image("script")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 750, height: 200)
                        .offset(y: -40)
                    
                    NavigationLink(destination: Home2()) {
                        Text("Go Home2")
                    }
                }
                
                
            }
            .padding(.vertical, -250)
            
            
        }
    }
}

struct Home2: View {
    @State var showPopup: Bool = false
    var body: some View{
        
        NavigationView{
            
            VStack(spacing: 200){
                
                
                HStack {
                    Text("chapter 1. Coding")
                    Spacer().frame(width: 800)
                    Text("STAGE").padding(.horizontal, -600)
                }
                .padding(.vertical, -60)
                
                HStack(spacing: 50){
                    Image("test5")
                        .frame(width: 300, alignment: .leading)
                    
                    Image("test6")
                        .frame(width: 300, alignment: .center)
                }
                .padding(.vertical, -180)
                
                
                HStack(spacing: 50){
                    Image("test7")
                        .frame(width: 300, alignment: .leading)
                    
                    NavigationLink(destination: BlackScene()) {
                        Text("Go BlackScene")
                    }
                    
                    Image("test5")
                        .frame(width: 300, alignment: .center)
                    
                    Button("Show Popup"){
                        withAnimation{
                            showPopup.toggle()
                        }
                        
                        
                    }
                }
                
            }
            .padding(.vertical, -10)
                
        }
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .popupNavigationView(horizontalPadding: 40, show: $showPopup){
            
            // MARK: Your Popup content which will also performs navigations
            List{
                ForEach(tasks){task in
                    NavigationLink(task.taskTitle) {
                        Text (task.taskDescription)
                            .navigationTitle ("Destination" )
                    }
                }
            }
            .navigationTitle("Popup Navigation")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Close"){
                        withAnimation{
                            showPopup.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct BlackScene: View{
    var body: some View{
        
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Text("데키&CJ와 함께라면, ")
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                Text("Chapter 1.  야, 너두 코딩할 수 있어")
                    .font(.system(size: 55))
                    .foregroundColor(.white)
            }
        }
    }
}


//            .frame(height: 5)
//            Spacer().frame(height: 130)
//            Spacer(minLength: 0)
//            Spacer()
//            Spacer().frame(height: <#T##CGFloat?#>)
//        Text("test12")
//            .padding(.horizontal)
//            .padding(.top)

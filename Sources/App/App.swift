import Web

public class App: WebApp {
    @State var color = Color.cyan
    
    enum Theme {
        case happy, sad
    }
    
    @State var theme: Theme = .happy
    
    @AppBuilder public override var body: AppBuilder.Content {
        Lifecycle.didFinishLaunching {
            print("Lifecycle.didFinishLaunching")
        }.willTerminate {
            print("Lifecycle.willTerminate")
        }.willResignActive {
            print("Lifecycle.willResignActive")
        }.didBecomeActive {
            print("Lifecycle.didBecomeActive")
        }.didEnterBackground {
            print("Lifecycle.didEnterBackground")
        }.willEnterForeground {
            print("Lifecycle.willEnterForeground")
        }
        Routes {
            Page { WelcomeViewController() }
            Page("hello") { HelloViewController() }
            Page("**") { NotFoundViewController() }
        }
        HappyStyle().id(.happyStyle).disabled($theme.map { $0 != .happy })
        SadStyle().id("sadStyle").disabled($theme.map { $0 != .sad })
    }
}

class HappyStyle: Stylesheet {
    @Rules
    override var rules: Rules.Content {
        Rule(H1.pointer).color(App.current.$color)
        Rule(Pointer.any)
            .margin(all: 0)
            .padding(all: 0)
        Rule(H1.class(.hello).after, H2.class(.hello).after) {
            AlignContent(.baseline)
            Color(.red)
        }
        .property(.alignContent, .auto)
        .alignContent(.auto)
        .color(.red)
    }
}

class SadStyle: Stylesheet {
    @Rules
    override var rules: Rules.Content {
        Rule(H1.pointer).color(.deepPink)
    }
}

extension Id {
    static var happyStyle: Id { "happyStyle" }
}

extension Class {
    static var hello: Class { "hello" }
}

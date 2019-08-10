import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if AuthService.instance.isLoggedIn{
            let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
            let tabbar = mainStoryboard.instantiateViewController(withIdentifier: MAIN_TAB_BAR_IDENTIFIER)
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = tabbar
            self.window?.makeKeyAndVisible()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

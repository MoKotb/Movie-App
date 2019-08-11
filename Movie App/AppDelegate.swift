import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let openVC:UIViewController!
        print(AuthService.instance.isLoggedIn)
        if AuthService.instance.isLoggedIn{
            openVC = mainStoryboard.instantiateViewController(withIdentifier: MAIN_TAB_BAR_IDENTIFIER)
        }else{
            openVC = mainStoryboard.instantiateViewController(withIdentifier: LOGIN_VC_IDENTIFIER)
        }
        self.window?.rootViewController = openVC
        self.window?.makeKeyAndVisible()
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

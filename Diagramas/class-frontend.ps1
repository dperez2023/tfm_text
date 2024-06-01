@startuml

title Front-end Class Diagram

class ApplianceConfiguration {
  int position
  Bool expanded
  Map<String:String> configuration
  void setConfiguration() 
}

class ApplianceCategory {
  String name
  String id
  void setCategory()
  void loadCategories()
}

enum StateType {
  String Synced
  String Failed
}

class State {
  StateType type
  Date lastUpdate
  void updateState()
}

StateType o-- State

class Appliance {
  ApplianceCategory category
  State state
  String name
  String ipAddress
  Map<String:dynamic> additionalFields
  List<ApplianceConfiguration> config
  Map<String:dynamic> configFields
  void defineSections()
  void setCategory(ApplianceCategory category)
}

ApplianceCategory o-- Appliance
ApplianceConfiguration o-- Appliance
State o-- Appliance

class ApplianceManagement {
  Appliance appliance
  Bool updateConfiguration(ApplianceConfiguration newConfig)
  List<Recommendation> getRecommendations()
  List getEnviromentalHistory()
  List getConsumptionHistory()
}

Appliance o-- ApplianceManagement

class ApplianceOnboardingPage {
  Appliance newAppliance
  List<Category> getCategories()
  void registerAppliance()
}

Appliance o-- ApplianceOnboardingPage

class AppliancesPage {
  List<Appliance> appliances
  Bool remove(Appliance appliance)
  Bool sync(Appliance appliance)
  void createNew()
}

Appliance o-- AppliancesPage

class ApplianceDetailPage {
  ApplianceManagement managedAppliance
  void createSections()
}

ApplianceManagement o-- ApplianceDetailPage

enum EnergySource {
    String national
    String nonRenewable
    String renewable
    String mix
}

enum EnergyPrice {
    String market
    String fixedDaily
    String fixedHourly
    String none
}

class EnergyPreferences {
    EnergySource source
    EnergyPrice price
    Double percentage
}

EnergySource o-- EnergyPreferences
EnergyPrice o-- EnergyPreferences

class User {
    SecureString token
    List<EnergyPreferences> preferences
    void retrieveToken()
    void register(String user, SecureString password)
    void login(String user, SecureString password)
    void login(SecureString token)
}

EnergyPreferences o-- User

class UserLoginPage {
   void loginUser(String user, SecureString password)
   void loginWithToken()
}

User o-- UserLoginPage

class UserRegistrationPage {
   void registerUser(String user, SecureString password)
}

User o-- UserRegistrationPage

class NetworkManager {
    Future<NetworkResponse> request()
}

NetworkManager o-- ApplianceConfiguration
NetworkManager o-- User
NetworkManager o-- ApplianceCategory
NetworkManager o-- State

@enduml
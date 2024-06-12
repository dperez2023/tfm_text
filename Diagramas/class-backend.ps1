@startuml

title Back-end Class Diagram

enum NetworkOperationType {
    String scheduledRequest
    String onDemandRequest
    String activeEndpointRequest
}

class NetworkManager {
    Future<NetworkResponse> scheduledRequest()
    Future<NetworkResponse> onDemandRequest()
    Future<NetworkResponse> activeEndpointRequest(String endpoint, Map<String:dynamic> fields)
}

class User {
    SecureString token
    SecureString password
    String email
}

class UserManager {
   User login(String email, SecureString password)
   User login(SecureString token)
   Bool register(User user)
}

enum ModelManagerType {
    String EnergyManager
    String AppliancesModelManager
    String UserModelManager
    String DeviceModelManager
}

enum DatabaseOperationType {
    String create
    String read
    String update
    String delete
}

enum IntegratorOperationType {
    String add
    String forceSync
    String remove
    String modifyFrequency
}

enum DeviceManagerType {
    String personalizationManager
    String integratorManager
}

class ModelManager {
    ModelManagerType type
    void resolveManager()
    Future<Result> operateDatabase(DatabaseOperationType type, Map<String:dynamic> fields)
    Future<Response> operateNetwork(NetworkOperationType type, Map<String:dynamic> fields)
}

class DeviceManager {
    DeviceManagerType type
    Future<>Response> operateIntegrator(IntegratorOperationType type, Map<String:dynamic> fields)
    Future<Result> updatePersonalization(Map<String:dynamic> newValue)
}

class DeviceDataGenerator {

}

class GeneratorManager {
   void getEnergyValues(device: Device, range: [Date, Date])
   void getAppliances 
}

ModelManager o-- GeneratorManager
DatabaseOperationType o-- ModelManager
NetworkOperationType o-- ModelManager
IntegratorOperationType o-- DeviceManager
ModelManagerType o-- ModelManager
ModelManager o-- DeviceManager
DeviceManagerType o-- DeviceManager

ModelManager o-- UserManager
NetworkManager o-- ModelManager


@enduml
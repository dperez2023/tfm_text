@startuml
actor Tenant
participant "Appliance Environmental History" as AEH
participant "Environmental Impact Generator" as EIG
participant "Generator Manager" as GM
participant "Energy Model Manager" as EM

Tenant -> AEH: Request Environmental Impact for an appliance
AEH -> EIG: HTTPS request for data
EIG -> GM: Request enviromental impact model for an appliance
GM -> EM: Request available energy pollution and consumption data
EM -> EM: Generates energy pollution and consumption data
EM -> GM: Returns energy pollution and consumption data
GM -> EIG: Returns energy poluution and consumption model for an appliance if exists
EIG -> AEH: Returns response with data
AEH -> Tenant: Displays response formatted for UI

@enduml

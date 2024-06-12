@startuml
actor Tenant
participant "Appliance Environmental History" as AEH
participant "Environmental Impact Generator" as EIG
participant "Generator Manager" as GM
participant "Energy Model Manager" as EM

Tenant -> AEH: Request Environmental Impact for an appliance
activate AEH
AEH -> EIG: HTTPS request for data
activate EIG
EIG -> GM: Request enviromental impact model for an appliance
activate GM
GM -> EM: Request available energy pollution and consumption data
activate EM
EM -> EM: Generates energy pollution and consumption data
EM -> GM: Returns energy pollution and consumption data
deactivate EM

GM -> GM: Generate model
GM -> EIG: Returns energy polution and consumption model for an appliance if exists
deactivate GM
EIG -> AEH: Returns response with data
deactivate EIG
AEH -> Tenant: Displays response formatted for UI
deactivate AEH

@enduml

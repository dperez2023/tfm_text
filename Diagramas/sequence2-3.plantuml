@startuml
actor Tenant
participant "Appliance Environmental History" as AEH
participant "Environmental Impact Generator" as EIG
participant "Energy Model Manager" as EM

Tenant -> AEH: Request Environmental Impact for an appliance
activate AEH
AEH -> EIG: HTTPS request for data
activate EIG
EIG -> EM: Request available energy pollution and consumption data
activate EM
EM -> EM: Generates energy pollution and consumption data
EM -> EIG: Returns energy pollution and consumption data
deactivate EM
EIG -> EIG: Generate environmental impact model
EIG -> AEH: Returns response with data
deactivate EIG
AEH -> Tenant: Displays response formatted for UI
deactivate AEH

@enduml

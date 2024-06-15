@startuml
actor Tenant
participant "Appliance Consumption History" as ACH
participant "Consumption Generator" as GM
participant "Energy Model Manager" as EM

Tenant -> ACH: Request Consumption for an appliance
activate ACH
ACH -> GM: HTTPS request for data
activate GM
GM -> EM: Request available energy consumption data
activate EM
EM -> EM: Generates energy consumption data
EM -> GM: Returns energy consumption data
deactivate EM
GM -> ACH: Returns consumption model for an appliance
deactivate GM
ACH -> Tenant: Displays response formatted for UI
deactivate ACH

@enduml

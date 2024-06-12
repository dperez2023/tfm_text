@startuml
actor Tenant
participant "Appliance Consumption History" as ACH
participant "Consumption Generator" as CG
participant "Generator Manager" as GM
participant "Energy Model Manager" as EM

Tenant -> ACH: Request Consumption for an appliance
ACH -> CG: HTTPS request for data
CG -> GM: Request consumption model for an appliance
GM -> EM: Request available energy consumption data
EM -> EM: Generates energy consumption data
EM -> GM: Returns energy consumption data
GM -> CG: Returns consumption model for an appliance if exists
CG -> ACH: Returns response with data
ACH -> Tenant: Displays response formatted for UI

@enduml

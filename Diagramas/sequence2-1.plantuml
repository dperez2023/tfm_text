@startuml
actor Tenant
participant "Appliance Recommendation" as AR
participant "Recommendation Generator" as GM
participant "Energy Model Manager" as EM
participant "Appliances Model Manager" as AMM

Tenant -> AR: Request Recommendations for an appliance
activate AR
AR -> GM: HTTPS request for data

alt Previous simulation data is available
    group Previous simulation data is available
        activate GM
        GM -> GM: Gets existing simulation model
    end

else No simulation data available
    group No simulation data available
    activate GM
    GM -> EM: Request available energy consumption data
    activate EM
    EM -> EM: Generates energy consumption data
    EM -> GM: Returns energy consumption data
    deactivate EM
    GM -> AMM: Request available appliance data
    activate AMM
    AMM -> AMM: Generates appliance data
    AMM -> GM: Returns appliance data
    deactivate AMM
    GM -> GM: Determine enough data exists to run simulation
    GM -> GM: Runs simulation merging energy consumption by a appliance
    GM -> GM: Generates simulation model
end

GM -> AR: Returns recommendation model for an appliance
deactivate GM
AR -> Tenant: Displays response formatted for UI
deactivate AR

@enduml

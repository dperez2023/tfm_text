@startuml
actor Tenant
participant "Appliance Recommendation" as AR
participant "Recommendation Generator" as RG
participant "Generator Manager" as GM
participant "Energy Model Manager" as EM
participant "Appliances Model Manager" as AMM

Tenant -> AR: Request Recommendations for an appliance
AR -> RG: HTTPS request for data
RG -> GM: Request recommendation model for an appliance
GM -> EM: Request available energy consumption data
EM -> EM: Generates energy consumption data
EM -> GM: Returns energy consumption data
GM -> AMM: Request available appliance data
AMM -> AMM: Generates appliance data
AMM -> GM: Returns appliance data

alt Previous simulation data is available
    group Previous simulation data is available
        GM -> GM: Gets existing simulation model
    end

else No simulation data available
    group No simulation data available
    GM -> GM: Determine enough data exists to run simulation
    GM -> GM: Runs simulation merging energy consumption by a appliance
    GM -> GM: Generates simulation model
end

GM -> RG: Returns recommendation model for an appliance
RG -> AR: Returns response with data
AR -> Tenant: Displays response formatted for UI

@enduml

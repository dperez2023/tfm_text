@startuml
actor Tenant
participant "User Login" as UL
participant "User Manager" as UM
participant "Appliance Registration" as AO
participant "Integrator Manager" as IM
participant "Device Model Manager" as DMM
participant "Appliance Model Manager" as AMM

UL -> Tenant: Display Login page
Tenant -> UL: Submit login credentials
UL -> UM: Request credentials validation
UM -> UM: validateCredentials()
UM -> UL: Authentication successful
UL -> AO: Redirects to devices validation
AO -> IM: Request registered devices list
IM -> IM: getRegisteredDevices()
IM -> AO: Returns empty devices list
AO -> Tenant: Display Application Onboarding Page
Tenant -> AO: Submit new appliance information
AO -> AO: updateNewAppliance()
AO -> IM: Validate sync with appliance
IM -> IM: ValidateSync()
IM -> DMM: Save New Appliance for User
DMM -> DMM: SaveAppliance()
DMM -> IM: Saved successfully
IM -> AO: Appliance succesfully synced
AO -> Tenant: Display Label Identification Page
Tenant -> AO: Submit appliance label
AO -> AO: updateNewAppliance()
AO -> Tenant: Display Confirmation Page
Tenant -> AO: Submit confirmed information
AO -> IM: Finalize new appliance save
IM -> DMM: Save Appliance with complete information
DMM -> DMM: SaveAppliance()
DMM -> AMM: Save New Appliance
AMM -> AMM: SaveAppliance()
AMM -> DMM: Succesfully Saved
DMM -> IM: Succesfully updated
IM -> AO: Notify new appliance added
AO -> Tenant: Display sucess message


@enduml

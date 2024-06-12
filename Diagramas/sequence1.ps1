@startuml
actor Tenant
participant "User Login" as UL
participant "User Manager" as UM
participant "Appliance Registration" as AO
participant "Devices List" as DL
participant "Integrator Manager" as IM
participant "Integrator Scheduler" as IS
participant "Authentication Manager" as AM
participant "Sync Device" as SD
participant "Device Model Manager" as DMM
participant "Appliance Model Manager" as AMM

UL -> Tenant: Display Login page
Tenant -> UL: Submit login credentials
UL -> UM: Request credentials validation
UM -> UM: validateCredentials()
UM -> UL: Authentication successful
UL -> AO: Redirects to devices validation
AO -> DL: Request registered devices list
DL -> DMM: getRegisteredDevices()
DMM -> DL: Returns registered devices
DL -> AO: Returns empty devices list
AO -> Tenant: Display Application Onboarding Page
Tenant -> AO: Submit new appliance information
AO -> AO: updateNewAppliance()
AO -> IM: Validate sync with appliance
IM -> IS: Validate device sync
IS -> AM: Get Authentication token
AM -> AM: Retrieve token from Service
AM -> IS: Return authentication token
IS -> SD: Validate sync device with token
SD -> SD: Get Energy Usage from device
SD -> IS: Confirm sync validation of device
IS -> IM: Device synced successfully
IM -> AO: Validation succeeded
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
IM -> IS: Notify new appliance added
IS -> IS: Schedule syncing for new appliance
IS -> AM: Save appliance token
AO -> Tenant: Display sucess message


@enduml

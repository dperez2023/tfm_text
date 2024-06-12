@startuml
actor Tenant
participant "User Login" as UL
participant "User Manager" as UM
participant "Appliance Registration" as AO
participant "Appliances Generator" as DL
participant "Device Manager" as IM

participant "Integrator Scheduler" as IS
participant "Authentication Manager" as AM
participant "Sync Device" as SD
participant "Device Model Manager" as DMM
participant "Appliance Model Manager" as AMM

UL -> Tenant: Display Login pag
activate UL
Tenant -> UL: Submit login credentials
UL -> UM: Request credentials validation
activate UM
UM -> UM: validateCredentials()
UM -> UL: Authentication successful
deactivate UM
UL -> AO: Redirects to devices validation
deactivate UL
activate AO
AO -> DL: Request registered devices list
activate DL
DL -> IM: getRegisteredDevices()
activate IM
IM -> IM: Generate registered devices list
IM -> DL: Returns registered devices
deactivate IM
DL -> AO: Returns empty devices list
deactivate DL

AO -> Tenant: Display Application Onboarding Page
Tenant -> AO: Submit new appliance information
AO -> AO: Create new appliance
AO -> IM: Validate sync with device
activate IM
IM -> IS: Validate device sync
activate IS
IS -> AM: Get Authentication token
activate AM
AM -> AM: Retrieve token from Service
AM -> IS: Return authentication token
deactivate AM
IS -> SD: Validate sync device with token
activate SD
SD -> SD: Get Energy Usage from device
SD -> IS: Confirm sync validation of device
deactivate SD
IS -> IM: Device synced successfully
deactivate IS
IM -> DMM: Save New Device for User
activate DMM
DMM -> DMM: Save Device
DMM -> IM: Saved successfully
deactivate DMM
IM -> AO: Validation succeeded
deactivate IM
AO -> Tenant: Display Label Identification Page
Tenant -> AO: Submit appliance label
AO -> AO: updateNewAppliance()
AO -> Tenant: Display Confirmation Page
Tenant -> AO: Submit confirmed information
AO -> IM: Finalize new appliance save
activate IM
IM -> AMM: Save Appliance with complete information
activate AMM
AMM -> AMM: Save Appliance
AMM -> IM: Succesfully saved
deactivate AMM
IM -> IS: Notify new device added
activate IS
IS -> IS: Schedule syncing for new device
IS -> AM: Save device token
activate AM
AM -> AM: Save token
AM -> IS: Return token save
deactivate AM
IS -> IM: Return confirmation
deactivate IS
IM -> AO: Notify new appliance added
deactivate IM
AO -> Tenant: Display sucess message
deactivate AO


@enduml

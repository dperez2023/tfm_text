@startuml
!theme mars

title 'Energy Efficiency: Recommender System for Appliance Usage' Architecture

package "Mobile Front-End Application" {
   package "Appliance Detail View" {
     [Appliance Recommendations]
     [Appliance Consumption History]
     [Appliance Environmental History]
   }
   
   package "User View" {
     [User Login]
     [User Registration]
   }

   package "Appliances View" {
     [Appliance Registration]
     [Appliance Management]
     [Appliance List]
   }
}







package "Back-end" {
  package "Device Data Generator" {
     [Recommendation Generator]
     [Consumption Generator]
     [Environmental Impact Generator]
     [Devices List]
  }

  [User Manager]
  [Generator Manager]

  package "Data Model Manager" {
    [User Model Manager]
    [Energy Model Manager]
    [Device Model Manager]
    [Appliances Model Manager]
  }

  package "Device Manager" {
     [Integrator Manager]
     [Personalization Manager]
  }

  package "Network Manager" {
    [On Demand Requests]
    [Scheduled Requests]
  }

  database "General Database" {
    [User Data]
    [Device Data]
    [Energy Data]
    [Appliance Data]
  }

  [Generator Manager] -d-> [Energy Model Manager]
  [Generator Manager] -d-> [Device Model Manager]
}

cloud "Energy Data Service" {
  [Energy Mix]
  [Energy Mix Pollution]
  [Energy Prices]
}

cloud "Appliances Data Service" {
  [Categories List]
  [Appliances By Model Search]
  [Appliances by Categories]
}

[Energy Model Manager] <-- [On Demand Requests] : Data mapping from services
[Energy Model Manager] <-- [Scheduled Requests] : '                    '

[Energy Model Manager] --> [Energy Data] : Persistency of data model
[Device Model Manager] -d-> [Device Data] : '                    '
[User Model Manager] -d-> [User Data] : '                    '
[User Manager] -d-> [User Model Manager]
[User Model Manager] <-d-> [Integrator Manager]

[Scheduled Requests] -l-> [Energy Mix Pollution]
[Scheduled Requests] -l-> [Energy Mix]
[Scheduled Requests] -l-> [Energy Prices]

[On Demand Requests] -l-> [Appliances By Model Search]
[On Demand Requests] -d-> [Appliances by Categories]
[On Demand Requests] -d-> [Categories List]
[On Demand Requests] -d-> [Appliances Model Manager]

[User Manager] <-- [User Login] : Login session 
[User Manager] <-- [User Registration] : User registration
[Device Model Manager] <--> [Integrator Manager] : '                    '

[Recommendation Generator] <-u- [Appliance Recommendations]
[Consumption Generator] <-u- [Appliance Consumption History]
[Environmental Impact Generator] <-u- [Appliance Environmental History]
[Devices List] <-u- [Appliance List]

[Integrator Manager] <-u- [Appliance Registration] : Device sync confirmation
[Personalization Manager] <-u-> [Appliance Management]
[Personalization Manager] -u-> [Device Model Manager]

[Recommendation Generator] -d-> [Generator Manager]
[Consumption Generator] -d-> [Generator Manager]
[Environmental Impact Generator] -d-> [Generator Manager]
[Devices List] -d-> [Device Model Manager]

[Generator Manager] -d-> [Appliances Model Manager]
[Appliances Model Manager] -d-> [Appliance Data]
[Appliances Model Manager] <-d- [Device Model Manager]





package "Integrator Link" {
  [Authentication Manager]
  [Integrator Scheduler]
  [Sync Device]

  database "Device Database" {
  [Authentication Tokens]
  [Devices Configuration]
}
}

cloud "Device" {
  [Get Energy Usage]
}

cloud "Device Credentials Service" {
  [Retrieve Token]
}

[Sync Device] --> [Get Energy Usage]
[Integrator Scheduler] --> [Sync Device]

[Retrieve Token] <-d- [Authentication Manager]
[Authentication Manager] --> [Authentication Tokens]
[Integrator Scheduler] --> [Devices Configuration]

[Integrator Manager] <-d-> [Integrator Scheduler]
[Integrator Scheduler] <-d-> [Authentication Manager]

[On Demand Requests] -d-> [Retrieve Token] : User validation
[User Model Manager] -d-> [On Demand Requests]
@enduml
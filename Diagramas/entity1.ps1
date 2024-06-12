@startuml
!define TABLE

entity EnergyUnit {
  + id
  --
  date
  time
  source_mix
  source_price
  source_price_currency
  consumed_kwh
}

entity Energy {
    + id_appliance
    + id
    --
    date
    energyUnits
}

entity User {
  + id
  --
  email
  authentication_token
  registration_date
  personalized_fields
  energy_sources
}

entity Appliance {
  + id
  --
  syncStatus
  name
  brand
  model
  category
  category_fields
}

entity Device {
  + id
  --
  ip_address
}

User ||--o{ Device : "has"
Device ||--o{ Appliance : "can be associated with"
Appliance ||--o{ Energy : "has"
Energy ||--o{ EnergyUnit : "has"

@enduml

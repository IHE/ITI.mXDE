Instance:   ex-IHE-bloodPressure-0
InstanceOf: http://hl7.org/fhir/StructureDefinition/bp
Title: "Example of a blood pressure R4 observation, minimal"
Description:      "holding typical values"
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code.coding[BPCode] = LOINC#85354-9 
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* component[SystolicBP].code.coding[SBPCode] = LOINC#8480-6 "Systolic blood pressure"
* component[SystolicBP].valueQuantity = 140.0 'mm[Hg]' "mm[Hg]"
* component[DiastolicBP].code.coding[DBPCode] = LOINC#8462-4 "Diastolic blood pressure"
* component[DiastolicBP].valueQuantity = 90.0 'mm[Hg]' "mm[Hg]"
* note.text = "a minimal blood pressure"
* encounter = Reference(Encounter/ex-encounter)


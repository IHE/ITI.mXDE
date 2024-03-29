Instance:   ex-weight
InstanceOf: http://hl7.org/fhir/StructureDefinition/bodyweight
Title: "Example of a bodyWeight R4 observation"
Description: """
Sample for demonstration purposes of a common weight Observation
- marked as compliant with IHE.ToDo.bodyWeight profile
- marked as test data
- status of final
- category vital-signs
- code of loinc body weight
- subject of the example patient
- effective time of December 25th, 2004
- weight 185 pounds
- note: a bit heavy
"""
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code = http://loinc.org#29463-7
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* effectiveDateTime = 2004-12-25T23:50:50-05:00
* valueQuantity = 185 '[lb_av]' "pounds"
* note.text = "a bit heavy"
* encounter = Reference(Encounter/ex-encounter)




Instance:   ex-weight-2
InstanceOf: http://hl7.org/fhir/StructureDefinition/bodyweight
Title: "Example of an valid FHIR bodyWeight R4 observation, but not compliant with the profile"
Description: """
Sample for demonstration purposes of a common weight Observation.
- Given that this is not compliant, it is thus not declaring that it is compliant, it is just an Observation
- marked as test data
- status of final
- category of vital-signs
- code of loinc 29463-7 and 3141-9
- also code of snomed 27113001
- subject of the example patient
- linked to an encounter
- effectiveDateTime = March 28, 2016
- weight 280 lbs
- note: a bit heavy, about 280 lbs
"""
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* meta.security[+] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N
* status = #final
* category[VSCat] = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs
* code.text = "body weight"
* code.coding[BodyWeightCode] = LOINC#29463-7
* subject = Reference(Patient/ex-patient)
* performer = Reference(Practitioner/ex-author)
* encounter = Reference(Encounter/example)
* effectiveDateTime = 2016-03-28
* valueQuantity = 280 '[lb_av]' "pounds"
* note.text = "a bit heavy, about 280 lbs"
* encounter = Reference(Encounter/ex-encounter)

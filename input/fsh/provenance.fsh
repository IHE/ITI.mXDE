Profile: IHE_mXDE_Provenance
Parent: Provenance
Id: IHE.ITI.mXDE.Provenance
Title: "mXDE Provenance"
Description: """
Provenance profile for use in mXDE when the data-elements (Resources pointed to by target) come from an XDS or MHD document. There will be one Provenance record for each document that has been decomposed by mXDE.

- policy will be `urn:ihe:iti:mxde:2023:document-provenance-policy` to indicate mXDE produced provenance
- target will point at ALL of the data found within the document
  - some target resources will be only found in the document
  - some target resources may have been found in other documents
- activity will be `Derivation` to indicate the target resources were derived from documents
- recorded will indicate when the document was decomposed into these target resources
- agent will identify the software/service that implements the decomposition of the documents
  - this agent would be type `assembler` as it has assembled the FHIR Resources
  - this agent should describe the version of the software so as to understand data translation rules used
  - this agent may be a Resource or may be Contained depending on environment policy
- other agent elements may be included
- entity will point at the DocumentReference for the document from which the target data came
"""
* modifierExtension 0..0
* target ^short = "The FHIR Resource elements found in the Document"
* policy 1..1
* policy = "urn:ihe:iti:mxde:2023:document-provenance-policy"
* activity 1..1
* activity = http://hl7.org/fhir/w3c-provenance-activity-type#Derivation
* agent ^slicing.discriminator.type = #value
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent contains theAssembler 1..1
* agent[theAssembler] ^short = "The Assembler of the FHIR Resources"
* agent[theAssembler].type 1..
* agent[theAssembler].type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
* agent[theAssembler].who 1..1
* agent[theAssembler].who only Reference(Device)
* agent[theAssembler].who ^type.aggregation[+] = #contained
* agent[theAssembler].who ^type.aggregation[+] = #referenced
* entity 1..1
* entity ^short = "The DocumentReference from which these resources came"
* entity.role = #source
* entity.what only Reference(DocumentReference)
* entity.agent 0..0

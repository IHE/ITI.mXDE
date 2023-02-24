Instance: IHE.mXDE.DataElementProvenanceConsumer
InstanceOf: CapabilityStatement
Title: "mXDE Data Element Provenance Consumer Actor"
Usage: #definition
Description: """
CapabilityStatement for mXDE Data Element Provenance Consumer Actor

Accesses documents to extract data elements and create the links to the data elements' source documents.
"""
* description = """
CapabilityStatement for mXDE Data Element Provenance Consumer
"""
* url = "https://profiles.ihe.net/ITI/mXDE/CapabilityStatement/IHE.mXDE.DataElementProvenanceConsumer"
* name = "IHE_mXDE_DataElementProvenanceConsumer"
* title = "mXDE Data Element Provenance Consumer Actor"
* status = #active
* experimental = false
* date = "2023-02-10"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* imports[+] = "https://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentConsumer"
* imports[+] = "http://profiles.ihe.net/ITI/PDQm/CapabilityStatement/IHE.PDQm.client"
* imports[+] = "https://profiles.ihe.net/ITI/PIXm/CapabilityStatement/IHE.PIXm.Consumer"
* imports[+] = "https://profiles.ihe.net/ITI/BALP/CapabilityStatement/IHE.BALP.AuditCreator"
* rest
  * mode = #client
  * documentation = "mXDE Data Element Provenance Consumer Actor"
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Provenance
    * documentation = "record"
    * supportedProfile[+] = "https://profiles.ihe.net/ITI/mXDE/IHE.ITI.mXDE.Provenance"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * interaction[+].code = #create
    * interaction[+].code = #update


Instance: IHE.mXDE.DataElementExtractor
InstanceOf: CapabilityStatement
Title: "mXDE Data Element Extractor Actor"
Usage: #definition
Description: """
CapabilityStatement for mXDE Data Element Extractor Actor

Uses the provided links from data elements to source documents to obtain broader clinical context in which the data elements were recorded.
"""
* description = """
CapabilityStatement for mXDE Data Element Extracor
"""
* url = "https://profiles.ihe.net/ITI/mXDE/CapabilityStatement/IHE.mXDE.DataElementExtractor"
* name = "IHE_mXDE_DataElementExtractor"
* title = "mXDE Data Element Extractor Actor"
* status = #active
* experimental = false
* date = "2023-02-10"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* imports[+] = "https://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentConsumer"
* imports[+] = "http://profiles.ihe.net/ITI/PDQm/CapabilityStatement/IHE.PDQm.client"
* imports[+] = "https://profiles.ihe.net/ITI/PIXm/CapabilityStatement/IHE.PIXm.Consumer"
* imports[+] = "https://profiles.ihe.net/ITI/BALP/CapabilityStatement/IHE.BALP.AuditCreator"
* rest
  * mode = #client
  * documentation = "mXDE Data Element Extractor Actor"
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Provenance
    * documentation = "record"
    * supportedProfile[+] = "https://profiles.ihe.net/ITI/mXDE/IHE.ITI.mXDE.Provenance"
    * interaction[+].code = #search-type
    * interaction[+].code = #read
    * interaction[+].code = #create
    * interaction[+].code = #update

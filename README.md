## Status
This is the source for the IHE ITI Mobile Cross-Enterprise Document Data Element Extraction(mXDE) Implementation Guide.


Release - https://profiles.ihe.net/ITI/mXDE 

CI Build - http://build.fhir.org/ig/IHE/ITI.mXDE/branches/master/index.html

For todo, issues, and changes review the [issues page in the build](http://build.fhir.org/ig/IHE/ITI.mXDE/branches/master/issues.html)

## Question

- Why does mXDE need to add the mXDE actor to ITI-43? Seems it can just integrate the Document Consumer actor. What is wrong with mXDE requiring a grouping with Document Consumer? This would also seem to meet MHD vs XDS vs XCA need. Is the reason that one deployment model wants to decompose the documents upon publication rather than being triggered by a QEDm query?

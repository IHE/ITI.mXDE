<div markdown="1" class="stu-note">
This section modifies other IHE profiles or the General Introduction appendices and is not a part of the Mobile Cross-Enterprise Document Data Element Extraction (mXDE) Profile. The content here will be incorporated into the target narrative at a future time, usually when the mXDE Profile goes normative.
</div>

## IHE Technical Frameworks General Introduction Appendix A: Actors

|------------------------------------------------|
| Editor, add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
|Date Element Extractor | The Data Element Extractor extracts data elements from documents along with the associated provenance information that traces back to the source document. |
|Data Element Provenance Consumer | The Data Element Provenance Consumer uses the provenance information associated with data elements to access the source information. |
{:.grid .table-striped}



## IHE Technical Frameworks General Introduction Appendix B: Transactions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                    | Definition                                                                              |
| ------------------------------ | --------------------------------------------------------------------------------------- |
| none |  |
{:.grid .table-striped}

## IHE Technical Frameworks General Introduction Appendix D: Glossary

|------------------------------------------------|
| Editor, add the following new or modified terms to the [IHE Technical Frameworks General Introduction Appendix D](https://profiles.ihe.net/GeneralIntro/ch-D.html): |
{:.grid .bg-info}

| Term                         | Definition                                                    | Acronyms/Abbreviations | Synonyms    |
| ---------------------------- | --------------------------------------------------------------| -----------------------| ------------|
| none |  |
{:.grid .table-striped}



|------------------------------------------------------------|
| Editor: Please update Volume 2 [Retrieve Document Set \[ITI-43\]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html) Sections 3.43, 3.43.1 and 3.43.2 as follows.|
{:.grid .bg-info}

This section corresponds to transaction \[ITI-43\] of the IHE Technical
Framework. The Document Consumer, Document Repository and Initiating
Gateway Actors use transaction \[ITI-43\].

| Integration Profiles Using This Transaction                                |
|----------------------------------------------------------------------------|
| Cross-Enterprise Document Sharing-b (XDS.b)                                |
| Cross-Community Access (XCA)                                               |
| **<u>Mobile Cross-Enterprise Document Data Element Extraction (mXDE)</u>** |
{:.grid}

Actors that support the Asynchronous Web Services Exchange Option shall
support Asynchronous Web Services Exchange on all XDS.b transactions
they implement. Refer to ITI TF-2x: V.5 Synchronous and Asynchronous Web
Services Exchange for an explanation of Asynchronous Web Services
Exchange.

### 2:3.43.1 Scope

This transaction is used by the Document Consumer **<u>or by the Data Element Extractor</u>** to retrieve a set of documents from the Document
Repository or Initiating Gateway. The Document Consumer has already
obtained the XDSDocumentEntry uniqueId and the Document Repository
repositoryUniqueId from the Document Registry/Initiating Gateway by
means of the Registry Stored Query transaction.

### 2.43.2 Use Case Roles

**TO DO Add Figure**

**<u>XDS Actors:</u>**

> **Actor:** Document Consumer
>
> **Role:** Obtains document.
>
> **Actor:** Document Repository or Integrated Document
> Source/Repository
>
> **Role:** Provides documents.
>
> **Actor**: On-Demand Document Source
>
> **Role:** Creates documents in response to a request for retrieval of
> an on-demand document entry.

Within this transaction, the Document Repository and Integrated Document
Source/Repository Actors can be used interchangeably.

**<u>XCA Actors:</u>**

> **Actor:** Initiating Gateway
>
> **Role:** An Initiating Gateway which implements the XDS Affinity
> Domain Option retrieves a set of documents by using the Cross Gateway
> Retrieve transaction and/or a Retrieve Document Set transaction.

**<u>mXDE Actors:</u>**

> **<u>Actor: Data Element Extractor</u>**
>
> **<u>Role: Obtains documents.</u>**

**<u>The [Data Element Extractor](CapabilityStatement-IHE.mXDE.DataElementExtractor.html) obtains documents in the same manner as
the Document Consumer does. In this transaction, the requirements for
the Data Element Extractor are identical to those for the Document
Consumer.</u>**

|----------------------------------------------|
| Editor: Please update Figure 3.43.4-1 Interaction Diagram as follows.|
{:.grid .bg-info}

**TO DO: Add Interaction Diagram**

|------------------------------------------------------------|
| Editor: Please update Volume 2, Sections 3.43, 3.43.1 and 3.43.2 as follows. |
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

**<u>The Data Element Extractor obtains documents in the same manner as
the Document Consumer does. In this transaction, the requirements for
the Data Element Extractor are identical to those for the Document
Consumer.</u>**

|----------------------------------------------|
| Editor: Please update Figure 3.43.4-1 Interaction Diagram as follows.|
{:.grid .bg-info}

**TO DO: Add Interaction Diagram**
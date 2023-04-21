
The Mobile Cross-Enterprise Document Data Element Extraction (mXDE)
Profile provides the means to access data elements extracted from shared
structured documents. The profile enables the deployment of health data
exchange infrastructures where fine-grained access to health data
coexists and complements the sharing of coarse-grained documents and the
fine-grained data elements they contain.

This profile is based on the reality that health information sharing
relies on different granularities of exchange:

- **Document-Level Granularity:** share and access documents as a
    composition of various data elements to reflect the information
    known and produced during a care or administrative workflow step.
    This level of granularity is optimum to ensure that contained data
    has clarity of context in care delivery and reflects source
    attestation (responsibility) of clinical data shared.

- **Data Element-Level Granularity:** access a specific type of data
    element (e.g., vital signs, medications, etc.). This level of
    granularity is optimum when the list of data elements relevant to a
    “time span” or a set of encounters is of interest. Examples of
    situations where this level of granularity may be optimum include
    access to a list of allergies at the time of medication
    dispensation, or information reconciliation at the time of hospital
    admission.

Each granularity level delivers unique benefits and this profile
provides efficient access to both levels.

This profile defines rules to ensure consistency and traceability of
information used for clinical decisions. When a data element is accessed
by a Clinical Data Consumer, identifiers from that data element can be
used to access one or more documents in which this data element was
originally recorded, providing a valuable broader clinical context.

**Profile Introduction and Concepts**

The sharing of documents across community, regional, or national health
information exchange platforms is one of the fundamental paradigms of
exchange of health records. Currently, these kinds of records are often
shared using IHE profiles such as
[Cross-Enterprise Document Sharing (XDS)](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html),
Cross-Community Document Access (XCA), and
[Mobile access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html).

However, many health information exchange platforms that support
document sharing are considering extending their services by offering
cross-document data aggregation. This can be addressed, in part, with
the access to documents dynamically created with the
[On-Demand Document Source in the XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.7) Profile,
and, in part, with profiles such as PCC’s
[Query for Existing Data for Mobile (QEDm)](https://profiles.ihe.net/PCC/QEDm/index.html) Profile that supports the
granular access to specific data elements (e.g., list of medications,
list of allergies).

The mXDE Profile takes it one step further. It allows an integrated
approach to health records by using existing services from the IHE
profiles mentioned above.

The mapping of the document to data elements is outside the scope of the
mXDE Profile. It needs to be specified for each deployment based on the
specific document content and data elements managed.

Figure 1:45-1 conceptually depicts the sharing of health information
supported by mXDE, highlighting that health information could be shared
at different levels of granularity: Document-Level Granularity (shown
with the green documents) and the Data Element-Level Granularity (shown
with orange hexagons). The health data exchange infrastructure depicted
as a “hub” in the middle is providing a location service to access both
document-level or data element-level health data in a patient-centric
manner.

<figure>
<img alt="mXDE environment and multilevel granularity access to health information" src="451.png" width="100%">
<figcaption><b>Figure 1:45-1: mXDE environment and multilevel granularity access to health information</b></figcaption>
<br/>
</figure>

Figure 1:45-2 below, depicts a deployment of the mXDE Profile which can
support the environment in Figure 1:45-1 above. It illustrates one
possible combination of mXDE actors (Data Element Extractor and Data
Element Provenance Consumer) with actors and transactions from the MHD,
XDS and QEDm IHE Profiles.

<figure>
<img alt="mXDE Profile combining actors and transactions of other IHE Profiles" src="452.png" width="100%">
<figcaption><b>Figure 1:45-2: mXDE Profile combining actors and transactions of other IHE Profiles</b></figcaption>
<br/>
</figure>

- Document-Level Granularity “publication” is out of scope of this profile but may be performed using the [XDS Provide and Register \[ITI-41\]](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.2.1) transaction, the [MHD Provide Document Bundle \[ITI-65\]](https://profiles.ihe.net/ITI/MHD/ITI-65.html) transaction or other means.
- Data Element-Level Granularity access is central to mXDE and is discussed in Section 1:45.1. The Provenance information, returned with each fine-grained data element in the Query responses, allows identification of the document from which the fine-grained data element was extracted.
- Document-Level Granularity “consumption” is central to mXDE and is discussed in Section 1:45.1. Using the identification of the document from which a data element was extracted, it is possible to access the clinical context in which that data element was observed.

This profile supports a variety of deployment models. Two of those are discussed in Section 1:45.7

## 1:45.1 mXDE Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in
this implementation guide. Further information about actor and transaction definitions can be found in the IHE Technical Frameworks General Introduction [Appendix A: Actors](https://profiles.ihe.net/GeneralIntro/ch-A.html) and [Appendix B: Transactions](https://profiles.ihe.net/GeneralIntro/ch-B.html).

The mXDE Profile includes two actors:

- The **Data Element Extractor Actor** accesses documents to extract data elements and create the links to the data elements’ source documents.
- The **Data Element Provenance Consumer Actor** uses the provided links from data elements to source documents to obtain broader clinical context in which the data elements were recorded.

Three alternative groupings of actors are supported by mXDE. Each one is depicted by a separate figure below that shows the actors directly involved in the mXDE Profile and the relevant transactions between them. These groupings are further specified in Section 1:45.3.

Grouped actors are shown with conjoined boxes. The actors shown with dotted line boxes are specified by other IHE profiles.

<figure>
<img alt="mXDE Actor Diagram with QEDm and MHD" src="4511.png" width="100%">
<figcaption><b>Figure 1:45.1-1: mXDE Actor Diagram with QEDm and MHD</b></figcaption>
<br/>
</figure>

<figure>
<img alt="mXDE Actor Diagram with QEDm and XDS" src="4512.png" width="100%">
<figcaption><b>Figure 1:45.1-2: mXDE Actor Diagram with QEDm and XDS</b></figcaption>
<br/>
</figure>

<figure>
<img alt="mXDE Actor Diagram with QEDm, XDS and MHD" src="4513.png" width="100%">
<figcaption><b>Figure 1:45.1-3: mXDE Actor Diagram with QEDm, XDS and MHD</b></figcaption>
<br/>
</figure>

Table 1:45.1-1 lists the transactions for each actor directly involved in
the mXDE Profile.

**Table 1:45.1-1: mXDE Profile - Actors and Transactions**

| Actors List                      | Transactions                      | Optionality    | Reference       |
|----------------------------------|-----------------------------------|----------------|-----------------|
| Data Element Extractor           | Retrieve Document Set \[ITI-43\]  | O (See Note 1) | ITI TF-2b: 3.43 |
| Data Element Provenance Consumer | None                              | \-             | \-              |
{:.grid .table-striped}

*Note 1: This transaction is required if the Data Element Extractor supports the XDS Document Registry Integration Option. See Section 1:45.2.1.1.*

### 1:45.1.1 Actor Descriptions and Actor Profile Requirements

Most requirements are documented in ITI TF-2: Transactions. This section documents any additional requirements on mXDE actors.

#### 1:45:1.1.1 Data Element Extractor

Defined in [Data Element Extractor](CapabilityStatement-IHE.mXDE.DataElementExtractor.html) requirements CapabilityStatement:

- Shall access documents, through:
- a grouped [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3) and the [Retrieve Document Set \[ITI-43\]](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.2.7) transaction, or
  - a grouped [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder).
- Shall extract the data element information from the retrieved documents
- Shall obtain the provenance information and create a [profiled Provenance Resource](StructureDefinition-IHE.ITI.mXDE.Provenance.html) associated with extracted data elements
- Shall make the Provenance Resource available to the grouped PCC [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Source using the Document Provenance Option. This allows [provenance](StructureDefinition-IHE.ITI.mXDE.Provenance.html) information to be returned in its query responses along with the extracted data elements.

#### 1:45.1.1.2 Data Element Provenance Consumer

Definition in [Data Element Provenance Consumer](CapabilityStatement-IHE.mXDE.DataElementProvenanceConsumer.html) requirements CapabilityStatement:

- Shall be grouped with a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Consumer using the Document Provenance Option. The Clinical Data Consumer retrieves data elements together with the [Provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) through the Mobile Query Existing Data \[PCC-44\] transaction.
- Shall be capable of using the [Provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) returned in responses to access source documents through:
  - a grouped [XDS Document Consumer](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.2), or
  - a grouped [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer).

## 1:45.2 mXDE Actor Options

Options that may be selected for each actor in this implementation guide, if any, are listed in Table 1:45.2-1 below. Dependencies 
between options when applicable are specified in notes.

**Table 1:45.2-1: mXDE - Actors and Options**

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="header">
<th>Actor</th>
<th>Option Name</th>
<th>Reference</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="2">Data Element Extractor</td>
<td>XDS Document Registry Integration (Note 1)</td>
<td>Section 1:45.2.1.1</td>
</tr>
<tr class="even">
<td>MHD Document Responder Integration (Note 1)</td>
<td>Section 1:45.2.1.2</td>
</tr>
<tr class="odd">
<td rowspan="2">Data Element Provenance Consumer</td>
<td>XDS Document Consumer Integration (Note 2)</td>
<td>Section 1:45.2.2.1</td>
</tr>
<tr class="even">
<td>MHD Document Consumer Integration (Note 2)</td>
<td>Section 1:45.2.2.2</td>
</tr>
</tbody>
</table>

*Note 1: The actor shall implement at least one of the options: XDS Document Registry Integration or MHD Document Responder Integration*

*Note 2: The actor shall implement at least one of the options: XDS Document Consumer Integration or MHD Document Consumer Integration.*

### 1:45.2.1 Data Element Extractor Actor Options

#### 1:45.2.1.1 XDS Document Registry Integration

The support of this option by a Data Element Extractor enables:

- extracting data elements contained in documents stored in an [XDS Document Repository](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.4);
- tracking of [document provenance](StructureDefinition-IHE.ITI.mXDE.Provenance.html) for the extracted data elements through references to source documents managed by the [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3).

The Data Element Extractor that supports this option:

- shall be grouped with an [XDS.b Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3);
- shall make available data elements extracted from documents that are known to the Document Registry;
- shall be able to retrieve documents from an [XDS.b Document Repository](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.4) using the [Retrieve Document Set \[ITI-43\]](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html#3.43) transaction.

#### 1:45.2.1.2 MHD Document Responder Integration

The support of this option by a Data Element Extractor enables:

- extracting data elements contained in documents provided by the [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder);
- tracking of [document provenance](StructureDefinition-IHE.ITI.mXDE.Provenance.html) for the extracted data elements through references to source documents provided by the [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder).

The Data Element Extractor that supports this option:

- shall be grouped with an [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder);
- shall make available data elements extracted from documents that are known to the [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder);
- shall obtain documents from the grouped [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder).

### 1:45.2.2 Data Element Provenance Consumer Actor Options

#### 1:45.2.2.1 XDS Document Consumer Integration

The support of this option enables a Data Element Provenance Consumer to
access the referenced source documents managed by the [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3) and [Repositories](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.4).

The Data Element Provenance Consumer that supports this option:

- shall be grouped with an [XDS Document Consumer](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.2) and thus be capable of accessing the documents referenced by any [Provenance Resource](StructureDefinition-IHE.ITI.mXDE.Provenance.html).

#### 1:45.2.2.2 MHD Document Consumer Integration 

The support of this option enables a Data Element Provenance Consumer to
access the referenced source documents managed by the [MHD Document Responder](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133114-document-responder).

The Data Element Provenance Consume that supports this option:

- shall be grouped with an [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer) and thus be capable of accessing the documents referenced by any [Provenance Resource](StructureDefinition-IHE.ITI.mXDE.Provenance.html).

## 1:45.3 mXDE Required Actor Groupings

An actor from this profile (Column 1) shall implement all required
transactions for the grouped actor (Column 3) in the Required Actor
Groupings Table as shown below.

Note that each one of the three alternatives of actor diagrams specified
for the mXDE Implementation Guide in Section 1:45.1 has different required actor
groupings.

**Table 1:45.3-1: mXDE Profile - Required Actor Groupings**

<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<thead>
<tr class="header">
<th>mXDE Actor</th>
<th>Grouping Condition</th>
<th>Actor(s) to be grouped with</th>
<th>Reference</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="4">Data Element Extractor</td>
<td>Required</td>
<td>PCC QEDm / Clinical Data Source with the Document Provenance
Option</td>
<td><p>PCC TF-1: X.1.1.1</p>
<p>PCC TF-1: X.2.2.9 (Note 1)</p></td>
</tr>
<tr class="even">
<td>Required</td>
<td>ATNA / Secure Node or Secure Application</td>
<td>ITI TF-1: 9</td>
</tr>
<tr class="odd">
<td>If the MHD Document Responder Integration Option is supported.</td>
<td>MHD / Document Responder</td>
<td>ITI TF-1: 33 (Note 2)</td>
</tr>
<tr class="even">
<td>If the XDS Document Registry Integration Option is supported.</td>
<td>XDS / Document Registry</td>
<td>ITI TF-1: 10</td>
</tr>
<tr class="odd">
<td rowspan="3">Data Element Provenance Consumer</td>
<td>Required</td>
<td>PCC QEDm / Clinical Data Consumer with the Document Provenance
Option</td>
<td><p>PCC TF-1: X.1.1.2</p>
<p>PCC TF-1: X.2.1.9 (Note 1)</p></td>
</tr>
<tr class="even">
<td>If the MHD Document Consumer Integration Option is supported.</td>
<td>MHD / Document Consumer</td>
<td>ITI TF-1: 33 (Note 2)</td>
</tr>
<tr class="odd">
<td>If the XDS Document Consumer Integration Option is supported.</td>
<td>XDS / Document Consumer</td>
<td>ITI TF-1: 10</td>
</tr>
</tbody>
</table>

*Note 1: Currently in the PCC QEDm Trial Implementation Supplement*

*Note 2: Currently in the MHD Trial Implementation Supplement*

Section 1:45.5 describes some optional groupings that may be of interest
for security considerations and Section 1:45.6 describes some optional
groupings in other related profiles.

## 1:45.4 mXDE Overview

### 1:45.4.1 Concepts

See “Profile Introduction and Concepts” in Section 1:45.

### 1:45.4.2 Use Cases

The use case below assumes that every consumer device (mobile or not)
knows or discovers the patient identity. The patient identity could be
obtained through a transaction in an IHE Profile such as [PDQ](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html),
[PDQm](https://profiles.ihe.net/ITI/PDQm/index.html), [PIX](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html), or [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html), or it could simply be entered via some device
interface (RFID, Bar-Code, etc.) or user interface, or it could be
specified in a configuration setting (e.g., mobile PHR application).

#### 1:45.4.2.1 General Use Case

A human using a consumer device needs to discover the available
information of a certain patient and to retrieve the parts of interest
in order to get coarse and fine-grained data based on the patient
identity and on certain search criteria.

##### 1:45.4.2.1.1 General Use Case Description

A patient encounters his family physician who advises him to make an
appointment for a surgical procedure. Consequently, the family physician
produces and shares a Transfer of Care document in an 
[XDS Affinity Domain](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html). He also shares a Pharmacy Prescription document.

Following the encounter, the patient makes an appointment with the local
hospital for the intended surgery. He also picks up his prescribed
medication at the local pharmacy which results in the pharmacy sharing a
Pharmacy Dispensation document.

1. Back at home, the patient uses his smart phone to access the recent prescription and recently dispensed medications to review the dosage and timing for his medication. For this, the prescription information is accessed by the patient portal app on his smartphone. However, the patient’s condition worsens, resulting in an emergency hospitalization.
2. At the emergency department, the emergency physician urgently needs to stabilize the patient and seeks to obtain his current medication list (the medications prescribed and dispensed need to be extracted from at least two documents).
3. The emergency physician decides to complete the patient admission and to schedule the intended surgery. For this, he retrieves the Transfer of Care document.
4. At the surgery department the anesthesiologist, while preparing for the surgery, obtains the history of prescribed and dispensed medications and the list of known allergies (the allergies need to be extracted for the past ten years from all shared documents for the patient). At the conclusion of the hospital stay, the attending physician and other health professionals create and share the Discharge Summary document.
5. Back at home, the patient wants to review the Discharge Summary associated with his surgery. He opens the patient portal app on his smart phone, through which he:Queries the Document Registry to list the recent documents shared for him and retrieves the selected Discharge Summary. The patient can read the recommendations on discharge and the new pharmacy prescription including related dosage. Based on this information, he decides to consult the family physician again for clarification.
6. Later, in order to better evaluate the results, the family physician needs to check the improvements of patient health. The family physician uses his tablet to query and access all the patient’s vital signs and medications (directly as fine-grained data elements) with related [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html).
7. In order to reconstruct the patient’s history about the cured pathology, each time he finds relevant changes in the patient’s history, he uses the [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) to identify any original document and eventually retrieves it. The document in which the original data was initially shared makes him understand the context at that time (other findings, observations, etc.) to better evaluate the meaning of fine-grained information. This analysis helps the family physician to improve the care plan for the patient.

##### 1:45.4.2.1.2 Process Flow

Figure 1:45.2.1.2-1 illustrates the Use Case and assumes some possible
actor groupings based on the scenario described. In particular, it
assumes that a consumer application running on a mobile device (e.g.,
the patient’s smartphone and the family physician’s tablet) supports IHE
actors designed for mobile use including, but not limited to,
the [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer)
and the [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Consumer Actors. However,
different actor groupings could be conceived. The only required
groupings in the mXDE Profile are those specified in Section 1:45.3.

Note: “Data Element” is abbreviated “DE” in the diagram below.

<figure>
<img alt="Basic Process FLow in mXDE Profile" src="4542121.png" width="100%">
<figcaption><b>Figure 1:45.4.2.1.2-1: Basic Process Flow in mXDE Profile</b></figcaption>
<br/>
</figure>


## 1:45.5 mXDE Security Considerations

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

mXDE is a profile that supports the deployment of a system of systems,
thus the security considerations should take into account the overall
system design and also the interactions between actors that make up that
system. The Security Considerations sections in the underlying [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html),
[MHD](https://profiles.ihe.net/ITI/MHD/index.html), [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) Profiles, should also be taken into account in the system
design and operational deployment.

IHE security profiles (e.g., [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html), [IUA](https://profiles.ihe.net/ITI/IUA/index.html), [BPPC](https://profiles.ihe.net/ITI/TF/Volume1/ch-19.html), [APPC](https://profiles.ihe.net/ITI/TF/Volume1/ch-43.html)) provide
functionality to aid with security and privacy. However, the
interactions between various environments such as IUA and XUA can be
challenging. [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) is used in the [XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) environment and is based on SAML.
[IUA](https://profiles.ihe.net/ITI/IUA/index.html) is used in [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) and [MHD](https://profiles.ihe.net/ITI/MHD/index.html) environments and is based on OAuth
technology. Bridging between these technologies is possible, but is not
specified by this profile because bridging depends on specific
deployment context.

The mXDE Data Element Extractor will often need to have an [XUA](https://profiles.ihe.net/ITI/TF/Volume1/ch-13.html) identity
by which it accesses documents for extraction. This identity would have
broad read-only access to documents so that it can extract information.
Yet when a Data Element Provenance Consumer queries for data-elements or
documents, it will identify a user (e.g., clinician, patient, or
organization). The queries would need to be mediated by access control
decisions and enforcement that are appropriate. For example, when there
is a document-level consent (e.g., [BPPC](https://profiles.ihe.net/ITI/TF/Volume1/ch-19.html), [APPC](https://profiles.ihe.net/ITI/TF/Volume1/ch-43.html), or other) and there is a
consent restriction that is specified to denying a designated user
access, then when that designated user attempts to access data-elements,
the access needs to be denied. The solution is a policy and design
challenge not addressed by this profile because it depends on specific
deployment context.

The [provenance](StructureDefinition-IHE.ITI.mXDE.Provenance.html) solution included in mXDE and [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) can be used by an
access control decision engine. Given any data-element that might be
returned on a query, the [associated Provenance Resource](StructureDefinition-IHE.ITI.mXDE.Provenance.html) includes
traceability to the Document from which that data-element came. Thus, an
access control decision that needs to filter out specific documents can
use the [Provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) to determine the results that must be
eliminated from the Bundle before the Bundle can be returned to the Data
Element Provenance Consumer. The specific use of [Provenance](StructureDefinition-IHE.ITI.mXDE.Provenance.html) in access
control decisions, and enforcement is a policy and design challenge not
addressed by the [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Profile.

The Data Element Extractor, and actors with which it is grouped, is
grouped with an [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application to provide
logging and other security features (see ITI TF-2a: 3.20). It is
recommended that the Data Element Provenance Consumer be grouped with an
[ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Secure Node or Secure Application

### 1:45.5.1 mXDE integrity and credibility of information accessed

The mXDE Profile provides a controlled approach to access the same
health information either in a document-level (coarse grain) granularity
or in a data element level granularity (fine-grain). In some situations, the relationship between these two levels could
result in defects in information integrity and/or credibility in the
information being accessed.

The implementer of this profile should consider the following specific
issues:

- Different forms of mappings may have to be performed when actor groupings have been implemented (it is beyond the scope of the mXDE Profile to specify mapping between data elements in documents and data elements accessed directly) and the consequences need to be accounted for:
  - Such mappings may not be perfect (typical limitations in semantic mappings).
  - Some information contained in the documents may not be “expressed” as data elements (e.g., textual elements) and will be unavailable in the data element queries
- Some document authors that have approved or signed a document, may object to individual data elements being extracted from the overall document context. The data elements from such documents would not be visible at the data element level of access. Examples when such a situation arises are:
  - non-coded information is critical to interpret the coded information,
  - constraints that require that specific information be only for display but excluded from being copied or imported,
  - a treatment summary with a stress induced test that results in “unusual” vital signs-in this context.

mXDE is designed to limit the above issues. It offers the means to avoid
these weaknesses of the data element granularity by allowing the user
that retrieves a query list to easily request the document(s) that are
sources of the data element(s) of interest.

## 1:45.6 mXDE Cross Profile Considerations

### 1:45.6.1 ITI PIX - Patient Identity Cross Referencing and ITI PDQ - Patient Demographics Query

An mXDE Data Element Provenance Consumer may be grouped with a Patient
Identifier Cross-reference Consumer in the [PIX](https://profiles.ihe.net/ITI/TF/Volume1/ch-5.html),
or [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html) Profiles
or with a Patient Demographics Consumer in the [PDQ](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html),
or [PDQm](https://profiles.ihe.net/ITI/PDQm/index.html)
Profiles to resolve patient identifiers prior to submitting [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html),
[XDS](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html) or
[MHD](https://profiles.ihe.net/ITI/MHD/index.html) queries.

## 1:45.7 Deployment Models

For the implementation of the mXDE Profile, a number of actors that
generally are considered as part of a health information sharing
infrastructure may be organized in various architectural structures. Two
deployment models are identified for information in this section. These
are not exhaustive and other variants may be supported.

In each one of these two deployment models, the “interoperability”
defined by the mXDE transactions is the same.

Here are the main data flows described for each model:

1. Providing documents.
2. Accessing data element content and if desired one or more of the documents from which a data element was extracted. This access uses the document references conveyed in a [Provenance Resource](StructureDefinition-IHE.ITI.mXDE.Provenance.html) associated with the data element.

The systems involved in each deployment model are represented by grey
boxes. The actors implemented are listed below.

For simplicity, the flow diagrams use generic names for transactions
that can be easily associated with the IHE transactions supported by the
implemented actor.

This informative section also discusses the pros and cons of each
deployment model.

### 1:45.7.1 mXDE Deployment Model A - Central Document Registry/Repository and Central Fine-Grained Data Source 

In this deployment model, the health information infrastructure is
designed around a centralized system that groups a Data Element (DE)
Extractor with an [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3), an [XDS Document Repository](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.4) and
a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Source to which the fine-grained queries are
directed.

The operation of this deployment model is described through the
transaction flows below.

Thanks to this centralized grouping, it's quite simple for the Data
Element (DE) Extractor to access the documents for extracting and
assembling the data elements and the [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) to be shared
with the Clinical Data Consumers and the Document Consumers.

<figure>
<img alt="mXDE Deployment Model A" src="45711.png" width="100%">
<figcaption><b>Figure 1:45.7.1-1: mXDE Deployment Model A</b></figcaption>
<br/>
</figure>

### 1:45.7.2 mXDE Deployment Model B - Distributed Document Repository and Central Fine-Grained Data Source

In this deployment model, the health information infrastructure is
designed around a centralized system that groups a Data Element (DE)
Extractor to an [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3)
and a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Source to
which the fine-grained queries are directed, while the multiple Document
Repositories are decentralized.

The operation of this deployment model is described through the
transaction flows below.

Because of the decentralized nature of the Document Repositories, the
central Data Element (DE) Extractor must retrieve the documents from the
various Document Repositories for extracting and assembling the data
elements and the [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) to be shared with the Clinical
Data Consumer.

This deployment model is a little more complex than the previous one as
the repositories are distributed, but this complexity is transparent to
the Clinical Data Consumers and Document Consumers.

<figure>
<img alt="mXDE Deployment Model B" src="45721.png" width="100%">
<figcaption><b>Figure 1:45.7.2-1: mXDE Deployment Model B</b></figcaption>
<br/>
</figure>

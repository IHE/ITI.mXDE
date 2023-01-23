
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
shared using IHE profiles such as Cross-Enterprise Document Sharing
(XDS), Cross-Community Document Access (XCA), and Mobile access to
Health Documents (MHD).

However, many health information exchange platforms that support
document sharing are considering extending their services by offering
cross-document data aggregation. This can be addressed, in part, with
the access to documents dynamically created with the On-Demand Document
Source in the XDS Profile, and, in part, with profiles such as PCC’s
Query for Existing Data for Mobile (QEDm) Profile that supports the
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

<div>
<img alt="mXDE environment and multilevel granularity access to health information" src="451.png" width="100%">
</div>
**Figure 1:45-1: mXDE environment and multilevel granularity access to health information**

Figure 1:45-2 below, depicts a deployment of the mXDE Profile which can
support the environment in Figure 1:45-1 above. It illustrates one
possible combination of mXDE actors (Data Element Extractor and Data
Element Provenance Consumer) with actors and transactions from the MHD,
XDS and QEDm IHE Profiles.

<div>
<img alt="mXDE Profile combining actors and transactions of other IHE Profiles" src="452.png" width="100%">
</div>
**Figure 1:45-2: mXDE Profile combining actors and transactions of other IHE Profiles**

- Document-Level Granularity “publication” is out of scope of this profile but may be performed using the XDS Provide and Register \[ITI-41\] transaction, the MHD Provide Document Bundle \[ITI-65\] transaction or other means.

- Data Element-Level Granularity access is central to mXDE and is discussed in Section 1:45.1. The Provenance information, returned with each fine-grained data element in the Query responses, allows identification of the document from which the fine-grained data element was extracted.

- Document-Level Granularity “consumption” is central to mXDE and is discussed in Section 1:45.1. Using the identification of the document from which a data element was extracted, it is possible to access the clinical context in which that data element was observed.

This profile supports a variety of deployment models. Two of those are discussed in Section 1:45.7

## 1:45.1 mXDE Actors, Transactions, and Content Modules <a name="actors-and-transactions"> </a>

This section defines the actors, transactions, and/or content modules in
this implementation guide. Further information about actor and transaction definitions can be found in the IHE Technical Frameworks General Introduction [Appendix A: Actors](https://profiles.ihe.net/GeneralIntro/ch-A.html) and [Appendix B: Transactions](https://profiles.ihe.net/GeneralIntro/ch-B.html).

The mXDE Profile includes two actors:

- The **Data Element Extractor Actor** accesses documents to extract data elements and create the links to the data elements’ source documents.

- The **Data Element Provenance Consumer Actor** uses the provided links from data elements to source documents to obtain broader clinical context in which the data elements were recorded.

Three alternative groupings of actors are supported by mXDE. Each one is depicted by a separate figure below that shows the actors directly involved in the mXDE Profile and the relevant transactions between them. These groupings are further specified in Section 1:45.3.

Grouped actors are shown with conjoined boxes. The actors shown with dotted line boxes are specified by other IHE profiles.

<div>
<img alt="mXDE Actor Diagram with QEDm and MHD" src="4511.png" width="100%">
</div>
**Figure 1:45.1-1: mXDE Actor Diagram with QEDm and MHD**

<div>
<img alt="mXDE Actor Diagram with QEDm and XDS" src="4512.png" width="100%">
</div>
**Figure 1:45.1-2: mXDE Actor Diagram with QEDm and XDS**

<div>
<img alt="mXDE Actor Diagram with QEDm, XDS and MHD" src="4513.png" width="100%">
</div>
**Figure 1:45.1-3: mXDE Actor Diagram with QEDm, XDS and MHD**

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

- Shall access documents, through:

   - a grouped XDS Document Registry and the Retrieve Document Set \[ITI-43\] transaction, or

   - a grouped MHD Document Responder.

- Shall extract the data element information from the retrieved documents

- Shall obtain the provenance information and create an HL7 FHIR Provenance Resource associated with extracted data elements (see PCC QEDm Trial Implementation Supplement, Volume 2, Section 3.44.4.2.2.1 “Resource Specific Contents”).

- Shall make the Provenance Resource available to the grouped PCC QEDm Clinical Data Source using the Document Provenance Option. This allows provenance information to be returned in its query responses along with the extracted data elements.

#### 1:45.1.1.2 Data Element Provenance Consumer

The Data Element Provenance Consumer:

- Shall be grouped with a QEDm Clinical Data Consumer using the Document Provenance Option. The Clinical Data Consumer retrieves data elements together with the provenance information through the Mobile Query Existing Data \[PCC-44\] transaction.

- Shall be capable of using the provenance information returned in responses to access source documents through:

   - a grouped XDS Document Consumer, or

   - a grouped MHD Document Consumer.

## 1:45.2 mXDE Actor Options <a name="actor-options"> </a>

Options that may be selected for each actor in this implementation guide, if any, are listed in Table 1:45.2-1 below. Dependencies 
between options when applicable are specified in notes.

**Table 1:45.2-1**

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


| Actor                            | Option Name                                 | Reference          |
|----------------------------------|---------------------------------------------|--------------------|
| Data Element Extractor           | XDS Document Registry Integration (Note 1)  | Section 1:45.2.1.1 |
|                                  | MHD Document Responder Integration (Note 1) | Section 1:45.2.1.2 |
| Data Element Provenance Consumer | XDS Document Consumer Integration (Note 2)  | Section 1:45.2.2.1 |
|                                  | MHD Document Consumer Integration (Note 2)  | Section 1:45.2.2.2 |
{:.grid .table-striped}
*Note 1: The actor shall implement at least one of the options XDS Document Registry Integration or MHD Document Responder Integration
*Note 2: The actor shall implement at least one of the options XDS Document Consumer Integration or MHD Document Consumer Integration.

### 1:45.2.1 Data Element Extractor Actor Options

#### 1:45.2.1.1 XDS Document Registry Integration

The support of this option by a Data Element Extractor enables:

- extracting data elements contained in documents stored in an XDS Document Repository;

- tracking of document provenance for the extracted data elements through references to source documents managed by the XDS Document Registry.

The Data Element Extractor that supports this option:

- shall be grouped with an XDS.b Document Registry;

- shall make available data elements extracted from documents that are known to the Document Registry;

- shall be able to retrieve documents from an XDS.b Document Repository using the Retrieve Document Set \[ITI-43\] transaction.

#### 1:45.2.1.2 MHD Document Responder Integration

The support of this option by a Data Element Extractor enables:

- extracting data elements contained in documents provided by the MHD Document Responder;

- tracking of document provenance for the extracted data elements through references to source documents provided by the MHD Document Responder.

The Data Element Extractor that supports this option:

- shall be grouped with an MHD Document Responder;

- shall make available data elements extracted from documents that are known to the MHD Document Responder;

- shall obtain documents from the grouped MHD Document Responder.

### 1:45.2.2 Data Element Provenance Consumer Actor Options

#### 1:45.2.2.1 XDS Document Consumer Integration

The support of this option enables a Data Element Provenance Consumer to
access the referenced source documents managed by the XDS Document
Registry and Repositories.

The Data Element Provenance Consumer that supports this option:

- shall be grouped with an XDS Document Consumer and thus be capable of accessing the documents referenced by any Provenance Resource.

#### 1:45.2.2.2 MHD Document Consumer Integration 

The support of this option enables a Data Element Provenance Consumer to
access the referenced source documents managed by the MHD Document
Responder.

The Data Element Provenance Consume that supports this option:

- shall be grouped with an MHD Document Consumer and thus be capable of accessing the documents referenced by any Provenance Resource.

## 1:45.3 mXDE Required Actor Groupings <a name="required-groupings"> </a>

An actor from this profile (Column 1) shall implement all required
transactions for the grouped actor (Column 3) in the Required Actor
Groupings Table as shown below.

Note that each one of the three alternatives of actor diagrams specified
for the mXDE Implemetation Guide in Section 1:45.1 has different required actor
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

## 1:45.4 mXDE Overview <a name="overview"> </a>

### 1:45.4.1 Concepts

See “Profile Introduction and Concepts” in Section 1:45.

### 1:45.4.2 Use Cases

The use case below assumes that every consumer device (mobile or not)
knows or discovers the patient identity. The patient identity could be
obtained through a transaction in an IHE Profile such as PDQ, PDQV3,
PDQm, PIX, PIXV3, or PIXm, or it could simply be entered via some device
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
produces and shares a Transfer of Care document in an XDS Affinity
Domain. He also shares a Pharmacy Prescription document.

Following the encounter, the patient makes an appointment with the local
hospital for the intended surgery. He also picks up his prescribed
medication at the local pharmacy which results in the pharmacy sharing a
Pharmacy Dispensation document.

Back at home, the patient uses his smart phone to:

1. Access the recent prescription and recently dispensed medications to review the dosage and timing for his medication. For this, the prescription information is accessed by the patient portal app on his smartphone.

However, the patient’s condition worsens, resulting in an emergency
hospitalization.

At the emergency department, the emergency physician:

2. Urgently needs to stabilize the patient and seeks to obtain his current medication list (the medications prescribed and dispensed need to be extracted from at least two documents).

3. Decides to complete the patient admission and to schedule the intended surgery. For this, he retrieves the Transfer of Care document.

At the surgery department, the anesthesiologist:

4. While preparing for the surgery, obtains the history of prescribed and dispensed medications and the list of known allergies (the allergies need to be extracted for the past 10 years from all shared documents for the patient).

At the conclusion of the hospital stay, the attending physician and
other health professionals create and share the Discharge Summary
document.

Back at home, the patient wants to review the Discharge Summary
associated with his surgery. He opens the patient portal app on his
smart phone, through which he:

5. Queries the Document Registry to list the recent documents shared for him and retrieves the selected Discharge Summary. The patient can read the recommendations on discharge and the new pharmacy prescription including related dosage. Based on this information, he decides to consult the family physician again for clarification.

Later, in order to better evaluate the results, the family physician
needs to check the improvements of patient health. The family physician
uses his tablet to:

6. Query and access all the patient’s vital signs and medications (directly as fine-grained data elements) with related provenance information.

7. In order to reconstruct the patient’s history about the cured pathology, each time he finds relevant changes in the patient’s history, he uses the provenance information to identify any original document and eventually retrieves it. The document in which the original data was initially shared makes him understand the context at that time (other findings, observations, etc.) to better evaluate the meaning of fine-grained information. This analysis helps the family physician to improve the care plan for the patient.

##### 1:45.4.2.1.2 Process Flow

Figure 1:45.2.1.2-1 illustrates the Use Case and assumes some possible
actor groupings based on the scenario described. In particular, it
assumes that a consumer application running on a mobile device (e.g.,
the patient’s smartphone and the family physician’s tablet) supports IHE
actors designed for mobile use including, but not limited to, the MHD
Document Consumer and the QEDm Clinical Data Consumer Actors. However,
different actor groupings could be conceived. The only required
groupings in the mXDE Profile are those specified in Section 1:45.3.

Note: “Data Element” is abbreviated “DE” in the diagram below.

<div>
<img alt="Basic Process FLow in mXDE Profile" src="4542121.png" width="100%">
</div>
**Figure 1:45.4.2.1.2-1: Basic Process Flow in mXDE Profile**

## 1:45.5 mXDE Security Considerations <a name="security-connsiderations"> </a>

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

mXDE is a profile that supports the deployment of a system of systems,
thus the security considerations should take into account the overall
system design and also the interactions between actors that make up that
system. The Security Considerations sections in the underlying QEDm,
MHD, XDS Profiles, should also be taken into account in the system
design and operational deployment.

IHE security profiles (e.g., ATNA, XUA, IUA, BPPC, APPC) provide
functionality to aid with security and privacy. However, the
interactions between various environments such as IUA and XUA can be
challenging. XUA is used in the XDS environment and is based on SAML.
IUA is used in QEDm and MHD environments and is based on OAuth
technology. Bridging between these technologies is possible, but is not
specified by this profile because bridging depends on specific
deployment context.

The mXDE Data Element Extractor will often need to have an XUA identity
by which it accesses documents for extraction. This identity would have
broad read-only access to documents so that it can extract information.
Yet when a Data Element Provenance Consumer queries for data-elements or
documents, it will identify a user (e.g., clinician, patient, or
organization). The queries would need to be mediated by access control
decisions and enforcement that are appropriate. For example, when there
is a document-level consent (e.g., BPPC, APPC, or other) and there is a
consent restriction that is specified to denying a designated user
access, then when that designated user attempts to access data-elements,
the access needs to be denied. The solution is a policy and design
challenge not addressed by this profile because it depends on specific
deployment context.

The provenance solution included in mXDE and QEDm can be used by an
access control decision engine. Given any data-element that might be
returned on a query, the associated Provenance Resource includes
traceability to the Document from which that data-element came. Thus, an
access control decision that needs to filter out specific documents can
use the Provenance information to determine the results that must be
eliminated from the Bundle before the Bundle can be returned to the Data
Element Provenance Consumer. The specific use of Provenance in access
control decisions, and enforcement is a policy and design challenge not
addressed by the QEDm Profile.

The Data Element Extractor, and actors with which it is grouped, is
grouped with an ATNA Secure Node or Secure Application to provide
logging and other security features (see ITI TF-2a: 3.20). It is
recommended that the Data Element Provenance Consumer be grouped with an
ATNA Secure Node or Secure Application

### 1:45.5.1 mXDE integrity and credibility of information accessed 

The mXDE Profile provides a controlled approach to access the same
health information either in a document-level (coarse grain) granularity
or in a data element level granularity (fine-grain). In some situations, the relationship between these two levels could
result in defects in information integrity and/or credibility in the
information being accessed.

The implementer of this profile should consider the following specific
issues:

1. Different forms of mappings may have to be performed when actor groupings have been implemented (it is beyond the scope of the mXDE Profile to specify mapping between data elements in documents and data elements accessed directly) and the consequences need to be accounted for:

   - Such mappings may not be perfect (typical limitations in semantic mappings).

   - Some information contained in the documents may not be “expressed”
    as data elements (e.g., textual elements) and will be unavailable in
    the data element queries

2. Some document authors that have approved or signed a document, may object to individual data elements being extracted from the overall document context. The data elements from such documents would not be visible at the data element level of access. Examples when such a situation arises are:

   -  non-coded information is critical to interpret the coded
    information,

   -  constraints that require that specific information be only for
    display but excluded from being copied or imported,

   -  a treatment summary with a stress induced test that results in
    “unusual” vital signs-in this context.

mXDE is designed to limit the above issues. It offers the means to avoid
these weaknesses of the data element granularity by allowing the user
that retrieves a query list to easily request the document(s) that are
sources of the data element(s) of interest.

## 1:45.6 mXDE Cross Profile Considerations <a name="other-grouping"> </a>

**ITI PIX - Patient Identity Cross Referencing and ITI PDQ - Patient Demographics Query**

An mXDE Data Element Provenance Consumer may be grouped with a Patient
Identifier Cross-reference Consumer in the PIX, PIXV3, or PIXm Profiles
or with a Patient Demographics Consumer in the PDQ, PDQV3, or PDQm
Profiles to resolve patient identifiers prior to submitting QEDm, XDS or
MHD queries.

## 1:45.7 Deployment Models <a name="deployment-models"> </a>

For the implementation of the mXDE Profile, a number of actors that
generally are considered as part of a health information sharing
infrastructure may be organized in various architectural structures. Two
deployment models are identified for information in this section. These
are not exhaustive and other variants may be supported.

In each one of these two deployment models, the “interoperability”
defined by the mXDE transactions is the same.

Here are the main data flows described for each model:

1. Providing documents

2. Accessing data element content and if desired one or more of the documents from which a data element was extracted. This access uses the document references conveyed in a Provenance Resource associated with the data element.

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
Extractor with an XDS Document Registry, an XDS Document Repository and
a QEDm Clinical Data Source to which the fine-grained queries are
directed.

The operation of this deployment model is described through the
transaction flows below.

Thanks to this centralized grouping, it's quite simple for the Data
Element (DE) Extractor to access the documents for extracting and
assembling the data elements and the provenance information to be shared
with the Clinical Data Consumers and the Document Consumers.

<div>
<img alt="mXDE Deployment Model A" src="45711.png" width="100%">
</div>
**Figure 1:45.7.1-1: mXDE Deployment Model A**

### 1:45.7.2 mXDE Deployment Model B - Distributed Document Repository and Central Fine-Grained Data Source

In this deployment model, the health information infrastructure is
designed around a centralized system that groups a Data Element (DE)
Extractor to an XDS Document Registry and a QEDm Clinical Data Source to
which the fine-grained queries are directed, while the multiple Document
Repositories are decentralized.

The operation of this deployment model is described through the
transaction flows below.

Because of the decentralized nature of the Document Repositories, the
central Data Element (DE) Extractor must retrieve the documents from the
various Document Repositories for extracting and assembling the data
elements and the provenance information to be shared with the Clinical
Data Consumer.

This deployment model is a little more complex than the previous one as
the repositories are distributed, but this complexity is transparent to
the Clinical Data Consumers and Document Consumers.

<div>
<img alt="mXDE Deployment Model B" src="45721.png" width="100%">
</div>
**Figure 1:45.7.2-1: mXDE Deployment Model B**

The Mobile Cross-Enterprise Document Data Element Extraction (mXDE)
Profile provides the means to access data elements extracted from
[shared structured documents](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). 
The profile enables the deployment of health data
exchange infrastructures where fine-grained access to health data
coexists and complements the sharing of coarse-grained documents and the
fine-grained data elements they contain.

A challenge that Document Sharing has is on the consuming side. The Principles of a Document are more beneficial to the source. The source is in control of each document creation, and content. Therefore, a consuming application must be robust to the fact that the data may not be broken down or organized in a way that is helpful to the consumer application. There may not even be the information that the consumer wants in any given document.

This profile is based on the reality that health information sharing relies on different granularities of exchange:

* Document-Level Granularity: share and access documents as a composition of various data elements to reflect the information known and produced during a care or administrative workflow step. This level of granularity is optimum to ensure that contained data has clarity of context in care delivery and reflects source attestation (responsibility) of clinical data shared.
* Data Element-Level Granularity: access a specific type of data element (e.g., vital signs, medications, etc.). This level of granularity is optimum when the list of data elements relevant to a “time span” or a set of encounters is of interest. Examples of situations where this level of granularity may be optimum include access to a list of allergies at the time of medication dispensation, or information reconciliation at the time of hospital admission.
Each granularity level delivers unique benefits and this profile provides efficient access to both levels.

This profile defines rules to ensure consistency and traceability of information used for clinical decisions. When a data element is accessed by a Clinical Data Consumer, identifiers from that data element can be used to access one or more documents in which this data element was originally recorded, providing a valuable broader clinical context.

The flows of information are depicted in the Figure 4-1:

<figure>
<img alt="mXDE Flow from Documents to Resources" src="mXDE.png" width="100%">
<figcaption><b>Figure 1:4-1: mXDE Flow from Documents to Resources</b></figcaption>
<br/>
</figure>

1. Documents are published into a Document Sharing infrastructure. This solution supports all IHE models of Document Sharing including XDS, XCA, and MHDS.
2. Specific data elements are extracted from the structured documents per mXDE Profile.
3. Data elements (e.g., allergies) queried using the FHIR based Query for Existing Data for Mobile ([QEDm](https://profiles.ihe.net/PCC/QEDm/index.html)) Profile (Query_for_Existing_Data_for_Mobile).
4. Each data element is linked to the document(s) from which it was extracted per mXDE Profile. Clinician accesses context of any data element of interest using source documents ([XDS](http://profiles.ihe.net/ITI/TF/Volume1/ch-10.html), [MHD](http://profiles.ihe.net/ITI/TF/Volume1/ch-33.html) Profiles) providing the clinical context in which the observation was recorded.

This is all described more fully in the [HIE Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

This profile defines rules to ensure consistency and traceability of
information used for clinical decisions. When a data element is accessed
by a Clinical Data Consumer, identifiers from that data element can be
used to access one or more documents in which this data element was
originally recorded, providing a valuable broader clinical context.

The mapping of the document to data elements is outside the scope of the
mXDE Profile. It needs to be specified for each deployment based on the
specific document content and data elements managed.

This profile supports a variety of deployment models discussed in [Section 1:45.7](volume-1.html#1457-mxde-deployment-models)

## 1:45.1 mXDE Actors, Transactions, and Content Modules

This section defines the Actors, Transactions, and Content Modules in
this implementation guide. Further information about actor and transaction definitions can be found in the IHE Technical Frameworks General Introduction [Appendix A: Actors](https://profiles.ihe.net/GeneralIntro/ch-A.html) and [Appendix B: Transactions](https://profiles.ihe.net/GeneralIntro/ch-B.html).

The mXDE Profile includes two actors:

* The **Data Element Extractor** Actor: accesses documents to extract data elements and create the links to the data elements’ source documents.
* The **Clinical Data Consumer** Actor: uses the provided links from data elements to source documents to obtain broader clinical context in which the data elements were recorded.

Table 1:45.1-1 lists the transactions for each actor directly involved in the mXDE Profile.

**Table 1:45.1-1: mXDE Profile - Actors and Transactions**

| Actors List                      | Transactions                      | Optionality    | Reference       |
|----------------------------------|-----------------------------------|----------------|-----------------|
| Data Element Extractor           | None                              | \-             | \-              |
| Clinical Data Consumer           | None                              | \-             | \-              |
{:.grid .table-striped}

### 1:45.1.1 Actor Descriptions and Actor Profile Requirements

This section documents any non-transaction specific Actor requirements.

#### 1:45:1.1.1 Data Element Extractor

Defined in [Data Element Extractor](CapabilityStatement-IHE.mXDE.DataElementExtractor.html) requirements CapabilityStatement:

- Shall access documents in one or more [Document Sharing exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html), through:
  - a grouped PCC **Content Consumer**, supporting XDS, XCA, MHD, or MHDS.
  - a grouped [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3) and access to the documents by way of a [XDS Document Consumer](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.2.7) or other-wised grouped Document Sharing infrastructure.
- Shall be grouped with a QEDm **Clinical Data Source**.
- Shall have some trigger logic to assure QEDm **Clinical Data Consumer** requests would retrieve accurate and fresh data element Resources given current documents available
  - Shall extract the data element information from the available documents, and make available in QEDm **Clinical Data Source** FHIR Resources
  - Shall obtain the provenance information and create a [profiled Provenance Resource](StructureDefinition-IHE.ITI.mXDE.Provenance.html) associated with extracted data elements.

#### 1:45.1.1.2 Clinical Data Consumer

Definition in [Clinical Data Consumer](CapabilityStatement-IHE.mXDE.ClinicalDataConsumer.html) requirements CapabilityStatement:

- Shall be grouped with a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Consumer Actor using the Document Provenance Option. The QEDm Clinical Data Consumer retrieves data elements together with the [mXDE Provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) through the Mobile Query Existing Data \[PCC-44\] transaction.
- Shall be capable of using the [Provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) returned in responses to access source documents through PCC **Content Consumer**. For example:
  - a grouped [XDS Document Consumer](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.2), or
  - a grouped [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer).

## 1:45.2 mXDE Actor Options

Options that may be selected for each actor in this implementation guide, if any, are listed in Table 1:45.2-1 below. Dependencies
between options when applicable are specified in notes.

**Table 1:45.2-1: mXDE - Actors and Options**

|Actor | Option Name | Reference |
|----------------------------------|-----------------------------------|----------------|-----------------|
| Data Element Extractor           | None                              | \-             | \-              |
| Clinical Data Consumer           | None                              | \-             | \-              |
{:.grid .table-striped}

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
<tr>
<td rowspan="3">Data Element Extractor</td>
<td>Required</td>
<td>PCC QEDm / Clinical Data Source with the Document Provenance
Option</td>
<td>PCC QEDm</td>
</tr>
<tr>
<td>Optional</td>
<td>PCC Content Consumer</td>
<td>PCC TF-2:3.1</td>
</tr>
<tr>
<td>Required</td>
<td>ATNA / Secure Node or Secure Application</td>
<td>[ITI TF-1: 9</td>
</tr>
<tr>
<td rowspan="3">Clinical Data Consumer</td>
<td>Required</td>
<td>PCC QEDm / Clinical Data Consumer with the Document Provenance
Option</td>
<td>PCC QEDm</td>
</tr>
<tr>
<td>Required</td>
<td>PCC Content Consumer</td>
<td>PCC TF-2:3.1</td>
</tr>
<tr>
<td>Required</td>
<td>ATNA / Secure Node or Secure Application</td>
<td>ITI TF-1: 9</td>
</tr>
</tbody>
</table>

PCC **Content Consumer** Actor is an abstract actor that can be implemented by the various [Document Sharing exchanges](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html). The actual capabilities would be indicated in the products [IHE Integration Statement](https://profiles.ihe.net/GeneralIntro/ch-F.html) with grouped specific Document Sharing Profile and Actor statements.

Section [1:45.5 Security Considerations](volume-1.html#1455-mxde-security-considerations) describes some optional groupings that may be of interest
for security considerations and Section [1:45.6 Cross Profile Considerations](volume-1.html#1456-mxde-cross-profile-considerations) describes some optional
groupings in other related profiles.

Section [1:45.7 Deployment Models](volume-1.html#1457-mxde-deployment-models) describes some groupings based on some defined deployment models

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
5. Back at home, the patient wants to review the Discharge Summary associated with his surgery. He opens the patient portal app on his smart phone, through which he Queries the Document Registry to list the recent documents shared for him and retrieves the selected Discharge Summary. The patient can read the recommendations on discharge and the new pharmacy prescription including related dosage. Based on this information, he decides to consult the family physician again for clarification.
6. Later, in order to better evaluate the results, the family physician needs to check the improvements of patient health. The family physician uses his tablet to query and access all the patient’s vital signs and medications (directly as fine-grained data elements) with related [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html).
7. In order to reconstruct the patient’s history about the cured pathology, each time he finds relevant changes in the patient’s history, he uses the [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) to identify any original document and eventually retrieves it. The document in which the original data was initially shared makes him understand the context at that time (other findings, observations, etc.) to better evaluate the meaning of fine-grained information. This analysis helps the family physician to improve the care plan for the patient.

##### 1:45.4.2.1.2 Process Flow

In particular, this use-case
assumes that a consumer application running on a mobile device (e.g.,
the patient’s smartphone and the family physician’s tablet) supports IHE
actors designed for mobile use including, but not limited to,
the [MHD Document Consumer](https://profiles.ihe.net/ITI/MHD/1331_actors_and_transactions.html#133112-document-consumer)
and the [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Consumer Actors. However,
different actor groupings could be conceived. The only required
groupings in the mXDE Profile are those specified in Section 1:45.3.

### 1:45.4.3 Use-Case analysis

The combination of Document Sharing, Query for Existing Data, and Document Element Extraction support these use-cases combined. Logically there are the Grouped Client systems that have grouped QEDm Clinical Data Consumer, mXDE Clinical Data Consumer, and some Content Consumer (e.g. XDS Document Consumer, MHD Document Consumer, etc); and a Grouped Server system that have grouped QEDm Clinical Data Source, mXDE Data Element Extractor, and some for of Document Sharing infrastructure (e.g. XDS, XCA, MHD, etc). The transactions between these two grouped systems is using transactions defined else where within Document Sharing.

<figure>
{%include usecase-processflow.svg%}
<figcaption><b>Figure 1:45.4.3-1: mXDE Process Flow: externally visible transactions</b></figcaption>
</figure>
<br clear="all">

#### 1:45.4.3.1 Grouped Server

The Grouped Server will respond to the externally visible transactions as defined. The Grouped Server needs to do background processing to fulfill the mXDE Data Element Extractor responsibility. This processing is depicted in the following diagram

<figure>
{%include usecase-processflowS.svg%}
<figcaption><b>Figure 1:45.4.3.1-1: mXDE Process Flow: Server internals</b></figcaption>
</figure>
<br clear="all">

1. Some trigger causes the mXDE Data Element Extractor process to happen. This trigger is not defined by mXDE as it is a systems design that will depend on the deployment model and the available resources. This trigger may be:
   1. polling the Document Sharing infrastructure in the background
   2. a QEDm Clinical Data Consumer querying the QEDm Clinical Data Source
   3. a Document being published to a grouped Document Repository or Document Registry
   4. use of the DSUB or other subscription method
2. retrieve the document available
   1. This may be by a grouping with the Document Sharing Infrastructure
   2. This may be by a Document Consumer grouping that executes a query for documents and then selectively retrieves a document
3. decomposition of the content of the document into potential clinical Resources
4. Update or Create the clinical Resources in the QEDm Clinical Data Source
   1. Where the potential Resource is an updated version of a Resource instance that is already available in the QEDm Clinical Data Source, then the result will be updating of that existing Resource instance
   2. Where the potential Resource does not exist, then a new Resource will be created on the QEDm Clinical Data Source
5. A Provenance record will be created that points (`.target`) at each clinical Resource created or updated, and expresses when this extraction took place, and indicate what document these were extracted from

### 1:45.4.3.2 Grouped Client

The Grouped Client initiates the interaction based on some undefined need. There are many examples in the use-case above, including examples of why Provenance and Document content may be needed. Without the need for Provenance or the Document then the flow would simply be normal QEDm processing and not involve mXDE. For the use-case given there is identified need.

<figure>
{%include usecase-processflowC.svg%}
<figcaption><b>Figure 1:45.4.3.2-1: mXDE Process Flow: Client internals</b></figcaption>
</figure>
<br clear="all">

1. QEDm PCC-44 is used to request some clinical resources, and also ask for Provenance for any clinical resources returned.
2. note that this is a potential trigger for the server side mXDE Data Element Extractor
3. some clinical resources and their Provenance are returned
4. some client need uses the clinical Resources
5. some reason for needing to understand the context of one or more of the clinical Resources is reason to look at the Provenance
6. From the Provenance the document from which the clinical Resource was extracted is found
7. PCC-1 (e.g. XDS, XCA, MHD, etc) is used to Query and Retrieve the document
8. the document is returned
9. some client need is satisfied by utalization of the document

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
Yet when a Clinical Data Consumer queries for data-elements or
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
recommended that the Clinical Data Consumer be grouped with an
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

mXDE is a component of a broader Document Sharing exchange. The [Enabling Document Sharing Health Information Exchange using IHE Profiles Whitepaper](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html) explains the various Document Sharing models, Patient Identity Management, Common Provider Directory, and Security and Privacy. This paper also includes references to implementations and further reading.

## 1:45.7 mXDE Deployment Models

For the implementation of the mXDE Grouped Server, a number of actors that
generally are considered as part of a health information sharing
infrastructure may be organized in various architectural structures. 
Deployment models are identified for information in this section. These
are not exhaustive and other variants may be supported.

In each one of these deployment models, the “interoperability”
defined by mXDE is the same.
The Grouped Client would not need to be aware of the Grouped Server deployment model.

### 1:45.7.1 mXDE Deployment Model A - Central Document Registry/Repository and Central Fine-Grained Data Source 

In this deployment model, all of the health information infrastructure is
designed around a centralized system that groups a the mXDE Data Element Extractor with an [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3), an [XDS Document Repository](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.4) and
a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Source to which the fine-grained queries are
directed.

In this model the interactions between these Grouped Server actors do not need to be visible externally, and thus can be designed internally in any way. They do not need to use formally defined IHE transactions, but might.

The drawback of this model is that the mXDE Data Element Extractor is bound to the server infrastructure and can not be connected to actors provided elsewhere.

### 1:45.7.2 mXDE Deployment Model B - Distributed Document Repository and Central Fine-Grained Data Source

In this deployment model, the health information infrastructure is
designed around a centralized system that groups a mXDE Data Element Extractor to an [XDS Document Registry](https://profiles.ihe.net/ITI/TF/Volume1/ch-10.html#10.1.1.3)
and a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Source to
which the fine-grained queries are directed, while the multiple Document
Repositories are decentralized.

Because of the decentralized nature of the Document Repositories, the
mXDE Data Element Extractor must retrieve the documents from the
various XDS Document Repositories for extracting and assembling the data
elements and the [provenance information](StructureDefinition-IHE.ITI.mXDE.Provenance.html) to be shared with the Clinical
Data Consumer. In this deployment model the Grouped Server would need to implement a **Content Consumer** actor and interact using XDS or MHD Document Consumer Actor.

This deployment model is a little more complex than the previous one as
the Document Repositories may be distributed, but this complexity is transparent to
the Clinical Data Consumers and Document Consumers.

### 1:45.7.3 mXDE Deployment Model C - Distributed Document Sharing Infrastructure

In this deployment model, the health information infrastructure is
independent of the mXDE Data Element Extractor
and a [QEDm](https://profiles.ihe.net/PCC/QEDm/index.html) Clinical Data Source to
which the fine-grained queries are directed.

The
mXDE Data Element Extractor must query and retrieve the documents from external Document Registry and Document Repository.
In this deployment model the Grouped Server (as shown above) would not include Document Sharing Infrastructure. The mXDE Data Element Extractor would need to implement a **Content Consumer** actor and interact using XDS, XCA, or MHD Document Consumer Actor. With XDS the DSUB profile may be used to trigger the mXDE Data Element Extractor to process newly published documents as they get published. Otherwise the mXDE Data Element Extractor would trigger on QEDm requests or continuously poll.

This deployment model is more general and could thus be connected to any Document Sharing infrastructure, depending on that infrastructure support for the XDS vs MHD Document Consumer grouped with the mXDE Data Element Extractor.

This deployment model is a more complex than the previous ones, but this complexity is transparent to
the Clinical Data Consumers and Document Consumers.

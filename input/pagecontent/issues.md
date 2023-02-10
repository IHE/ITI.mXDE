
## Significant Changes

### Significant changes from Revison 1.2 (PDF)
- Converted to an IG, no content updates

## Issues

### Submit an Issue

IHE welcomes [New Issues](https://github.com/IHE/ITI.mXDE/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [ITI Public Comment form](https://www.ihe.net/ITI_Public_Comments/).

As issues are submitted they will be managed on the [mXDE GitHub Issues](https://github.com/IHE/ITI.mXDE/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).


### Open Issues

These issues were known as part of the publication and IHE invites comments.

- None

### Closed Issues

These issues have been resolved and documented in the publication.

**mmXDE-102: Should other Deployment Models be considered besides the two described in Section 45.7, if any?**

&rarr; **Resolution:** The two models provided seem sufficient. During trial implementation the need to add other deployment models to Section 45.7 may be considered.

**mXDE_103: Integration of a document sharing environment where an XDS Document Consumer is grouped with a Data Element Extractor.**

The need to introduce an actor grouping option where an XDS Document Consumer is grouped with the Data Element Extractor to gain access to documents content and extract data elements along with creation of Provenance Resources has been considered (see diagram).

<div>
<img alt="Issue 103 Diagram" src="issue_mXDE_103.png" width="50%">
</div>

Given the “pull” behavior of the XDS Document Consumer and the need to limit the update delays for the Data Element Extractor, it has been considered that the introduction of such an option needs further study. Feedback from implementers during Trail Implementation may result in input to address the architectural challenges of such a grouping.

**PROS:** this option would allow a Data Element Extractor to be an independent product from the XDS Document Registry, and to be able to work in both XDS and XCA environments.

**CONS:** this approach would likely be less efficient than the already document option integrating with a Document Registry. It might be possible to mitigate some of those inefficiencies through document subscriptions and content prefetching.

&rarr; **Resolution:** Not introduce that option in the trial implementation version of mXDE. Experience gained through trial implementation may provide input on the need of this additional grouping option.

**mXDE_101: The actor diagram is shown as three alternative groupings of actors. Should we simplify the presentation by showing a single diagram and include some text explaining the choices that are introduced later as options?**

&rarr; **Resolution:** Implementers are likely to choose one of these alternative groupings. It was felt simpler for the readers to keep these diagrams distinct.

**mXDE_201: How to manage fine-grained data 'Location’ and Reconciliation in an Affinity Domain with N Repositories?**

We are defining a data locator service that allows to collect all the fine-grained information of interest by querying in a 'central point'.

**Case #1:** 1 XDS Registry + 1 XDS Repository (& Fine-Grained Data Repository) 

- The Clinical Data Source can be providing data elements resources as the central point for querying & retrieving ALL fine-grained data

- Reconciliation may be placed at this central point

&rarr; OK (for centralized reconciliation & access)

**Case #2:** 1 XDS Registry (with a central Clinical Data Source or Fine-Grained Data Repository) + N XDS Repositories

- The unique XDS Registry still works well as master top-level index for coarse-grained XDS Documents,
- The Clinical Data Source & Reconciliation grouped with the Registry/Responder still works well as a central point to query/access fine-grained information.
- The Clinical Data Source is grouped with a Document Consumer to access and extract data elements out of documents content from the N Document Repositories, each providing a subset of the data (this may happen with caching when new documents are registered or on demand when the Clinical Data Source is queried for data elements.

**Case #3:** 1 XDS Registry + N XDS Repository (Each with a Clinical Data Source or Fine-Grained Data Repository)

- The unique XDS Registry still works well as master top-level index for coarse-grained XDS Documents, but there is no longer have a central point to query/access fine-grained information.
- When the Clinical Data Source Actors placed at the level of each Doc Repository, each provides a subset of the data 
- This case raises two issues:
   - The Clinical Data Sources are no longer unique. Is that an issue? It may imply that some deduplication/reconciliation may be necessary by the Clinical Data Consumers
   - This deployment requires specific behavior from the Clinical Data Consumers to locate the various Clinical Data Sources.

&rarr; **Resolution:** When multiple Doc Repositories in an affinity domain deployment, Case 2 should be supported, but case #3 appears to be a very particular case that need not be covered by mXDE. Case #1 and # 2 will be the two deployment models to be discussed in an informative section (See Section 45.7 on Deployment Models).

**mXDE_203: Privacy and BPPC consent policies** 

Any specification about privacy?
 
It is necessary to provide some “guidance”, but no need for a solution as this would be the topic of the grouping of mXDE with existing or future privacy IHE profiles.

The grouping with existing profiles may be of interest.

&rarr; **Resolutions:** 
- To apply the existing BPPC/APPC consent from the source document to each “fine-grained” element (privacy properties inheritance). This may be a simple and effective way to ensure consistent policies for both document-level and fine-grained data element level access.
- For fine-grained data elements not coming from documents it’s suggested to consider a new BPPC/APPC consent for specifying if someone can query or not for a certain category of information (e.g., consent to access the Vital Signs)

**mXDE_204: Integrity and credibility of information accessed**

The profile provides a controlled approach to access the same health information either in a document level coarse grain level granularity or in a fine-grained data element granularity.

The relationship between these two levels results in a number of situations that could result in “defects in information integrity and/or credibility in the information being accessed. The following points should be discussed in the profile:

1. Different forms of mappings may have to be performed. Although it is beyond the scope of the mXDE Profile to specify such mapping between data elements in documents and fine-grained data elements accessed directly, it is important that implementers note that:
   1. Such mappings may not be perfect (typical limitations in semantic mappings).
   2. Some information contained in the documents may not be “expressed” as data elements (e.g., textual elements) and be “lost” in the data element queries vs the documents.

&rarr; **Resolution:** The profile will provide a good discussion on the above issues and “guidance” on the profile to help implementers of the profile.

**mXDE_205: Check/add the key requirements to ensure that health data is consistently exchanged at different level of granularity**

The following points of consistency seem to be most important:
- When a data element is accessed by a Clinical Data Consumer and found relevant, one need to offer a simple way to extract:
   - Identifiers from the data element in order to access one or more documents in which this item was initially shared.
   - Use the above identifiers to access these documents content and “related” items that may have been shared.
- Some of those ‘identifiers” may also be needed for clinical decision traceability.

&rarr; **Resolution:** **mXDE shall precisely define the identifiers that grant consistency between documents and/or fine-grained data elements** (e.g., from data element &rarr; discover the document from which the resource is extracted). The concept of a Provenance Resource is profiled by mXDE to address these requirements.



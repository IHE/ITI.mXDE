
## Significant Changes

### Significant changes from Revision 1.2 (PDF)

- Converted to an IG, no content updates
- Moved definition of Provenance here from QEDm as that enables it to be more specific to where the data are transformed.
- Added examples of transform and thus use of Provenance.
- Include CapabilityStatements for the actors
- depends on MHD, PDQm, PIXm, and BALP

## Issues

The details are available on github at the link provided. Comments on these github issues are encouraged.

- [mXDE_001](https://github.com/IHE/ITI.mXDE/issues/1): There is no "Transform Considerations" identified in mXDE, but should there be? Such as preserving original identifiers in the resulting FHIR Resources, even when those identifiers can't be used to retrieve the original data, as they are still useful for de-duplication downstream.
- [mXDE_003](https://github.com/IHE/ITI.mXDE/issues/3) nXDE_003: Use of Document Consumer grouping. The original mXDE chose not to group with Document Consumer, but rather chose to add the mXDE actor to the ITI-43 (Retrieve Document Set) transaction. I recommend we change to grouping with Document Consumer (possibly Content Consumer) to enable broader support such as MHDS and XCA.

### Submit an Issue

IHE welcomes [New Issues](https://github.com/IHE/ITI.mXDE/issues/new/choose) from the GitHub community.
For those without GitHub access, issues may be submitted to the [ITI Public Comment form](https://www.ihe.net/ITI_Public_Comments/).

As issues are submitted they will be managed on the [mXDE GitHub Issues](https://github.com/IHE/ITI.mXDE/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting.
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues

These issues were known as part of the publication and IHE invites comments.

- None

### Closed Issues

Purged for clarity. No new closed issues with the IG publisher version.

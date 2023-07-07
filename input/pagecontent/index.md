
This Mobiles Cross-Enterprise (mXDE) Profile provides the means to access data elements extracted from shared
structured documents. The profile enables the deployment of health data
exchange infrastructures where fine-grained access to health data
coexists and complements the sharing of coarse-grained documents and the
fine-grained data elements they contain.

<div markdown="1" class="stu-note">

| [Significant Changes, Open and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide

This guide is organized into the following sections:

- Volume 1: Profiles
  - [Introduction](volume-1.html)
  - [Actors and Transactions](volume-1.html#1451-mxde-actors-transactions-and-content-modules)
  - [Actor Options](volume-1.html#1452-mxde-actor-options)
  - [Actor Required Groupings](volume-1.html#1453-mxde-required-actor-groupings)
  - [Overview](volume-1.html#1454-mxde-overview)
  - [Security Considerations](volume-1.html#1455-mxde-security-considerations)
  - [Cross Profile Considerations](volume-1.html#1456-mxde-cross-profile-considerations)
  - [Deployment Models](volume-1.html#1457-mxde-deployment-models)
- [Test Plan](testplan.html)
- Other
  - [Changes to Other Documents](other.html)
  - [Downloads](downloads.html)

Click on any of the links above, navigate the contents using the [Table of Contents](toc.html) or,
if you are looking for a specific artifact, see the index of [Artifacts](artifacts.html).

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit.
The consuming actors should handle these elements being populated or being absent/empty.
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

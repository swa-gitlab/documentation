---
title: Stakeholders
---

# GitLab Stakeholder Analysis

## Table of Contents

<!-- TODO: update this table of contents -->

* [Introduction](#introduction)
* [Sources](#sources)
* [Approach](#approach)
* [Issues](#issues)
* [IRC Logs](#irc-logs)
* [Analysis](#analysis)
  * [Issues](#issues-1)
  * [IRC Logs](#irc-logs-1)
  * [Wiki](#wiki)
* [Summary: Stakeholders](#summary-stakeholders)
* [Conclusion](#conclusion)

<!-- TODO BEFORE HAND-IN: run the document through a spell checker in Word or so -->


## Introduction

GitLab is a self-hosted Git management system that has been in (public) development since October 2011. Over the years it has received commits from at least a hundred different contributors, has been starred by more than 8,000 people and forked by more than 1,800. This popularity naturally brings with it a lot of stakeholders who have some interest in the project, and whose concerns are important to take into consideration.

In this document we select and analyze GitLab's stakeholders based on the methods suggested by Rozansky and Woods (R&W) in their book *Software Systems Architecture*. The goal of this analysis is to enable better discussion on recent open GitLab issues.


## Sources

In order to perform our analysis, we need to look at the available sources of GitLab documentation.

GitLab has both a [community site](http://www.gitlab.org) ("gitlabhq") and a [commercial site](http://www.gitlab.com) offering paid support and cloud installations ("gitlab.com"). Their main entry point for documentation is the [README](https://github.com/gitlabhq/gitlabhq/blob/master/README.md). Further documentation is spread across the [/doc directory](https://github.com/gitlabhq/gitlabhq/tree/master/doc), their [public wiki](https://github.com/gitlabhq/gitlab-public-wiki/wiki) and their public facing sites mentioned above.

Other good sources of information are their [issue tracker and pull requests](https://github.com/gitlabhq/gitlabhq/issues?state=open). To identify the people involved and their activity, we can make use of the [list of core members](https://github.com/gitlabhq?tab=members), [list of all-time contributors](https://github.com/gitlabhq/gitlabhq/graphs/contributors) and the [monthly commit stats](https://github.com/gitlabhq/gitlabhq/pulse/monthly).


## Approach

Our focus is on improving discussion on recent issues, by identifying good stakeholders. To this end, we first take a look at a number of recent issues in the hopes of identifying active contributors, and examine the activities they tend to perform. This should hopefully give us a clearer picture of the people involved and their roles.

In selecting the stakeholders, we take into account R&W's criteria for a "good stakeholder". A good stakeholder should be:

- Informed
- Committed
- Authorized
- Representative

Next, we will use the insight we've gained from the issues as well as the information sources mentioned before to perform our stakeholder analysis. In the analysis, we list the selected stakeholders, as well as the stakeholder classes they belong to. We use the following list of stakeholder classes from R&W:

| Stakeholder Class | Description |
|----------------------------|------------------|
| Acquirers | Oversee the procurement of the system or product |
| Assessors |  Oversee the system’s conformance to standards and legal regulation |
| Communicators |  Explain the system to other stakeholders via its documentation and training materials |
| Developers | Construct and deploy the system from specifications (or lead the teams that do this) |
| Maintainers | Manage the evolution of the system once it is operational |
| Suppliers | Build and/or supply the hardware, software, or infrastructure on which the system will run |
| Support staff | Provide support to users for the product or system when it is  running |
| System administrators | Run the system once it has been deployed |
| Testers | Test the system to ensure that it is suitable for use |
| Users | Define the system’s functionality and ultimately make use of it |


## Issues

|Issue / Pull Request| Reason for investigation | Result |
|---|---|---|
|Issue [#3312](https://github.com/gitlabhq/gitlabhq/issues/3312)| Top 20 of most commented | @heyfluke (a github user who also experiences the presented issue) seems to be most active in providing information and working towards a solution. Looking at this profile, commenting on this issue seems to be his only activity at the GitLab repo. @DanKnox was asked to fix the presented problem. |
|Pull Request [#3046](https://github.com/gitlabhq/gitlabhq/pull/3046)| Top 20 of most commented | Assigned to @randx. Pull request presented by @raphendyr, which makes him a contributor. However, according to @randx <sup><a href="https://github.com/gitlabhq/gitlabhq/pull/3046#issuecomment-14551589)">5</a>,<a href="https://github.com/gitlabhq/gitlabhq/pull/3046#issuecomment-17540596">6</a></sup> the code for this pull request still needed some further development. @sodabrew also contributed to this pull request by reviewing and testing the code that was provided. Further investigations shows that this user is quite active in the gitlabhq repository, although this appears limited to [participating in discussions](https://github.com/gitlabhq/gitlabhq/search?q=%40sodabrew&source=cc&type=Issues) rather then [developing](https://github.com/gitlabhq/gitlabhq/graphs/contributors). @TiagoTT also reviews some of the code, however it seems that in general this is a [less active user](https://github.com/gitlabhq/gitlabhq/search?q=TiagoTT&type=Issues)|
|Issue [#3424](https://github.com/gitlabhq/gitlabhq/issues/3424) | Top 20 of most commented | This issue does not really show any significant contributors. In this issue, a problem is discussed, on which various people reply, some confirming the problem, others responding to that. However, no users really stand out in this issue as main contributors. Something that we did notice however, is that @bboddenmiller is again participating, helping others with this problem just as in issue [#3312](https://github.com/gitlabhq/gitlabhq/issues/3312). Besides that, he references this issue twice, in both cases relating a pull request / issue to this issue. Apparently he was also involved in this other issue and pull request, which also quantifies him as a significant contributor. |
|Pull Request [3646](https://github.com/gitlabhq/gitlabhq/pull/3646) | Top 20 of most commented | @brocktimus presents code for customizable LDAP attribute mapping, which is discussed by @senny (one of the core members) and @lbt. Actuallly these users are the only ones participating in this discussion so only @lbt and @brocktimus are "new" contributors for the GitLab repo. However as they merely have the same role as the previous contributors, they were not added to the overview below. |
|Issue [#2263](https://github.com/gitlabhq/gitlabhq/issues/2263) | Top 20 of most commented | @randx proposes a feature request here, which is backed up by others, [at some point](https://github.com/gitlabhq/gitlabhq/issues/2263#issuecomment-15370876) (seemingly unexpected), @Andrew8xx8 posts that he has implemented this feature, referencing to his [pull request](https://github.com/gitlabhq/gitlabhq/pull/3351). No important new stakeholder roles were discovered here.|
|Pull Request [#2082](https://github.com/gitlabhq/gitlabhq/pull/2082) | Long-running | @NARKOZ (one of the core members) created this pull request six months ago. He fixed the RESTful URL design. There were some inconsistencies in the URLs, most of them were plural routes, while some others were singular. Two other core members mention the fact that his changes will break compatibility. @riyad proposes to implement some redirects, so it won't break older versions. Then  @guilhermeblanco from [Doctrine](http://www.doctrine-project.org/) shows up and shares some [useful](https://blog.apigee.com/detail/restful_api_design_plural_nouns_and_concrete_names) thoughts about the issue. But as of now, the decision to merge the code has not been made. The most important stakeholders here are the core developers. As the RESTful API is an external interface, this issue is concerned with the functional viewpoint. |
|Issue [#3584](https://github.com/gitlabhq/gitlabhq/issues/3584) | Long-running | @anlek encountered a migrating issue on two different servers. The same day he posted the issue he found and posted a temporary solution. @senny (a core member) closed the issue after a few weeks, but as the solution is temporary @anlek wonders why the issue is not addressed in the migration process. @senny consults with @randx (lead developer) and agrees to reopen the issue. The stakeholders here are the normal users, who want a smooth migrating process and the developers who want to improve GitLab. According to Rozanski & Woods, the migration process falls in the operational category, thus the viewpoint involved with this issue is operational. |
|Pull Request [#3709](https://github.com/gitlabhq/gitlabhq/pull/3709) | Cool feature | The feature contained in this pull request concerns [github-services](https://github.com/github/github-services). @dsander, an independent developer and user, implemented (unfinished) support for these services in GitLab. With this feature you get a lot of extra functionality at once. @dsander created a pull request just to check if the main contributors approve his approach. None of the core member replied yet. No new stakeholders were present in this discussion. Changing the services interface to communicate with the github-services is a change to an external interface. Therefore the functional viewpoint applies here. |
|Pull Request [#3591](https://github.com/gitlabhq/gitlabhq/pull/3591) | Quality watch | For @hiroponz, an active contributor, the network graph with all forks and branches became a mess. He implemented a feature to show only a specific branch. @hiroponz gets some comments by the lead developer, @randx, because some global conventions are not followed. A nice example of a good leader. The stakeholders here are the contributors and the lead developer. @randx used a development viewpoint when he asked @hiroponz to correct his code.  |
|Issue [#3865](https://github.com/gitlabhq/gitlabhq/issues/3865) | Interesting bug | As can be seen in the other issues and pull request, it is difficult to find more distinct stakeholders. The same holds for this issue, though it is listed due to the interesting bug it addresses. @anon5r mentions that when some projects (or teams or groups) are created with specific names, the system behaves unpredictable (404 or javascript errors). Some examples names are *public, assets, teams* or *merge_requests*. @senny related this issue to another [one](https://github.com/gitlabhq/gitlabhq/issues/3239), but no one posted a solution yet. The user that reported the issue acted from an operational viewpoint. |
|Issue [#635](https://github.com/gitlabhq/gitlabhq/issues/635) | Top 20 of oldest issues | @hyder describes an issue with git submodules in GitLab, users @Yogu and @mikemarod contribute fixes for problem at hand and the issue has been left virtually untouched for 8 months. Interesting enough this issue appears to be identical to Issue [#58](https://github.com/gitlabhq/gitlabhq/issues/635), which was closed as 'wontfix' but is still attracting attention from users who do want this feature. |
|Issue [#1238](https://github.com/gitlabhq/gitlabhq/issues/1238) | Top 20 of oldest issues | @marvinone describes a bug in the Markdown implementation used by GitLab, the issue is recognized by @aaronwasserman, who does not appear to be a developer, and left untouched for 6 months |
|Issue [#1603](https://github.com/gitlabhq/gitlabhq/issues/1603) | Top 20 of oldest issues | @cypx describes an issue with LDAP authentication and special characters, which is also faced by 7 other users. A pull request is created by @cypx but has to date not been accepted into the main branch. |
|Issue [#2764](https://github.com/gitlabhq/gitlabhq/issues/2764) | Top 20 of most commented | @jimothyGator describes a bug where commits are not showing on the project home page, which is shared by @cspurk, @riyad suggests a possible course of action and several users who share face this bug work on finding a solution, without much success. @jvanbaarsen suggests an issue that might be related and @supernova32 provides a patch, which might or might not have been accepted into master, as the relevant code has been refactored without trace of this issue. |
|Issue [#3203](https://github.com/gitlabhq/gitlabhq/issues/3203) | Top 20 of most commented | @steve-todorov describes an error, which is shared by several users. @rtripault proposes an incorrect solution. A solution is finally found but the issue appears to have resurfaced with version 5.1 of GitLab. |
|Issue [#3079](https://github.com/gitlabhq/gitlabhq/issues/3079) | Top 20 of most commented | In this (still open) issue, high memory usage is found, specifically related to the HTTP server. @SaitoWu (a core member) identifies some potential solutions, and does some [thorough research](https://github.com/gitlabhq/gitlabhq/issues/3079#issuecomment-15380462) spanning Ruby web servers in general. We identify @SaitoWu as a contributor. |
|Issue [#3727](https://github.com/gitlabhq/gitlabhq/issues/3727) | Top 20 of most commented | This issue shows little sign of committers, just a large number of users experiencing 404 errors when viewing certain files. Interestingly, the problem seems to have fixed itself after upgrading the underlying git version (a seemingly common occurrence for GitLab since it has so many dependencies). |
|Issue [#1982](https://github.com/gitlabhq/gitlabhq/issues/1982) | Long-running | Users identify a number of cases where Markdown rendering fails. A number of fixes are made over time by @riyad and @randx, but the issue is never fully resolved to date. @riyad proposes that a [switch to another engine](https://github.com/gitlabhq/gitlabhq/issues/2161) would solve these problems. |
|Pull Request [#2167](https://github.com/gitlabhq/gitlabhq/pull/2167) | Long-running | @elvanja contributes an implementation for LDAP HTTP authentication support. @randx rejects the initial request due to it being too complicated (indicative of his leadership status within the project). The pull request is still unmerged, due to either @randx's inability to test it or just plain inactivity. |
|Issue [#3234](https://github.com/gitlabhq/gitlabhq/issues/3234) | Top 20 of most commented | @DanKnox, with help from @saLOUt, identifies a bug concerning Gollum migrations and proposes two possible solutions. He requests feedback from @randx, who supports option 1 and asks for a pull request. The process shown in this issue is quite extensive and is a good representative for GitLab's workflow. |


## IRC Logs

In order to get some additional insight into the communication regarding the Gitlab project we decided to monitor the channels #gitlab and #gitlabhq on freenode. We set up an irc client on an always-on machine, which logged the channel activity from approximately 1pm on Wednesday May 8th until 1pm on Monday May 13th 2013. After filtering the status messages from our log, we found that during this interval we recorded 229 chat messages in #gitlab while at the same time only 15 messages were left in #gitlabhq. The messages left in #gitlabhq were mostly support questions that received little attention. Using this information we can conclude that #gitlab appears to be the major channel of the two. Both the raw and parsed logs [are available](irc_logs).


## Analysis

As we now have obtained a large amount of observations, we can start to analyse these findings and see which classes the discovered stakeholders belong to.

### Issues

What is immediately obvious from the available communication channels, as well as the contribution history, is that @randx and @vsizov started the project and are still lead contributors. @randx in particular is very active in the project's development. This makes them **acquirers**, as well as **developers**. In fact, they perform a number of other functions, but we will classify them under these primary roles.

**Users** of the system are members of the public, users such as @anlek and @heyfluke identified in the issues. In addition, the project has started to focus heavily on enterprise users, organizations such as Phusion and Thomson Reuters.

The commercial branch of the GitLab project ("gitlab.com") provides cloud services and paid support. These services are obviously provided by certain people, making them **support staff**, or **system administrator**. It is not immediately clear who provides these services, but gitlab.com's [about page](http://www.gitlab.com/about) suggest that these tasks are divided over Dmitriy Zaporozhets (@randx), Sytse Sijbrandij(@dosire), and Marin Jankovski(@maxlazio).

### IRC Logs

Using the logs from #gitlab we discovered several stakeholders that fit within the roles outlined by Rozanski & Woods. First of all during our monitoring period 11 people joined the channel while looking for support with their GitLab installation (mcfoobar, manacit, LndGoncalves, bguery, dewdrop, slide23, j1mc, dsup, asyd, StR, hejki_, geck). Considering these people had support issues with their installations, we can assume they are **system administrators** of GitLab installations. In addition it is likely that they are also **users** of the software, however, only in one case a person (giany) had an explicit question related to the end use of the system, with a question regarding recommend git workflows.

During this time four people acted as **support staff** (dblessing, FFForever, bigjay and axil42), who helped up to four users looking for support each. Interesting enough we also noticed that user manacit was active in sharing solutions he discovered for some of his problems, which in turn helped user geck resolve the same problem. This suggests that in some cases the role of **user** or **system administrator** might be combined with the role of **support staff**, if the person is actively sharing his knowledge.

### Wiki

The GitLab project has two wikis, one ("old" and inactive) [wiki on their main repository](https://github.com/gitlabhq/gitlabhq/wiki/) and a ("new") [dedicated wiki repository](https://github.com/gitlabhq/gitlab-public-wiki/wiki) that is still in use. Interestingly enough the 'new' wiki is not being referenced to on the GitLab project pages or old wiki, which explains the lack of activity on this wiki; the old wiki contains 59 pages whereas the new wiki only has 9 pages.
There also appears to be a large difference in terms of content; the old wiki contains pages detailing various upgrade paths between GitLab versions and other use and installation guides, which have since been moved to be in the git repository itself. On the other hand the new wiki contains just two troubleshooting and installation guides in addition to multiple pages regarding future plans and some feature designs.

From the history of the [old](https://github.com/gitlabhq/gitlabhq/wiki/_history) and [new](https://github.com/gitlabhq/gitlab-public-wiki/wiki/_history) wikis we can now obtain the following contribution counts. We have omitted users who contributed on two or fewer occasions to filter out incidental uses.

| Edits new wiki | User | Edits old wiki | User |
|----------------|------|----------------|------|
| 7 | @dosire | 15 | @randx |
| 4 | @st3rk | 9 | @dosire |
| 4 | @sbadia | 6 | @senny |
| 4 | @evanwon | | |


From this table we can clearly read that @xrandx is not only an active developer but also an active **communicator**. We also see that @dosire and @senny are not only core members and active developers but also seem to fit into the class of **communicators**. We have not come across users @evanwon and @sbadia earlier in our analysis and both do not appear to be active for the project in other ways and are more likely to be users of the application who contributed some of their input one a few occasions rather than being active contributors.

## Summary: Stakeholders

We summarize the stakeholders we've identified as follows:

| Stakeholder Class     | Stakeholders |
|-----------------------|--------------|
| Acquirers             | @randx, @vsizov |
| Assessors             | (Unclear, if any.) |
| Communicators         | @randx, @dosire, @senny |
| Developers            | @randx, @DanKnox, @NARKOZ, among others |
| Maintainers           | (Overlaps with developers.) |
| Suppliers             | GitLab's many dependencies and supported platforms |
| Support staff         | gitlab.com support, dblessing, FFForever, bigjay, axil42 |
| System administrators | gitlab.com system administrators, GitLab installations system administrators |
| Testers               | (Seemingly no specific individuals, overlaps with the developers.) |
| Users                 | Members of the public (e.g. @heyfluke, @anlek), enterprise users (e.g. Thomson Reuters) |


## Conclusion

Through information gathering on GitLab's public channels, their documentation, and their project history (issues, pull requests), we've been able to learn a lot about GitLab and the people involved. By analyzing all these insights we've been able to identify a number of individuals and groups that we consider GitLab's stakeholder community.

With this, we believe we have been able to sketch a clear image of the stakeholders and their concerns, which should provide for a better understanding in discussions surrounding the project.
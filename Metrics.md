---
title: Metrics
---

# Metrics

In this document we construct a variety of metrics for the GitLab project according to the [GQM (Goal Question Metric)](http://fub-taslim.googlecode.com/svn/trunk/WEMSE/INSTICC_Conference_Latex/gqm.pdf) format.

## Overview

The table below shows our complete QGM model. In the following chapters, each question and metric is explained.

| Object       | Section   | Description |
|--------------|-----------|-------------|
| **Goal**     | Purpose   | Improve |
|              | Issue     | the installation process |
|              | Object    | of the Gitlab project |
|              | Viewpoint | for users |
| **Question** | Q1 | How do users experience the current installation process? |
| **Metrics**  | M1 | % of issues about installation/deployment process |
|              | M2 | Average closing time of the installation issues |
|              | M3 | Subjective rating of the installation process by a sample of the users |
| **Question** | Q2 | Is the installation process improving? |
| **Metrics**  | M1 | (Currently open installation issues / average open installation issues) |
|              | M2 | (Recent number of installation issues posted / average number of installation issues posted) |
| **Question** | Q3 | To what extend are external dependencies of GitLab responsible for installation issues? |
| **Metrics**  | M1 | % of installation issues about dependencies |
|              | M2 | (Number of dependencies / number of installation issues posted) |

## Goal

While installing GitLab for ourselves, we encountered several installation issues. After looking at their [support forum](https://groups.google.com/forum/#!forum/gitlabhq) we discovered that we weren't the only ones. In general the installation raises at lot of problems for the users. Therefore we set our goal to be to improve the installation process.

We constructed our goal according to the GQM template:

| Purpose | Issue | Object | Viewpoint |
|---------|-------|--------|-----------|
| Improve | the installation process | of the GitLab project | for users. |

## Questions
In this chapter, we elaborate on the GQM model.

### Q1. How is the current installation process experienced?
We've already seen that there are a lot of problems concerning the installation. But how do we attach a number to the current installation experience of the users? The metrics below try to capture just that.

#### M1. % of issues about installation/deployment process
The issues that are about the installation (or deployment), expressed in a percentage of the total number of issues, can be an indicator for the installation process experience. The entity concerned with this metric is a collection of issues, the attribute we are measuring are the topics of these issues. These attributes are mapped on a *nominal* scale. The value is *true* if the topic is about the installation and *false* otherwise. Next, the percentage of relevant issues is calculated, which is mapped on a *ratio* scale. To determine the topic of the issue, we can look for specific keywords in the issue. E.g. `install AND (error OR fail)`.

#### M2. Average closing time of the installation issues
Once we determined which issues are about the installation process, we can look at the closing time of those issues. The average time indicates whether the issues are resolved with a reasonable time and may indicate that the installation process suffers from big issues. The entities we are measuring are again issues about the installation process, the attribute is the time between opening and closing the issue, of which the average can be mapped onto a *ratio* scale.

#### M3. Subjective rating of the installation process by a sample of the users
How to measure the process experience better than to interview the users who actually have been through the process? That's what this metric is about. If we ask each user after (or during) the installation process to give a rating on a, for example, five-point Likert scale, we can get a good measure of the user experience. The entity in this metric is the user, the attribute is his experience with the process and the values are mapped onto a ordinal (Likert-type) scale such as *(very bad, bad, neutral, good, very good)*.

### Q2. Is the installation process improving?
An interesting fact is to know whether the installation process has been improving over time or whether it has worsened.

#### M1. (Currently open installation issues / average open installation issues)
To answer this question we can take a look at the current open issues about the installation process. To compare this number with the average open issues (in a certain period) about the installation process, we can get an idea of whether the process is improving or not. The entity is again a collection of issues about the installation process. The attribute is the state of the issue, the values of individual issues are mapped onto a *nominal* scale (open or closed). Next, we agregate over these values to calculate the ratio between the currently open issues and the average amount of simultaneous open issues, which is mapped on a *ratio* scale.

#### M2. (Recent number of installation issues posted / average number of installation issues posted)
If the amount of installation issues filed has increased recently it may indicate that the installation process is worsening. To measure this correctly we can define 'recent' as being for instance a 30 day interval. We can then measure both the number of installation issues posted in the previous 30 days as well as the average number of installation issues posted during such an interval. If we then calculate the ratio between these two values, we can see whether or not the number of issues has changed compared to the average. The entity is again a collection of issues, this time about the installation process. The attributes are the publishing date of the issue and the topic of the issue. The values are mapped onto a *nominal* scale (relevant or not, recent or not). Next, we agregate over these values to calculate the ratio between the amount of recently posted installation issues and the average amount of issues posted related to installation issues in the same period of time. This is mapped onto a *ratio* scale.

### Q3. To what extend are external dependencies of GitLab responsible for installation issues?
When we scrolled through the support forum of GitLab we noticed that there are also a lot of issues concerning the dependencies of GitLab. It seems interesting to measure how often dependency errors play a role when facing issues in the installation process.

#### M1. % of installation issues about dependencies
We can look at the issues that are about dependencies during installation, expressed in a percentage of the number of issues about installation. The entity concerned with this metric is a collection of issues about the installation process, the attribute we are measuring is the topic of these issues, which is mapped onto a *nominal* scale. The value is *true* if the topic is about dependencies and *false* otherwise. These values are used to calculate the percentage of issues related to installation problems caused by the dependencies, compared to the total collection of issues about installation issues, which is mapped on a *ratio* scale. To determine the topic of the issue, we can look for specific keywords in the issue. E.g. `gem AND (error OR fail)`.

#### M2. (Number of dependencies / number of installation issues posted)
We can also try to look for a relation between the number of dependencies of the project and the numbr of installation issues posted in a certain period, for instance the current month. If the number of installation issues increases when more dependencies are added, the two may be correlated. For the measure concerned with the number of dependecies, the entity is defined as the project, the attribute is the number of dependencies, the values are mapped onto a *ratio* scale. For the measure concerned with the number of installation issues, the entity is defined as a collection of issues about the installation process. The attribute is the topic of the issue and the date it was posted and the values are mapped onto a *nominal* scale (relevant or not relevant), which are then counted providing us with a number on a *ratio* scale. The resulting ratio is obviously also mapped onto a *ratio* scale.

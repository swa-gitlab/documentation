# Measurements

In this document we try to provide measurements for the metrics defined in the [metrics document](Metrics.md). Using these measurements we then try to answer at least some of the questions that were defined in this document, which were specified using the [GQM (Goal Question Metric)](http://fub-taslim.googlecode.com/svn/trunk/WEMSE/INSTICC_Conference_Latex/gqm.pdf) format. In this way we attempt to provide clues as to how to achieve the central goal that was outlined in the metrics document using a bottom-up approach.


## Introduction
In the [metrics document](Metrics.md) we have previously constructed a goal that we would like to explore 

| Purpose | Issue | Object | Viewpoint |
|---------|-------|--------|-----------|
| To improve | the installation process | of the GitLab project | for users. |

## Questions
In this chapter we will attempt to answer the last two questions outlined in the metrics document. These questions have been selected because of their quantitative metrics, which can easily be measured using software. We will present the data that is uncovered for these metrics, which can then be interpreted in the context of the previously outlined questions. 

## Q2. Is the installation process improving?
To answer this question we used three different data sources for our metrics: issues posted on GitHub, questions on StackOverflow and discussion threads on Google Groups. On each of these three platforms there is a GitLab community that is actively discussing issues and their solutions. Through both manual and automated searching we measured the total and new number of issues per month.

### Metric 1: (Currently open installation issues / average open installation issues)
We measured this metric with two of the three data sources. This is because there is no issue status (open/closed) available in Google Groups. Furthermore, one of the remaining two, StackOverflow, is not very reliable because of two reasons. First, it has just a total of 150 GitLab issues, which gives us a low resolution. Secondly, the number of open issues in a certain month was in practice higher, because we didn't find a way to incorporate the closing date of an issue. This means that the number of open issues are the issues which are *currently* open and are created in the date specified. Luckily, the last source, GitHub, suits this metric better.

#### StackOverflow

Because the first open installation issue on StackOverflow was created in September 2012, we will start from there. Chart 1 shows the average and currently open issues. The average open issues of the nine months is 50%. It can be seen that since November 2013 there is no significant change (apart from the fluctuations) in the number of open issues (although the total number of issues increases). This could be an indication that the installation process is stable in terms of issues encountered. It doesn’t tell us if there is a clear improvement of the installation process.

![Open installation issues StackOverflow](./metrics/open_issues_stackoverflow.png?raw=true)

*Chart 1. The average and current open installation issues per month on StackOverflow.*

#### GitHub

The GitHub platform is better suitable for this metric since we were able to extract the right data from their servers. In chart 2 we see a clear decrease in open installation issues over time. Although there is a slight increase around October 2012, the general trend is decreasing. Because this source is the most reliable we can say, based on this metric, that the installation process has been improved in the last several months.

![Open installation issues GitHub](./metrics/open_issues_github.png?raw=true)

*Chart 2. The average and open installation issues per month on GitHub.*

### Metric 2: (Recent number of installation issues posted / average number of installation issues posted)

This metric uses all of the mentioned data sources. First we will discuss each of the sources separately, after which we will draw a conclusion using these data.

#### GitHub

GitHub is probably one of the best sources to extract information about issues as it is the main community when it comes to developers that are actively working on the project and the central location where bugs, features and fixes are reported. We created [a script](metrics/retrieve_github_issues.rb) that retrieves the entire GitHub issue history for the project. For each month we counted the number of new issues that seem related to the installation process of GitLab using [another script](metrics/analyze_github_issues.rb).

Chart 3 clearly shows an increasing trend of new installation issues. January and March are the months with the most new issues (almost 60). Interesting note is that since August 2012 the number of new issues has doubled in less than three months. This can be caused by a certain event like introducing a new feature or milestone or perhaps even an overall increase in popularity of the project.

![Recent installation issues GitHub](./metrics/recent_issues_github.png?raw=true)

*Chart 3. The recent installation issues per month on GitHub.*

#### StackOverflow

As mentioned earlier the results of the StackOverflow platform have a rather low resolution. This is because StackOverflow is a relatively new discussion platform for GitLab users that is only recently gaining traction. We included it in our analysis because it's listed on GitLab's own support page and was brought to our attention by one of our peer reviewers. The results of the analysis are depicted in chart 4. A small increasing trend can be seen but it is not as obvious as it is on the GitHub platform. However there is a spike in January 2013, this is the same month in which users posted the most issues on GitHub. So, it's still likely that something concerning the installation process has happened in that month that might be worth looking into.

![Recent installation issues StackOverflow](./metrics/recent_issues_stackoverflow.png?raw=true)

*Chart 4. The recent installation issues per month on StackOverflow.*

#### Google Groups

The third and final source we investigated is GitLab's support forum, which is located on Google Groups. This forum is well used, but not as extensive as the GitHub issue tracker. The topics posted on the support forum appears to be more focused round actual support questions, whereas the GitHub issue tracker contains a mix of support questions, bugs and pull request discussions, which makes the forum an interesting, more user-centric, source of information. 

The results from our analysis can be seen in chart 5, which is shown below. The chart does not show a clear increasing or decreasing trend over the entire monitoring period. We do however see the same sudden increase in installation-related activity around January of 2013.

![Recent installation issues Google Groups](./metrics/recent_issues_googlegroups.png?raw=true)

*Chart 5. The recent installation issues per month on Google Groups.*

#### Combined

In order to obtain a picture of the activity that has been going on on the various platform we have combined the data we obtained. To combine the results we took the (recent installation issues / average)-ratio of each month and plotted the average of the three platforms. The final image is depicted in chart 6, which shows us whether or not the activity in a particular month deviates from the overall average.

![Recent installation issues Combined](./metrics/recent_issues_combined.png?raw=true)

*Chart 6. The combined (average) recent installation of the three platforms.*

Using this chart we can see that up until January 2013 the number of new issues increased over time. This may indicate that the installation suffered from serious problems in this period. In January 2013 it reaches its climax and *something* (which was also visible on all three platforms) lead to a decrease in the number of new issues. This might be caused by an improvement to the dependency management, we will investigate the source of this sudden change in the next chapter. 

#### Conclusion

According to these measurements, our overall conclusion is that the installation process has been worsening for a long time but appears to be improving since January 2013.


### Q3: To what extend are external dependencies of GitLab responsible for installation issues?

When we take a look at the issues we see that a lot of them are related to dependency problems during the installation. We want to explore to what extend the dependencies are responsible for installation issues.

#### Metric 1: % of installation issues about dependencies
Chart 7 below shows the fraction of installation issues that are about dependencies. The blue line represents the fraction of the total issues, the orange line represents only the fraction of the new issues in a particular month. It can be seen that the fraction of the dependency issues is slowly rising. Also the new dependency issues each month is rising in the last few months. This means that there are lately more dependency issues than usual.

![Dependency issues on GitHub](./metrics/dependency_issues.png?raw=true)

*Chart 7. The percentage of installation issues that are about dependencies.*

#### Metric 2: (Number of dependencies / number of new installation issues)
This metric was actually a long shot. We thought we may find a connection between the number of dependencies and the number of new installation issues. It is however not surprising that we didn't get any conclusive results. To give an idea of our results we show them in the chart below. We swapped the numerator and the denominator just for cosmetical reasons.

![New installation issues per dependency](./metrics/new_issues_number_dependencies.png?raw=true)

*Chart 8. New installation issues per dependency, no conslusions can be made.*

#### Metric 3: Number of dependencies over time
Using the [script defined in the metrics folder](metrics/calculate_dependencies.rb), we can obtain a [CSV file](metrics/dependencies.csv) that shows the amount of dependencies that were present in the system over time. These data points are extracted from the Git repository history using the Grit library, which is also used by GitLab itself. The script retrieves the number of Ruby depencencies (gems) only, not system dependencies. As chart 9 tells us, the GitLab team keeps adding dependencies. Since the beginning of GitLab the growth is relatively steady.

![Dependencies over time](./metrics/number_dependencies.png?raw=true)

*Chart 9. GitLab's dependencies (gems) over time.*

## Further Analysis

Using the data discovered in the previous chapter we have been able to partially answer the questions at hand. At the same time new questions have risen from patterns that we've observed in the data. In this chapter we attempt to find some answers to these questions 

### 'January Spike & February Decline'

During the analysis of the data we collected as part of the second metric of Q2 we made some observations that require further attention. First of all we observed that around January 2013 a large spike in user activity occurred and secondly we noticed that this level rapidly decreased over the subsequent months. There are some possible causes for this phenomenon, which we will now explore. 

First of all the peak occurred during the holiday season of December - January, a time a lot of people get time off from their work or education. So a straightforward explanation of this peak might be the sudden increase in spare time, during which more people might be inclined to try and install GitLab on their servers. At the same time more people might take the time to properly upgrade their existing installations, which might also give an increase in issues. We can observe in Chart 5 however that during the holiday period of 2011-2012 this kind of behavior did not occur. This makes it unlikely that additional attention was the main cause of this peak.

A second explanation might be related to the GitLab project itself. It's plausible that during this time new dependencies were introduced. We've seen for Q3 however that this does not appear to be the case. As these measurements only include the dependencies on other Ruby libraries, it's possible that new system dependencies were introduced. We have been unable to detect major changes during December in the GitLab change logs.<sup>1</sup> Smaller changes exist however, for instance the release of GitLab version 4 removed support for `gitolite v2`. <sup>2</sup>

Finally we also observed that the release of GitLab v5.0 removed `gitolite` as a dependency and replaced it with `GitLab Shell`, a similar implementation tailor-made for the GitLab project. <sup>3</sup> The dip in chart 5 that follows the release of this version could be related to the removal of this system dependency. We have insufficient data to support any hard conclusions on this topic however.

Overall we're still unsure about the cause of this additional activity during these months. Given a large amount of time it might be interesting to further look into what has precisely happened during this period, for instance by studing the issues posted during this time by hand. Due to the large number of issues that have been published during this time this has proven to be an impossible task for us at this time.

## Disclaimer

<!-- TODO We are aware of the acadamic failure :p -->

## References
The following documents are referred to in this article:

1. [GitLab Blog](http://blog.gitlab.org/)
2. [GitLab Blog, GitLab 4.0 Released](http://blog.gitlab.org/gitlab-4-release/)
3. [GitLab Blog, GitLab 5.0 Release, Standing on Its Own Two Feet](http://blog.gitlab.org/gitlab-5-dot-0-has-been-released/)

Our raw data is available for study in the following files:

* [Dependency counts over time](metrics/dependencies.csv)
* [GitHub issue activity](metrics/github_issues.csv)
* [Forum issue activity](metrics/forum.csv)
* [StackOverflow activity]() <!--- TODO, @erikvd1, do you have this data as well? -->


# GitLab Development View

## Introduction

In order to support software developers in their task of building, maintaining, and releasing a complex system, it is important to plan and design the development environment. Concerns we need to consider are, for example, how the code is structured, what kinds of standards exist to ensure the system's technical integrity, and how deliverables are managed.

In this document we present a Development View for the GitLab project. We use the definitions and guidelines from Rozanski & Woods' Development Viewpoint.<sup>[1]</sup>


## Project Organization

The GitLab project source code is spread across a number of git repositories, each hosted on GitHub under the account [gitlabhq](https://github.com/gitlabhq). Repositories include GitLab, GitLab CI, GitLab Shell, and a number of forked dependencies. We will mainly consider the repository for the main GitLab project, specifically version 5.2 stable.<sup>[2]</sup>


## Module Organization

GitLab uses the Ruby on Rails framework, and the structure of the project is therefore largely that of a standard RoR application. That is, source code is categorized into controllers, models, views, and other general classes of code, in the `app` directory. Libraries, both third-party as well as internal, are loaded at run-time to support the application code and may either be located in the `lib` directory or be loaded through the Bundler dependency manager.

Because of this directory structure, logical "modules" in GitLab are not necessarily placed in one location. Below we look at some of the modules that make up GitLab and their organization in the project source code.

* **GitLab API**  
  The code for the GitLab API can be found in `lib/api`. It is made available as a REST API at the URL `/api/v3`.<sup>[4]</sup>
* **Project management**  
  The code for the web interface to GitLab projects can be found in `app/controllers`. These controllers make use of the various libraries, models, views, and helpers that have been defined.
* **Administration**  
  Similarly, the code for the admin interface can be found in `app/controllers/admin`, with models, views and such in their usual locations.

### Dependencies

Common pieces of functionality needed to support the web application are included as separate libraries, either third-party or developed in-house. These libraries are specified in the `Gemfile`.

Besides Ruby dependencies, there are a number of packages that GitLab depends on. Which dependencies these are and how to install them can be found in the installation guide.<sup>[3]</sup> One such dependency we want to mention in particular is GitLab Shell:

* **GitLab Shell**  
  GitLab Shell is a tool that is used for SSH access and repository management. It is a collection of Ruby scripts that can be found in a separate repository.<sup>[5]</sup> The scripts are accessed directly via the command line.

In total, GitLab's dependencies are quite numerous, including Ruby on Rails, various databases, interfaces to git, test libraries, server handlers, and much more. An overview of all the different dependencies for the GitLab project is provided in the [Installation Dependencies](InstallationDependencies.md) document.


## Standardized Design

Ruby on Rails is known as an "opinionated framework". It encourages a number of design patterns used to tackle many aspects of software development. For example, the Model-View-Controller (MVC) pattern, database design and management, and dependency management. GitLab does not in general stray very far from these typical Rails-isms, which gives it a high level of standardized design.


## Standardized Testing

GitLab uses various Ruby libraries (RSpec, Spinach) for their unit and integration tests and takes the approach of behavior-driven development. The relevant tests can be found in the `spec` and `features` directories. A test database containing all the test data needed can be set up automatically using the standard `db:setup` command.


## Configuration and Builds

The `config` directory contains all the configuration files. These include standard Ruby on Rails configuration, but also configuration of third-party libraries. Since this is a Ruby project, there is no build step. Users simply configure their server, check out the repository from GitHub, and run the initialization script at `lib/support/init.d/gitlab`. The process is a bit more involved than these steps for new installations or upgrades between major versions, for more information the installation guide can be used.<sup>[3]</sup>

For developers, this method of releasing versions is very convenient. Creating a new release is as simple as creating a version tag, pushing this tag to GitHub and updating the documentation.


## Conclusion

GitLab's development environment is a highly standard Ruby on Rails environment with a number of commonly used third-party libraries. This is advantageous for developers already familiar with these tools, providing a consistent process and small learning curve for contributors. Since GitLab is an open source project, being able to attract new developers quickly is a major benefit.


## References

1. Rozanski, Nick, and Eóin Woods. Software systems architecture: working with stakeholders using viewpoints and perspectives. Addison-Wesley Professional, 2011.
2. GitLab v5.2 source code, https://github.com/gitlabhq/gitlabhq/tree/5-2-stable
3. Installation Guide, https://github.com/gitlabhq/gitlabhq/blob/5-2-stable/doc/install/installation.md
4. GitLab API documentation, https://github.com/gitlabhq/gitlabhq/tree/5-2-stable/doc/api
5. GitLab Shell, https://github.com/gitlabhq/gitlab-shell

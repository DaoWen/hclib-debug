# Contributing to HClib

Before opening a pull request,
please be sure to read through these guidelines.
Following the guidelines listed below will make it much more likely
for your pull request contributions to be quickly accepted and merged.

## Licensing

All contributions submitted to this project are governed
by the terms outlined in our license agreement.
Specifically, our license (Apache 2.0)
has an explicit contributions clause in [section
5](https://github.com/habanero-rice/hclib/blob/6ad778a/LICENSE#L131-L137):

> Unless You explicitly state otherwise, any Contribution intentionally
> submitted for inclusion in the Work by You to the Licensor shall be under
> the terms and conditions of this License, without any additional terms or
> conditions.  Notwithstanding the above, nothing herein shall supersede or
> modify the terms of any separate license agreement you may have executed
> with Licensor regarding such Contributions.

## Commits

Please follow established best practices for your commits.
Do only one thing per commit, and write a descriptive commit message.
[Chris Beams' seven rules of a great Git commit
message](https://chris.beams.io/posts/git-commit/#seven-rules)
provides a good set of guidelines:

1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain *what* and *why* vs. *how*

## Pull Requests

Please follow established best practices for your pull requests.
Give a short description of *what* your patch does in the title,
and include a short description of *why* the patch is needed in the comment.
A complex title or summary is a good indication that your pull request
is doing too many things, and should be split into multiple patches.

See also [*10 tips for better Pull Requests* by Mark
Seemann](http://blog.ploeh.dk/2015/01/15/10-tips-for-better-pull-requests/).

## Quality Control for Contributed Code

### Regression Tests

The main regression tests for HClib are located in `test/c` and `test/cpp`.
The `test_all.sh` scripts in each of those directories will automatically
build and run all tests in the respective test suite.

All new commits should pass all of the regression tests.
When you open a pull request, Travis-CI will automatically run
the full regression suite against your cumulative change
(not against individual commits).
Please run the tests locally against each commit to ensure
that intermediate commits do not fail any tests
(which breaks the ability to use `git bisect` and similar tools).

### Static Error Checking

As part of the development workflow for HClib, any newly committed code
should be checked using standard static checking tools.

In particular, run
[`cppcheck`](https://sourceforge.net/projects/cppcheck/)
on all modified files.
cppcheck should be run by `cd`-ing to `tools/cppcheck` and executing
the `run.sh` script from there (this assumes `cppcheck` is on your path).
Any new errors printed by `cppcheck` should be addressed before committing.

### Code Formatting

You should also run `astyle` on all modified files.
`astyle` is a source code auto-formatter.
Simply `cd` to `tools/astyle` and execute the `run.sh` script.
This assumes you have `astyle` installed and it is on your path.

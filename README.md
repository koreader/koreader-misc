# koreader-misc
helper scripts and tools used/created by the dev team.

## General overview of release procedure

Also see [here](https://gitter.im/koreader/koreader?at=6060cd74a7dfe1372e03af44).

### For basic testing

1. Do the main things still work, no weird crashes. I test on Android x86, Android arm, desktop (I try to include AppImage on old bare metal if I have the time), Kobo.
2. Are the translations mostly ready? Many languages have active translators, meaning that most languages that are translated 95% or better are reasonably likely to end up at 99% or 100% within a week. That means a few days delay after strings are "finalized." Same principle as with more breaking commits in general. Don't do those for at least a few days.

### For release

1. I look at the commit log and pick out things that appeal to me. This is a subjective process of course. What I try to include are things that I think would be more interesting to users, but I also try to highlight a variety of contributors, especially new ones. For example, if https://github.com/koreader/koreader/pull/7345/files were my own commit I'd never have included it in the highlights.
2. Based on the above as well as my own experience with the changes I try to write a little note to go along with it. I like it when I see that in other repos, which is why I do it.

Then it's a simple `git tag -a v2021.03` followed by `git push upstream v2021.03`. Go to gitlab, run pipeline, and wait for the results.

Finally I run `wget --user-agent=Mozilla --no-directories --accept='*.*' -r -l 1 http://build.koreader.rocks/download/stable/v2021.03` and manually download the four Debian artifacts and I upload those to GH (sans the Ubuntu Touch build).

Once the various release binaries are uploaded you can press release. Preferably not earlier, meaning there's always 30-60 minutes between tag and release. Otherwise you run a chance of people asking where the binaries are.

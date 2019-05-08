From: joe.lawrence at redhat.com (Joe Lawrence)
Date: Wed, 8 May 2019 15:30:22 -0400
Subject: Build-time tests?
Message-ID: <20190508191341.GA17963@redhat.com>

Hello kbuild, kselftest,

I've been working on a patchset which adds an additional build script to
the toolchain when compiling livepatches.  There are a few kernel
section features in which this script does not yet support, but can
detect and abort when it encounters.  To test this detection, I've
written a small set of kernel modules that require such sections.

A few questions: 

Is build-testing out of scope for kernel selftests?  For expediency,
it was really easy to spin out new lib/livepatch kernel modules.

Does kbuild support the notion of expected failure?  In this case, the
build script returns a non-zero error and the build stops.

Am I trying to fit a square peg in a round hole?  I could easily keep
these build tests in a private branch, but could they exist in a
different format somewhere else in the tree?

Suggestions welcome,

-- Joe

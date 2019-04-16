From: corbet at lwn.net (Jonathan Corbet)
Date: Tue, 16 Apr 2019 13:59:23 -0600
Subject: [PATCH] doc: kselftest: Fix KBUILD_OUTPUT usage instructions
In-Reply-To: <90615fb4-ff56-af72-f4ea-f3dbc3db26df@kernel.org>
References: <20190416142651.7048-1-shuah@kernel.org>
 <20190416092610.78b462de@lwn.net>
 <90615fb4-ff56-af72-f4ea-f3dbc3db26df@kernel.org>
Message-ID: <20190416135923.4e9d32e4@lwn.net>

On Tue, 16 Apr 2019 09:50:16 -0600
shuah <shuah at kernel.org> wrote:

> >> +Build and run from KBUILD_OUTPUT directory (make KBUILD_OUTPUT=)::
> >>   
> >> -  $ make KBUILD_OUTPUT=/tmp/kselftest kselftest
> >> +  $ export KBUILD_OUTPUT=/tmp/kselftest; make kselftest  
> > 
> > Is there a particular reason why this variable needs to be set in the
> > environment rather than just in make?  More importantly, though, I don't
> > think this would work if you run it from the KBUILD_OUTPUT directory.  What
> > you're really doing is running with a separate output directory, right?
> >   
> 
> That is correct. I am matching the instructions in the main Makefile:
> 
> # kbuild supports saving output files in a separate directory.

So my concern was right, then: this is not a way to "run from the
KBUILD_OUTPUT" directory; that seems certain to confuse people.  I'll
apply the patch so that the commands are right, but that could maybe use
some tweaking.

Thanks,

jon

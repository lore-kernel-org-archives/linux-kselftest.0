From: joel@joelfernandes.org (Joel Fernandes)
Date: Thu, 7 Feb 2019 19:11:39 -0500
Subject: [PATCH 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190207185042.76c7d68f@gandalf.local.home>
References: <20190207211102.154634-1-joel@joelfernandes.org>
 <20190207175239.0607f5eb@gandalf.local.home>
 <20190207233902.GA193818@google.com>
 <20190207185042.76c7d68f@gandalf.local.home>
Message-ID: <20190208001139.GB193818@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190208001139.KfedB1ebNEaK2I02pzy7-zim8H4WJzCqgjcmyDEB8as@z>

On Thu, Feb 07, 2019@06:50:42PM -0500, Steven Rostedt wrote:
> On Thu, 7 Feb 2019 18:39:02 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> > > > +
> > > > +spath="$(dirname "$(readlink -f "$0")")"
> > > > +
> > > > +rm -rf $1.tmp
> > > > +mkdir $1.tmp
> > > > +
> > > > +for f in "${@:2}";
> > > > +	do find "$f" ! -name "*.c" ! -name "*.o" ! -name "*.cmd" ! -name ".*";  
> > > 
> > > I wonder if it is a good idea to pick all files in the directories
> > > defined in ikh_file_list, and not just explicitly list what we want,
> > > with a '*.h' and such?  
> > 
> > I also need few files in the archive that are not .h, these don't take up
> > much space but are needed to make an out-of-tree kernel module build succeed.
> > 
> > One of my goals with this was to make a self-contained module that could be
> > loaded to build other modules. Majority of the files are kernel headers, but
> > some are not, such as Module.symvers and other scripts. Then one can run
> > systemtap on Android which can be made to build modules using the embedded
> > headers.
> 
> Have you audited what it picks up? My main concern is that we start
> adding files that are not necessary or just simply added in the
> directory that are not needed for this.

Yes, I audited what is needed to be picked up. It turned out that I ended up
nitpicking files for not much space-saving advantage while causing the list
of files that need to be picked to be long, because most of the space is
taken by the headers.

> > > > +done | cpio -pd $1.tmp
> > > > +
> > > > +for f in $(find $1.tmp); do
> > > > +	$spath/strip-comments.pl $f
> > > > +done
> > > > +
> > > > +tar -Jcf $1 -C $1.tmp/ . > /dev/null
> > > > +
> > > > +rm -rf $1.tmp
> > > > diff --git a/scripts/strip-comments.pl b/scripts/strip-comments.pl
> > > > new file mode 100755
> > > > index 000000000000..f8ada87c5802
> > > > --- /dev/null
> > > > +++ b/scripts/strip-comments.pl
> > > > @@ -0,0 +1,8 @@
> > > > +#!/usr/bin/perl -pi
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +# This script removes /**/ comments from a file, unless such comments
> > > > +# contain "SPDX". It is used when building compressed in-kernel headers.
> > > > +
> > > > +BEGIN {undef $/;}
> > > > +s/\/\*((?!SPDX).)*?\*\///smg;  
> > > 
> > > Hmm, I'm also wondering if we could us the C pre-processor for the
> > > stripping of everything from the header file. We would then even get
> > > the header files only having what is necessary for the running kernel.  
> > 
> > I thought about this too. An issue with that is it is going to be really slow
> > due to the large number of headers. The other is, I think it will actually
> > make the headers bigger and take up more space - because all the include
> > directives will also be expanded and have more duplication. Let me know if I
> > missed something though.
> > 
> 
> Good point about the duplication. I was mostly thinking of getting rid
> of "#ifdef" blocks.
> BTW, these comments are more of a "have you thought about this" and not
> really action comments.

Ok, thanks for the comments :)

 - Joel

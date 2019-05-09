From: tytso at mit.edu (Theodore Ts'o)
Date: Wed, 8 May 2019 23:20:17 -0400
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <54940124-50df-16ec-1a32-ad794ee05da7@gmail.com>
 <20190507080119.GB28121@kroah.com>
 <a09a7e0e-9894-8c1a-34eb-fc482b1759d0@gmail.com>
 <20190509015856.GB7031@mit.edu>
 <580e092f-fa4e-eedc-9e9a-a57dd085f0a6@gmail.com>
Message-ID: <20190509032017.GA29703@mit.edu>

On Wed, May 08, 2019 at 07:13:59PM -0700, Frank Rowand wrote:
> > If you want to use vice grips as a hammer, screwdriver, monkey wrench,
> > etc.  there's nothing stopping you from doing that.  But it's not fair
> > to object to other people who might want to use better tools.
> > 
> > The reality is that we have a lot of testing tools.  It's not just
> > kselftests.  There is xfstests for file system code, blktests for
> > block layer tests, etc.   We use the right tool for the right job.
> 
> More specious arguments.

Well, *I* don't think they are specious; so I think we're going to
have to agree to disagree.

Cheers,

						- Ted

From: gregkh@linuxfoundation.org (Greg KH)
Date: Thu, 2 May 2019 13:05:13 +0200
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190502105053.GA12416@kroah.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com>
Message-ID: <20190502110513.GF12416@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502110513.WIQLa9-oL_7NNnhfK-QKjQYrf0GNcMxGS1RB16dhbOk@z>

On Thu, May 02, 2019@12:50:53PM +0200, Greg KH wrote:
> On Wed, May 01, 2019@04:01:09PM -0700, Brendan Higgins wrote:
> > ## TLDR
> > 
> > I rebased the last patchset on 5.1-rc7 in hopes that we can get this in
> > 5.2.
> 
> That might be rushing it, normally trees are already closed now for
> 5.2-rc1 if 5.1-final comes out this Sunday.
> 
> > Shuah, I think you, Greg KH, and myself talked off thread, and we agreed
> > we would merge through your tree when the time came? Am I remembering
> > correctly?
> 
> No objection from me.
> 
> Let me go review the latest round of patches now.

Overall, looks good to me, and provides a framework we can build on.
I'm a bit annoyed at the reliance on uml at the moment, but we can work
on that in the future :)

Thanks for sticking with this, now the real work begins...

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

From: rostedt at goodmis.org (Steven Rostedt)
Date: Sun, 5 May 2019 16:31:45 -0400
Subject: [PATCH v2] kheaders: Move from proc to sysfs
In-Reply-To: <20190505132623.GA3076@localhost>
References: <20190504121213.183203-1-joel@joelfernandes.org>
 <20190504122158.GA23535@kroah.com>
 <20190504123650.GA229151@google.com>
 <20190505091030.GA25646@kroah.com>
 <20190505132623.GA3076@localhost>
Message-ID: <20190505163145.45f77e44@oasis.local.home>

On Sun, 5 May 2019 13:26:23 +0000
Joel Fernandes <joel at joelfernandes.org> wrote:

> On Sun, May 05, 2019 at 11:10:30AM +0200, Greg KH wrote:
> > On Sat, May 04, 2019 at 08:36:50AM -0400, Joel Fernandes wrote:  
> > > > But, you should change S_IRUGO to the correct octal number, checkpatch
> > > > should have barfed on this change.  
> > > 
> > > fixed, below is the updated patch inline, thanks!  
> > 
> > Please resend as a "real" submission, doing so in this format is a bit
> > more difficult to apply.  
> 
> git am --scissors can do it, but no problem I will send as a formal
> submission. Thanks a lot.
>

True, but a lot of us depend on scripts to pull in patches from our
INBOX. Which is why we like them to stay with the standard format.

-- Steve

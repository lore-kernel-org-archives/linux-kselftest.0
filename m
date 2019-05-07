From: joel@joelfernandes.org (Joel Fernandes)
Date: Tue, 7 May 2019 12:38:24 -0400
Subject: [PATCH v2] kheaders: Move from proc to sysfs
In-Reply-To: <20190505163145.45f77e44@oasis.local.home>
References: <20190504121213.183203-1-joel@joelfernandes.org>
 <20190504122158.GA23535@kroah.com>
 <20190504123650.GA229151@google.com>
 <20190505091030.GA25646@kroah.com>
 <20190505132623.GA3076@localhost>
 <20190505163145.45f77e44@oasis.local.home>
Message-ID: <20190507163824.GC89248@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190507163824.azrHRaw7X2IPrKGKyWJsravwYO6U7oKkh5U5ef58ofU@z>

On Sun, May 05, 2019@04:31:45PM -0400, Steven Rostedt wrote:
> On Sun, 5 May 2019 13:26:23 +0000
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > On Sun, May 05, 2019@11:10:30AM +0200, Greg KH wrote:
> > > On Sat, May 04, 2019 at 08:36:50AM -0400, Joel Fernandes wrote:  
> > > > > But, you should change S_IRUGO to the correct octal number, checkpatch
> > > > > should have barfed on this change.  
> > > > 
> > > > fixed, below is the updated patch inline, thanks!  
> > > 
> > > Please resend as a "real" submission, doing so in this format is a bit
> > > more difficult to apply.  
> > 
> > git am --scissors can do it, but no problem I will send as a formal
> > submission. Thanks a lot.
> >
> 
> True, but a lot of us depend on scripts to pull in patches from our
> INBOX. Which is why we like them to stay with the standard format.

Thanks makes sense. So Greg, I submitted this properly, does it look good to
you now? Steven, I would appreciate any Acks/Reviews on the patch as well:
https://lore.kernel.org/patchwork/patch/1070199/

- Joel

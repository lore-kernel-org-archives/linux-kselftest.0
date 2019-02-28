From: rostedt at goodmis.org (Steven Rostedt)
Date: Thu, 28 Feb 2019 11:09:18 -0500
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228154513.GA12050@kroah.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228173444.54403795211d80ba540b61cb@kernel.org>
 <20190228150054.GB156098@google.com>
 <20190228153026.GG8481@kroah.com>
 <20190228153741.GA168373@google.com>
 <20190228154513.GA12050@kroah.com>
Message-ID: <20190228110918.06ae3346@vmware.local.home>

On Thu, 28 Feb 2019 16:45:13 +0100
Greg KH <gregkh at linuxfoundation.org> wrote:

> On Thu, Feb 28, 2019 at 10:37:41AM -0500, Joel Fernandes wrote:
> > In any case, it is not practical to provide headers for every kernel version on
> > the system image and maintain them, it will take up too much space and has to
> > be periodically packaged. Not to mention that there will be kernel versions
> > that are booting Android that simply don't have anyone maintaining headers
> > for. So the proposed solution is an easier path.  
> 
> I totally agree with this, and with your proposed patches, just wanting
> to clear up some potential anti-GPL-FUD before it got spread any further :)
>

I would believe that the decision of saying it is "not allowed" is not
about it being illegal, but more of a "we would then need to keep track
of every GPL code and all the specific versions in every package that we
ship such that we will have to provide it if someone were to ask for
it", which would be required by the license. And that can be quite a
burden.

-- Steve

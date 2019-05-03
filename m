From: gregkh at linuxfoundation.org (Greg KH)
Date: Fri, 3 May 2019 09:49:08 +0200
Subject: [PATCH v7 resend 1/2] Provide in-kernel headers to make
 extending kernel easier
In-Reply-To: <20190503073007.GA5834@amd>
References: <20190426190430.172543-1-joel@joelfernandes.org>
 <20190427133844.GA29366@kroah.com>
 <20190429132602.GA165075@google.com>
 <20190429135455.GA2412@kroah.com>
 <CAK7LNARkGLQ_P4LSuC69QN8XPN47W5ujkDE3EauLrwnBgygsSA@mail.gmail.com>
 <20190429142425.GB29007@kroah.com> <20190503073007.GA5834@amd>
Message-ID: <20190503074908.GB27088@kroah.com>

On Fri, May 03, 2019 at 09:30:07AM +0200, Pavel Machek wrote:
> > > > As you say, either is fine with me.
> > > >
> > > > > 2. Who is going to pull this patch: This seems a matter of where the header
> > > > > archive resides. If it is in /sys/kernel/ then I am assuming Greg will pull
> > > > > it.  Masahiro has given his Reviewed-by tag, is he the one to pull it?
> > > >
> > > > I can take it, but it probably should just go through the kbuild tree,
> > > > as that makes more sense to me.
> > > 
> > > 
> > > I do not want to take responsibility for this.
> > 
> > Hah, ok, I'll be glad to queue this up in my tree.  I'll take it now,
> > and if people who really object to this being in /proc/ and want it in
> > /sys/, we can add a follow-on patch before 5.2-final is out to move the
> > file to that location.
> 
> People really object to having it in kernel in the first place.

Then do not select that .config option, and all is good :)

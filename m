From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Sat, 4 May 2019 10:11:55 +0200
Subject: [PATCH] kheaders: Move from proc to sysfs
In-Reply-To: <CAADnVQKh6yVgYR_cZ56MSQ2WxfBjFYaQxbEH=xaeM0FjxAeaZg@mail.gmail.com>
References: <20190503182459.159121-1-joel@joelfernandes.org>
 <CAK7LNATRTqh_OJcQaWfcYYYqyZ-c0u1prD17LDYwDh18z2V31Q@mail.gmail.com>
 <CAK7LNASkR7cauvcLprgrTKNv-iY4yjS278FPGJ-UEYTBrANKYw@mail.gmail.com>
 <20190504005920.GA261146@google.com>
 <CAADnVQKh6yVgYR_cZ56MSQ2WxfBjFYaQxbEH=xaeM0FjxAeaZg@mail.gmail.com>
Message-ID: <20190504081155.GA13298@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190504081155.O6TjGHqJHe7AF_LItE_P0t-3848ARbgipm-RZNSMIUI@z>

On Sat, May 04, 2019@12:46:21AM -0700, Alexei Starovoitov wrote:
> On Fri, May 3, 2019@5:59 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> >
> > On Sat, May 04, 2019@09:21:41AM +0900, Masahiro Yamada wrote:
> > > On Sat, May 4, 2019 at 9:18 AM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > On Sat, May 4, 2019 at 3:27 AM Joel Fernandes (Google)
> > > > <joel@joelfernandes.org> wrote:
> > > > >
> > > > > The kheaders archive consisting of the kernel headers used for compiling
> > > > > bpf programs is in /proc. However there is concern that moving it here
> > > > > will make it permanent. Let us move it to /sys/kernel as discussed [1].
> > > > >
> > > > > [1] https://lore.kernel.org/patchwork/patch/1067310/#1265969
> > > > >
> > > > > Suggested-by: Steven Rostedt <rostedt at goodmis.org>
> > > > > Signed-off-by: Joel Fernandes (Google) <joel at joelfernandes.org>
> > > > > ---
> > > > > This patch applies on top of the previous patch that was applied to the
> > > > > driver tree:
> > > > > https://lore.kernel.org/patchwork/patch/1067310/
> 
> I think it would be cleaner to take it out, squash and reapply.

It is in a un-rebasable-tree already, sorry.  A patch on top is fine.

thanks,

greg k-h

From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Mon, 4 Mar 2019 14:40:44 +0900
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190302023940.GA55262@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <CAK7LNAR=dpw7y+Y20m0n4ZqzQtqY2XrS3CKk5bQA-Azhp0SN6g@mail.gmail.com>
 <20190228144306.GA138215@google.com>
 <CAK7LNARTHJP=HzyBg_oBBL4whpxHXeijqk=zKLYpt=1GBLNGAA@mail.gmail.com>
 <20190301171954.GA217990@google.com>
 <CAK7LNAShVt=zOPP1TUuBbR_H8kmc+zuLAyRXucjMMKrALkW_6A@mail.gmail.com>
 <20190302023940.GA55262@google.com>
Message-ID:
 <CAK7LNATjNE2g_HJnuqvTU7NuUeeUCa0Ogxf0Qru0yzkOT+n2-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190304054044.3zgesommX3Q5UW1nB3k6N_NL7pWNd9uYLtJ3rqVi3ZA@z>

> > > > Let me ask one more question.
> > > >
> > > > I guess this patch is motivated by
> > > > how difficult to convey kernel headers
> > > > from vendors to users.
> > > >
> > > > In that situation, how will the user find
> > > > the right compiler to use for building external modules?
> > > >
> > > >
> > > >
> > > >
> > > > Greg KH said:
> > > >
> > > > We don't ever support the system of loading a module built with anything
> > > > other than the _exact_ same compiler than the kernel was.
> > > >
> > > >
> > > > For the full context, see this:
> > > > https://lore.kernel.org/patchwork/patch/836247/#1031547
> > >
> > > IMO this issue is not related to this patch but is just an issue with
> > > building external modules in general.
> >
> >
> > I do not think it is an issue of the build system, at least.
> >
> > As far as I understood Greg's comment, it is troublesome
> > without the assumption that vmlinux and modules are built
> > by the same compiler.
> > It is related to this patch since this patch assumes use-cases
> > where external modules are built in a completely different environment,
> > where a different compiler is probably installed.
>
> Yes, but what I'm trying to say is the same issue exists with all other
> solutions today that do this. Such as debian you have linux-headers package.


Distributions provide the compiler in the standard path (/usr/bin/gcc),
and users are supposed to use it for building external modules.
That's the difference.



> A user could totally use the build artifacts obtained from somewhere to build
> a kernel module with a completely different compiler. That issue has just to
> do with the reality, and isn't an issue caused by any one solution such as
> this one.  I agree care must be taken whenever user is building external
> kernel modules independent of kernel sources.  Did I miss something else?
>
> thanks a lot,
>
>  - Joel
>

--
Best Regards
Masahiro Yamada

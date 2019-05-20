From: christian at brauner.io (Christian Brauner)
Date: Mon, 20 May 2019 16:48:23 +0200
Subject: [PATCH v2 1/2] pid: add pidfd_open()
In-Reply-To: <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
References: <20190520134605.29116-1-christian@brauner.io>
 <CAK8P3a1cZZ6SQe5mGjhga=MgTvCGF6OKyjvosR8J6z6EpH+rVA@mail.gmail.com>
Message-ID: <20190520144822.xfaifawi65jus6ng@brauner.io>

On Mon, May 20, 2019 at 04:37:03PM +0200, Arnd Bergmann wrote:
> On Mon, May 20, 2019 at 3:46 PM Christian Brauner <christian at brauner.io> wrote:
> >
> > In line with Arnd's recent changes to consolidate syscall numbers across
> > architectures, I have added the pidfd_open() syscall to all architectures
> > at the same time.
> 
> Thanks! I've checked that the ones you have added are all
> done correctly. However, double-checking that you got all of them,
> I noticed that you missed mips-o32 and mips-n64. With those added:
> 
> Acked-by: Arnd Bergmann <arnd at arndb.de>

Perfect, will plumb mips-o32 and mips-n64 and resend once more with your
ack added.
Sidenote: You plan on merging the common syscall tables or will there be
a script to do this work per-arch in the future?

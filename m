From: andreyknvl@google.com (Andrey Konovalov)
Date: Thu, 6 Dec 2018 13:44:24 +0100
Subject: [PATCH v8 0/8] arm64: untag user pointers passed to the kernel
In-Reply-To: <20181129181650.GG22027@arrakis.emea.arm.com>
References: <cover.1541687720.git.andreyknvl@google.com>
 <CAAeHK+w1Qv6owkdWfjbXMFqOA8BURDN5gviw8vpgi3eon1dWmA@mail.gmail.com>
 <20181129181650.GG22027@arrakis.emea.arm.com>
Message-ID:
 <CAAeHK+x9CuqqgvP6pZEV1Gz5cFHNpwsuUDbWQFHFzTy8GBMPKA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181206124424.mESlIh3bFtgbnPlBR43GsMKQUGOfuCSsR3Xlbr4nzi4@z>

On Thu, Nov 29, 2018@7:16 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Hi Andrey,
>
> On Thu, Nov 08, 2018@03:48:10PM +0100, Andrey Konovalov wrote:
> > On Thu, Nov 8, 2018@3:36 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> > > Changes in v8:
> > > - Rebased onto 65102238 (4.20-rc1).
> > > - Added a note to the cover letter on why syscall wrappers/shims that untag
> > >   user pointers won't work.
> > > - Added a note to the cover letter that this patchset has been merged into
> > >   the Pixel 2 kernel tree.
> > > - Documentation fixes, in particular added a list of syscalls that don't
> > >   support tagged user pointers.
> >
> > I've changed the documentation to be more specific, please take a look.
> >
> > I haven't done anything about adding a way for the user to find out
> > that the kernel supports this ABI extension. I don't know what would
> > the the preferred way to do this, and we haven't received any comments
> > on that from anybody else. Probing "on some innocuous syscall
> > currently returning -EFAULT on tagged pointer arguments" works though,
> > as you mentioned.
>
> We've had some internal discussions and also talked to some people at
> Plumbers. I think the best option is to introduce an AT_FLAGS bit to
> describe the ABI relaxation on tagged pointers. Vincenzo is going to
> propose a patch on top of this series.

So should I wait for a patch from Vincenzo before posting v9 or post
it as is? Or try to develop this patch myself?

>
> > As mentioned in the cover letter, this patchset has been merged into
> > the Pixel 2 kernel tree.
>
> I just hope it's not enabled on production kernels, it would introduce
> a user ABI that may differ from what ends up upstream.
>
> --
> Catalin

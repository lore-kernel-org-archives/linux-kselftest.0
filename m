From: olof@lixom.net (Olof Johansson)
Date: Sun, 14 Apr 2019 12:38:34 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
Message-ID:
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190414193834.QxI0lv9_vgwG8UkqIxf4WVEvbgcGS-Hcq-AOxY8LNSc@z>

On Wed, Apr 10, 2019 at 8:15 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Apr 10, 2019@09:34:49AM -0700, Olof Johansson wrote:
> > On Wed, Apr 10, 2019@8:51 AM Joel Fernandes <joelaf@google.com> wrote:
> > >
> > > On Wed, Apr 10, 2019@11:07 AM Olof Johansson <olof@lixom.net> wrote:
> > > [snip]
> > > > > > Wouldn't it be more convenient to provide it in a standardized format
> > > > > > such that you won't have to take an additional step, and always have
> > > > > > This is that form IMO.
> ...
> > Compared to:
> >  - Extract tarball
> >  - Build and load
> >  - Remove file tree from filesystem
>
> I think there are too many assumptions in this thread in regard to what
> is more convenient for user space.
> I think bcc should try to avoid extracting tarball into file system.
> For example libbcc can uncompress kheader.tar.xz into virtual file system
> of clang front-end. It's more or less std::map<string, string>
> with key=path, value=content of the file. Access to such in-memory
> 'files' is obviously faster than doing open/read syscalls.

I think performance is a red herring, especially since you have to
uncompress it on every compiler invocation. With this you'd need to
read/touch/write _all_ header files, not just the one your current
compiler invocation will use.

In the grand scheme of things, open/mmap syscalls wouldn't necessarily
be slower.

> bcc already uses this approach for some bcc internal 'files' that
> it passes to clang during compilation.
> All of /proc/kheaders.tar.xz files can be passed the same way
> without extracting them into real file system.

This is now a circular argument. Joel was stating that the plain text
headers took up too much memory, but now it's preferred to create such
filesystem in userspace memory on *every compiler invocation*?
That's... not better. And definitely worse if you want to compile in
parallel.


>From my perspective, this is where we're at:

This patch seems to have been met with a lot of responses in the tone
of "this is not an appealing solution". Meanwhile, some of the
suggested alternative solutions have not worked out, and we are now at
a point where there's less interest in exploring alternatives and
arguments to merge as-is with only minor adjustments.

I understand the desire to solve this. It'd be really convenient to
have a way to runtime build against the same structure layouts that
the kernel was built with. But I haven't heard anyone say that they
*like* the solution proposed, and I haven't seen many of those
expressing concerns being converted to support it.

Usually what we do at times like this is that we say "Yeah, this is a
problem that should be solved, but this solution doesn't seem to be
the right one and we would need to maintain it forever as part of the
ABI. Let's wait until a better solution is found." With time,
sometimes a better solution becomes obvious, or circumstances change
enough to allow for some different approach, or someone has a new idea
from a different perspective that solves the same problem.

All of that being said, I don't have veto rights on code going into
the kernel, even if I think picking up this patch would be the wrong
thing to do.

I'd be a *lot* less hesitant if this went into debugfs or another
location than /proc, which is one of the most regression-sensitive
interfaces we have in the kernel.

> Joel, would be great if you can share corresponding bcc patch
> that takes advantage of /proc/kheaders


-Olof

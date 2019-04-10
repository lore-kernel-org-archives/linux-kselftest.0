From: dancol at google.com (Daniel Colascione)
Date: Wed, 10 Apr 2019 10:35:44 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
Message-ID: <CAKOZuetwNvm9XLk0d5DFdeObHS+2-7POhuVohS85bFV8Lr+05Q@mail.gmail.com>

On Wed, Apr 10, 2019 at 9:35 AM Olof Johansson <olof at lixom.net> wrote:
> There are lots of things where we provide suitable ways of doing
> things to the user instead of making them come up with their own
> handling of things. devtmpfs is a perfect example of this -- doing
> things in userspace was perfectly possible but still a hassle in many
> cases, and having the kernel do it for you when it already has the
> data makes sense.

devtmpfs is something that the kernel can do *better* than userspace.
The userspace equivalent is error-prone. Unpacking an archive, on the
other hand, is trivial. Does userspace really need the kernel's help
to do tar xvf? Are we really so worried about userspace getting tar
xvf wrong somehow that we should provide tar xvf in the kernel? The
kernel should have a feature only if there's some particular reason to
put that feature in the kernel instead of userspace. A smaller kernel
is a better kernel, all things being equal.

It's also worth noting that years and years ago, many proposals to do
what udevd does (but in the kernel) failed to make it into the kernel.

> I'd expect many users to still want to do this to tmpfs. Also, I
> expect whatever userspace tools and programs that will consume this
> data is likely to consume similar or more memory while running anyway.
> So mounting + copying + unmounting on the heavily constrained systems
> shouldn't be raising the high water mark on memory consumption.

Consider the embedded case: who's to say that the machine
decompressing the header bundle is the machine that provides it? We
can suck a compressed archive off the device without ever
decompressing it. I know you that you proposed providing access to
both a compressed cpio archive and a filesystem view of that archive,
but in this scheme, the filesystem view is redundant. If someone wants
a filesystem view of an archive, he can make one with FUSE without the
kernel's help and in a general way.

> > > If you absolutely need to export a file to userspace with the archive,
> > > my suggestion is to do it through debugfs. That way the format isn't
> > > in a /proc ABI that can't be changed in the future (debugfs isn't
> > > required to be stable in the same way). This way we can change the
> > > format carried in the kernel over time without changing the official
> > > way we present the data to userspace (via a filesystem view).
> > >
> > > As far as format goes; there's clear precedent on cpio being used and
> > > supported; we already have build time requirements on the userspace
> > > tools with some options. Using tar would actually be a new dependency
> > > even if it is a common tool to have installed. With a self-populating
> > > FS, there's no new tool requirements on the runtime side either.
> >
> > debugfs is going away for Android and is controversial in the fact
> > that its functionality isn't guaranteed to be there (debugfs breakages
> > aren't necessarily bugs AFAIK). So this isn't an option.
>
> The argument that this needs to go into /proc because Android is
> removing debugfs isn't a very strong one.
>
> And "debugfs breakages aren't bugs" is exactly why I'm suggesting to
> do the non-supported export of the archive that way instead.

Breaking this header bundle *should* be a bug though: tools will rely
on it. It's not critical interface in the same way that, say, open(2)
is, but the interface stability guarantee should nevertheless be
stronger than what debugfs provides.

> > > > We had close to 2-3 months of discussions now with various folks up until v5.
> > > > I am about to post v6 which is in line with Masahiro Yamada's expecations. In
> > > > that I will be dropping module building artifacts due to his module building
> > > > concerns and only include the headers.
> > >
> > > I've found some of the old discussion and read up on it. I think it
> > > was pretty quick at dismissing ideas for more robust implementations
> > > ("it needs squashfs-tools"), and had some narrow viewpoints (exporting
> > > a tarball is the least amount of kernel change, while adding
> > > complexity at the system/usage side).
> >
> > Honestly, that's kind of unfair to be quoting just a few points like
> > that. If I remember there were 100s of emails and many good view
> > points were brought up by many people. We have done the diligence in
> > the discussions of this over a period of time.
>
> That wasn't captured with the patch submission, and having people go
> find 100s of emails to figure out why your seemingly lacking solution
> is the best one available is not how you motivate getting your code
> into the kernel.
>
> > > I'd also like to clarify: I'm not opposed to the general idea of
> > > providing the needed headers with the kernel somehow. I just think
> > > it's worth spending effort making sure an interface for it that we'll
> > > need to live with forever is appropriately thought through and not
> > > rushed in, especially since we're likely to get substantial
> > > infrastructure on top of it quickly (eBPF and friends in particular).
> >
> > We have spent the time :) This seems like the best solution of all.
>
> That should be documented.
>
> > Greg KH and other maintainers are also supportive of it as can be seen
> > in other threads.
>
> I've found support for the desire to provide headers. If there's so
> much support for this solution, the number of Acks to the patch should
> have been higher.
>
> > We can consider an alternate proposal if it is
> > better, but I don't see any better one proposed at the moment.
>
> Really?

Joel's proposal is the simplest approach that solves the problem we're
trying to solve. The model you're proposing adds a lot of complexity,
and I'm not convinced that the complexity buys us anything.

> > - squashfs-tools requirement on the build really sucks
>
> Nah, this is a minor detail.

tar is ubiquitous. The squashfs tool isn't. Treating both dependencies
the same way is a false equivalence.

> > - cpio uncompressed to memory equally sucks because it consumes all
> > the memory uncompressed instead of reclaimable pages
>
> Only while mounted.
>
> > - decompressing into tmpfs will suck for Android because we don't use
> > disk-based swap and we run into the same cpio issue above. We use ZRAM
> > for compressed swap.
>
> See comments above about high water marks for memory consumption
> likely not moving much.
>
> > - debugfs is a non-option for Android
>
> Not my problem.

It's important to make interfaces that work for everyone. Robust eBPF
use should be possible without debugfs.

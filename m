From: olof@lixom.net (Olof Johansson)
Date: Wed, 10 Apr 2019 08:15:59 -0700
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <79b6bdbc-890a-5a51-7fa1-aec57889046a@opersys.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <79b6bdbc-890a-5a51-7fa1-aec57889046a@opersys.com>
Message-ID:
 <CAOesGMgGFunOeMt93f57fPspdDSHp2twahhudEDhMvZ=VPJHaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190410151559.Sta0eRnIC41U6vBaAzLu_Ra7M7qMNCuBmQ7teKN4xKQ@z>

On Mon, Apr 8, 2019 at 1:52 PM Karim Yaghmour
<karim.yaghmour@opersys.com> wrote:
>
>
> Hi Olof,
>
> On 4/8/19 12:29 PM, Olof Johansson wrote:
> > Sorry to be late at the party with this kind of feedback, but I find
> > the whole ".tar.gz in procfs" to be an awkward solution, especially if
> > there's expected to be userspace tooling that depends on this
> > long-term.
> >
> > Wouldn't it be more convenient to provide it in a standardized format
> > such that you won't have to take an additional step, and always have
> > it in a known location?
> >
> > Something like:
> >
> >   - Pseudo-filesystem, that can just be mounted under
> > /sys/kernel/headers or something (similar to debugfs or
> > /proc/device-tree).
> >   - Exporting something like a squashfs image instead, allowing
> > loopback mounting of it (or by providing a pseudo-/dev entry for it),
> > again allowing direct export of the contents and avoiding the
> > extracted directory from being out of sync with currently running
> > kernel.
> >
> > Having to copy and extract the tarball is the most awkward step, IMHO.
> > I also find the waste of kernel memory for it to be an issue, but
> > given that it can be built as a module I guess that's the obvious
> > solution for those who care about memory consumption.
>
> One of the things I pointed out earlier in the thread is that
> /proc/config.gz has already set a precedent as to the interface for this
> sort of artifact. It's a plain compressed file and it's directly
> accessible from toplevel /proc. From a consistency perspective there's
> an idiomatic angle to some sort of "/proc/kheaders.gz".

I'm not arguing against providing the headers in some format, I think
that's a good idea.

On similarities, there are some but there are also substantial
differences in the use model.

For the config file, the main use cases are:

 - Checking to make sure that the running kernel has a particular set
of config options set or cleared.
 - Ease of cloning the config of a running kernel when building a new one.

The file format is just a plain text file, even if compressed. No real
internal structure to consider.

Both of the above uses are relatively rare (well, the first might be
done in some startup scripts, etc).

The kernel headers case is different. The file format is more complex
(tarball, which would also include the structure of said tarball). You
can't just zgrep to get some data out.

Also, the way the contents is used is different, in that it will be
needed by runtime tools that build and load eBPF programs. For the
build to always be known to be against the running headers, every
build would likely need to decompress and stage said tarball
independently and not rely on previous state. If that's needed, why
not just provide it once in the right format and avoid people building
userspace solutions in several different ways to do the same thing?

> In some offline discussions I was also told that squashfs (I'm no expert
> of it) required special user-space tools and had some security issues.

I'm unaware of what the security issues are, and there's indeed a
GPLv2 tool needed to construct the filesystem. The latter can be
solved, the former I don't know enough about to have an opinion.

Anyway, see my other reply just now -- CPIO + a filesystem view, and
providing said cpio archive in debugfs for those who want to copy it
off themselves might be something that fits everybody.


-Olof

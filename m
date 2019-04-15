From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Mon, 15 Apr 2019 11:41:18 +0200
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
Message-ID: <463a08cb-d1ac-b750-c699-8242c2c20fd2@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190415094118.4Uh2ltcJgZqTvEi-S6dbLB423ZL__1oYcDglxjDY340@z>

On 14.04.19 21:38, Olof Johansson wrote:

Hi folks,


I haven't followed these longs discussions completely, so forgive me if
I've missed something. But here're my comments on this ...

> In the grand scheme of things, open/mmap syscalls wouldn't necessarily> be slower.
ACK. In my own experience on dealing w/ lots of files, eg. headers, in
compilation processes, there indeed is a bottleneck, when thousands of
files have to be processed, but:

a) most the kernel-side delay's were coming from actual IO - w/ tmpfs,
   that easily goes away, and the syscall overhead isn't so much.
b) most of the total computation was preprocessor and parsing.

> This patch seems to have been met with a lot of responses in the tone> of "this is not an appealing solution".

Personally, having generic helpers for putting blobs into /proc files
(like config.gz) sound appealing. But I'm not sure whether doing that
w/ kernel headers this way is a good solution. Actually, I'm even not
sure whether raw kernel headers are at all are a good way. (can't we
use compiler-generated debug info ?)

> Usually what we do at times like this is that we say "Yeah, this is a> problem that should be solved, but this solution doesn't seem to be>
the right one and we would need to maintain it forever as part of the>
ABI. Let's wait until a better solution is found." With time,> sometimes
a better solution becomes obvious, or circumstances change> enough to
allow for some different approach, or someone has a new idea> from a
different perspective that solves the same problem.
ACK. For now, this is an Android-only debug tool, just needed there
because of it's unusual partitioning/deployment mechanisms - on usual
GNU/Linux distros, we just have the kheaders in the file system.
(and even on my small embedded devices, I either run the DUTs via NFS,
9P2k, initrd, etc or just deploy kernel and headers into the filesystem)

As Android already is in it's own universe, why can't that stuff remain
incubated there, until we have more field experience w/ it and more time
to rethink the whole idea very carefully ?

The patch is pretty small, so it's trivial cherry-pick, in case somebody
outside Android universe wants to use it.

I see two smaller sub-problems that IMHO deserve a more generic
solution:

#1: generic helpers for easily exposing in-kernel blobs as /proc files
    (potentially w/ transparent decompression)

#2: generic way for easily linking in files with very few LoC

    one scenario that I've got in mind is using dtb snippets for board
    drivers, that only need to initialize some generic drivers w/
    board specific configuration, so that doesn't have to be hand-
    written anymore.


> I'd be a *lot* less hesitant if this went into debugfs or another
> location than /proc, which is one of the most regression-sensitive
> interfaces we have in the kernel.

ACK. I don't think that /proc really is the right place for that.
Actually, I even doubt that for config.gz , it's just historically
there (many distros already disabled it for many years). IMHO, /proc
is for process information. (i guess that was also a reason for creating
debugfs instead of putting that stuff into /proc).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287

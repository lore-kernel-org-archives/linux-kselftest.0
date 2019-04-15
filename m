From: joel@joelfernandes.org (Joel Fernandes)
Date: Mon, 15 Apr 2019 09:52:49 -0400
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending
 kernel easier
In-Reply-To: <463a08cb-d1ac-b750-c699-8242c2c20fd2@metux.net>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAJWu+or0hWce9+7aEfTHoOR8cptRbzHYVL-bPdJWGZH20dbo7Q@mail.gmail.com>
 <CAOesGMiuGK-Sbqo2z=1ab070JONav1LF82MRRLCdX-4+14_XZA@mail.gmail.com>
 <20190411031540.ehezr6kq7ouobpzx@ast-mbp.dhcp.thefacebook.com>
 <CAOesGMgiPB=7FE7tXXHes7WSLfByyPxirOStoH21NZqMwaUihQ@mail.gmail.com>
 <463a08cb-d1ac-b750-c699-8242c2c20fd2@metux.net>
Message-ID: <20190415135249.GA205801@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190415135249.noMs65n0KiqylPmhHZsUY24DeLp-kpmjNo6lq0BzrZk@z>

On Mon, Apr 15, 2019@11:41:18AM +0200, Enrico Weigelt, metux IT consult wrote:
[snip]
> > This patch seems to have been met with a lot of responses in the tone> of "this is not an appealing solution".
> 
> Personally, having generic helpers for putting blobs into /proc files
> (like config.gz) sound appealing. But I'm not sure whether doing that
> w/ kernel headers this way is a good solution. Actually, I'm even not
> sure whether raw kernel headers are at all are a good way. (can't we
> use compiler-generated debug info ?)

We can't use compiler generated debug info for this.

As discussed previously here, eBPF tools need kernel headers, DWARF and
compiler debug information wont help:
https://lkml.org/lkml/2019/3/11/1358
https://lkml.org/lkml/2019/3/11/1363

> > Usually what we do at times like this is that we say "Yeah, this is a> problem that should be solved, but this solution doesn't seem to be>
> the right one and we would need to maintain it forever as part of the>
> ABI. Let's wait until a better solution is found." With time,> sometimes
> a better solution becomes obvious, or circumstances change> enough to
> allow for some different approach, or someone has a new idea> from a
> different perspective that solves the same problem.
> ACK. For now, this is an Android-only debug tool, just needed there
> because of it's unusual partitioning/deployment mechanisms - on usual
> GNU/Linux distros, we just have the kheaders in the file system.
> (and even on my small embedded devices, I either run the DUTs via NFS,
> 9P2k, initrd, etc or just deploy kernel and headers into the filesystem)
> 
> As Android already is in it's own universe, why can't that stuff remain
> incubated there, until we have more field experience w/ it and more time
> to rethink the whole idea very carefully ?

Well, we follow mostly an upstream first process.

> The patch is pretty small, so it's trivial cherry-pick, in case somebody
> outside Android universe wants to use it.

It could break very easily if things upstream change in some way, and adds a
lot of maintenance burden, besides I don't see a good reason it should not be
upstreamed tbh.

thanks,

 - Joel

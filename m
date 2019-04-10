From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 10 Apr 2019 21:19:17 +0200
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
Message-ID:
 <CAK8P3a30yY_1mPcUBxOYOkbFwoeCHbo5EHuWMN4fqKug9DiQDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190410191917.E_VtDPdtSs84KGmSmVdDmARu_pOB5BN_do-vfs3mwqo@z>

On Wed, Apr 10, 2019@5:09 PM Olof Johansson <olof@lixom.net> wrote:
>
> As far as format goes; there's clear precedent on cpio being used and
> supported; we already have build time requirements on the userspace
> tools with some options. Using tar would actually be a new dependency
> even if it is a common tool to have installed. With a self-populating
> FS, there's no new tool requirements on the runtime side either.

The decision between tar and cpio directly follows from whether the
headers are uncompressed in kernel space or in user space:

- we use cpio for initramfs because unpacking cpio in C code is
  fairly simple, while unpacking tar is not (see the wikipedia page on tar).
  If we were to unpack it from the kernel, the initramfs code could be
  trivially reused.
- nobody sane uses cpio in user space, since tar is already present
  almost everywhere, while cpio is rather obscure in comparison.

        Arnd

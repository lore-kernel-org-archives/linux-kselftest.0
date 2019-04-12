From: lkml@metux.net (Enrico Weigelt, metux IT consult)
Date: Fri, 12 Apr 2019 18:16:19 +0200
Subject: [PATCH v5 1/3] Provide in-kernel headers to make extending kernel
 easier
In-Reply-To: <CAK8P3a30yY_1mPcUBxOYOkbFwoeCHbo5EHuWMN4fqKug9DiQDQ@mail.gmail.com>
References: <20190320163116.39275-1-joel@joelfernandes.org>
 <CAOesGMheoZda84OSz9spQ7p66wot5S_9aaqaKC=QYp+8utASXA@mail.gmail.com>
 <20190408203601.GF133872@google.com>
 <CAOesGMibHCuMPCYkc8V++Z2Kuf3YQf_OjYn18GvDgzTy6ubV=g@mail.gmail.com>
 <CAK8P3a30yY_1mPcUBxOYOkbFwoeCHbo5EHuWMN4fqKug9DiQDQ@mail.gmail.com>
Message-ID: <76db9a89-ae64-5c2b-6f56-3e2b860cbda2@metux.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412161619._H_g1ltyM3v62D5O92PBrSSwvxz5u5-YQw82M-NKUV0@z>

On 10.04.19 21:19, Arnd Bergmann wrote:

> - we use cpio for initramfs because unpacking cpio in C code is
>   fairly simple, while unpacking tar is not (see the wikipedia page on tar).
>   If we were to unpack it from the kernel, the initramfs code could be
>   trivially reused.

What about ar ? ;-)

> - nobody sane uses cpio in user space, since tar is already present
>   almost everywhere, while cpio is rather obscure in comparison.

So, rpm doesn't count as "sane" ? :o


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info at metux.net -- +49-151-27565287

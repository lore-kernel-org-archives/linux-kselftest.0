From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Wed, 12 Dec 2018 22:56:32 +0100
Subject: [PATCH] fix dma-buf/udmabuf selftest
In-Reply-To: <81c4efd9-2ccd-53ec-98e7-663c95d6d5c4@kernel.org>
References: <20181127103312.19368-1-murphyt7@tcd.ie>
 <81c4efd9-2ccd-53ec-98e7-663c95d6d5c4@kernel.org>
Message-ID:
 <CAKMK7uF0Anr5+Z+Mnpnch_X5QqMj0gAvX99ifov9cC8rDMigAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181212215632.VbWkEOTVZSZFYnB0-ExUFTSo6vqfGENjROE8nz2l1fk@z>

On Wed, Dec 12, 2018@10:16 PM shuah <shuah@kernel.org> wrote:
>
> Hi Daniel,
>
> On 11/27/18 3:33 AM, Tom Murphy wrote:
> > This patch fixes the udmabuf selftest. Currently the selftest is broken.
> > I fixed the selftest by setting the F_SEAL_SHRINK seal on the memfd
> > file descriptor which is required by udmabuf and added the test to
> > the selftest Makefile.
> >
> > Signed-off-by: Tom Murphy <murphyt7 at tcd.ie>
>
> Does this change look good you? I plan to get this in for 4.21-rc1. Let
> me know if you have any objections.

No idea, would need Gerd's ack I think. And maybe we need to update
MAINTAINERS, to make sure dri-devel gets cc'ed on patches touching the
dma-buf testcases.
-Daniel

> thanks,
> -- Shuah
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

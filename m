From: kraxel at redhat.com (Gerd Hoffmann)
Date: Thu, 13 Dec 2018 11:25:22 +0100
Subject: [PATCH] fix dma-buf/udmabuf selftest
In-Reply-To: <81c4efd9-2ccd-53ec-98e7-663c95d6d5c4@kernel.org>
References: <20181127103312.19368-1-murphyt7@tcd.ie>
 <81c4efd9-2ccd-53ec-98e7-663c95d6d5c4@kernel.org>
Message-ID: <20181213102521.tunzbhq4rk5loxk2@sirius.home.kraxel.org>

On Wed, Dec 12, 2018 at 02:15:49PM -0700, shuah wrote:
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
> Does this change look good you? I plan to get this in for 4.21-rc1. Let me
> know if you have any objections.

Yes, it's fine.

Reviewed-by: Gerd Hoffmann <kraxel at redhat.com>

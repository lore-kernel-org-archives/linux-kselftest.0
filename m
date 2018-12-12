From: shuah@kernel.org (shuah)
Date: Wed, 12 Dec 2018 14:15:49 -0700
Subject: [PATCH] fix dma-buf/udmabuf selftest
In-Reply-To: <20181127103312.19368-1-murphyt7@tcd.ie>
References: <20181127103312.19368-1-murphyt7@tcd.ie>
Message-ID: <81c4efd9-2ccd-53ec-98e7-663c95d6d5c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181212211549.lQg8IxEnwEdBjP35288EUbOVjHKS0lUzAobDkqhAVoA@z>

Hi Daniel,

On 11/27/18 3:33 AM, Tom Murphy wrote:
> This patch fixes the udmabuf selftest. Currently the selftest is broken.
> I fixed the selftest by setting the F_SEAL_SHRINK seal on the memfd
> file descriptor which is required by udmabuf and added the test to
> the selftest Makefile.
> 
> Signed-off-by: Tom Murphy <murphyt7 at tcd.ie>

Does this change look good you? I plan to get this in for 4.21-rc1. Let 
me know if you have any objections.

thanks,
-- Shuah

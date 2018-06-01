From: patch-notifications@ellerman.id.au (Michael Ellerman)
Date: Sat,  2 Jun 2018 01:54:59 +1000 (AEST)
Subject: [v2, 2/2] selftests/powerpc: Add core file test for Protection Key
 registers
In-Reply-To: <20180525021145.4520-2-bauerman@linux.ibm.com>
Message-ID: <40y86W6jNmz9s3x@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180601155459.23zc3slx3fmCYIDNad8xEGNzCePvSxG2xhgC8oJWBtU@z>

On Fri, 2018-05-25@02:11:45 UTC, Thiago Jung Bauermann wrote:
> This test verifies that the AMR, IAMR and UAMOR are being written to a
> process' core file.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/39b91dd625f15438859204a489ab62

cheers
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

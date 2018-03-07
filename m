From: davem@davemloft.net (David Miller)
Date: Wed, 07 Mar 2018 13:25:00 -0500 (EST)
Subject: [PATCH] selftest: net: reuseport_bpf_numa: don't fail if no
 numa support
In-Reply-To: <20180306151004.31336-1-anders.roxell@linaro.org>
References: <20180306151004.31336-1-anders.roxell@linaro.org>
Message-ID: <20180307.132500.40232199631094354.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180307182500.6dMnoF_FFlr0PK5fbvYNdTWFUzoYbrPwb_gria6JHM0@z>

From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue,  6 Mar 2018 16:10:04 +0100

> The reuseport_bpf_numa test case fails there's no numa support.  The
> test shouldn't fail if there's no support it should be skipped with a
> pass.
> 
> Fixes: 3c2c3c16aaf6 ("reuseport, bpf: add test case for bpf_get_numa_node_id")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

I don't know about this.

The test did not pass.  So it should not be "skipped with a pass".

We were unable to run it at all, which means we don't know if it
would pass or fail.  This means there is a third state besides
pass or fail which we must acknowledge and implement.


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

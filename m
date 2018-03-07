From: davem at davemloft.net (David Miller)
Date: Wed, 07 Mar 2018 14:59:28 -0500 (EST)
Subject: [PATCH] selftest: net: reuseport_bpf_numa: don't fail if no
 numa support
In-Reply-To: <1a84294d-babc-e4ff-1e2f-9265450fee8f@kernel.org>
References: <20180306151004.31336-1-anders.roxell@linaro.org>
 <20180307.132500.40232199631094354.davem@davemloft.net>
 <1a84294d-babc-e4ff-1e2f-9265450fee8f@kernel.org>
Message-ID: <20180307.145928.456070038633384401.davem@davemloft.net>

From: Shuah Khan <shuah at kernel.org>
Date: Wed, 7 Mar 2018 12:51:06 -0700

> That said, I am open to adding a distinct state for skipped because
> can't be run.

That is what I think should happen.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

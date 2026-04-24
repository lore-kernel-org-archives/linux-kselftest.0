Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630503246FE;
	Fri, 24 Apr 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021575; cv=none; b=IRVDdGw+gaMEMi9TiTtzWqBuElR94IW45LkwibtklKWNAn0Ahlt3bDT0mSeTfhmmZwSbHGtxg6qd0Pgvq19Klu+t5EGSDGZdwAynDBs0pth86gJarYBptFtBVfxQBVpKeEtLB+MvY3hfkSY4epUrCXVrKrJBE0qa7+C2msGfTz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021575; c=relaxed/simple;
	bh=Eqs6++VaXzXK2oCNs0ypz/p7uryfVKm+dN7QvTQgnF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bePijPSo0Uyp4TMm++Qh5JHBSg0a0kfyEKbHal7fHlNTZ0PRR4O8eqbJ1VsErsXJuJMd9f3Wp7NF2UCRU78QpvrIcMiG6k4KSfTB+dWFQFYFFcQWrcdp40j2RgwjrK5ksw27P2UZC1wx5k6bpqFtrmSgYEtH0N0feQaAUx2526E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DhT4GUV9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DhT4GUV9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 670771BC0;
	Fri, 24 Apr 2026 02:06:07 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328F73F23F;
	Fri, 24 Apr 2026 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777021572; bh=Eqs6++VaXzXK2oCNs0ypz/p7uryfVKm+dN7QvTQgnF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhT4GUV9Q4sw94CFzv0hrv1uJj0+Y+ED2z6rr8bnVXe7yk4AK6LAxPlGdZaa2To8Y
	 6ZW8kLOpE2lrZMGZ5TwN50VltHBmw2C/kGc1m35TIi2p5TeWLIYsIzBcR/t9TBsKeW
	 WcVCbFWL2F0OD8YIa+qbuKGvz9pW2ov5n9gUxyuE=
Date: Fri, 24 Apr 2026 10:06:06 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/rseq: Add config fragment
Message-ID: <aesyHCASBdbSGbHl@J2N7QTR9R3>
References: <20260424-selftests-rseq-config-fragment-v1-1-fcf60116e690@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-selftests-rseq-config-fragment-v1-1-fcf60116e690@kernel.org>

On Fri, Apr 24, 2026 at 12:16:22AM +0100, Mark Brown wrote:
> Currently we do not provide a config fragment for the rseq selftests but
> there are several options which are either required or helpful for
> running them:
> 
>  - CONFIG_RSEQ is required for obvious reasons, it is enabled by default
>    but it doesn't hurt to specify it in case the user is usinsg a
>    defconfig that disables it.
> 
>  - CONFIG_RSEQ_DEBUG_DEFAULT_ENABLE turns on runtime debug checks which
>    would for example have helped spot some of the recent issues we've
>    seen on arm64:
> 
>       https://lore.kernel.org/all/87zf2u28d1.ffs@tglx/
> 
>  - CONFIG_DEBUG_RSEQ enables debugging on configurations that don't have
>    generic entry support.
> 
>  - CONFIG_RSEQ_SLICE_EXTENSION is tested by the slice_test test, the
>    test will fail without it.
> 
> Add a configuration fragment which enables these options, helping
> encourage CI systems and people doing manual testing to run the tests
> with all the features and additional checks.  We also enable
> CONFIG_DEBUG_KERNEL and CONFIG_EXPERT which are dependencies for these
> options.

As a heads-up, it might be worth waiting on the DEBUG bits for now given
Linus's comment at:

  https://lore.kernel.org/linux-arm-kernel/CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com/

i.e.

| (a) the debug code in question needs to just be removed, since it's
| now actively detrimental, and means that any kernel developer who
| *does* enable it can't actually test this case any more. It's checking
| for something that has been shown to not be true.

... but it probably makes sense to enable the SLICE_EXTENSION option if
we have tests for that.

Mark.

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/rseq/config | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/rseq/config b/tools/testing/selftests/rseq/config
> new file mode 100644
> index 000000000000..d11b8c61530e
> --- /dev/null
> +++ b/tools/testing/selftests/rseq/config
> @@ -0,0 +1,6 @@
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_RSEQ=y
> +CONFIG_EXPERT=y
> +CONFIG_RSEQ=y
> +CONFIG_RSEQ_DEBUG_DEFAULT_ENABLE=y
> +CONFIG_RSEQ_SLICE_EXTENSION=y
> 
> ---
> base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
> change-id: 20260423-selftests-rseq-config-fragment-65f09caf0276
> 
> Best regards,
> --  
> Mark Brown <broonie@kernel.org>
> 

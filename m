Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0657A368D71
	for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 15:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787497915; cv=none; b=qlq+KSlJyceVdTpGW1RiK+ea0tvDh2dy+nfSPWwUwCsTkd+aSYPN+yTbxpHAXFxKWMPhmMa+FZ93fTlKOSYbMBPqSQh/0+FLtnKj60WrqZ2j6OuFXtFz1blYP5rZfn+0R/pFPeH/zUA44WxUkYc6eEmCuf8V4cMQ0pQMiyRdKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787497915; c=relaxed/simple;
	bh=wN7phHfatcxYBR35GZv1j/HBpAOLfnlieigC/Z3unIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1FNV9BWvlVYw7cGoZEkhpCUJFapOPijEFT++xORP1CkuK7zgM7r7E9INebTlpv3ERW2BLS1gy1SSQCJNuo3Nm0cY2ZFfQujHWj00kIDkxyZfgEFRnGk+qpFA7r1wHLEZiuDNzzVMY44KiVW/BZi4JghVZMueZChbwVK7+22d/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmzTwMym; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmzTwMym"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf27856f9cso28321215ad.2
        for <linux-kselftest@vger.kernel.org>; Sun, 23 Aug 2026 08:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787497913; x=1788102713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YbIlg8dIjnpR63MW1vUdhKg/iWY1N5uFRgHAz69xPY=;
        b=FmzTwMymcXZGBZ+92OEzMIS7IbVR8NDf+/1vEbeSWc/OzxQ4pnIhs1UEPZg77QSb63
         0ZPOAOfs64sj96+M3/jJ0dYpCd2LCrKEHk4rORbZGZjah7EBaPpn8wzPHOBQtO1s4uZW
         AsvheoH0A/eOJjmNroK716oB+GULsSKicjktcr3AYrRiL2Qtk3fFtTq40ilT8+JpZAxF
         rAw7XQmdOqfcb6fIDhe7+9Tt+s5gVT/qawdXQay6fONNpUF9xW+55D09ymyOKSoNBU6c
         eP6tMZYhtoC3jeduEsoFj6Y7tn2vh3o5/MgyDdCRLL697v3WEqky6ZQjxoYEE/tjEDmY
         A94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787497913; x=1788102713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YbIlg8dIjnpR63MW1vUdhKg/iWY1N5uFRgHAz69xPY=;
        b=jSj8dC7fCPvFXMdVjULPg15j2HLV3qyk+EpkaKtb5OfoEvU55lUkWVAIEYb1qobPFN
         n0Kqm3o4azfss7lKHHBFAXi8GDL9Fn427fz+769vDFVykseQrwoMOZ44ymBjBr+zGI/f
         4YKu5+h1salQ8N4qZ64XBohu8rVEH7uEzMD1EJakE5l426/MMGD0dmXmfDZig7wYTDsq
         zEddvkN7LfryFdWE6TMFMKC0fIiDoVZYFRfDSjtdWo4j+rwTBo/5jFnGua8ZN+bwUixl
         GtJKeHIaVfa0jctlxEr/GJzPo1cCKlGTQSmJLUHsi6Kj/vCYVOj+1N0rPo7l+QB5C8NI
         Xnkg==
X-Forwarded-Encrypted: i=1; AHgh+RoymLj23dyx49R4JXKT2KeolIvbuDfb9myqD1X1+haNyHdT+1HHGnaBO6IEGVQq08TUDhw4ZPp9umbn6RVN+Cs=@vger.kernel.org
X-Gm-Message-State: AFuF++n4WZsi4KQkdLa65dkp+llxgMmv2k7hrqI/pY/HgZbuKe13nfEy
	rDCrGNjfEiwciLAlDMNkqa5Y//mHH0+vjRfu4QJLFoxuR5pBO36WRFoT
X-Gm-Gg: AR+sD13hym04Uu4O4xf/rfQOp99O5ehr6W+dfMLFrKlwxDAR3vM8pSj36BVvyMx3A2H
	0H8HXFdFtqrTWjRnTsnTzaHPALeNCeXm4j3D+3pKc4gPajQfQLDqbAc3RcsFMO8KkZRmbU098PU
	7Rnxvh7toiDylHgRLTsXjHB2BOpL6eGvPGH+0B4oGmOMFQWxx14Fqr/B/hek3/OF8fRRP/AnwbE
	hJQoy3Y3mTAZyj2uHfgk5wdpIqvvg66w9OnCeSDHf/FwxmBusF32T4vphma3AKK+ajyTmj/SYxJ
	Ik6AA6ZEJlyRhUvcs+Bo9qi+Obyv4ccQJmqBpgn/rYMh+Z0S9vs3ZOSIVv++mqBpdNL4SwCCwWI
	mGvlOL+gvhsZjR4SptiTSendFHDJFaDovNxsngn0byAPSI6uf0RjzOiPyR6041Web2FnUmvSX0T
	D31gvpnSyLiVpRwuazHDaAcVDZvV8dsvXmI98OLAfiLmsdlBo9iRekI4BM/Z1I
X-Received: by 2002:a17:902:ce08:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d64afe9569mr381323185ad.10.1787497913093;
        Sun, 23 Aug 2026 08:11:53 -0700 (PDT)
Received: from google.com ([118.150.148.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d6768d9004sm10101025ad.70.2026.08.23.08.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 08:11:52 -0700 (PDT)
Date: Sun, 23 Aug 2026 23:11:46 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Ryota Sakamoto <sakamo.ryota@gmail.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Petr Mladek <pmladek@suse.com>, Kir Chou <note351@hotmail.com>,
	codemender-patching+linux@google.com,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH 2/2] lib/tests: Add KUnit test for struct stack_trace
 __counted_by_ptr attribute
Message-ID: <aosNst7K9zaClFEH@google.com>
References: <20260823123549.1120133-1-morbo@google.com>
 <20260823123549.1120133-3-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823123549.1120133-3-morbo@google.com>

Hi Bill,

On Sun, Aug 23, 2026 at 12:35:33PM +0000, Bill Wendling wrote:
> Add a custom KUnit test suite 'stacktrace_counted_by' to verify that the
> __counted_by_ptr annotation on the 'entries' field of 'struct stack_trace'
> behaves correctly.
> 
> The test verifies that 'max_entries' correctly limits and validates access
> to 'entries' when CONFIG_ARCH_STACKWALK is not defined. If it is defined,
> the test is cleanly skipped at runtime to prevent compile-time or runtime
> failures due to 'struct stack_trace' being undefined on modern
> architectures.
> 
> Assisted-by: Gemini Next
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
> Cc: Kees Cook <kees@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Brendan Higgins <brendan.higgins@linux.dev>
> Cc: David Gow <david@davidgow.net>
> Cc: Rae Moar <raemoar63@gmail.com>
> Cc: Ryota Sakamoto <sakamo.ryota@gmail.com>
> Cc: Kuan-Wei Chiu <visitorckw@gmail.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: Dmitry Antipov <dmantipov@yandex.ru>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Kir Chou <note351@hotmail.com>
> Cc: codemender-patching+linux@google.com
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: linux-hardening@vger.kernel.org
> ---
>  lib/Kconfig.debug            | 10 +++++++
>  lib/kunit/.kunitconfig       |  1 +
>  lib/tests/Makefile           |  1 +
>  lib/tests/stacktrace_kunit.c | 51 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 lib/tests/stacktrace_kunit.c
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index e97bdf3a42a8..51a6ac1a2461 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2716,6 +2716,16 @@ config BITOPS_KUNIT
>  
>  	  If unsure, say N.
>  
> +config STACKTRACE_KUNIT_TEST
> +	tristate "KUnit test for stacktrace counted_by attribute" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables the KUnit test for verifying the __counted_by_ptr
> +	  attribute on struct stack_trace.
> +
> +	  If unsure, say N.
> +
>  config BITFIELD_KUNIT
>  	tristate "KUnit test bitfield functions at runtime" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> diff --git a/lib/kunit/.kunitconfig b/lib/kunit/.kunitconfig
> index 9235b7d42d38..b3761b41459e 100644
> --- a/lib/kunit/.kunitconfig
> +++ b/lib/kunit/.kunitconfig
> @@ -1,3 +1,4 @@
>  CONFIG_KUNIT=y
>  CONFIG_KUNIT_TEST=y
>  CONFIG_KUNIT_EXAMPLE_TEST=y
> +CONFIG_STACKTRACE_KUNIT_TEST=y
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 4ead57602eac..40875e729fc8 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -6,6 +6,7 @@
>  CFLAGS_bitfield_kunit.o := $(DISABLE_STRUCTLEAK_PLUGIN)
>  obj-$(CONFIG_BASE64_KUNIT) += base64_kunit.o
>  obj-$(CONFIG_BITOPS_KUNIT) += bitops_kunit.o
> +obj-$(CONFIG_STACKTRACE_KUNIT_TEST) += stacktrace_kunit.o
>  obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
>  obj-$(CONFIG_BITS_TEST) += test_bits.o
>  obj-$(CONFIG_SHDI3_KUNIT_TEST) += shdi3_kunit.o
> diff --git a/lib/tests/stacktrace_kunit.c b/lib/tests/stacktrace_kunit.c
> new file mode 100644
> index 000000000000..7ec48edf84fe
> --- /dev/null
> +++ b/lib/tests/stacktrace_kunit.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for struct stack_trace counted_by attribute.
> + */
> +
> +#include <kunit/test.h>
> +#include <linux/stacktrace.h>
> +
> +#ifndef CONFIG_ARCH_STACKWALK
> +static void test_stack_trace_counted_by(struct kunit *test)
> +{
> +	unsigned long entries_buf[4];
> +	struct stack_trace trace = {
> +		.entries = entries_buf,
> +		.max_entries = 4,
> +	};
> +
> +	KUNIT_EXPECT_EQ(test, trace.max_entries, 4U);
> +	KUNIT_EXPECT_PTR_EQ(test, trace.entries, (unsigned long *)entries_buf);
> +
> +	/* Write to the allocated elements to verify access */
> +	trace.entries[0] = 0xdeadbeef;
> +	trace.entries[1] = 0xbeefcafe;
> +	trace.entries[2] = 0xcafebabe;
> +	trace.entries[3] = 0x12345678;

This only does in bounds array writes.
To test __counted_by_ptr, I thought we were supposed to intentionally
trigger an out of bounds access and see if it actually catches the
error?

Regards,
Kuan-Wei

> +
> +	KUNIT_EXPECT_EQ(test, trace.entries[0], 0xdeadbeefUL);
> +	KUNIT_EXPECT_EQ(test, trace.entries[1], 0xbeefcafeUL);
> +	KUNIT_EXPECT_EQ(test, trace.entries[2], 0xcafebabeUL);
> +	KUNIT_EXPECT_EQ(test, trace.entries[3], 0x12345678UL);
> +}
> +#else
> +static void test_stack_trace_counted_by(struct kunit *test)
> +{
> +	kunit_skip(test, "CONFIG_ARCH_STACKWALK is enabled, struct stack_trace is not defined");
> +}
> +#endif
> +
> +static struct kunit_case stacktrace_test_cases[] = {
> +	KUNIT_CASE(test_stack_trace_counted_by),
> +	{}
> +};
> +
> +static struct kunit_suite stacktrace_test_suite = {
> +	.name = "stacktrace_counted_by",
> +	.test_cases = stacktrace_test_cases,
> +};
> +
> +kunit_test_suite(stacktrace_test_suite);
> +
> +MODULE_LICENSE("GPL");
> -- 
> 2.55.0.860.g4b6b3295ed-goog
> 

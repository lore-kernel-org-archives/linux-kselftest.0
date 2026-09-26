Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E703E40FE;
	Sat, 26 Sep 2026 10:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419051; cv=none; b=dgUBe6EGGYFt1RD28W6PjJDvLoVHdRUwvjK2alFwOGweMNYnppaHKI1KC4kgoblBmsxdG+Wu2N5dTA9Jgw5AUcMhndt7YkmHCwiXi6z2KsUhD0sLhJXaODRM6WL9vJdDcSG5otXY0RGSFcDNR8pyWdmtrK3KaE30z3BN/L1T4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419051; c=relaxed/simple;
	bh=BsDGVDEZSjuhu1wNUX4iNYuYBfY23zxzKR2rBx/mxOo=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=TbQcATRc573KYyI7rdWmay60rORHekhf9OoHP414wlw+en4GPPBsJ7WRqVw1NrLOHHxaCCNK1KRA731KyN1V6kZHZoKpOGL0Ys92uR/zHr5gQCwOnkRtaNHt//QZyFIajoPeVhwyxP9kSyzkztDvfRzCV45XPbAwa76tUWYxNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oIFBsw/w; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Vvr4vhpW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oIFBsw/w";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Vvr4vhpW"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790419035; bh=qB8YO82ighs/+w1xBuYuRJG
	hgPr1wHIB0u6dBJhEEYQ=; b=oIFBsw/wexO9q/uuLmIrOWOcwxXLfyJAeTpf7/N3EeJpQrpx9Q
	w1pxbjIwp8gIRlc6dmbcVQmqf3xtX6K31BpQot8pLLZEAyzI3FvpAKbB4N/USrh58mpgQsrM/A0
	jLGPWB/nCSJYaMY55aMpmewGbjqmmqadEurcf+phgCFs3+UDrfTieWb/RhGnDCdNTBcMUFSdhG4
	F7YyGq/Lrp/L0Pl720qxwxnZ8WMlLxxPXYts254og+4OiJhUOLBdYDOZv7mPgs3DSNFDjLGN51L
	ltT1pYIp3E0DRoiyCAX/ZDS1KMzbfzkW5W74WF8y7d7ZZ1/wnR3m2VcXuuFBB8I39oA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790419035; bh=qB8YO82ighs/+w1xBuYuRJG
	hgPr1wHIB0u6dBJhEEYQ=; b=Vvr4vhpWGj83aYoajP9W6LFKV5bXd/DBPEcVP6QHZsfSIQvsjD
	T00tzR9CailePm2KfVPKL7Urj+0Ou3Q6htBA==;
Date: Sat, 26 Sep 2026 11:37:15 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kmehltretter@gmail.com
CC: akpm@linux-foundation.org, brendan.higgins@linux.dev, david@davidgow.net,
 geert@linux-m68k.org, huang.ying.caritas@gmail.com,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, raemoar63@gmail.com
Subject: Re: [PATCH] resource, kunit: stop selecting GET_FREE_REGION
In-Reply-To: <20260926002651.87267-1-kmehltretter@gmail.com>
Message-ID: <40EFC2A1-D089-4E09-A804-CE0D42EACFAE@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 26 September 2026 01:26:51 BST, Karl Mehltretter
<kmehltretter@gmail.com> wrote:
>RESOURCE_KUNIT_TEST selects GET_FREE_REGION even when no other option
>needs it. Remove the selection to follow the dependency rule in
>Documentation/dev-tools/kunit/style.rst.
>
>Skip resource_test_region_intersects() when GET_FREE_REGION is disabled.
>GET_FREE_REGION has no prompt, so configurations without a production
>consumer cannot enable it. Most configurations will therefore skip this
>case; this is intentional. The union and intersection tests remain
>available.
>
>Since kunit_skip() does not return, the compiler drops the reference to
>the unavailable alloc_free_mem_region(), as in the CONFIG_OF_ADDRESS
>check in drivers/of/of_test.c.
>
>Fixes: 99185c10d5d9 ("resource, kunit: add test case for region_intersects()")
>Assisted-by: LLM
>Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
>---
>Validation:
>- Clang 22 and GCC 13 ARM builds pass with RESOURCE_KUNIT_TEST=y and =m
>  while GET_FREE_REGION=n. The built-in vmlinux images have no
>  alloc_free_mem_region symbol, and the modules have no undefined
>  reference to it.
>- Clang 22 x86_64 builds and QEMU 11.0.2 runs pass. GET_FREE_REGION=n
>  reports two passes and resource_test_region_intersects as SKIP;
>  DEVICE_PRIVATE=y enables GET_FREE_REGION and reports three passes.
>
> kernel/resource_kunit.c | 3 +++
> lib/Kconfig.debug       | 1 -
> 2 files changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/resource_kunit.c b/kernel/resource_kunit.c
>index 42785796f1db..9eeb2b1a85c0 100644
>--- a/kernel/resource_kunit.c
>+++ b/kernel/resource_kunit.c
>@@ -225,6 +225,9 @@ static void resource_test_region_intersects(struct kunit *test)
> 	struct resource *parent;
> 	resource_size_t start;
> 
>+	if (!IS_ENABLED(CONFIG_GET_FREE_REGION))
>+		kunit_skip(test, "CONFIG_GET_FREE_REGION is disabled");

Interesting.

Reviewed-by: Bradley Morgan <brads@mainlining.org>

Tested on Power10 (PowerPC), in courtesy of osuosl:

Tested-by: Bradley Morgan <brads@mainlining.org> # Power10


>+
> 	/* Find an iomem_resource hole to hold test resources */
> 	parent = alloc_free_mem_region(&iomem_resource, RES_TEST_TOTAL_SIZE, SZ_1M,
> 				       "test resources");
>diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>index 134b15a44625..e7c5d5b5870f 100644
>--- a/lib/Kconfig.debug
>+++ b/lib/Kconfig.debug
>@@ -2776,7 +2776,6 @@ config RESOURCE_KUNIT_TEST
> 	tristate "KUnit test for resource API" if !KUNIT_ALL_TESTS
> 	depends on KUNIT
> 	default KUNIT_ALL_TESTS
>-	select GET_FREE_REGION
> 	help
> 	  This builds the resource API unit test.
> 	  Tests the logic of API provided by resource.c and ioport.h.
>
>base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds

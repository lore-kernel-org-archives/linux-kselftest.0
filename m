Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523745;
	b=MIlwzoy7k2U1pz+90Qojb3An4RJwOFjmGvfLfMbFe39XUWLNHBgznSS39YR7+vRskRas
	 pZD4tg3lwj1Kj82/ZDBUhAh+1TmgE/1Ds98aA83Er4xjeJO4LFJxWZWSNA7H6nsmVRjAf
	 pLx5ZBHK0VpsjbfV3CBZq5I+QZj+++MXlaRTOaX09igXFUm3k1qUGPfi0an484p3yyqO2
	 bwiLtN5oAYvoklazbzD6sOfpgqgk/tbkP2rDVDGTgatof8jrQ7grP2j8uy7DLNc1um8Rf
	 Q4gd0dEoc+7XWI7vQvWfcv2wX5sSsBZp8OInP/jfxoJ5qbyfBDQt/5Hb2/1/3muUKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523745;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wI3p+YFMsDDPnyhy/ooDHa6Q6Ez070BIob1RsZs6fmg=;
	b=FNdk/SzlVbp3h4D+XiEwUxNCQH4wbDFP2LAm3qkc2V8/23D0TTviogBu/FL0W/huzCy/
	 sWokqDESNCZL2+IEHaoA2wW37sgCB/NNuBqzaLw/03TU+f2JG5pbsmZMczTlV6JZ9M//j
	 xwxNpKRZ3QBMAEzYXrleIx9Qx2s1nrZKSR79j56aaNk3a/yOnb4v5pMMcdz4hhFFxb9t2
	 siQnW7O/Ye+H0EJaCr6jxZ5Vsr0UO0XkbVDxgJGfXz5sgw+C2dLuiVg3llVUmxlwDWwQ1
	 wJHxflomLytkV2UeXIRtnXeNOkt8NbvSzLbFuTKSi0Xyo+mw4sCkZ0f0pUcU11L9Nyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJ3fBm4z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C42606A335;
	Thu, 12 Nov 2026 22:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OJ3fBm4z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37941F000CA;
	Thu, 12 Nov 2026 22:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794523745;
	bh=wI3p+YFMsDDPnyhy/ooDHa6Q6Ez070BIob1RsZs6fmg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OJ3fBm4zTqOxKfAgpyy8NInHfLx2WwMDVfJjO8iDCaN4vixR8hUea9SoQB3UHuQ2E
	 e8y/8Io1oq4Kggn5PijcShJDhkfVX4m9WJ8lNCIZUcK3xRe7jDM0TObIgx+Jp46a/Z
	 MUWS0G19Me2yv/i5YQBNKIA7yTe+knmCWg5Y01V5F6JQovaGDduLEBO4aS52CELYdZ
	 dHh8R+UdxWGJ2iqfZqAcwTXNQg1UfiYl1RA17KvEXLx3mpIJE/eu4bII+cipK6liIH
	 upyKA/QT/0XLGVKFBmFVHGlbBENk48Y5o9rjT7dn1pxfSxGTO7RqHJ0n8VCCHBP1EM
	 HHHEgaZSWpTFA==
Subject: Re: [PATCH net-next v4 5/5] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me,
 leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com,
 bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 12 Nov 2026 22:49:03 +0000
Message-ID: <179452374350.2199510.6232070407318094793@kernel.org>
In-Reply-To: <20261111224740.2744522-6-sdf@fomichev.me>
References: <20261111224740.2744522-6-sdf@fomichev.me>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new TX large-niov test (check_tx_large_niov in devmem.py
  and check_nk_tx_large_niov in nk_devmem.py, both calling…

--

selftests: drv-net: devmem: TX from a hugepage-backed dmabuf

This adds a -H option to ncdevmem that backs the udmabuf with 2MB
hugepages. It also adds a TX test, run from both devmem.py and
nk_devmem.py, that sends a 3MB patterned buffer from that udmabuf so the
frags cross the 2MB net_iov boundary. The received data is checked by
comparing sha256 hashes from the remote side.

> diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> index 71b916c161969..8058fd1ddd501 100644
> --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py

[ ... ]

> @@ -63,10 +66,15 @@ def require_devmem(cfg, rx_page_size=RX_PAGE_SIZE_DEFAULT):
>          # ncdevmem's queue range and cause the probe to fail.
>          cfg.devmem_supported = {size: _probe_devmem(cfg, size)
>                                  for size in PROBE_RX_PAGE_SIZES}
> +        cfg.devmem_hugepages = _probe_devmem(cfg, RX_PAGE_SIZE_DEFAULT,
> +                                             hugepages=True)
>  
>      if not cfg.devmem_supported[RX_PAGE_SIZE_DEFAULT]:
>          raise KsftSkipEx("Test requires devmem support")
>  
> +    if hugepages and not cfg.devmem_hugepages:
> +        raise KsftSkipEx("Test requires a 2MB hugepage-backed dmabuf")
> +

[Severity: Medium]
Can this probe succeed anywhere other than a 4K page kernel whose default
hugepage size is 2MB?

Before the probe, the only reservation is _reserve_hugepages(). It writes
64 to the default hstate's sysctl:

NR_HUGEPAGES_FILE = "/proc/sys/vm/nr_hugepages"

def _reserve_hugepages(want=64):

That sysctl only grows the pool for the default hugepage size. On arm64
with 16K or 64K base pages, the default size is 32MB or 512MB. An x86
kernel booted with default_hugepagesz=1G has the same problem. In those
setups the 2MB pool never grows.

With -H, udmabuf_alloc() always requests MFD_HUGETLB | MFD_HUGE_2MB. The
probe allocates its buffer in run_devmem_tests():

	mem = provider->alloc(getpagesize() * NUM_PAGES);

NUM_PAGES is 16000 and the size is rounded up to 2MB. That needs 32
hugepages on 4K pages, 125 on 16K pages and 500 on 64K pages. So even
when 2MB is the default size, 64 pages are too few on non-4K kernels.

In both cases UDMABUF_CREATE fails and cfg.devmem_hugepages ends up False.
check_tx_large_niov() and check_nk_tx_large_niov() then always skip with
"Test requires a 2MB hugepage-backed dmabuf". That message does not say
that the hugepage pool is the cause.

Before this patch, hugetlb was only used when rx_page_size >
getpagesize(). So -H looks like the first user to hit this on non-4K
kernels.

Would it make sense to reserve pages through
/sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages instead? The count
could be derived from the size ncdevmem will allocate, or -H could use a
smaller buffer.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111224740.2744522-1-sdf%40fomichev.me

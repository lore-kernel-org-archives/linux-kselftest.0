Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793574091;
	b=JfppM3/3xGiHil+j/79kcMCyXU4+5sviwnTwtZ21eV/m6ZY4qpzrtbtHJ7SLJU1qH8RI
	 ihxWDdrOHUYQ8NoQ0Ho9LBRS44EwsTv2PAHqgqrphImSrJ59R3mY1KhNwVmT1b/AzRveN
	 c6JT1CCE7+CGJxD1jHgd8qVSyAtGw3SpG5Corhyhn3Xg8mjWClgoaHswyBS+sxnVJBN6j
	 vYmfra/E+QqFlJ+dHsVUDLqC7kmFsaSFY2W7D1cLhTnDoiKRXO4kEDuy5ueWwTNEyhj5V
	 vz2w+TeZ/4ulUTAPdaxW+iRoKgqMj5KxK6qP8ilwQgyqX4RIen11xlEWOKbrrXiWd+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574091;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0UiNF2mRSaBX03RL18h3QU/ZLYC6k7KWXPLfr5uKQu4=;
	b=JO/mx3ERjJQO/P1ojJwwdqu0YV7cfojCeMcZGub2xFBCGLWJf99mfZ3h7wuzU55j9Zdo
	 xwtBqrn3x8yBI9Nyl6Ulpa2sWKwVGJfsMqDnEUzxlJa+fnFS6V5lVzFuHZM5IOY8YCB5c
	 qS5S5qIQ99zzxQZbMjjvBzrq2h8jpXoz8YTx7tIK5p9fjoIGpq4IbPOtbkM6CggZx/WjB
	 SK7YIyPBRT0TrdBtB0oplqs0uiWYsJcu17eN+0tyVrvTOiY2iVV0gdzHE3mcLMkrqr0ry
	 RXc9sFHDbzwI+wxr3/THwdsGjPTR+ITbaE4FneFN86oa2xabPRw6AkAGrC1SenkQ6jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0UZpGav;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB1D606A337;
	Sun,  1 Nov 2026 23:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a0UZpGav
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731061F000C1;
	Sun,  1 Nov 2026 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793574090;
	bh=0UiNF2mRSaBX03RL18h3QU/ZLYC6k7KWXPLfr5uKQu4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a0UZpGavCMbxV+NQxzhWQsTFySbnG8gry1G//WQT0WydeYudWgbOp03/WnWxVVZRb
	 OTZ5O/bObqbOQ2lnvDuqTrbMKrQDSG2mMu8Ic2RZ/QDEWKdcoh7H8BEDWINCPo2y6G
	 04XXsIRKc5Jce3MPgVCOE4WUHAqwtOA3i67XPp/9/b7vHBI9EssL6xraFBBBZqCIOt
	 eRizDTPiCH4KElKTyaF9T+XBHHLk2SwwZm4NswkCF2Tzr3pAC/qmsV9DeqgkKYTxpK
	 PXxGFAsocL6dnXmpZT1ajaFrBNQJ9Fc6BbV5uRRLZF33hUnZHalD2u4mOsNc/JtfyZ
	 3iZmqZmkwtRiw==
Subject: Re: [PATCH net v5 4/4] selftests: net: add devmem RX and TX netdev
 unregister tests
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me,
 kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com,
 asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org,
 andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org,
 ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org,
 tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Date: Sun, 01 Nov 2026 23:01:27 +0000
Message-ID: <179357408797.3131.706180156061595645@kernel.org>
In-Reply-To: <20261030083539.777877-5-almasrymina@google.com>
References: <20261030083539.777877-5-almasrymina@google.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch adds CONFIG_UDMABUF=y to
  tools/testing/selftests/net/config, but the fragment does not pull in…

--

selftests: net: add devmem RX and TX netdev unregister tests

This adds devmem_bind_rx_unregister_check and
devmem_bind_tx_unregister_check to nl_netdev.py. They check that removing a
netdevsim device while a netlink socket holds an RX or TX devmem binding
detaches the dma_buf right away. The commit also adds the dma-buf, udmabuf
and devmem options the tests need to the net selftest config fragment.

> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index d4416f8bdcfd1..7a89e2618d4c4 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config

[ ... ]

> @@ -133,6 +136,7 @@ CONFIG_TEST_BLACKHOLE_DEV=m
>  CONFIG_TLS=m
>  CONFIG_TRACEPOINTS=y
>  CONFIG_TUN=y
> +CONFIG_UDMABUF=y

[Severity: Low]
Will CONFIG_UDMABUF=y actually get enabled from this fragment on a minimal
base config? UDMABUF in drivers/dma-buf/Kconfig has these dependencies:

config UDMABUF
	bool "userspace dmabuf misc driver"
	default n
	depends on DMA_SHARED_BUFFER
	depends on MEMFD_CREATE || COMPILE_TEST
	depends on MMU

CONFIG_SYNC_FILE=y takes care of DMA_SHARED_BUFFER. MEMFD_CREATE has no
default, though, and can only be set directly under EXPERT. Normally it
is turned on because TMPFS or HUGETLBFS selects it, and this fragment
asks for neither.

If the base config has MEMFD_CREATE=n and COMPILE_TEST=n, Kconfig will
quietly drop UDMABUF. Both new tests would then skip in _create_udmabuf()
and never reach the unregister path:

    if not os.path.exists("/dev/udmabuf"):
        raise KsftSkipEx("/dev/udmabuf is not available")

tools/testing/selftests/bpf/config lists CONFIG_TMPFS=y next to
CONFIG_UDMABUF=y, and tools/testing/selftests/drivers/net/hw/config has
CONFIG_HUGETLBFS=y. Should CONFIG_TMPFS=y be added here as well?

>  CONFIG_USER_NS=y
>  CONFIG_VETH=y
>  CONFIG_VLAN_8021Q=y

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030083539.777877-1-almasrymina%40google.com

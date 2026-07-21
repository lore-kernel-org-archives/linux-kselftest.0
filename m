Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47C369D74;
	Tue, 21 Jul 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641859; cv=none; b=kg1Nk5601/MtXxDCpXjOVwGrKeKZstTD3ArXOkQuZXA2ijqhx6MLioep52cFwQEdmsSoFjWXodTwgRlsK0yFCz3UVIBFFSSIjF19gDi7gelF8WtgwdbK8Ej+8l7O+UC7XkCahLZSZ9ncFnq0snKcU0x6/S33N1qRVy8V99BiGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641859; c=relaxed/simple;
	bh=J8G6Y7sMAm2Bfx3daJI65rV5YxrFj8fuSBsz6vRjiRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uq6oAqSqjnGOtoxxQqZvLFc89ZhXacoETJr5nUgY0u68R/Pl0tMlyYhrwZ9ylx/7v0MLrmvfkne60jkOWOgzXRH0zuOTvesF9n2Sc4aFcrB/NGpUWKd5ycGPxgEW6nw152W8BeNI5jKHZB1DZyjsW51ViqoEV0PRfIyWkIl4Gq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiJhwPvN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiJhwPvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39A61F000E9;
	Tue, 21 Jul 2026 13:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641857;
	bh=XMsV2RHX+b+350X4sElblljKrpETk4dW9a+/EmEks1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CiJhwPvNcLKVAyHFeFR++fBeVuA/OwQSeE2WQB3vPBdRRRKAXL24MXSfeuS7u41Uq
	 lbnrv1BomMo4DCSMI9JLraDwQz954vGMZapj8Tgt+d2F+M+ibA1YWZ7eEhjCewtmPo
	 7BGjo16PGLyL97ARLnm6HLU2RkhmZNZiRD/UMCHulhkGWTqyeBfaFmPVzo11qfabfu
	 RAxgAt5iey+pA8dWsETrJKtBWlJYrSC7ZSXEQrjksSsQsr9GSpckD8GEaFX1/TO3V9
	 xEqs0BYeNpwma2OKepKOcJv/HmzpklZtXIbtw/5Yguj4ApN+mZpDP7bKK7fEcvokFK
	 BG3tqIm8FPxyQ==
From: Simon Horman <horms@kernel.org>
To: equinox@diac24.net
Cc: Simon Horman <horms@kernel.org>,
	pabeni@redhat.com,
	kuba@kernel.org,
	idosch@nvidia.com,
	dsahern@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	fmancera@suse.de,
	lorenzo@google.com,
	maze@google.com,
	prohr@google.com,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	furry13@gmail.com
Subject: Re: [PATCH net-next 8/9] selftests: net: RFC6724 rule 5.5 tests
Date: Tue, 21 Jul 2026 14:50:51 +0100
Message-ID: <20260721135051.388459-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714094030.136317-9-equinox@diac24.net>
References: <20260714094030.136317-9-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
https://sashiko.dev/#/patchset/20260714094030.136317-2-equinox@diac24.net?part=8
---
--- Patch [8]: [PATCH net-next 8/9] selftests: net: RFC6724 rule 5.5 tests ---
commit ae975bc04160e9173acb7759f9db7580aa0ca14e
Author: David 'equinox' Lamparter <equinox@diac24.net>

selftests: net: RFC6724 rule 5.5 tests

This commit introduces a new Python-based test script to verify IPv6 source
address selection logic, focusing on RFC6724 rule 5.5. It also enables
CONFIG_IPV6_SUBTREES in the net selftests config and wires up the script in
the Makefile.

> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 708d960ae07d5..c07d2aebad695 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -53,6 +53,7 @@ TEST_PROGS := \
>  	ipv6_flowlabel.sh \
>  	ipv6_force_forwarding.sh \
>  	ipv6_route_update_soft_lockup.sh \
> +	ipv6_saddr_rfc6724rule5p5.py \
>  	ipvtap_test.sh \

[ ... ]

> diff --git a/tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py b/tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py
> new file mode 100644

[Severity: Medium]
Since ipv6_saddr_rfc6724rule5p5.py is added to TEST_PROGS in the Makefile,
the kselftest framework expects it to be directly executable. However, it is
being created with mode 100644 instead of 100755. 

Will this cause the test runner to skip the script or fail to execute it
during automated testing?

> index 0000000000000..682b39ba991da
> --- /dev/null
> +++ b/tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py
> @@ -0,0 +1,231 @@
> +#!/usr/bin/env python3

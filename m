Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4355841BA98;
	Mon,  5 Oct 2026 23:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242551; cv=none; b=u+3x/IfATeOgU1VvlvpPH8SHLjlvyU1lfxDF+mhVWShcjp1lakMHby5/2mwgFuDvbPF55DexhGLqGHcZ5Kuc4c7YV8UFBFNCSZWheeFUBN1qRRLiSiOMexD7hNVVt9MQGHwbak2h3XWf2ouzPRwKmMhO8kBBUAS16qUjs7nuxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242551; c=relaxed/simple;
	bh=RssDnjtFO70FHNgHPj2mng35k8gPB1FXpmWz1t9oM6g=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S8YcB7KchyJbhcyahnjFZMbxoMjjFbH9VNLFkZLPZYHu7JHDwtgOvnugfzfXqnPvxx6WngD/z9OcbSUHLqmLy8KGSriOLkDBBNFncdxwidPKlyceH8GuA1Ac9we2pF+PD0Pe5T5hQPnvWcL8lfzYrqChDCgKnl/dODOFK1GmrwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1UZt7TL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1UZt7TL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F641F000FF;
	Mon,  5 Oct 2026 23:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242550;
	bh=B37W2ggfSlaBeZulIaDwZEijuU5Z3dWtAfMqL59VIIY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X1UZt7TLuCLEAtOmxiB0tq4ACNtEakf/WBZYWGrv661EzkgKjiRYjr0RU3Iv2YzwE
	 L85ZFYvb+uolQWUO2A4OMKvhIHuSdM5q0E5AOpH+1EOVTaMSfBYvuPoyGTtVancPgO
	 ThX9U0meyQH6bBb5iXf/iBTcDrltx+L0OPGdks23i1Devg8DddFciI2Hp2ooERCTlX
	 aXDr8XrTKFqGVv3ZtVr889fGBCm5hXn35t1ak2wqQa86dDLUhz/OnT1+sEhlyDY1lE
	 EjBbjK4oW7MDzBBn5k0WefOJLKUTxG87vXaTVdHE8ltcee37uKu0yAu/xm1cs6ZwmH
	 Gv5kFM5OnXRrg==
Subject: Re: [PATCH net-next v2 7/8] selftests: tls: skip the zero_len tests
 when TLS is unavailable
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:29 +0000
Message-ID: <179124254912.434549.7790480487768819706@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-7-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-7-2dd1947bb642@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Backport problem.

--

selftests: tls: skip the zero_len tests when TLS is unavailable

This patch makes TEST_F(zero_len, test) skip when the fixture has recorded
notls. Without the check, all eight variants fail on a kernel built without
CONFIG_TLS, because the raw records go over a plain TCP socket.

> diff --git a/tools/testing/selftests/net/tls.c b/tools/testing/selftests/net/tls.c
> index 419c6cc0cc5e1..e6876b8caac89 100644
> --- a/tools/testing/selftests/net/tls.c
> +++ b/tools/testing/selftests/net/tls.c
> @@ -2663,6 +2663,9 @@ TEST_F(zero_len, test)
>  	int rec_off;
>  	int i;
>  
> +	if (self->notls)
> +		SKIP(return, "no TLS support");
> +
>  	zero_len_send_recs(_metadata, self->fd, variant->recs);
                ^^^^

[Severity: Low]
This isn't a bug, but will this apply cleanly when it is backported on its
own?

The Fixes: tag points at a61a3e961baf ("selftests: tls: add tests for
zero-length records"), so stable tooling will probably try to pick this up.
However, the trailing context line above, the zero_len_send_recs() call,
comes from the previous patch in this series, "selftests: tls: add peek and
splice coverage for zero-length records". That patch has no Fixes: tag.

A tree that has a61a3e961baf but not that refactor still has the open-coded
send loop at this spot in TEST_F(zero_len, test):

	for (i = 0; i < 4 && variant->recs[i]; i++)
		EXPECT_EQ(send(self->fd, variant->recs[i]->cipher_data,
			       variant->recs[i]->cipher_len, 0),
			  variant->recs[i]->cipher_len);

So the hunk context won't match there, and someone would have to rebase the
fix by hand. Until then, stable kernels without TLS would keep reporting the
false zero_len failures.

The missing notls check has been there since a61a3e961baf. Could this patch
go first in the series, written against the original send loop, so it can
be backported without the refactor?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org

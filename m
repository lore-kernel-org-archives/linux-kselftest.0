Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BD311977;
	Sat, 10 Oct 2026 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668623; cv=none; b=uz1iDGIm9NGu20y2sWSDNL3+qWquhFSmAmWqBWl87J0kROEPGKamJ0vwCVBKxRoYJ21VlqvRk5ZPWFjXQ3XEEa8IFIBL9mwIQmRxvIyQWCe7dPVjrZkfr1yKam5Yt3Rutj7Z7PE/pjQmnmMWEDI69TtmR7cyMk7tbe/u0S+P0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668623; c=relaxed/simple;
	bh=Z4zvWxNOlAXMv4+BqWk77s1JGJ6Rfo2Eyf/Lv3n4hpw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HrwsVq4qzLiWUOtXZ3yECpKyxXY04Kxb9BuB98nyyWjWDq3DmJxMs0PzEPMc13QMcXHBN8KFnWNuapKWUcc5aut29am2Rk8G1DKwtKIVHcMIivfspJJYNunqXhCc563jcDUI/jblVmzCA7/DdA72sYVjQTnbcA/99+M+bTCG+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIoirPlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIoirPlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66201F000FF;
	Sat, 10 Oct 2026 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668621;
	bh=rfAIQc/a9miUTb2D/TmtkkBVV0nIM16y9N9qMwyTwi8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DIoirPlrYhPoNTFZ+KoJUP4dOPFy0wApk25okUdSRq1W3kkEBZmBSSYkyb5qUkcX4
	 UzIubpS6uWLn/dqwy+1IQZKhvAv7E2x1YX53VaXcCH55NwdwPK3d+S9WJP1FJQ+IB8
	 7ksLeSRUuoKfH8aqT+LoOtIyTGLlgqpL10/Z8GVtDmbJmUnnH3Ej6ne+avouhBP/HL
	 OPfYrRJSL+8zAkH6ePIXm5+bihPwC74UDbvEhlFOVUtQ7YBttnWJThe1W2eQaRm7aS
	 n99/2uv/vPVvzV676b2YjDALfGidbvqNpfy+M6pzogEBCjscPfVfcO0b21B0Ir06tO
	 IYW1y5vEKI+2A==
Subject: Re: [PATCH net-next v2 1/7] psp: support rx rekey operation
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 21:43:40 +0000
Message-ID: <179166862015.434549.17532933495669454971@kernel.org>
In-Reply-To: <20261009-psp-v2-1-5596ab50f677@gmail.com>
References: <20261009-psp-v2-1-5596ab50f677@gmail.com>
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

- [Low] Data race on the new field psp_assoc::prev_generation.

--

psp: support rx rekey operation

This commit lets a socket that already has PSP state install a new rx
key. The new psp_assoc copies the existing tx state and keeps the
previous rx spi and generation as a fallback. Packets matching either
the current or the previous rx spi/generation are accepted.

> diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
> index b23c30898389c..fb80e15e43681 100644
> --- a/include/net/psp/functions.h
> +++ b/include/net/psp/functions.h
> @@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct psp_assoc *pas)
>  static inline bool
>  psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
>  {
> -	return pse && pas->rx.spi == pse->spi &&
> -	       pas->generation == pse->generation &&
> -	       pas->version == pse->version &&
> -	       pas->dev_id == pse->dev_id;
> +	return pse && pas->version == pse->version &&
> +	       pas->dev_id == pse->dev_id &&
> +	       ((pas->rx.spi == pse->spi &&
> +		 pas->generation == pse->generation) ||
> +		(pas->prev_spi && pas->prev_spi == pse->spi &&
> +		 pas->prev_generation == pse->generation));
>  }

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index a6b1c42dd626f..b5887171c84e7 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -304,6 +338,10 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>  		pas->generation |= ~PSP_GEN_VALID_MASK;
>  		psd->stats.stales++;
>  	}
> +
> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list)
> +		pas->prev_generation |= ~PSP_GEN_VALID_MASK;
> +

[Severity: Low]
Is this new write to prev_generation racing with the reader in
psp_pse_matches_pas()?

psp_assocs_key_rotated() runs with only psd->lock held, which is taken
in the key-rotate pre_doit before psp_nl_key_rotate_doit() calls it.
It does a plain read-modify-write on associations that are already
published through sk->psp_assoc.

The new prev_generation comparison in psp_pse_matches_pas() runs on the
receive path without psd->lock:

  tcp_v4_do_rcv() / tcp_v6_do_rcv()
    psp_sk_rx_policy_check()
      __psp_sk_rx_policy_check()
        psp_pse_matches_pas()

psp_twsk_rx_policy_check() also reads it with only RCU held.

Neither side uses READ_ONCE()/WRITE_ONCE() or data_race(). KCSAN would
probably report this whenever a device key rotation overlaps PSP rx on
a socket that has been rekeyed. Since this is a u8 there is no tearing,
so the worst effect is that a reader briefly still accepts packets on
the previous spi during a rotation.

pas->generation already has the same unannotated pattern, but this
patch adds a second field and a new write loop over active, published
associations. Should these new accesses be annotated with
WRITE_ONCE()/READ_ONCE() or data_race()?

>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-psp-v2-0-5596ab50f677%40gmail.com

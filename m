Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085167;
	b=aEe9Tb9bm/bgEQK9ftp/rPeB6NJjU7K8b9z0bYn65OG5Od8hMhsaZFY7o7CCL2HvSEwi
	 PBt0IgysckDBcJwlZD8XsnCmaxiT1F/CBbQ2XEbVSNJtm+JUk/EdgutbZ1k29DZ3S1y2J
	 DcH8L+mWsZl3Dca+l19Tk5pyqTZbmFi0D9sP0y1XDS0REC7bxWU8zgAWtAhTXwLVyhwv+
	 dlY192B3vR6nqrpdZTqbuaYPIxLzUT2Sw8VZSO2Xt0MK5CEO0WDDWehcSeNFoNDETocr0
	 ip48V8T/bsnIQ2CZoKTXawi+pUWd5FT4tlyCVx7Tt1Y7tCCrutS0xPXdUhcCdu1xwig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085167;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=b3RDVGO3+bP5dg9fDJjr6KnmIzH5WR2VM3WhSL40Oqs=;
	b=xT3v+L08LVfMAl9c4cyp4sCVbdxITtPxiZv5FnEGLldZ5gw4mpJCYlhER+c3YMKUff6m
	 VAp50W9gvi+W9uNFM8qk0aSxV+fIYJ1o/FY+BrYYSTcKI8ccm8mgfrXm5y+UyKCaNWaMk
	 7YlxHdPZFnDvivtcsfGl3v5OowJyzqEVuo6Iv7SUCsUk8wBdXvkSsJQw+/6OlpPIXLvh3
	 nE2uiRrTA1TR3RDmTXvoShaBCRVseBoDsIoQuCA73DlT8/zYVSSqU7YbDtfo7uauOn/0J
	 TIp2hLEEDiFYima55Y632ehBP/TGQ68x5TtwC0604g5x+6MAx888BC01DPOJ6N6diJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGgfNYTX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA85606A32D;
	Sat,  7 Nov 2026 20:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGgfNYTX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64731F0089F;
	Sat,  7 Nov 2026 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085166;
	bh=b3RDVGO3+bP5dg9fDJjr6KnmIzH5WR2VM3WhSL40Oqs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cGgfNYTXs/SqnlSxtrc8zAA0ldSrb39BN89s7qPsjezo1YSGMgJaLcEzt7N1Vd4lw
	 abk2lMgjqIvZW8sTGfMyb37u6Qhz3f5yEv9PeeSwUXn3ksz5GG+SlMI/YWeL3CA9Px
	 EsJiETn2FhKbQ2+YYvpRsjtEmvx5hRXBS+5gWrdYYZELUZr2iZWkX0qdDf3CFTKbcO
	 YjoyTVLAW5WkOvyUYuzcO347VxDgGbpL/tkDLkI0cxjjVanbLW+L0p1vciO8zfCiGm
	 3FbCO5Ss4v0/tVgXMZE2XXRyWPzbw9Ydn7uwMD/mKrlO5kWnMS7eiOO7VYCcEPPMLw
	 lSow9d/xle9Ww==
Subject: Re: [PATCH net-next v3 1/5] psp: support rx rekey operation
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 07 Nov 2026 20:59:25 +0000
Message-ID: <179408516544.994134.848767943937829488@kernel.org>
In-Reply-To: <20261106-psp-v3-1-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-1-a8dd38f5a727@gmail.com>
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

- [Low] There is an unannotated data race on the new
  psp_assoc::prev_generation field.

--

psp: support rx rekey operation

This commit lets an established PSP socket rekey its Rx direction. It
does this by creating a new psp_assoc that copies the existing Tx state,
and it records the previous Rx SPI and generation as a fallback.
psp_pse_matches_pas() now accepts packets that match either the current
or the previous Rx SPI/generation, and psp_assocs_key_rotated()
invalidates prev_generation as needed.

> diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
> index 410adb6718c16..5a7a518b9579b 100644
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
> index f2cba3fa3a235..c1e38845f08c3 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
>  	 */
>  	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
>  		pas->generation |= ~PSP_GEN_VALID_MASK;
> +		pas->prev_generation |= ~PSP_GEN_VALID_MASK;
>  		psd->stats.stales++;
>  	}
> +
> +	/* Don't allow SPI from two generations ago to alias one from the
> +	 * current generation. Rx rekeying under the same device key generation
> +	 * is currently permitted, so skip if the previous SPI is from just one
> +	 * generation ago.
> +	 */
> +	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
> +		if ((pas->rx.spi ^ pas->prev_spi) &
> +		    cpu_to_be32(PSP_SPI_KEY_PHASE))
> +			pas->prev_generation |= ~PSP_GEN_VALID_MASK;
> +	}

[Severity: Low]
Will KCSAN report a data race on pas->prev_generation here?

psp_assocs_key_rotated() updates prev_generation with a plain
read-modify-write while holding only psd->lock. That happens both for
the prev_assocs entries and in the new active_assocs loop. Both lists
hold assocs that are still attached to sockets and can still receive
traffic.

On the Rx side, psp_pse_matches_pas() reads prev_spi and prev_generation
with plain loads and does not take psd->lock:

tcp_v4_do_rcv() / tcp_v6_do_rcv()
  psp_sk_rx_policy_check()
    __psp_sk_rx_policy_check()
      psp_pse_matches_pas()

psp_twsk_rx_policy_check() reaches the same check under RCU.

This means a key-rotate running while a rekeyed socket is receiving PSP
traffic gives a plain write racing with a plain read. The writer and
reader hold no lock in common.

Since the field is a u8, it can't tear. A racing packet would either
match the old prev_generation or be dropped against the invalidated one,
so there doesn't seem to be a functional problem. The existing
pas->generation update already follows the same unannotated pattern.

Would it make sense to use WRITE_ONCE() for these stores in
psp_assocs_key_rotated() and READ_ONCE() for the loads in
psp_pse_matches_pas()? The later patches in this series don't appear to
add those annotations.

>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106-psp-v3-0-a8dd38f5a727%40gmail.com

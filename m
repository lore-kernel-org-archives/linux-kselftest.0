Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302183;
	b=LimdWUeRDOFPHOKp6wUTB5gBcvwjVOQEe8Fkb2qN9Ijw86nseQmRgXKFmLFhoWJygseh
	 Y9ER14owIhgno01V+a95s5n4B0OZ77FPWi17kMuQ8Uo9uiwDptPVv5y0eKXK9kFhxv2cr
	 yDLlR2UdP1/GdfTpXHJSw/W+1OOrhN+Y4wZX0ABxKFW7eZctw41G2eBTzCgRXjD7vZ22z
	 XW6UW3kgAebkRLpXpHcYTeRGKQ9p9Kce+edAPb4QLlW1/3hv/eeVVSP5ytoflP+uIHsZ0
	 QUx2atnfwUWBwFaPatsttJNSyZxovyTVk6Bp6vLB2jg/X9BbEQfoTpPRSF1F0K5oVmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302183;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YblPw0OxuKOe7mXetjre4GQOF68ty3iscXQRSGT3Ipk=;
	b=KVPAbIvI61z7eopcb+NhvXSE+PColwM7gySSLc2yt+RKCWHB8xmEeYXSQL50r2wUnuPT
	 evBZce9teTVbbFbvKTz0LR7Pom62XXzlCTH3HEHyZcMNQo6okDmmocKtiW9/ITZFUKYyi
	 FX745fP6eDgQB3PsYiavZzewcMlqaZum30Alj00XRbgWXwJiAi/b7A9r3naarpCVR9yAm
	 zQQd3rS8KOX8X6mb2L5xo6vo1UbckcR1gKrbPlea/U5whnMYAHs+h4rE/dEOE6emSt0kX
	 HW3WSiOPKKMC7Xd0tGGAOnyhpKWnnZEockbQHmxv6825RcQ7wxmruyl9gJNLl1cYsKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlshQYvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C4606A684;
	Sat, 21 Nov 2026 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlshQYvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4E61F000EE;
	Sat, 21 Nov 2026 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302182;
	bh=YblPw0OxuKOe7mXetjre4GQOF68ty3iscXQRSGT3Ipk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JlshQYvkDrqUI4avQ0EoOMrhekBi/GfFka55sa+RsTzCoVm6ZnHWnfUmDQXyR3AoB
	 LpJYm2PzRovVrADFdlmxclBMuqLyrRLBVfuQcuUXGtbwg7ZpcS4U8nYAVLk1AzfHsK
	 Csstk96qvbyPaGoZ8jmCyQrfLIwIiF7HU9NuBfZq9jUsKlSDVNWjP30Ar9wOSUBO5e
	 E2Ak7Vp1j9rpEpbDQVZ547NYvJLGL3HAJrT3S73zR/ogu88DMov2ahnYkONGQKwlAJ
	 bA/4IdAfN0p7aGWumxW5kJ8bapl6DURD9wojzNm0zXueyEDlSgG6+Ba/J8EUlPwokO
	 zvf+s1n4P3BuA==
Subject: Re: [PATCH net-next v5 1/6] psp: support rx rekey operation
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Sat, 21 Nov 2026 23:03:01 +0000
Message-ID: <179530218118.3135.6547111851222246419@kernel.org>
In-Reply-To: <20261118-psp-v5-1-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-1-b9ec840e0296@gmail.com>
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

- [Low] The uAPI doc for the rx-assoc op in
  Documentation/netlink/specs/psp.yaml now reads "If the socket already…
- [Low] psp_assocs_key_rotated() (net/psp/psp_sock.c) now does a plain
  read-modify-write `pas->prev_generation |= ~PSP_GEN_VALID_MASK` on…

--

psp: support rx rekey operation

This commit lets rx-assoc run on a socket that already has full PSP
state. It creates a new psp_assoc that keeps the existing Tx state and
gets new Rx state. The previous Rx SPI and generation are kept as a
fallback, so packets sent by the peer before it switches keys are still
accepted.

> diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
> index f3266763c3253..d5713f5d1af7e 100644
> --- a/Documentation/netlink/specs/psp.yaml
> +++ b/Documentation/netlink/specs/psp.yaml
> @@ -265,7 +265,9 @@ operations:
>  
>      -
>        name: rx-assoc
> -      doc: Allocate a new Rx key + SPI pair, associate it with a socket.
> +      doc: |
> +        Allocate a new Rx key + SPI pair, associate it with a socket.
> +        If the socket already has PSP state, rekey its Rx direction.

[Severity: Low]
Does this doc match the behaviour for every socket that has PSP state?
psp_sock_rx_rekey() in net/psp/psp_sock.c rejects the rekey unless both
directions are set up:

	if (!prev->tx.spi || !prev->peer_tx) {
		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
		return -EBUSY;
	}

So a second rx-assoc on a socket that only has Rx state still fails with
-EBUSY.

psp.rst describes this precondition, but the YAML spec, which ynl and
the generated docs use, does not. Should the op doc say something like
"If the socket already has fully established PSP state, rekey its Rx
direction."?

>        attribute-set: assoc
>        do:
>          request:

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
Can these plain writes to prev_generation race with the Rx datapath?

These assocs are still published through sk->psp_assoc. The only lock
held here is psd->lock, which the pre-hook of psp_nl_key_rotate_doit()
takes.

The reader in psp_pse_matches_pas() runs without psd->lock and without
READ_ONCE():

	(pas->prev_spi && pas->prev_spi == pse->spi &&
	 pas->prev_generation == pse->generation));

It is reached from paths that hold only the socket lock or RCU:

  tcp_v4_do_rcv() / tcp_v6_do_rcv()
    -> psp_sk_rx_policy_check()
      -> __psp_sk_rx_policy_check()
        -> psp_pse_matches_pas()

  psp_twsk_rx_policy_check()  (RCU only)
    -> __psp_sk_rx_policy_check()
      -> psp_pse_matches_pas()

So a key-rotate running while PSP packets arrive on an rx-rekeyed socket
is an unannotated data race that KCSAN would report. The field is a u8,
so it can't tear, and the result is unordered against the rotation in
any case.

The existing pas->generation write already works this way. This patch
applies the same pattern to a new field that the datapath reads, and
adds a second write site in the active_assocs loop.

Would it make sense to use WRITE_ONCE() here and READ_ONCE() in
psp_pse_matches_pas()?

> +
>  	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
>  	list_splice_init(&psd->active_assocs, &psd->prev_assocs);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-psp-v5-0-b9ec840e0296%40gmail.com

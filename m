Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981905;
	b=gsIuMOY6gBI9fZVYfgQNfTVBU7aPuxHQGoqWNKsV0Y4yg6mggQ4DS7AUY7P4PDJNepg9
	 B76lbpoDfIttmm2xbuvaiTSIBZ2cv5H/PgUkhmFUzADyx3jG1bgOVyTHRN88VkSggCJ+q
	 ZoTiLi6QkCbJ5/Vpzru5ThwCYXLC0SXpeH3IbV6UtJU6xpw5a7qxKauVMTV47F4Aw/ysr
	 NUrgE+kXEmNyQpDzPeZrJZlMoBfPLpxtQzMbuO2Lxnp8mi0eiKqZO12r2IqTt4dmvoc+Z
	 Hzqcko8gJn52pNfJ9CTMh8blsQ1n2S/iwVxmzQrCUcFwMdb4rPpM1OkWpANBzZ39uTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981905;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pZzl5p/hTAG4Ht/7wLb4wKQYy+e/CeEZTrM3kv/McxQ=;
	b=vgIJVigmkfAsZjlOWjEyfPu9JV3cIJ03DCJ2OEaDE1S38X08h6jLMbT+aLhJvHhemOD2
	 xRiXSmoAZ0pSXUjMZgT1GhOjIjewnsVs24gEA8+DXKCtl46oIU4OsrELfCVnDbZKKmvPU
	 mWCJF3JltWdwDpGC+nlfQTRaUI/mSzAFh9TXU0QnGO2ranun350z/XMHIwx3RZA0rK2hb
	 MbStwIUsC3OVupI3vALN0jnZRnVGUp+kG3sURmjlot/4d8yv0aKOkLwApYWK3JvJdy+Xk
	 W+o/1Wt03bNpuV10J+1pJ0Vl4p+JxxDdd9QLoGoyEr8BZfRdEJRyNE9CML3f6aSmuxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkV1PYiv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F99606A32C;
	Wed, 18 Nov 2026 06:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkV1PYiv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05921F000C5;
	Wed, 18 Nov 2026 06:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794981904;
	bh=pZzl5p/hTAG4Ht/7wLb4wKQYy+e/CeEZTrM3kv/McxQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RkV1PYivYA3eGorJO/HZ12M7pw27SKD7L808WC4wcZIFV2ycMe2LPmRlSx7B+8qb9
	 /MDBC2Duj8l13ipWztq/cG+V55RB3pWd3B0tZFJOzahMnthrXXHrnqAEdM392fYHMv
	 1kVkOpH2x3kKdy7RcIO6BJgcZHzeS7hOd8HTUGS7JIF5xRicRKIkYbgT0Pv3T6CoA4
	 69TQhUDhSc9s6jO6UCI1ldsH09t+3ghrqmc5uayXV8dy0c1PQQbNYKlRl1RMkLg0vZ
	 3HwsG2mXztYxPWJVMXCbflbuHGXIBIIfEm+lHCgdBE1y1JadM5h0nFCe5lTHzXvGiT
	 EkNun6FjjfEsw==
Subject: Re: [PATCH net-next v4 1/5] psp: support rx rekey operation
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Wed, 18 Nov 2026 06:05:03 +0000
Message-ID: <179498190320.3136.17281959209989358635@kernel.org>
In-Reply-To: <20261116-psp-v4-1-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-1-1a599df2aefa@gmail.com>
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

- [Low] At this commit, Documentation/networking/psp.rst says a PSP Full
  connection can be rekeyed in place 'using the same netlink calls as in…
- [Low] The new field pas->prev_generation is written with a plain read-
  modify-write (`pas->prev_generation |= ~PSP_GEN_VALID_MASK`) in…

--

psp: support rx rekey operation

This commit lets rx-assoc run on a socket that already has PSP state.
It creates a new psp_assoc that keeps the existing Tx state and gets new
Rx state. The previous Rx SPI and generation are kept as a fallback, so
packets the peer sends with the old key are still accepted until the
next Rx rekey or device key rotation.

> diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
> index 0f9b6b73f2447..fab797506b0a9 100644
> --- a/Documentation/networking/psp.rst
> +++ b/Documentation/networking/psp.rst
> @@ -140,14 +140,33 @@ The PSP assoc state of a socket is not reset when the connection is
>  torn down. ``connect()`` on a socket that has PSP assoc state will
>  return ``-EINVAL``.
>  
> +Rekeying
> +--------
> +
> +A connection which has completed the exchange described above and is
> +in the "PSP Full" state can be rekeyed in place without being torn
> +down, using the same netlink calls as in connection setup.

[Severity: Low]
Is this accurate at this point in the series?

To finish the rekey, the peer has to install the new SPI and key with
tx-assoc. At this commit, psp_sock_assoc_set_tx() in net/psp/psp_sock.c
still rejects tx-assoc on a socket that already has a Tx key:

	if (pas->tx.spi) {
		NL_SET_ERR_MSG(extack, "Tx key already set");
		err = -EBUSY;
		goto exit_unlock;
	}

An application on a kernel at exactly this commit that follows this
text, or the updated "Applications are expected to rekey their
connections" wording in the Rotation notifications section, would get
-EBUSY from tx-assoc on the peer.

Later patches in the series close this gap:

- "psp: support tx rekey operation" replaces this branch with a call to
  psp_sock_tx_rekey().
- "psp: defer tx key deletions for SADB drivers" removes the temporary
  -EOPNOTSUPP for SADB drivers.
- "selftests: drv-net: psp: add rekey tests" adds test coverage.

The final psp.rst also documents the tx-assoc rekey path.

Could the documentation changes move to the tx rekey patch, so that the
docs match the code at each commit?

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
Should these updates to pas->prev_generation use WRITE_ONCE(), with a
matching READ_ONCE() on the reader side?

psp_assocs_key_rotated() holds only psd->lock here. The field is read
without that lock in psp_pse_matches_pas():

	(pas->prev_spi && pas->prev_spi == pse->spi &&
	 pas->prev_generation == pse->generation));

There are two paths to that reader, and neither takes psd->lock:

- __psp_sk_rx_policy_check() from tcp_v4_do_rcv()/tcp_v6_do_rcv(),
  under the socket lock.
- psp_twsk_rx_policy_check() from tcp_v4_rcv()/tcp_v6_rcv() and
  tcp_timewait_state_process(), under RCU only.

These are compound read-modify-write stores, so KCSAN can report them
even with CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC.

pas->generation already uses the same unannotated pattern. This patch
adds a new field and a new writer loop over assocs that are attached to
live sockets.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-psp-v4-0-1a599df2aefa%40gmail.com

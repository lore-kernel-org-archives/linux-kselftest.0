Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E6391E55;
	Sat, 10 Oct 2026 21:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668624; cv=none; b=s/CvIGV7AAXdDirL3eWwpI8SFLzomTHJkDE3iFc4y09Rdv3BKQygVodDqH/QfwQX7IzlXz/PZVdm0ztUW4UCDWn3668ldMpIIViRv8pjCghQ+ZRRDE29LQLtripax+k5w24jCaSAoxmtfFNZgygmxo2O8J7pWHzAzWKmSpcagFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668624; c=relaxed/simple;
	bh=quSfnAc97jmUhBce6xLTif6dli7iPYQ61RD2uVB6FQM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d1VnesI4uUFFJu5KA0Q4d9tlNq+CuV78yWt3aHR5P84yRKV9o8/7pk57yZTWfbbgwhiLz56hSRKRusHZ2Ye8OLI9XgDJLo+eiPJIstMeF4oGIGyBfFHrP3GXv7kfDiVLtlgv2o8kqZV0BVwbt3MwFrRJElfeTDbcU/trjXQeHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsAORlFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsAORlFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF131F00893;
	Sat, 10 Oct 2026 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668623;
	bh=NVqILJgCTJErGk4U++qDieyspwjVOz67p8bib9MuvEY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CsAORlFAKjR+EZQL1S58et3+sdlQDFGX1JbRw9QxYYHB+JJmbNwCNrobRy8ITf1Wi
	 Rg01WJ29N0HCgIJd+w6uF2XFEwp+nx3YsppkQ2D9OFdO1kdLjOcSSVgOlcAa8bHEXe
	 B36mNV+szwIb342eKM75kUzxV86LDtyUlaKIz/2MG30dxpJH0g6Z2hdBmMdTWaGKXx
	 l7ijFcxVL3Zmgd38IbYLCFVR0ZWjneKKquKy9IUrFeteXslN0v//aIJSmKTJ1zrzVs
	 sWyOg3ieIQei94kGATKoPftvYdwgcgKCj8aFMng7J6YfMBoldRPbUQnwtjRusTXmLl
	 wdG4MtDdg9k1A==
Subject: Re: [PATCH net-next v2 2/7] psp: support tx rekey operation
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 21:43:41 +0000
Message-ID: <179166862185.434549.73960219468942986@kernel.org>
In-Reply-To: <20261009-psp-v2-2-5596ab50f677@gmail.com>
References: <20261009-psp-v2-2-5596ab50f677@gmail.com>
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

- [Low] In this commit, psp_sock_tx_rekey() (net/psp/psp_sock.c) refuses
  a Tx rekey with -EOPNOTSUPP on every SADB device, i.e. any device…
- [Low] The new 'Rekeying' section in Documentation/networking/psp.rst
  says a connection in 'PSP Full' state can be rekeyed in place with rx-…
- [Low] The new 'Rekeying' section in Documentation/networking/psp.rst
  says the SPI in use before an Rx rekey "remains acceptable on the…

--

psp: support tx rekey operation

This patch adds a Tx rekey path to psp_sock_assoc_set_tx(). The new
psp_sock_tx_rekey() allocates a new psp_assoc that copies the Rx state of
the current assoc and installs the new Tx key. It then swaps the new assoc
into sk->psp_assoc with RCU. The patch also adds a Rekeying section to
Documentation/networking/psp.rst.

> diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
> index 0f9b6b73f2447..5c4e4215d906f 100644
> --- a/Documentation/networking/psp.rst
> +++ b/Documentation/networking/psp.rst
> @@ -140,14 +140,36 @@ The PSP assoc state of a socket is not reset when the connection is
>  torn down. ``connect()`` on a socket that has PSP assoc state will
>  return ``-EINVAL``.
>  
> +Rekeying
> +--------
> +
> +A connection which has completed the exchange described above and is
> +in the "PSP Full" state can be rekeyed in place without being torn
> +down. The Tx and Rx directions are rekeyed separately using the same
> +netlink calls as in connection setup.
> +
> +``rx-assoc`` allocates a new Rx key and SPI, which should be passed
> +to the peer exactly as during the initial exchange. The SPI which was
> +in use before the rekey remains acceptable on the socket until the
> +next Rx rekey, so packets the peer sent before it learned the new SPI
> +are still received.

[Severity: Low]
Is "until the next Rx rekey" accurate? A device key rotation seems to end
acceptance of the previous SPI as well.

After an Rx rekey, psp_assoc_create() puts the new assoc on
psd->active_assocs, with prev_generation copied from the old assoc. On the
next rotation, psp_assocs_key_rotated() runs:

	list_for_each_entry(pas, &psd->active_assocs, assocs_list)
		pas->prev_generation |= ~PSP_GEN_VALID_MASK;

psp_pse_matches_pas() only accepts the previous SPI when the generation
also matches:

	(pas->prev_spi && pas->prev_spi == pse->spi &&
	 pas->prev_generation == pse->generation)

So after the next device key rotation, packets that use the previous SPI
would be dropped, even if there has been no further Rx rekey.

Should the doc say that the old SPI also stops being accepted at the next
device key rotation?

> +
> +``tx-assoc`` installs a new Tx key, which takes effect immediately.
> +The peer will accept data encrypted from the old and new SPI.
> +
> +A rekey is rejected with ``-EINVAL`` if it would change the PSP device
> +or the PSP version of the association. It is rejected with ``-EBUSY``
> +if the socket has not completed its initial exchange in both
> +directions.

[Severity: Low]
Does this list cover every -EINVAL case for an Rx rekey?
psp_sock_rx_rekey() also rejects a new SPI whose key phase bit matches the
current one:

	if (!((pas->rx.spi ^ prev->rx.spi) & cpu_to_be32(PSP_SPI_KEY_PHASE))) {
		NL_SET_ERR_MSG(extack, "New and prev SPI have same phase bit");
		return -EINVAL;
	}

Drivers set the phase bit from the current device key. In netdevsim, for
example, nsim_rx_spi_alloc() stays inside the current phase, and only
nsim_key_rotate() flips PSP_SPI_KEY_PHASE.

If the device key has not rotated since the current SPI was allocated, an
rx-assoc rekey will always fail with -EINVAL. An application that rekeys on
its own schedule, instead of after a rotation notification, would hit this.

Could this requirement be documented here? The text is still the same at
the end of the series.

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index b5887171c84e7..060149f3d72a7 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -283,6 +283,52 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
>  	return err;
>  }
>  
> +static int
> +psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
> +		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
> +{
> +	struct psp_assoc *new;
> +	int err;
> +
> +	if (psp_dev_has_sadb(psd)) {
> +		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
> +		return -EOPNOTSUPP;
> +	}

[Severity: Low]
At this commit, should this limitation be mentioned in the commit message
or in the new Rekeying section?

psp_dev_has_sadb() returns true whenever psd->ops->tx_key_del is set. That
includes mlx5, the only in-tree hardware driver: mlx5_psp_ops sets
.tx_key_del = mlx5e_psp_assoc_del.

So on mlx5 this call chain returns -EOPNOTSUPP:

psp_nl_tx_assoc_doit()->psp_sock_assoc_set_tx()->psp_sock_tx_rekey()

However, psp.rst lists only -EINVAL and -EBUSY as reasons a rekey can be
rejected.

The next patch in the series, "psp: defer tx key deletions for SADB
drivers", removes this check and sets PSP_ASSOC_DEFER_TX_KEY_DEL on the
old assoc instead. The mismatch therefore only exists partway through the
series.

> +	if (!pas->peer_tx) {
> +		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
> +		return -EBUSY;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-psp-v2-0-5596ab50f677%40gmail.com

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920973A9605;
	Sat, 10 Oct 2026 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668629; cv=none; b=LQW7XG764iPseu4tkHk+G/Yoq1ZASQmU44/YKrlGu8NjSobgtjXs7eegaEKKzBOQkk/8PWzyZJ4CjNNCpd7Bo1ghXUm7SpBHexQTr/4Xx252AWZubxLCO9n9kyc7/mka1fgKYG37fe38bcxUVbtEEVFo4RxC6cDb4f2Vpxode34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668629; c=relaxed/simple;
	bh=NbUrmVssgXMsM7yNqV4HMEjrvQ52EOsTagul1fXshRk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BALqzOks7XH63Z8pUIBNPyLivJbIqABWxAT3wXVqjK3HfJySgMG9G++3Ymmj4RvBJ+fLNpeBrno8bkfsNatEHvGy7cre2FfwuCkqyVY/VLh62DiIP8UrFIe0S1R4AwJekOkYNskQIOUcpDNpi4YVF1c5msyXtHmHVRv+eKNCXlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvf9ruWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvf9ruWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7564D1F000FF;
	Sat, 10 Oct 2026 21:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668628;
	bh=fWuNCPcEuBax8HBlFNHcHxPKX0VK8F8nWp4HtQxVG/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hvf9ruWkrBLpWxQ1EX/dZzt7Ld0Dipu4wacCNrSaG9/hU/oKoHHX6UDKmvTs6Bs3M
	 faH7GwEcnX5DhK/AkbSZJtiMKxL8ySuH4VMi6TzxxoZyPsBSQez2sFjeDMOvftAu6/
	 AY7v8z1yLGJCR/v5W8tLMR0C0Xm9pzydsTeePNcMSYn13iWD29V6FCQ21G/IXFYaBn
	 wtKIxyLlLyCOM+8VNJwU3u6kOUr4ezgxO+RCKvCGhzCyLLHOVwmv+TxefPwjFx7hSs
	 5WEnnTV42zjDu7v/60mZaXat/7HnDSi5eJxSVyPaojlTE+tfoqlpkT1IC+9RYczkYe
	 n1THjANukzreA==
Subject: Re: [PATCH net-next v2 5/7] selftests: drv-net: psp: factor out psp
 connection setup
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 21:43:46 +0000
Message-ID: <179166862699.434549.1168361771089629782@kernel.org>
In-Reply-To: <20261009-psp-v2-5-5596ab50f677@gmail.com>
References: <20261009-psp-v2-5-5596ab50f677@gmail.com>
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

- [Low] In psp_responder.c, conn_setup_psp() fills and exchanges key data
  sized for the Rx version, then hands the same buffer to the new…

--

selftests: drv-net: psp: factor out psp connection setup

This commit moves the PSP Rx and Tx association code in psp_responder.c
into new rx_assoc() and tx_assoc() helpers. It also moves the psp.py key
exchange into _establish_psp_conn(), so other tests can reuse the key
exchange and then do more assoc calls.

> diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
> index a26e7628bbb13..57425ecb9561f 100644
> --- a/tools/testing/selftests/drivers/net/psp_responder.c
> +++ b/tools/testing/selftests/drivers/net/psp_responder.c

[ ... ]

> @@ -64,29 +68,34 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
>  		return -1;
>  	}
>  
> -	// SPI exchange
> -	key_len = rsp->rx_key._len.key;
> -	memcpy(info, &rsp->rx_key.spi, sizeof(spi));
> -	memcpy(&info[sizeof(spi)], rsp->rx_key.key, key_len);
> -	sz = sizeof(spi) + key_len;
> +	if (rsp->rx_key._len.key != key_len) {
> +		fprintf(stderr, "ERROR: unexpected Rx key length %u\n",
> +			rsp->rx_key._len.key);
> +		psp_rx_assoc_rsp_free(rsp);
> +		return -1;
> +	}

[ ... ]

> -	// Setup Tx assoc
>  	teq = psp_tx_assoc_req_alloc();
>  
>  	psp_tx_assoc_req_set_sock_fd(teq, data_sock);
> -	psp_tx_assoc_req_set_version(teq, psp_vers.tx);
> +	psp_tx_assoc_req_set_version(teq, version);
>  	psp_tx_assoc_req_set_tx_key_spi(teq, spi);
> -	psp_tx_assoc_req_set_tx_key_key(teq, &info[sizeof(spi)], key_len);
> +	psp_tx_assoc_req_set_tx_key_key(teq, key, psp_key_len(version));

[ ... ]

> @@ -99,6 +108,34 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
>  	return 0;
>  }
>  
> +static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
> +{
> +	unsigned int key_len = psp_key_len(psp_vers.rx);
> +	char info[300];
> +	ssize_t sz;
> +	__u32 spi;
> +
> +	dbg("create PSP connection\n");
> +
> +	if (rx_assoc(ys, &spi, &info[sizeof(spi)], data_sock))
> +		return -1;
> +
> +	// SPI exchange
> +	memcpy(info, &spi, sizeof(spi));
> +	sz = sizeof(spi) + key_len;
> +
> +	send(data_sock, info, sz, MSG_WAITALL);
> +
> +	sz = recv(data_sock, info, sz, MSG_WAITALL);
> +	if (sz < 0) {
> +		perror("ERROR: failed to read PSP key from sock");
> +		return -1;
> +	}
> +	memcpy(&spi, info, sizeof(spi));
> +
> +	return tx_assoc(ys, psp_vers.tx, spi, &info[sizeof(spi)], data_sock);

[Severity: Low]
Can tx_assoc() read uninitialized bytes from info[] here if psp_vers.tx
and psp_vers.rx have different key sizes?

conn_setup_psp() sizes the exchange from the Rx version:

	unsigned int key_len = psp_key_len(psp_vers.rx);
	...
	sz = sizeof(spi) + key_len;

So rx_assoc() and recv() fill only key_len bytes after the SPI. Then
tx_assoc() copies a length based on the Tx version:

	psp_tx_assoc_req_set_tx_key_key(teq, key, psp_key_len(version));

The two versions are separate bytes read in run_session(), and nothing
checks that they match:

	memcpy(&psp_vers, buf, 2);

With a 256-bit Tx version and a 128-bit Rx version, 16 bytes of the
uninitialized info[] stack array would go into the tx-key attribute.
Before this patch, the Tx key length was rsp->rx_key._len.key, which is
the same length used for the exchange.

The kernel should reject that request in psp_sock_assoc_set_tx() because
the versions don't match. Also, the only in-tree sender, _make_psp_conn()
in psp.py, always sends equal versions. Later patches in the series pass a
fully initialized 32-byte key to tx_assoc() from handle_tx_assoc(), but
they leave conn_setup_psp() as is. So the mismatch is still there at the
end of the series.

Would it make sense to reject Tx/Rx versions with different key sizes in
conn_setup_psp(), or to pass the valid key length to tx_assoc()?

Separately, the commit message calls this a factor-out. However,
rx_assoc() now fails when rsp->rx_key._len.key doesn't match
psp_key_len(psp_vers.rx), and the Tx key length is now computed
differently. Could the commit message mention these behaviour changes?

> +}
> +
>  static void send_ack(int sock)
>  {
>  	send(sock, "ack", 4, MSG_WAITALL);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-psp-v2-0-5596ab50f677%40gmail.com

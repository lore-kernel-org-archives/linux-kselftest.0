Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F21421226;
	Mon,  5 Oct 2026 23:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242545; cv=none; b=PCi/gO6vL2Ywmbl+odRxDo49iqe3Ge9N/5KQEkq417X5HOb6oDKT1PHUiPGRRfA65lK/o+rAir8vrgUfjNvwZW4Ta2sTAuVEJ6gxbbiPcR/kJXoBkQ/U1LGdkzklqskHe/d/sOuISae0cOb401Q2ghPVDAU3ZYmATjspv8tDRpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242545; c=relaxed/simple;
	bh=vkyXi5JoTDD4UnFwTdpHl/vEsENoJf/aF2aE6DsNRtk=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X8PJ4XRpsN4/N0529Jdhq47suiw4HoQm3DGzcp1u6hHvYxbjj/fw0HavC3hqRDO/Tnx0TFLLMJp5tMuLVSy7XUIfSfvuciFhbrUzJY8t2rsVRattCdm79MK1KjV6Oys3Mqq7IW+7XyafTS1Vtn8uqJmQe/v+icckhb0TVgbBKXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od01jgw7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od01jgw7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1531F00893;
	Mon,  5 Oct 2026 23:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242544;
	bh=+8zAbXZK6w2C/XyzLpWV0JIcru4F1sudMee+FQkldY4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Od01jgw7WhbVgRstESLObDaAAHkzVZQu4Cwr2oRQPXRjWC21h07wyoqr8PHUnaeQO
	 RUlDTO1+ir2BmB+iB9A3nPx4NTThn+ajarJZL9h8aIaOpTsyapzNwWwDD0cLSF5bhs
	 mR2L6RxQ1v+xqXnDb18oRaxPKsaVG03LUAX3CamzyQtiawez5x9ceA/Dji0kyZMiqB
	 VRgAfDhjKqRYmhxUzlipkgbQzl4eNPlEnwzlPG8SsGsAwF7n0aUQCiFc6jE+Ns43JJ
	 4sjPPKOfgM+cbNFSSdJGWnjiL06hV4/7lNOh96nsXA5Kp/bydXYhIU3QZ8TUdRBgab
	 8y3HRtf409lUQ==
Subject: Re: [PATCH net-next v2 2/8] tls: check for a pending signal after an
 empty record
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:22 +0000
Message-ID: <179124254296.434549.14396716806687989116@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-2-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-2-2dd1947bb642@kernel.org>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tls_sw_recvmsg() (net/tls/tls_sw.c), the new early exit `if
  (nodata && signal_pending(current)) { err = sock_intr_errno(timeo);…

--

tls: check for a pending signal after an empty record

This patch adds a signal_pending() check to the tls_sw_recvmsg() receive
loop. The check runs before the next record is fetched, if the previous
record was a zero-length application_data record. Without it, a peer
streaming empty records could keep the reader in recvmsg() and SIGKILL
would not interrupt it.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index c78471c53f2f2..ee50b9028264c 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -1858,6 +1859,16 @@ int tls_sw_recvmsg(struct sock *sk,
>  		struct tls_decrypt_arg darg;
>  		int to_decrypt, chunk;
>  
> +		/* A run of empty records advances neither loop bound, and
> +		 * tls_rx_rec_wait() tests for a signal only after it sleeps.
> +		 */
> +		if (nodata && signal_pending(current)) {
> +			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> +
> +			err = sock_intr_errno(timeo);
> +			goto recv_end;
> +		}

[Severity: Medium]
Can this errno be lost when the empty record that set nodata was decrypted
asynchronously?

At this commit, tls_sw_recvmsg() still enables async mode for every DATA
record, including empty ones:

	if (tlm->control == TLS_RECORD_TYPE_DATA)
		darg.async = ctx->async_capable;

With TLS 1.2 and a CRYPTO_ALG_ASYNC AEAD, an empty record gives chunk == 0,
so nodata becomes true. It then takes the async arm, where to_decrypt is 0:

	if (async) {
		chunk = min_t(int, to_decrypt, len);
		async_copy_bytes += chunk;
		...
		__skb_queue_tail(&ctx->rx_list, skb);
		...
		continue;
	}

On the next iteration the new check sets err to -ERESTARTSYS or -EINTR and
jumps to recv_end. Because async is true there, err is overwritten:

	err = process_rx_list(ctx, msg, &control, 0,
			      async_copy_bytes, is_peek, NULL);

async_copy_bytes is 0 here, so process_rx_list() returns 0. copied also
stays 0, so this path returns 0:

	return copied ? : err;

Would a blocking reader that catches a non-fatal signal see EOF instead of a
restart, and would a nonblocking reader get 0 instead of the -EINTR the
commit message describes?

The overwrite of err at recv_end already existed before this patch. This
patch adds an exit that can fire right after an empty async record.

Later in the series, "tls: consume empty data records in tls_sw_recvmsg()"
changes the assignment to:

	darg.async = ctx->async_capable && to_decrypt;

That keeps empty records out of async mode, so the false EOF does not happen
once the whole series is applied. It is still reachable at this commit,
which matters for bisection or if this patch is backported on its own.

>  		err = tls_rx_rec_wait(sk, flags & MSG_DONTWAIT,
>  				      released, !!(decrypted + copied));
>  		if (err <= 0)

[ ... ]

> @@ -1910,6 +1921,7 @@ int tls_sw_recvmsg(struct sock *sk,
>  		/* TLS 1.3 may have updated the length by more than overhead */
>  		rxm = strp_msg(darg.skb);
>  		chunk = rxm->full_len;
> +		nodata = !chunk;
>  		tls_rx_rec_done(ctx);
>  
>  		if (!darg.zc) {

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org

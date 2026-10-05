Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12803406261;
	Mon,  5 Oct 2026 23:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242544; cv=none; b=Rcv2//AEn/yzMCeDQP0GCnVq6ItunpufmcjYQBjE60QqPfK+dAOvkDooleZ5l/KIlszApMD2CtuSufs74HNNW/oWiX7AOaJHmWxd7WbBctD4sNc6t4RV+z+47xQGOS22/XJHekJODAuGHoPLlONeJRmzJO1zpcqeBrfg8TNMunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242544; c=relaxed/simple;
	bh=DcwOvZuPvGCVeqyQCNGLxeY3RRuHsWzRmlUz4vvdkN8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkT/nfvcAXis2b0UvSPF/wn4Fc1r6Sc/Bo7DMeoqREI+8hGbJu5M9KD0l2GgnXm4sjoN+OUH11xXR+KbrPZc/qje/0d6WSyDm0V+clS9ObiqxuntiXRTGQybqNclByYj9x8pyPGYc/kFYrqieXsEZbiCm84nRj56ZqNDaF+c76o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1IWtl3X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1IWtl3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1508B1F000FF;
	Mon,  5 Oct 2026 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791242542;
	bh=/3kmEX7nnBx7QY8l19mjyaJSG6McLAlnY2cbtV3WKjc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=A1IWtl3XigGN6ZtPgYggNnLEb26TNSrn9MpiaMGC3JUTfNki+/euiBKd11dCPIHCa
	 Kx9xDjOo2ahikD28SDj0PJAo1zKdZSzm8BYt4v40HNpVcavKbdqzqI9Ayh3T0MA2od
	 yKa+7bsHRgHCLiPBuOLsSCl2fgWF9wFeH0OwmVfLH4pQLafLBDMPFYnwOv5TjgqFaP
	 XJNlBqElgI9gTY/SG9+8MJ+DCgUQMuYc0/SBnVuDKpJogFSapexfwbParT0uq8xRqz
	 SVZK+Jbc3vYmmAFPmxuz9J5eHOLMxqxRG/cgzcXuNlp3VmjkTWd/KiJA0bP8cbQTmV
	 SVwS9Z1tdFT1w==
Subject: Re: [PATCH net-next v2 1/8] tls: bound consecutive no-data records in
 tls_sw_read_sock()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Mon, 05 Oct 2026 23:22:21 +0000
Message-ID: <179124254155.434549.7182507019185765398@kernel.org>
In-Reply-To: <20261001-tls-follow-on-v2-1-2dd1947bb642@kernel.org>
References: <20261001-tls-follow-on-v2-1-2dd1947bb642@kernel.org>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new limit can deadlock a CPU through recursion.
- [Low] The new call loads sk->sk_data_ready with a plain read and calls
  it, while another thread can rewrite the pointer.

--

tls: bound consecutive no-data records in tls_sw_read_sock()

This commit stops tls_sw_read_sock() once it has consumed
TLS_RX_NODATA_LIMIT (16) consecutive zero-length application_data
records in one call. A record that delivers data resets the count. When
the limit is reached, the loop breaks and calls sk->sk_data_ready() so
the records still queued are noticed.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index d1ad31986cf2c..c78471c53f2f2 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2136,14 +2139,22 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,

[ ... ]

>  		if (rxm->full_len == 0) {
> +			err = 0;
>  			consume_skb(skb);
> +			if (++nodata >= TLS_RX_NODATA_LIMIT) {
> +				/* tls_rx_reader_release() calls
> +				 * saved_data_ready(), not the callback a
> +				 * consumer installs after the handshake.
> +				 */
> +				sk->sk_data_ready(sk);

[Severity: High]
Can this direct call to sk->sk_data_ready() re-enter tls_sw_read_sock()
and deadlock on sk_lock.slock?

When this line runs, ctx->reader_present is still 1 and the caller
still holds the socket lock.

Suppose KCM is attached to the TCP socket after TLS_RX has been set up.
kcm_attach() does not reject ULP sockets, and it installs
psock_data_ready() as csk->sk_data_ready. The KCM psock sits in
sk_user_data without SK_USER_DATA_PSOCK, so the sk_psock_get() check at
the top of tls_sw_read_sock() does not catch it.

In softirq the chain would look like this:

tcp_v4_rcv()
  bh_lock_sock(sk)
  tcp_data_ready()
    psock_data_ready()
      strp_data_ready()            /* socket not owned by user */
        strp_read_sock()
          tls_sw_read_sock()       /* reader_present = 1 */
            /* 16 empty records consumed */
            sk->sk_data_ready(sk)  /* psock_data_ready() */
              strp_data_ready()
                strp_read_sock()
                  tls_sw_read_sock()
                    tls_rx_reader_acquire()
                      sk_wait_event()
                        release_sock()
                          spin_lock_bh(&sk->sk_lock.slock)

The nested tls_rx_reader_acquire() sees reader_present == 1 and calls
sk_wait_event(). That calls release_sock() before the zero timeout is
checked. release_sock() then spins on sk_lock.slock, which this CPU
already holds through bh_lock_sock().

A remote peer could trigger this with 16 empty application_data records.
In TLS 1.3 that is about 352 bytes, which fits in one segment.

Before this patch, with TLS set up first and KCM second, the only
notification from inside the reader was tls_rx_reader_release() ->
tls_rx_msg_maybe_announce() -> ctx->saved_data_ready. That is the
callback that was installed before TLS (sock_def_readable here), so the
consumer's callback was never called re-entrantly. If KCM attaches
first, saved_data_ready is already psock_data_ready, so the TLS-then-KCM
ordering is the new exposure.

Would it work to defer the notification until the loop has exited and
reader_present has been cleared, or to queue it as work?

[Severity: Low]
Should this be READ_ONCE(sk->sk_data_ready)(sk), as the TCP call sites
use?

nvme_tcp_restore_sock_ops() does a plain store to sk->sk_data_ready
while holding only sk_callback_lock. __nvme_tcp_stop_queue() calls it
before cancel_work_sync(&queue->io_work). That means io_work can be
inside nvme_tcp_try_recv() -> tls_sw_read_sock() and load the pointer
at the same moment.

The result is an unannotated data race on the callback pointer, which
KCSAN would report.

> +				break;
> +			}
>  			continue;
>  		}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-tls-follow-on-v2-0-2dd1947bb642%40kernel.org

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699057;
	b=CgpyerjdSkuforNYGAEHuzOAQI3c2sChAxmY2m9gxkfycYjDDwaB2e7+v/tHV5WkuS1o
	 i3q2vTFuGn+nlVAtO7OoZpNQTDJLfxm0BDy1m4mW0AXdzXnMRriLTjrUIAIMUaCZ4Rvgl
	 CbxIbxQrDwXon/XMpPqrdHET5oe3Z/2TSJmzuAq7elddG/9LsT0ydqLSbOXqjmHVo5Fnj
	 fNSunhdyHj40gkQsWrXMQCOqCd5H29FFlyLrVnnqGl/IOdI3S2l2VmFFgCXZEPBBOM4E8
	 TOVoYWlEvw3r7PGpV4wr/MZxr6qp9IuzdVc1dFFDmxUaVXMIBMBq1Wcgq4pq/tnkFew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699057;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Mckqm5Ve1KQcboHq94jGqkE4GT7V9HEqzykEjVbhuvg=;
	b=1Qzz5JlCfr4FwMxNjrADSL3GoJzM11fXR6YoHuovA+W0XN7otcOSCeuxVJUgC4r2wQoM
	 VvaXKjpO/lCzWKujOsVWIPbFhJCfSliYh8TYF4Q5JVIjK0rFD8sOW3eqznT8I/XzVeEO6
	 kkrS07DoQsFX9bCfTB5k+BUI8vsCdw+qDC9enGWarEUR2TioNp4zqnlBlLp7hNnQex72E
	 F19nmJF6vFkrXEEZMEovkw2Ia+xPTl/d7Agan/HR0lV1OLl833SlVW3oHnlvjFjcAQ1Q1
	 oBE4A+5QcCvsAJEZ9UMAOruR9SRjPGL0dpGka71p/gvgzLHlBJY1IpMU8oYT0kFynhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Lc/xERVm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A37606A319;
	Thu, 22 Oct 2026 19:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lc/xERVm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08111F01825;
	Thu, 22 Oct 2026 19:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792699056;
	bh=Mckqm5Ve1KQcboHq94jGqkE4GT7V9HEqzykEjVbhuvg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Lc/xERVm3ndG1kY4xWhEG8todD/JwC7qtaJMXzu7MBm/M1xC4rggTyYvVF1WyxHHu
	 wzhnYzga6qMi+cpNSEJGLOnGqpeqw9o+q5ydniWtavk08kIQpip8Ksqwxrylab3hvI
	 LI2H46R69H5t2BxQp9MJXBiEjhLHYfukShDwKrx3G3K6yvP7BF9ajocmYovUTCpxXe
	 1EH0CsDrYY+v9UTkMDi1MGd5V7rtzRnh6k+abzHPhZDpmGYSMjSdte/MG9hky34h4T
	 5kwn9d9btVnvV/2+vfQbJb0bMrSVG7Xxnm969jgp/3uInIzalSdfwo39jeNoXSsHlg
	 XYgJZfqcV4UTQ==
Subject: Re: [PATCH net-next v6 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
From: netdev-bot+sashiko@kernel.org
To: cel@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 22 Oct 2026 19:57:35 +0000
Message-ID: <179269905526.1189532.975361221217060549@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-1-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-1-ab01c4ecca0c@kernel.org>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When the new TLS_RX_NODATA_LIMIT break fires,
  tls_sw_read_sock() queues data_ready_work only if…

--

tls: Bound consecutive no-data records in tls_sw_read_sock()

This patch stops tls_sw_read_sock() after TLS_RX_NODATA_LIMIT consecutive
zero-length data records. If a parsed record is ready when the loop stops,
a work item on tls_strp_wq runs the consumer's current sk_data_ready(),
because tls_rx_reader_release() only wakes saved_data_ready.

> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 312e51270f29..0ef0edd51edd 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c

[ ... ]

> @@ -2144,6 +2161,16 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
>  		 */
>  		if (rxm->full_len == 0) {
>  			consume_skb(skb);
> +			if (++nodata >= TLS_RX_NODATA_LIMIT) {
> +				/* tls_rx_reader_release() wakes only the
> +				 * callback saved when TLS_RX was set up,
> +				 * not one installed since.
> +				 */
> +				if (tls_strp_msg_ready(ctx))
> +					queue_work(tls_strp_wq,
> +						   &ctx->data_ready_work);
> +				break;
> +			}

[Severity: Medium]
Can this break return 0 while the next record is still being parsed, with
nothing left to wake nvme-tcp?

data_ready_work is only queued if msg_ready is already set. For the 16th
empty record, tls_rx_rec_done() calls tls_strp_check_rcv(&ctx->strp, false).
If tls_strp_read_sock() returns -ENOMEM, the parse is handed off to
strp->work and msg_ready stays 0:

net/tls/tls_strp.c:tls_strp_check_rcv() {
    ...
	if (tls_strp_read_sock(strp) == -ENOMEM)
		queue_work(tls_strp_wq, &strp->work);
    ...
}

That -ENOMEM can come from alloc_page(sk->sk_allocation) in
tls_strp_read_copy(), and nvme-tcp sets sk_allocation to GFP_ATOMIC. The
copy path runs in copy_mode, or when tls_strp_check_queue_ok() fails on a
fully received record.

Once the loop breaks, tls_strp_msg_ready(ctx) is false and the work item is
not queued. tls_rx_reader_release() calls tls_rx_msg_maybe_announce(),
which also returns early:

	if (!READ_ONCE(strp->msg_ready) || strp->msg_announced)
		return;

Later, tls_strp_work() parses the record via tls_strp_check_rcv(strp, true).
It announces the record only through ctx->saved_data_ready, which for
nvme-tcp is the pre-handshake callback and not nvme_tcp_data_ready(). The
commit message makes the same point.

nvme_tcp_io_work() sees a 0 result from read_sock and does not requeue
itself. Does the fully received record then sit until another TCP segment
arrives or the I/O times out?

Before this patch, the loop went back into tls_rx_rec_wait(). With
sk_receive_queue non-empty, that retried tls_strp_check_rcv()
synchronously, so this state needed two allocation failures in a row. With
the early break, a single failure is enough.

A related case, with empty records left on ctx->rx_list by MSG_PEEK, can be
reached at this commit. It goes away later in the series, because "tls:
Consume empty data records in tls_sw_recvmsg()" keeps empty records off
rx_list.

>  			continue;
>  		}
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261019-tls-follow-on-v6-0-ab01c4ecca0c%40kernel.org

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CE137A4A1
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771885610; cv=none; b=TrVtpoHst0eQJ/P7JWqhLWhr81CsrQTToM+dxhotAXv1ku5jpvjiJEz3AsBkKRYLpnUKtV7md2cFpAmk0nb+uX7YhV79nly8tcWcj1sTY5NlivML0jKk/EJHRmzh2USM022ImqaCDlzMutRlZ8cGV0X8wOI6IHXfxYHJDcCC8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771885610; c=relaxed/simple;
	bh=v1nt6Q8KvB0ip3gmOgU0xDpdDJxT/hFkVLPDRtIVLn4=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=jgblvgQMnigq2Mh80RGWD9EBBqT9FlBtKVd6FP1wH1ioBV05UZhc8d6t2vjwGtpwGF0YKJYMGRmlV6rjoC7YGhKKGWJVO7tLpgrttwVIMqWaKbHRmveNXT0ZSMIh4MXr5g0+XHxXsXLiJP/RLthDE1ClZvKYCMR5E50AP4q0BNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QV3b+Pdc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=md1SwkWj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QV3b+Pdc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="md1SwkWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771885608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxrd9Nzhflf9oDGqwWi2cxBj+7zSCrYbs0JiRTvxGiA=;
	b=QV3b+PdcvM9iEI25h+nImOz8XnQDEj4Y+SI4JpXVfOuNkKmFq+b61YY7E+6qkz3HkVw+x5
	NVo8nicvNuTTgBl8tlPDrL3dboAjTKtH0yP8Ol7PB4MgB9AKu55aTGDmErru5VGlyvQt22
	ETX/9dtpp8gUoqoJ7iKyVvRXKgqO58I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-_kd8AwFCOg6RWvlsH8tIww-1; Mon, 23 Feb 2026 17:26:43 -0500
X-MC-Unique: _kd8AwFCOg6RWvlsH8tIww-1
X-Mimecast-MFC-AGG-ID: _kd8AwFCOg6RWvlsH8tIww_1771885602
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48378c4a79fso36920995e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 14:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771885602; x=1772490402; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxrd9Nzhflf9oDGqwWi2cxBj+7zSCrYbs0JiRTvxGiA=;
        b=md1SwkWjPgZWquWR/5RkjsVIlBdEvIRk0XydWQiSxN1TLnOp2vV1Ws3QN5XyUnmjKn
         E3Dq8/Q0dZVLAtYRa75AgfV0QQY8BoS1ZBTpjgrURO+z2EjMWMbRc00AN1zWaPLXGhb5
         6a2eNeHmUlKK4AIhdIS5boYpJfbL6v6JD4F3m0wMp/F9U6bDLrMgXzmOfjr3UXDZ9Tv6
         6zN42iEirzF8rojLCLcFp3UfE5Zbz0CY8pE1rPdfn8wX8PraVkcX3tBesue9FP2ukFOo
         mjm3suJ0Tole4siPSk4Qr9D4zhgwWX0z4w4n4QH5hkeKSxezB4E0QCPnvkyXvRNT5I0B
         Wpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771885602; x=1772490402;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxrd9Nzhflf9oDGqwWi2cxBj+7zSCrYbs0JiRTvxGiA=;
        b=UIgugRCrnUhBqJv96SoTepc8ouzKrmlMZ9WaZCbLk8SFsyVRUVIZDFfL1GxuUxndK8
         vu7FEGsEhNUjIfmDejz0rzov3Ix8rZOMuShIU+b0bgRM1a/IQJvvcp+Y/nrJIiQHLgJG
         T3hFXknsJZkg8AFYvhaNyShilRw8cCy1/sMlE9TpYaGVhDAhk5wsyCBZe6hsZ+mo+6P2
         YZ+T6gEvXrRWLy6UB1pQbktGTHvFg2ZDx6K5ZkU53Sb2PByySnoCtSAMVSfL4GLWZese
         l5aWXRKflgtpKWNLzXqkc5/povwEHMoBurMCQDyGSQqyJNNiFM+x7lTlIyg+cRR1Fyzf
         WFDA==
X-Forwarded-Encrypted: i=1; AJvYcCXi1Ae86Pkt7m96/Qv4xAS56kJO1w4iYqy54u2DMbgvWbC9/+Vjke5EF+cOa1O7DCO5KCZGOsqLKF3iuqxIwCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3LeogdavCh0STj/z9ZrCajXLxU5zLbPRfvi9F9Ph6i/DKOQyJ
	+qLh+d2ONq2lQyn1K279NUgLAmBpnT13eG3ZAmRm4liXPsQgTRm9HErQQzCsowgbQaQLBK19rii
	qmbnY2U1xiQbrCrcZQMbb4vS5Hun8NuTM3VnowQwDiMv4x8obA5dtp+Cy6YZk1+nnPoAT1A==
X-Gm-Gg: AZuq6aLpZ1OV4bbOWGBuN3qrS5fmYyjISsW55CmIgIL3FpQ0afyDm+aKBwa9m1EjZkB
	Qk32/5xsc31j1LHf9QPKiafOxGIFZp93lwFV2JklV5H9dCC6+svEBVBf0wj71brrflYMyhuoNti
	78p/Qhi45Oc3NLkeMWRICpOrCTBjsTVK9gixzGY8x8SQGm/ESh0Q1ZkKO+ou4PsK/9kMxevAp92
	RRCzMXOFIkPzas14XAovyADq9ZYbDziSsPNPO/ZvXe6cuxpdslAMTaTjQOVia4iJUFHX+H7avH4
	W4rO6NFK/91EJQUGqlcgbZJvsMEE7s51DNJChgXywJPMfDTDvCHWA7N5hTxGMhl2aCX80KvR+qH
	B++u12Ve+ywT2YIJLulOG6QMnesq3ROclwRVznR8stHq6DL1/xA==
X-Received: by 2002:a05:600c:c4ac:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-483a95a3822mr170242915e9.0.1771885602302;
        Mon, 23 Feb 2026 14:26:42 -0800 (PST)
X-Received: by 2002:a05:600c:c4ac:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-483a95a3822mr170242425e9.0.1771885601733;
        Mon, 23 Feb 2026 14:26:41 -0800 (PST)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm21788265f8f.23.2026.02.23.14.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:26:41 -0800 (PST)
From: Stefano Brivio <sbrivio@redhat.com>
To: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>
Cc: gmbnomis@gmail.com, Eric Dumazet <edumazet@google.com>, Neal Cardwell
 <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, David Ahern
 <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>, Jason Xing
 <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, Shuah Khan
 <shuah@kernel.org>, Christian Ebner <c.ebner@proxmox.com>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC net-next 1/4] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <20260223232636.1ead2b3e@elisabeth>
In-Reply-To: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-1-904942561479@gmail.com>
References: <20260220-tcp_rfc7323_retract_wnd_rfc-v1-0-904942561479@gmail.com>
	<20260220-tcp_rfc7323_retract_wnd_rfc-v1-1-904942561479@gmail.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Feb 2026 23:26:40 +0100 (CET)

Hi Simon,

It all makes sense to me at a quick look, I have just some nits and one
more substantial worry, below:

On Fri, 20 Feb 2026 00:55:14 +0100
Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org> wrote:

> From: Simon Baatz <gmbnomis@gmail.com>
> 
> By default, the Linux TCP implementation does not shrink the
> advertised window (RFC 7323 calls this "window retraction") with the
> following exceptions:
> 
> - When an incoming segment cannot be added due to the receive buffer
>   running out of memory. Since commit 8c670bdfa58e ("tcp: correct
>   handling of extreme memory squeeze") a zero window will be
>   advertised in this case. It turns out that reaching the required
>   "memory pressure" is very easy when window scaling is in use. In the
>   simplest case, sending a sufficient number of segments smaller than
>   the scale factor to a receiver that does not read data is enough.
> 
>   Since commit 1d2fbaad7cd8 ("tcp: stronger sk_rcvbuf checks") this
>   happens much earlier than before, leading to regressions (the test
>   suite of the Valkey project does not pass because of a TCP
>   connection that is no longer bi-directional).

Ouch. By the way, that same commit helped us unveil an issue (at least
in the sense of RFC 9293, 3.8.6) we fixed in passt:

  https://passt.top/passt/commit/?id=8d2f8c4d0fb58d6b2011e614bc7d7ff9dab406b3

> - Commit b650d953cd39 ("tcp: enforce receive buffer memory limits by
>   allowing the tcp window to shrink") addressed the "eating memory"
>   problem by introducing a sysctl knob that allows shrinking the
>   window before running out of memory.
> 
> However, RFC 7323 does not only state that shrinking the window is
> necessary in some cases, it also formulates requirements for TCP
> implementations when doing so (Section 2.4).
> 
> This commit addresses the receiver-side requirements: After retracting
> the window, the peer may have a snd_nxt that lies within a previously
> advertised window but is now beyond the retracted window. This means
> that all incoming segments (including pure ACKs) will be rejected
> until the application happens to read enough data to let the peer's
> snd_nxt be in window again (which may be never).
> 
> To comply with RFC 7323, the receiver MUST honor any segment that
> would have been in window for any ACK sent by the receiver and, when
> window scaling is in effect, SHOULD track the maximum window sequence
> number it has advertised. This patch tracks that maximum window
> sequence number throughout the connection and uses it in
> tcp_sequence() when deciding whether a segment is acceptable.
> Acceptability of data is not changed.
> 
> Fixes: 8c670bdfa58e ("tcp: correct handling of extreme memory squeeze")
> Fixes: b650d953cd39 ("tcp: enforce receive buffer memory limits by allowing the tcp window to shrink")
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---
>  Documentation/networking/net_cachelines/tcp_sock.rst       |  1 +
>  include/linux/tcp.h                                        |  1 +
>  include/net/tcp.h                                          | 14 ++++++++++++++
>  net/ipv4/tcp_fastopen.c                                    |  1 +
>  net/ipv4/tcp_input.c                                       |  6 ++++--
>  net/ipv4/tcp_minisocks.c                                   |  1 +
>  net/ipv4/tcp_output.c                                      | 12 ++++++++++++
>  .../selftests/net/packetdrill/tcp_rcv_big_endseq.pkt       |  2 +-
>  8 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/networking/net_cachelines/tcp_sock.rst b/Documentation/networking/net_cachelines/tcp_sock.rst
> index 563daea10d6c5c074f004cb1b8574f5392157abb..fecf61166a54ee2f64bcef5312c81dcc4aa9a124 100644
> --- a/Documentation/networking/net_cachelines/tcp_sock.rst
> +++ b/Documentation/networking/net_cachelines/tcp_sock.rst
> @@ -121,6 +121,7 @@ u64                           delivered_mstamp        read_write
>  u32                           rate_delivered                              read_mostly         tcp_rate_gen
>  u32                           rate_interval_us                            read_mostly         rate_delivered,rate_app_limited
>  u32                           rcv_wnd                 read_write          read_mostly         tcp_select_window,tcp_receive_window,tcp_fast_path_check
> +u32                           rcv_mwnd_seq            read_write                              tcp_select_window
>  u32                           write_seq               read_write                              tcp_rate_check_app_limited,tcp_write_queue_empty,tcp_skb_entail,forced_push,tcp_mark_push
>  u32                           notsent_lowat           read_mostly                             tcp_stream_memory_free
>  u32                           pushed_seq              read_write                              tcp_mark_push,forced_push
> diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> index f72eef31fa23cc584f2f0cefacdc35cae43aa52d..5a943b12d4c050a980b4cf81635b9fa2f0036283 100644
> --- a/include/linux/tcp.h
> +++ b/include/linux/tcp.h
> @@ -271,6 +271,7 @@ struct tcp_sock {
>  	u32	lsndtime;	/* timestamp of last sent data packet (for restart window) */
>  	u32	mdev_us;	/* medium deviation			*/
>  	u32	rtt_seq;	/* sequence number to update rttvar	*/
> +	u32	rcv_mwnd_seq; /* Maximum window sequence number (RFC 7323, section 2.4) */

Nit: tab between ; and /* for consistency (I would personally prefer
the comment style as you see on 'highest_sack' but I don't think it's
enforced anymore).

Second nit: mentioning RFC 7323, section 2.4 could be a bit misleading
here because the relevant paragraph there covers a very specific case of
window retraction, caused by quantisation error from window scaling,
which is not the most common case here. I couldn't quickly find a better
reference though.

More importantly: do we need to restore this on a connection that's
being dumped and recreated using TCP_REPAIR, or will things still work
(even though sub-optimally) if we lose this value?

Other window values that *need* to be dumped and restored are currently
available via TCP_REPAIR_WINDOW socket option, and they are listed in
do_tcp_getsockopt(), net/ipv4/tcp.c:

		opt.snd_wl1	= tp->snd_wl1;
		opt.snd_wnd	= tp->snd_wnd;
		opt.max_window	= tp->max_window;
		opt.rcv_wnd	= tp->rcv_wnd;
		opt.rcv_wup	= tp->rcv_wup;

CRIU uses it to checkpoint and restore established connections, and
passt uses it to migrate them to a different host:

  https://criu.org/TCP_connection

  https://passt.top/passt/tree/tcp.c?id=02af38d4177550c086bae54246fc3aaa33ddc018#n3063

If it's strictly needed to preserve functionality, we would need to add
it to struct tcp_repair_window, notify CRIU maintainers (or send them a
patch), and add this in passt as well (I can take care of it).

Strictly speaking, in case, this could be considered a breaking change
for userspace, but I don't see how to avoid it, so I'd just make sure
it doesn't impact users as TCP_REPAIR has just a couple of (known!)
projects relying on it.

An alternative would be to have a special, initial value representing
the fact that this value was lost, but it looks really annoying to not
be able to use a u32 for it.

Disregard all this if the correct value is not strictly needed for
functionality, of course. I haven't tested things (not yet, at least).

>  	u64	tcp_wstamp_ns;	/* departure time for next sent data packet */
>  	u64	accecn_opt_tstamp;	/* Last AccECN option sent timestamp */
>  	struct list_head tsorted_sent_queue; /* time-sorted sent but un-SACKed skbs */
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 40e72b9cb85f08714d3f458c0bd1402a5fb1eb4e..e1944d504823d5f8754d85bfbbf3c9630d2190ac 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -912,6 +912,20 @@ static inline u32 tcp_receive_window(const struct tcp_sock *tp)
>  	return (u32) win;
>  }
>  
> +/* Compute the maximum receive window we ever advertised.
> + * Rcv_nxt can be after the window if our peer push more data

s/push/pushes/

s/Rcv_nxt/rcv_nxt/ (useful for grepping)

> + * than the offered window.
> + */
> +static inline u32 tcp_max_receive_window(const struct tcp_sock *tp)
> +{
> +	s32 win = tp->rcv_mwnd_seq - tp->rcv_nxt;
> +
> +	if (win < 0)
> +		win = 0;

I must be missing something but... if the sequence is about to wrap,
we'll return 0 here. Is that intended?

Doing the subtraction unsigned would have looked more natural to me,
but I didn't really think it through.

> +	return (u32) win;

Kernel coding style doesn't usually include a space between cast and
identifier.

> +}
> +
> +
>  /* Choose a new window, without checks for shrinking, and without
>   * scaling applied to the result.  The caller does these things
>   * if necessary.  This is a "raw" window selection.
> diff --git a/net/ipv4/tcp_fastopen.c b/net/ipv4/tcp_fastopen.c
> index b30090cff3cf7d925dc46694860abd3ca5516d70..f034ef6e3e7b54bf73c77fd2bf1d3090c75dbfc6 100644
> --- a/net/ipv4/tcp_fastopen.c
> +++ b/net/ipv4/tcp_fastopen.c
> @@ -377,6 +377,7 @@ static struct sock *tcp_fastopen_create_child(struct sock *sk,
>  
>  	tcp_rsk(req)->rcv_nxt = tp->rcv_nxt;
>  	tp->rcv_wup = tp->rcv_nxt;
> +	tp->rcv_mwnd_seq = tp->rcv_wup + tp->rcv_wnd;
>  	/* tcp_conn_request() is sending the SYNACK,
>  	 * and queues the child into listener accept queue.
>  	 */
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e7b41abb82aad33d8cab4fcfa989cc4771149b41..af9dd51256b01fd31d9e390d69dcb1d1700daf1b 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4865,8 +4865,8 @@ static enum skb_drop_reason tcp_sequence(const struct sock *sk,
>  	if (before(end_seq, tp->rcv_wup))
>  		return SKB_DROP_REASON_TCP_OLD_SEQUENCE;
>  
> -	if (after(end_seq, tp->rcv_nxt + tcp_receive_window(tp))) {
> -		if (after(seq, tp->rcv_nxt + tcp_receive_window(tp)))
> +	if (after(end_seq, tp->rcv_nxt + tcp_max_receive_window(tp))) {
> +		if (after(seq, tp->rcv_nxt + tcp_max_receive_window(tp)))
>  			return SKB_DROP_REASON_TCP_INVALID_SEQUENCE;
>  
>  		/* Only accept this packet if receive queue is empty. */
> @@ -6959,6 +6959,7 @@ static int tcp_rcv_synsent_state_process(struct sock *sk, struct sk_buff *skb,
>  		 */
>  		WRITE_ONCE(tp->rcv_nxt, TCP_SKB_CB(skb)->seq + 1);
>  		tp->rcv_wup = TCP_SKB_CB(skb)->seq + 1;
> +		tp->rcv_mwnd_seq = tp->rcv_wup + tp->rcv_wnd;
>  
>  		/* RFC1323: The window in SYN & SYN/ACK segments is
>  		 * never scaled.
> @@ -7071,6 +7072,7 @@ static int tcp_rcv_synsent_state_process(struct sock *sk, struct sk_buff *skb,
>  		WRITE_ONCE(tp->rcv_nxt, TCP_SKB_CB(skb)->seq + 1);
>  		WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
>  		tp->rcv_wup = TCP_SKB_CB(skb)->seq + 1;
> +		tp->rcv_mwnd_seq = tp->rcv_wup + tp->rcv_wnd;
>  
>  		/* RFC1323: The window in SYN & SYN/ACK segments is
>  		 * never scaled.
> diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
> index ec128865f5c029c971eb00cb9ee058b742efafd1..df95d8b6dce5c746e5e34545aa75a96080cc752d 100644
> --- a/net/ipv4/tcp_minisocks.c
> +++ b/net/ipv4/tcp_minisocks.c
> @@ -604,6 +604,7 @@ struct sock *tcp_create_openreq_child(const struct sock *sk,
>  	newtp->window_clamp = req->rsk_window_clamp;
>  	newtp->rcv_ssthresh = req->rsk_rcv_wnd;
>  	newtp->rcv_wnd = req->rsk_rcv_wnd;
> +	newtp->rcv_mwnd_seq = newtp->rcv_wup + req->rsk_rcv_wnd;
>  	newtp->rx_opt.wscale_ok = ireq->wscale_ok;
>  	if (newtp->rx_opt.wscale_ok) {
>  		newtp->rx_opt.snd_wscale = ireq->snd_wscale;
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 326b58ff1118d02fc396753d56f210f9d3007c7f..50774443f6ae0ca83f360c7fc3239184a1523e1b 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -274,6 +274,15 @@ void tcp_select_initial_window(const struct sock *sk, int __space, __u32 mss,
>  }
>  EXPORT_IPV6_MOD(tcp_select_initial_window);
>  
> +/* Check if we need to update the maximum window sequence number */
> +static inline void tcp_update_max_wnd_seq(struct tcp_sock *tp)
> +{
> +	u32 wre = tp->rcv_wup + tp->rcv_wnd;
> +
> +	if (after(wre, tp->rcv_mwnd_seq))
> +		tp->rcv_mwnd_seq = wre;
> +}
> +
>  /* Chose a new window to advertise, update state in tcp_sock for the
>   * socket, and return result with RFC1323 scaling applied.  The return
>   * value can be stuffed directly into th->window for an outgoing
> @@ -293,6 +302,7 @@ static u16 tcp_select_window(struct sock *sk)
>  		tp->pred_flags = 0;
>  		tp->rcv_wnd = 0;
>  		tp->rcv_wup = tp->rcv_nxt;
> +		tcp_update_max_wnd_seq(tp);
>  		return 0;
>  	}
>  
> @@ -316,6 +326,7 @@ static u16 tcp_select_window(struct sock *sk)
>  
>  	tp->rcv_wnd = new_win;
>  	tp->rcv_wup = tp->rcv_nxt;
> +	tcp_update_max_wnd_seq(tp);
>  
>  	/* Make sure we do not exceed the maximum possible
>  	 * scaled window.
> @@ -4169,6 +4180,7 @@ static void tcp_connect_init(struct sock *sk)
>  	else
>  		tp->rcv_tstamp = tcp_jiffies32;
>  	tp->rcv_wup = tp->rcv_nxt;
> +	tp->rcv_mwnd_seq = tp->rcv_nxt + tp->rcv_wnd;
>  	WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
>  
>  	inet_csk(sk)->icsk_rto = tcp_timeout_init(sk);
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_rcv_big_endseq.pkt b/tools/testing/selftests/net/packetdrill/tcp_rcv_big_endseq.pkt
> index 3848b419e68c3fc895ad736d06373fc32f3691c1..1a86ee5093696deb316c532ca8f7de2bbf5cd8ea 100644
> --- a/tools/testing/selftests/net/packetdrill/tcp_rcv_big_endseq.pkt
> +++ b/tools/testing/selftests/net/packetdrill/tcp_rcv_big_endseq.pkt
> @@ -36,7 +36,7 @@
>  
>    +0 read(4, ..., 100000) = 4000
>  
> -// If queue is empty, accept a packet even if its end_seq is above wup + rcv_wnd
> +// If queue is empty, accept a packet even if its end_seq is above rcv_mwnd_seq
>    +0 < P. 4001:54001(50000) ack 1 win 257
>    +0 > .  1:1(0) ack 54001 win 0
>  
> 

-- 
Stefano


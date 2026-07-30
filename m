Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C734404F;
	Thu, 30 Jul 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402787; cv=none; b=pIEWrntRtK5p1KCzrH7BkSpeptjOVEnQCQTZDzAHOJEqnNJmJ/Ici0LgfPgUoT7hXygtSKIofKDPigWwLaBQYi/7G+j6Gp56Kj0yzk6wqPIbrCAA6p87gFb4tngeytsALAMB4sSc9JQ/0VWMnC0OSru5yvs9o0/1nTPPH8XJE3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402787; c=relaxed/simple;
	bh=SPyph8SwkzQo6QFaqKEqBFQRTfhxgebjreZjORMln2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qpym1hbvNbvM33IfDkTV/n3FVcpeT21mW2XnuuT2CL0xu9C2YViyXqLZZy5z5LWLYvrNOd/lXkXY3znvKYrks1Zr8YpLuIkyh4qWRAazQX8+nSCRy8RggekCel4S5tbpWIv3+qQDUH/JDfNvyMmOl3BYRvnPYdaJuBq+R59fFFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=A1emraFN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nuFTyaFt; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="A1emraFN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nuFTyaFt"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B6535EC035B;
	Thu, 30 Jul 2026 05:13:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 30 Jul 2026 05:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785402782; x=
	1785489182; bh=dOvmfcB8Rnyi7TU0Kb5NLwz/YjH6DAmwtYtHAVf6kpc=; b=A
	1emraFNYmf48TQGmHOpvWXVPxOu+Wk4CPoY9Mm+e0QmwGYuk0VnZY4+gq02YbM8f
	6n4cC2hS78DEsIDJ9VaOvck92TqkdEcxc/RvwimKLYRqibkDNMLJVZfw9YwRSiB9
	uMS1G3Br14jESeaM2AMml75LaJkZo5uF8B33wnawD6qBb6TPSSHotZv8NF4EShcn
	BdwBrmKaGtlrEgK7xGe19YZpiw54iVBYiRk50zuTCC90Fw1/PHZHc2gROQX/PJGd
	fG0dDON99Ii/tKwJ+rXHJrDGUZrQk2RNMEJrjyskpJxvBnlp0RtjiZgWOk/ayynZ
	/X91R0xlh4guPUMSJM8FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785402782; x=1785489182; bh=dOvmfcB8Rnyi7TU0Kb5NLwz/YjH6DAmwtYt
	HAVf6kpc=; b=nuFTyaFtn0+wo/w8vCMSdoDUiTECOtLgwoqVW2pWuhVMAV72Fok
	B06UcsWBDqSmWVxDcSKKZysXL01ZtuQvkmrZmS1swp6hJnOY9HOOUcle5BH9Jrp6
	kj8vg8aWi1zsGa+B360szTcA04XdO16md0/G6oMak2Lp5sNOlpJlFJLO6jDKyZUW
	IR6LMLDxXLIuyxbmqo1+02ZY+Vf0tsfvm88Unt8n47xEzi/inscixeKWFBDTvtm3
	ZVLQRffIRGPHerCHbax8LLPbQXZ3OQ8XlwFjuwo5Tel7LWjavML3xR7MR9AF8MbO
	hnOS5+llv133gDdbTFobykQfE1E4hatGiJw==
X-ME-Sender: <xms:nhVratctN4wPRGcBLKWo-i9RLim-3LJyBvW4pzazL9lXYCxpDOIpmA>
    <xme:nhVrapc0Wl2wmXb2OJwadgKi_9O8JKz7nwA-__90Ec9snRw91ZBsACnCyqJVTRxyx
    E_UWCYLv4j_z9VsKUm-JTmYgOv-_awFEcaRNp-8tuvzrLwdvsQB2wkH>
X-ME-Received: <xmr:nhVrav1RKi97VoiS9LHaceqXWWU-7EJ3YCcLihS1omXnpqs2UJ6XG5iI1vk>
X-ME-Proxy-Cause: dmFkZTGEhtzYlC6voX/ylNLI4OoFyxAR3gMVMDVPoD0lCQ5OTOa0hbdUOhW023UGvHb9S5
    HWd5fQLjHnn+rREm1O4iU/YEHwOHnx7JlZBPjjle9Im1qGeAA0WQr2bFRcDKRMrnpZ1UsR
    ADSaFQ/qQ/BkxZw9xp/vKuRS0LHf4ZbC2CzGWCMxXtkorFXIVhwkdpRUirmBgtisL/ikOk
    BKK4RlHpWU6OGoSj3g0y0p+sfJEo3EncFiMUYIP9MqOV1mFAtZgbDLM4r5WsEVK1Xes2Ia
    8iO9R2HjERnhgokwr3SanGo7vtc6xVVzhO7tQ6jMAyBPer453q3OW61DO/zeyw9mKBMYjV
    brHUdqh2AFkGpmvBZF2NxYiW8/H5lU4TzDAkP05wsbHdj4zRjRVkCEqVtZCGMpvqtn8eko
    VvVKjIl05vLCK6DPy6dqpXbRHvx/tfpVf3oZn6b5/NSOaxghoM7V8ewN91ocj1YuekKoDq
    Vc1TcFWsVuYPhYXUeqihjQ/C/cZilBJMHqo3qpcF6Ji2GUXYoCYWd8rmBXFg1eEcFH9W3i
    g6Fvgwo+MibV9VvGAoQEN6wHL/5y98WlycoZC8k7fFTb9sM9NuRb4dYnLg9anKXg+neKzv
    Si7RhLZyyeqCGi1lj8x/VRdtAq687UaMbhX7KbISu1aZWug6BkmVr55QD+0A
X-ME-Proxy: <xmx:nhVrap8JzwyED8blgARH3Bdpdl6lYP5YIpdUTFRVdMNnj2STOwdKCw>
    <xmx:nhVras4NKwemPlSn4CZFHEAK83UF4fAdW08KK2_gNo9iCSG5yr1o0A>
    <xmx:nhVraptf1dZrFuU1oq3K8fMZeU5vP0CV-14BRgAe2kjb4fV8gGzjeA>
    <xmx:nhVram0w9IEoCSrCLlC1u-irAm0PtE_7LpSVncItBYPcsmqLHI0DNA>
    <xmx:nhVraqMPXpVk4ML9Zq44X9d0T_oSd125a_Lw3ukZxY5SFbBCfqPd00uc>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 05:13:01 -0400 (EDT)
Date: Thu, 30 Jul 2026 11:12:59 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/9] net/tls: Bound time spent on no-data records in
 tls_sw_read_sock()
Message-ID: <amsVm65P9E0_SUT3@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-tls-follow-on-v1-1-99bf4cc1c729@kernel.org>

2026-07-26, 20:33:29 -0400, Chuck Lever wrote:
> An empty TLS 1.3 data record delivers no payload, so it leaves
> tls_sw_read_sock() in its loop without advancing the caller's read
> descriptor. A peer that streams such records keeps the receive loop
> running, and the socket lock held, for as long as they arrive.

BTW, should such a peer be considered malicious and
disconnected/blocked? Of course the logic for that should be left to
whatever is calling read_sock, not to TLS itself.

> Bound a run of such records, as net_rx_action() bounds a softirq
> poll. The first record that delivers no bytes arms a deadline
> TLS_RX_NODATA_NS ahead; any record that delivers bytes disarms it,
> so a normal stream never trips it. Breaking out with nothing copied

Another thought here: I think a peer that sends "some" 0-length data
records followed by one (possibly very small) data record, and then
repeats that sequence, will not hit this "rate-limiting" of no-data
records. Is that right? And if so, is that a problem?
[I'm guessing that the caller is doing something equivalent to
recvmsg(WAITALL), so it could be stuck for a long time even with this
new bound]

> returns zero, which a read_sock consumer reads as "no progress"
> rather than EOF, so the connection stays up. Records left queued
> draw no fresh sk_data_ready() of their own, so fire the socket's
> current callback before returning.

[...]
> @@ -2122,7 +2129,19 @@ int tls_sw_read_sock(struct sock *sk, read_descriptor_t *desc,
>  		 * here instead.
>  		 */
>  		if (rxm->full_len == 0) {
> +			err = 0;
>  			consume_skb(skb);
> +			if (!nodata_deadline) {
> +				nodata_deadline = ktime_get_ns() +
> +						  TLS_RX_NODATA_NS;
> +			} else if (ktime_get_ns() >= nodata_deadline) {
> +				/* Queued records raise no new sk_data_ready(),
> +				 * and tls_rx_reader_release() announces only to
> +				 * saved_data_ready(), not the consumer's own.

sk->sk_data_ready is tls_data_ready at this point, no? I'm confused by
"the consumer" here.

> +				 */
> +				sk->sk_data_ready(sk);
> +				break;
> +			}
>  			continue;
>  		}

-- 
Sabrina

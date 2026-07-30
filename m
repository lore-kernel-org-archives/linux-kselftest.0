Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137473F6606;
	Thu, 30 Jul 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407918; cv=none; b=GK2tPi2yzXAMPuEYiM3ZX6OE91B9aONBIzvWuAUHxkkAQlMCfnxu+KZhscchNMisY7PIsGZfsjD4b97aauPjfXokPAOowvuZ8ril5ma+MCQrabCJnECfyklacvEDA9X0Uo1m5k5Up0aIBBTuX3Nnn0/6q9CpwGuTebyagFxiDlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407918; c=relaxed/simple;
	bh=qpj/3O8Ooi8ahZQwml+hIRi7UGvGQQHFKAL/k21tbD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex9Iaf/bUPBmGHx23mRsFTzCwhqjFAF0K+ofBAfLflzdFbi/UHqsVih9SlPayHnLrrVAZ8xcVQZu0mQ6seJYOURxNxiRb5Fn4j1pcudZJEuY8FAeYDQDmkGzEQObHCk6KQtEGYw2MN14+K0zfCPkZhavqUto0gWyxHhXkM0t7eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=DEfjIgeg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lKjdJuU4; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="DEfjIgeg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lKjdJuU4"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E1BA814000EE;
	Thu, 30 Jul 2026 06:38:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 30 Jul 2026 06:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785407913; x=
	1785494313; bh=+uGJr9F1JSrDYUeGZDLKGugtKHUyem8olzFYuhSVLLU=; b=D
	EfjIgegOmZF3jQ5RasrMK/O8OoDxtm8qakeRss0IYf87ze5z3s7banjOUTs/SiGI
	VqsUXPM+lYzgCUrbErtkbfXN5UXf/g35sIYnBK5lToZkJMPWZfAtKsEDDJCirmmm
	r/JYtnjRjivQJQ0U0gUzCdNiyTYrfh1k/nvtNGieqlf2jn7xgkwrILeKnfTD+djs
	HKHqqy8tiFhaffRJPGVMky+EOUonGuHFecgJmXtpZ01m4CDPB0yRYy5GH2a+GsRg
	YMLZy4m/hN2ZS/uhsArPbOhs32r1gRgKisHuQHwVVKeNHzLg2IjgLMlCpQsYpWWQ
	LUncEEebYbiGbrH18IDhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785407913; x=1785494313; bh=+uGJr9F1JSrDYUeGZDLKGugtKHUyem8olzF
	YuhSVLLU=; b=lKjdJuU41VtJRyf4+ON/wTNy5t690zXrpDoluHvEYDQSOVVUmWC
	4HEVysMz+UQj1ocGb0nU7kvv0rECSC2AsOw+uXVadZkCl04mVrXcvAT+C39f/6RT
	SxAZIEBrdQsCnknzWw8H81v8sNbc/Ck0AtuytTlLAqow6eVHPRIj4USv/Su1hiXx
	Nd/03vKX8EkfQt8vW7tk3B+Smz6jAaGpBL89yWiprpIMXaN4800al8g03iBGrWrg
	hk18zqmVctQomHjnKNWeh8wdxy4ib3mzYb6gGtjvk4XPKuBavORArq0JymteBE2c
	sbpVqOGu8ayjs1BGusFf4ubGq3VrcNHXVwA==
X-ME-Sender: <xms:qSlravfxzxS8QwkgMgjWjs9ThupETIqe1uaDpZst71a3CWxu__gJoA>
    <xme:qSlrajd2GlQKAXzyId79jVnvpmN6vZYF8SV3chTmApk0Tvg9QjpvyBURft9pN7X_u
    U40fAoClZKoNkay41ok6q2AW0TCzkGxOEbdyhUQc3EvjUyiytgJnPih>
X-ME-Received: <xmr:qSlrah0DfDln8lftijkz6zYH_83O28921z9vR7nopRs-iTMQlPciMANx8RM>
X-ME-Proxy-Cause: dmFkZTE8pAaDT+BdLaV07pnMgSv8bazE+JbdiUNGNYUor0jgNLiRxL3J7LufqecXwQB60L
    HBgCq6Szna7YCX6j7FtqhXk7SWTQgPgSZcA/1Zsxq/OBVjEwhoTh296OLJm/9j3s+Oh2zO
    fJju8HXo7DV1YOg4xcdC+h7vqQt4Wwy5oOfwSAcJpPXtHNRt//9X1x4dykLR4nHMxG4PVE
    s1a4F/YVvNIJisuBi6Ox3W7crBrUvKDiFiaEQX5yTwDtSCEUgpaXgFeN11K7aUwHx5za/n
    52Scd65qaYrESdPbPyBA25mAMFmenImAiavcsijQNaZU5wBGbQLnj5ex0mQVFP98tV8/pQ
    883gXJ7TdRtSBX9aLeOOeAcbzZcfDqJ0beQ5GkrskP4IDnOYkxNWdjL5/UJ3pV7Jkz7qnj
    7827fhLbV99pRsAC+5l6H/KCcbEJmBSJuuoim2MIoK6vnjxT2jyzIqjsg/u6dZeoLjKow+
    IlekZ3T92r6tM/PDHBFDn+y+XNq3frzDdQq107t/JssB8w/oXG568ONbptI/LxRHoq0J2h
    LSn9ICzhI7JrgTt/Fer24KK/2Hx3YHzRPaYdm2rptzLVDYSZd/KRM20swwqTLDCbAIxodQ
    SaqRhPEJ6++ASMaEu0lzV8Q3ixnxF0oaWzzpZYCEQfo/9iyOJ82hDNzEoMbg
X-ME-Proxy: <xmx:qSlraj80OuCWRTTqe6yBEjkNO_yuaScAuhfhvkEvrS6vYYAOFKlLdQ>
    <xmx:qSlrau7zl1_V8FZPz6PnpHFjBd9v9gvOR4hO5hQgiLVmPnsTvTJiCg>
    <xmx:qSlrajsbdDkJD0ppRZnsDQP_FCyDSXDsBcuEemYCOq-gWTYSNEuhIQ>
    <xmx:qSlrao3Tm9MG814hX1wtzXIk1BTJkKOweaMLosoKq_XAbunJFbwxGw>
    <xmx:qSlrakPfbb1g67UcxhxpRbEjB6KE9eIgCB1Nc_UGJs2EErEKqL4ymrhM>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 06:38:32 -0400 (EDT)
Date: Thu, 30 Jul 2026 12:38:31 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/9] net/tls: Consume empty data records in
 tls_sw_splice_read()
Message-ID: <amsppyDTgxm-b5pk@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-2-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-tls-follow-on-v1-2-99bf4cc1c729@kernel.org>

2026-07-26, 20:33:30 -0400, Chuck Lever wrote:
> +/* TLS 1.2 and TLS 1.3 both permit a zero-length application_data
> + * record as a traffic-analysis countermeasure (RFC 5246, Section
> + * 6.2.1; RFC 8446, Section 5.1).
> + */
> +static bool tls_rx_empty_data_rec(int len, unsigned char control)
> +{
> +	return !len && control == TLS_RECORD_TYPE_DATA;
> +}

I'm not convinced by this helper. The record type check is redundant
for splice and read_sock, and it doesn't save much for recvmsg.

If we're going to keep it, I'd rather pass it the skb and fetch the
length and record type directly in the helper, since that's anyway
what all callers are passing.

[...]
> @@ -2017,6 +2037,11 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  
>  		tls_rx_rec_done(ctx);
>  		skb = darg.skb;
> +
> +		/* The socket lock stays held to the retry, so the
> +		 * anchor this wait loaded survives it.

I'm quite confused by this comment. Do you mean "We haven't released
the lock, so don't tell tls_rx_rec_wait that we have if we retry" ?

Either way, I don't think we should be leaking mentions of the
"anchor" outside of strp.c. Whatever tls_rx_rec_wait() does with the
"released" argument isn't tls_sw_splice_read()'s business.

> +		 */
> +		released = false;
>  	}
>  
>  	rxm = strp_msg(skb);
> @@ -2028,6 +2053,21 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
>  		goto splice_requeue;
>  	}
>  
> +	/* Splicing an empty data record delivers zero bytes, which the
> +	 * caller reads as EOF. tls_rx_rec_wait() skips its signal check
> +	 * while a record is parsed, so test for a signal here.
> +	 */
> +	if (tls_rx_empty_data_rec(rxm->full_len, tlm->control)) {
> +		long timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
> +
> +		consume_skb(skb);
> +		if (signal_pending(current)) {
> +			err = tls_rx_intr_errno(timeo);
> +			goto splice_read_end;
> +		}
> +		goto retry;

This looping (and the existing one in the other RX handlers) is making
rcvtimeo a bit pointless AFAICT:

 - we apply rcvtimeo to tls_rx_reader_acquire/tls_rx_reader_lock
 - if that worked (maybe consuming almost the full duration), we keep going
 - we apply rcvtimeo (from "0") it tls_rx_rec_wait
 - keep going again, so maybe we've already consumed close to 2*rcvtimeo
 - decrypt does its thing
 - if we're getting a bunch of 0-length records spaced "just right",
   we keep waiting ~rcvtimeo and never stop. with recvmsg(), if we're
   getting some data but not enough to fill the user's buffer, we'll
   also keep going "too long".

Am I reading this wrong?

If not, that behavior doesn't look desirable. At least it doesn't seem
to match the doc for SO_RCVTIMEO:

    If an input or output function blocks for this period of time, and
    data has been sent or received, the return value of that function
    will be the amount of data transferred; if no data has been
    transferred and the timeout has been reached, then -1 is returned
    with errno set to EAGAIN or EWOULDBLOCK, or EINPROGRESS (for
    connect(2)) just as if the socket was specified to be nonblocking.


-- 
Sabrina

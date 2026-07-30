Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFDA429008;
	Thu, 30 Jul 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415210; cv=none; b=ahQTwVtHeGKUs643Ryl1vq2pcY3rBI9I08Wwg3ySJBsRJ0RGmWpWfQv+l2gnFfAWcsMoUj+TtmnbtbVTIE68CFAK3GA7lePG4aljD9+NrjyHcknICitGZDZaHS/o6RzblgnUejwjECo+bAAgs0c4DZAFT32lvDsjM24gnmkAMwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415210; c=relaxed/simple;
	bh=druDGX31QQxD9+tUMf1h82Kc7rwAIXzAVNuSaogYqPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWQfN8awRMn0/Xq3ginQULjGVRNPvo3z2heRhBdalf3VJOqpm3p7KkCm9symbfIP6kr2R/6yXDI77a8YMu9106Yf3lFezhfMSZ+fBnxb45GF9++P52R4CYBez/X6ga+j3zDVqlEFp9obPTXY99QsWku9gm2/R6ybA3XrxFlM7CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=RYYBYYaB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CqeXbTkz; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="RYYBYYaB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CqeXbTkz"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 5C2CCEC02B0;
	Thu, 30 Jul 2026 08:40:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 30 Jul 2026 08:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1785415204; x=
	1785501604; bh=1SsQ2Nn0ZpIn5H04aod7wuttV9XeKbwA+X6j9p+yBkg=; b=R
	YYBYYaBE5JSuvVWq4bHUEkB7PGNfv7ipVsTN/C90GsqH/RXQN07oSlB0LvRsJWPZ
	eZqJnxx3H8Am1a6HOjZ4KR3w7nNvFH33RDfwT3rLpdBHLr8GDv/QRk9UTPbTHhcU
	UlYrkwLKecgRhQaf2mZj13Nd5ruiLBSt5imZ0XpTIyTflOES41K/HD9xad8QVSD0
	6XVxlmpKdvrR2OjkNUlL6j60C4JnOhPS9pJ0tIDKcPs/gVanSc5im0yHjxX+wm1C
	VgabH0U2MPGw+WG/wTouXSL7DvwG4DqZnUaV5sXSfVwKgKaLFgtRDby54+7Jdasp
	eHNVEauqEQFR969wzSf0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785415204; x=1785501604; bh=1SsQ2Nn0ZpIn5H04aod7wuttV9XeKbwA+X6
	j9p+yBkg=; b=CqeXbTkzn8dBwjtLv2RYp4Uytz6/VouwqUFlnEHPcfduwxQ3IRr
	sRKq7YXDRiOLEzFpRuQBNOv/W0Ps+qWH7CR7o36ZlJQ1TGwTXeAS+W18t66XN+2c
	c80+6aLAxDxzkL+leoyvTuITD6AUniUA6lfAf9qfiCoosC4L+92yWPcKsAwBkP04
	Gh7wayL3JxTQhgrqbD/p6Vz9LqvML95YaMX1jl10n/ptlYw+eiQ7uwwJij3FVPkJ
	fsYbLw0qWG/auzvinL/CmK6BmkN8n4mHl9k/nR4HnGNITqoXzXRZ7E77rMU5P3PP
	DYdzMaNQyaFdxGSzj8RcdI/e9D3L9rOUMEQ==
X-ME-Sender: <xms:I0Zraue-DiOXZ2-yWcW2jzki6hkz0GzOFLTxv7ETWMpvoWAyeOfxEQ>
    <xme:I0ZramdYN95vIra4XuXaV4kzvURuKfm4bTbWQU1AInwgkoQiIGlFvxoXSUm8HTnd7
    501rMvxVYf82pECpgL_cSDZqntPYuJ1B0UbomsOgF9SPMVcF_vRlns>
X-ME-Received: <xmr:I0Zrao1xPx_vuHh31od7c3EiwWuxK7CwV8O7KoZyI_TnpyDwcwaIftOPla4>
X-ME-Proxy-Cause: dmFkZTFN7IO5lLMpZMOKICvTuTOtWdcVKkUo6ZEpeBnkHKHfSNjemomCTtTKyrGqpCSDM6
    4xZWo25Zo+51DEp2SvxanQWwlR0Obyd1fRX48aHl0yoz37O41aWGXD6n4HXQquvZhjqiVS
    9JOw6ZH54y9DKWhNjDRH2q452Tf4OJ9VbPJ9mb9+y9g/qUoZ+N7I9ZeEV97S8IgVe04s0l
    x7QO6xuwpWlSlUCfFVRc4BwQd6Z8kRpqmUoWOGXoIyjnvZlX/IB6YqjuglwYngT26EoBd6
    TJuK8n9vnyJMiA4embzYdLRIlFHgvXaDDGgYXVtu1Qd5aBT1kFB15Ti9ebZj6+QC8d3Is4
    G3b2XJitpVp/iKQ/Eq3u1TcQWzqwUPQ7/EJtGNd4OkMCqxD8hY3YRPej7/hjfA2cAejRy3
    AkNTd2InYsFhStytN6A0FOGmiFTusVbb7FtlhGXq6c1drgP/8BZpzaRTkaLdiZ8RcLNfZM
    I2544ckvZWJhw1rWMcH90m8UQU/ixs3wNdH5XZad4OB2QS5LOvfMmfj1x/D7/jegQYzFWM
    K8cw4pT2TOWXpcP/+cVYMouigpBov77sF+SBl/RYxoR8qpuqMzNF+7cwRJOL6FzhO2YgR1
    PTkFs04l5z3W8QinIG6t4dQGsCUWRHNowlu9ycO35rIfF1d6aRz/FxsFch5Q
X-ME-Proxy: <xmx:I0Zrau_Z6DgaRjpeRbR-YUHi-O904GqbcfU81oDp_hKp_bXlXmVopQ>
    <xmx:I0Zrat6fEGmXfGgpIT1DFfaq4qgu0ayODDV86elk8pEwWdrP4jk2iw>
    <xmx:I0Zramvwjk1HQZmnQ3ZbUPj95aAP6y0LHSabDzMf9iZssCN3iVoZHA>
    <xmx:I0Zrav240aaU7qyOGz6sXIFuu30mrekkMGsNvjN2tdRts0pZILbz6w>
    <xmx:JEZranOKWaqSVWCaiTSz2P2Coe0licFMyB61CZJyerlhRfbGlHqtewll>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 08:40:02 -0400 (EDT)
Date: Thu, 30 Jul 2026 14:40:00 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Dave Watson <davejwatson@fb.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 5/9] net/tls: Consume empty data records in
 tls_sw_recvmsg()
Message-ID: <amtGINRBf2NTqt_J@krikkit>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
 <20260726-tls-follow-on-v1-5-99bf4cc1c729@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260726-tls-follow-on-v1-5-99bf4cc1c729@kernel.org>

2026-07-26, 20:33:33 -0400, Chuck Lever wrote:
> TLS 1.2 and TLS 1.3 both permit zero-length application_data
> records as a traffic-analysis countermeasure (RFC 5246, Section
> 6.2.1; RFC 8446, Section 5.1). Such a record decrypts to
> full_len == 0, so every arm of the receive loop reaches
> "decrypted += chunk" and "len -= chunk" with chunk == 0: len
> never reaches zero, and tls_strp_msg_ready() holds the second
> loop term true while the peer keeps records arriving. The peek
> arm and the async arm also queue each record on rx_list, which
> then grows without bound. tls_rx_rec_wait() returns without
> waiting whenever a record is already parsed, so its signal check
> never runs

So we should just move the signal check to the top of
tls_rx_rec_wait()'s loop? (just after all the existing error handling
code)

Then we don't need to add custom code everywhere, and we don't need to
do that much special handling for 0-length records.

> and no other test in the loop consults
> signal_pending(). A peer streaming empty records therefore holds
> the caller in recvmsg(), unresponsive to SIGKILL, until it stops.
> 

[...]
> +		/* An empty record advances neither loop bound, so a flood
> +		 * of them can be interrupted only here. On the zero-copy
> +		 * path darg.skb is the strparser anchor, already released
> +		 * by tls_rx_rec_done().
> +		 */
> +		if (tls_rx_empty_data_rec(chunk, control)) {
> +			long timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> +
> +			if (!darg.zc)
> +				consume_skb(darg.skb);

I don't see why you need this special handling. Could you explain that?

> +			/* An empty record still marks a boundary. */
> +			msg->msg_flags |= MSG_EOR;

(note: I know that ship has sailed)

I don't think the way ktls handles MSG_EOR on RX makes any sense,
outside of non-DATA records. For non-DATA records, we only ever
process one per call, so it works out.

For DATA records, We set MSG_EOR when we process the end of a record,
and then we process part of the next record. MSG_EOR is still set,
eventhough we're not finishing the read at a record
boundary. Userspace has no way of knowing where that record boundary
was, or how many there may have been.

-- 
Sabrina

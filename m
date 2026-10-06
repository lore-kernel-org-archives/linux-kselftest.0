Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465B449E12D;
	Tue,  6 Oct 2026 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301571; cv=none; b=Iib/2VPTJwpn0eEPy2C/Awkko5av0IQ6PpdNepkBehe9tANann7/pzuTXMEkCSNDkKC/932737ZoVlvbUvEY4br0g/g3ZC1QJDQmw3Iog3wl7hMr4CPxqw1dGPx+t0JkkQfa33MiJurG9gvcROJNcwXzys2GtvoosZk23pJ9CRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301571; c=relaxed/simple;
	bh=5J0d/i1XPI3IJLy/7EDGhlkddszoQOLN4OMM9tmlpMU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GMm/9CymoJpLlFZbrKqnuE7y6PdboMD+y3DJyrJ1Zb0wTHgti7K2B+Fzrg/jng7HgJe+EyHM4QCeh6jzUW/5NDSEdIzM2uytkWYoQoognbjB9s/XHN8scmtf9wjYEwtkBsyJ+apyCOfWsJm0zkhLJjhwciyrwgl99KRR+zqiHMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ST4C5wtg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ST4C5wtg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A441F0089D;
	Tue,  6 Oct 2026 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301569;
	bh=7chOiqnq9v4maG9RhX/zdub8LTdd6AMJr64LHMABkg8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ST4C5wtgTkhUKksf7qIMmJh1Ed6fez5jBW8gW2yRTY4YcGJNEixriUToJncmbniu/
	 4MWHNlSmqMROFMqLVJk21A2Ox0BHBZmmc5dQgc0yiR/ZY9vyXBIIa5uGjPXIrn/tw5
	 61/qW9gcE5lDhKfTnkenuUecW5s+CvCTnzq7KA/ZpU+H/3F36e8QgBxSCpb9I6k9fQ
	 W/enYCsO+y40FOQ9XraczdbE0iT7VT+eSF0VayW1QulR9y6pKxo3ZWnujZ8HdUnUku
	 yGomUaqu153zd3NvPJgoccIw3K8zlhuG8yOMqWugS6NuP5RxsqLcIfa8+omK9PR1ez
	 0ayrWENKJVKGA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 82003F40068;
	Tue,  6 Oct 2026 11:46:08 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 06 Oct 2026 11:46:08 -0400
X-ME-Sender: <xms:wBfFanXeVgYqFRaz_k-QmM7mslvAF6ymfRCXt5D_GhKj2Aff7S-X_w>
    <xme:wBfFaqapRCQGwsvgKedPsuR7S8beBNMtI-ONAY9uyFuMCiSYFVqB4CV2au-f4unP6
    lbR2G5IBaRF3CqaZJxr_EgkRLPhT8vijqwFtkyHYqTdjLQmX64Bd6E>
X-ME-Proxy-Cause: dmFkZTF5nb3PuvBnRPyUTy/2VQrslDV66X9Hj4rQAeIT+wddUBMKurk/Cna/3F/gLCPRq0
    pBv2aTo5E3LR/SEhdKY8E1fdXI0DMWh+Z8u0toB4wOyGzbqOlATZwSg5ztRg61R3puSfxX
    O9twr5AWOVkB6PV9MWrBTncdMuyvdwQI0jx4ItnHSrnAn/AbX5N/ENocB2qitcl/Xs6f4k
    3Xub1IIWLhUaP4HfNUhDjKe+SbgzZs+yvgW6GsgQYAUz0H19B7uiwdlXBiwVDtlA2a6cse
    V3S15aA4sTaoV45nzkyZrCfl5UJwanhGm+PC0MZZYEE6yhykbJYH3PA8rc6U0lp8QGLBt4
    Cm08WJsCJLADe2qxoJ6iAMXOL7nQHcvYbqx2YSWGVL1h++VVinpIQHzwWVgYqxhZuSERSY
    yeClcwV4UJRnHtCJcGEwT6/O+b0tMaNiFIT0+wxYDPU61jCGS9OG5KS8xCd+xbPu/lYsdq
    OdWkF/DdeSqsdGT+eI8spFPtZlhmolIuLK+xRORocpnuGzSi5R2jKwxqmfxDld/WoUmDVL
    n9I1NotYKGCaBpJdoT2pZhVAriPp6ksCpoSvwkL6SQjVcVnNgm7gTUYGpzs9mu3gexJY2q
    ADp6l8SO1AX0kk1gKNqRDay3I2UDqDaxMlda5l93mtKsrKPlhxPBdHbBpANg
X-ME-Proxy: <xmx:wBfFahLzkDR7--KzM4GPN4A1mkbs0t9clOqEGdKoPAJXwx4NKVb1GA>
    <xmx:wBfFap32W1qHTItWa8jwDZRXDCDNPhOojmwkq17l6XvryqzJ-RcVzA>
    <xmx:wBfFatnxYhG26AuP9NqLTfJk7FoPe-O1vGQ1QJr6J9qwfBpFRCD2eQ>
    <xmx:wBfFasjiOwwDEbwlvudszKE2s6ceL-a2OUhTgx4FP-KC20WJYkzvoA>
    <xmx:wBfFasSMFkuN3ZgG-XhEPIGELpN1ZJIswzFYl8jLzdSH50042o-BO5tE>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 647E6780075; Tue,  6 Oct 2026 11:46:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AyuI6YzC01r7
Date: Tue, 06 Oct 2026 11:45:48 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <766e97d2-2c23-4cb9-b2da-ee0243e1b0df@slotpi15m67>
In-Reply-To: <179124254419.434549.8522300166361298125@kernel.org>
References: <20261001-tls-follow-on-v2-3-2dd1947bb642@kernel.org>
 <179124254419.434549.8522300166361298125@kernel.org>
Subject: Re: [PATCH net-next v2 3/8] tls: consume empty data records in
 tls_sw_splice_read()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 05, 2026, netdev-bot+sashiko@kernel.org wrote:
> >  		err = tls_rx_rec_wait(sk, flags & SPLICE_F_NONBLOCK,
> > -				      true, false);
> > +				      released, false);
>
> [Severity: Medium]
> With the new goto retry below, can this wait now block on a socket that
> has O_NONBLOCK set?

Yes, between this patch and 4/8. Before this patch, a caller that
polled and then spliced found a record ready and never reached the
sleep. With the retry, an empty record followed by nothing sleeps
in tls_rx_rec_wait() unless SPLICE_F_NONBLOCK is set.

In v3 the O_NONBLOCK patch will be ordered ahead of this one.


> > +		if (signal_pending(current)) {
> > +			long timeo;
> > +
> > +			timeo = sock_rcvtimeo(sk, flags & SPLICE_F_NONBLOCK);
> > +			err = sock_intr_errno(timeo);
> > +			goto splice_read_end;
> > +		}
> > +		goto retry;
>
> [Severity: Medium]
> How many consecutive empty records can this loop consume while it holds
> the socket lock?

As many as the peer sends back to back. I don't plan to cap it.

The limit in 1/8 works because a read_sock consumer takes a zero
return with nothing copied as "no progress". A splice read has no
such return. Zero means EOF, which is the bug this patch fixes, and
a blocking caller cannot be handed -EAGAIN. The retry is what
tls_sw_recvmsg() already does with an empty record.

The loop runs in the caller's own syscall and the signal test
keeps the task killable. It ends when the peer stops sealing
records faster than the reader opens them. Other tasks that
call lock_sock() on the same socket do wait for that.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)

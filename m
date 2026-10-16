Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543A37F735
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 08:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139969; cv=none; b=NcP9ae8aEOKe4hDaOA0tjoVgqmGNvlgq7GUqMt7RXAk0zKlXmH5Jy35QOjpM1GcGfNI1+rSM+opsXFQF6TXUvjnXILA21u37hwDSmSQRNHf5RmlFrDvx9RkAmrzRPdPz6LgKe14c63xxzaAKJdAomY4g2Zb/F54LNdP1QBoKkww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139969; c=relaxed/simple;
	bh=2vUfpCqB6arRjfJ3KPHapqfeAhBKxgvIcU1LXx14dMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GalilHKDMqRZc3/Xy4/B7atWN27qiQZvB5Fpg0vMi/ffJllqN8Z3bTW5lFFzqECK1N1pPq84/fdBSsnEeA8XRojxi0ubCmq+hpUjIp1fVi/oq+OBEV8zCF/iSDAF6o5R7MoY/+/JwqdO3qMTCPmZAJdf/cW3NjPGR9AaHOvs34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=SlwEFiw0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=u/KtTLyi; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="SlwEFiw0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="u/KtTLyi"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED0B01400151
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 04:39:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 16 Oct 2026 04:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1792139965; x=1792226365; bh=MGcm7yt5rkjkwGxDwn+nCpIgUmt3dbHJ
	nZ2E7d60Ius=; b=SlwEFiw0UmH2omxWxjkD0qBibzBO+jmJwH+L9/fQe4A2fZa5
	nf1RZKteXF8PWVbQkxOdyW9wyEZ2XuhiKC6wnTsqFVHZITBB3mxuI21EwDyI8huQ
	i12x+MQKfgjYUD5xtSqKYJNOUO2+V9UxeWdEMbSYYxuKypSdla2TUarpOb5PUQeC
	KhCHsZYksx3ag7phBknXjYonObcrHk1lMlaU0A5JtKK/7w14deQVUx9xO1r1D0Hs
	3dlApU7j/fJ+ZRVCjbIcRaXA+CygllCv8zG+k39OpYzKQpQ2tHVM9PvA6MnH4/tn
	GUOjHNIHLbzLewKm4LK3VKgjFES5LPOi+h8E6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792139965; x=
	1792226365; bh=MGcm7yt5rkjkwGxDwn+nCpIgUmt3dbHJnZ2E7d60Ius=; b=u
	/KtTLyi1nFZyzGsxSqBC87fzQZHV2wb2ZrzmXgeMYOLCn9d+B8eVRmV1I8s/AhpL
	ct3q1ryiEhXKuyD1/U6+5Qt0nQeoilPldjwHxIvS4w+dnSxDgAsMs5tuXUKSsLhw
	TRse8YOLctNw4PQm0d6/CnXvBQ7gWu0YGWjbfCOiAJuxmvQzon86nL8Q2zX33EtK
	CT1ii+nMESa28z25iu8GgBJuxIbLNpz2JuUf8lvElFn9pkkhPlhiRAG65gv11VZc
	4j8POxT3hgYoxAa4PV8iAravcZPzMrCXUkJt0S0kxWrsYaI3BQbxd1ygFxjwaSkj
	jeaK43BXVL8EJ7qCxzMbQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792139965; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:lKlJl/rQnVFkIsv6O5TsIaNu0m303GEqFWW2u3521wxma5Z
	4WyPJTkHsgE4TDLb9cx0uL+xAcersQKt2XUiB1oVDO385U890i0OhaKHklXjeCPR
	jgm7xQTsGesPC78ECWGOp3qjZbTUrCTHiy+7s3RAYfoaW5RaJOdGIB9HzL4J4yhP
	x7zxJ9U8WRyBq6owTu5UwkYSERDyz4lGCn6K56bZ8DUQ0zi6Yd2iZIrzz0agqXhR
	O9q8akcSn/QrPxLS5HSBO1FVZ012RGQH5hnLWEhEhFFz+P8sWcr+rdeqo8Lpfixe
	9NnZm/VvrBYHKhdrrLbumve0ms+StifUU5G2iMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SJ3kX2eTGKgXrqDXngm6d4mVMdr2f/LtcavSxlxMiQg=:2vUfpCqB6arRjfJ3KPHapqfeAhBKxgvIcU1LXx14dMo=;
X-ME-Sender: <xms:veLRardFrgOBH04g7LNC9ujzhFMD9sJiNojeVTsWzqMbtSkCikBZJQ>
    <xme:veLRak4MULgsNrfgs15inipPNcKYWwQLU5Q0ypJC4DNucUJG8lzgNutCbDw4pBJMK
    7mWchuVCScR0fQRqBaHx5JVZVGWWaSxHmdZbIhTj235InPm_UFvbs4>
X-ME-Received: <xmr:veLRatKegijhwrkemurOvHzEMBHnVwhSwaO0GsSZXTAQ_gwknmzzDzMGCPA>
X-ME-Proxy-Cause: dmFkZTGm6mBkZB8wsCnbaRONJj0gUzKLj4+7j3xqlzxkDDn0+lEwC8DyiDGNrr3QdPq3gU
    NSYOeOP1jbjKE25PhP5WFZf7RozX4BYk6jeohnf1cWoF2Jn/Qyyg0pFAi1nqBLDqI3OX5O
    VGp24z2ABNdPAb6iQubwN8g5q7BzdIS3tdl1+PENBcWj8in7R6arbtlu4huAmdZg1s+IGk
    9y7c3m00fOFRlxPPWw1/5xDkZnwVpGK/3v/9rT04Yaqs6A9qEv88UOOcded3Rk+GQmtk/p
    CsniU0NAQIKm6FayrBKbRCby51SCzKYNAG5fOCObWKActP+FzNq6I/egqci3nVyDNvSyWa
    zifKPzJy9Ht5nQfPX0FmR2CuyRwoPaxa/+fGTLSdTr6H7ke4iAor9MRbgR+dB5tm85grhr
    P45tkiFgk5DxLwCOUhBTG392xd8pjUH8BOuO/T34NzXbzvc+51NN6hH6cq53VpD+fZYn6W
    1SBnViQhKwOukZF83p1eNtKMdYrnD+oTF2vDoyixkx5hNBSxqFH57mesBXGwBygnMaZx9L
    gLFnsYaYUXFmnnAKBVJy/UVan5kRp1A+9J+A0OyttqI0e3XCIet4oZPhQ3ODoaFnIA/twr
    RTatQjVJ1Heb7Bteyo7AwC1UcgMms7Zo4L+1CPh+XDHHYpoJVXHNv2lmaaQw
X-ME-Proxy: <xmx:veLRauWSZlDfLsAbdr00xNPBIEhbR5kc8vG5B7jXr98jpti7rQtJwQ>
    <xmx:veLRapHRLISPzlPJHwwFCexD2jJ55fx1vWSCffkSwIRkjueBTLpWRQ>
    <xmx:veLRat6_JxmrjObz0e4FkWnODUQflo_7Y-ffE1xkVM2FCrPUPqWyvA>
    <xmx:veLRave4cbPQi04zxBszKlsvrJHCVlQs3Tqu1wleiI-SalZ77ADh6g>
    <xmx:veLRaum5F-zyh5VRkeUDnf4ws1zNf6a9s4e0DmGMMy3Igr-4TIzGZFJB>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Oct 2026 04:39:24 -0400 (EDT)
Date: Fri, 16 Oct 2026 10:39:23 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Rishikesh Jethwani <rjethwani@everpuredata.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] tls: refuse RX records after record-number exhaustion
Message-ID: <atHiu9gmKQAoqTD0@krikkit>
References: <20261013002701.1957686-1-rjethwani@purestorage.com>
 <as37-A3DKONrFuxs@krikkit>
 <CAKaoeS1E7jMyP8F9a+SAheE4+o6RG2VOdA5uiSjZe5yX+E0wEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKaoeS1E7jMyP8F9a+SAheE4+o6RG2VOdA5uiSjZe5yX+E0wEg@mail.gmail.com>

2026-10-13, 10:55:26 -0700, Rishikesh Jethwani wrote:
> On Tue, Oct 13, 2026 at 2:38 AM Sabrina Dubroca <sd@queasysnail.net> wrote:
> >
> > 2026-10-12, 18:27:01 -0600, Rishikesh Jethwani wrote:
> > > A receive socket records sequence-number exhaustion only in sk_err.
> > > After processing record UINT64_MAX, it advances the counter to zero and
> > > reports EBADMSG, but SO_ERROR or sock_error() can clear that error.
> >
> > I vaguely remember a discussion around making some fatal errors more
> > permanent (ie not use sk_err).
> 
> Do you have a pointer to that thread? If there's a preferred way to make
> these errors sticky, I'd rather use it than add a one-off flag.

https://lore.kernel.org/all/ajFpejsl1ukTbG96@krikkit/

and I had a suggestion at the end, but I guess I got interrupted and
never got back to it.

> 
> > > parser-ready record also bypasses the socket-error check in the record
> > > wait. The receiver can then accept a record authenticated for sequence
> > > zero under the same exhausted key.
> >
> > I guess, but what's the problem with wrapping as long as we don't
> > reuse the same record number?
> 
> You're right, in practice there isn't one. The only way to get there is
> for userspace to install a rec_seq close to the limit, so sequence 0 was
> never used under that key and nothing can be replayed. Starting there
> already breaks RFC 8446 5.3, which requires the first record under a
> key to use sequence number 0.
> 
> What's left is consistency. Today the wrap gives at most one EBADMSG,
> and none if the next record has already been parsed. After that recv

I'm not seeing the "none if the next record has already been parsed"
flow. Can you describe the sequence of events?

> continues at record 0, which is neither rekeying nor terminating. TX
> behaves the same way: the UINT64_MAX record is queued, and it goes out
> once SO_ERROR is cleared.

Then why are you patching only RX here? Both are just as problematic?


If we implement the "abort with (some error code) is actually final,
and not cleared with sk_err" idea, all this goes away?


> So I'll drop the security framing and the Fixes tag. I can either drop
> the patch, or send a minimal version for net/net-next that makes the wrap
> error stick on both RX and TX, without touching the rekey path. Which
> would you prefer?

For this, net-next should be fine.


> > For 1.3, just do a "silent rekey" (change the key but don't send a
> > keyupdate) on the TX side to record number 0 with the same key? And it
> > should be enough to test this with just 1.3.
> 
> Agreed, that gets rid of the fixed vectors. Since 1.3 only uses the
> record number in the nonce, TX can also produce the UINT64_MAX record
> cleanly, using rec_seq 0 and the IV XORed with UINT64_MAX. If the patch

I don't get this rec_seq 0 and IV to reach UINT64_MAX. Why not just
pass rec_seq = 0xff..., like the current recseq_wrap test?

-- 
Sabrina

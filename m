Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C652F12C5
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 01:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768370; cv=none; b=G8E9sJH4Lmbyx9R/RaLQQZv/2WF1jpzmmMQa/CsYWB0odSrbqv+ZkPy6KG9tgooJMYynwliwxxgRGzTQBJt8d1+/QE0DL9MIO1Ro+HV5Xd6Dhz4GK6mdhF69gPUC9JR5rylW8Id43EpTEQe434H2hq+MhdIQKACHWm1OGA9HPtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768370; c=relaxed/simple;
	bh=tzLBJAojfuIfb94wAwFqFt4eYKDn0B41zIhjFfxqZYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OO4zaSE2n+Wz08h3LwkKRIKLgUrUjdE8vTz71yVwFS0tY+lH8vS2kAD1V3GlrwgvsaCMol9xdiE05nJ7irhSZep+dElE7P09HWPB3OBzQYHbHrS2vDu24bGBUNcxIyrrVSJ/Gl4GlvGbwaeXCE6NoFdQHPd6yCG5J3EDKHNU3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=fqJfeVfz; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="fqJfeVfz"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6dd7070699eso1101574eaf.3
        for <linux-kselftest@vger.kernel.org>; Sun, 11 Oct 2026 18:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791768368; x=1792373168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+eNfrR0vfA3cM3B1uHRjef6pcqbiMOdYjlGJEphPzc=;
        b=fqJfeVfzt5JtzZaWbAfim+Ssh6Ae2D3P2+oW/WoKq/4DcxS1AElmYqy9w8gxbbDYxz
         MK/2DZ0iryEtEnvxgBw9qjCKGhcztaoccq6RXQRmTcKmZdbFv5MlHe41jUJs80vtSlb3
         wSzkW9d37OOSJ4rG9M5CIv2KfCGcXvbOqWoh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768368; x=1792373168;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+eNfrR0vfA3cM3B1uHRjef6pcqbiMOdYjlGJEphPzc=;
        b=zfCnj9UNCknyTh7AZFb1rNhZHztC23AW7f+BHFAUlJSrYk2pWE8Z6I7zwiHFzPCOKT
         w3xoXVkUkPl8Q8jE2Gu1bojs8omsXVLCd4BuvMEfmKU2vS+J7Bmw0xmJfqZm9nuVGcIl
         p/F07OrQW8XepMBh7DJw9HGB+QSMtoYrDED1m/SMcUkwiQSLckzp15akVkkWWi5aYroU
         mwYTFcqHVmnrwofoTE1Tq/ngqDeg7V/DTB3Y6ykUqlF4nssQH/EMdXSRKvgaV/srp3zv
         iYHkOrHICaY8DJpmeJkohA+CbapqLC9zC/6ksR+qLhUrlbP8CCENxnqBydR7nMlve3EN
         yL1w==
X-Forwarded-Encrypted: i=1; AKwUvBxViNXiCppc7MGqnHVgV/orVx2CsMltVf3oo3R+F/LZb7OoTSzH04e2MDVXHllJWj2ZeLNLo5J4lcoDaI7n+kE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsiRxMpl21Gs5U9RcCLwOH0X4wuPF23deiJxEqRlcHVHf8Djjo
	mLOpbsiTMACpkvAmHVpTHEN5twEjW+OISm3tPiIMfin2rXvgefhqQ1BFomfptErPZN4=
X-Gm-Gg: AYBFou3mU/tDOA/lWyGsdtxAJLXbHVz8WxYxoDfe/vm1YFBGJNvwxID8NHfrppmYsuF
	VUa5NrAhKzHiUqqIP8wOmdqX80oVnJYY739Y/E2xCIvxC6zxqdcAP1o9NLoxoDBmzc0QoeO3qXh
	bPihQ5MZUeqwA3WpSHj/J0FnAWKIIHfzBeqNTJ9V5ubZXDp8OOGrHmek1nRGx1U2UYjndUVrQ6X
	eQBtvmDZ0pyYEdBvOZprchAE+xFwZB32TcD2Iz+ETAMcLm8yp2v8snidzFjzqsUVOlJJL+0UEEC
	paWaIHGzDVa9EJOlRUTvxABoRlqj3NNGzXqwYvXZtvfTFfvQ5LIgUIEA5eR459QuvYuIQmiUKIA
	0vWclKGkjeCrCXlZ9zCgqPfQ4R+MByQU0MYnTXI7l2GASBxl8+9+tbVxqN6M6YYXqmmqqiPdFdz
	7PLKJhSO66M4CHYlpvPY4IFf4TH58HZCdmRXHOu7LCijARNjE2JeDF/pyWh5xVM3wfEAzqAJGcL
	UllCLq+CryFpnoCVrrexWwwchGScFJkVevxo+N2JfshskjFNpWDy8hIsyMObrODznDW8HEtwiTJ
	WcfRtkdkhPZfpZFim3XtMYz6qJ1X7HkWJQ7oWw==
X-Received: by 2002:a05:6820:f031:b0:6cd:3ffc:e330 with SMTP id 006d021491bc7-6ef129e2d89mr6079783eaf.78.1791768367710;
        Sun, 11 Oct 2026 18:26:07 -0700 (PDT)
Received: from com-68297.corp.openai.org (vpn-centralus-01.tradc-corp.com. [172.169.249.3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f634860481sm1584254eaf.13.2026.10.11.18.26.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 18:26:07 -0700 (PDT)
From: nramaswamy@openai.com
To: Neal Cardwell <ncardwell.sw@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	davem@davemloft.net,
	horms@kernel.org,
	jiayuan.chen@linux.dev,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	ycheng@google.com
Subject: Re: [PATCH net v3 3/3] selftests: net: packetdrill: test RTO fallback after partial undo
Date: Sun, 11 Oct 2026 18:25:56 -0700
Message-ID: <20261012012601.27658-1-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009171447.291802-1-ncardwell.sw@gmail.com>
References: <CAL4Wiip9RyA-2=p0SVwBcn-oe0864FqqF3QMTCX_7=+ErcJp6Q@mail.gmail.com> <20261009171447.291802-1-ncardwell.sw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Thanks for the feedback Eric and the patch Neal. I took some time to read 
through the code, and I have a few questions.

First, I think the core invariant we're trying to maintain is that
tsorted_sent_queue and tsorted_lost_queue are always themselves sorted by
transmission timestamp. A nice property to have would be that all the
skbs in tsorted_lost_queue precede everything in tsorted_sent_queue in
transmission order so that partial undo can always list splice these
together, but there's the edge case you point out:

> The "often" is the RTO case: tcp_timeout_mark_lost() leaves the skbs it
> marks in tsorted_sent_queue, and they can be older than what RACK moves
> to the lost queue afterwards.

I'm struggling to see why RACK cannot move all LOST (going to use this as
shorthand instead of TCPCB_LOST) and RACK-eligible segments from
tsorted_sent_queue to the lost queue; I think that this would actually
maintain the simpler invariant that tsorted and tlost are both sorted and
that all of tlost precedes tsorted, allowing for O(1) splice. To do
this, I believe that we would have to remove:

		/* Skip ones marked lost but not yet retransmitted */
		if ((scb->sacked & TCPCB_LOST) &&
		    !(scb->sacked & TCPCB_SACKED_RETRANS))
			continue;

from tcp_rack_detect_loss, and instead continue to check whether remaining
<= 0; if it is, we add the segment to a local queue, which we then can
splice to the end of the lost queue at the end of the function. We would
probably want to retain the skip for LOST segments without SACKED_RETRANS
when remaining > 0 to avoid updating reo_timeout.

It seems like this would also prevent subsequent RACK scans from having to
ever reconsider this segment, since it would have been moved out to the
LOST list. But mostly, this seems like a conceptual simplification. Perhaps
it's undesirable to have RACK be moving around segments marked LOST by the
RTO, but I will leave that call to someone else. 

Finally, I handed the invariant that both lists are always sorted to an LLM
and asked it to try to find exceptions. I think it provided a plausible
suggestion that the RTX scan for retransmission can see a segment that is
LOST, attempt to retransmit it in __tcp_transmit_skb, update its
transmission timestamp, and then fail with -ENOBUFS, leaving the new
timestamp there. This could cause either list to have a timestamp that's
out-of-order which can cause a subsequent RACK scan to stop early and miss
segements.

I'm not sure if restoring the timestamp to what it was before the failure
is safe. I also couldn't figure out how to get packetdrill to simulate an
error like this so I'm not sure how to create a repro for you. Let me know
if I should write out a sequence of events.

> in case that is useful for discussion or using. It also proposed 2 packetdrill
> tests (one that claims "This is the case that Eric suggested for segments with
> TCPCB_EVER_RETRANS."), which I can post if there is interest.

Did it propose 2 different packetdrill tests? If I understand Eric's
suggestion correctly, he's proposing to just take the test from 3/3 and
modify its final lines to ensure prompt retransmission without an RTO. Are
your LLM's proposed tests covering cases beyond this? 

Thanks.

Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989E34678D
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 04:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770783670; cv=none; b=HX/0X17YbEhGx6qi/7SV/ZXDgfr7hPBJXv1KnKtSxhQRETJ91T15ZSZFNYPJjLZoK21trppLRfdCbdHW6QS2rvPhVXg/eiwLspZSfq3HSNQSGZskGF+rCTqIFH9ETirb9zaELP/c3KpljyTRBOlhRdbAHx9Pdr8LtmNTnkXzpVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770783670; c=relaxed/simple;
	bh=tWxMhtRT84u3VNJXU9/WIGuq1dZw0DAZp76KD1xA1P0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=NdLAeU/lh4slf56eBmIA14qinLxoiDN/poMuhb1uXuHPlxi2Ho164GdMANE5HWrUwrCWxIOoBWiiU3GflY1u+nCEOP9MXa0PY3EPsF+epF7gG1MCIgJokWYyKEcjw/PPLF7k3HSVbQms8yeYC50Gc7txELtbnOu2wuNx/x9WXew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRC+GWls; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRC+GWls"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-795176156b1so52269917b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 20:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770783668; x=1771388468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynsPHl/BhzORZSWo5ytx1eDrV1MT7IM5pypfCFY/QtY=;
        b=IRC+GWlscMJ6wl+UmOznZyb3GUFg2EspjF8XTIfvaUNvurwNGIJncNQHAUrilYqi8d
         qvKM88tRhrpFKpZIXGbOlXv2tI25FwV3IQ8c6Xfa8UGMytgUhu9HM12A86gIigzf9WwA
         o/gZ1S61isPMi0SUfgFN8yj5MjEap5WSNboWMSktQhW2ocZzPSg8EqTCvTyRS2ltBsiY
         LLdZjrStT9B1TerZkYL+5Lv8P6Cl+BXG5Y0V98TaalX+XnIqJtVgex52V0QwfoplqMR8
         y9KDzy3Vy2DPMP7r8ZuGtMhFJ6Rx1MCjGCzw6yLqZ5uIBR8MF0leCPDUkYUeRi90BVpW
         hiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770783668; x=1771388468;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynsPHl/BhzORZSWo5ytx1eDrV1MT7IM5pypfCFY/QtY=;
        b=Sjb8eFI4i9s6KUXZ+O9oiLMQbquGy2BLyLC7ciXeI2UsuTgfVLnu7rQc6TcWxdGzRW
         IUASqmD62KetvnrnQ1XB3B3yTEPRqmEE9JifCvCEIj/zttzmPyMhjfqhMswj9QoMwlJL
         R2y2DjqtsJqFndvmMIiajKGql8l/mSREvce3Ig5RxsFzHoDnWAkdZ2Wv67Og80sZgRIX
         RwNA6833pAHfaI0/ZqoU1K7+RT2LxCCL8IMle4uFjb6hVb08W3+JGSGpa3Qzl1Wl+JcL
         RnZYztr/rtYZki6hWIIyRaLPtkxTsC+KKKZ9cuWEHFPB7dweVWn3+3E4kHsmPH1bl0Dp
         4Cow==
X-Forwarded-Encrypted: i=1; AJvYcCWllJHOnnjEz4A1OPooYr/AVdAqRDFwDjV2bY6x3aUHdp0+R8PJ+uv5kbch7l/fI0ooqH/Iy0QTqIx/v0nheB0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bO/GpI/KdvHX0zx9SKkITVutOEiIgOoc6qg1IOKZ4ByGOFHt
	ze/uEjv09gzCMm50YkUIxRPWSOkfRt396/zjzHYP2CtI5z8vbCgdzask
X-Gm-Gg: AZuq6aIBnEKX8rFDweb51a1otxAmD13jqd/NmnMF1YA9i7piha7/V+Dk86Yxq3NJcVG
	OFeZJN4aaC9BXFJ85ECQzelUw59BeZUlUfEv4z915kn7VglYTdo+72mqXpGPhQG3nyn/NeQHppO
	1TBKXp0HXgnE+KIEq1qOKQKTTTyk5o+cm/UY0xKajMebeRRNV81hNW8Scz/hBM5LDpDTU4EMomK
	g/RUSN1lKT/GMSkj3nR+8+NxcDC9FTNhrhCcGAvDSzQSrRbpQH6dMkutGbcy5nqk+9iz+GYFI0f
	MgSYU7pu6axTinI2auEzDGj/8AGdL10677X5ji3h+dd9KmqMxCYn+kV1w6i6MNUlcw0Iw6lzxz2
	Nm9amdzxY8PlQ1VkeYROC25WzuGsdkb88WhxrHpkuJ5fU3uEBg8E/XBlhvBxtuPjCTmzVIgwqzQ
	NhiAa+YLq+UfKQk0jqO/iAPnXdMsneSy4griIhKbaPiuymDmcQb/07FPE86Qu7nQMDxg0/veU=
X-Received: by 2002:a05:690c:6c91:b0:794:db37:5db4 with SMTP id 00721157ae682-7966a963196mr10126587b3.7.1770783668273;
        Tue, 10 Feb 2026 20:21:08 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7966c23e4bdsm5927647b3.32.2026.02.10.20.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:21:07 -0800 (PST)
Date: Tue, 10 Feb 2026 23:21:07 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, 
 netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 donald.hunter@gmail.com, 
 michael.chan@broadcom.com, 
 pavan.chebbi@broadcom.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.172899765680b@gmail.com>
In-Reply-To: <20260210194814.21a0c403@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
 <20260207003509.3927744-7-kuba@kernel.org>
 <willemdebruijn.kernel.743811e01cc@gmail.com>
 <20260210175638.123782b2@kernel.org>
 <willemdebruijn.kernel.503ed4ace7bf@gmail.com>
 <20260210194814.21a0c403@kernel.org>
Subject: Re: [PATCH net-next v2 6/9] selftests: drv-net: gro: use SO_TXTIME to
 schedule packets together
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Tue, 10 Feb 2026 22:15:25 -0500 Willem de Bruijn wrote:
> > > It's a bit of an opportunistic optimization.
> > > 
> > > I initially intended it for for the "long sequence of packets"
> > > test. But I failed to get AF_PACKET+FQ to cooperate sufficiently
> > > to queue all of the packets in the same bucket. Otherwise FQ "sorts"
> > > the packets, and breaks what the test is trying to do :(  
> > 
> > I wonder what's going wrong here.
> > 
> > fq_classify should pick the queue based on skb->sk also for packet
> > sockets.
> > 
> > And flow_queue_add should add the packets to the tail of the linear
> > list if the delivery time is identical to that of the tail.
> 
> It works but requires that we either modify the qdisc config to set
> a orphan_mask of 1, or somehow set the skb->hash on the AF_PACKET skbs.

Oh right, fq_classify does not use skb->sk for packet sockets because
they are in default sk_state TCP_CLOSE.

And this is by design, as clearly documented, as packet sockets should
not be assumed to be a single flow:

        } else if (sk->sk_state == TCP_CLOSE) {
                unsigned long hash = skb_get_hash(skb) & q->orphan_mask;
                /*
                 * Sockets in TCP_CLOSE are non connected.
                 * Typical use case is UDP sockets, they can send packets
                 * with sendto() to many different destinations.
                 * We probably could use a generic bit advertising
                 * non connected sockets, instead of sk_state == TCP_CLOSE,
                 * if we care enough.
                 */
                sk = (struct sock *)((hash << 1) | 1UL);
        }

An orphan_mask of 1 sounds like an effective workaround.

I don't see a way to force a specific skb_get_hash result across
flows, given hashrnd.

> The test sends out multiple flows (src ports) so if we let fq compute
> the real hash we end up in different buckets.



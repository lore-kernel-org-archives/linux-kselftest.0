Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA833C465
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 03:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770779728; cv=none; b=C/1OUi1/o55weWoUEBNW6o85dyUKRJdfog33LCTdCKiwEiGc1VkRLNGs5QIWAN4jHObl43/A9FnDS6+OLolRmMBc6VjVtS4im3O4umcsf/vZ17sFhcr+MzD9P+9GmS51Sx6Pf4m2fYix6HjE8w6gpK8mS5XeHdnQp3iu1As8Zkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770779728; c=relaxed/simple;
	bh=CubaCy2q/vH3vmqj2GEWg/58SLDZzFdnDviYPVj8jw4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=htxN7qo4DSCmJphns+bLc2i1W79/Ac0QU2+yUMmd6DQsH8X5LVTXipogLrws31y77CvtIVy7xif5BHZGP+HUiw/HU69ikkncD0b9rBmUOUHC87C5LfsCENqs64VRsDTmx4g2js0cUHy+2DpIAQTxmn1T4YOnhoOxHodRStaSg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgCWxCe/; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgCWxCe/"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79430ef54c3so45889487b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 19:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770779726; x=1771384526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/Kun8U7WKzuxXDmQMrR/8BHXTmHZAM6eU4S5NSrMAM=;
        b=GgCWxCe/PIA5/wunUyLcV7o47ZbpF/jATQ6tTNozMwjqeXbTKmlXHHclvEWT4lAAhy
         pyB9NLJrkOp83H+IXyix/XnK07Q3H9nk+07km3sF73+XbCkQ/8CP+lFOS3FGFCECepx7
         hTxK5m77KAzx7zItR9GmmRx/JSsnCSUOKRmYb2Rsg7rZyIXDm6azHa6rjtY2q9+N3iH5
         3DNcnwUZdG0+eJHyKgbYWDjGDNcYj4Dh+gA7T30Fvj9eytkeuEkRx0YIAEUEDDaGT191
         1DkCDbLhUbNZi9oGkLINkDEpO+132ddoDJ5rGSHyIecG3bwYBC0grO2rPx+0odr90fzw
         5SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770779726; x=1771384526;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/Kun8U7WKzuxXDmQMrR/8BHXTmHZAM6eU4S5NSrMAM=;
        b=R8k02E9IoIwDHqdHIu5z2igFayw91qJDUM4FsvX20WAJbMnYVsQYTUZs+SgUku7Ga2
         f2iEfiKaWDDE8BcKbzXrmIh7q9FLvKRRcj+7OSp/z0jm3mu2AUfgJHltoIApqJZzdeMP
         rVanlTrDhepgDEDHqc+v4BFS0tITkf+shD4oSPasLnEPNu7rxQw54g4GK40v5dG/KVX0
         u/QR8KDhwWhzbzZyglSdFsV3MMzHD0/Rt96SBaN73tNvqT1CngPREMxaMeNMZ4Ongggg
         gim3subFNgkMw8Nj7SDdmO9gGhQnz2YqGNyKLqJfE3sndgxlv+Wmy2ZegzcJm6zC76zw
         kbdw==
X-Forwarded-Encrypted: i=1; AJvYcCUT6umnpBoi+cbIesuQvpUJJEy98iflFTuBSSb8snh1Pmu2Nzxl1LjZn/KzQA9DZ+3nvKbIt/vbX57os6cQeII=@vger.kernel.org
X-Gm-Message-State: AOJu0YylK3yG2eb9Tg4+XyBCxi+Zk5AUVSnCo0YeVU7kSzc21N7rVOBD
	b8LnmRJMcqrxINMPxqM8E1qSp0x5H6Nt+AKvz5TixdaOyVLAsf4nhqsm
X-Gm-Gg: AZuq6aI9cqNyK3Y/PkNrhUfixY6sBkRaypbvBljO2aJ0GFinUPNNO702Ut+/suwYUZM
	6fBXzRtz2ZM+s3Z+RikVTHMLLhcdoP4Eb9P6nC2JwrYsff9DlRPnqWqqYB/9LKHQfVNdEtnZ+vE
	DhGdlKnIZlkJYNh1aGLx/zygJC9jSV1LMLuJdXAZQ/2WpyWjus1Qc2cR2yEN6kXZ4+iaizr8yLM
	fnsXK11NjcXnQg3zJFxXD9bD6ArND/GkjNGPG6rKXhKZxLPW9JBCi/5S3uuf8cEdOD1ROcC0gtl
	badUA0DSgHTKO8Be0jtXl4qL7sMiSEvlQUvn3ITvmYGCdM5wD0RR6hMrY0mTu9nAxOGexUrbMnZ
	E4r845/F4inbXOw76SEZ4UHoxQLt3GvfH0k3Wi/1QZya//u3KsN/3cqbFL82YezvAzGYRT2quY+
	zkq9D9kuYb4+/GHnRtDhWD+pF1Zq+ko6eLBHVOeAsMv1zfKFFthdCcVu0/oN6H3e28oyasBdQ=
X-Received: by 2002:a05:690c:46c9:b0:796:3c5d:70bf with SMTP id 00721157ae682-7966a9b6d99mr10352767b3.29.1770779726214;
        Tue, 10 Feb 2026 19:15:26 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7966c2657aasm4802037b3.47.2026.02.10.19.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:15:25 -0800 (PST)
Date: Tue, 10 Feb 2026 22:15:25 -0500
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
Message-ID: <willemdebruijn.kernel.503ed4ace7bf@gmail.com>
In-Reply-To: <20260210175638.123782b2@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
 <20260207003509.3927744-7-kuba@kernel.org>
 <willemdebruijn.kernel.743811e01cc@gmail.com>
 <20260210175638.123782b2@kernel.org>
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
> On Sun, 08 Feb 2026 21:39:38 -0500 Willem de Bruijn wrote:
> > Jakub Kicinski wrote:
> > > Longer packet sequence tests are quite flaky when the test is run
> > > over a real network. Try to avoid at least the jitter on the sender
> > > side by scheduling all the packets to be sent at once using SO_TXTIME.
> > > Use hardcoded tx time of 5msec in the future. In my test increasing
> > > this time past 2msec makes no difference so 5msec is plenty of margin.
> > > Since we now expect more output buffering make sure to raise SNDBUF.
> > > 
> > > Experimenting with long sequences I see frequent failures when sending
> > > 200 packets, only 50-100 packets get coalesced. With this change
> > > up to 1000 packets get coalesced relatively reliably.
> > > 
> > > Reviewed-by: Petr Machata <petrm@nvidia.com>
> > > Signed-off-by: Jakub Kicinski <kuba@kernel.org>  
> > 
> > Does this require having FQ installed? I don't see any qdisc config
> > in the GRO test.
> 
> It's a bit of an opportunistic optimization.
> 
> I initially intended it for for the "long sequence of packets"
> test. But I failed to get AF_PACKET+FQ to cooperate sufficiently
> to queue all of the packets in the same bucket. Otherwise FQ "sorts"
> the packets, and breaks what the test is trying to do :(

I wonder what's going wrong here.

fq_classify should pick the queue based on skb->sk also for packet
sockets.

And flow_queue_add should add the packets to the tail of the linear
list if the delivery time is identical to that of the tail.
 
> Oh, and as mentioned in the commit msg - this improvement is intended
> for HW-GRO, which may have very low timeouts. The test already
> configures timeout for SW GRO to a very high value, so don't think
> we would gain anything from setting up FQ on veth/netdevsim for the 
> SW test.
> 
> So IDK what to do with this patch. Maybe I should just drop it?
> It _seemed_ useful, but I don't have enough datapoints to do a real
> comparison of how much it improves reliability.

It seems useful indeed.

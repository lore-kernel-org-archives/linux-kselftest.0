Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589372;
	b=QnqDyPUL7X2HUMYKuORU/s7lLpmX/Jd6fOeF+AmpjbYR3PciCBiKqS12+BjK5FhGLxWY
	 FLy8GGzWGtXi8f4RFFNNgp+Wwcgx9JBRBkpGPkkNT7eo72VkrPFbjJgVhoi7UjGGHIkwm
	 5YpVp3cJmm/xXQdmSkEJNKkjF3+TESpznHI1G/5F1E++WxuzfAcMpQMYZLixB9PyNo+My
	 FPoIofxg1yAUvyoeQHP6HR93Z715jYu50a6PpYZi+4j+BsghrPMnU7sLuGBMFbDQcjo1J
	 P6KIYYUZ/LZUCbQVGZ0XTXTEzHg7jAxxbWEqFlJ2T0kiNHXWStTFu5zIboW7Z1kun5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=ym2hLsozA7ZSQayntiTQLoO7fGKekGn6gbjoRP5CLXE=;
	b=fdOddv1koY2PcGFNsavDBYbOhPiVYuuj2v+1X53vXhu3wSBes89obVv1yStc06Z1Mm6W
	 tLqtMp/2T02eo9frgPvlku7l8hA0D45csuEyLCu7qZCKsYX9ujJ+j1nN0nIASUaNqrJ9c
	 7ykXffdSVNpuTuT1NXRq/vOFsxHhfGl9TnlMA+jOl0yHDL4LSNj7tY+NsvcddlUIhyCp5
	 bHo0m2j96DAFFGC3anB+xLo2cNRDhmvjVBndtvoM3aMbMNHb05YvzSFc1ywG1O+jgLAt8
	 siocWO2IE2L3JKWC7utK5IJv4vbx4wUVPaMmWccM+9cn47UoPe7y6JcPTQ9fWKXoYlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wmFo/9UB";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29880606A884
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 17:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29880606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmFo/9UB
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso538617eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589371; x=1795194171; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ym2hLsozA7ZSQayntiTQLoO7fGKekGn6gbjoRP5CLXE=;
        b=wmFo/9UBoL9/fi9B+miMvv37P7UpU2FoOc+M6Eekvn8LgLVHVIIPyoE5Jn2T9FcHcc
         FOcrA4RRVYam2oSrfBtAKa/ncJHHKnjnnwru8PDAbroLSpYXXH41gpGmApzKschZ2p+r
         anuv8pU9QtFRC0YPk2UmYZbQGYaxn7Z0FQURyRtEDXGd+4jEEXHxLzoJw7jcI272PcUj
         J/3soGoSb9FGOc1/0EMijJx9SutbYCPnmXscokmh4r4YRcOzLG6za6668LE/hsZ1Q8JD
         5z08tyNHX0GIpsRx19UL2/U9d3naDzDSMn1ys00fnNvQv1fzgCJMZgyFFh9jgJsTIxzK
         IHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589371; x=1795194171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ym2hLsozA7ZSQayntiTQLoO7fGKekGn6gbjoRP5CLXE=;
        b=LMTxeNRTOl2pU1HYX+qwfdW+qr+NyTvLDUVAc45Q/qJqyJM/HIvAOiMm4Kn+D9S3HL
         lcQW+mzXpRZfpbmGunKrJoTcXm3dju7CgF8VGmM3gRqHXQU98JT6aMH6BFnvH0B+3rV8
         NIKUK8uLmBUbIGKakaXPoUaf1OFtScviaK2Qi/vIc4RGEiI+HfhskPrrW0/wacbCGfCi
         O9otOl67cDD3ZInsAQ6Qq7JHqigxLfSJFaaxPU8x+9V8AN8cgGsnFDbOMNvZCDl0hAGg
         kASX2GnVOgKAF8rxhAIpPFR+VXIXUDk/bxtIPsS76nXJ9TlDlf82ZtYN95JYAiyHiN5+
         xvSg==
X-Forwarded-Encrypted: i=1; AL+hErHmN5Ry3ogw6aHGwal3MLvKLuzwv2krRj0aIkZFYpHQdsbNWaqsU1+gRcNzrP79BQgM8++VzwBqSihnkrHbNTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0eDCiAsymETy4k88TW6jVuCVXR+D+gbIIijD6q10/YtvRQTVz
	pogBprlbalhEF5Ha4LVZEtj/KDobYpQSH2i4YKAiqrM0h5BTNccwhggT
X-Gm-Gg: AYBFou1OYE/QXyHV7zA9yDEXevX3KYPaEidVN8O55QzCzrdrjLd7JnK5aH6ifzpTvcz
	L9Y5qvgGVWGUmG6HNvGTZRnm8jM5wsCp2pK9o386ybsJIxXgPmKphgvIV2dWwppyo9Qg68Zzl+j
	LsCkjKrXJp6249J/1Dzcrl4/EE6wXcIYTmrdfJYDi+k3NgZ3c8/dTmm9/TcHfGGO8GpbdlBtD49
	wRAqhl8z3wm+/WCjlAf/zxU+TtRK8oiGtErTxTioUz4CTrlkLksSd4U2aqa+M1cnJ7fgTqRw1s7
	t8b+Aia+I2y+cznFvdGGezd+7mz0iQYZSHLjTnDQeGtnAE4uutVVT9UZ7Mqbwnsdm6nFRDyDYck
	zWcdxv42RKvxv2yI5n/p8XyaYXPsKtayzFX+bsy1yeHL3VoZT0AoTxjrR5aqDC3TadUp6xicqN4
	3vabKiRu7wKiNdFkKGbr8JBzbJMVoeQWLUv2jA+Pb4P/8Kv13vxQrc/yQQEwF33z42IkFMx9G5J
	F9NYdlzH+OvPzsvTi3A9HXCE+KREqPfrTxRU36T5eZmcy68zEa3hoQ+Ul4MOqr9SKuNb9oZ87y4
	+K8/sh8S8c+oFe/Oxd2N7lg=
X-Received: by 2002:a05:701b:280a:b0:185:b157:f271 with SMTP id a92af1059eb24-1b50310fafamr2760874c88.23.1794589370935;
        Fri, 13 Nov 2026 09:02:50 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:69::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm9999831c88.8.2026.11.13.09.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:02:50 -0800 (PST)
Date: Fri, 13 Nov 2026 09:02:46 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Octavian Purdila <tavip@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, sdf@fomichev.me, 
	leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com, 
	bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
Message-ID: <avc_ptmBkAahiBHJ@devvm16445.scu0.facebook.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
 <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
 <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
 <CAHS8izOp2BpO7WnrNZRUryGQg=L3xreF8nSFp5S2_sO8HGhqpg@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izOp2BpO7WnrNZRUryGQg=L3xreF8nSFp5S2_sO8HGhqpg@mail.gmail.com>

On 11/12, Mina Almasry wrote:
> On Thu, Nov 12, 2026 at 4:42 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > On 11/12, Stanislav Fomichev wrote:
> > > On 11/12, Paolo Abeni wrote:
> > > > Hi,
> > > >
> > > > A few (late) questions/comments to check I'm not missing relevant
> > > > points,
> > > >
> > > > On 11/11/26 23:47, Stanislav Fomichev wrote:
> > > > > TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> > > > > A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> > > > > 68KB, which makes BIG TCP ineffective for devmem TX.
> > > >
> > > > ... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
> > > > ~180K...
> > > > > This series picks the TX net_iov size from the dmabuf sg table instead:
> > > > > the largest power of 2, up to 2MB, which aligns every DMA segment. With
> > > > > a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> > > > > no UAPI change since TX addresses are dmabuf offsets.
> > > >
> > > > ... still this option should be more effective because the limit would be
> > > > higher and the skb would use less cachelines for the shared_info,
> > > >
> > > > I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
> > > > complex and if you could do that, too.
> > >
> > > Originally I did not want to include bigtcp to keep it apples to apples:
> > > same tso size, just 16 frags in skb vs 1 (in ideal case).
> > >
> > > I just tried running mlx5 with 45 frags configured and it fails to start with
> > > the following error:
> > > mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: 16, needed 23" and returns -EIO.
> > >
> > > (fwiw quick review with llm claims that mlx5 only supports up to 20 skb frags)
> > >
> > > What I also tried just now is `gso_max_size 524280` (on top of this series)
> > > and it ups single flow throughput from 200Gbps to 240Gbps (presumably
> > > by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
> > > the sender softirq..
> > >
> > > I hope this gives you more data, not sure running with 20 frags is worth
> > > it (vs 16)? LMK if you disagree or want me to run something else.
> >
> > Fun fact, also setting gro_max_size on the receiver gets line rate over
> > single flow:
> >
> > I   client.c: Connected 1:cpu 39 | 1:cpu 118
> > client: == Source 2401:db00:255a:4a:bace::b
> > client:   Tx389.448 Gbps (2921248849920 bytes in 60008026 usec)
> > client:   Rx  0.000 Gbps (0 bytes in 60008026 usec)
> > client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
> > client:             2   125  86      2    0 15300608 10142
> > client:   net CPU 39: usr: 0.03% sys: 0.06% idle:67.39% iow: 0.00% irq: 5.69% sirq:26.81%
> > client:   app CPU 40: usr: 0.05% sys: 2.91% idle:95.67% iow: 0.00% irq: 0.21% sirq: 1.14%
> > client: == Target 2401:db00:255a:44:bace::b
> > client:   Tx  0.000 Gbps (0 bytes in 60009306 usec)
> > client:   Rx389.438 Gbps (2921238435008 bytes in 60009306 usec)
> > client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
> > client:             0     0 210    122    0  999424   10
> > client:   net CPU118: usr: 0.00% sys: 0.00% idle: 1.60% iow: 0.00% irq: 0.33% sirq:98.05%
> > client:   app CPU119: usr: 2.75% sys:77.46% idle:18.95% iow: 0.00% irq: 0.47% sirq: 0.34%
> >
> > 4200MTU, 32K rx-buf-len, this patch series, gso/gro_mas_size of 524280,
> > still the default number of frags (enough on rx to fill 512K GRO with 32K
> > chunks).
> 
> With 'devmem' over udmabuf? Is this possible without devmem on your
> setup? How much is devmem helping I wonder.

Yes, devmem+udmabuf. I think what's helping here the most is 32K rx frags
and bigtcp, this makes it possible to pack 512K TSOs into a single skb
on rx (which is the bottleneck). At least on mlx5 don't think there
is a way currently to configure that outside of iou/devmem memory
providers? FWIW, devmem socket api with the cmsgs is not supper
efficient, but bigger chunks do help here as well.

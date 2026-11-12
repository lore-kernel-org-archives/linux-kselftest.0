Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524416;
	b=j8oAObY26Kn8Nui1VfXIG6cvPrvPtmZ0ZPYpIhi3WQPl/HZrKKRJGorN0yAtREL3x/EV
	 UNqSkANobc89t8JpvVEUbPHjCp0SYCsch63ale9gfcrsiFxLBwp8Gric3+ZPbI++rYbp2
	 dIf5Fn7XeM+E0ibnMYhWHf0WwwWOzbrjbg0jNWRRiPJxBMgYSeGOP0yg6RqLutzvRABve
	 SIzUZ7aYCZ/Xm/jgh3jbEdJBfPT0F+AyUBvXYAU33JB6Dj+kB+u/qX8UKukrfBn5Ybb6+
	 VOkwYzhrNwjUrFjz1+jKpXoOFDqHVIU6rGlASxjbHSZLJ/qofEJ4AqpRtz6V/4zu4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EBkgmCwzSSGPUQEDHuaBTutli2Jfo6B14aVph4B8jx0=;
	b=meGdMtEoN2os5caAMKgbKeJt74FNNfg4/ECIYf28VhLpn4xac65IRU+7alnqSa3DobLm
	 It1TqI4giWWMS+2eP291nYhOx/0gpcgBwjH6aFIUIuUs64ABNVz5MJduy6XvTw0c4eH4e
	 THdW/pJH98wcD2fyuP3fEpzisJjnTxgHFfayO2h33HHmcxGMiQDgISz+uVkVl12khSg+5
	 drhby2lhr0qyG9fv2tUf4OvAQzMdOuC/UynvPLlzvCWwBnEsCCtIH6g31qeMHKYL5Vzf5
	 4E3zfwcBoXlbg8/OWC+1x/72oBlfIQDUx0uT+538MiYx0bMqYyWX9R1oxIjvBn32tBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UEmdS/dd";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CB5606A89D
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 23:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CB5606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEmdS/dd
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so123940eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 15:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794524415; x=1795129215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBkgmCwzSSGPUQEDHuaBTutli2Jfo6B14aVph4B8jx0=;
        b=UEmdS/ddxgea87Jmi4D6KGO0cwNBW0iN6pjH4MYdOo/9psUz72Te3wCs/WBVGWCYin
         oLAdMFp7CIubzlvzOBmyRG/Lj4TRocdsaMYZRyRloCp5icyGrXTBcF0NN3YDIdpbziPD
         9dCoQysz795JPTNbOOEjaH/EeLGkosuG4aQkxwOskX09xUil/r1gN92uAD9OMsSjKiDB
         F0lH6/nzBn/sVPwCLsDSnGNtu6ltHUoqDrztZuFogvL6rw+gfNvucXjpxiD1Anf0Up7c
         0j1KXXL6s2KWDR5t1ZzoobkG3mM+v03VwLyiHohMh0pxNELAMXLgF+TZ4oIQZUO8hFiw
         1I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524415; x=1795129215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBkgmCwzSSGPUQEDHuaBTutli2Jfo6B14aVph4B8jx0=;
        b=qtftQWYt1c5FyLGmlDxVCfuuNsfgY8YQO6JbaGTctIaCOK7WcHCRxFNwHlUKUr4xU4
         +9mtiwB7uRPWwSmo4gmm8VLb6cF8v65fjM5oclKN3Jk2+zFarDnC0N9m39gqLd44vm+h
         o7VbUiNefyGCX5IMW9IBGlZm0YNak8EgbJYkcYOcLkEPvlQffv3GdF5ywpP8s6cF/MLw
         4JGJcyyL2x3vho1/my6KcwH0EDqmZ8MZ8iZwOpvHIZUcN8gtgFdFB8pTrc75ci9iIjIX
         Fxt0rdcniYSuuobPECfk/qxic4heX6VAxon79MWCb1Fs2NzbWdOjusejIge2UEMNtyUd
         glGw==
X-Forwarded-Encrypted: i=1; AL+hErE2vcbOCjelEeho479/OQKGZFueO2IPkSCY5XJuHjuQ+zU2wiTNgY4oq/GYLrARWbPA9rblThbT9Wp107W/TVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K9Euxq9uxeGdmrVBosfdoGrkpJSbquTnHgzi2QULt1bd4i2Y/
	nejgEcV5cXYrkxQBZ1rAqSIREDLKsUfCtzcnyOZfSvVJMNqiIkOYbBxT
X-Gm-Gg: AYBFou0Ba9G+t45Tm0cm420FEq/U2jakJj89PxeCgUcWWvR5iVPSDJZqRHzDTg4bw4P
	e8YO5RLQlC49dGsKBXvteeQnh41+35lNoRSttt8Op/4Rf2mOx2WrpP3fDq4ECatyjtpSztaSbR3
	41je4dlBUKFFYU5DIZZ0AP2gn4mAF8fuIOib2TI7Vy2pR0onrSeQ4A+MBZlxKinrOK47xwFuwz+
	IusZKQOEsI43CeIpO6pBLVKa4NhexH6ZmH/1wXru15uWEb2s+MWZDs5V9xHQDT9UqHglBxNttDJ
	BlEaaTzv4g3wiMfP1JEnhu41w7hvu8/LNBracKMsRyBS7MqF6I8r0XExplJUrI8W8bEOzQYAPkD
	XarNHk2L/8osvKHtJ+YwKMSHhg7AMiCYM8/q+Gtzd24j58asv2+FBkej5v7kOl2XAQI2OQMli6A
	0Wq6Z2x0ocGT0rmYL355FhB45THAsAL5wfh7oDqZGskT/lNeKOALqYx3WJdB6OOfWhBdUJQMpEh
	0PzE8584eyMVu42OnI7XAif68HuRYu8DRIo/f4+SxdRDNXRcAowu3E99vOdwKBS/oLNbEZnrHke
	fR1oviF14+I0MKNzHXarTy4=
X-Received: by 2002:a05:701b:454f:10b0:1b2:4998:a0df with SMTP id a92af1059eb24-1b5030db655mr763014c88.35.1794524414765;
        Thu, 12 Nov 2026 15:00:14 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm2014845c88.14.2026.11.12.15.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:00:13 -0800 (PST)
Date: Thu, 12 Nov 2026 15:00:09 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	almasrymina@google.com, sdf@fomichev.me, leitao@debian.org, dtatulea@nvidia.com, 
	asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net, 
	razor@blackwall.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
Message-ID: <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
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
In-Reply-To: <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>

On 11/12, Paolo Abeni wrote:
> Hi,
> 
> A few (late) questions/comments to check I'm not missing relevant
> points,
> 
> On 11/11/26 23:47, Stanislav Fomichev wrote:
> > TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> > A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> > 68KB, which makes BIG TCP ineffective for devmem TX.
> 
> ... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
> ~180K...
> > This series picks the TX net_iov size from the dmabuf sg table instead:
> > the largest power of 2, up to 2MB, which aligns every DMA segment. With
> > a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> > no UAPI change since TX addresses are dmabuf offsets.
> 
> ... still this option should be more effective because the limit would be
> higher and the skb would use less cachelines for the shared_info,
> 
> I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
> complex and if you could do that, too.

Originally I did not want to include bigtcp to keep it apples to apples:
same tso size, just 16 frags in skb vs 1 (in ideal case).

I just tried running mlx5 with 45 frags configured and it fails to start with
the following error:
mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: 16, needed 23" and returns -EIO.

(fwiw quick review with llm claims that mlx5 only supports up to 20 skb frags)

What I also tried just now is `gso_max_size 524280` (on top of this series)
and it ups single flow throughput from 200Gbps to 240Gbps (presumably
by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
the sender softirq..

I hope this gives you more data, not sure running with 20 frags is worth
it (vs 16)? LMK if you disagree or want me to run something else.

> > This doesn't make skbs larger. TCP still sizes them with size_goal.
> > Only the frags get larger, and a single frag can now cover the whole
> > skb.
> > 
> > An skb stays under 64KB unless BIG TCP is enabled. With BIG TCP,
> > MSG_ZEROCOPY from huge pages can already create frags of 64KB or
> > more. So drivers already have to handle them:
> > - mlx5 has a 31-bit length per data segment
> > - gve splits frags into 16KB descriptors
> > - fbnic doesn't enable BIG TCP
> > - bnxt has a 16-bit BD length. It is broken for such page frags today
> >    and will be fixed separately.
> > 
> > Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
> > net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
> > kernel on the sender only. 1 flow, MTU 4200, receiver tcp_rmem capped
> > at 16MB so it doesn't drop, median of 5 x 60s runs:
> > 
> >                                before    after
> >    frags per skb (sender)       16-17      1-2
> >    throughput (Gb/s)            208.6    211.2
> >    sender sendmsg CPU (sys)     40.8%    19.5%   (-52%)
> > 
> > The receiver's CPU is the bottleneck, so the gain is CPU, not
> > throughput. More of the transmit runs from the ACK path, so the
> > sender's softirq grows (52% -> 59%), but sys + sirq still drops by 16%.
> 
> is the receiver using GRO H/W offload/big TCP? Which are the gro_max_size/
> gso_max_size limits? In the `after` scenario, is the 2nd frag used for the
> headers?

hw gro, no big tcp (default tso of 64k). The headers are still in the
linear part and most of the time we get 1 frag.

I'm assuming 2 frags are happening sometimes because of tcp sending
something over that 2MB boundary. So that one single range has to be expressed
by to frags.

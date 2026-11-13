Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530524;
	b=Pys26xNHt/7slvfM8G8TjZGG8Ru+WLSxDPajNSTeISf4UA/lnTDn66hldjNbrbs2ffTa
	 lc3Vy4uDdhClG2rp0xpLs4NbDNcEueQWXPnIfnj3Cg+S+I0fHhVddPfk4ccWZ8wg3BQon
	 c8U3orf+EfOoQaasvtkIZxLANnQHGcbeIM0ZxxVvbPJzCgotG7C9sAiQV1BegTnWn6ll2
	 SsHAm2ri6oUDHPvo+sdFRKnSKt9/tUd+5TgA+A8a659/z6nHATeO8I4A/zB9+16ulxS2v
	 2oMaft+4jVnD5CS7L5KMqoRl4LwsSYTzutcE7BSxCTHU0qt98hwxLKNmhhXrADdJo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YL7HdvRgoulMVBDaE6Qg6DwUJJA2vnGhioXYaH02k4E=;
	b=1J1+7aVoo0Gxm/e+Nae6Qh1/t/p292gj9ZOfFL6h4cg7GZaYqTJ1JiujrmZv2nu2d15v
	 7QV7WPY4Egw6bdQNcKAScBCSWjeRvtSFWCzo0SkvXzwKxHPsmflfR3kVCCNvOpAIlEJ3C
	 JMHpcOyQvSFgFz4MH5a9j212qw/oTqa5XaGvoryy+Km/IfjLjbQSfKeCZnzaXY0BDvcm6
	 27QZ8qgMQPmIii9neh1aveVnURJEvTYCpWVeo2mdHmfb2eDllM3zeYBRZirwm75Emd/X/
	 htb1opuqVYOljzvS5YU9+KSVO0Dtrt+IrkFKdC8VbwsoRrx7e6uCtOHOV2L12kRqEng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpPKohat;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1E606A885
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE1E606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpPKohat
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso348537c88.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530523; x=1795135323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YL7HdvRgoulMVBDaE6Qg6DwUJJA2vnGhioXYaH02k4E=;
        b=CpPKohatRHUTPl7O81pyX2Luk3+nxdLDH5mJo9iWEa1Bx0FmTZKMPI6bYU8rQZIjfM
         QtNO28jJeIk3YxGGcvQNS/N1b6tpN22FMqkzkvMOq4SqEs/wWa0ILnCdZ/RU7Ffdr9q6
         dW9TJVKj319GiULCAe+jPzAcHOyc18nBMJk4R3aUXjnmKXFaQwznf9D6ZqfLmHfeJugP
         4k5Jha7vcEEyHDb8kMZCbIsYvo8fL2+jLMFb45RLPA+jjKvGQtHQf+cUXWEJo9DxNquX
         INOk2dI0LwnL7/4hno/XcRSIgrqNO4WvDUYmGi0f4m4yKbysema+KXFZPAtMyKBc7uKW
         fGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530523; x=1795135323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YL7HdvRgoulMVBDaE6Qg6DwUJJA2vnGhioXYaH02k4E=;
        b=lvLQZOXOk32cPw7HAgYwMpGHrMcd2PO5QvLm6BRFK/kX1wp+r7ch1Yuao7VLbXMHfy
         rb6oy0TaFj5ibu3//oQWrF3+iVmtiaWWLsy+lLrog7Rplg5a1wNDO7InAx/FMEL4BBju
         gX6MOXhweqVBhW84Vaqfj1bi+sjqYXoAlVLp1SRRsMV6vMBcouhfy8+nbFGrU1DvttZ+
         GiE9uSv3P5qkq6gpr4h/8HMS6m/yeaRkDEKmxMBEtHd6xo/xrjNIbefugYDl8Frqb1VY
         wvK5J2EH+Ks4JNCdj4aj2YxsBxmtv6+JZVEjcpCL8LzrU0r/rYusGIy59Rer1xqn31xM
         8zRg==
X-Forwarded-Encrypted: i=1; AL+hErGKe3rxeXWKzV7kARkZxA2aHu6RhUL86QsN6z9z4/3j0hzcRs9vNf9NpKHw6CKK6W0hpzpap4xr9zRNHTvKKas=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AnLHd2GoJyPl4rNwsP+Zno+bcpyy4Yc4YYk9OpHxhFUxeJNUd
	ElRDYRHi96moIgGb9XcZcauLB6kRf+RbTRYrclTPv3zTRVVj87BLAcav
X-Gm-Gg: AYBFou2ZBlVZbBI3OEB1/vZtTKW6bXEBFEHqRVbErU+A8lq5X+ZlyRAoc1HVipgrwz9
	giNiPLyDqTe3IUy73td6KakUf6vsl13gfLE6rcA74C/6qtGEA2oVbrgSnJLtNM1/XefAd1EX4E3
	rDgb/nWAkxyHtFg6CC+7qj/l1BWZDPNGHPf4T6oe7bS9sCAxbZt/4HemjlH8gsvAPXK6oHpV2Z9
	LGKv31RK34U8IBD4xc6PQGWRKiEaezS7j0xRs4lEc57jWF/BYeOsYsZS8k5YmFkgHDMRzsNrbQi
	ZGAeLkifNzV4+u5YPJHTDcgSZFpyypMnjh/vzjBWvmEkAqS6ROYv96SusAV5DG555Mr9WLyIvOx
	mbOp4VCQ/sIkbJr2hyXSW36EvYocHJTH/QHpTC8gZb+IVUfDpxF3VdiEtqzoryM9cCxPkTQ0N0F
	f1EtUDCpwXe19ZkoopIymwt0519lJZNCwZviSZjK+/hs7aSO9887R2/AiReqEi2jCs6a53UNwMm
	9aIpDxZs7WkGIo39IQ4HTHMEw54ULvoHRt4v2CdYkSGjrJl20vLKMnroYCnQjgJEsRlye8v/LK4
	hbnbCCo9KZBxz3XHzvOyXdE=
X-Received: by 2002:a05:701b:4213:20b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b5031a46bamr1155706c88.41.1794530523330;
        Thu, 12 Nov 2026 16:42:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:62::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm2811710c88.4.2026.11.12.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:42:02 -0800 (PST)
Date: Thu, 12 Nov 2026 16:41:56 -0800
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
Message-ID: <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
 <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
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
In-Reply-To: <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>

On 11/12, Stanislav Fomichev wrote:
> On 11/12, Paolo Abeni wrote:
> > Hi,
> > 
> > A few (late) questions/comments to check I'm not missing relevant
> > points,
> > 
> > On 11/11/26 23:47, Stanislav Fomichev wrote:
> > > TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> > > A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> > > 68KB, which makes BIG TCP ineffective for devmem TX.
> > 
> > ... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
> > ~180K...
> > > This series picks the TX net_iov size from the dmabuf sg table instead:
> > > the largest power of 2, up to 2MB, which aligns every DMA segment. With
> > > a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> > > no UAPI change since TX addresses are dmabuf offsets.
> > 
> > ... still this option should be more effective because the limit would be
> > higher and the skb would use less cachelines for the shared_info,
> > 
> > I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
> > complex and if you could do that, too.
> 
> Originally I did not want to include bigtcp to keep it apples to apples:
> same tso size, just 16 frags in skb vs 1 (in ideal case).
> 
> I just tried running mlx5 with 45 frags configured and it fails to start with
> the following error:
> mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: 16, needed 23" and returns -EIO.
> 
> (fwiw quick review with llm claims that mlx5 only supports up to 20 skb frags)
> 
> What I also tried just now is `gso_max_size 524280` (on top of this series)
> and it ups single flow throughput from 200Gbps to 240Gbps (presumably
> by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
> the sender softirq..
> 
> I hope this gives you more data, not sure running with 20 frags is worth
> it (vs 16)? LMK if you disagree or want me to run something else.

Fun fact, also setting gro_max_size on the receiver gets line rate over
single flow:

I   client.c: Connected 1:cpu 39 | 1:cpu 118
client: == Source 2401:db00:255a:4a:bace::b
client:   Tx389.448 Gbps (2921248849920 bytes in 60008026 usec)
client:   Rx  0.000 Gbps (0 bytes in 60008026 usec)
client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
client:             2   125  86      2    0 15300608 10142
client:   net CPU 39: usr: 0.03% sys: 0.06% idle:67.39% iow: 0.00% irq: 5.69% sirq:26.81%
client:   app CPU 40: usr: 0.05% sys: 2.91% idle:95.67% iow: 0.00% irq: 0.21% sirq: 1.14%
client: == Target 2401:db00:255a:44:bace::b
client:   Tx  0.000 Gbps (0 bytes in 60009306 usec)
client:   Rx389.438 Gbps (2921238435008 bytes in 60009306 usec)
client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
client:             0     0 210    122    0  999424   10
client:   net CPU118: usr: 0.00% sys: 0.00% idle: 1.60% iow: 0.00% irq: 0.33% sirq:98.05%
client:   app CPU119: usr: 2.75% sys:77.46% idle:18.95% iow: 0.00% irq: 0.47% sirq: 0.34%

4200MTU, 32K rx-buf-len, this patch series, gso/gro_mas_size of 524280,
still the default number of frags (enough on rx to fill 512K GRO with 32K
chunks).

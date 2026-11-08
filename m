Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150786;
	b=a8XKnaIcSsw4v0TwmmThu17GzejrlrILiSrYmHfO+riuNMxM4s7U4MnA5Ifhd4iDzSMT
	 CQIx/6WBN3+3hBwWSVPrab7acRYc+Ttzq6JK81sz+Zwzk+N6QBJkNmeq0KFvSYA4WgEbB
	 c7u28udv2Xz2ehzwG3RRkxmVr8ho2K094RcoRJJn7LYV/m4yLk7J8xLi1XAQ9qkC5AMAE
	 Bmy3Dp+CNG2ql5pE4PThJeX/q5U5iNouX/2ShgG+BH4c5gWwjslOaLGqVxGhlo0H+u5+u
	 29hYZTUl9Ll5id9UEh88nUQjHNtWfd8C7giuLZy1r9TIHxCjUjMHC7UUYiirJjqtVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oGOpptMTTRvU+q+lGfxSAwJKiB4VoXJ/0q8Ure01rsI=;
	b=GTMZ+Exm4DskMca0hIqNKbLelBrrcsaYa8Lxt2+wFWZg8ajN/w3F2BChOLDmbgvuXBo/
	 o7ynMsFAm1kXSXupQpUkF1rCTGHFLo/gXLDzsVeCI4dQim4eiDkpe8OS6FRKeE09tJH5k
	 cKv8Wsmpe7NWAqpQQIvQqFq04EmWc1Kolz8i539Gipg34AzdmvRIWGUm/ndbisjQ8G2g2
	 ZAQZnNXCewBqQNJkEaph6pybehsCkMA0vwjdEC+BdJhcSdAXBmk17bF0h/YEB7hC2FouD
	 UyrQBtLW7GprX3pO9h0FmrpE1INCEwuKAtW99D0e2paEYB9NunOqYSBjJykNIubC49w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gQ8KArV/";
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F7606A330
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 15:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368F7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQ8KArV/
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eafb65e169so68022e0c.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150785; x=1794755585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oGOpptMTTRvU+q+lGfxSAwJKiB4VoXJ/0q8Ure01rsI=;
        b=gQ8KArV/ErbsVTXda3c9mTt1T9/eZSFNq5fU2hi92W6EJ8QEPp6hstG1ZKrfTTKuCc
         6fJdT2zddwVPqHY0dKFwv4p91YTgDtmIDdAhYaXTS3SS+u6dDKU5CGob3wri1RZx1phL
         4bmJ5mAcBjzwlr6WuixJp8lWzr4KMK+74i+QENNkzHlIOFd8A6dDN4wvKZ+y7/C3NYfr
         wpD8s84LSUxk0othXtncH9vgHxVoGqDatOLHXpHfPrE3Xs2mKY3sq320MQPxsvZRWoxB
         TtlrLoRibfOEiDkIkABgHwKAuTnwXCG7JUdQxIr7MkKA5fdaTQaG0vNJIokjKs8yATrW
         XaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150785; x=1794755585;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGOpptMTTRvU+q+lGfxSAwJKiB4VoXJ/0q8Ure01rsI=;
        b=nb7uT2mj5UcEvxT4z2nQa6BTRg/2c7tbmpkNHp27CXuVQJ95Qy1K+vSDBXw51lSTFf
         XeaJ6JOaoeLnIG8GD1DambwIYhBlY1I4R0uEEBHQR/2pesBoeIOFOuY9Z+b6E3N/55JN
         v0Jb92hzORdKCnaKOKGFbYW0X2eTju6dOsF7gb7il3ogo1n+EQ7jarORb41wDozUeLCB
         rwgTYKKu12RvPjkWdb29EcffKIfh6IloZg4haPJ1fFrfMxFuiogLuZrxcg7xCrTMBNIs
         As8TV2T6awmE4OhxMACsuglWCibM7B3fKOJ4k4hO7p43Hp/xJ/gXciSQ9BMxKEP/xGq+
         E5Cw==
X-Forwarded-Encrypted: i=1; AL+hErHEDf53yldRdXiB71aQ0RQXuaujELeznWvUMjtlJG7FoeX3K3yaLFNdgonp/0XrENyJDTEomRZ3QvZjGH3Hep4=@vger.kernel.org
X-Gm-Message-State: APuU4Z83xYpbOQGUUtU31P3JyT5U38gLb3TLdBe+b7uJ6m2L4m9rGfu+
	gi+MQoFIA8/v08fSUxXeYZ2hM6g1BOp3+eBao7+7JjMbvSTMioThCXF0
X-Gm-Gg: AYBFou0r/LippGqU9Fn8piPzVl0MxyZMcCQ6l3aEqbycFL2U94elnl3atPMWf50DI64
	eODXHjZ32UlX5lTA9WZ8UvTzGuhUsiUYWxBKHs+R1ngR5J1/M0UbDMgu0shk3nuDjGr5mi0+vs/
	DvAtou2Pq8h6eukxDzVaHlruUYFxEw4fwuWHuxyXnpsRelJTSeXcD8KVKSycXX+Om4sPuQjUEFY
	UHkOcBaM/DtAZoG+kKGRi6oxR4QenijGzm2DzBuH4kfWrkm1JONiWYRinkdHP3eMUdLY5LRuOkK
	KberyydZ1g2JwwPK5iuPxyMXsdykDQAOFnko0ruhMpzS6/U8UnMJTVrjRjPcLIyT8MPvVheVj3o
	fmtuJz6dxxCaPTMgoQH8FGcKHgeFJ19fjo4wn8q+TmX9NAvQJnPreRfTV/HEhLLOvhiAC7ZsgIu
	7gq7BqBKX10Pwxaf7J1po5FzAQ9l3UC+re38x8+6yso1OXFwkDUdXa/pI6W3TGJI4hhngdYtw7M
	PqwG92u56W/7AXG923kkzkg4j+Bs4Ndoyckl2VsLEhPPOSdyU4MdmwvrYiJuvItQ5VUnBPV5FsN
	erU9HScqD/yR7AyCUUI4UVkx7VMS6ItLtHTJLR1VILzy4780alZV0v6XlD3Zuss3REc36fD5GAt
	joAeF9+oJB4+ro53pvBAOqih9ecPqytKIlR9knPoBnm/NFljQst4+nvPc2b14jmMnxAfE5yA=
X-Received: by 2002:a05:6102:41a6:b0:7a6:85d6:84c3 with SMTP id ada2fe7eead31-7d2daab4c34mr493239137.3.1794150785073;
        Sun, 08 Nov 2026 07:13:05 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2daf08fe5sm2083603137.0.2026.11.08.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:13:04 -0800 (PST)
Date: Sun, 08 Nov 2026 10:13:03 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Simon Horman <horms@kernel.org>, 
 David Keogh <dkeogh@amazon.com>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Dragos Tatulea <dtatulea@nvidia.com>, 
 Nimrod Oren <noren@nvidia.com>, 
 Alasdair McWilliam <alasdair@mcwilliam.dev>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Breno Leitao <leitao@debian.org>, 
 =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
 Danielle Ratson <danieller@nvidia.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, 
 bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 kernel-team@cloudflare.com, 
 nh-open-source@amazon.com
Message-ID: <willemdebruijn.kernel.2c6a653eb65fa@gmail.com>
In-Reply-To: <20261107182526.69543-1-tianyi@cloudflare.com>
References: <cover.1794020868.git.tianyi@cloudflare.com>
 <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com>
 <willemdebruijn.kernel.1d64e7848503b@gmail.com>
 <20261107182526.69543-1-tianyi@cloudflare.com>
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and
 LL_ALLOC_SPACE()
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Tianyi Gao wrote:
> On Sat, Nov 07, 2026 at 09:51:07AM -0500, Willem de Bruijn wrote:
> > Tianyi Gao wrote:
> > > From: David Keogh <dkeogh@amazon.com>
> > >
> > > Add a tx_extra_headroom field to struct net_device for that purpose,
> >
> > Main high level concern is just adding an extra field. What's next,
> > do we need to add a field extra_extra_headroom?
> 
> Thanks for the review.
> 
> A user needs more room either in every packet or only in new skbs.
> needed_headroom covers the first case and tx_extra_headroom the
> second. I do not see a third case.
> 
> needed_headroom does not only set the headroom of new skbs. It is also
> the minimum that ip_finish_output2() and ip_forward() require of
> existing skbs. Raising it for new skbs also raises that minimum. With
> XDP on a veth peer and needed_headroom raised to 256, throughput drops
> by 2.8% to 5.8% for local TCP and by 4.0% to 20.8% for forwarded
> traffic. The cover letter has the detailed analysis. veth also cannot
> set needed_headroom from user space today.
> 
> pahole on x86_64 (defconfig, net/core/dev.o) shows that the field fills
> the 2-byte hole after needed_headroom, so struct net_device does not
> grow:
> 
> before:
> 	unsigned short             needed_headroom;      /*    60     2 */
> 	/* XXX 2 bytes hole, try to pack */
> 	/* size: 2688, cachelines: 42, members: 187 */
> 
> after:
> 	unsigned short             needed_headroom;      /*    60     2 */
> 	unsigned short             tx_extra_headroom;    /*    62     2 */
> 	/* size: 2688, cachelines: 42, members: 188 */

Thanks.

Pushing back on another design choice: the UAPI change. That both cannot be
undone, and is fragile and laborious, requiring manual admin arithmetic.

The RFC patch mentioned two other approaches: explicit headroom requirement
labeling for tc and BPF, and dynamic adjustment of this field whenever a
realloc in the stack is encountered.

They are left for future work. But should those instead be implemented
first? As said, this manual hackery cannot be undone. While in-kernel
mechanisms can be refined and built upon.

It seems to be that this series is trying to address a few related
situations and argues that no single solution fixes all except for manual
adjustment. But likely a combination of the above (and more) will.

This does leave the veth peer to solve, but that does not seem
fundamentally intractable.


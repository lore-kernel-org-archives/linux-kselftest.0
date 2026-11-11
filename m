Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355258;
	b=Z6fBqaf7JdZ6KPmtqVOQs4ouaOFO8ZouebD9vqH7vhR83ar9W1CPiK9wzOkqd6Pc2Jaw
	 dyjWegJegefo7eyg5FKA9kRtG/G2WgLEoTM8Et1sH1+9pYSPfX2jtTl1Nyo6OUX2nWktB
	 1MFX/If7TdSaON6m//lclJr1UvLMEfujkv/3ExwVovK7L1Q7AHRT55T/3uIiuC3INc5QD
	 egeWFE1CSMKfht0UZpOfq50m8Cf76eBZZD7jgB8ab781X31H5SfI+wruGa8NXbtV9dKw2
	 SOpZDmJtpWneDQAwrhjE9a74CYxWZBtdwZk85ORkL8AHz665Glmobj/L0ZeaZjp+Ong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
	b=ujsWp4X/qsSGRczMUK2VGGNPAEdd0qd+tN0WgqYeXJ4OLI2ZQh67JNb7UpaQuexoTNHC
	 9bDgZWfktB6Ap5qXdeYW6kOm1CcCdXbKroT+hkEwuX+SvMBjiQs2Rk+oylgM9z0xRHReV
	 VuI5NO/KJJer3fM08GyGx1ljg8wUDkLzHzrsDJHYJR5jf0HO8NyQKkCEfNQARprSUS6IC
	 isdUThXUI6pcIoUqOFamin7Gxa6no3pQj2y627OiIai0dPDQM6vA9DXdxLNNtDQO4FUUK
	 u4vNW21gJ1NmGizM51f9IVr0XnFYY9FdMTQutBKX/C3IsP+tR9vvcxvQ9i4tybFA2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9TAbB+g;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4F606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB4F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9TAbB+g
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so1267566eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355257; x=1794960057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
        b=t9TAbB+gGdTcVq3NKRacPVt0N7MjkADs80KixPKvho+VsCVkoONwqkO/yJ/R8u5s2t
         sU9qfXBu+fZ2f+ktLbaRcQP1JUWWcVt1Fdbqa/eQbcIiLEtxXQoKQ3sLAmrxeQykyCN2
         49gyjEHNylCKfRyIbQk8A7tQfltVuGM4+o9KlANYaQOAdjVDaBEFIYSTSPPuHrHa5vH4
         1ntDDzByXQNjxkoHCJ8Zg+FfDpNx5BdDMLoBbqgU2bUForQ7XgCLF8X3ErsGHfHghBfW
         TrPH66Wi7muVvYkZOho47s0CKpbAoxIu5IjK2FIpcRJF2KmPFdk+AT0W3KF20V5scofS
         +4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355257; x=1794960057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
        b=w0QkzwmoNaOKB3xwYVqes9XZJULjRT+3zLmfqCRl2QShrJWdRDtrEtHqohuxHv14sv
         dOb8Pfas1LIO+X4XHjHj2SL29cX1uk+Oq3WJUlJL2hMIA2lgwlhe+kbcngrXM2q1fRZ6
         1tmihZvHMf0/3T7ExVhJ3JTYBs7ecIIOD612AKIeBVxtOTtpAS96pXrD+1E9jy/a5yp/
         plUvRa2m8oKYUPF4yGuCG47I7tJaEiGiHzdMBNDydD9yxYjdZzoaFfd/om+TUEpCDdM8
         fbby1nrpy5iTULAhWzgksX123apNnTeZ+PWEHiguTlSIMpvZHCl/FFdYvUzj0CYSQ5/9
         z2Qw==
X-Forwarded-Encrypted: i=1; AL+hErHRZLSH3nWq7d6p4MdXCQNqBCANd9crNHWHdfzW9xzd8+U6X5AcfSzgKc8zAytn1r1gwUrN8cYAPDMkoW1H9ms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PR/phgaht3eq4s+tI6rMd6fgj/VHBrv4U+3FaZ91RmepZ3TXt
	yBbxN3kMElLD1fASdKzUe3okLz4/pQNArKEppxmuyvU1iheVsvty7/Xi
X-Gm-Gg: AYBFou1WhgL9Q6DgoaujtuKLqJ3QQgfUNQAtQ9IFHd/hCcbgUjSgjqFg36upvsstJof
	1pRbFcazH0MDUH5iD8ZgXFM2AF1dajnf6pglV+hwVSGAD9m5xglcSrRhXsTKuoO8mU0mwII2Zkx
	suWiabLgXIU7vJIu0NGCCPUMD4gncz4HwpJVEPY56MuenPpq1Fi1ocgWK1KvKkJnxNtMp36v/xt
	8nXMcypdTvIOxIvKoByN1OEHN+hg1cy+2dAFWgOJiJhyuJKejJpZnYUmz5sUJ+YaC+w6KBtayOD
	MWPLFrXf5T8qoogpEiSPUruuJjPGAZGqdi5vzLQtCe4C/rHCjIDr/Q7NY5fFPYvNuR3BHu1td+Z
	C03mmf+iQz9KTPBqZAlazas7zs7f+mRgvbLAYIhKi2lHn1Pn9IhZ98UDIWJBjziM/unc1hH4Up5
	L61JY7KxSkb+nVxBbQ5BFPAHl7Skq9MnILO3WOyPSDMHdHEm/6tKsfp+N3wpdkZHXFnoTWk4jvq
	2QLZ00ALqbiHeLSfr/Pj28UZJAT8Ax2KstA2EcChBe/oSLcNrW+AQHknqwW+8ddnOOrSNZOgywN
	inCoPS4N9V7j1WRPMbuUrFKk
X-Received: by 2002:a05:7301:90b:b0:375:4366:a90c with SMTP id 5a478bee46e88-3768730e517mr1138142eec.41.1794355256884;
        Tue, 10 Nov 2026 16:00:56 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19090263eec.29.2026.11.10.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:00:55 -0800 (PST)
Date: Tue, 10 Nov 2026 16:00:51 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, llvm@lists.linux.dev, kernel-team@cloudflare.com
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
Message-ID: <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
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
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>

On 11/10, Tianyi Gao wrote:
> An skb gets its RX hash, VLAN tag and checksum status from the RX
> descriptor, which describes the packet before the XDP program ran.
> 
> Without this series:
> 
> - On XDP_PASS, the values are stale. After the program strips a UDP
>   tunnel header, the stack applies the outer CHECKSUM_UNNECESSARY to the
>   inner packet [1]. If the outer UDP checksum is 0, a packet with a bad
>   inner checksum reaches the socket.
> - On XDP_REDIRECT, the values are lost. The skb that cpumap or veth
>   builds from the xdp_frame has no RX hash and no VLAN tag, and its
>   checksum status is CHECKSUM_NONE.
> 
> In one use case, an XDP program redirects packets into a veth device.
> The checksum status is lost, so GRO verifies every checksum in software.
> With one TCP flow, this costs 34% of the receiving CPU.
> 
> Another use case [2] is load balancing IPsec tunnel traffic with cpumap.
> Without the RX hash, GRO on cpumap puts all flows into the same bucket.
> In a cpumap test with 16 TCP flows and no IPsec, the throughput is
> 17.6 Gbit/s instead of 23.4.
> 
> This series introduces SKB core extensions for XDP. It reserves an skb
> core extension area in the headroom, right after the space for struct
> xdp_frame. An XDP program stores RX metadata in the area with kfuncs,
> and the kernel sets the skb fields from it. This design was initially
> proposed in [3].

Awhile ago we discussed the alternative of adding setters for xdp metadata.
Then the veth (or whoever turns xdp frame into an skb) can apply whatever
metadata it needs (and there is some magic behind the scenes that takes
it into account when creating an skb). That keeps the layout and most
of the code outside of kernel. Have we considered that here?

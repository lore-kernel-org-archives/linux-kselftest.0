Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953838;
	b=BjbDMgPnbqHlM6qLzHGnpICpbGkqWyg1IwVJgZOMmv+5j66iSlHTn42X4FQxgsQd4qbg
	 Ba/oOnym9fQSvo/XYp7QQsaJ1/P/KRG5bSs2OaJwCWpkHzPcOHrHWiPP6Cy6ieYxQByDe
	 hcQzKWwPrtdRnzMCIumr8/itRKHrFOC922V8KoPf8SAqQp2VBkIsQ8MI1C1iMmleAicWI
	 zj39cjiXIIgfG/1Eu6XfLI7GgfDie8pGysNSGhrvIjh1mi261YAQ4++2xh/wjfWBXD5bh
	 sQ4GHxQkHYvRJZyYnhJHDXfRNmZ3PsT+BuWx1nKoOrsaF2r0yyR2non9uQdwed0f4cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
	b=kF6en423Ij531eyuLjj84oafaVNBYac5jiqCwtmrxTszxtSzMPsN3OLbzNADneyHTeSJ
	 TuDY2IgYbfYHsm8nh/3v5VMYv9KpauLHoLjI/f0JugZH1lnVDLFzakVew95KLUcRkVBNR
	 Y9nKIwOfq8egtQxTZoK4jsPsNPO8FkJL+IW+LJqERPVJMHGsXkhP9StqP73ZR2tMNVjie
	 bC+/88M52x15F1OlZF9pizUWOo6W1elvYUQ9zdmODrAnX4k90JIr1uJW+XJF0HtxBiKnM
	 GDqNuKxkAsnC2twYHYt6Y/rPUppqasLdpQvnRwyZTclxBAcRFMi60Revr/6NROcrQfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46693606A333
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46693606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=EvkMrAlm
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1pNA2069280
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=naIMYO16Tb2
	J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=; b=EvkMrAlmrDK8ub69Xg7pAjpcfhg
	bZmfLUAoEXVsHI582DX2XvH/l6wGABdG9omOSqhVscA/IEoGuPA0CuKpLQIwkQrd
	hBEyFCYOGEXtjyA8x3b0g3YTHTx/sHwE+cQmDTvaKvteMtyAtX6dmBfQkCozkLZf
	p22cxMmQsz7yD32uSvOi3HsnxIikFWp62dCypEtCz6SeWEqW8jjr10TkF5/Z4PeJ
	/8L+8tNnAtQ73AhwuAwiHeC+vacHLSuhs6/KyihzjSuZu88a3UB0O+P7RJ2pM+Pq
	VMyvbB/nLDYMAxlh+5ivYxFI1VuB1MRuJ0Byb/cV3VEMNBGlBCxo+Gavfxw==
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0w0bt0d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:17:17 -0800 (PST)
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a68703d177so61079f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953836; cv=none;
        d=google.com; s=arc-20260327;
        b=MydZHI0eaKjleRYUTBsv+MJ9+fF0X5W/AUzjkx045MnwDHlfiqbEqHdWIrQI1FMRSN
         RY0iIdxPTYie5hnQNlHSSLv3Gt4BSE2KFA/gk0+/EELI/TNalXjf3+Z2FTvwvlCijTaT
         1RoIgneZLhPlEyEdGqI5+K5ln9KYn8UdLFqxH+VzwGrukfS1v/v7n515x/lBpPjiZeeq
         jxATFULVINgb/BVreddcLRSzGLqjaegeU6/xami77H0W0tSeiJTTUGr/xh+KBPRkZz1p
         vPnczwqztZxPD/2iYeVBQOqzME5BzHTfQhfq+PJHLzJCORpSwIW5CGi6YSIKcRX9JqAa
         BKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        fh=nTatM40CiWZdUm2+5xT3oMDtIqnmKX/SPC3+lI2ngsc=;
        b=F3xwlNTM+KVKcNJFxKrnr6gWFtwNeU0w9EcbDWW9BuGedLLaWOG+eZu0nk9RBX8Rds
         rSppkyAtdyrnpJ57/tjGYzXFQ9dY5RnapdeBykqo4ENKTwdq5NFhUdqOMCQbLRax3oLl
         7RjFEYF2q/wTx0gm+NoXQgF56vuapAPtA1znyh9czNXrxCYbDhdLHKLjYmpJduH3Ocab
         QLTovs6vvEmtTLaBrmrPhWW4LX2qGmOp2A+7uj7y4KedvFEBczqpVw1z7X25B3CfKYCQ
         FNPAla82QhOQU93tjyXkdZDG4JVwUQsc4opmvRYyjENi12kXuv7X58jE4XjTm2M5IYTL
         vCuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953836; x=1795558636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=naIMYO16Tb2J0b8QTmQ8uSWyAJ0zbIqQUrNZeGUwwtw=;
        b=iZQ3Ul/vxLqhkTswFEFu+R0YanWzw4WM/cUd6hl2cv1/mDxeBZa5gFyO8UlvNF4QQh
         7NrbsyyZGMPDGGWeruPbXIuEhgMwIkiH+Bk8iafxd6w+k+AmUXom2CGhnZsSB+Gq0Fwl
         ERKgtclXZ2TB8IfQ9R9lDuos0ntx0WqbzwGofmyQnSwb370yhzYtodWg+g0j+RGPH805
         vS8mcbNGq35fdVJUoN/G9YUf3fLk5C928KA0HFjszwKhgZ0ftxkh6eRNNJot9n1sjayV
         Eg4CnkMMjbLTeXCKHutUaxvIC8oqJN9fcwmEliuEYkbqwYQishvL60C3acLLW7Fc9T4K
         Z84A==
X-Forwarded-Encrypted: i=1; AL+hErHq62YYbiTbqRwSJpcXoUhADl+jNFYPdWtDPxPRz6SI0yukJMAcSciaqHX0XiwUCCnUilWPqFBpW0dy7kpyYbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0HSxkxa4rQy5aBhdOnBGmZrdf2cYna0E/wszCydCQDXaB6gMR
	qvTBfammKlPfveb5EcN0fdbw/zE/ICQdnGf8iGQlsBoBVvUWVarQ2OuJ9bntawLJ47S1UY+bb4J
	w/HGqcT2y1GOkvtgCzNSyQ52yDc2rJf78Yi8ZtuhqAPb9uFhKWyBtZCEYXP0VaQEeDZynYHxNNq
	GKB6Y1d//KicyU0p/LVsPJpMYWoeWlyHwYmMsnh41kK3o=
X-Gm-Gg: AZFdTZfL4PRW2OEFT5Z2iOnAnXsKYC30EZlUajX2u3Ybknq+bTM4IeCiKjNUxgUwf0D
	DFVrWmql0V9aMBejumgkWAdLsOy6CtABva/2LTVSa1549W5BanTeG4FRxIEbC0JwhASG5kl5GuU
	M12++B8XkMoaZXOqW4OnlXoR3Sn90wTaDTKarFg8Njl+EMFNKXw0BMcPDDvJlwZOhfdbNBBCME6
	F1JlMzq01t1XqTt4+gxtd43gPJWm/d1fwPyZMLFwfws9s8X4HI=
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id ffacd0b85a97d-4a63d2cf7f1mr1645575f8f.22.1794953835985;
        Tue, 17 Nov 2026 14:17:15 -0800 (PST)
X-Received: by 2002:a05:6000:603:b0:48e:5eac:7e48 with SMTP id
 ffacd0b85a97d-4a63d2cf7f1mr1645531f8f.22.1794953835465; Tue, 17 Nov 2026
 14:17:15 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-3-toddfreed@meta.com> <179471269307.2199510.1215468778950936295@kernel.org>
In-Reply-To: <179471269307.2199510.1215468778950936295@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:17:02 -0800
X-Gm-Features: Aa3M54r5Hu3045uljd3xO655IC2ADA2xeFtOm9g-Da5bBZKD676NvfeHASL2RN4
Message-ID: <CADh2yMznmWWJsh4ArEhrm2n9fG8i7o3u-kjLrvs_dwsBPiFvtw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/15] psp: take the psp nexthdr from the
 packet on encap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: dteJ-SjT8KkO03VqXyEGq-FjFBvGchdZ
X-Proofpoint-ORIG-GUID: dteJ-SjT8KkO03VqXyEGq-FjFBvGchdZ
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6afcd26d cx=c_pps
 a=pX1sPZUoWPGeQgUnKQNIgA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=-eSvoOO0VIkvbIxHXOgA:9 a=QEXdDO2ut3YA:10 a=XGGHjNwGSpTZ5T66x7Ix:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX36abJbrXTDv4
 0kBxlzQGIFH74FDAOs92cpF/1uxte3l+f9Xvwf/5mGiynlcEAWEd3YqW8WPyD6A9Cr5Xvpteuoe
 JnCFKdl/ScH7DKzbTvioInz/SACCvcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX43QPYc8IuEOz
 l92yBRfRTNGvyqPs88aU1MieFjb0P/mOzdfw8ZzWcfqzBl/eZuWdqz8d6e40kv/44+oaPRfCytx
 rHy/zzBtTVNfuMtH5rJgMWGx2GzSKTYqUOOUa8YKJ7n+y83ATvTTGRcJIT4z/i/W+7GdO98KHC2
 XFWFvLwCLlEL1odo8eDbdGzee0l4YyeEUhcMpCYyOPeP01TaZTgJ3K2HWhRRnwb19+FWXEb1PBu
 Q0p/4ppBQYrjaOP/gkTfVXX3mo1ORb74vmwdr6zEmfG786qEB7kj1lWpMwuaH7hISqmVjjSORrM
 SxH6wkANPl42B6014V0FlxtSj0r9vm+p33luHEGucK/XKYL4VXd89C6j3p9pc/jOWHZjokcedsV
 lZYr1fBdhZh1ZK6abh4ylqJ/1qwc9RzucGbqCBT0BmtydVcZ7tgUoZygI72dpPy9CYkhYx+Tg27
 1/CxEVokdYlZJ87y5Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
>
> psp_dev_encapsulate() now accepts non-TCP packets. Is the outer UDP
> source port selection in psp_write_headers() still correct when skb->sk
> is a UDP socket?
>
> ...
>
> Should the sk->sk_hash path be limited to TCP sockets, with other sockets
> falling back to udp_flow_src_port()?

Yep. v2 will only use sk_hash for TCP.

pw-bot: cr

-Todd

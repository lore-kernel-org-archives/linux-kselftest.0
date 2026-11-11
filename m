Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794421450;
	b=Xb53H0kw49RKWZDyL/OcrCFgr8vQsaMYbxTAJd2APeixQyjJHQJA6nW6y0kgQGRzGegs
	 oEfogA9wCnmelnvF0XFEHgVuLZ0F4UHsUNw6Qh97+oIhf5a1H55jT5VgAuaV1a67s2Wq1
	 IJl2x5GNwgYFE3yUiyWgZU0fHgzLPJQPyEi4PAIaLe05XLvGXllLRQ8OgPK1iotlf94/N
	 +Y8EV8MkmHRTxcROoye8bBWkt9llPhuhL7sWPSdqTrLm/o/oOJBdUmCiFjhfQYgg+QvH/
	 3xBs8t7iYJ7EvMTflqfccvoyDv7XtOjPhAe6o2Upi+2OGlRtK/YQ5DDY8OD10FmtqtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
	b=PE8OT6MLKyotBQRTvVcLzIeNMIlhswUpcHWtbLDMRQ0HKhnHj+ga95xBhZW4FVUbjW7Q
	 XjA35Sx775DXQT7S9BcZ8IGxKw6hhA91syU/iIkNwI5/Mqps+BtZK7DEhze6ENgJIEcWQ
	 7zTWyV8EqVekYTtDmewpjN/rYr1C2Npo1aO6hpP3+3DeEgJTI7uE8ASyLkzMOjR1b+kEK
	 wCNqMmX/axQloVmuoDq/0LJkzhmhr6FwJP1ZTDQX6RmqOZTaxkSOmEAeiQbVtzkmoFL4g
	 s2zXBy84RaxLgSfgtXqlIgRk+ddOtlfbVlUNRP0AI6DGYI9rpAYsKq1K4ix7awEHKnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=isns6Mqh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA75606A884
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 18:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA75606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=isns6Mqh
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABHssd83129735
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:24:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=aMG9NSIoryJ
	6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=; b=isns6MqhLK2gICBmvsfmHDefPrM
	fcse+kjR+dgFtXbRypDtqotW1Yl02H8zLF60ugJCdMKKjv2bgp3/FfDVbtAj0qPL
	nMdiMIQxDW/X1fu1xFPQrqO7h+9kKGnsak6+fIA8XRHkd2ZnZxPL61j+PZEgibEy
	nBb5hifSwAd17cHCObGIGWr6WQCyzXxmQufY6UHIk7KcX4LXVPfTsiACYBolCFv2
	uZsIapcgbM6aipiYch9uLbCT+xrDb7WMyVR20uj/cvl1DYR6dMROu6AKFq/+SWeu
	7vwmmqM2W1TLALIA4l+/gOuarfulif/2FeT4KQUkwmvzHlyXdH6HmkOe6Mg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by m0089730.ppops.net (PPS) with ESMTPS id 4huqmret7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so5719840a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 10:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794421448; cv=none;
        d=google.com; s=arc-20260327;
        b=s+VEZMniMMG2z3ymw30spqxWv/XSauhJEZtmiwzeJ93xUKlOr/g6Hxtlt8npuBEWuD
         h28JR9F5ceJlhAMmI4CXSgHfbpLrTvOCTRlwThO/mE29oz+4Fpu295Hb53UydygkKXIO
         ZFmT2zkU7618dbHzxGBT7ZwEqrsnjzDRZA1U1j8CvUcdyb/xiMDFFxKqs40qmhudaPk8
         aF0SPcD88JeKt+UAwpmgyiHgNZ+qx0XkCGpNFTGR6sZj8IuHkQ6G28o3ma5VPTdHZ6LG
         RTt4S89vfUSmHOWn0vSaBhEnHuBi8PH7ndnh60MKl7ryHO/K7M2F8cmMKvbp0h1vgQeC
         cWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
        fh=UWWhzvSC1dGouOz1xj8B0dBsW/KlZUNQkBCoecrI2Yc=;
        b=Qnij8voHtTeGJ0wQHVnYbP3R6q/OiBVOhO7LIhz2hpduKG2m6GBexMv7Q/6BPLStDB
         ujiI02f0Vtd0qhjadk1iE6N1rXIKcbsy3l9Q4fsxNWrqfHcFq+XzQX1zFOBn9SJ6fVEB
         aJW1M/uYK9Tw1PXYh6PbvidlTzNG0FJWFXh90nqaWq+Fa0u3ONzQWBZr+ttzTnuOrA7Z
         BJtgDotIcunCMcdB74BJYC8UQn22rwC4EFUJi+raGKdzFi5FjlPnJjce72JXlzoo4RHh
         AcOtZKRrv82paN4Bwn/hcKftxDnLTdwzCTDYne0Lb6PkZVi5J6momux/WUvnWK4OhJPh
         wBug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421448; x=1795026248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aMG9NSIoryJ6ZmHzBOTcIKDBni97i5hfecL1FAmnbM4=;
        b=cDQcoWClPDy/bVSNJzNkXXgrQs+XDe3oI3wJho/jTPUNNDOGzHO7EXlUyJuHheaNVw
         AjOyJJTxiHPx6gOJaySo5Vcz7hdb6OpWC0caFb4z+Gfv/kjn/moSRbyQFDP7Sw3qG36Q
         nV+sirSOzg6kZ3KMyhkaD5UUoJb4N70D2QADj0AGwpa/w7KFm3QBGwC5XHbxfjRbhcF/
         ntB8iL2uePOw9XCJj6OLi+iD4HMXQhv87/Ow6F1hxyuxS/KYpPZQQ0t1U9Nkw/MdSsyv
         eB+1nzYJKTh5pPvRJ1sQeIYISFyDoLIdgAX+9mDvvUUlOkGhLQLinzoC+5tozmsXZYeu
         TH8Q==
X-Forwarded-Encrypted: i=1; AL+hErH/MNJ1STDZfNvgcKLomMNUItRCwX2D0UwluLcIkRJ0844Nsg1+pPeQ8OOe+S/4XlLGZvIrm3R72o88FDDswSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kpBnVipS2hJiCwlkpzjco0v7B7J1pahxP01TbZpB9/DLF+Skm
	V9AEpkF/5t8k2Fh5soi4zaWY00QOQuqy4oQP5yg28OmlTldU1w9QHcKwFMwtjkUjPmXiErvBC72
	1ONjG5V76oeDLw6WUoo8uV0/QleCF9pA3M4oflj01VhdTN7YZbvnAVCEKCz8+TwprRYstaKgGGt
	k6JDzxBPHzXOcoj9N9si80kZckLCUR6g6UnCAWsw3+hF4=
X-Gm-Gg: AYBFou0ujeQBUm/yOpwqMXp96BZrAg5YQcnHffLr7CJV9jXysZtKT03lRPwDUUDets7
	k/5W7GO9r4yuz/Iv7VqF0aRBl0See/5RVEyfy1IotRsQYrdDdUjTL25WdB28dl5aJozPVjquk9K
	an4Opu9bU31P8gsjOM3AhCxiQvoEbE23s5/HfnC2IzdudxV5PrLLxn2PhBiqfABGq8ZuYjvfaIA
	QlzMnw7j5rY/S92gmHUSNkT2kJN3OkH
X-Received: by 2002:a17:90b:2f83:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b182eda7efmr3257450a91.26.1794421447603;
        Wed, 11 Nov 2026 10:24:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f83:b0:3ab:884b:65a8 with SMTP id
 98e67ed59e1d1-3b182eda7efmr3257421a91.26.1794421447127; Wed, 11 Nov 2026
 10:24:07 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
In-Reply-To: <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 10:23:56 -0800
X-Gm-Features: AclHuK8_olqmA7fXTYgEAj2-H4kgkwQj_X0uL-xyG8nZrZvhci79BGaB7ila0uo
Message-ID: <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MyBTYWx0ZWRfX9Upjj3hZNKid
 1B1+N/WJO4FY+otcsQNWGY3cywcxGnJtRHMpU8nmZz3vikONQAkQsirWYh3JieVpHzmvq13Y2+B
 o4hHi7+X7yQxotCCn8W43nlPR0GvWb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MyBTYWx0ZWRfX0eXyOntvjkOK
 TFd4MP26Y6bzZal8kTJizNfnCWTeQ2mKppAXE7fWPP1af6+sIOxSWyrQNqSa9EPnmGCOaUudX15
 uwjJ6xcTDM1Ip/bV9XT/sxaO18NVUdBiQ2KcBJZ7V2d2sDeGcfB0i3etozTPpaWyzb8QFPWs9NY
 BS1kBMMsSCqtRTPfKdm2YOoIwEyjU5xjGAByWGSYqzrNPuwW67Wuktl0CM+6KpJ4I8g9eskGa2p
 1WwgWY1wpf+y851XOkt9/nRcRB7+aExpwyZdoCWITv62f0PApTeR+yZkgA8ytMlWSaKxGuO6Q7j
 U6KOvvrOGJdNMxi/RmUPYh5r+O3luQsPZ6glZigM84FWlSFxbup1XWqbsP/84rSNmiqXNzeEvQl
 Bcb2CIVKKuHktY/7curHyXC8crBm4EQGuObkGjFw+hpu/OFs5EkpcJeLH2hrMxsoleaG65MwmCc
 eKW0ahSNdux8XsK2Maw==
X-Authority-Analysis: v=2.4 cv=YIgKWhGx c=1 sm=1 tr=0 ts=6af4b2c8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=-xR6GoDS8vL2zpuMsZwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 2507LFEainoZJzuxgpH8rKb-J0ZuzaHS
X-Proofpoint-ORIG-GUID: 2507LFEainoZJzuxgpH8rKb-J0ZuzaHS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01

> I'm not sure the kernel actually needs any bookkeeping at all for these
> generic rx spi allocations. You could probably just pass the spi, dev
> id, key, and probably rotation count (as a device key generation of
> sorts) to the user without creating a kernel object. For socket
> psp_assocs, the rx state is consulted on the datapath before queueing to
> the socket. For tx state in all psp_assocs, there is the possibility
> that an SADB handle needs to be cleaned up. Neither of those apply here
> or in the rest of the series as I understand it.
>
> I figure the tc ingress rule can just take the spi and dev id by value
> rather than needing a reference to an object that we create here.

That is how it works in this series. The tc psp decap rule (ingress) does not
make reference to an rx assoc ; instead, it should have flower matches on
psp_spi, psp_ver, and psp_dev. That effectively ties it to packets from just
one rx assoc.

So why keep track of rx assoc objects at all? Two considerations.

1/ don't accept packets that correspond to a stale association. That is, even
if the device decrypted the packet, it should be dropped if the device key
which minted the assoc's SPI is two rotations behind. For psp socket offload
that is enforced in __psp_sk_rx_policy_check() with the pas->generation
check.

The spec permits SPIs to be reused immediately after two rotations. So the
device could decrypt a packet with a SPI that is more than two rotations old
in that case, or if a previous packet is being replayed, for example.

2/ hardware offload. the solution to #1 should be able to be fully offloaded
to the device. psp tunnel mode will be hw offload only, and is implemented
in the eswitch with connect-x.

We could add a psp_gen flower match to replicate the pas->generation
check, but the device has no access to the pas and can't offload that.

Keeping track of the rx assoc means that the kernel can take action on the
"this assoc is now stale" event. Possibly by enumerating the tc rules and
either deleting them, or marking them stale for userspace to reap.

-Todd

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793052361;
	b=LEk1mqEtZGT98t0eW7LZ1BfRpSL2vbXN2oozhtCOcjxnzvacHGFJ0Y3pXVgfQ+iQkB3V
	 Jq7f35jC7VYrR4oYWsraoHBjfLh0SQk59NEzaRtuy68lNqtk8dn3Us2i42gUtEQwVJSal
	 3vw5iPsVaE+J5hn6pgthvHswsXIGW0+IoNAUQs9gSDTWJWAZI4MATmDBP554DrUGP1hrk
	 SkRBH8CbgwI/AU9jXSUws+BrTKr34ehJ1Bhxv4INXn88UiDZ/tS5JppUU/UjtvkjehN/w
	 oVmHBMtdgvzUUiJ8QMe1WAmC/6FsbIebhVaWdzxV+rTVckdyqAu32sp4kBkYZJOeHvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=z4nQTtfOhd8q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=;
	b=Gt8kw9Irwh8UOC1W/OQyL4wNvMOa1M/kW28rfxny0X+wnleYzo/uB9nt8Hr8bVsqI8U8
	 1LcIzv8DvER9Hc56AwKzFsm7diV+Lkq6y/9tZ1ejcgThSFxqzzRKsL9JZuejng6lHJyeW
	 Uqzx9ZPwF0RJdYXloSP+yFGgcW9W7KhdnSwEohEBoLfMpj75Ur/q6zUX4up2+5NNCuV7H
	 U81NuICOtJgzDraXMoff+5KTGn0TTIb9iH8ujeoK+2cZgLYfJAm3YoEMOWsNCCRHKlaLb
	 6WBKAWxAOmsLedXvJf7duXITInhK77ozidz3RWz+iaEkaAROrXoGLrZVfFX9QRb9a2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hlKqV8Du;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E2606A31B
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 22:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=hlKqV8Du
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69QImosJ3289819
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:05:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=z4nQTtfOhd8
	q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=; b=hlKqV8Dur4ZzUuKxTjP7YrMiIjt
	3ZsOzN/DdqCpY/o56SvMkVq3ZXuz+GA7bcM+/aPPz6SpoviGFTl/4hrkVTfjX05H
	0GT7EGWQj2EE0PEccBWYxiw+GhKrlLLc7J9afMut2vpHBX+bQM6qRxkTR5zRkbmX
	oSa5qK3hwZ9vkghNACrjtWY57rxM2wrBkf1P9KEau/9GkUYQ3XheuKXBd0gfttSu
	UqqqEN99t56wc+KwSZdPn/fNIq003oaGTjLV+M2+SjYPlgkNzqrgh9aTe+EnkyOZ
	1DqwCxNs9C1AFXQUxT8UomRIhtnGM9OfFoCNlDgfBKJ//xeeR05pvvDZU2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hgr5n5hve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:05:54 -0700 (PDT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so37204585ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793052354; cv=none;
        d=google.com; s=arc-20260327;
        b=UoTVtXirT4FYAfLL/bG8cFGaK51OwzO62FmouHgqZjch1JI6EJGnaAZ7T4LJWmQhSh
         MoFUPcuIwp6GCpUDlXVH25E3f1AsptoSQvaUFo/c/rjFh6zxQGmSyyGaWFWekiDeELXy
         MiFI6X8L1NtgQuRoPxwvg/oFNyMjAFP3iseQKdCjFHzwj2OakSwiADVicoKyfXCWpJhH
         mvPWjGcR19jyBOs/sN31Ka9NLfWYCSSJoW308e/QX/0fv0LgCfb6a8yzNs5FyHzQtELg
         LXeUIcY9ei4U/jm6+7/19jaakP/RhlhrG5lPIDu5wxr8jTToS9Oh2GsUvPQPmkp76Oog
         Av5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=z4nQTtfOhd8q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=;
        fh=sEIlTk4N8kQEGuVC1hhcvemET8oY+dwCAWceiKTOwIM=;
        b=YAn0feIxEvw+hFWRSeJjGAwe2egFrBrO5ssferqua0ADFlKJcWC6n4jhwIjZMDfkwj
         tjv4WitUIGC/xe3wxiZf61NdUVhslXK9me04Lb+1mPLxYoGC+wgDWJvTjZAM8KvDgD5C
         JLbHmwnrm3jM6lGdcEpmsmJ9kSgzzpeN1NFwNjGDDOwe+uAkGWBS9GvXstMuaZjvejBq
         yAQNdmnKd+bLhs28qkM15GzcR6GY4TtNERp1h9kfVSgRrHsOSUiMGMvTi0+2cIsB9ysJ
         iK0BUlwurppxsrc+OJ5BAwaQHbwICCYhjw8fv2bcdhAOWx4vJWep10nmozAIrylO5/Cz
         eFPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052354; x=1793657154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z4nQTtfOhd8q9VhT0x4dUvhNJ9D8OtV16AyYym6/9DQ=;
        b=WgxfTrsmhH6q5WXH5a1hDUbm9odsyw2TdskHsIp33cISlhHy5TineneLBwlHLEj5Yt
         zez+y3t4GjuNYF3V0q2cMl3flfdOpQOQGJyudT2MdZVLxfDHrY3bnl9jepxfh8sInlsX
         f3dC2wr59xH1Ssovw3a4Y+TtPzYzeQRfA3NviS8uZLVsof2iYiI1kWyxhtY0twJSNZVB
         2VO9jKa+zNfuB4IPStwZMI/UeOK6yXEkdxvGLp164HU41KnMhQ8j48FJhEAuu+vVZVYb
         6Qjp8GKZ0rqfzljlLAcEJKR93jDjJ5nm2+35uFBB8VGj9m8xWcboKTDBITwPd4z+KVzI
         WY9g==
X-Forwarded-Encrypted: i=1; AKwUvBw+tt5PLcJI0BNo/kBxYDhKU2faEae8qenN2cCRVlpvYwrpAwWL3Jj0IQLoG2rvxkW9ziHZwBGXvnmn4E5QNQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjwO4rfQpG+Twxq3bhsWK9TmevK7lDI7FM8DUnlRz8MWV+XMlT
	ovVR3lbYUN9j+T1b4gU+IcssomvmR2elul1b1AQBJZP2ku7Oh3oawOr/BV6lUDqezgYS2RcX3sJ
	/Yr0uR2RQUNCkPUOh9Q4RTgSnfC8aoxhBPV0tFjNntS8xgRoZjigwcaQsL0yNZIZOt8HOHXH6sD
	i0CGYCmck2mdRSm18uGjjYP/+RZNLEvFFqtwv52uNd/yE=
X-Gm-Gg: AYBFou2kEEUFoQoAjzn2ths0TbqvnPVsRlq440VNuLyrSgyxq0a9e3Pf47LoZVS87+S
	xDIYVEhEroYRHoRXtssUu038/APEx8p6n0mzbMu49dYsIAUCwb/F+clt75Gy4pQPy8HPsY2TArB
	B2tpEyFVhUdYCs0B0QtIDQB/jokjjFp9+FcKPJbXHcvXk2hfG6jy/YcvuXoL5yvcMgwDY84FFgB
	GxSDFpL9/QoH8tBMMCFZb1A4bFbcjsQSMpGI4OgVLrbTiqOSvE=
X-Received: by 2002:a17:903:fa8:b0:2e8:3d48:4d80 with SMTP id d9443c01a7336-2ea9c695516mr62602175ad.45.1793052353847;
        Mon, 26 Oct 2026 15:05:53 -0700 (PDT)
X-Received: by 2002:a17:903:fa8:b0:2e8:3d48:4d80 with SMTP id
 d9443c01a7336-2ea9c695516mr62601855ad.45.1793052353322; Mon, 26 Oct 2026
 15:05:53 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023234640.1459291-3-toddfreed@meta.com> <179288570143.3134.8925369868949382653@kernel.org>
In-Reply-To: <179288570143.3134.8925369868949382653@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 26 Oct 2026 15:05:42 -0700
X-Gm-Features: AclHuK8vmHsUIvz0IY0SMdSvsvG63AqCObkQ1uaVFzRtYuR6y8WvmQn7TcpGKDc
Message-ID: <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, borisp@nvidia.com, saeedm@nvidia.com,
        leon@kernel.org, tariqt@nvidia.com, mbloch@nvidia.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, daniel.zahka@gmail.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: QgeVDfVJLxbeADEcbH7iT6qMs_8gHXa7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfXznTYfs3saZTX
 r4s9f6QqM8OW/k0m7M6caWVLFd3l4tS1K4qgH3gHimJR7LDuhGCcxlgGRLFNvGaQY5PD1sQm3/X
 Nw7npdQEAMhHeEg7M0N01FzmQBHpWvc=
X-Proofpoint-GUID: QgeVDfVJLxbeADEcbH7iT6qMs_8gHXa7
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6adfcec2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=Pwd9bqppP3xQxChDgmkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX5DO1/zh/XuyN
 P2kC02s11aqmkHQU0HTEsM53y6qH2w2Mw5hKSkq1bof/69Aa9j4SCqjPUa70pDgpr517R7l2c+r
 /edUOOABUVLeXUQynTFODJPBNdQcr6mD0dUsbGI7tbZLCkl9u3HVe3JE5XaWYOS9xZq3r3v1CRu
 Os9qquimJzpkfKAzss/27jXbcC4adCm/KUUsFBGjVUs7c+uDuIp7FQjHJRZrVIGZNuzfoC3fH+K
 4LKbDWJfu6Ne60XoOLFqdxebgPuyDm32BwPoD0O6DjXjnf84nmsRmklJTtXwG2lFj1avtSAI3Ps
 k7dItUYCTVR8uLJtESIdA0+zYmOdDmvPaHYKM8+7iL0lVOU0Hj1tuhVZ7E8Vu6Q/g2Nag3mPSuj
 kQXJE2ckW6wVHgkXoUg69eXBZyJN3EANLNNRnAmOZc0S88Khce3MF7s3zK5997MJnpcvwxBCBGs
 E219hQCYWK4AndqFT5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01

> [Severity: High]
>
> The PSP ICV doesn't cover the outer IPv6 header or its extension headers.
> An on-path attacker could take a captured PSP packet, insert one of these
> headers, and set saddr to an address they control. This assumes the
> device authenticates such packets, which this patch's premise implies.
>
> Several of those handlers reply with an ICMPv6 error that quotes the
> packet. With default sysctls, this happens for an unrecognized routing
> header type (type 0, for example) with segments_left != 0:
>
> Before this patch, all of these packets were dropped at the is_udp check.
> Forwarding the decrypted skb itself looks blocked by
> sk_validate_xmit_skb() ("unencrypted skb with no associated socket -
> dropping"). That leaves the ICMP error path as the open channel.

Agree with this finding.

Ok, this puts me back in mind of the approach in v0 of this series ; just drop
packets with extension headers. Actual support for extension headers can be
done separately from this fix.

pw-bot: cr

-Todd

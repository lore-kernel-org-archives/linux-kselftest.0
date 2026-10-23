Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792776060;
	b=RFP+yrk8/P+yWuMBOvrpXInWWyX3I5u/C7Mv/lLyRFV7rGyK4UlbgfdFtnHnhBGUzhMH
	 KidUadTOZrqrTa5oUMjAlLjovBniJ9OChwXDzcAm4W5BGpwbLbD5c6STlVeM+D8tN8Kj8
	 7Yw5vbMV9tQYdG/u9IkqQ31f4sB+a4VVprgg1QLYSHqxuNMjXZDQmWsarLf21pgrZoywz
	 ndRHfNYSOHma1HheU2FhINF3/mu/EDzpQFaOVbZzyCy2NpohIYgueHg2rYmWdHZxwI+ZR
	 tOEMI5b3Qn3aK2WA3Rt8/bWiECRAKq6nOMiABkmmeXz+sSXPFWfQ54HOeUcMRoSkybQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=0nbb1+gmo3RWuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=;
	b=4xfsfe58Vpc8XMI2XKrdJmeA+2HeMWNyScvJZUoTm1N3BGMhyp9kApALLJBu1Fs3mg6d
	 CsJOjMsz7Tkx8XhHkgsaDD6+mG90KuBZnxl1rqsgxxuThVsB61k6OIKqUB/CS3jMdxkg4
	 flDlInl5e6Z/WBXgn8bV+4e839pvKdJoOvoRMeBYzVLRqYss4m4HlWLTu/zloni78uO1G
	 LpL4JaegqKq/0b62Pyvv0XfcBVFzA1zXDHFH+Vz6Z+ppZj0vIuUjJWxr9z/F5pQKmPPDv
	 IvdJRgki/ZzgULHDf7B8mDh/FX10nnmSqdIozN+xyy+8XoZtpInF3ozDh8KiUsJdDAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=h3kNNRZv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585FA606A32A
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 17:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585FA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=h3kNNRZv
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69NE7GAg2316862
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:20:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0nbb1+gmo3R
	WuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=; b=h3kNNRZvutJwWAllbDFrnQwAZTw
	LG+gBqrvftpvkVL2Dj7rqcYubAM29ajILxm6v6nsanzUkBIpg/GCbDS1qVcDXwm+
	VGaWd2n0sEFU2xw78bl/HyX/fYYAcLSdJnkYRPo27n0TzdrJWVk3H2xhd2CuJo84
	aIK+kKO8TNgQKua3fQkgSyQb2AtLi46S7f955iyyr6qeRE6rR8qU3TP0vZyDWSfY
	53asbrSxz8jlpPYUtbPkGhrKeW/oGOrXR7PrtXj/IcHFFTMzNlwUth43qkugZ/U6
	syPiY8YaLwHhXU0xXQbf5DUS9WaF2jSp1USV9GmOL+cNuUBohsK9vhSnYBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by m0001303.ppops.net (PPS) with ESMTPS id 4hf91tckb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:20:57 -0700 (PDT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e942b1cc86so12623335ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 10:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792776057; cv=none;
        d=google.com; s=arc-20260327;
        b=AGJJ6Va+QuWlQZASypG69FQQ/d4PQHIsumi8YYY66BsmtC/9zou4qHFRgJhz+Lwq+F
         xSqTZuZoq2hhDEEMqtaNX49wB+YNK1i9bURa1PcqGRU1x+CXGINz5DBzuqQSGcueSCr4
         IxY75L/BKJr9K7Aix+nauxLBiUp3krBcmRUZ9g+tZ4sF4qfWLBvRtBJ9pc44WBPmIv3Z
         At0jxNoLjRISDm6MeXYZa5OT4YWA0zCGh0efM8cl3fflRBjyq0qsxrbNMk6fWzIiIFhr
         g3WWarKf/C8rHWwTqgGPTqFJmwyt0aVNfszSwGkmzDEDlVsioEjqxovmdoWE/y9ZXDRm
         S2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0nbb1+gmo3RWuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=;
        fh=jjEzJgGZs40nyEk5OfHtdNkBwnfxDkP9P4eLbWm7dv0=;
        b=kVjJ7yvcxDHtu+6OW4p2yHXiQK76P/DMCs8DFIk9MMaG9Yefuk4B249PjctgYfFJ02
         qruZOYisY5cvG3rn9AiimVnekVIC3l5G81nDgkWrbRSQAnZDItu7jy8Cja5l/x0V84D1
         8bsG53OenQ2s7vcomQmgCCaZp6+tDX21XcRWhsy3QX58FKWEcER/FFiPxSeNeNZsfg5A
         tdPCmO8JudJ/pJxhO2OlmS+U8W1hOE0lFokAZuFUmAastdLrvUF1djPsOiiIlkRiKR+S
         u5JpPJO2jE7hiau3BqZRVqA9mvcHBWOaFR5gsrfGWTp2CTWiXLOmadYfCND0QN+famDe
         PTMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776057; x=1793380857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0nbb1+gmo3RWuWZWMTmbysNnHRUp8yuozX3bwCuD0eE=;
        b=21D6hL0QQe9qKjQeUptOKM3O10wEWgKOCBkN6tbZslK9hSagN9cWvfDAZXPk8VXuIO
         0ePFBZq9WFsZxcumOQhJyTM9OKD1BdqY1H4uLeEh2tKGdwgv4t5duu36g34ONGX+ILlp
         GzOgSbe4k1HM0DZV/T98HoTuSbYfWO6BHZaSlYWcwz3b+KNTZikpuZi/KzZmKsdsUj5E
         dJ27gwTCPxIUXpZBt2KyK30ExeRdZwvDcgYu2I8aMyTier4JJhgz2nBKoWJ+CKGl0G79
         zCSx4N6tow78qhHjUVBkfTWXVLgxiAlaV/dN0aK6UnACFVm9NRv/q9vMK1Fqn+hVcihD
         wp7Q==
X-Forwarded-Encrypted: i=1; AKwUvByYmgmevnGvI7E0uPLPMaaxeqhKnfB90ogp/28ECwoKAYniqtXc1OEuoqwF8aDEiNVeJguTHhS6AFlnyZUoOlY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzvQoh1xd5TFCkcjN3QshryGlIkjkkz5h7rD0oGPIMkWP+jfdr
	s2yOi73emZeXOo+3Zm4Zo2g5uMpv5qKa2XQ5MNacgCFuuyLI6tbilC5dixI39TjC0H0xnIszFtI
	WNJzInWTmCwuPSCculXj8MY/6xkTc8wgYvQrYD7PV1GM3QUJgtyi7vBw5qgj1GxpRkW7w/lO1iP
	cV6Lt0O6WGHef4YWHuR3K1f5gLBuzs/1Gv/PF7zHFEVOQ=
X-Gm-Gg: AYBFou3aVSudb/owxdD3wAVnxgMg9hYPPt/9oz1jZcsc7srUPE9Sh5FJvcLTrFdxKNx
	MEsYVpnEVUzBAF+fm/wX8LAlWA92yPU8F58XzGKMWG6y8qDqNltKsrRwjJ1zyGqm4ArT277wUdH
	KzsfIvoFAOlNCwsxMJqGOCbmDOz0CQ2XUi9KpwKqW0NL3rFjBho8AV0P+1ljRj+juzfh0jvUbCG
	rhHdQCS/A9/D4+pDxRJ6am3w5AVX8jz
X-Received: by 2002:a17:902:ffcf:b0:2e9:658f:c33e with SMTP id d9443c01a7336-2ea7ce435ebmr26441505ad.8.1792776056585;
        Fri, 23 Oct 2026 10:20:56 -0700 (PDT)
X-Received: by 2002:a17:902:ffcf:b0:2e9:658f:c33e with SMTP id
 d9443c01a7336-2ea7ce435ebmr26441315ad.8.1792776056075; Fri, 23 Oct 2026
 10:20:56 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022223014.556388-1-toddfreed@meta.com> <20261022223014.556388-2-toddfreed@meta.com>
 <DMC6H9OT57RA.30RKA7CO0856R@gmail.com>
In-Reply-To: <DMC6H9OT57RA.30RKA7CO0856R@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 23 Oct 2026 10:20:44 -0700
X-Gm-Features: AclHuK88YhWMifFuKF48zzEpiv1AW4dXYQLz0yCHzxNvKSvxsDASMAUa-8p8mZU
Message-ID: <CADh2yMyVZawNObS1WOjahqsO=XJjpwoxSFMXyc=kOzWhXMOc3Q@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] psp: fix transport mode encap with ipv6
 extension headers
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>, Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Cosmin Ratiu <cratiu@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: tQ7PkvIbr0cVES2aDD79MLA7pe7stk__
X-Proofpoint-GUID: tQ7PkvIbr0cVES2aDD79MLA7pe7stk__
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX8itmjYJS6Scj
 rtQSNC4KIPVE4UpXp0apTMv6HdiyKtbvLxGIzjnCxNjqNXjUxE3IytX8WOywK3LCjwZ+ivwbg0p
 vHlAdmEjrmN0+LAbckb1sBg6O40GjEY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyI25weIr7549
 6i+rDwTWINHUCFucwXzoIUv7z5iyLBGbH6FQn4o4/rN5l0Va6I0ATwTu/MoC/AGJWBdzVu2aCgU
 wyczpbgxBcmE1A6XYUUHQ2Kd8DugRjjbn4h2KrRothiH+9VGYeyh945ipYCEgEYMdCCY5Oajo/l
 mdoR47THI3TsQkMMVXwgGF3p7T21em0C7xurkidTPBA8Usz3Z/F7Arg/GoM2lOuHtn5vSvKMq3d
 mXulD/l39gTldRnA8dQdelxVqox5IG13u3jJqP8wL79cvyJ9OXWqVt/DeZtxwPGyvF59xxhN0vi
 9ZU27pBpuzTX65cWRisAO1PJ1GKfQPt2tAfA9r7TGHLguRP0suqDxopWs1dRaQIqkrdVYsr8Hs+
 6g7cF99ZqEVbWhYgXMAXn7CYEmpbEcoGMICSTJdGPY5XVm19TwvcmdWF0C9ba+hYjEWZrpPXVrt
 QZfgYQuxmWVsZMjpYqg==
X-Authority-Analysis: v=2.4 cv=PqUG/AM3 c=1 sm=1 tr=0 ts=6adb9779 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_78whYxrdx1mplLwxq1U:22
 a=glYwtrVRrWtjULxB9TQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01

> > - NEXTHDR_ROUTING. the tcp checksum covers the final destination, but
> >   drivers seed tso checksums from the daddr in the fixed hdr
> >   (mlx5e_psp_handle_tx_skb()), so this would produce bad checksums.
> >   could be supported with more work.
> >
>
> The stack should seed the tcp check correctly with the sk dst addr. If
> mlx5's lso implementation can't take that into account, I'm not sure a
> generic helper should be the one rejecting the skb.

Fair enough. In v3 I will fix the mlx5 bug, and accept routing headers, too.

Or if it's more suitable in a bugfix, to effect the narrower behavior change
e.g. drop, please let me know (ack that such a drop should be in the driver
though).

> > +             if (!ipv6_ext_hdr(type) || type == NEXTHDR_NONE ||
> > +                 type == NEXTHDR_FRAGMENT || type == NEXTHDR_ROUTING)
> > +                     return -1;
>
> return an error code instead of -1?

ack

> > +             rem = len - off;
> > +             if (rem < sizeof(*eh))
> > +                     return -1;
> > +
> > +             nh = off + offsetof(struct ipv6_opt_hdr, nexthdr);
> > +             if (type == NEXTHDR_AUTH)
> > +                     off += ipv6_authlen(eh);
>
> I was expecting auth header to be part of the reject list.

I will do more testing with auth header.

> > @@ -331,8 +375,23 @@ int psp_dev_rcv(struct sk_buff *skb, u16 dev_id, u8 generation, bool strip_icv)
> >                       return -EINVAL;
>
> If you send a v3, I think you should put the psp_dev_rcv() in a
> serparate patch.

Okay.

-Todd

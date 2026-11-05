Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793839672;
	b=2zqJKjCP9J5lmWPiEQzsvdfZuDMF4tm8JOX5fPlzx0y9Kz9tLJ6Usi4ZkKRcabEcNZ2f
	 CGlIvV+x6HnhXC/u6PIgXoIOrOWHe8Y/OBbc5JmEPWXP7KatA5Vb2ys2Qg2cNGvyBVB3F
	 CpHqi4pR2J0mBxu1zSj68hOYyFI/+aYUJ7tTcsZSruys+BoPn/q6qEiFiJEqsWPCJ2Rd/
	 jWpYazaS1Pu+k02csERv0plSS0ZCwCLVO9C/xQJXOg064+vtrBfCbQWq2ZdJMUPSIeRBq
	 fmXaHAGAT3GaD8wsscfz0U6Dln4+L9YB6n3STBHzAuyeX2HhmbxGxfyxKc6IeJOqtOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=q2bMGTlU38WOqEBy2BRm4WnosFb6mvI8Tp4cHwPDAPE=;
	b=VHjQQgmESPvwDoEQxaZxmVQBIuFm4DDUw/XtyQQ3OiCGNkw4dYTeKiuH1/5yh+owkuPH
	 iM5EZ+14VNGcUlTxf1H9PyjbrmT6IsfW/ZG9RR5tanja0GKNx9419bgHOsoV+8nzhhbPP
	 1R7rap1pOFU4eGBSs00cSVsCqSGs1CphgESIGbTGJKRWFPEk81xS4/b/HnPW0fc+ydR4f
	 1sEIFvey1OQ4Ceuxo2M260IIB/mjOyDFqaVGKtV/E/C03p4VPrZNF6FK9+Djm3fQw41sq
	 4uufhNQoXukxfLxldG9wC4+1s8GJlMHqNweGwBQz60f1qphURrmY3wmJQg9eASYNYew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=WOXujqGQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA388606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 00:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA388606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=WOXujqGQ
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4N2ORm239373
	for <linux-kselftest@vger.kernel.org>; Wed, 4 Nov 2026 16:47:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=q2bMGTlU38W
	OqEBy2BRm4WnosFb6mvI8Tp4cHwPDAPE=; b=WOXujqGQBIWho3kTZpwEYK+MQqf
	YZDPcu6SxbAWzCaJf6oW35PL8Q9BBvW02C8tWty9i2RfSiXdn5ek0kxJ/+iK4OS3
	ARMSIlRl8M5aMQWhIjAAk8gMQPdmf9DD4pUWWwMfAhMO4ys2IxXffwDcBIQrjFUA
	Au24UbQEVXURifRjWcVv1D+C09k6qevRb7nsivQ10vBVp7CaJKzLPGl5M7pj5PRU
	T4jAi4iaPdSKbRC5Ma/gMKMwZued6QuoirgP4MfRFFx0vEf39OnQVL3+IQXDGZGR
	QukslVSQ1jAw9Oa46o0Egmjm15mBmELbUEZaBxPqALeHQRJjuLBl/i+Yp+Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrb03t9rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 16:47:50 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so1253075b3a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 16:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793839670; cv=none;
        d=google.com; s=arc-20260327;
        b=pTxvdjmQa8UNbIHA8cD6vTQZEE3AETpJusZL54MlFMg/Hr1Xgu8+tkKc+WD8U7X7fY
         ffb4dVojLyHCtP8T5auFzwaU74kWs9XDjVFu5sbrDEYTIsHlyZLu6FF66fCiKcrwE6no
         eSqfLPicK64pBrwppQns7F33zN97WuL/9vL8cfEQH6rq727jJEzz5BqdKe3gLHL1sCxK
         X1d5KpyyfQhhprShKFxzSi0GEfQvRSKXG+B9mULe2lYj94cNiOaIqhcl5b9TT5UpPrDn
         65y786BiHB+GTQH5RgDYXo13nejIU2x43FAauPhFyQuK1YglthP4HZwriBXMVajF6Wsw
         IWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=q2bMGTlU38WOqEBy2BRm4WnosFb6mvI8Tp4cHwPDAPE=;
        fh=EPIMHnSw7/radGcx8oetORBzjnMVzwXzIfsTnFoKycg=;
        b=DgGe5FWGtR9hdXXUWprQVInDd1aaDMNOvvbHyzaR3Uhkd7MS/mgLuHkKxQvcGJskhg
         wNGhfQLDjMvnbt1icWbQLzZtGqZdp4If+B0PENovb/ZP17bkuWMuEL3d+xj9c/jxG4Ty
         QMNmLdF6+4i80/zCbn3UBxWOrGpQQ0EevCQR5UOO6miIzMG72H/WyG4Thv0iWNH/ei/F
         wWWf3zE9qHV3A0os7n9ZFjDA8jqzKd6BmQB9Ay4TEmUawZ0svEEr5//OEi5s8er/vqSV
         eRIjk+PtbMUxiovoVFcN9MWnoKFlf9Qc1f0kXjtmq4pjnPFPr4hcqvpSC94iNYGA9CAg
         kQ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839670; x=1794444470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q2bMGTlU38WOqEBy2BRm4WnosFb6mvI8Tp4cHwPDAPE=;
        b=J0EwRuh4E/hhMGE3eBvfp2SfWx7iw3M20nYzjUI8IX+d/lYHie0KD1cKFtfZEVsK79
         HrDEFJhC1qjyFp7xM9f2TkkogPxBNQsrJSj2ylykm99gYANfLV9ObjgzPTReR76Anle6
         W0SvzAZ8ZtDh72e/EtpZc6KMhcyPXJmtvqM3d0HYx93ZpiTA6GhptCKw9E/4aZrD4kq8
         o76EHaV0rrGm0BfjnYOrNRtFfVdDlS4LkY/XQde4WR+z9SGT2sP9mmtqYdX18MZXnbms
         LrYXRAjtVbptqfAs5TS9BvJOFZzoF0pmJiYClF44pHb6LG2mGWL0NhbiAsjRjWY2l/JB
         LIgw==
X-Forwarded-Encrypted: i=1; AKwUvBxnVlXVz0juJu8+Z0PLahAEOjV2jg4L+mTu/+dmQFsJBi7yeOBAoOKcA3HHUFdrvirda8T3aK99YxPfTHXskiM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82Z22w+xJVwlFNKGKUvnxxUnaI635oivhG4qf6YNv4t8pW6msk
	XuP8uS8MqPFJh/XHY5LA8pspvJupnuEcnV4wAaOJo5DfmheMtpDk0f+32xHH/Sn/trr4qHEk7jQ
	uox3selNZxgtiq1aSLYKXJLPSN380ZvAegWUZP6GxfR6VTS/mpyROrmuVmWWZcA5VGtbPcrs8nk
	jM+sCWr5dwuLqavts5Ym6Xc+Uudyfv9t+uXHQUSZCfJbY=
X-Gm-Gg: AYBFou2GBkkEq5AbVQ20k5W6uzq5oXfAxbnUMkVb0vPCFvYM++metsWiJRDvwLf49s3
	pi5m+p3NJpJKieqrDKsDkrASh3wg6y+wBbLVNdhT3TLLw8s0QEWQMAiNORd4cZ/pjaQjhZM7S1W
	B4v6SrJGcCT055i9jKclUhMMp8+GY1LgALuwp+7gDsmlUSsp7C1eZXFSRCDJzB6XGJ558qKQhmk
	iuuDiIqt5RRv9ztygPYh22MIAsHJ1xb
X-Received: by 2002:a05:6a00:4fd2:b0:8a0:3ed7:93a0 with SMTP id d2e1a72fcca58-8a9bfbf0a0amr14775277b3a.48.1793839670189;
        Wed, 04 Nov 2026 16:47:50 -0800 (PST)
X-Received: by 2002:a05:6a00:4fd2:b0:8a0:3ed7:93a0 with SMTP id
 d2e1a72fcca58-8a9bfbf0a0amr14775265b3a.48.1793839669754; Wed, 04 Nov 2026
 16:47:49 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103001143.246081-3-toddfreed@meta.com> <179375308359.488856.7259635335257893530@kernel.org>
In-Reply-To: <179375308359.488856.7259635335257893530@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 4 Nov 2026 16:47:39 -0800
X-Gm-Features: AclHuK8T1WOJzYaMW0E_U0iEs3j7pEqPqjrR-Cu0O1wmwkj-FUcUMKMe_4oDLbE
Message-ID: <CADh2yMwzPWZa2x-9DbHpSsn8HbOwwwAefYKS4sPxFWOX3EmZ2w@mail.gmail.com>
Subject: Re: [PATCH net v4 2/7] net: don't fragment decrypted skbs
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: -T3BuD1s9GIcyOcMN0Ti-hc0MWhpsUix
X-Authority-Analysis: v=2.4 cv=NtpE4MdJ c=1 sm=1 tr=0 ts=6aebd236 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=SxMiDcZ0BD2t3rXD7HEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -T3BuD1s9GIcyOcMN0Ti-hc0MWhpsUix
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMiBTYWx0ZWRfXw9tcFzTh7YRY
 SFqMI5oCvtzdLOv2aPpreWxF3padbkg/K9zXosNAlhc79HBNO1ejNhDY/heniIo/gUcJk2rjq7x
 LO3s5AseafYtnuCut5mrl4b/FKRHRD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMiBTYWx0ZWRfX95jWuiL7OYCF
 ZnyVxWf+uwr9gjyn2KMmAlhvuxfJp88gSQSTvEdz/7DlrsF2RBQVdckTK1vfQx+WtZEYPwYVckP
 k8Zm5rhO12abaHaugatY16fl0vm9TsMRGOqIwsTV87GJjvL4NGgYtMtSN2N74+Q7XF492ORRcdE
 daBd30dMry0av1USBEFecWXfseI22HarKdOT51knNUO5/RytMxr0Qaxmq4+kZbBv6bOlxTRlJeR
 RRzwh4VT/wdnZOaUfUr893wongcHTaHBMoE/QjGVsGioXA78bBAzWBBfPpdSlCO8dYNIlH1jwbG
 2QQqM52lg6QzjlJY9zorDss1AD1FbkucTt4r5xvBTcPEVCH61ml7wG/EKSbP6bSucVTdvfU6ZFS
 Ltnfm/xyqP6YMABpXNeIxBby6t0vDKIXY07nudE+l8p1X/dEsCLt6YodNLzaDi2quGEcML9zWRL
 BUEENExDfNPGxFZKbNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01

> [Severity: High]
> Does ip6_fragment() need the same check? The commit message says:
>
>   an ipv6 tcp socket does not ever emit fragments. ip6_fragment() refuses
>   skbs bigger than the mtu unless ignore_df is set, which tcp doesn't set.
>
> TCP doesn't set ignore_df itself, but IPVS sets it on locally generated
> IPv6 skbs, for example in ip_vs_bypass_xmit_v6() and ip_vs_dr_xmit_v6():
>
> ...
>
> ip6_xmit()
>   NF_INET_LOCAL_OUT hook
>     ip_vs_dr_xmit_v6()          /* passes dst_mtu() check, sets ignore_df */
>       ip_vs_send_or_cont()
>         ip6_output()
>           __ip6_finish_output() /* skb->len > dev->mtu */
>             ip6_fragment()
>               ip6_frag_next()   /* alloc_skb() + ip6_copy_metadata() */

I stand corrected, and I have reproduced this.

Also, I think I've figured out why my local sashiko runs aren't
providing as useful
results as the ones coming from the list.

I was planning to drop ipv6 fragments in the net-next series anyway ; I'll pull
that into this series and post a v5.

-Todd

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869071;
	b=gOIYvunnrDD9VGLqrTGn7g+aSHoMdOYYgK+hAzFlX/pLKjZVBMomF/K1J9y8MD5lwrNQ
	 vJhuxeuISehqaxKVaSGxpxv7vVx6LYJ4d/x8EMSt5ZXqNb9LXrnh+70gosXtow9vOqO7W
	 7WBX+k4xoJB01os5EbFxjyMyev+xB7RehYj0Gc8UhGL63FXadsLb0Khi3Q7ZgN60c/kMD
	 cPUyPSFU9CZ6F0Ehk/FQ7cmuiDhNcbyL181fLsR2IJF8uHE543DX5sw7pR4ArwdpB/Cih
	 8SQzYSR7E+qSm3SrLu9NkYLkGBS2lrrtN8y6b8dJYXQl7xHgFcKRylID3L7iCAF0FWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
	b=Lh/+aKihsZ8X+Y0tjGvcg2QywtpIbtYtjInOkEXi8eanyxm0LUchEuZDpG1LFcfMfsj7
	 wuunb7Uhpc3Wu8gPjsmx3fyC2b+zwIhDgnAUMI7MW3kuTXjoCssNATCuCoRqyTTm8O1Ty
	 iiTWj29/3NswTPySX7ZIyLj9gR0J4HoNVCMy6fYtjyuGcv+b6Tyo7n0+R07kEROai5gXE
	 RmLYhksGkhPLeMKhStcxIITueMp7ytFOaVBHz/IIngv6XbYRdkfYwgQ48lbRmF2n3cLNp
	 7ckguWZAjfLVghOK3fCXktmJVZiE/MZrIYgxVJX9OIsf23wbk69MtdQBEqg2gQe9Ung==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ZJmfX2kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C03606A32C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 22:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C03606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ZJmfX2kj
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGM2IbW3418856
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 14:44:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=INFJK33SIHc
	1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=; b=ZJmfX2kjDA9mCjYcEWXG21PTCxY
	8pWD9UYuB9/bEG5X/xJVrB7ctZo2WbDuUjwXqZN3+bkGuZDmJv8214nAWTMtQ+dF
	EoI5wPI5PMoO98C8N04f++csqKd3F+A8ZyXCtsrvB9CX4ebP1BEIKISJ7grh/bAF
	evs5i5HpMFVgZ3xEOielhYwTCuuuvPuWvAnkRjfbFotfYsFR51PuABFfXlJNmB88
	gygC/1iFR5c5vLvxmk7JV8xiL51kXKt6U0eR2g1wtGkSGGqkxbI0OfXNP6SbH5En
	/iokbf7NAOZVM08CXbqZdAER5ibv5CdFVRdGagVtkULlPJVLeQH8rBW3ApA==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya99sb19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 14:44:30 -0800 (PST)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so13428915e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 14:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794869068; cv=none;
        d=google.com; s=arc-20260327;
        b=aLN1bVxtuv/XWpl4QPHq7HZGbfKTf5QvvQArYfHaUKGOV9mjaHDe6QNW49/bo/hbfF
         G/w4B8yB05IkOQulEoBXNEZaDnSorkNJyxHeqlKBIDPsPBzc6K5QLRA8R6Th6Foz5wPO
         3of6yw2OkaXMu1j8A39JiFnDTZaza67qeU6GCgyTslWTnq4Nzio3d2Rvl1bV8IivIP4o
         PordnAYjyNuc+I028RpKjnmqDU3DquNnxuJMzqdF8dOSB/j8lCI8zQU4CUyCjMW4tYxA
         Hj94oXDXUmoEHq3Nh9CjTTBzyMk2TSJ6JA+r79TonNaMbYkFO/EhLYf1DiDaGdRLqYUq
         yxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
        fh=1wyajaXsdfWr9x/9wop/EIaQu9jhUg2eLhiyWAT7fyA=;
        b=ZKw2QY91nUttcaP2tHqjZSkYPDhS/offkv79F3RXgeULG5Fu8ZJVNIr8IEpwBimyoQ
         DPKSa9J5lCJPspdWmwMfe/hq7FZNGLJbWlXBG1c/buEwWDdMino4s864SZqPUBsHKNSJ
         4QP4fBlPsGshGWYjmxOChfiGw8Hs9jtvsNJMv65VhYXu+miR9Gz7MBN18yDODL08Cd9d
         7n6zt3ncwVAEUQJTnZFk47tORyQLUDdvfYI2L/o2nyedkFV7keUfvSxhPjQN9OA5fZMl
         OqGULxapXf4ir+8TS90ct+UAPRUiJQXhS6gkABYRKJlI0BK6Q+Y5C74eEHY3muI5zcSc
         Y73A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869068; x=1795473868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
        b=SzOUIwSxzyqZByo8iujRGHX3N8YE+GYyW5PWXyf7JS8wgfjTGJ8IzFoj2fi1csHQ3n
         Kc9MgmwQLvzJMf+4EI+R1ZJpBbd6omdlXVzGUYH+GptBdaVQnhWxg9cdJ1edDwk0J7tH
         z9/8BVschCVLPOIH60J/Lrk8WOcfrqRNPsmmdqqfJitj+CMVesg9j379G2vPQ/IXDO3H
         u726hDcWgtQ/6yAHI4/DCS1PHf3qIRwCJq5JXnyUPBtDYSEZxtnYX4UXueeTXMu6/Hsm
         lqiFpJ94Q1odRRgPtmwEs1UvybvmZqujQllpfCQHU2ZmkqTR6X8voYt7RDfRzzEaG+xh
         mr/Q==
X-Forwarded-Encrypted: i=1; AL+hErF0IWplI/Mt9neJb1Ffqe9kKyOpHILZvP56+/WYTRJDpHOzXysJHoqOEZ4daMwyT9zaHd+9kRTXcre9jY3Pmjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vA0kAxsPUWhY6loXzyvy/80jKrUPbVFq9p/9dW0vsMAAem2mB
	5jD7Phggnn1dwtfwz+cA5m1/d+vsU2rYGmEZEhULNHtkCKMOhHER8L6kg9KNzfnu9oARTMvZKzH
	TD6WtyVhOoQWYFSdAYyTLHYBoQg2XTnDFd+ypPTM9H7XOIn1Mawtg8KGjVsPTfK080Hcl7049rw
	ur71trXYfC0fkNJRavHO/ieRwHNHaDpvLCF3yVs5yJIg0=
X-Gm-Gg: AYBFou0QSpsGfUC1bhEAHcXVw52FNjsN3DzRD48Rs5iVz0Ya9FvDMQeIjigeaRftf20
	gWE/Fqxs8zo5OT0WZxiQWDqxOiFckw9rnl60LsLMoBA3/5zdcKQXUPVtsOVXbxdn8t9hJpPyKmh
	91ubUbnIjgjEXCgocjyat565Mlyy6Mjn+ct5VAIxXe5OjP+D3P2vHWNYmCNSA+M1nRvYU0yECfI
	vNI5CQeNzQh9GcShFcSgGbwm8R2x65cftfO8ZnWmjGhh4xAGIo=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr192032305e9.26.1794869068639;
        Mon, 16 Nov 2026 14:44:28 -0800 (PST)
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id
 5b1f17b1804b1-4bb5de1f262mr192031935e9.26.1794869068266; Mon, 16 Nov 2026
 14:44:28 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-1-toddfreed@meta.com> <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
In-Reply-To: <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 16 Nov 2026 14:44:16 -0800
X-Gm-Features: Aa3M54rDJg770IRtFuGEuQTK9_ahFKlOSCDnmFon8USiCtNTDEcNPoAY-z-nWxY
Message-ID: <CADh2yMyLkoDMQL4pQphobvbBcjtojArW8URXz-7qtr68UvjQ+w@mail.gmail.com>
Subject: Re: [PATCH net v5 0/8] psp, tls: don't send offloaded contents in cleartext
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        David Ahern <dsahern@kernel.org>, Dragos Tatulea <dtatulea@nvidia.com>,
        Eric Dumazet <edumazet@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
        Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        Mark Bloch <mbloch@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
        Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX92kQQk8NYrrv
 bw83IIIS96uwOjnS27T6/ID0N0I/uX+FWFIsEL2tpzvjg2SXmRWHOa8lcDmgSflhBkg1l4IxRL0
 UzzD7WCyR43TAa8E3D5ewM1GknC3JD4=
X-Proofpoint-ORIG-GUID: MNpyX9zDECA7Z7b59RUEffKW8fhLRXMt
X-Authority-Analysis: v=2.4 cv=ZuN4uN7G c=1 sm=1 tr=0 ts=6afb874e cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=eugDcP6XFwV9FTUBbroA:9 a=QEXdDO2ut3YA:10 a=Ng9YvVcppn9CIdWre3nD:22
X-Proofpoint-GUID: MNpyX9zDECA7Z7b59RUEffKW8fhLRXMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX0TlMfHfooAXs
 hIRga/fZFerx5u9bntAwOZF+s8SsdLwYOJtcrYwkBunPSKw0wQeUm9F+hsXWQXAEMmLDM03RYC0
 Yfrjzt8bckaZ4kPkkxLfrvQSDLw3gJY6V9/lI4v4Yrv53VX/nbwu2BY1h9mMzLGe1rwiQGlbR0v
 9gRKIk5K70k135ZRd2SAU1iXsoiHRIhDzo+1yYb9HTtDCWNblfDUL6OxjHfnBLAjpk/D0cPQgn9
 XAcE/Rb+W4xac0XHPgtjVLx56BWrMfvBDy2fC4zqHvriFrAmQiDsdEaGnhF0/puFebX1DX+Habo
 MXBZ93ZbfGMLwMHWL597xzex0Ceu+6W4bGTzYXpV9n1745Lp85pVzSS0OotmRvLLD/movnQvaou
 atZ1tdUviUXE+JJdKAhFP1FVI2KgigkjChvcgnGeihQDcU3uhgkLq5kMwDqUQM7DaXDZRtPTwvS
 sQMWJjrumKumNkMgOEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01

> > v5:
> >  - ipv6 extension headers: drop them in psp_dev_encapsulate() again,
> >    instead of in mlx5e. it's the helper which can't encapsulate them,
> >    for every driver (netdevsim sent them malformed). unlike the routing
> >    header rejection in v2, this isn't a device limitation
>
> Can you elaborate on this? You're saying encapsulating with the
> extension headers present was working for mlx5, but not netdevsim?

With ipv6 extension headers, both netdevsim and mlx5 send a
malformed packet. mlx5 also sends that packet unencrypted.

In v4, I had moved the drop from the helper into mlx5, because
"sends the packet unencrypted" pertains to that driver specifically.

Sashiko pointed out (High finding) that the "crafts a malformed packet"
behavior is in the shared helper. So I moved the fix back into the
helper for v5.

The routing header limitation I mentioned there (which was limited to the
mlx5 driver) is fixed by patch 8 in v5 ("net/mlx5e: psp: tso: replace only
the length in checksum seed")

-Todd

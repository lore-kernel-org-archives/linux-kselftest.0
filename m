Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024002;
	b=u6WtplzPPx3SQkFbDaABY6MKTNtPHQDXpN9TB7gwQEY4xM80tOKKfLx3LnNLhXS7pPeA
	 5iQx2l+uXlmFodZhgkioYSJErTodoYD710vfPGRSRmwYSxuDj4IBD4xk45367qDOgtEmA
	 3KQjR6wiDl/2cGckJolpSjn5yL44z01AybCPgWgiTzJ4fuYSPaop7nDFq1o/XTDPqD3l+
	 58HqPaVhT7dRSv6ycInbptGOp7JiNl9SjXV3W2QauVOFkEVnXZ7I/8P+y7MXB2h7F5Jjv
	 8O5YbKiy/G7jk0GQ1JdVAz1Rl/9SGxMxK+IOzjjKnf4zplOp+TmK1NdV+VLblf2XK1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
	b=3mZ984DN8JQSwb8C5cMytH7NkFe/c1Q/Xzwx7kUsLEUM+IjzUdu2d3stN2pVFirY4iL7
	 7432cOW9gTHJh/8xVDXVqqD7T7OuT0m+yVAqKBGaL6KA81knfwyua8nBca/UXmc9B6f2f
	 5/1gqJnR16I6kj3Fe+cvfPshKhbzLtgopwTv7J4BjkmcF7M/494PuOqLOrFBAmwCF8h8/
	 WRsg38uRSJ3Fr2xN/YuFNav4jixeYS+8aBhkZMuDSjBjHn2NlsqByeBFdUXmV/5f1pnJ0
	 zX3wmpgTfLM+7vmkIcQSltExTm0VkDBRePbyOA4Y5WXDpLQkIv/JMBV1D/TWrj3ZDpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFDD606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFDD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=mR5cWZhH
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGKYG624346
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 09:46:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=3ykO91BHuXI
	Q6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=; b=mR5cWZhHSGlgX9Kp6sEX3IH0+vZ
	7DhjCpS6kNifZvDX+8X4OeETq3AcTzE9isy0aS2loX670ry+7TN75kVbI8yRo1Q6
	gq+x5l6yhhuU6Wk3IRlOTXzEW1O8Kj3CPXaW7nmZ2iZTsfulilCriD9DhvSNbOFV
	+LEfsYSD8WgJDdr759A/H/ZR2SrSVA+o6i8qGD/4Jzx/vvk0c2DA1O8WtVgovNWz
	mS4mSF17IRuXojKZUPJgIbCJz3yts0xln4eo1+Af/NfhEOcjMVu4kVfu/pGgrgga
	CqMpmoyU6vuiNbRC90iCXLfbCcUEM1uT0uRPofW0D9uZzMwYVDSoS0KcRNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu5qf73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 09:46:40 -0800 (PST)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a079256596so1036084b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 09:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024000; cv=none;
        d=google.com; s=arc-20260327;
        b=PASxGkkFr4qX/MUte5nsCP8Q51IYjoN3KlOkzwz/gQeCY32CO4y6ljcxGGi+qTx5C0
         Vv9P2sBUfZJ+d5zdIDMpP9MJq3cCnvgWnMZi5idda8h/K2HWx2+ZLdNmfDk6rPtFekGu
         zvQTzVGmMkmgXNnFKmB/04Ya+Uhs4Tg3tmGxJCj0pC4x/ctY1vpA+3olO++TW7vBmQZ/
         yCjTay1cIxF/9piU3bEdFAuSx9yztMNDas2YutKHK3cajCRhXRuf4NUaegfAOZdWiA6e
         6nraweF8wcq6eJeR+AXj8VfI9Z4/TL4OgIcrSeGymSGwYNoJGp6dZ09XRSTw95eWW8vF
         2GOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        fh=EMFuuK10URBsSCl96ZiJoBiTDK1UVXTD1WLBk3qXhXI=;
        b=b/43m/VvEx6IOs/ol6MmdgK008ARJ7jMnJUC/vV7xPu3qosle62icRseZsxZrxPyi6
         EMoZJ/8Q+3eqmv0esiJfhRc02lTBmfhN5UEzAeVB49jF7NYCgLDqBjHz/KWfJv5hrcN8
         ICDjDrpO7hm8+SfmW/DOnfaU86ovNBdt+sZr4lkkU9Ff6x9Ss+4quY4kg8Fz1dHhtk6C
         yC7DV0sPB5fZmKKxd7+NJLvTGz45h1xDu579wyn12eLMppfZVJOlSbXv7MWGPwZ1o+pX
         sNDsv4zRiQ5jQkhCUu6qOBBSS8p0/RxSCBJKfXGqsGFNTLoXt925RUXgoEIcZ73F5ZzY
         dZug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024000; x=1795628800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ykO91BHuXIQ6tsZKZrYbUoukzNZTCZ58wQfRBP+nBg=;
        b=WMPL3StGNOMs3QF2UPgoiC1LBVw0Knq7DIaA/MKnjzNzIG69eZTumLu2U6RDfe0JSf
         tXryta8fZJOFI47zjD7+yynvIBb1gv5L0anFqd1bsFxzmy3T9GTFMmkuh5xaLH06O4Nk
         +lO2YoumHk9Jw7hRTaCDAWHYBDAwvhLw92ZuFSKqrq6rYqK94FZNuLyjEBoKTi1oeJmt
         qkE5IeXa3yw2QOSg7Cb0kdMTDQ062CNO1cI61AsEQk4PF+BRlj3SvL3HkDihztP+u/4L
         90KExNikkoVdr8K1XOEuSrPi9ZuzlfXWOblvSfGCwZGWrUR5O3klogSx6XduT4s6vca5
         yw7A==
X-Forwarded-Encrypted: i=1; AL+hErEi3V8bB1bBtzPE6ZXLKrmPMggUsQtbAHpuRe1SIYUyMKRK+FIWOwNl0/iqKpJonpINEb4whI4eBg/ekR8JuOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d9Bbux+aChg7vXuJoIzEoy3woIdMtctntuNT2D1aBoze4R2mQ
	1I5GTqAZPDjVXCLZhOHNzYgQwgNFwGjjhao6aP2Ri5E/Ewvl5hSaI4B0hctCibg5fDmJ+WEcqmk
	LrXVB4xwOTC874FZjBqMJ9Dv9AiUfNJD4uwWkX1SO4SwtfcetXV94sKmEXIT/CXjQrx/HOcp9Rn
	4rVCs5xnoiUe5UoM6pJluFmhSwPvQXXo4MhgXgqHaw08OQ+60+7OA=
X-Gm-Gg: AYBFou2Yw9+EiuojU7KY7B2HJjFCK5i888/sDabn36wNCHEvGeOC/oddhu2Gren56md
	Z44FMhulBRD0HQs/hs93KJgvbSp6H8Ee6eB9qlcL1mTdZNmVocNA14Z7xtZZLx1DoPxBKQK9tfw
	qCxJxPWE30/ko5ll1Ay7+P7l9j7GO51bA7AF/wABb6v2Ej5+n1hPqXnu0jpWKQ3FEWPkABVhnRx
	PLC43RNvv0zFyruL+d96OLRTPcy2MS5
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id adf61e73a8af0-3fe970fb016mr3350995637.19.1795024000242;
        Wed, 18 Nov 2026 09:46:40 -0800 (PST)
X-Received: by 2002:a05:6a21:7e83:b0:3e2:a849:64c5 with SMTP id
 adf61e73a8af0-3fe970fb016mr3350979637.19.1795023999775; Wed, 18 Nov 2026
 09:46:39 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-8-toddfreed@meta.com>
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
In-Reply-To: <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 09:46:29 -0800
X-Gm-Features: AclHuK933nJ--reKuON_iU7qOJYXtOh-j2OhgmEp3HOYoG1ZpPxZFsfMEYfL2v0
Message-ID: <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfX/ZnEaiGn2970
 Nhrnl9yLrIHCB4H5unX/c/gxVb6JMO96QP1//dtZ2eXn2KFUz+Nx80/Htutw2dOTgpytVKrH3BS
 m4SzNY4HmOZpSjZDDA6ISf/HRxmtYd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MCBTYWx0ZWRfX49aNt1qEIEqf
 7e8qUs7Nr3b8DuouvZuUxb3KQQqXPVRGYzwf6dbiZAeKrY9lQi+oNAq1+j7kv+9/tEKzf0KUK80
 Z3TsLytQBNBhVakapUHjv5aWWr7p5Mvim/IeKBb5f3mwYXmZnJwdp/XjsU1xAYwcAGVrX3Bpxi/
 3KbV5Jmt/pPSVek7GujUYnHk6CIipfMp3y+MHyiV5uHifrVkgGoSv7t/juDLwMcZNWjmSYlv3Sp
 QDC3e5f2urtovfXDnO3f1OCvHTcYf0hapAAFfkkrc0ZMbNObazUFW2Zgs1yyHxIGKfi/czkDxVj
 FTNSp+zarjNIISULJBAvGtzkmKJV/GAmR8DKeUemANjTVlz2LRHmqkdO/8Cp59VoAVeEHNHKxlO
 aym0/4L6luoR4GtWqv/zoI8aRj6Xljp+tuXYWN0FKOyUDYhLVuSwdcGzWDH12Kse+0m126y8kXj
 YJmRcJ+V684ZG71zFVg==
X-Proofpoint-GUID: UUNy6BXmfrO-wjtgE3iZD9eiPSlDpjeC
X-Proofpoint-ORIG-GUID: UUNy6BXmfrO-wjtgE3iZD9eiPSlDpjeC
X-Authority-Analysis: v=2.4 cv=ftRJ914f c=1 sm=1 tr=0 ts=6afde480 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=XWTshytv-yXGdKsk3gQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> > +     /* On transmit, decrypted asks the device to encrypt the packet. Sent
> > +      * to ingress, the packet would read as decrypted by the device.
> > +      */
> > +     if (unlikely((flags & BPF_F_INGRESS) && !skb_at_tc_ingress(skb) &&
> > +                  skb_is_decrypted(skb))) {
> > +             kfree_skb(skb);
> > +             return -EINVAL;
>
> This check should rather live in the bpf_redirect (and friends) helper e.g. after
> we check for invalid params, etc, rather than here which feels off. Also, it would
> probably make sense to refactor this condition into a small inline helper so you
> don't have to open code it multiple times.

Sounds good I will move this check into the two callers
(bpf_clone_redirect() and
skb_do_redirect()) under a helper.

FYI this patch was moved to the net series "net: don't redirect
decrypted skbs to
ingress, psp time-wait validator", so you will see this applied to v3 there.

-Todd

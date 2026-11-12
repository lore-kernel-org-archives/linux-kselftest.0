Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794444717;
	b=0QswRA+pZgz8+l30TD1AnrI3cRutiCJ3RBDBa0tU/oSWGJ6Nt+JeeVymYC6lTe0EHeas
	 PtTC15K5NZaUJv79ra7CD4FQreNJDSlrJfiWPkKXU0HXb216lRvRZ/Fjn3sttHIVA98wh
	 +lTaFsRE/U1HCEGxgOFdGd5eSlBUjEZzm9bOQebM4pS6262adbOll8m7vCAjHV9hViPmp
	 HU58JH6PCr7PbCH8ncGNq0T3v8TfaM5AeOFqo+213YlyXO1bDlm3U+EiA3iqd3ZupTGlD
	 1yZegoE0yl0NJCe1p4Nd/COHA6urajdsr6VYyToiVBQz4Mk83hCGleqScvxm8+7lT4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
	b=y6Q12RBpelxHAppQcBny20pr+9PG/n3Ma990BtxFu4PRmxQxRg5Skf4gaLRHpt+i8btk
	 NVKAJAMAgV5z7FSacUfp71Hukr8XDPYRzISP/XRDl6YQi1aRiEdpqb7iyhST885uXkECC
	 TtiehBVMwOS9gggUhmXI3am/XOZuJ8a/YTQsW/XomXVkdtcTOPMT2geo+KCtstdyyXBou
	 M60yT5uFyJt1UTOEv1dQ1qdZFdLGfNjh6+0Wr50BkTQO0vcqyVhf6n5zHM4QXVLV0Hmnt
	 Ji/hXLPIE9o2wijrbo5FT4C/r8tOAwXM6ySUVR5um86/B61Iy9vWjNBiKCMSHaCE3VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="M9reJI/S";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D518606A324
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 00:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D518606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=M9reJI/S
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC02RHS1497824
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=COvz1LYfsfn
	PEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=; b=M9reJI/SbRv3KTUBSw1H39UYEB+
	5lytBhF7hV4YQaPVXjAXypBnalL48KDk1A1rPKkW4JS7QlVjoHRcEgxDsnA3DkFA
	V060Ck2jnCyXydM8YqDn8C+78ia42U3pbptfzsZlVy9Q4snVD20ijYvY83yoTAm8
	ocCd0aFLyIXSlQmjSjI4EMdJy/wmj2AUKlRJZxWjN0PrKyVpD34ID8GoMpx8amwx
	sUFDPaIZYs7/+VMoJ2ms1f1pJNJM2ePMvINLR5wuKhj4NwbcNnaqKiw3F04xD0Hl
	fQXX3j31JGidEqXUi2+1MYP8OtMbJoF6w9Rm0iCvm3rpqRXC98O03u3+rog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hvaudsrt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so319695a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794444715; cv=none;
        d=google.com; s=arc-20260327;
        b=cswhEE6wtwcmtf3N3SVPHn/X3xR93G2o+Yx3fwIfL518RGloTZXLwZIHGtERxvHiVo
         iKRgdgoo5zjeADyklynYm+pI5nywh7kI8lAUlQihx0y1qoW/WUguu+S2sKyTSbArys8a
         ZJo+Y6+SPL5Q0SlkHfjIIj1o+mVrvmLwFJKXglFTGRI16AR3ovQUsf2OX2L+RrXgRIqn
         Z5SacqCBvAjm8gznuZIfNUgmjM8kpjERuHB5DIXK7zE288jz75MfYiAhenQyDI4OA0wB
         FglIzK44JH79kRbmBBCkiivACvjKKpdUi4FU2mrKNst5s/g5qVNaIwI9Bjq12bA7N4wp
         bJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
        fh=Q3HLTguk54pOxrUqpjGL+6UG/iNtbfv4XO2DNzORMsc=;
        b=CP1GgZLpI/vdFrjolZoXqmr6sTAdLYZXTLES0FlwDfIFmqpHWW3o41XRGziWxAbPeA
         JIorpXZ9a6wG8ftn7r6Fp0foCrwo+SofE4A+QCGGk7YlHDhncLqsxpLH6/MOLXoeGBAf
         PS3xafn8D8z9x349nBsC0URZjL6sFE/jiHH2x2liIJ0Lk37be9c3McxdgwqvHrumOokT
         P+zum0DAA/Ek73S8KcmuKCgVneize58ScGPmMLuERCf5xs6V05MAlqEYJ2QGL+wu2ZOr
         ROmWwPZuakei02o1DKb7TDbR8EJGk8E6qiBThhWjGB8Ewy1JakO1YMCJTqcQ0jXMGw6M
         epmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444715; x=1795049515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=COvz1LYfsfnPEz5Rqox0HEgHvMOUnAt/U2EOg+WNlZU=;
        b=D4Ve42hZQhC/G6NOIzE2CY1SbaTlv0o18zyz4/rY8hboX9yxGng1lMVhOzOVtPx8H2
         yE7S49QFcOF6c8GBv2M8Sjd3GvE6XlTHzKu2Ho6q1BP+AhpZuqBHzJL9iWNmyKviuvHy
         Wf+gwDxuv7tPtFVsODox42eLpE7uA34PywSACEUrOvFgwp2R9VDOfYePmbd/f4YvElx1
         Zr1xX2VkCM5tHpNBQ0OpCswJ9h/gDUew+Q/ljcgb/2CA1QXgwrf2IjCOu5ZWBlbGg7nM
         nXS5ujl55I6jYc0PX2NEp9/wl+BuBlqLiH6yFfWEQ4AV5xJYJHnIu00tXv5PJTBV0CSN
         Ztxg==
X-Forwarded-Encrypted: i=1; AL+hErHZPpYQStTmf/CY/Za7obMys1ku/fqU9brFhKeIFhZifl0TgZt+VVayFZqCdL2TzvccUVmXYufxT1cCPcC3pAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zw9SG6KYbTJpHOJjWKAC+94Jm4cKaHyvGg1C+/VVcgye8mm1D
	HBsUpy1t25Myykw2/OQGfOAV0+1b/pKpuGx26lU0Sf2qo96zYaM3s52sYlb6q7Qbr7pMOxL3mPx
	3tU+t++TMPdThFPIfEAm/ZM1pX8fyfw/cxfhO67Z/gP57GUqLIXg7+cvYkhzPm50XqDVS6acXAq
	qyJQRnkO+OCDIl1OW07oUQo1E/5rg00P4PT++h6HyFfFs=
X-Gm-Gg: AYBFou3cDiiht/LDYDYAkrZijIg4x9L37IW2rUSRnJxJa+2YVLAGSyz/sYiJVJNKNY7
	IVewYnfL8VUBZYMJoOTZTAGJ92EBM9oOKaw5Cg8QWD0ZEDbXS6U/Wgx5Jl9coBV3Kt044BYEhj/
	1j730C9wvOpIY6B6CMsv0PUi19jmTQ3xGQBw1NJ5Omm7k9KCmnPYInkrN/CVeHlSFyaOZchG/Aw
	MJy5YwGDtAcEz2yBXrRSlf3D7AUCUTX
X-Received: by 2002:a17:90a:8c8e:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3b197cadcdamr475958a91.27.1794444715028;
        Wed, 11 Nov 2026 16:51:55 -0800 (PST)
X-Received: by 2002:a17:90a:8c8e:b0:3ab:d26b:c2df with SMTP id
 98e67ed59e1d1-3b197cadcdamr475937a91.27.1794444714456; Wed, 11 Nov 2026
 16:51:54 -0800 (PST)
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
Date: Wed, 11 Nov 2026 16:51:43 -0800
X-Gm-Features: AclHuK_TCwMOAV1WvAw9HnkDUPDvVUUNIB0-FrcHVRqyh165RWlzsz9oCiRdiUI
Message-ID: <CADh2yMzdD3FSJSAY2+vJYADwRg704Ndqwz2DhAC3nhmyZe85jQ@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=AKwTwrWT c=1 sm=1 tr=0 ts=6af50dac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=EaETVqjJsHDKXBk3jaYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YMph8xaOiMN41ceLSBreZeH7ig-RdZsI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMyBTYWx0ZWRfXz3Ht61Ht/4aj
 K3JFKxlfDn/FdDliK1H5RSzCgZWIcOuAma4FMCZojEqsJzZu24z1r9H3xVyvwXndSCAxHu0pggw
 RGsD0+R9sa+K3DReTbGcAsKk3vj98Yjpf0yTp2y6lmh6h/8NhmdAzlS9LG1QaYiuz8ttc7wEV54
 vQEHkXka/9WR2blJUfclC8aZtYxp6XL8xlEAx2/Pl605LW5aYA6Rn3fQNiWyo2U8ppgDvJy1acw
 RK0r0A6kH2OmkkT0gMt3dvdZRaIDNU6i+bLTw1lqeN38B5/i41K7lkjLz2gFjr/VziyCij8mIMp
 ll7hT+DKxf9VBUhn8zCn+5kG+7IVz68CQWMo4us0iFkZBhtaHZAjozGTabFCpEXXL2e7420sNxG
 nEaWijfVb8qAH9Uvii6lNyZbGJOLn56BbdcHxKcJqivorapUj4ej//Oel26eLjkeFO4+u917E1j
 8vyXzBhz7uvRVENJb1Q==
X-Proofpoint-ORIG-GUID: YMph8xaOiMN41ceLSBreZeH7ig-RdZsI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMyBTYWx0ZWRfX+kv2esTrSkTS
 e9mCCwE5uj/dHsbUS24C4mOXEScbHAaG2sycl7lB9Q0tbifwKqAEnlmnk0XWIazEbBjpOYA6eVR
 uoPfQdYXaPfR5dGDkSAOelyG5pMjypI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01

> I think the design could be improved by not reusing struct psp_assoc for
> the socketless rx spi accounting, and by not placing the socketless tx
> assoc on the active, prev, and stale lists next to the socket
> associations. I'll try to comment inline to give you a better idea of
> what I'm talking about.

Sounds good, I will do this.

> I would create a separate list for the socketless tx assocs, so that
> SADB handles can be flushed on psp_dev_unregister(). Then you can just
> leave this function untouched, because invalidating the generation is
> only for __psp_sk_rx_policy_check(), which isn't used by the socketless
> rx assocs.

This sounds good as well.

-Todd

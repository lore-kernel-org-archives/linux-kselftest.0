Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794433789;
	b=TrsjNF7bMgbyhMC/GckfeC73l3IgzDyunD/X/wqQ4Jfnpag0LkReLQB4vxfT/my5PnhT
	 VlWSp6j2tdM2QXDE/lRiNMP99Cj5i4FmKbfOIi7+Rcw1lqsM6VPI4NjY3gzmYToLWgU8B
	 48sQv0ah4prg27292Cw99EwIj6ubp/sX9Qp3xzvyXdiEkbqS+IQ/fB66rg3bJdqe79FUe
	 B3+RAlPh8he0yhbFOzmt5rpHWdVoCrQ7VPtHXCbOlMdCAVfo1SL68twAKN/WCSOojBPM3
	 pgkvU3PZ31QvKxMnAsfNsvy95/XmzVJinunkfn9AU6M7fc8wBS+Ayc0hlQwuDnzZRvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
	b=SgL6fPRhx6mEl78/jvufTcZbfBqjzsI4onR9xB8yHZe7gys4UiT/I+uLqx2FrQx/skD+
	 p9jfL8qBQE+4R7qX9Dhg/mWux2u68oCdgwOuIEaFDnHbtvbbJP7IYYYWZrT5SrhXY8dqq
	 fI/qn6ycc/MyjwzRWb0gdnwCyV2QPqMkSBU7hpfyCstlBR/yzFddbx7fT4E6rkLUJmCTE
	 M8dukHHJiqt0A3SzOO7+1uSFP8LnfbNsK15WHZnAeCtoRRmZb33XCN/q7lWDu9VlrFyak
	 1DrWx+EvqSa7P+fvpe6j7vNIVxFR6O1lIuproK6NIWl7Mgu51RFt8AwoSm7WrMFwARQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GeyeUFFi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D4E606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 21:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D4E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GeyeUFFi
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABKjm5n1426920
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:49:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=5hjKfboVBJ7
	OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=; b=GeyeUFFiqCEKPkYZuQ6WCtcJ+ir
	veBlhkSCp2XR6ZvVC1Xnkgk73qpCo4mRZiSx00pz0ZaPhEttkWlhUPmxfs40TTQ5
	/X8zBYWeMo5qo2ppLp4+UZMJyHFMoiEX2DHlDDezkJ+ymYQXutBVAG3oQhntG9hM
	ZVeerH9U4yDTyfZo8k5T3RGORiWlI7Sy4seS228sgPILhH6xhQjGBjjWZwg6qsn8
	Vlh4ScYyoi1E4wMGavc4pJXl7aCS2fuFIr3busZsxl7CXn30LOVds332fP4+nkTl
	nDWVNpN6J2Xxb3bHvFuoJ6S2atc4WxsC5TivihwZ04AgSP+XyPVs1XTkmTQ==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4huqrq122w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800 (PST)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso24096125e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794433786; cv=none;
        d=google.com; s=arc-20260327;
        b=o6lvcshS2CVN0hgu09cDTQZkqZxd3+FvYb0AJLFgIEs/CCmEH8jLMks7RJOteYI8tl
         m9jgnf6L0CbZTKke6HgtwP3GJ0gZCgIPKRERRh6oEfdMKl3X5CqsExCTuRoJ9z2oqdTI
         6NuxzN7k3IkEq8L8bD9vvKcH6m3OUhgrpinewxePjoSVXk81Bp+zW3sEuTHnmc3xv6sv
         7Gwx2MsfMKUZViq5WuXXY/7HlqLzTzdJv03HlMExd5cOiMeTVWILAoqfic1qW6uRThDL
         th3BcjfEX6K1sZKQoSPDLUuhG/cX7eMq5g5vzwMwWgahM/D+nX6/2EZhcpbQ3Ilgnctl
         F5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
        fh=YEDJy10ndQwdGCTHw3QXK3+VvJCgPAWSjd5xR66S+S0=;
        b=Q66C9uE1h9CD3IYUGd56PeG/l2Wt9uJ2HiKUw6uibuQJCxzLruI9sGul3BNZPxI4QJ
         Ubc4dslN0QreitAwX637ytL/OG7PLWrShMYxdWBRu9vzVXhsp8AP25MZcB+UU2hLRYam
         AxlLYs54tjXVunWaHDqyeCindaOULsE2fvwOLtG7h1Sr1jFdZpW9m5jVY/WloM64K3/a
         c0D6hmBFNBMHCicqpFsVeLEDUY/Vvq/Ur0YEazh4xhBnpgCVM+sULMe6om35xJ4R8jY7
         ayCypZ7OhWeRb/Ayo+RtMk0wVZOBxD7LYTHxOGX9Iwak21JFFjeL8eCgIckKhDPfyuww
         WTcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433786; x=1795038586;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
        b=v3WXTiaPVocnxeKZHXQTkaztKobDgPtSA5+IQnjmURpSnFALWiZ0ufaFBd1UNvQsg0
         8cOs89sX/frCgr0RXNCzatMxtsQ25FbVsHobJlX1lD3Q789eWkk5YT6/XReAePAWyXXs
         SfXxKFww6g2CX4+wkjklIRQMBKYZ1u1GYE8eH4LSZ75+b8bcOeCC4PrJyN3D2e+Mp6z0
         02lIY5S/Py4Ma4uZkYNue3yJzzX1ZJQBLIdSNJye3YhRZ7CN/nnaisqpghLaEYADUCrK
         l8kl7hcNO7LMfpL+u3cDg8i5fJiuP05uzl/Vl7b9UUVyl9I3VvNsiF6bha3ltRaQ5Liv
         aZTQ==
X-Forwarded-Encrypted: i=1; AL+hErG/18R3RvVgfaeiImMF26S802T9ky4zjaP0oJ4JqkTjc/pYzjy+/50ZQ0VJ1MTp8yguTUhe6nEM6AEdM/9TunE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s/CPMqMutsUU6/13AVhomOqdFQkXeCsVJ50UtfStkeRAu6NSk
	d1WVvQOTktzgwTBExvVGaZTrfUCTemaGkcyQeyMnnS3EFE56WhqWrJTkMPWOFL5yxbTeToQ2u1m
	fN91+pVvtdaZba0aFyDrNzyVGZhm07dVjS1eLMWHIdLvxBZD7mJqIIclEGbjH7jOQlqiCM1UtZI
	gPNyQe04ZK4PwXn88VrMrqLhloCHXLIVZdrxYVpjx24RM=
X-Gm-Gg: AYBFou0NFHct7GUULAWTqR157TU3BP2RXAL4LcDOyolQMlTlKZc1ih6dCF8xn0j+KCW
	irZxhDlWDz7eNzAlZzWW8ve9pl2mx0MM/LbMPNV0Leab3UCmz1J9PNTabz8UAhCfslUliXOoEdh
	aIdTNWtgMEEsCGf3R1AiTLplMq5iXTX/6R5ZAw5z6MCN931GfrBGT7aCOcurspKcBpN0VdsW5S/
	uoBUU0L/vvHSD16i0hPMCH+hN+q2nTT
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ba093583eemr60183685e9.9.1794433786472;
        Wed, 11 Nov 2026 13:49:46 -0800 (PST)
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id
 5b1f17b1804b1-4ba093583eemr60183425e9.9.1794433786168; Wed, 11 Nov 2026
 13:49:46 -0800 (PST)
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
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com> <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
 <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
In-Reply-To: <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 13:49:33 -0800
X-Gm-Features: AclHuK_3wPHrs7nAKCIlAv8DB3IRwLLgS4civoUiRATHWDoZevdks1911kjhq28
Message-ID: <CADh2yMwFu5Gyadm2Y-NHCBtayEvN5H9LUM=Kf-tT69vmjm0DEw@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=PapqFShd c=1 sm=1 tr=0 ts=6af4e2fb cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=VU9VbmEmTQsFja8ue1gA:9 a=QEXdDO2ut3YA:10 a=Ng9YvVcppn9CIdWre3nD:22
X-Proofpoint-GUID: df6p16LDE4QQjVVd-Gx3RMiMx2chELSs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4NiBTYWx0ZWRfXzuKg2m/Iw6G8
 urYxe/mqtj5xajrDKxdG1s+6k5eJHLag+mpfisXUuljsAYd8mEwoux11cAJskacMDYbGVE5/Voi
 /CGXe9qUylAljlpBFhYNS1AQ662tEKQ=
X-Proofpoint-ORIG-GUID: df6p16LDE4QQjVVd-Gx3RMiMx2chELSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4NiBTYWx0ZWRfX4fHsGYCWfa1m
 Rk5aAmHwQl8mjiMsBh09NmoLkXRs3FXFWgqL1A1JIqs5+1vV7b8MiyktGV4rxkAY/NzwXFA24WJ
 RfnjgNZ9XmsJOMdZRc/2HeHjGQB8/F2y3zH/rwWQRDLzCSRnhT04Dmh9SLYX/VGYhk2TcrgkTL5
 bcJ2Q0zZuNnbVv7cOcTjz4A9kHQDfxeC/Hc1yX6TKTDS9iDpWXoXwCxr5KqflBcuO/V5lL6P7OW
 lb5nMvEw7iQVkfvoCbi1vwZE1hjccFjfNnW2FzkHB0bwpcPZfyEIUtqL3ZldrJmdIjIBqWA9d8X
 3+luyYm6jShKIQiwn0GJkDCMAkai2/dvWKlbgOPVtd+0XeYRjtlYTI1S7neVldugGNVtxu2ko5y
 D5Ewqy+/eg8hAa6Ggh6OfuDrLI0x+sJy+eMP8wCsdz/ySgHXF244K3OoouQJtQgu2qEPbcxVMcs
 T7mq6WlxwQR/U2abWaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01

> I think it makes more sense for userspace to just get rid of the rules
> before rotating the keys.

Ok. I will drop the rx assoc objects. The robust userspace protocol will
be some combination of using cookies for state recovery from a rule
dump, and using chains to flush old-generation rules at once.

-Todd

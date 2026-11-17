Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954607;
	b=qSsA79v6OF0kuBdEsqdh+iOTj9ocGvmClAklZJ2ejY+uULrUZzHow+OyeplMXNsFqV7Z
	 dZVdacQuJxavFL6dtcZFk7fAjg/Iit1kxb+2i996WMZGjyEhtsGLYmuPLx9okbpYbR4o/
	 BA8DJISBP51SzVZNCerni0u4L8AA+Vk/YlwQgT+H4OWh4Z3Z0SpmmQKVYuxzLxEASOyK/
	 Kl3VwMBuJoAlaFZFQ2YoOZ47tUOjFXFZeMj4Ss0cSDN2N+06FympM5Z3pDkmZpNeDmVLT
	 S/RQ09ioiYxe5EENDpjvTVO0Qo25p0cCTlaRjncMJGcu6joGFoYt90LUhMkbPKKnPOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
	b=VkQglhRdLkg9DV/UpMUJwRJiRNWbxHEkS0McY8ZcjeLPobhOzib54ysOWBcCWq7aaG35
	 EFLwqKT5WarXfZEU6c9d/MJUx6x+k7JUdA044D2g+3pG0xRo/DAKLY5r2zmLyhX/A9hKn
	 6w5QgsB3ZL/qfUuxz8EQqFi1Xp3ESbMopWTuKLXgtwgVVOTvQI3OawpvtYTbQwO3q1sSm
	 VSJvlF/MlT8mIGqXb+U4d5zt0wpjeYN7LghPjfQerrhAq7Yep3UHf7L38XmQOZb7Zha51
	 97xm6ONZMBicXlZpOZTh3/wfD/xKunDCr1DaQjGatMIHyRznSjS0mOwt5TwrwxoflRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF3606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bOfEnIBU
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1tk11127229
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:30:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KyDWO0/aXgj
	9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=; b=bOfEnIBUXJ7bXz2NrfMubG5jwGR
	6jN9LTRddaVvweRF6J6poXO1rNj6AwMta2gKHOV3hwyI88N0Ig55OW1IcebZwrtv
	mc6yE82eh5XbzOd8B2PGTR28CGWx1oj9Ay/mzcEzSVSMkGfaG4LYgl+dpJWjuvvD
	V1ZmON0tX1Osf2Lm0wPDir0fCLzcZuRoYUsO1Iy4vMbA9POOA+6JH40mOWi3TCsm
	dRTW56gk4loflTT37NNmVrKcvR2hIuxQKe3hfu01wDEigH9osq5WP3LFJMTv0UCJ
	vUJBimgVSMDyiDFY/PodREJjfSxqnIOleJ/qCq82tGOD/cfLXNpVqmZmpEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0r2u5n9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso157976a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954604; cv=none;
        d=google.com; s=arc-20260327;
        b=cH2ZgTz08nNnK5vXCcJ6BN18FHzxgpDbGAlfZ4DMCW7T/Dt5l262Ta7v0RC2URrAkB
         SvXnWmoU0kFTenHDglJbpfKw90DLRRDEj1B0dDrDcCEPMzUHbxCiYiGRmMZ2SKQLsnq1
         0EJXLp1+M4rSnUybXGUd2uu1dOOJ6XQfEvxTGR74y8DuinHg4et62XOq1qcNrIWyBHyL
         WTIzfLYui5U+GhrcskrngQCXYOlKNAvtjJy49+xzplRkQrDJnxOpy+cLuu6qgCss7a2N
         hUYjF4ZVgpWpI9DT8kKE4EHseoJFc9jitgJvo4HZz0NMjWCy2nNFIAwt15a7j2xWBt8u
         c1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        fh=x3llDKvXIvH39q/Oao58NrfV+ly7irC2N4Q5xxnBnYk=;
        b=Spv3SLlmvQGBzPuwqndwqQXp4duO8ZpoYZjdDR/quRCA2omvEL7CdAZ+inn+rHi9j8
         aYhxFW6EPCSHv9kNJhfFL5qJTHItz9HUvvN+9/G6YVRYSEUoiCsiD7bqTNgXRkiz/3uO
         YqUVPn9ZY2TzAyKCRqfEqKDrUIrqt1+pqp44B6CH6vGj0w4DozYrPe3BRlH84N6sNm0o
         LHtrqm/tVekx6DrZVZKhR9mjwDjUG2t3kzVYEiFl7Mqr3OhYMs6PbrKDbHprUqYCmMyw
         i9e7dq6QZ/VVZmJpMkLHXDO300dlmExa7C6bhDu+X42kaqm/7VtHfcuS5WwMMVSi3Waq
         jrUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954604; x=1795559404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KyDWO0/aXgj9Rt69ltOENPsFV1jksEPL0QStiZFNoLw=;
        b=AhOwCXE+5C0uik8uwJ5zon9uDFWkWi6GO5G+3I7u5q+GesWuHc/jgRJTxi7jEmAE3k
         N9GLTmZa5JuSAr4cmsXLlF+hC3z+5dF+ey0bSvS0HZaj6w2Z5U8iLM3OeadnEx+/+6MD
         xoUv2PoEAIMdgCHxPoWFgMg1YkZwuV/kv0p0KwqXd0V8Zs6hP+flXt8otgFA2hjiTQAS
         j/ZVNez7GoozrksxP9ZQnrr89bvbndNwLxWGk2DvGQQPOULLWlQfbiJxVCWC6MtZr8J9
         BoVKFInZuJ4iWMCxY63pCkb3FhGpfW9vWGq57Bq+R2xg3PXA/eMUG+QHmoX0MQacYnmG
         dugA==
X-Forwarded-Encrypted: i=1; AL+hErFBW0dRXkS7QtjiehIGltDsr9cZnxW7xc0QCCb8GBsxTxzEew2cIxlWqaTB0wCeQiskWQ1+k+ybjkqdgHAD+MY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cEYNlbJFMj01QEHsLE8OTzwCgbwJfXLQ1yHTDcasenWS8KqTz
	PRrkvH1DZQDnLdo4TYCFIBYgf4mzCGvkDtv8b6NLRy9x2A/H2UXsRWOrSGkkseEQ6qBCvPKW6Qp
	HQAqcbfGSkM0smZ54NTQhWI0TA71C5zzGU8TYR+IDIXRdZBaEZnoKe0ldeE75Zx831CTecCGTuL
	gphFTQ1bF3bINNZOxINP3E37jSYBdWccHK1gKNiDOfEpE=
X-Gm-Gg: AZFdTZeQRz05NwsyC5zUd5vrYfB0I/GVovn/vB7iNA0UDiKCQmzkISQaK4m545Jo4Kc
	6Kbvb5hT/ZbvLWxH0DsdqUPr05ej7xFf2geFwClgEIwCZdFqX7cwLZwKrNeHKke4GYUrRFE+U5k
	zIvsLrcau2ob/2sZtwP/H240qMjj4OkilRNX8lqpCihvtJ9BZ/0ebQeL/wGg4hQA5Zl/i2vh7bV
	9wD7TXShazG0tRirXbEkZvwOz4BbFxkD3l29sZeHdJsRAWANNA=
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id 98e67ed59e1d1-3b3d07d93eemr814958a91.51.1794954604519;
        Tue, 17 Nov 2026 14:30:04 -0800 (PST)
X-Received: by 2002:a17:90b:2fcc:b0:3b0:b64e:1e34 with SMTP id
 98e67ed59e1d1-3b3d07d93eemr814926a91.51.1794954604046; Tue, 17 Nov 2026
 14:30:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-8-toddfreed@meta.com> <179471270091.2199510.4320994626979041884@kernel.org>
In-Reply-To: <179471270091.2199510.4320994626979041884@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:29:53 -0800
X-Gm-Features: AclHuK8ozq1AL-AsYPXNzCLCrFAtXWz49sr600reWw55cTUb-tnGMH92_LvEb0k
Message-ID: <CADh2yMwoR3ZJUwCSbUuY85qPN=c-TKqb6BZeB87q=B24tTTaRw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
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
X-Authority-Analysis: v=2.4 cv=fuhJ914f c=1 sm=1 tr=0 ts=6afcd56d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=kkcUborcUVj0H7zxAXTl:22
 a=DLdrzcY1xBZ9M_96H7gA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: eRG4l9JVjvtMaiy7TvWbpyMNZ7w5ZCtg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX99QSVkrpguPe
 ZaPIRgRVldYybuR2aOPjmidHeeRQ1ov87CldEtnACAizCnLJzAhquPnqruJt9aei1/Qbqjg4W1I
 4yglwnwBC2Ge1O8Y7+IxyrCSiUp/mInw/JiyUPumL8C5ppbM+7uaeOtJc7JsliKcbRb8KQz6hC2
 JWWgDokfEw/wB+5WoglWpp6135bHztEwEZ0nfIUrOk/u4dluBLf1i56JzbGzyCdOL0cbxs3Urf7
 LNTfxPrTQQ1rx7Qo/vwKqWZBKqy5YdTciZPDQvCHJ36QrleyUmSdWOa9K8srZ2P9RFYp9lH40kr
 GTLcMLB2+D5iidcJK/BHXZ4APmvQak9kCFAR8QZqhZe3lf6Kyc1KUfYomj41qTdk7JGSqMoHtoY
 P8klLYJOe2hcSbJhN9q+orlEm9D3bgIowDIqMZfkEv6LRQRrLtIupbPHW4eSRKDEUjZIjPSNRCb
 kgftLJi9JY1eFQ8/AnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OSBTYWx0ZWRfX2kBNYXU4a+1N
 iwch6I0A9JU84b01QeK9ET9P0tKiGQ/gNQ5WWh+9mDXVRfr/JsagJxky3nvDRRAPqyJFeX4VzpS
 DGHTdKs8UW7Sn1gUTe1JHivwqVLl9kE=
X-Proofpoint-ORIG-GUID: eRG4l9JVjvtMaiy7TvWbpyMNZ7w5ZCtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Is skb_at_tc_ingress() a reliable direction signal for every caller of
> __bpf_redirect()?
>
> tcf_mirred_act() only checks this inside a tc hook, where tc_at_ingress
> is always current. But __bpf_redirect() is also reached from LWT xmit
> programs. lwt_xmit_func_proto() gives those programs bpf_redirect() and
> bpf_clone_redirect(), and BPF_F_INGRESS is an accepted flag:
>
> ...
>
> Without a tc ingress hook on the host-side veth, the same packet and the
> same program get -EINVAL, and the packet is dropped.

Real finding.

This patch was re-posted as a Fix to net as patch2 in the series
"net: don't redirect decrypted skbs to ingress, psp time-wait validator".
This path is addressed there by calling tcx_set_ingress(false) in bpf_xmit().

-Todd

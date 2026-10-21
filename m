Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792624614;
	b=QGJTZtCj2UMG4CYwaQy6g2wkDvo46Jd6c+z1m2TzT3TpC0hTiFxv8XyGjadj+FYkLsNS
	 F8ZVZ9BdEeOG3f5gzMZr6FITX5mwwG4aYVZQq5TkSn/ojRW7QXTGhSatWpVEBHSC67LU7
	 GiDABi9Em0g9QDkg7UDj/1NQuAnQJA8YmIBe+HKEDi4CO5onoTckvmiadGgA+Zoqp8rJz
	 b1EB9kBOY/ythiscczqvwx7I3nMc+Mw0B41N9pHkpH8coVTfMlEcQQfRehm769UkM1Y9U
	 EmfP/zflR90Szm4JR07LGOb0hNi7bNrXlW8UPDnBsVQoNYjljg4zv2kH+knYobbEnWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624614;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version;
	bh=pJrlS6BI0RjyXJfE4zensthLKF+BlE5JhwzaSHI/tVA=;
	b=0wFd1aZBVPi4ySYxN0IDxed4VJeL1+0jFWZFK+yb33nI06+RzzXkuujsOuwZ8bMrOM9v
	 w97JlvOImGLbtLIR18xPEu2i8nOEsv5sMqBhad1nmXovuGtESeb8Cy2EKAyfbIeWRV4IB
	 vfLE0zFBtWFKAzYqwYCdb6rV81fd3L2O55NsxE/T+fz1LHCp0aCnxmddQrW6UHWcMAzqy
	 QtQUOil3hedfcZnA3JTa8WVUBL5FsNbvtdKJv4bhXhfU4DdZunGVJFMfVulg9yTIbnZ6l
	 6QJETzBSfCOXYNwf8HX7upq0DcjJOYDT8QvJsWhXH8GVfdou1vgCcQXl1JJv2srxkfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Vp4gwrZl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8F2606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 23:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8F2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Vp4gwrZl
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LMgZDK3669028
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:16:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=pJrlS6BI0RjyXJfE4zensthLKF+BlE5JhwzaS
	HI/tVA=; b=Vp4gwrZlgWsBSRNsNo7EaOnVLk+z9CB+3MfP6zxr786/0Ld2DW9nG
	+wejsvBnbBKR4lV0t7FWj00/nFs4rACUwdZViTnySZ2OtIsJFyYLZ5YJ054xMBXX
	RzLSSrAHr1FGpwnjnXzthJXyKMCVKYPCgMIw0AgzOtzV86iFHVEzC4ipoYIV1en4
	suoFe3g35pCFOaOZWH6Lqm6wixaj0420VzuuJdqnLupuoKTG4vjTSHYkV9WfVFFx
	7NT+1THYzfOeXI14PWluiW2lKWGK7Wm4+wIlNYYdv05tnSBjHCkFYF3eppH0m3hc
	rgZtWzFwbwsCMRdg4d/ekOKH+C/mVtjNA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hf5k1gjgd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:16:52 -0700 (PDT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e617b5e9b3so9110295ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 16:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792624612; cv=none;
        d=google.com; s=arc-20260327;
        b=PmBe4b50lSkUrJjIOMbx+a463FVCf66MufV/Hd97sFh+hUNOzoc9w13E62DO4byFIq
         Dah89NRJWcBzbtj3Ei9GDFnF4h9M9cQ5ml3/bC9BvJcH7yyiVZdeFSA7MvoeBc4i9vSR
         UM4L/maeC2PLFC7PEVAU93/ieV+fHsavG2u5F1VPeiTWiI331MYaEWEhS9huq7TP9Rs2
         6T+Oj2/oA9EIIXr2+Jb91r3ys5zSQkMRXk6Dz/ls9lz5pYgMr1Anwy4i0w2PrhDiI9Un
         oiRLzumTR/I77sE+18WRby/Duzm2YgfBsT+qgaSbXZ2kYN+VfS95ZhqJ5gJLJxvdFFxZ
         +3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=pJrlS6BI0RjyXJfE4zensthLKF+BlE5JhwzaSHI/tVA=;
        fh=cuBHHnsTRU9g6LukiFUfwJ3ZZqDI0CgBxt8ze0x6GBU=;
        b=ZOFHcRNOTsQIQzQTD0VQToevUxcllnmAq7kKbr3Id4zqzGUIUWT6APMx4X/ojjV7EH
         ngSQphGVfRR2rWA6nCa0x2NrvtsDPM0B2vyR/9LB/cAn+uNbwE+9p5WycoSLPKlv4H9W
         X/p0Y0jT7l/K09UtcziwYBICOSb73uAc7IXwaeO12eeMLhLav+bOZhITGHhV22iHrhD1
         FNsC3DQdUWw/vAvawNORmSsuzKnbGYN1lsQi9SYczCzAHW2FuHqyV2wXHO9ZYqoOe/14
         A+AUKpVc3060Bxe8n5fhed0LG1XuOoCcJgVmeJrAcF7sbJn/hq/aWDWO+t9qX1z/4iSY
         A7ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624612; x=1793229412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJrlS6BI0RjyXJfE4zensthLKF+BlE5JhwzaSHI/tVA=;
        b=gI6eETKJvuU0xlvxM58q+kI89/Ey+xRDS/1r1D4nLUufGPl5S/d7wHU1k42H8ekSrB
         elyjNEO78mCezwqHWsiTzvuJdCAwlZHt9W+4Gko6adeldd664RfuFbd7IOjynnHDo8PU
         5JqVwIRgqsfUq0ymrDGp4NQBq6mVbJP8XaLqxLCjQ26AgUeEOOpHyYFU+wrVYPhHTBbe
         vXWfCg0FAPJVz9+r9MtJtX7QND9NiqhiFTjh2RpYhSPSJf/uCuhQGMs/lRqN393uaGRh
         2G+RMfIIEoTgUnSls0DmAB2IdoN+oTsDvGGtU+qHu51LWVpU5texzmFvxSipxjwIKJ5J
         rWOw==
X-Forwarded-Encrypted: i=1; AKwUvByiEnayJvEFFcSWHezp82B1O6uoFh3GfdvLqNACFT1cGIe3S4gmWhUegBqlsEEsqdqbg0DF01qkI6WXKURGO0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb7VxIxmzux+/S4TSYoRNW70OQGJ5Cbg0dhDPO8+9fFWQR/10G
	49fZiUFODHX1VW1I4W/GV/0/QvzDI5FfbdoK49Qs1y3bNtm+rHj6xB+RlbijOKgeKE5Jks91ERs
	DKCBN8ezVLAqSHTQ+jEwYbSKlVkyUlyZ/MywetuiBaRHJaoVwPXgU96wpJhsTv7+C5MbsjHRf6U
	byFPGf8cvDfknCLa6wu9YIZSrJUIhPbikfoW3lWn7D1I8=
X-Gm-Gg: AYBFou3IibASnIfrB+xaWoJuvJj8tN4fl9ho9HJL3qkMv0VPnWUWusZKvERsJeiNnkV
	4NCaJb6grCGRKXHTBVgmEguSkDbsgATM5INnbp0LVovDXH1ZpD5Nx28faBE2E5f+FOZyBCFMj3q
	uHBnDo7Owhmvblm3GWldpjr/wMpxpOYgMGGTNXi9+shTbDpO1ql5v7pQOybx9SRUA7dbHGUQb9M
	kJO81FZ+IJRl9zerfPMydJnEN1hLnvOvEEi1P7y3oXDVz0K9XU=
X-Received: by 2002:a17:903:22c5:b0:2e9:9a19:c5b with SMTP id d9443c01a7336-2ea43ccafacmr29581055ad.47.1792624612328;
        Wed, 21 Oct 2026 16:16:52 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2e9:9a19:c5b with SMTP id
 d9443c01a7336-2ea43ccafacmr29580865ad.47.1792624611831; Wed, 21 Oct 2026
 16:16:51 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021210200.788191-1-toddfreed@meta.com> <DMAUWQVPIVKP.1QAK1YSA76EHJ@gmail.com>
In-Reply-To: <DMAUWQVPIVKP.1QAK1YSA76EHJ@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 21 Oct 2026 16:16:40 -0700
X-Gm-Features: AclHuK8lwg5eXLuGUxQHiUC8_vLdaY-ZwbVEaxo_SZTaHFB4eITFRpoBhnT9ZXo
Message-ID: <CADh2yMypAdV07rRufDqj1aOdEzAqEaH2bDkJ2jYV_z1_9iXRkg@mail.gmail.com>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Raed Salem <raeds@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: m5c-uEw1Ck1Qb3rjBI3pS3nLGHX12vPN
X-Proofpoint-ORIG-GUID: m5c-uEw1Ck1Qb3rjBI3pS3nLGHX12vPN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfX1SKxLmut+BP2
 bE4YHx/WcmF96MvZyuuGAjroDvlLbRrRAM9aLFnEG5exNJdnbm2z6vrgo3WPl359tAI3KRxq4xJ
 WmciUyb+u3eZ0mPxDBLsiGgQBiHTvj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA5MiBTYWx0ZWRfXwmz8kOKS9A/L
 JeKdk9UK/JGTjX8K44Iw182XFsRuN14H7IJzjZHUvZ+Nk3+rV0ZDOcjqcAEQvCpjz7enrr9SvzE
 lIgqXvYRXQkz6Ia+fKTBowebRwhsTGFi9oPH2wwoCwDa6Qa8zYKr42kanXU9RqXf3JFQ3dqFx9r
 wTxXpPT6q+e4vUcFwmIBfapOVRJios0oObp3VaD+69lXGzVL3H3MJAiad6qJOyLNIR21CySr3Rs
 FmCCxlTimyemaD+KrYrZN7tx9xdSfZ1Fr42U+mBPQRzNgL0bltMBWx6j3dkl56/pQ5Vz7ZA5nV+
 YcJbCmP8zW6TDLyg3YETs6wV+ZJnBh7mzK2AIbPTT3HP7yfLl6l2YFPoT602WVHDDWf4zXGuJdX
 7HVNn8Lf9mHqfDG1VDX6KkC8YyxtYEdtWE195mFIBpJ5u21aaTsBXxgrNYAbHjC6KmBzx/WORcB
 AY8yYuM3YdsEXrFAEqw==
X-Authority-Analysis: v=2.4 cv=cbhHPXDM c=1 sm=1 tr=0 ts=6ad947e5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=pGLkceISAAAA:8 a=8MYx3_RU7Mcw6uyp7OoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01

On Wed, Oct 21, 2026 at 3:07=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
> >
> > The first patch drops the packets, the second patch adds selftests for
> > that case.
> >
>
> Why not just fix psp_dev_encapsulate() to put the psp headers in the
> right position? With the self test we are going to make PSP + ipv6 ext
> header =3D=3D drop part of the uapi?

If the original ipv6 packet has extension headers, then the nexthdr on the
fixed ipv6 header identifies the first extension header, and the L4 proto i=
s
in the nexthdr on the last one in the chain.

psp_dev_encapsulate() places the udp+psp headers after all the extension
headers in this case.

The issue is that it rewrites the fixed ipv6 header nexthdr to be UDP,

  ipv6_hdr(skb)->nexthdr =3D IPPROTO_UDP;

It would need to walk the chain, and set the nexthdr on the final extension
header to UDP, instead, if the correct policy were for udp+psp to come
after the extension headers in all cases.

I'm not sure that's the correct policy though ; for some headers (e.g. the
fragment header) it might make sense to leave them on the inner packet.
Note that the psp spec does not describe this. Perhaps the user should
express the desired policy?

Explicitly dropping ipv6 packets with fragments is consistent with the
current behavior (it already doesn't work).

-Todd

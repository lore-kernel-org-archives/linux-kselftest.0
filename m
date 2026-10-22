Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688330;
	b=TFEfWhHuqOerHjYJfzFVp7GEmVPZEQUV7OmXjzJyk5shi5NSPW1vNjObcBSZB1kYGWMw
	 kemvHJCoyMwNtcsPJiBMOTeuy06l6dRquMtyibV7rO0PVo2aimC6Q9fcPC6F2C5bwyRR1
	 kg+VQtoN70Z4qwRoMdqEFDqIOdJsVF4rOB+URcodHXVh9w5A9us1ZoSZ7UEIyTb9QTmDt
	 9+ifqTcWElsdiyC/lSvjoseIBz/bGsjt02jtkZuCn8m/mzuSVKBjkt0BkDDvknf/HvAD4
	 lYzDCD7JlijNFtx2vFJORnowdnWF1mYCJxr+HuAnW2w7GIK7tCfLbBRYP1thO8CLptg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=OlvxhZaFNNxPSruewKqVsjl2oNISZrjoCUrWTQhSzto=;
	b=jSeemCu1UhuNpLQX8b/XDRCgjSl2llLFfXWSc3su+7RptDKe3QOhb9lVgwNAJnkeVA5c
	 e7W3curUb9RioULcQbBsh+/zfc5r/iBsNhurOuRrh/5RgWEGHxSsjpra+Dmdap+9QdT3H
	 Y6psxvgowhLvYWgR1DW8W1pL+GeQWpgxFAuhJ60U5+OL/Q0AP3qXx5uG8itf2wHq0lDwp
	 sPkvpG7efffvQS0mL6dWzQJY8dMCMkrbmaypQouKwzk36VrpmyRuivVm2BDldjw6sRdCy
	 3af+G57t59mNlV88w1m/GuAKhS6WCTS+/cikBLBfUBQNEXNIID7iPm77OtESF4jAGWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=TXn9CHwd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8790D606A32F
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 16:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8790D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=TXn9CHwd
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MGgYhZ969641
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 09:58:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=OlvxhZaFNNx
	PSruewKqVsjl2oNISZrjoCUrWTQhSzto=; b=TXn9CHwdi2W4NrcyOm/YUyLxnR8
	OUHcxOlfW4xTdJW26FXK1z9ozbqZGrc3LbIP2hDwwddpkllbZDuyhUYaZXw2Xtk9
	i6IaiMVMZL2tyc0NVeV4A06b7Hv3lICyaI88Lm72gRdkQ4mGIAYYx820x5GMJJ/Q
	nQK7E7W5is4G3a3kMu9HwjM96znznIemvk61fSmEHDAtDR0pfDkiprmtGa75vAje
	7mGQUGl/uX1FP6UcUEhAmSXJ8vom40qV0zC/XEJwGN+V/5hmqD6dXbFpP+iVW2y8
	T1dj2QQpYyYrw6Ub0da2P9GcBsooPzOS4j+llwimH4LHMUj/Pp3ProGC/pA==
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hfjf6hvqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e00f3929bso801843f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 09:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688327; cv=none;
        d=google.com; s=arc-20260327;
        b=o5v3y/YNhPCxVkpXfwobmPyOXByXQOvolkKd6rKskBWWlVP68kbp4f0Flhkm/T6xSG
         aMH00AsZLEGFYo4+wx+2hfE7d6bQoWP0hNKnkkU52exnGQ7KuHonCqExIJFfQeMkHtLH
         VNeWuQdM7XyJ1+bGlvAGnzdbvOrbo0d1aUEjLWGNa46Hlq6a9wdwmBxb4VTnGtP8kBfr
         alu/SHGCdUJ0pN65tJYIEAyEe/us6y8i7cG/59VSWWVqPJ29nisLSxoB2zdDmlxl+0Ac
         rlXcyPVcix9FbV/lrLySoXMUXlcG23oAZcBAMpNS3KQpjIioWyIMEUc9PwdAKmL5U96y
         vaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=OlvxhZaFNNxPSruewKqVsjl2oNISZrjoCUrWTQhSzto=;
        fh=c+VXvb7/2Smdr1NmfuGCwSBsKvN1Tj0qnoBBxSpP+Os=;
        b=jISqIRTU8e6sPYLiXCPcmSgAz5MNASAgMJpLO8hYhv5WDQ6ipoDG0B8WnlUCBae1ML
         QlgDnNVbvRSbkWvRjx235QRR/IspeHyOPQ5fd9QOJY/3fL3uCCiMfyaF26TeYXriwRg+
         oOuXCAXqMZImSCI73yNhuWanur5Dun527VvpHUmDUaIryt1tUJ0ZLa9ZarMGxCF2VE6l
         rxm8dRbKaIxhJKNOSlNJirW1cq0u0ZhY7q8gKaSguFP/P/Jr9FZdlAQCwt5CiiXlJuWG
         Tl5T4RN9R3Ifit5LqlB8pkl0+ZNqFEM4VQxaTeEyYAjnI+A9A1EGi2IV3T23asNBtFiw
         4cZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688327; x=1793293127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OlvxhZaFNNxPSruewKqVsjl2oNISZrjoCUrWTQhSzto=;
        b=ZyGpHXHLt1bM45vJAdKEleE8pqT368EiQ0jRw0GcTnktgxESF0qiEe0D4F3ld0ln5O
         jiQN0M7NgZn4zTyixLSFOpMhKUeR8I9x3aN6HHCcDvczJvQn6CHJbw+nhJP71mWq3Bks
         QxJ/rokws4OTS6pTd4khLUHFcB+s1uvU4qTVVNea5D1IvbkuuAr5+aBCoDBtp52ODs01
         UebBAPCkdiG+2rc4SGbEm8YLM4gjnBuZMhpzohXzyT+Hs6qm5qMRcW3EqwWHm77Y9IVv
         v50+QbTThklPsuy20Fc+as4YoR6r1SlygHsGvyhbflxKbzBvVxbLa9C9+88XoFq3YbRw
         nhUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2XdJq7a990E144Q2zr4h14fAzxzsvwCe51YB8UY72kVsiSsGNxZ4VBq7xjrtV5x1Vnbzh1bgsNx92VbQqoeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbflF3QSBv4weWmzZy6wKo5Co8uy8rUXrc9Fh5c2f22L8hygLQ
	U9RmJH7DiIJStEbZb0SrTksv9YqPSs4E/W4E5HJCtnLx6jAUXuVbH2sBlGtlwFc987g1/cRWOtM
	pt/krgWufb9lvlZTI0QTTv4o2X4/vjzLrnzEq6yPgV2erVEldGUBLgj/bvo7bUu7glpn/AkclFs
	o1nXi0+NbyFGNNQsbKCtst2fbq2B9XwqMnr4zmHz38AE0=
X-Gm-Gg: AYBFou3qrLvCoEl1gdooYg+bBS7rpcwluyG3XqYOauq8Je6Q0I7CLJ/rB9zPZX37aC9
	1i8mZd8MorV+jzomKpY2ioFe5kFsOzzAJV0qfK0coxvHRLD1UYMh5fzvlpt/yRovG2/dufbprn/
	afpuN12BRZR8RwIU+tugFyaK4PinCAiVlg9uJW973SgMsd4WZnFpkQWmhQi/qn8vBQpW4r54LEe
	mKAA3GBONSlcHsj8Sz3AB/qbEannyyb
X-Received: by 2002:a05:6000:4026:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48e2d133c16mr7174887f8f.23.1792688327255;
        Thu, 22 Oct 2026 09:58:47 -0700 (PDT)
X-Received: by 2002:a05:6000:4026:b0:48a:fad8:52a2 with SMTP id
 ffacd0b85a97d-48e2d133c16mr7174839f8f.23.1792688326856; Thu, 22 Oct 2026
 09:58:46 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021210200.788191-1-toddfreed@meta.com> <willemdebruijn.kernel.31749cef483da@gmail.com>
In-Reply-To: <willemdebruijn.kernel.31749cef483da@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 22 Oct 2026 09:58:33 -0700
X-Gm-Features: AclHuK_NBD94GFwukMTzDWZnzFQVpepA-a7ilcg4xIfDlIrtJsUvYJLY7PXSbnA
Message-ID: <CADh2yMydLVUozaXJR=uvkkw5AjnxYhFs7V4dUAkfBs66i8D4ZQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Raed Salem <raeds@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: tauSvtdwEQQucGFWdgag1NcqXSLsukU4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfX2wHXagNs0DPh
 cSmoD1GUpBXRBfFUsv0bzR32j7RNNNxQyuyj9bYfunhd7u+DVYXo7/+gCFBuqTd5UxAdAJBE6W0
 MneRWFpzyEJLZ0T6ucCsOllcHKQ0OLo=
X-Proofpoint-ORIG-GUID: tauSvtdwEQQucGFWdgag1NcqXSLsukU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NyBTYWx0ZWRfX1SPsaeSzHW6e
 F3TULaehl9qJrA54a08DXlRg6/rHVKdG2zB82knAIon3YqBTeqI/IdRY1jBMPOtq61V0s0OOZ8R
 3uLsllfgYU25ItPi3rpBUfDfFUCVc5EL3SQS/OZ9iWSKo0wAPYyz3ksUq8RtdbF00sy0XV1woep
 ZUetvV/RfjPmbrMyJ4JfoDUaggpsmogavhGtrSpcSNiA8BCveeB7SOJdrPX/XWYKYkZ/eRb8caT
 JPlJXlwKDooKAPX6bYG/cqwi4ZIHj97ELIkPo1W6QnZ7dbYzYYFulRAjyY8iYqL7VO4+waJg4aE
 lPfPN3ZUxQsQ8/yvqD5mP1bBBFi4hjArYHfRz9JMLzMbPnfdBGgL7hRloDegV6N0IFoCRzA2wHQ
 IogNUchoKsEB6OoiNL2sbQf59NWkeN/MsUJDEu6JuQucriAlj1DbmqGrys7sB1sQgmPqNxOUuZH
 Es/EJH8cQKv6PQCtnkg==
X-Authority-Analysis: v=2.4 cv=HOVWhYtv c=1 sm=1 tr=0 ts=6ada40c8 cx=c_pps
 a=CsXZvLRfiTx/ye2xXAwb9g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22
 a=v5nOu5Z_PtvP9meoUtAA:9 a=QEXdDO2ut3YA:10 a=F7q00xkr9EfWfQvbdVXI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01

> Todd Freed wrote:
> > While working on adding support for socket-less psp associations, I
> > noticed that this case was not being handled correctly. It will be more
> > relevant with that series, because it adds udp support, for which the
> > psp nexthdr will be taken from the inner packet.
>
> Just curious: what is the plan for replay protection for UDP?
>
> As PSP depends on the inner L4 for replay protection today.
>
> FWIW agreed on the ext_hdr conclusion in this thread.

To clarify, socket-less psp associations will apply tunnel-mode psp encap.
So it is in this sense that UDP will be supported (not e.g. adding support
for udp sockets with transport mode psp encap).

That being said, UDP which is PSP encrypted (transport or tunnel mode)
would be susceptible to replay attacks, just like regular UDP. Except in
the sense that after enough time has passed, the packet would not
decrypt if received again (operator has rotated the keys, etc).

Not sure if you had some other kind of replay protection in mind.

-Todd

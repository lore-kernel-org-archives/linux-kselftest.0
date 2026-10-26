Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793052624;
	b=MFueBPK6wQJEAqKkwWmvmIj6roqV4i1YhtyckvvSKeZIrAhvlqHaCu2B5RovEoxPkg8U
	 h6+QYYAWgs/oBK69ZDIgahqZ9xRaVI09kT88ALsuyyJNeXplPHxa+Q3ioBh3aQmVHnfQo
	 355L9M69BppQ66YGq3mCxzItm3huqP5qrGaitSKNiNeJdKKFEyA4uz+mQe3i/95oYlvY0
	 Gu4Ghy28smAfU5zSMMYB427gpDfDzvh0xDd6MwWvEYtV8osxzZ+QzhvkhlP4ejzvgNh8F
	 v2JODMnkcv4xwEGOqOHkowChwGCohBRewQSb9WodL5fC4jp+e78Axwf4fRDOgTgGGKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=Jf+loG0vAvnxt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=;
	b=pyIfjLNLeBUMT6B59sc8TsNFJfD9Ut02FQqOTOe6xFgLCivqLddI9YT8UvTapjrY9cm8
	 mOVOSuJemR07Gub5XMCCUf/qn3936jMIta/WePshVJhvDvi3wYhXnMCqf9cCh24mvES2h
	 dpKiZz6brAfYi4eznGaR7dC6ZQfsmVd8wYDp1fh0h1KtIUPfb3hU9oveWPQayzCGRTD6V
	 wOdHhphawhAp/SdE74DJcFVPR/IVJB00wipEIoO7dTNbnUp6/UEiY0ElWDgodJTOky1Gy
	 LrTXmb2t8eXWIkVnbRSnnf1MC1TF+tgUGRssIgZkIECiIMmcXnucafbnYufSatCY3lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dZ9tR9L1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67866606A31E
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 22:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67866606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=dZ9tR9L1
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QImsRL3007935
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:10:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=Jf+loG0vAvn
	xt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=; b=dZ9tR9L1/IcxcsH4mEsKPx0GW5e
	UTGvTAWR0q1qhi/B1g7OHS+XHoohqe5XI+h4y/PThlpFE9BsEbWgJiN7eBQlxbFk
	c+8mY+yz8bMouKprc8O3DjrQU3Akz4oTvZpi4r2DjPk2vqEtNi0gM420ieQ5TBGQ
	OLZnhdv/E4lSiGhyExxYkBHSxocmkny3xTMO6kroAjj09D91kBCL+7qodbBM+UfB
	Z/cMVDLbA4rw5O2SP6MupF/qOmMi4axMzQQM+aUiaVU2MBQB2wI3Po4/YvMr8hp2
	zb5Z2ASgUu/S8qEr+ZMjM3GYoWb0Wyrhh5iLDNjyCR15YzzgAKPjekwpR9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hgtc15v40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:10:22 -0700 (PDT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso5080683b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793052622; cv=none;
        d=google.com; s=arc-20260327;
        b=SGqHMU0A3FVdP4zaEzZ3unqiWrR5G3fNzS02jOWlP7vyqoi5g1BIh42Tve2HL6K+PY
         Uu9vByJnVHe9i+2SdsCc3BPuv0stNozRDzuZPu005ZGPHML/aLh1jIKB83CGCaefBaUE
         Eo3BY0pfUb7PZX9/FpinEDri2ISEs4F8DPPNpwADsE3XUgBe8h0xKnNEN72Cq/FD12IU
         /2k6uJwqNJHjlN6CrC157E34DP32BLmjHRPUS7c5jhaKwXU/Uz9rw9PoHoBdzMx7iPpu
         Bvg0kRGos+WlTLEEPjHct1rUqehdKpQW/A0hh8wMt0oVJXY867F1ncO1I/G1bwsdO3ML
         6kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=Jf+loG0vAvnxt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=;
        fh=hpUqQc4I/6R8YuWQxGVaPQ8PdfRcr2YUKzM8TtLVwVU=;
        b=LjIl3cIdsiXw/mbwsfeN8Cw2yeGw/THzi7B3Wyz3dP0ftue/Sv5ST8EPQXEuUwPDby
         UfHS0w7JBUSSDbRlyFTea+DlUQl4qxDAPuYqzc38L30eWcyIvRQ7KHUTAhMPsmJMp4cg
         7PZSK92vvWnvjqXc0QNOcd4rbh5EFD8yHJ04UvyCX0f043RD9a1tA3tecYxQmpE+qwbN
         WKRzR7VkHAf0tfMp5Li0grDX+cp5A0Ib0/BhEfdxJQ8Kmr+5N4R3V//3HcI6PskU9fWO
         zewEIBGqBxAR5NnnjJumTZQ/qu1TL7ccHPUeKNEzGjPEeN991maSqlRCY8TynHuS9y1n
         G+EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052622; x=1793657422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jf+loG0vAvnxt28Kqn9IrWU5X0/8DtmZggaMgC0lLF8=;
        b=sci/di45y7rynkpr/e8aII6dJBqdseifbLzU4reRosWST6gz40UU/LifjDMwFIUw4h
         W+Jxab84oEvEbj/yR4B8Kxm8u74/CD4I+4K0bKNjd6hK9PsWsNf190axk4Acjs6Oic0g
         P+vfjfL4xQzp/Vzuo1bb4YqZX8Xovsqpn0RiPT3LeaKEalKU+ocWKcBgj5DqL/20pXtD
         XGyjWXmOX4/TNRFbguzQFbrySTDIuFcTQh7UXQuSx3LluHwLB0TOferikWMB3O/TTbc5
         MT4YV1qvEF45Bac3LjOw0D1Vw02RWLjKGQMibICstFjIUNJU1tuOZPdNNGnlIAE9ZtCi
         0p4g==
X-Forwarded-Encrypted: i=1; AKwUvByYYpSMDByT6FLk3zLcopNgyxj4q+CLtmh52sVn6yQpHd+ZUSE90Djmrj3HaTWGTDJrSxpA5ZlsLWUhpCdMpoc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgEEFaVhCtX/eHO5rXszKlZPu8w3lEigAFrzZOMCBae9uBtJtl
	bJ2ocwK4nLJDNliN61UT4qoGNvZAz/7xabOxcfQzhSSCSTxYpkWqBffUhYXJo/xSIzjyC/fRNYJ
	yps2qHixIQe9kjXWvzBNbU7MJFKDZawo3yoPUiMYjYlGiKtSAIbda+TY8OR3hqBmiu9ojuKRw9Q
	EWkfivCZnQvBuULwH3HF7NHBbd7+VSGuNqWERJCpQZ64E=
X-Gm-Gg: AYBFou226C5UJKSfCX/3oIDeGaS1prXS4TEK+UdZyXjoI0F4c4J5bKI2YGlzUbtrkOS
	bUPmRWfnXXh40u2txkPISFiGb1r0bsA64FZBnq3rJ1DUiREfeuxGu5FfV5uKtRlMFHvW8Ih4Nyj
	m0hlRQJtok2PuiU8xdK53OmTsF35RIbF6221Q6HZh/BezD32wT2+yA5bAZZXdHV9aZVOeNtlHnB
	ZDX0xJZtRAISso/HlRB+V2FBfaRvoMyMFyrKFi4s34XbZcxFgM=
X-Received: by 2002:a05:6a00:a211:b0:887:3fca:835d with SMTP id d2e1a72fcca58-8a36772cabemr7073914b3a.29.1793052622040;
        Mon, 26 Oct 2026 15:10:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a211:b0:887:3fca:835d with SMTP id
 d2e1a72fcca58-8a36772cabemr7073902b3a.29.1793052621627; Mon, 26 Oct 2026
 15:10:21 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023234640.1459291-5-toddfreed@meta.com> <179288570316.3134.17338958323067090592@kernel.org>
In-Reply-To: <179288570316.3134.17338958323067090592@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 26 Oct 2026 15:10:10 -0700
X-Gm-Features: AclHuK_YNIc8WR5zn4HQHJZd6E-TfuSZHowIMObN80et51S8RIsFb5U_2Jx7cYA
Message-ID: <CADh2yMxPi+eNkQSVo5hUr=pNsnG21ZLjYf=GMFPS5eOtyedrAg@mail.gmail.com>
Subject: Re: [PATCH net v3 4/4] selftests: drv-net: psp: test ipv6 tcp socket
 with extension headers
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4OCBTYWx0ZWRfX9EGb3BlYmkSD
 Jg62o0XYuqOb7qiqvq93Z9vob92Be8oCrX69dPIlzI13l8HNkSrhljo77wzA0WROjbr0pBHgWav
 P01tR5hpIK2K4Y9nLD9U/JDSLQxj9DzPzku1lSMb7mTq4/4uWt0lurCOq7g5Ny0WGdhR5Urc04Z
 WPNBhHsv8YzGpInQObhrwn9B1PYi+E5oxMNY4b6eEh70kUTg7y0XdMsUI/w6iyjVSNuntd75toh
 9iqyCdDUJ+mBD+PMrfJe72IDy7LDpxo0A0t/OPxdVNFa31VBL+DqlQTiH7/7BSJwstQRdD4WHNE
 6WNCvAuOQZv/KmcQ5ZFvg40GiI1R1+suM9A5PU7EkL8AraBXPzuR9lNyf5nvLijjWbMDMYL2TAT
 /PdNx0BmJBWOh9K8iLvWBAnE9cro7KwH06hpmhXpb5/Ndq7uGGBu/4XYTFlgyx55UJ4/RFkjLXP
 CMNC7gS72snCS3t+IHA==
X-Proofpoint-GUID: Xt9A0IedmJi1amRGQHZ3cR6lCf8-u_0f
X-Proofpoint-ORIG-GUID: Xt9A0IedmJi1amRGQHZ3cR6lCf8-u_0f
X-Authority-Analysis: v=2.4 cv=eIGGH3p1 c=1 sm=1 tr=0 ts=6adfcfce cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=wrF_2KVHrNPQTX-trsUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4OCBTYWx0ZWRfXxLSgg0Kv4uBk
 Zx/Bgk1M7Do/jBPHw0fQMdV1FzXh1Cw3tF3TgJlYaniW13Y8g2YNOVEVgYuH7oV+Q0LTuuB9nZt
 p6mJTPnmmt98qjcfVJMIdP4ysVTYUuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01

> [Severity: Medium]
> Can this skip path end up reported as a failure?
>
> Could the remote filter be installed before _make_psp_conn() is called?
> Another option would be to finish the key exchange before any early exit.

This is a good suggestion. I'll apply it to v4 if it makes sense (though it may
no longer be relevant based on the other changes I'll be making in v4 due
to the other finding.

-Todd

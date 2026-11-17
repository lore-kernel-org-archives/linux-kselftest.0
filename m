Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954007;
	b=n+CZUBHKWn4IimZKlHkcCBOnDWZTafU/w1E04CTyDj7+U20ydNqCdi1ZW/k54EVBgCM6
	 q4iDyZNFDrNfYACvJ7pO0p+nL8lDLnkHyekY/V7h144eWPThHPc2jrjVl7S5+3ps3J5wR
	 3qwLMjksYA7DRXQaEcDrW/PUp3jybQ876vMwhKhgrMp5uaoqOkpN3b7cdTudWe32sI5Vl
	 MTgCk2leWsMo7HBd8v9/WKosVR2DmcANFz6Qp1xbf8wqYyZdIXfdfCxroYv9rgjKseJst
	 eGQtunivAHaGiD8EKZY6olvzL6WSwQGu6MdAryliEZDvIETC7451Ndq9cCP2jwvu6ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
	b=3Z9Gt3M+UJ2AxCs87nN/HWI9mU/71ZUwX3tOLAMFV42gWs1xNBRag0isZdxlA28Tr4GL
	 KFV/bv80yh65iNhw3+iF4HTbCvvzCJYQBIi9e3hKYJir9IOfopZUWQdK6y+YJyzcw3QLq
	 RSP0Fd41xB9gUJPKQNhhu75SLxiaVwxAgvS+JZcZVVHqrkD/DJmYjeeb2NJuCwwx2ekOe
	 Pp7u4RKI5FWXUukCjFCDrt5vohsyLZARuA14a5ki7H79HPW64ThH3KLoxRdfpqinDEzgA
	 AEwxHOXf9ZdLwFtcsGMPM6cJzU/jnPSpErkxuumryIXBJFg+tj382gB2XAyOktjj1QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4A4606A33E
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB4A4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1s1v2206180
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:20:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=MrBB22VyQQ3
	4wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=; b=de3QWr9uJo7zpRux5nSBZrQPJI1
	ZuT9RzWRGoDJ4aCQ9SrU4Xxw9lwDJ7b3OmHlR8+w5tIEz3UPpJzxlfS7NWR2ntEF
	Sx5JJxBsNLgjr1SvG/Lb2/HWRTnrHpAqHnl2JEhCnWbe7ecSMNitIJpelIQxT7L/
	5ownN3a8BAw3B6TX+M2l1KOePj+0a7YZornHlcIw3dusVrCnZ3PNUvjXrb1W3Jbq
	9eI4VDUod9rq0HPbutUCHOxnMkEyvDODXmpDon9TP7Jv9fAYKQLTeTydSUIZhpUC
	6/Ldc6GrPMpfUutcKYiSWDp5WJmepsbra64rsMl8Xl+kkyO3/xGEv7ORWJQ==
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0vrx25ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so241647f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954004; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVr5+BarB7ks65gSv9gq7tgFH6LQUw3XGl4yNliQEXIx4x9v/SOhWKYPT8/WLA0LID
         i/l/Od4334RHN0nQBItFtrExucVSFujSCLHz4/Dn9wUBjJlQ1ywT09p6E7TRNc2Of0QQ
         9lWJ8IDXlZfvjKv/6my7AVvwlTkiqM3j78VP3nMF5KNPG0ZwgPIUlNwxukMD35b5LhGJ
         8GlNF7dvevhrwmcC3f/eruuF+EBT+2seQxrFIzpQY3i5qYMyA38BHEc9ikxAMUhLXsv9
         S3CVd2uMyoh3KalxYUk6O8gg/wY+eKrc6DK67//Z3Xr5KoYXGP2HInMUeTtdfSF/vY01
         48VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        fh=CSReS7M0b4ii9ntH2DD4qLnH8aUBJrD9PXD6+wM6rh8=;
        b=ZxdnECShL9DPfszWhRbVaSmLQeWAWge3ry+SjBT+o4WPN226AobZVM7RqsLHBUvqxU
         6ZJtIeNzaXbsn7SwsX9L5atAPKwwd7+0PP56fjkFJ02z2WV36IuDzOuMOOBpsYvHpMuA
         pChEyB9gxBuBvvoN49pyfDyOKAnTfRo7lW1Y1egnE6d7JwguBaBhtw4AogNXDKKW/E/B
         BLDgxUDwOO+aUtSOHEh6g/J8FUu2iJsobl258Df8z2TULivvQtjPwBa8MtCrK195oQII
         OW0Hpm6969th9ip7fM7eZ4grRNum8DpSiF1CP2rsC90XXKnJG6mrSCC+a/Xm7djXNQA+
         yHLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954004; x=1795558804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        b=zERJFAXqFFLjT7VIwO2mAGhJobx4A+jGueKY61GrxfIg2oWIjeZ/8AYFnqVjM7vgHt
         rcHuCBGodhnkn1y+LJolGRENZqWFAiRtEAc2LeDpIGL+PZFqR/te/6kBCPzwUumfvG6T
         U6OYPANbAGVex7riti7fZDb8XH5h5QA3vq79BPzuuVkGr0bjCH8xfcfBLtfuXbcPEfMH
         CSpvGU6PtddqasA+OSsQLVr/xW+cPQAMpCsxeY02LRsIL2icMYPGaRi1HNVKuEnTezJh
         DD2g9Fx8JCg3cVQFu8c0tcettzrefNjtyXuCRKQBZAHRTjSmWRqZQoMnSqAaxF+os+s9
         Edwg==
X-Forwarded-Encrypted: i=1; AL+hErHevKtF2T3jHAOy5esTaAZlbJY7icQWd9l910iw+vfhisl7QjPD6V/HaKbsXhHtDOaaSNK4kGr/AejM4tWrpqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ak3ZzdZueCNS2cGnFRfvqNk8cXLiDVTjFAnez7bNU1KEZVKZF
	+2T5WieI7w0GgC0EYPxdu/mKTe5rOe53XwyJ7X1ZulJgG95iQXb5EufgEuqs37KJZAL9J7AofbN
	ZZ/iDvrw50b7XWYSgJ4ek9ODzU2tDXNX+ISnrDdOw/KkcvoM2tVWARBUheCld3fpecKy+aEMhNf
	2TtQAmM5rJUjIlliyVHl38uZYMGHr5EXgcD/SbM92vTgk=
X-Gm-Gg: AZFdTZcUxzra+Zeqp2hB/xxOTwjGX6yUHPhEN01Jlt/01FfaFLlNe9RWJoKcIRmKI1a
	rzNvjCdSjTE0aesjNCW77UR6EJkmhgLUXxcIEHDBgzD1tYMXJozoNfr7QbywHcNmWg9o2/Y+K4w
	kUhAurbxi3VOu7BpJSWwhLia711yezxxGyiRlMoItU7KI1cXbuTOSxyKUZFi/I8hwxWhtewpKbN
	1tEBhyAvnH+sFw9FLEX8MTCJUvuAz/8xr/cgJDYldMu6eD8NCc=
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id ffacd0b85a97d-4a6331c6cdamr2082673f8f.4.1794954004398;
        Tue, 17 Nov 2026 14:20:04 -0800 (PST)
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id
 ffacd0b85a97d-4a6331c6cdamr2082645f8f.4.1794954004046; Tue, 17 Nov 2026
 14:20:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-5-toddfreed@meta.com> <179471269504.2199510.18115986956046547098@kernel.org>
In-Reply-To: <179471269504.2199510.18115986956046547098@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:19:49 -0800
X-Gm-Features: Aa3M54pE3seHebOeBtbI3cDpMgrW25pWhWq5MbBS5In6ZJStfYB2VZ8sEpNY7Bs
Message-ID: <CADh2yMyRSH4ZKZaGxFLVXHTE6v3XF38jh2OykqXRxvP4=0TKgQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX247p7WGZ/l6H
 Vcv0OImsH+ifsSbXyO8f5IQX57iyGh3DDkfjx8JYY6uPDlA56mGXgAB/gGS7TmkxfMeOkOf6sFg
 8M1Km44obgniCdtgren/OBGXwViUOwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfXzmHyN0t5Ho+t
 mN7RJJj4RS6Rg0+fqfVhW9+5oM0nDh5mSNdkDandan32wwnPHfgBs6d9dS2vg73eZe53PPz2I2+
 sSRJbZjrV+pLNkSMHgGG1nIhKjC33p+ocOLsIrnLInaHpJlqQVxmzfLyIPkX79Dxzqu10iRInB/
 dPIUKMvno6K2Z6MVuINbfW8wjFGnvydL3iW3ipcYmzsN7tRH8+rcfBEjBu45DhGnXZOZLuc0MIc
 VDqs3YwrL3cvx/GuIzzqr57ZO3XByFbpYP08Lz/XcMB47sl3bD9ayu2Usl8TU+U71Zc9URCUuZe
 pFSYzfPQ5bSbnKtW4eoGIHClcdMCnmxaO5FHOWDSH8aNhAg4zEXpfS8YrEJHjZnhz+i9xNPaT8J
 4kMBNForp/6dbxrgwtNmIZYv2Y9feJ7kiv8Tmj0hhbMbsBSe+vu+JuE7t9jBSUsAyOPedJttO24
 1lN/RxHebzMVlCmsM9A==
X-Authority-Analysis: v=2.4 cv=duNOmFg4 c=1 sm=1 tr=0 ts=6afcd315 cx=c_pps
 a=C8Sa+zVB7PeSwznsLr31Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=6yLQ_yHwUL-M3baYCL4A:9 a=QEXdDO2ut3YA:10 a=eYhU8IiCvE_ms1W8Tcak:22
X-Proofpoint-GUID: dLtL4xG4aMTjAW6mC5YtDAo5T4sAKE-f
X-Proofpoint-ORIG-GUID: dLtL4xG4aMTjAW6mC5YtDAo5T4sAKE-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> > key material enters through netlink and is never reported back. no key
> > is stored for rx associations, and users reference associations by id
> > and never handle keys
>
> [Severity: Medium]
> Is this paragraph accurate? The code in this patch seems to do the
> opposite in two places.
>
> ...
>
> So user space does handle keys, and rx-spi-alloc does report key
> material back.
>
> Could the commit message describe that more precisely? For example:
> "the Rx key is returned once, by rx-spi-alloc, and is never stored or
> reported by assoc-get".

Yes. In v2 it will say the Rx key is returned from rx-spi-alloc, but not
stored. In v2 rx-spi-alloc won't create an association at all.

-Todd

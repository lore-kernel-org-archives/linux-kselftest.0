Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151462;
	b=qo4X5eiOU7PYs1AsBLRSteCV2V7CNvyaTn7Kud9Ngpn5vlcnEJ69E5CvcnxDTPoMR+jY
	 34tcAJwYvTkCOb66kEdAArxPM/Mbstbkqy3UAd7kRliqMLX/h5SGgrLmR580Mp9EjJXeL
	 4NrOgbduD27qGCDefCypNyIC9RYu+NItQkJugrAetsBRGBU/219KeMAxIHY4sgiK7iXHS
	 0bOLdITEuSbnE9QD73xNFmsYVk11p5R9tikz66Cwal4le6NbLF1jrGYfsgCt7makZYsGJ
	 7+MSO9P8d0pTl8q34rm+RM4vHQEiYGthT7ahFolFF/YY1MGDwGyyYTaR0KEodhpbs2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DK+wvhFB9cC/ykY+2Qftzi8KfweL9NRM9vjrgu6Yo70=;
	b=Ef3y7S0CoR22oz1WzBI2P1tvR1zPd47mJwoFwylgIyRBtg1EQRoQlHg6YWo88CE8D7+L
	 0Sy7B409Xfd1zwHIwUuFGCIJVp4O7w1ryx9sBU9Wk/IW2zuDBvhGO80xnGVxo9lZwR6eZ
	 G2QBQQVbKNjAsTCwkb9W0eABKOO+GkzkRwSUTLU6sdHuzaYGpkaD08WmWASy7Y/bvWPEy
	 OCWrnPtDHxFi8UQggwxMuia3a7i60U7eN6W1SFBp2GLK3oQERXXq3sLy6D4WNRWZRhp5J
	 aU3NU0Cj/xErXVtM4F+vZcmtHhNRMoHWYucKpBplmo5EJaOammhmf4LhnncxpRYo7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YRXwVKQv;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFDB606A326
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 15:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFDB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YRXwVKQv
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so15325241.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 07:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794151461; x=1794756261; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DK+wvhFB9cC/ykY+2Qftzi8KfweL9NRM9vjrgu6Yo70=;
        b=YRXwVKQvX7MBcDAxqrMcNis3RuOHLOW/Wke6qW7We2eitBKszCUrotRLBeyS/C/QHF
         sMyzSP749prW5oaZMkcJd5CQVoDRGtFdVj+sRVMK7xHOjaeavvTOTVeWTnbbGBjDLB/Q
         NiWPC5npIqRBExZEnCM3v3h6d538I94eiD0HnSKDMljyCH1uJi/V45uyKQ+iUZo9xE9l
         hlYhbI1EH0cN+r6Z/+lU5ahL9DZX3AGcYW6cx5I5Xj5lnHGgKG2FaeaZvgoB1NrSMIcJ
         8ckCeXVrmchS7hhY5HRGvj+ZMo6EO1Yk6JxShlTMvkg0A+TzCny/D5h6RksN0f6iH0ih
         rHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794151461; x=1794756261;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DK+wvhFB9cC/ykY+2Qftzi8KfweL9NRM9vjrgu6Yo70=;
        b=sj6om2kMgbGt3HKE87LF6O6Vo0XltfcQlMTS0I59ieJdCA/TcXPgsgpTHotTMZ+5Qe
         cW3ANDoKMrT9YZDCZkpDh4AqMJXEgnekmUkoWXjN6/xn4T9NfqceeX0uBV3950vJKgA7
         vjJhmiDu+nog5mSweEm9iCVJUaMzbIPRKatOGiU+lGbM3VGpwvQuP2ZGdu6IpXKIuvVL
         l0hlPuK+tGGOMSZdy0RtgHh6Ltp8xEtDPerKa/1UZOug3g2tV9AAgzyzmQ4s1PS9i2CE
         hwZ0VT+2mWXJZi5oTUCnydYO3pqg1Qf3ithnm1B4ujP1pjwZ6F2skRVL28GKIDNRjGnU
         /Y/A==
X-Forwarded-Encrypted: i=1; AL+hErGNMuwCmQ/c5qviLqNcH03EsNe4wnjo9pU+c8zIymdtAmD4BD8hEUt/t/WD6dhIstZRO1NYOnO19g8ShbRJ8xU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7sozHeobYuF91qs/4jPKH7yRf/Mb3MtazvPuPUex5w5nSDBY6
	6+wW+WfmZcZphFVkeQlfWp/8WlqIkQBUWFLztNvkNWkaOfulvZV5hpDIwd6LhMFJXdg=
X-Gm-Gg: AYBFou2aaZHpDvi+X0Y1fFm4XbJSwHOvVm0IDadInUCIyaN2IsASONjKzBMYqMGL9LZ
	UORseSY1GRQUIdGHXM3WbqafVsvyvRBOiBcIWvgBz4Mx6Xn0aHhojDS2aCaH8/boLIe889Nb/gp
	s87ENZqh+MxPrj1uYSWT2bRxGrix3WyaJO5F3yoNMfJwwK7yKP7L2vmo+RUX3gAR2CzmcnVnbWh
	qjncegJ9TXVkpvo1yIjwC2rZVXn1CEaEHM2Pkv+RRQK7zBCmr/NogyF1XfmY3zxpGpWMLrLThIs
	eZJxmR1qFKQ97I/z1No1dKV/NP87ubmJNJFHaNJ5bPc7SPxC6vuJgsMBA9w1mkTTX6sMRNRP76Q
	xr4C6Xe2jQO289f7Yr0glvKKnQcREckOlaA2iLPn108oeEZCl+Vn/zaxKP0Xmd/l25axx1SFXXb
	W+07fz5w4wLFB1QieYOsdPQM9SXhwiihTujN5KmjJneSxJRE8NSDKbuY1UrP4BqII1FQxMj/eWz
	Ait1xC9xmW1c6qLnimTNLzWi/oK6cjYxq3ygiBWiL4t7OuVUsMnCQwWrFv5YUxXVqKTi2UXo2SQ
	whHNvs8OsYiFWq7X9gtFa83fdPv2nTBSme+6amnbScHQnunvndepsUAdrKku4MsVHW66oH5R8L8
	j5ttLlawaT2apfG4Q+pBYYeDEx5zLK7zRXwCPD3LHSrKt4/ZJ
X-Received: by 2002:a05:6102:508d:b0:7d2:840b:b064 with SMTP id ada2fe7eead31-7d2daa8ec5fmr326255137.3.1794151460771;
        Sun, 08 Nov 2026 07:24:20 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece60c1adfsm2166205e0c.8.2026.11.08.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:24:19 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/4] riscv: Add support for kexec handover (KHO)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, rppt@kernel.org, 
 pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com, 
 shuah@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261106071459.2003-3-cp0613@linux.alibaba.com>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-3-cp0613@linux.alibaba.com>
Date: Sun, 08 Nov 2026 10:24:13 -0500
Message-Id: <179415145358.358073.165272378597657083.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=ohwRzPbI/pF5KX5v3Lzs009TPAWX3IxDBN4XddXH9Jk=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8JQhhVigFV4eOxTx4e3e80HlzS/OtAzSEvy/o
 QEXLdFCC06JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCUIQAKCRC7dyhM23N6
 3jcdD/4utq4C5K121vM+fg4odzwfN+cDjx2VRvt37vUTCJl2NKJyDEA/6O74csfV+flN3PepeIe
 Z9mn1ZjNry4hdEYrftWGGTccrmdMzbJnCBtpRCnMLoFjA8FpZY2ACeQIv+IcAkhMOa6wphuDtI1
 N5OfQGqjO0rGApz2R/3xqFSutMTKfiiAY1qtbSiSSWRpdN5YUGxyFL3rebfa/JcPZNB+3Dvc66h
 MtJEyUv0CUrr28lnHvtDe5jWmWnab1yHiiWNGZgBcgaZRMV6UsEGGALfV79zwuIqAqWd/aLq/jW
 VyhN38LrLXymGAb3N6edWgXBKb5Vw/QPsU4N38+QNx1C94ZluCI/raSClLXa64MjPgyj7Vi+yEg
 qQSbI1WFUVWejGUhZBssz9xgwkjx1/WRwaIMWs/jz4yK1Lg1k0fx8oG7nLhTux0NrlFIkMhuWfA
 kMEHUoBr+OtHc4mbRL6OhmThZxeMXfDd2UU7B7l0p6ulbzfREE7ZoA3uYPuju4iVcAQ9b+0hj9K
 34WZZ/zn4tj2f2btFZ0ruN8PS7KCaYmn3249Ay6LlsI0n1mbqyytmeXLPExkib6jwIEp0JSLPqC
 3//pyo5DhG88hIZrnh55hwcBJg8Px1HqmxDUqoVsH1MtHMJtKRyHcHy7231ekVpw6Rs6i7We2fG
 FUugHQuc8USPaZQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

Nit: please change subject either to:
Add support for Kexec HandOver

or 

Add support for KHO

No need to spell out right in the subject.

> The generic handover paths are already in place on RISC-V: the outgoing
> kernel publishes the handover FDT and the bootmem list in /chosen of the
> DTB built by of_kexec_alloc_and_setup_fdt(), and the incoming kernel
> picks both up while scanning that node. Only the architecture symbol is
> missing.
> 
> Set it to 64BIT && MMU: ARCH_SUPPORTS_KEXEC_FILE is already 64BIT only,
> and KEXEC_HANDOVER selects CMA, which depends on MMU.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e7891a2a89da..a5c56252ff44 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1125,6 +1125,9 @@ config ARCH_SELECTS_KEXEC_FILE
>  config ARCH_SUPPORTS_KEXEC_PURGATORY
>  	def_bool ARCH_SUPPORTS_KEXEC_FILE
>  
> +config ARCH_SUPPORTS_KEXEC_HANDOVER
> +	def_bool 64BIT && MMU
> +
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 

But pre-reqs. should be applied prior taking this series:

1. https://lore.kernel.org/all/20261023054518.3258350-1-gthelen@google.com
2. https://lore.kernel.org/all/20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org

-- 
Pasha


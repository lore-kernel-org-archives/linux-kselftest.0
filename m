Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059DB406804
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343401; cv=none; b=SGsbVeX5YpfsXA0WUVnOStntlaqoZ/nQkJZareokOl0SG7Mhb/Q3E3Um6tHLk3zdH8aPF0hhkUaRQv//ul6wtXC0kHQk2uP2HFD3wrbdQVfDXIWGa69DSv3PWC9eUUmUqHV9LWacAaPJ2lJs3up44tULLKxjfCBMc/uLjmlC4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343401; c=relaxed/simple;
	bh=+WJ/hu/3Wga52spo7IQdSXB7WSieQhEpzGVW/oaXQhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Date:Message-ID; b=HGttIJeZhHsYCAJNm72fGpUqIhsfEQVGT1s4YWQ3rkjydr42SSs9B67UrFEALPrw/WUEsi+AD9pkp9OecuEFkyTrxIQWUTBcvRjoWgExSRAOIojBSzef80gFi2vGoxDccx5KdDlk4HWuAOr2I4Hyni8nhlsX97aZhIAK9oM0Zt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHsk/YMk; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHsk/YMk"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad211ad92bso233112a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343399; x=1792948199; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WJ/hu/3Wga52spo7IQdSXB7WSieQhEpzGVW/oaXQhc=;
        b=LHsk/YMkVAj/JDH0R9Cn2AaeSDuZT+CToHn+gDN5M+G0sg8uKEdpiaAGoV3JaYlaFN
         N+N9UTu/M1cL2Nor+whWrkcvv/4pOPJj6pkxgbpC/zIQ6IArcbcBkGM9sKdloaCfBvcz
         lQk6ci1aatKa6+vrdtMR1WMz1d2dFK7wK9/EsinGGDfMNLdVAqj+RaKDFJvw8nt03+/1
         8NEtxsNVHPgKODVIl2XJ1oRQoWbDaSdfADM+Yp9KWInDAR7l0pwcbDVVnZuCPp3ajVRO
         KezsJnW4GJd4bKF//TyfFSoFILOdqhqQ0fjnZTEjGtfwjurWkCvYA5CjU+VEBjdunlVB
         xuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343399; x=1792948199;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WJ/hu/3Wga52spo7IQdSXB7WSieQhEpzGVW/oaXQhc=;
        b=jxQpF1S7WMF0j08WqwmNsbeOflf2aYm02IR4HJMADULib+ab7QyNAjuhCoRuWfUo2Q
         678gb7+NH9ecYydDrc8u/+UGBBE8baWOsM4v3L9bh67yy2uzdH9f1iextKAJA/Mza1Dn
         wm2RAwewkcvbAQ5EhVSjcla3oJYV9gIUcyWuzHcVrs4BGpxsm0XOXF2i05XZPYUtFMDm
         zluDJZ/OCYq4XDzo+1FxqrtZoEMEtTFfcOrXRJB/JvWLsfbPRxTamVw4c12cO6K6s73G
         U5rZk6DNPhS+BS67HklK2F0IF4zcMMLgfObSE70scz4A4d7LgQa/NbiZmnvyLOkNqxF/
         abrw==
X-Forwarded-Encrypted: i=1; AKwUvBwrwmz4tRDK8Ws/9aGiejAJUSgQ9tq+2DQDKS/97J7d6H5hCCQu1qICumdu+t0EoGj+f8zcYd/OTBCXM1E7ITA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXcSVIAmYMEuxV8airPh22/ZYCVMfTbFkHApI6vhN/t8ekCNzw
	z3UNHT8DKcHo8ehficqOoucJ3CBM9HC7gsyxJaypbjf7D5NB/wdU2qxU
X-Gm-Gg: AYBFou2Hyt7Z8lxfA94u044/n5kIpFX90MrCnBKP7jhLmdXyWQsDCtIDf8mpsAn4eUj
	FpVONuXmP37wmsWz0jZoVEIwjPsNyaO7L1PF4xyS7U1ZgqfJPWIgWjjNn6lQPRdPsNfyKNHaUJh
	eUfeLZp470WS1hi5g44ifz6r1UHHj86ukMIGUZzTpWZonZzcBO/hoG4fmMFuFuKrlIP1RVKpSCW
	qC/9xQ4B6CZURWBdKK044bPu3cvgraJQpWmRAlVW6ra7xCB616gCBvX4j9tPhIDYAKLtGLiyGR4
	nFRLbR6AY3qQulOfMm/88pxQr4F/HJUpKa6UbvyUPVCNFjDGtRFmOcB5x0WiP4XDvcT3+q1gLm0
	DhpsogVwuTvdXQO30DTUA3UA06OQqMQLdGq8LmMP37FcAi/KtjEC9/mU/+bsX1HAqB41PXEfVw4
	lnX2vQdaMxhurKuEqZrVZJdSu0UtP+nfgXFm7S1WtakRqOWmXjWWtlzq5J8Un5Pcv4zL/+ccULb
	nWsmZmbEpyZG/+IRrhdyCFdxLWQ22DgEHlQVYGhsSaO1Sjlw7nAFE/lExF+OytzrmQ6vYCPTgg6
	6dI=
X-Received: by 2002:a17:90b:57c3:b0:3ac:8ee5:e007 with SMTP id 98e67ed59e1d1-3aceec24801mr4102774a91.20.1792343399360;
        Sun, 18 Oct 2026 10:09:59 -0700 (PDT)
Received: from [10.20.15.86] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm17396301a91.14.2026.10.18.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:09:59 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Cc: SJ Park <sj@kernel.org>, Shuah Khan <shuah@kernel.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/damon/sysfs.py: stop obsolete_target shells
 hanging the test
In-Reply-To: <20261018020415.35567-1-jaeyeon.lee.dev@gmail.com>
References: <20261018020415.35567-1-jaeyeon.lee.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Oct 2026 01:09:02 +0800
Message-ID: <179234334286.2.7819752603607417566.damon-sysfs-tested@gmail.com>

Hi Jaeyeon,

> Fix this by passing stdin=subprocess.PIPE when spawning the processes.

Tested on x86-64 KVM, works fine.

Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir

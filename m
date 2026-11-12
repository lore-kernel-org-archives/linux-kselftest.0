Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794511390;
	b=s1xdTTaUUF10VZljkFCa0K4/Bt2lds/SUg67zSLS/FStrlrGL3DemUnFdDhnu1XQAJvq
	 oNgKYfIn0EZ9K4aMganThtZNQWN+vMjm6YfLAJCvBO/0uviCzoD0fA6XxuRMcUifyXYkC
	 /AF269ZM7K5iQcOb4Up4j9SOs/ninv2xBkPyAMTHwOnv5xS+7BoFx2jQcHBCysiQujTgx
	 z/d/bmG9d7jYRpmX3J1KctZ0MSJFkE5E/nTmMxyNyywpaKwbO1nIrKr6CfWOHkCHzDcob
	 kOc6ktqcoTif35n7g+QHxwuLCc7o9YKcG1PI5tMKlZhk5OZdFDlpn4SYKYrhdrKZUKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=VdEkgtuXYtt/7b+6W/wSEG+UqYWU+snYAFASoVUZvUY=;
	b=PGU2eZtUuihM96NUFRqnLbUMvU05Rm3jd5hBF0fCX7+6xHAiJOGlY3XDF9eJhqwJB/xY
	 7dXqfv/rJKarSqbnMC/ROUAIW1IDQAYz/z5p4FmbuKaFh8tuksKkjkyI0D+6Ef1Vq8EH6
	 FvNF/h0Pw7HSIx7cJuYkjY+E2XuTv176y1ROj0WKWD4F2Gh/Pp4UPE6aW9Omyk3Juj9nV
	 q3CLxW5UvdTrU8BM5vSJ7rOnZYjJjeo7jjaICha87g0x5pXYfPfpbK7ndVaCvm6sXu24A
	 0wMXwgRW+m1/6QN9l9rvA+9FFYx648/676Z2wChDT+uRxBpYuQeCMesKmqBwWL6GubA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=YaObJsQ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1787606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 19:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1787606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=YaObJsQ4
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACI9crq3345306
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:23:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=VdEkgtuXYtt
	/7b+6W/wSEG+UqYWU+snYAFASoVUZvUY=; b=YaObJsQ4RX93ahosRZQ1mINC4Ug
	Ggm2qbab0+LUyE4rpKMXUnzg8PF1HyVX6t1lmTNkqRosQ76FwtlnkCk7GQQdtTQD
	OpBRFGhkQEPgw3w1+HwKWy6l30sHT23BrQAx+mq3OMBIjZlxaoAjoaAlERC7l/VB
	jZ/8YzCIFOuC3vP7c8OSAVSKoqqcbc+85r/gx2K7KJ2g6faLq9K8PgXSi89Envvt
	7amRduCPGnbwryk5VMKkLiUWSPMrbMrW02iG3nlTNAbIGJaQHi9OH5E55VO1eVZ1
	I09KzarxNzpv/nnSouiIbTY2Dncr0K7QAoaKFKujWXrOOiahKo/WVscXtag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hwjg5gnca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:23:09 -0800 (PST)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea381ce04fso2055085ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794511388; cv=none;
        d=google.com; s=arc-20260327;
        b=RzjbF/k8Lhnv3i38ucmD4WEqPFFS5ZctuN/gzHxQQrql5ks+2+izTbA1lr90x2DCWl
         x2Zjvqnkkj8VscQBYCUQHFzeHLNCSZsC2mIT1sjParLkl58JMNTS0LM9I9eUNnNEPWlK
         0kJjOJZQRiG7PEi5ccHZ4e+4zzqOyMJmU7xasb+GiCDM7XzloCfZNDS1XMAIL9I45N/A
         ce3yBdkVOIUw09N7Sy2pGTgWgtKTbt+CcpFEeZhddgJETs6ZgyUWZrptXlgz3z0fiJSM
         GyCgvO8d0GyNrqZd1hd+ycx4wdpiPGGIJWkolcZx4eKDbnbKfYTORUQ0qve8Coy6rQgA
         +7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=VdEkgtuXYtt/7b+6W/wSEG+UqYWU+snYAFASoVUZvUY=;
        fh=hS3JoMIlFivY9hUlgGhEiZXKGV7gIdBC/B2X/JF2/DU=;
        b=Hz9D+9iA4PdK/7FHiNMj66pfnBA1PhnVFyy+atEUHpndQxwXAp/dfGGizs6iSSQNkq
         EQw4iQ53SuU4RskNwmzmQ6JXLrYi5ra2WAgjwZrBL++uKxDieDnLLf7rvvwzB5o0BfME
         LJuspDM89ej3rHtyGolMfoSy/l2sUEoUfGT0UmswBYTZFMe/xv4I7blenSiSNdDj+4Bl
         50fDiRoR1h0LFl6GgMCUmTNjK304l1bHNza91uXX+PAoipC7yzLzUeGlM6uozj6AT7py
         LJ4Ngxao2f/zshYEPPDlKtyLOjJDzl4PHQqsrr7zZNSnav0wu8BxTlxiNwt4m6fVWvMp
         kCKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511388; x=1795116188;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VdEkgtuXYtt/7b+6W/wSEG+UqYWU+snYAFASoVUZvUY=;
        b=tC+KoJxL93TMCjNdJAFAUa6B9krRH9QjVx2s7kL5jivFwbOdCKqvb8hFsXEtGSzgDb
         1bg+lwhyNh6Cq9imYfzAuhn//gTVHhKcnJY5pp/xNf7ir+PN5ZRNiYfMrFXNQ+TbrRHT
         cZBqgoiDPi9QD/AGyaNmgL9q7aVp9F12RA3rSz7IoIDbWFVuLcuA3s4slCmk63M1ivzC
         uY4mc1bfgO46ivXS7Yf0GTs4yYwPz75sFeb12sLH2/Uxb3Qjgdo+T2+BHkak19qLuan7
         dalPi4w7h9fmh35lVB4wLIPEE0OjOzkTCFjyi8D3rLHkLoUhL9wViWhBwK20QKA/4Ldq
         HnnQ==
X-Forwarded-Encrypted: i=1; AL+hErFg/bLW2vM3lyYp/D1HbazdzrGrdaJo2Rt0Y8ONOpFoWkhgu7ogqQMUWV8m+sL+Wxzxj+XDguSGQw+lTFlVoA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k78TNQ2T//f/08Py9F6KC7KhFgbTVOotz5xxaSsM+owTWTZv5
	NZCsnBK8fKD5zIQ3a6bmbZ5BVn0BAxGIS3xJiHLrVPD7igZkfqm/iX9M+2E19RejFkwHd9LV0Kz
	Qf3no6hNrmJXUXTlMAEhEZC1ugNpIX47BXgbROW/llE1sAsV4/yg4BmryeXJjyQA99JBPlGVX3M
	yqhyfBe2f5KeF9Xs1yty5zCyUJBNnsz+R5hJoPmiM3/4fGKR3QRdI=
X-Gm-Gg: AYBFou1Qga9iJHpkONuzYl2HPvkOAStxp9x5ehM+e7gSwz8nAprPRLKR12/laHPlHsX
	yY6K+wTDmMsWbzi6C6po2mGGPNRfRKYsTKsJvDSXaOsnNuJhYQP3EzaB8Rtb2X1Q5rO5aA+NVPp
	izB1WYRG9h1TdmzsExhoq8R3Rs1n6rKfDoF+8bdw+7xUe4eyEgK10LleaY4NfYQ1039QRyGcEM8
	jH0pRKwxjGtw8sZQvzEBZRZfj5mpU3A
X-Received: by 2002:a17:902:e542:b0:2e8:5431:d18c with SMTP id d9443c01a7336-2ee0decb2c9mr2380545ad.40.1794511388533;
        Thu, 12 Nov 2026 11:23:08 -0800 (PST)
X-Received: by 2002:a17:902:e542:b0:2e8:5431:d18c with SMTP id
 d9443c01a7336-2ee0decb2c9mr2380445ad.40.1794511388056; Thu, 12 Nov 2026
 11:23:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112001512.3598626-1-toddfreed@meta.com> <20261112001512.3598626-3-toddfreed@meta.com>
 <20261111170524.2b0a6af9@phoenix.local>
In-Reply-To: <20261111170524.2b0a6af9@phoenix.local>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 12 Nov 2026 11:22:56 -0800
X-Gm-Features: AclHuK8kwuouvHwn_2Xi1VH2XJR9zz0E9BHRhMsxqfihG5H7jLll7Uir2TMxEqA
Message-ID: <CADh2yMwfRPEEN2JAa-xypaGO8OXe2iFfBqfdvgjXEW+o+gzujQ@mail.gmail.com>
Subject: Re: [PATCH iproute2-next 2/3] tc: add the psp action
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: EhrG5l2jT_D4H9bkTjMlWdxlUyEvmita
X-Proofpoint-GUID: EhrG5l2jT_D4H9bkTjMlWdxlUyEvmita
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX19IVOWLEI6MC
 nWtL4lgKIV+4vgxTs0J4Uv8xnz5NH3TYMnaUveHO82uxtkk3tRBF72qcMZVqV5OZwoyeNB7OOZg
 QRMqq1xEX+5ySuy8kvuh2OzvjYPVWAk=
X-Authority-Analysis: v=2.4 cv=Mcb5KJ/f c=1 sm=1 tr=0 ts=6af6121d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22
 a=rHa_5kz9ieswdsXSo0wA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX2bqNZzxaFFsy
 XPBztqB3hU7dATf60F8sacHm2FrcwhbDT3kj6znBJRGJL/X1f70FqBe1nKPgXZZtQIN70QVoDlI
 W5V2dQRFfPw/Y7HrtsC2gMdyoQH7M65ganovE2ixrA7K4V80u1ipUHjqSkqYfYLMxxoORC4ZS+0
 SxoZMX3n6JEOyhP584TaahrSTh7asjwqUaKaCTi7I+VmUFyFw3Hfs6IDCx3AR/HaRH9ILurHm0V
 HOHHLKdnzEkvejO35/n5mE541W+UNq/CnHmkcDCVHOAZddjYOKybZae3wJ0jfq1SDuvGTLJhK6K
 gDPT6MQdzLACblUlIsiyVzlE9Jd5NgVrljWJopBNZOtyPq9gtXqem3a0F+3wj/hFPj6r+osJ6My
 MOohebbo5ll4UDbcEZrjh99b8rifJ/uI2XRQRWGoWVsbQ+oFEBlh9V3B9Yi8faKhEcuhkzzqBDS
 TME9+QvOyQyV3CaX14g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

> I saw several things that need fixing here, but AI review saw more:

Fixed all of these. (I also re-ran Sashiko myself).

-Todd

Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794512170;
	b=j/HBSNYrDttrB4pIbQO7kFQmrMHQqNCdzCfCAVwLFnBT2LqUKfaiSPkbiW9QOorrolJC
	 CDinyEe498I6s9sg1Z1mHqRHK7YuH4yJb8hYgP2qwdDhonCsIsajxFKyveaJJq7ifLchR
	 A6IQwzSUOMUGjp5sFtxrsPCd0JROjoTCd/AAk9jdM1g1wS3SywjvrPSMB0pkPQ2LKrlsx
	 CqU0i/21P9rhYbTVaPGyvx8gfK8iTjfWFMr2RCDgS02mSguQt8BZCIJojBtQZmVFRCAFk
	 SfF/puj26WAcPeNlhrX+AOfQ7k9iRJRCGKxB1LdTRkyqDWy/FAQerMMHwwtf/p/0b9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
	b=D9DU+n/19CHJXRdw1iN0vL04aIT0EGCyVWdcovPA9VvHOON+FQHYhQM7foFYmkh8iOTF
	 zo0EG5NP3NZ/4xmEXCbsCi0vHKFQlXw1j9kWt0yuFU2iIBGc1Ep0v30Ulwn8ef0jV+6cR
	 CnxFfJRvzvc+R2APmt56/W0ZUUv+6cs2WAwNyA3349DkFurmIDGsMcifjHiprt/yoLOVH
	 HbI5TzlBQMsbRnRJnytV+BGgrZTS/8dVAwaFVUh9uC+79luEbRM6r0k2aiz3vFsNWDf9g
	 veYSERKp4gZsiywDEYNY/ULSKMJzmgzvLPDbH64T9ev7tlCXfDi4c98xve8xu5Xguyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LU8nJzdq;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB7606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 19:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBB7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=LU8nJzdq
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaaXI1550335
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:36:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=Q3u7I1yY3nJ
	muq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=; b=LU8nJzdqTuFeXxiCts/Icr9sphO
	9JwQ6qneW0n34BTZV0JOHdPmVmq6v/o8AAukNp0VfJtyC1BxJESUVBZnUPO6bTJz
	heXDvu278xn0fp985Ow2X7KOpGQZ22QPNDE8ZkenXzSOzsL3mE+pV15Ld4NYN0ke
	Z4xYE3FlOFj/3hNCfLYkNWEOgkL+E1fKr1d8mgMFhG4bM25au11LSDbP1ZpUQNkL
	P4j6oE2OX8TxKs7kHuTuK5VSeUo2ZEx/0qtZHGl8RSf7BrtesxK08+eNxS3Ts9nr
	J4HURg6r5rm/vNvQFI8Dm0i35N/VUkWCnNGSvZbKTT+YhzyAn8Y9jOOTXJQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hwftjjakr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:36:09 -0800 (PST)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so173525a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794512169; cv=none;
        d=google.com; s=arc-20260327;
        b=LK4Zi/Z/xznm8A0Dhwm7zJOdSDAp3Gs992jFHhTDbDI1xmuBfhfw/+cGlFJgNdti6D
         Vi6Hke1fPBjjrDp84ZP0SVvymIWyIFrkaERmc0cbZSf8lonDeBE2sLy/wG0yLQZFxh5G
         7PBcVSMT9+g4BH39z7/PeQZnDISOPCsP0t7HeCq2sZWtuVMu094bxN3/MAPRBr8OMbUR
         99c9jSGSPLU8sqO/1KSAH96NUUZk0LgTZ2Wnb5EFqM8tUlhc23VdlJ8E4zmvl5Hx0x+H
         Xi+F01R1MN+38X9erCP4LxbMiKVImnoSB75jsKVVw+9v3bsDfwS18Ll6y85W0Gb7xCqf
         vuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
        fh=utAlsWyxe86qPTUyWE8JS5FzIn+EXIB5cweJIStkYhA=;
        b=P6DEF5EwVcuIoCDlM53KNL/ZncovJPYGXWR45Y8c4mEVdwYFpkU8X0ha/ZR21jwb06
         VwUNnEgCehj1/5wkDHS8tn13oPPAMrZPDAG1xqBI0GuuSqscgVIh5Dt2voi/bFXRn7bg
         nLaYWZ2cQ7gVQOdGn1f/rirnjENJq4m0067BQCs3Sp/3W6ZKFHfGvtDJMd9IDFuh78gT
         YoRJWij6U7dXvZ0XgILrEWckHQrx5Z73TYiap/G6nP/jX0JCbeXQoajmvzDR9WofbAeI
         hjePpZLPCRtwN/D5MWEphVekzLj2TFypp7dpzIPE8vfJ1/Esv/dUSRfJwAlxiB9kVHQ6
         RPVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794512169; x=1795116969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q3u7I1yY3nJmuq+49fNnSVZ6NxAiKftF5EDGZUfjWaE=;
        b=Aj1nxMdjSEKhJrWmB+Hd6kiailtGZmF6cKgcj/H1lUNwS5SuhmnayIZp1OQvo+c4QU
         g30Gmz0WouU5zVIc3M07xV3B0ezyiywU2MuGyOZaTo6mPQFOmKh3XvhmKDkU1b5On2I4
         sBw70PXpyXa2xZ06pHzJxsg4Fz+tn/FZoQt2dmq3QpDV2ZF/+EGV2vG3LE2MhZjdDZ3t
         nw6DRdODYs9rOk55sc4f1GormbT8eC1V1NT+/orwTY23GeLDuEe09lG3MW2OkiUzpk/Z
         SqK4jykJHoL6yQ5TFQj5jGYaipqChNKAzvqEgQhIg+rqu+ue8pzhyJqZ6Oh6+4mLoLHy
         fYYg==
X-Forwarded-Encrypted: i=1; AL+hErFpMo6qc/DaKJIcxise54TbP1s+At7v/6S8UmjVk3eyih6hLdlSEfahmHNsSdgcZ9U/dY2PGRnpbjhc34zbpYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Z6gsM1pcIpZIVRa1q6KrrrNHI+9OgZZyL3WP+SzUHAyga2Mi
	A8FBX9OJsi4CAtjfhT3M23ikv8CVM85VOaByYKgf0IZJ0Qogeqp9Bq6nfuk/AAx+/ruhsAfs3n2
	2ifAFSpwkHAfi9Pdhl8jvnRgyXJywprVkNQcZN7dABmqAKGfESnw7HiICLxZNV1IABQ2iyDQcCl
	gkFfTlnDbElETGEIidla7pjCT1c4DY67wewfK58ofADlw=
X-Gm-Gg: AYBFou2kjMgMf3SnRdlDqMc28Y6R1/46/ncIl9mKtX8ujhMp6Q2zZQodGX51kc/MZ0y
	cedKHR7pqWygmUzi/vkNX3jX5lNC45K4SA4oxDuwxXfXa1CNtO7kWfvyu954pl0yMd0V5hzYEsP
	ggqNm89IQD0ZOVxD2VO2ClXtsuqmXfKsux2oLvKyRlq+kmJekpqbuVHwGemXR8fSb+zKnUK3425
	DfHFX97zNCpPhn+mkFXIZbQf4xhFT/4
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id adf61e73a8af0-3f7a6e9f331mr164003637.26.1794512169106;
        Thu, 12 Nov 2026 11:36:09 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e2:2b76:bf40 with SMTP id
 adf61e73a8af0-3f7a6e9f331mr163970637.26.1794512168673; Thu, 12 Nov 2026
 11:36:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
In-Reply-To: <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 12 Nov 2026 11:35:57 -0800
X-Gm-Features: AclHuK-L78K4XX2ZOiQNpBmdIZKiLWCeJjgy0X9ZblQI3qzdXkkSafaXrEWKuy4
Message-ID: <CADh2yMzE1ipKD7N4YBjb0oP1Ko-Z5J6uN4k4_kK=gosHyfsKWQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
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
X-Authority-Analysis: v=2.4 cv=ZYiIpcVA c=1 sm=1 tr=0 ts=6af61529 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=FSGtspZVazLKPRRdjFEA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3OCBTYWx0ZWRfX6RdpW5NOGhHO
 ICC50MyBBGi/FfZ3Le/TOEeJeEO80am7ee5jWyg1DcHvmQ6ICre6upeiZ4tpb71mQM99D4VVJ8T
 p2qSgSCzDlrbS8DvEkQCYssR8wbhhu65PKkUJ0eXULMrTbT9Pf+fsiJwzyI9LNKWPMAGB70jDmI
 cfjVUJ6EiGW8ZHT9ZEz6rI0S9AJFFL+FvAdgf3v6QvWW9Julhcech1LlBVvVCdx7YyoG8lxl6EX
 5qbgS6vMcRC1ShfX7CPhrviocJNe1B6k9gukybMqJ2J+rT4pBzRNHsUlabojisYR2ALuDay8IqI
 R2mdDaQhPB3nuBrVxPy8qMyT6g0+BYuTn3RpcPwWLIYh2N9rkeu3Ez6bhnmyi+KTXqS728G+q0e
 Z7EsAzmtyOuZL7rQp4ENFrIZNIy+Vx9HmJ9/VRCKctumwpqYCGB0ucf/2hf66SSjgVFZmttsE77
 DkYgW7rqUcHDULDbYZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3OCBTYWx0ZWRfX9v3oK4GVldZ9
 ow3puHXV+5RT6DaODvSHKxb76AclVG6TrrhS4u0plXJS/HtPVUMPJvy2Rg7RHe4WepbP8drcIE8
 vozEstwMzznrxap3Y4EjOHJPRBWc3as=
X-Proofpoint-ORIG-GUID: 3-trQK3lMM9jOAg4o_cWJHZ_1iLeLkNK
X-Proofpoint-GUID: 3-trQK3lMM9jOAg4o_cWJHZ_1iLeLkNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

> Some of these can probably stand alone like the bpf decrypted, psp encap
> helper, and timewait validation, and be submitted first to shorten the
> series. That's just a suggestion though. If there are dependencies on
> the main series you can ignore.

Ok, I will re-post 6, 7, and 8 as Fixes to net.

-Todd

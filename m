Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE440DFC2
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 00:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775608086; cv=none; b=Ie0SnhKgAS7woRmNczYz/DI7HM+oHBBzvGhx/k3cTzAU3C7SH5QtNgTwwvnam7OyqasgImy/YrwuC4AzE5dbfNSoYbq5YYOzzYNQ1oxoFQFJlRv2ChnFfuAu5jfy4kk4k7cJsZ1ZEk5Eg7TcskENIEnCKoJKmnLGu1kNgN9Ck4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775608086; c=relaxed/simple;
	bh=e2+jsbOzfqYPkKlVYAm82qfqErfZxtXvTuGiht2gEDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F1UEn5WgVCD0TmJRFYIEJwKiUgZg9TmETFjkD5j/+JqgSJqIyzzyjHJAzWFRoitdY/+UNC8KJsD8Ms1yjadV99LMr/HQAkJadzaNWjR9Jv0C8VPI4tZM/LQLMBuRoclC1wQy//uhGfuykVOdMIq61iiA8/N8imdn+7t091sC4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=EeapWI4I; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="EeapWI4I"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637HPEYh2108709
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 17:28:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=9T9c1yN2SOjCcS/gjM
	S9r4uUQmXJK8+FifOPqIimOI8=; b=EeapWI4I7AAmUeE64PZaoW3Cu4Hl/RxMmX
	OyFmiu2pelFr59G7z1AcN/nxKsYIP7UCxs2phTEoyZRt00yMeFvqFxnyrNQ9bdvc
	upHCpx0WzT3z7nJH4kX/Dsc8XGgzrk4/2bPF3/Kgqe+5UpPuj8gjP+ok9spKZnNk
	CQTL+TNnqP+fm/QptLLa1KTHPCWkoNXCCZ+w9wCdLs5vgRVQXvq5xGfXxx4nzmEd
	RaLfI17YatML5GGl6lpddVbnenNQLICXGuTJlHTJ6AqlNNUwQCZHxRp9qq8kTRy4
	Jr6u//ue7cR+Ja/AbPYRlIQWEwq0ESdT9tWyOQT+JP2yuXa83Hgw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dcmt2fxqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:28:04 -0700 (PDT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d7e9e02363so14567410a34.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775608084; x=1776212884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9T9c1yN2SOjCcS/gjMS9r4uUQmXJK8+FifOPqIimOI8=;
        b=rXT7NqqxGsnzIrNcOjZxKty6eHxbpXeqXYjrGh1KbyOT7zL8hOYXrVl+ni5n0ZppCN
         nlcr3uPRMtpKe7l74YcTKa2t327LbsK+SSG7u1iaWg/nvhwCmDpfqcdBlcq3Pr4ehUoc
         uBKDKq32OtCWNwa1/Pd4LVKIzrAYwEgj9J/4vaJxSjBSWeDG3+B9r1BeVMw7MLFxfzsP
         UQQ+Aijc+znrgjtnyvBCFmp+1CHkTvcBg3F88SY2m/wJZmahG4cAizmJAulanMfJuvix
         za18oB+1gDQr2qgj4CarrpCcnFS7rHFRNPgioR/f6L2nQ7sgxJf4ExtwgfxchiTTQi5D
         PTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyw/gTsPGQiffDWAnUw9UR7yjWlTWE4glAqffwDJVVMlrsbjp9AGkEzIs96DnxXS3uiB9/HIPBRvbvybl1KVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzquxN7v4xj4r5GyIVjFhZ0SVocRHkqOQzuFnjz5EcQU+UextBo
	eE+4DB7pdHxYfZwpC/UMsDHGwVWGuNCOX8t7T8sRE9xVTUFxFuy+8zbqct3juiroN1KmqNSJDYd
	yn7L+kxCEnCQ2I7G6wpsHKMY7kNL9emgRDVkpPM32CV86ILgu0Xux4KOfq9fm3LpOYTM=
X-Gm-Gg: AeBDies1UFHKSY8MYhbgejFEZZoKZrq2lN8ZhRStGzxv2tKd0IMdlDwLkFc8JqvKd6W
	NvinDZOP8xpVM5SwIL9dp/ghyT98NdOCV5kmKGTov8/SUiPy8iGtxmN0ntyL/HLntUA2uNERqAU
	j2w9yf3pJniuplrOSpwurrRRLe/StN0EHOPnk3DHoIycFlAIoyNrUNALDzO+GXj9Diz/lJPCF3r
	/6Y5tEQ6M/usfz8MTy2LzNh3kJShdrTaYNHKQg0ix6hG2NL/NBC+cB1IwNBT1iqy6QgN9VGOjB2
	2HXKb8tlmAdXVPlGnKM8IBiZSqghhHruzQl7pQgIZZJ2WsFsq5YxXGuJSnv8bOfYo6ua7uQLGvI
	wEasEgH4WDw==
X-Received: by 2002:a05:6830:2546:b0:7d7:fada:89ca with SMTP id 46e09a7af769-7dbb70cf2aemr12124479a34.15.1775608083929;
        Tue, 07 Apr 2026 17:28:03 -0700 (PDT)
X-Received: by 2002:a05:6830:2546:b0:7d7:fada:89ca with SMTP id 46e09a7af769-7dbb70cf2aemr12124458a34.15.1775608083533;
        Tue, 07 Apr 2026 17:28:03 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbb40b1507sm11892876a34.21.2026.04.07.17.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:28:03 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/2] tcp: rehash onto different ECMP path on retransmit timeout
Date: Tue,  7 Apr 2026 17:28:00 -0700
Message-ID: <20260408002802.2448424-1-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LaQMLDfi c=1 sm=1 tr=0 ts=69d5a114 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22 a=hM0cxhbbTpHyH0yoP80A:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: p_sxhxlyEjalamoSb8GK7a8-ywdgjCwP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMiBTYWx0ZWRfX1kNhUhMdKyA/
 cspCiPrDdrPGe/YWevD5y0T5B4KUYoDJGGu5x7qNdna/7c2iq0Tst1PJJVCLb7/ItGS1tJ2O2te
 cs3s3xXEmOXNJmFiEsYzsclCP1WGr48gEUnMorwCUg0rT1va1U/LRq9LceZwD4EGN8dCq//KUOw
 cNI2xH8bopI50l0/jpLCNyHSrDHoviWgPWAqRq84CS3u2GihHjqkvdMI9U9yT1U7NdlEOTobspk
 wEZFVwhz+Eg/zWTBJCDgVg/WuX8DiZTdP1q0UglzBqnE8/MWQ4oOIvp811pDqMLFqIT2b5h9bXp
 QSGn/DQnDjKKG95lrCJyqccM4vo/rJ0mT576QdshkUQ5PQOj0isRLc/wD/Qk0a/B8uZvLJ5tFFA
 1l7G/T7Go+h1xu9Saeedzxe4+l7LTG1g5azv9/VXCbq3i+/cG4ojOjmTSlok7BnqyKtALMT9AIx
 YvsKr8+i409/gxfkC/g==
X-Proofpoint-GUID: p_sxhxlyEjalamoSb8GK7a8-ywdgjCwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01

I configured an ECMP route across two local interfaces, expecting
autoflowlabel to adapt when one of those interfaces is blocked in
reaching the destination.  However, it did not.  This affected SYN,
SYN/ACK, and established traffic.

I was able to make this work as I expected it to by calling
sk_dst_reset() at times when txhash was updated, and propagating
sk_txhash into fl6->mp_hash so fib6_select_path() uses the socket's
current hash for ECMP selection.

I expected autoflowlabel to apply to local ECMP routes, and think
it should, but am open to feedback if this isn't the right way to
do it.

Patch 1 has the kernel changes; patch 2 adds a selftest exercising
SYN, SYN/ACK, and established connection rehash over a two-path
ECMP topology.  The selftest retries a SYN 26 times, so has a tiny
(~3e-8) probability of false failure if repeatedly unlucky with ECMP
path selection.

Neil Spring (2):
  tcp: rehash onto different ECMP path on retransmit timeout
  selftests: net: add ECMP rehash test

 net/ipv4/tcp_input.c                       |   4 +-
 net/ipv4/tcp_minisocks.c                   |   9 +
 net/ipv4/tcp_plb.c                         |   1 +
 net/ipv4/tcp_timer.c                       |   1 +
 net/ipv6/inet6_connection_sock.c           |   8 +
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/ecmp_rehash.sh | 354 +++++++++++++++++++++
 7 files changed, 377 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/ecmp_rehash.sh

-- 
2.52.0


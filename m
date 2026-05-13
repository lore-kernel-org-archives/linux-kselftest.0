Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F136F8FB
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704856; cv=none; b=IRbL+KNzvvqGgiUWs16ILodLPFa9kUiwVwpi9ExxI0rIeZFF3uXvnw5xP7jO2TJb6/HKfRH9FEHqZ3+nEi1kPsjXMQzdi7Rh9y+OMrk/VYNBgoWMbnRqUYZdEwFbKp6vyPdAjH7SHpGamgw3wY/pAJYwQPPxUIcwTYljV7Y5mlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704856; c=relaxed/simple;
	bh=tnp9sWlRUCD7WPXqp62wSewrhltYpOGKUpZ0LbPcvec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpijkG9nEkyBpeyditWjLymCdYAw/G8U+kjhFW2rdcTMgf1R/+CnJdhZpYuoUzIdQTsvuhfR5BNuPYTKGJslBreH50jUhf0PwffE8qvLhtWyTPV1HyF99Dq4ODHdVD4iwoetwP4VfMXNkDUumtMeLOlCxZT7J4eJDQM3F9BpbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=VDjKqASz; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="VDjKqASz"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DKJV6Q482621
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 13:40:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=s2048-2025-q2; bh=0I9+jRdqhykl9YTULLQIHWGbqIub1No
	RYPqyBx+S3g0=; b=VDjKqASzNwIl9e6I0MlNv7DNI4GyCDcMzMCl4dTQ1a/pP8j
	T8O8IEN8dzrsr0it5eAJ09p1sPhEB4a2ozhAB4tOFUASluSL+fHhDtenEHJkPYi3
	1z3NC2y7/KvTxzB8IWcvDz4V4JNBx5fh65UnNstAX2ZSVaTDs0+W9mdOXZ28jAWl
	tPRkAGfEvwy2XEU0aIyinpGD44K9WPr7jTkNODjnGDf+guhp42gqMH0BrQQ87cTq
	xnBE/LoOB/NNlYxYLvp/U+4D3WZBS/aHukNY9cNTWOVTL9PzcrFnANaScq3mhe/D
	y73rS4qfoOPGXKl1jZgj7iZjsx4GR3i8BsRsGbQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e3nw1k6es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 13:40:52 -0700 (PDT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4346755f7dcso9394194fac.3
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 13:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778704851; x=1779309651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0I9+jRdqhykl9YTULLQIHWGbqIub1NoRYPqyBx+S3g0=;
        b=dh8zT9bnHx2GWU9teI+xUSxpH5BM7pugSiFgTm6K5ADi1dXbLcJzPd1zPSjAQWxHMA
         1xlK1unBQvVHKehlhGEuWkpyp6DHbb9YMl0HJFPuOU06f0S5oNc8YmRuA5mK3ZF65Stl
         tCS4uYayYoc9lYwOGlFAVZ1XRLuros6szi566ffVpj7XwkM4Zl6EJku18klPoOo1Z9AI
         KNeYZa4Jb1ATvb2Mh4MqiIee4tkaoKHpz4kBaOywxXSfQ9ACRVROzKk8t7aTOuN7+bxJ
         dQPTCWd3ExWc/0zx7Gv98S+kg92YxXocMEE/jR6uJVBi3XS94UxGnnWg1/6yKO9SeBJo
         tqig==
X-Forwarded-Encrypted: i=1; AFNElJ94KG0oAvdtOcerpFxro0xJAZiRUhOX0raOMDFS9/1Qz6ryPRbQXVHR9C/mV6DBDUBVRokrA7p9gyBHY5ecSO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sSamNJr+O58ufsoKak/mzsDzop7yaUU8SbEewcGr6Smc+OoA
	oOwAz9+5NiRe5sWCVpaYBqHxKYTqikL6JwctoxlrnMkJVIXxhVh+jkduq6ULANDlxeT6FAiJ81f
	sr7SiORySOo2mYFY8Lq//whZ7v81m3rgALQcEjpGQOIhV8bUPnxm+AdDSoTd1/W2gxCI=
X-Gm-Gg: Acq92OEc2ZWahCRruBBmC0TZVKIjqpbNRBCx/pd3iNs6AVTEMLXagh/5hzHNbbJ5d1h
	4sXV7vp0bHoJ7BIBCJ+g/ccLR36Y2RgiurPiTH/EHpMhrILjfvMKUWv9y7CjTPYCcJTjbleMGRp
	TKdfR7hLc41bnEPwJaPZD1EGz0URmajpVqRFvUa7h3rPSR0/cx0lztsLS3LsCqRIpMXdkicYjOY
	VMGPBCEyKQB/RhNHEz5LVr8C/CrJ9GtSrvmiCkhHRzFf+vt88LxYbMHOYppVBfpu5rYlZ9RV6/P
	4QQgWbQIc1OYmd912o3n0lrMrCL4oRrcSLVV9J8U3TIJ1Lfig54vekcNdKQU6OpOCU+GOMGKZpJ
	PdHubMPATsmflANGEfYmFFQ==
X-Received: by 2002:a05:6820:4c86:b0:696:1262:2ac5 with SMTP id 006d021491bc7-69b78d325ccmr2861587eaf.2.1778704851303;
        Wed, 13 May 2026 13:40:51 -0700 (PDT)
X-Received: by 2002:a05:6820:4c86:b0:696:1262:2ac5 with SMTP id 006d021491bc7-69b78d325ccmr2861565eaf.2.1778704850754;
        Wed, 13 May 2026 13:40:50 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:44::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c76cc4sm10310127eaf.6.2026.05.13.13.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:40:50 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, ntspring@meta.com
Subject: [PATCH net-next v5 0/2] tcp: rehash onto different local ECMP path on retransmit timeout
Date: Wed, 13 May 2026 13:40:46 -0700
Message-ID: <20260513204048.2721843-1-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwMyBTYWx0ZWRfX2gZKXwKQZSx8
 Y7XRI60YOn43J1Rn+TJbtJ3UTCN3CMozpExAlDoE3sOk0YD+IaYFC57Q6q3JpQewVI3kGbrG5sU
 gehifx+9KEz5Nl3ldzwkOBbqGr+YVG3wOrxogCjo3ym+A01RI+xTBLpTrMGPRZOjlUlIwMHXxvv
 dxLsmsYqbWfbxY6vIcvflfkQDH3oHIzEbMhK5oEOz8l4k55ekD1PHLze5lUPQdKqfAzLZqwRT/E
 mmD7nHwuNpD4YnV1ivYANFhl7kg7tc14TnOb+65a+4YihtbT2/76t16kYg9nm45i70FulHBmG8v
 qfp4qLxC7NrvQfO+FzxPi1Beqjcx1JCWCZQMNpylCWpAoocB4s8eMxL0mdBubVcSk2CcieEbQrj
 bmMDPOxSV/YGZ45vZdWttcJMDKEOSaVcAx6JFHiZc2g4/vV8DwMviorAXegL6C36Day0Zo4a5ij
 k869SxYRsAaq5SZzYOw==
X-Authority-Analysis: v=2.4 cv=NpzhtcdJ c=1 sm=1 tr=0 ts=6a04e1d4 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=SPPuj66wRu0voghISDgA:9 a=y8BKWJGFn5sdPF1Y92-H:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 9PoAjyHHz7COkZNbzyKSMDJkyRUw6GTn
X-Proofpoint-GUID: 9PoAjyHHz7COkZNbzyKSMDJkyRUw6GTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01

Currently sk_rethink_txhash() re-rolls the socket's txhash on RTO,
PLB, and spurious-retransmission events, but the new hash is not
propagated into the IPv6 ECMP path selection logic.  The cached
route is reused and fib6_select_path() is never re-invoked, so
the connection stays on the same ECMP path.

This series adds the two missing pieces:

1. __sk_dst_reset() alongside sk_rethink_txhash() so the cached dst
   is invalidated and the next transmit triggers a fresh route lookup.

2. fl6->mp_hash set from sk_txhash before each route lookup so
   fib6_select_path() picks a path based on the (potentially re-rolled)
   hash.  This is conditioned on fib_multipath_hash_policy == 0 (L3)
   because policies 1-3 compute a deterministic hash from the flow
   keys which must not be overridden.

Patch 1 is the kernel change; patch 2 adds selftests covering SYN
rehash, SYN/ACK rehash, midstream RTO rehash, midstream ACK rehash
(spurious retransmission), PLB rehash, a policy 1 negative test,
a flowlabel leak regression test, and two dst rebuild consistency
tests (normal and syncookie) verifying that natural route
invalidation does not cause unintended path changes.

Changes since v4: https://lore.kernel.org/netdev/20260507171319.1259115-1-ntspring@meta.com/
- Condition fl6->mp_hash on fib_multipath_hash_policy == 0 to preserve
  deterministic hash policies 1-3 (e.g., symmetric 5-tuple for policy 1)
- Set fl6->mp_hash in tcp_v6_connect() and cookie_v6_check() for
  initial route lookup consistency; move sk_set_txhash() earlier
  (Jakub Kicinski)
- Add policy 1 negative test; improve sysctl save/restore
- Add flowlabel leak test confirming mp_hash does not alter the
  on-wire IPv6 flow label
- Add dst rebuild consistency tests (normal and syncookie) verifying
  that route table changes do not cause unintended ECMP path changes

Changes since v3: https://lore.kernel.org/netdev/20260505193824.2791642-1-ntspring@meta.com/
- Use __sk_dst_reset() instead of sk_dst_reset() since the socket lock
  is held in all three call sites (Eric Dumazet)
- Guard __sk_dst_reset() with sk->sk_family == AF_INET6 since IPv4 ECMP
  does not use sk_txhash for path selection
- Guard __sk_dst_reset() in tcp_plb_check_rehash() with the return value
  of sk_rethink_txhash()
- Move tcp_rsk(req)->txhash initialization before route_req() in
  tcp_conn_request() to avoid reading uninitialized memory
- Add CONFIG_TCP_CONG_DCTCP=m to selftests/net/config for PLB test
- Skip PLB test gracefully if DCTCP is not available
- Save and restore original congestion control algorithm in PLB test
- Default get_netstat_counter() to 0 when counter is not found
- Skip all tests if tcp_syn_linear_timeouts is not available
- Replace bash/pipe data sources with socat OPEN:/dev/zero for
  cleaner process cleanup
- Fix shellcheck warnings

Changes since v2: https://lore.kernel.org/netdev/20260408070514.1840227-1-ntspring@meta.com/
- Retitle "ECMP" to "local ECMP" to distinguish from remote ECMP
  (Neal Cardwell)
- Add fl6->mp_hash propagation in inet6_sk_rebuild_header() (af_inet6.c),
  covering the dst rebuild path used on established sockets
- Remove incorrect ir_iif update from tcp_check_req() in tcp_minisocks.c;
  the SYN/ACK rehash is already handled by tcp_rtx_synack() re-rolling
  txhash which feeds into inet6_csk_route_req()'s mp_hash
  (Eric Dumazet)
- Add ACK rehash and PLB rehash selftests
- Improve selftest reliability

Changes since v1: https://lore.kernel.org/netdev/20260408002802.2448424-1-ntspring@meta.com/
- Use tcp_rsk(req)->txhash instead of jhash_1word(req->num_retrans, ...)
  for ECMP path selection in inet6_csk_route_req(), making the request
  socket path consistent with the established socket path (Eric Dumazet)
- Add comments explaining the >> 1 shift for 31-bit mp_hash range
- Use socat -u (unidirectional) in selftest to avoid SIGPIPE race
- Increase tcp_syn_retries and tcp_syn_linear_timeouts to 25 for
  better rehash coverage

Neil Spring (2):
  tcp: rehash onto different local ECMP path on retransmit timeout
  selftests: net: add local ECMP rehash test

 net/ipv4/tcp_input.c                       |   6 +-
 net/ipv4/tcp_plb.c                         |   7 +-
 net/ipv4/tcp_timer.c                       |   4 +
 net/ipv6/af_inet6.c                        |   3 +
 net/ipv6/inet6_connection_sock.c           |   6 +
 net/ipv6/syncookies.c                      |   3 +
 net/ipv6/tcp_ipv6.c                        |  13 +-
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/config         |   1 +
 tools/testing/selftests/net/ecmp_rehash.sh | 861 +++++++++++++++++++++
 10 files changed, 900 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/net/ecmp_rehash.sh

--
2.53.0-Meta


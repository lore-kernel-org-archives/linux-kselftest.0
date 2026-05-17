Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9553C4548
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039930; cv=none; b=eZX1WS6iGdfxSITDj6qlf574SaMLjspu9z6LAlNbYcNsFbnCa9A20VDinQ3LWCg8VF2uURuMpTea/V3SSWFl52qkOwTDcDJjPpxoPPx7/ukkpOQ2O23vLPg99ylTRWiKV3+Aa+vuxj3cLZ4OsqmDjLBW6oW+p4CU85oskyf7to8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039930; c=relaxed/simple;
	bh=kNkNI/8XynKLjIPo6Gtw2lmZjrLtzPz1LeOBAz58KHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gIvuErmTLEheu5scc1ZXQbrm3VpPD1h0Knfew+uIaIiPIbxQszI2qEagZt9kGuzcxkS3UnC0fZq53PDoIfvNaM4VqeMxDZIxBh5Q2InP43dYn9JS1DtcufY+zGh0PU1Z6tDJf0Z3tqeXV2CXrqxJjDXjkn7xHiOSbanZsuk3lIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=VQxBmEDw; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="VQxBmEDw"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HHObpQ461963
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 10:45:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=s2048-2025-q2; bh=XpCR9Cc4JL6ZGc1pX8ozjC9q6S7skyL
	22FrSAjt8B7M=; b=VQxBmEDweGj3zqz+XiN7Ew0W+qm7GrQ4OBvWlx9dDHm4hgN
	BrG6A/NFAe6z0wbvEWhHlLZMxsCN6JGktAGfGwiSzCvZjIBaxtsQdTspcTWTNEfl
	91fWokH1iNBQdIzeNJ2Use3PEaQxHyr5wOO1v7t6CS+D+B0LuIIjm75AhTJwSKJ3
	CqKtskIZ1TT/E0palpb8f9Bl+QfG9+qlqyzqkozuwNZpje6E3p8NuMJVxfNckHs8
	BNOwoUQYRgAtC4hURgy9MFhmAXwxfTVa8ipQ0eUsqC1wrVuFnBS54Y+nFNSqK2XE
	gXxaDkhL5npla9FryIYsHa3+K/wiXrFsvqgZHVg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e6pd6mt5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 10:45:27 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-482abfeea78so2885478b6e.1
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 10:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779039926; x=1779644726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpCR9Cc4JL6ZGc1pX8ozjC9q6S7skyL22FrSAjt8B7M=;
        b=f4Ysagw4eJp9GONZPU179fZ1/55OyKr+I111hGrXehe36CE2wBBSdXoAVR+Fj/bb8z
         G8gnuNMLe7qUKdzpdiqL1Wpu/KcKJSlSs1ST9KaAnvPxYZ9GbLLjy90VCDbqD2npUch9
         PMWUPV0QCLUxbmA6Gyc+/EcEc69/cI6soZrLvajx7ANLe+BiqR68qO0jt4BVAtZS40i/
         ied3NC87AEhdfJ22WTBfOPtkj5cLb81kioXUpjFBzv/lnEut7lsVoY9yQl3NWs3CARSs
         xU8U/NYHUZiXoZbo0UmQDuIQUWegygR0Gb+8neVVRIpqPfI4PEkbIlCE6wcRihb/bg0a
         X/wA==
X-Forwarded-Encrypted: i=1; AFNElJ+6pdYVK9FY3ZKRvbBvmn904Dn9KpzIkQVaczoVLzFaw0ijCbTaPdIC9g4kcQg8QtjUmt/jXBE2cNtwTiwz++I=@vger.kernel.org
X-Gm-Message-State: AOJu0YySGvuwJ9r0o91ff3KxlMkdh4+ubNmOuyo2SQfkNPnCalS1Uz08
	OyZLuHr0T1ILG3KVjDKiQHSaNW3SAHXWNRd42S+weEJc3LdrrUMrSBlmJM+ECDwnwDy+FtRgP6o
	km1cfmjSI5wuCU43lWM5PIECEhac9OSlklfuejGUj9nxrWTTNSWf8BJSN1waxsz9VjEcfOIhrq/
	Y=
X-Gm-Gg: Acq92OEmB9xT5zn4e+uEHUYqy4s6MhCTpN2TR5ZkB9tyMJ2iFiYjp7B1BHh6GLEhHJ0
	ocVBGsbHZWWpR8lUSEYcwxjG29y8K9rCgZrEL1YC0AYkE1dtYG2a6iRLTZLvol13UUwbVKIm/XV
	5ToO4wiyRochA4/hifMJXv41D9kH8Yz2eE7ZCkYTvdFHcyx9gcxF/zOLgmMRjjDAjiejbEFRw/H
	ePaL79A6O7V0sBMa8A6VXLUwKMrtKwa6AguuXv88A7HzQ+i7gXt1kTzprlfsgoOHxX6xat9zjQD
	nHMaXJFbGvMDTzKjcXsDs204Nbp8Ji2CWpVsT14yxp6elQeksu1YJICELUZ1Yoh3H8IV+QLMGIC
	/mjTQQF6naw==
X-Received: by 2002:a05:6808:1a07:b0:482:5bd1:d8e5 with SMTP id 5614622812f47-482e55afc67mr7658641b6e.9.1779039925958;
        Sun, 17 May 2026 10:45:25 -0700 (PDT)
X-Received: by 2002:a05:6808:1a07:b0:482:5bd1:d8e5 with SMTP id 5614622812f47-482e55afc67mr7658617b6e.9.1779039925448;
        Sun, 17 May 2026 10:45:25 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:5::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43a94fd54desm2136691fac.8.2026.05.17.10.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:45:24 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, ntspring@meta.com
Subject: [PATCH net-next v6 0/2] tcp: rehash onto different local ECMP path on retransmit timeout
Date: Sun, 17 May 2026 10:45:20 -0700
Message-ID: <20260517174522.2232057-1-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j9N92SgObei8S0z3xOc-9OEQWRMDx13B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5MSBTYWx0ZWRfXy5y0ZKB7i61x
 hgCQKpfKwQnQlzneR0IncMbIqAsaglYdaLwRCzy7PptjpuZVFO1MrhlzzXaITIJUjEDPKFW4FOV
 u5sfbfOkJfcJ1U21NR3lTnXXTODPS8MTY0e6R9VRCJZowzTKfh9CSiOFHa+59zxCT/c1pQrSbQv
 9n77Lwtg/qACLMrVNFHjC68NbiWr8Cmxxo+C2Stb8OlE040+xrqcjqbhysFHEI7WJ0eHKg1wsEu
 hYSyVgR6AujahBLeJ2eFF6KE75zrjVxNZm/230vaJfF7/KUFCHNWo2piY/9gtzkZDRKwDx5lwAc
 PHfkb0/4ov1Vsmx5f25zd6dJGC4qJNcwXQYxVvO8QesASDX6JtIffqbPxh7oEKQSlXGBag889L3
 XEAVnTVUAYutn9suQ8kBDNryOhbXu96Qy1LLgHcjMGZo7+iXPqzSgADP/wxFwIzPR+A8rqkRaIa
 7d0Wcz3serc7mt3D6PQ==
X-Proofpoint-GUID: j9N92SgObei8S0z3xOc-9OEQWRMDx13B
X-Authority-Analysis: v=2.4 cv=PfLPQChd c=1 sm=1 tr=0 ts=6a09feb7 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=IdTnusCh2XOMSKVXdlMA:9 a=TPnrazJqx2CeVZ-ItzZ-:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01

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

Changes since v5: https://lore.kernel.org/netdev/20260513204048.2721843-1-ntspring@meta.com/
- Improve selftest reliability: suppress __dst_negative_advice() via
  tcp_retries1=255 in dst rebuild tests so a real RTO cannot trigger
  an unintended rehash; add internal retry to midstream and ACK
  rehash tests to tolerate probabilistic ECMP path selection; fix
  midstream baseline capture to account for packets that bypass tc
  filters during the prio qdisc's TCQ_F_CAN_BYPASS window
- Increase ECMP_REBUILD_ROUNDS default to 10 for reliable regression
  detection with 2-way ECMP; replace sleep with busywait
- Use tcp_allowed_congestion_control instead of changing the host's
  default congestion control for PLB test
- Use (txhash >> 1) ?: 1 to guarantee non-zero mp_hash, since zero
  falls back to rt6_multipath_hash()

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
 tools/testing/selftests/net/ecmp_rehash.sh | 923 +++++++++++++++++++++
 10 files changed, 962 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/net/ecmp_rehash.sh

--
2.53.0-Meta


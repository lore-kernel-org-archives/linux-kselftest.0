Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B511450906
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174010; cv=none; b=gVVUHk7D7/8ecXfj5odFZHGlL5HJYkQh6kq5ITTwTWLUum8ZOJ2GDJ3EZx+z7SbAvq/avuvPGB7iN/zBkAZJXFaWInzUmEoPyzCsjWIqAvHjc6xr4j7nvS/60zD3UD5duAZgEWvD1Cn9O2x3nEF1xmfiL4rImULmVXti3aeDS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174010; c=relaxed/simple;
	bh=qyI8BjmsPESQ0kkpXf+Rmuvb0uNigO4MQQU/MatMW4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JyF6ByqMc+4l3/ObL69GXBiOhEaKSzN4kA0syOjTmZosSQiKprYRAMxxuCY8DbpRdVMbs73gviCwvZn9JeucnzWy7M41FFnnqBPHVigS2e4fSgmR3408uQWXdpkKovazrd3PZ7xEv6QkXY9cD/qhbREGkedWmdMw//IW5N3HJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=oTppYpWH; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="oTppYpWH"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475xHHx486522
	for <linux-kselftest@vger.kernel.org>; Thu, 7 May 2026 10:13:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=s2048-2025-q2; bh=6SsGNqa1TMaD0jKEC86Q7klJJ6lfLfw
	RiAZEPwK2SL0=; b=oTppYpWHXNhfaoRs49SZTA57IHpRr1Jgyl+SPnIvtEOLaMj
	Mk3SuYQyvSCaLAbrG3JY9tMVZMfwuf0zXPkDW+mvtdpMhNvwpLtjpLPB5o0L2kNE
	gvov+HDDP57YLpe55T2GCdG9gqX8olAg2l9CIsCWGN5PMJ6pKB60hdJcnEHl22Qu
	9EQj+1FagKkkXixGAVk+kLIMquKwCTPIio5du2T+T9QYY0fcaKCE3N31p83+NP6m
	2Hqe0VVjVjgxc03kLj69HPTd0CQk/pZlJK6Ij4+8f4Er9jkcg/69TEepgGJ8O+Jx
	Yso0pFZzys7rzEC7cmSviJd/VqNsQSuOHcNoJuw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dwf0dsg4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 10:13:21 -0700 (PDT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-66308f16ea1so1521747eaf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 10:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174001; x=1778778801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SsGNqa1TMaD0jKEC86Q7klJJ6lfLfwRiAZEPwK2SL0=;
        b=gceFZCje0D9Rcwmwvuw5HCuMQ2gbHQHHGzLJcOXd6mFUGWylFUGtEt9eOKGC9gawQ5
         T5Rz7QXwsrAJCW5FQrV385VPFnA9lQ+C9iCj1o3vQxLBci0sNgDOR8Fg2LQ/ak2p1zj7
         8RDJwVOBmvZfxpS45fPfD4PJQ5be+R/T8hiZ4zEQm1I3AwS3xvOJUWAlO6bC20T/7DIy
         yvF+Usp4EcJjKrk3E6bAJ4ozZ7uZU81SdajoEuqnP3tiUeM0MiF3hfBQSG8c0aeDHwWB
         fueXSw6wKDpqu2lH55xHxKd+ntTNTOpfm0EN/1r6Ok+bOHxGa+asl2gG39TA+jQcBWCf
         64YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hTidtU1is+FuE3zrK6vXlYDIsHDKFmpQvqP1Xk6O1hcPkEwCUe3dIHhd8AayBCwsNfYca+gcEW86S8Ey032Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhLdGgyMUCeKXDtuoopELh312YsViIYgfS7em+oGjIZt+7J42
	Fhul5YeEyEnQ/1+LL8eELp5opdi3VvtuYNhT4TEMqWNvizmJfp6M6gA7XT+R93nrk+HAzK0VW8Q
	QboNdIUN+2WUypbIOpfchCPPoqxxcjQ3i7N+a/eDGWApjHph6PUSw0KM2+Sf771xEP6s=
X-Gm-Gg: AeBDiesRp6FlAfCofCjqarKX+zZbLS+A6XGqA1HOAkGP/fcOKF9HiSg4N6VhgqrmTJ/
	h7NxvKkfLo+DlmEse7HFEdxo5Mxux+jRKxdMUxPnYWIprDFgzRrjqR8IR4ykoLN02c8zsnW6C7P
	umZFinK+2QN0MLc7FzPOQf+o3TXxVxx3UBl6lq9dMULQSpfqAjaWETNUMvtzsUfF669P2OsduR0
	Wy8RhHZx8pR+roonPa2OuKr6sxmyl/ZMHxcsqHgNsBfKwobcgACkm2UGSBhDw1PSe2d4UM9EeH6
	d374xUa0KuL+jg1GKzJbZzEL1wXWzUjVAe/te7iczQK84dRadkXdRP6W5l4VJ2VXr2Fy3qU7+OG
	XczLykLR/cA==
X-Received: by 2002:a05:6820:4b89:b0:695:c0e2:38e8 with SMTP id 006d021491bc7-69998d10104mr5019300eaf.32.1778174001291;
        Thu, 07 May 2026 10:13:21 -0700 (PDT)
X-Received: by 2002:a05:6820:4b89:b0:695:c0e2:38e8 with SMTP id 006d021491bc7-69998d10104mr5019272eaf.32.1778174000850;
        Thu, 07 May 2026 10:13:20 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:2::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4354b0bc35esm202600fac.2.2026.05.07.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:13:20 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, ntspring@meta.com
Subject: [PATCH net-next v4 0/2] tcp: rehash onto different local ECMP path on retransmit timeout
Date: Thu,  7 May 2026 10:13:17 -0700
Message-ID: <20260507171319.1259115-1-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Y7LIdBeN c=1 sm=1 tr=0 ts=69fcc832 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=xtH7KyWI9dI7BmFOsl-x:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=vURIu9es5igc0G7EWQkA:9 a=-UhsvdU3ccFDOXFxFb4l:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MyBTYWx0ZWRfXzwtYf7GL0v62
 E/HMrdtYR51r4kP/0wg4eyvrQ2S6Kukw28Es+SmbBT5Hz+nYptx5Aylkn6cIq2dT5Nfexz5YifN
 Nqk8xkGZd8w54EVClClLjJBaDbTjoMa5BQGh9vCAjJqcYRVbJAMKmy7NEWe0ojobGA3zIxWSzrc
 HOnYS27HOtSS/Uj8L2NI32Aecg9y17aEYDUOHcjwFGCqSXVIkgk8ORqGp026D4KPjkZf7PZQe2c
 4QWEhsdRoMcAaE14wEBZi0msj/rORQWE/fzRORwuxigJC+7cy5N9pfTfYD1TT04y7tfQeiqNdov
 2noH9rjta3/qsc8jMwNDbmK+Q9kie1eyO9X2l1x5aot1X3Zvt8PzcJvlyazdwVlAktSVl7JZv0K
 khPKc9kWK6p1r+c+8rJmrDREdKEhTyps2mnBvy5spxrKtlG4SpOGimpW29yd93hFc9UP4CkPp2u
 21gsZX1MBnZ9w9DqYMg==
X-Proofpoint-ORIG-GUID: vgvhTkjA7xCQJWrZ9LaiZSu-Ra8zI5Od
X-Proofpoint-GUID: vgvhTkjA7xCQJWrZ9LaiZSu-Ra8zI5Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01

Make TCP retransmission timeouts select a different ECMP path for IPv6.

Currently sk_rethink_txhash() changes the socket's txhash on RTO, but the
cached route is reused and the new hash is not propagated into the ECMP
path selection logic.  This series adds __sk_dst_reset() alongside
sk_rethink_txhash() to force a fresh route lookup, and sets fl6->mp_hash
from sk_txhash so fib6_select_path() picks a path based on the new hash.

Five selftest scenarios verify the behavior across connection setup and
established flows, forward and reverse path failures, and PLB:

  - SYN retransmission (forward path blocked during setup)
  - SYN/ACK retransmission (reverse path blocked during setup)
  - Midstream RTO (forward path blocked on established connection)
  - Midstream ACK rehash (reverse path blocked on established connection)
  - PLB rehash (ECN-driven congestion on established connection)

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
 tools/testing/selftests/net/Makefile       |   1 +
 tools/testing/selftests/net/config         |   1 +
 tools/testing/selftests/net/ecmp_rehash.sh | 582 +++++++++++++++++++++
 8 files changed, 607 insertions(+), 3 deletions(-)
 create mode 100755 tools/testing/selftests/net/ecmp_rehash.sh

-- 
2.53.0-Meta


Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFEF2E7179
	for <linux-kselftest@vger.kernel.org>; Thu,  7 May 2026 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778174016; cv=none; b=q0UfTXFQ5T9P80DEfD+YEUZ/HL6LT5/jVQfQK7MyZWZbcTtDNZ10jcR/M0bBGD/uQlw6XVfgfRLZzsFnZp8n+bzwmiaMlyWWvawD+iMf7BR62jTY1Qj7rBkQdcPjopq+snhWAYCjHTp3QR2xcpRvKvU3tzV+tRWIInwgiYKknWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778174016; c=relaxed/simple;
	bh=72jCYSUtvw2rfqBc+H+W6IruE2/oajXh7+A56VLPZn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJYTZMt9jsiNhNJ8Te6Jh3XHieDdaGbf2wUjB/V4s5khq90oYWsiS6oqdbF/BV5G5ltiepYUZnQF8QnG2zWRyTbGvh36ZXHS6S0Xyu+5dKHag088TDUA9xjLdTjbZKuLRyu02MLPqZkzrLdcezIRlWwImx12uRLUToH01ZBe+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=ZGjlAsZX; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="ZGjlAsZX"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BmdZS1162915
	for <linux-kselftest@vger.kernel.org>; Thu, 7 May 2026 10:13:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=s2048-2025-q2; bh=SzrUE3l
	DsznqJxZ7gWqn468VAqdAMeTCbC2XUIqwsDY=; b=ZGjlAsZX8Ks7cLV8qd2JPZ/
	vdJPYw686e6g5HniLF/vt2UjtS+7YAf7k82N3rLiz3KtxcpnEcKRsZEeU4wSKWgP
	JE1aqOPGQ0uYQlKQs/pfNgbCtX33YOmYobgGglMQ/crHh2PJ3gdSY3x5oZB3tuZf
	z/eOebeV+6nJF9jVrwvPjLNpOT5youami0PF4gY2SwpZmugQZ4kyBkhxAk7Qy8io
	G8S/03/0QFFhD+mnOdfbblWlr4BxyoJNeWWQAypk9gXt8Z/wFga4t2PkLgBHjJG/
	tzWcJ94xs/omyYJkKyg4ZIHM1B0UeKLX3DnuLqC4D0aqY6fki7xwJYwgtrbcKfg=
	=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4e0t6dt806-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 10:13:23 -0700 (PDT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dcc5fa38faso2033997a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 07 May 2026 10:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778174003; x=1778778803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SzrUE3lDsznqJxZ7gWqn468VAqdAMeTCbC2XUIqwsDY=;
        b=MhJtx4a8rPDMvYBhWsu2k5gRfRLeiqcVH1dWIZHiOdGBLTPM0I6IjLVSvg0GRwBb5n
         1KlPt3FgH/OH2NaZehwy3Ol8cTf1cZ2YxpLyL3kQMbr5HlLQtVbRKwtSIitLCBdgoTOx
         9+N6X0t4OA8OahvI96wc21khCaO/YoI5oqhYGZxu9KW2ZL52YNjcFNc7kulPhqmkYqxX
         4ZaZtvNT9E1Ki9MTZ3U+g6xDQx//MRCpWY6t60r9DtqF/3DE2rBkzKTNobOcTzThmmQV
         PJMXzfYWAotQKEk/DlFNdrhVaTQaEeqlHT6n/PnQzyryTq8usjn1enNa7G7Rh+s7eDqx
         d0wg==
X-Forwarded-Encrypted: i=1; AFNElJ9IZJrwOC8rAonflcOm5RDnrGIZsJREw4GvCHLDXTMpHr7+rPGKOUW8uSHIlmjV3K4s1juBurFIBsiF2w0+kOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOD4hpbP7vmk7J5mUoGbmHGp0oHOWQlEuioYYj6d1CuZFsuWV
	fYPv3zqcU6NRVBvcG4DlqYQvhy9QC9NyeXYOFxmKTQ3qkwCGwACI4lHYb/tg9e+7N5GIcaWaMMy
	pA/C6nMs+rsNcV0prNcoxAtUZXasQnIaEklym85hPrcJoE+E5eHLcRwM1i4Zl/goohCM=
X-Gm-Gg: AeBDieuuwxO6TohxKZMjp1gJu8r8ePInOTsmHRlAuT9IWvAgCaZ3lUmp5XeAX0N/q2J
	MvM9pzoEko5dZwJZwy+qZVt9VGyO/Qs47+C8hC+VSkUB4emKi6o1Kch1EwZrff/xgARfrsjCBcr
	dHQtCFpon8p/96jSHK35/Qe2DXdKxq9PWSmhHb03mjA202ayIXSNDwkoKiWOnh98h4IBuevNgLB
	uFUJDCx5jdzm5/hMkpHfd2Oz5U2WeR934tkL5abg+573p2oxlMsjtM/tiY/5yiClpaUUWIdz64I
	iXXOGiJgv2uV359PeKs2/jtlhGiOQd6vjOqRp06EYMVMRER54K/gxYq2g8wfbeCj/ucgvQn5p15
	psAE13VXgNQ==
X-Received: by 2002:a05:6830:3c83:b0:7dc:cd0b:58ac with SMTP id 46e09a7af769-7e1def6a571mr5393694a34.9.1778174002766;
        Thu, 07 May 2026 10:13:22 -0700 (PDT)
X-Received: by 2002:a05:6830:3c83:b0:7dc:cd0b:58ac with SMTP id 46e09a7af769-7e1def6a571mr5393665a34.9.1778174002175;
        Thu, 07 May 2026 10:13:22 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:3::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e3024792d5sm107813a34.12.2026.05.07.10.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:13:21 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, ntspring@meta.com
Subject: [PATCH net-next v4 1/2] tcp: rehash onto different local ECMP path on retransmit timeout
Date: Thu,  7 May 2026 10:13:18 -0700
Message-ID: <20260507171319.1259115-2-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260507171319.1259115-1-ntspring@meta.com>
References: <20260507171319.1259115-1-ntspring@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MyBTYWx0ZWRfX3Q0af/hvShtP
 DkWxQqct7Emsdo+T9avrLUuW+mz4B52QDk4hKy6fJNRczR9q4LmRVduLfyZATnEQ53Jz4q7WH9j
 VhO+stAI+QxJAmgrwE8iyi60FlLeV/Y8h1vmD+gYZnNbULQMi0UZlCK+brotnrJxiastSd3yASg
 eZBHbrqDyGPkyq1RR+7L4ntaI/u86TcLe9Wqqn+8rEskHgKSXT8EP/hdvAgjVKFl9MQoBJS1M79
 k2f4PkNomMoA2VKIXOUQVksPkLoX5N4jrPVqprAW2HpTXbCL7sjlsWlixz7bmz+b8DIHUVIoHyM
 NTY5P/Lexkv/NE+bOT0vBUlPC72R3kl1eiWYjCObun1uQeDTvqu60ho3GP53l2C6KqLoKhIRsip
 IVuHXNYufHLpAS9Uvuvhf1Gga4w0q1g0vLXrCRzeJj8SywHLiAa3GWFWmvFEYjHscA+WQl5V7TY
 vGQ1ty7Hy8gugX+xlUQ==
X-Proofpoint-ORIG-GUID: MZ9h-kWI3t3Kp8q0lL3bVqB_MpblfU8b
X-Proofpoint-GUID: MZ9h-kWI3t3Kp8q0lL3bVqB_MpblfU8b
X-Authority-Analysis: v=2.4 cv=F7dnsKhN c=1 sm=1 tr=0 ts=69fcc833 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=tpM8CJlwf7uhpglF1g9U:22 a=VabnemYjAAAA:8 a=PrRIV2uz1Vmq3iRVJPsA:9
 a=EXS-LbY8YePsIyqnH6vw:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01

Currently sk_rethink_txhash() re-rolls the socket's txhash on RTO, PLB,
and spurious-retransmission events, but the cached route is reused and
the new hash is not propagated into the ECMP path selection logic.  Two
changes are needed to make rehash select a different local ECMP path:

1. Add __sk_dst_reset() alongside sk_rethink_txhash() in
   tcp_write_timeout(), tcp_rcv_spurious_retrans(), and
   tcp_plb_check_rehash() so the cached dst is invalidated and the
   next transmit triggers a fresh route lookup.

2. Set fl6->mp_hash from sk_txhash (or tcp_rsk(req)->txhash for
   SYN/ACK retransmits) in inet6_sk_rebuild_header(),
   inet6_csk_route_req(), and inet6_csk_route_socket() so
   fib6_select_path() picks a path based on the new hash.

   It is necessary to update mp_hash explicitly because the
   default ECMP hash derives from fl6->flowlabel via
   np->flow_label, which is not updated from sk_txhash
   (REPFLOW is off by default).  ip6_make_flowlabel() cannot
   help either, as it runs after the route lookup.

The dst reset is guarded by sk->sk_family == AF_INET6 since IPv4
ECMP does not currently use sk_txhash for path selection.

tcp_rsk(req)->txhash initialization is moved before route_req() in
tcp_conn_request() so that inet6_csk_route_req() reads a valid hash
on the initial SYN/ACK.

Signed-off-by: Neil Spring <ntspring@meta.com>
---
 net/ipv4/tcp_input.c             | 6 ++++--
 net/ipv4/tcp_plb.c               | 7 ++++++-
 net/ipv4/tcp_timer.c             | 4 ++++
 net/ipv6/af_inet6.c              | 3 +++
 net/ipv6/inet6_connection_sock.c | 6 ++++++
 5 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 7995a89bafc9..8f602a665b71 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5020,8 +5020,10 @@ static void tcp_rcv_spurious_retrans(struct sock *sk,
 	    skb->protocol == htons(ETH_P_IPV6) &&
 	    (tcp_sk(sk)->inet_conn.icsk_ack.lrcv_flowlabel !=
 	     ntohl(ip6_flowlabel(ipv6_hdr(skb)))) &&
-	    sk_rethink_txhash(sk))
+	    sk_rethink_txhash(sk)) {
 		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREHASH);
+		__sk_dst_reset(sk);
+	}
 
 	/* Save last flowlabel after a spurious retrans. */
 	tcp_save_lrcv_flowlabel(sk, skb);
@@ -7636,6 +7638,7 @@ int tcp_conn_request(struct request_sock_ops *rsk_ops,
 	tcp_rsk(req)->af_specific = af_ops;
 	tcp_rsk(req)->ts_off = 0;
 	tcp_rsk(req)->req_usec_ts = false;
+	tcp_rsk(req)->txhash = net_tx_rndhash();
 #if IS_ENABLED(CONFIG_MPTCP)
 	tcp_rsk(req)->is_mptcp = 0;
 #endif
@@ -7717,7 +7720,6 @@ int tcp_conn_request(struct request_sock_ops *rsk_ops,
 	}
 #endif
 	tcp_rsk(req)->snt_isn = isn;
-	tcp_rsk(req)->txhash = net_tx_rndhash();
 	tcp_rsk(req)->syn_tos = TCP_SKB_CB(skb)->ip_dsfield;
 	tcp_openreq_init_rwin(req, sk, dst);
 	sk_rx_queue_set(req_to_sk(req), skb);
diff --git a/net/ipv4/tcp_plb.c b/net/ipv4/tcp_plb.c
index c11a0cd3f8fe..accdd83dfc3d 100644
--- a/net/ipv4/tcp_plb.c
+++ b/net/ipv4/tcp_plb.c
@@ -78,7 +78,12 @@ void tcp_plb_check_rehash(struct sock *sk, struct tcp_plb_state *plb)
 	if (plb->pause_until)
 		return;
 
-	sk_rethink_txhash(sk);
+	if (sk_rethink_txhash(sk)) {
+#if IS_ENABLED(CONFIG_IPV6)
+		if (sk->sk_family == AF_INET6)
+			__sk_dst_reset(sk);
+#endif
+	}
 	plb->consec_cong_rounds = 0;
 	WRITE_ONCE(tcp_sk(sk)->plb_rehash, tcp_sk(sk)->plb_rehash + 1);
 	NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPPLBREHASH);
diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index 322db13333c7..24c1c19eda6e 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -300,6 +300,10 @@ static int tcp_write_timeout(struct sock *sk)
 	if (sk_rethink_txhash(sk)) {
 		WRITE_ONCE(tp->timeout_rehash, tp->timeout_rehash + 1);
 		__NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTREHASH);
+#if IS_ENABLED(CONFIG_IPV6)
+		if (sk->sk_family == AF_INET6)
+			__sk_dst_reset(sk);
+#endif
 	}
 
 	return 0;
diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index 0a88b376141d..90ff4448aa56 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -823,6 +823,9 @@ int inet6_sk_rebuild_header(struct sock *sk)
 	fl6->flowi6_uid = sk_uid(sk);
 	security_sk_classify_flow(sk, flowi6_to_flowi_common(fl6));
 
+	/* >> 1 for 31-bit mp_hash range matching nhc_upper_bound. */
+	fl6->mp_hash = sk->sk_txhash >> 1;
+
 	rcu_read_lock();
 	final_p = fl6_update_dst(fl6, rcu_dereference(np->opt), &np->final);
 	rcu_read_unlock();
diff --git a/net/ipv6/inet6_connection_sock.c b/net/ipv6/inet6_connection_sock.c
index 37534e116899..fc4b75de6af8 100644
--- a/net/ipv6/inet6_connection_sock.c
+++ b/net/ipv6/inet6_connection_sock.c
@@ -48,6 +48,9 @@ struct dst_entry *inet6_csk_route_req(const struct sock *sk,
 	fl6->flowi6_uid = sk_uid(sk);
 	security_req_classify_flow(req, flowi6_to_flowi_common(fl6));
 
+	/* >> 1 for 31-bit mp_hash range matching nhc_upper_bound. */
+	fl6->mp_hash = tcp_rsk(req)->txhash >> 1;
+
 	if (!dst) {
 		dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
 		if (IS_ERR(dst))
@@ -70,6 +73,9 @@ struct dst_entry *inet6_csk_route_socket(struct sock *sk,
 	fl6->saddr = np->saddr;
 	fl6->flowlabel = np->flow_label;
 	IP6_ECN_flow_xmit(sk, fl6->flowlabel);
+
+	/* >> 1 for 31-bit mp_hash range matching nhc_upper_bound. */
+	fl6->mp_hash = sk->sk_txhash >> 1;
 	fl6->flowi6_oif = sk->sk_bound_dev_if;
 	fl6->flowi6_mark = sk->sk_mark;
 	fl6->fl6_sport = inet->inet_sport;
-- 
2.53.0-Meta


Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FA540DFC2
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775608088; cv=none; b=OPK+wHK4nFFUvtIAYFufVn+NRIiMnxjOhEguGzposoKVd+/fnOK2Z5Ks2+RW24xXODHArj94yKH7zDB+BrlhIkCos+z63A0QZbdzsnM8v3ncFVLdBEJ/tWaVdyVLReicZPF8/+DagzTZhC8xvM9TvGy7QwwSbPkkoht1M/sboEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775608088; c=relaxed/simple;
	bh=RbzkeOoHAbOAnKMYhMJXgpeVh6XSq+zaxiOMWFMJWnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ql7bQh7HpMah3O4kIY97Z2As2kGSd9Tg7NrgGOnKYcgAg+QGdNHqStDw+4LdkVSHBssoH5GE/sq4VSqxgG8Tk3PPZZ9rBlX6uLFfmCsWkOyegdbnSCxwm1OAGwWurueq9BWosMWcYAYSnqGubSBfYFWII0/+TIRRLJdnSjNZQos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=Um+eCvxq; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="Um+eCvxq"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637HEY1o2020549
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 17:28:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=s2048-2025-q2; bh=A9bTQZo
	E1ZXQ1eHtkXqq/mNthezmKBZ0Jw54yS/Cx4o=; b=Um+eCvxqiwoCuxF3Tk3dBCh
	oO3ddBDFRkxO4ZCGs6dD29oMBCUZltOp6k6bvzKI09I1VR55+Q9FJhdGqjioiMHP
	g+putn+5YEutD4AUMcoa+Z2Am/86u+oeDRwUbmlGT9MnRitXkgMu+oIVyaR5jYEf
	GRsAVGPzcsqh5F7EkygwsyQrO2CcYej++Ug2UMmU2yYZOt+JSwyRPthZ8ee3Xzqq
	Z5WVQ/MD4X/u0eGfJFabhsqCIwmgmhqIAJUL4H7XSyOwsiraDvAlU+TdsrNSquZl
	iBH1Sq2hqcF5BrGStsMaHq2xDl1WeOve8BFlZuifHnCFryJ8qVVFWzMWBKThMuQ=
	=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dcms67uph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:28:06 -0700 (PDT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-464bbea2120so9415691b6e.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775608085; x=1776212885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A9bTQZoE1ZXQ1eHtkXqq/mNthezmKBZ0Jw54yS/Cx4o=;
        b=PuQvO8oBepQwHUPyyYXUvqV1mrDMyXc2wxM+YLiJFdKEcHjLnISz4tDWS/vPrXp9QR
         PACFDRcWUFNNnTz7obf86Fh6kvJ3tNMC8g/fB8Jj/mTvM1Q0pX5Dlcl4ZIk62EqCk/9M
         dv9vJANktvGxjHToKHr/XQNTylId5aBGft7CVgPotUOabtfN1UN3yOnIgnjNTtwLwhiJ
         8dlASlU59W5ZOj9W+dewAteH/2SnIgwYkJ7jpdtvYTjH45PcxQt1OseOBvquOJD+zKQ9
         1Z5ELf8IC9pOtivQNLr+hzAWHYZgO4JeSTBHTawzITwKvyH6LxCOy41REmDX1nwiyk9t
         NDQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5JcHOZTuQNS9NmmbDGLq77RpqioxR3hwHGM/t0OPO1u5P4I4U3rIti3MYVEd8dodMzdhlCFUiI2czq65LfXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPYE7qwLYa/P2GZJLrKFemhISux3F78o1l32pIN0VZgt29RdeX
	7io7LjE7xuaEOUnVODL8QwA85I1WA2CevPimBiAA+2BV2Sla+fdGso7+ZJge15vsWr9njNvgb7x
	ogXC0uuMz2Lfb31vuHZ26M7MUZUXceli1v5hXWLen7dU+gElAqqKp04BkxQQ6noSWg08=
X-Gm-Gg: AeBDieukaZaGj7/jXwYWgqBcTvwtVSTRghENW/UjG8Gv7hgwbM54cNsI6ODWLaezknV
	stePlciQi82rlC4p5u6yWXX5RcFLxp4lPUEJz1ReY4vRstwTrdzqb3nQ/2McO6wms3LYHdk4DiQ
	23CSsZ65IPuhnBOkeJD/S+uLoMbHzhLKQUZx0O0xKCNBqzJODurk+tTzJKA0lRDG1bj/7t9Jyca
	o7Hy4TMRj/fYBBpizTIlqb54dgJN3SE31VAWBYA/LPsBL/pozzzbi5lXmZm5iex+6YYgNLCcUy7
	Ua3QNlo2w4Lhkzjntimvn9UATUGJjRclfRanM8ozpggazxPTGvRoX8PPEBZ3UJ0biwSJcc70Wt6
	RoS7/mLS9PHM=
X-Received: by 2002:a05:6808:17aa:b0:462:acd3:4c64 with SMTP id 5614622812f47-46ef54f5498mr9879542b6e.5.1775608085447;
        Tue, 07 Apr 2026 17:28:05 -0700 (PDT)
X-Received: by 2002:a05:6808:17aa:b0:462:acd3:4c64 with SMTP id 5614622812f47-46ef54f5498mr9879528b6e.5.1775608084970;
        Tue, 07 Apr 2026 17:28:04 -0700 (PDT)
Received: from localhost ([2a03:2880:12ff:70::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4757665c7c5sm1238981b6e.1.2026.04.07.17.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:28:04 -0700 (PDT)
From: Neil Spring <ntspring@meta.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
        davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/2] tcp: rehash onto different ECMP path on retransmit timeout
Date: Tue,  7 Apr 2026 17:28:01 -0700
Message-ID: <20260408002802.2448424-2-ntspring@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260408002802.2448424-1-ntspring@meta.com>
References: <20260408002802.2448424-1-ntspring@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VVVh8NEUP-nSnFssj_525rL1woWb0B3Z
X-Authority-Analysis: v=2.4 cv=AL134PXh c=1 sm=1 tr=0 ts=69d5a116 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=f7IdgyKtn90A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VabnemYjAAAA:8 a=itqFa7u1WzcY9oaKGDUA:9
 a=efpaJB4zofY2dbm2aIRb:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMiBTYWx0ZWRfX/T1h/58jGuER
 n33FqDK10evP/JqIrnQxqXPofTjk8L88djogqIL8ZnQtfrd8lSMH4upzCnhFXYcBt+myMjY5hff
 uC2cIdfBSmV4LOaTdinHkJ+XP+Is435o2NGcj0TpwFp4o1TMkQ7e4+HByNEkpSv1eUabchWbYE4
 Zam3AA1MEoC3N32OmFZGgnjUaroLElsenTaXBZ3Znpahm2K+ku9o603f5DX3nzUsqmI2chWVTZX
 RsNYdn2ENUNDDn1iKfIqtRcgaWNOirqZtdHux3aKRm0F7at8+v3zYaTF5qD+mWO8+tHdICuB8gM
 S5f0r6nWhVlfKd85F48s6u/4OE0v72AWTSCS3kOzKRrMCofh5dvVSK5oj/laopFHie6x6iSXIPI
 7nuhYSfbHmT8p4/JTOzuRH5e+kHowd/CrBSebNgMDV6+VQU9k/dlmZPSzm1mQ3Mf+RPv38X/Qtv
 kMzsH2JYcbf06ukrvwQ==
X-Proofpoint-GUID: VVVh8NEUP-nSnFssj_525rL1woWb0B3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01

Add sk_dst_reset() alongside sk_rethink_txhash() in the RTO, PLB,
and spurious-retrans paths so that the next transmit triggers a fresh
route lookup.  Propagate sk_txhash into fl6->mp_hash in
inet6_csk_route_req() and inet6_csk_route_socket() so
fib6_select_path() uses the socket's current hash for ECMP selection.

The ir_iif update in tcp_check_req() covers both IPv4 and IPv6
because it was cleaner than gating on address family; IPv4 is
otherwise unaltered, and not having autoflowlabel in IPv4 means
I wouldn't expect a new path on timeout.

It is possible that PLB does not need this (that there are other
methods of reacting to local congestion); I added the sk_dst_reset
for consistency.

Signed-off-by: Neil Spring <ntspring@meta.com>
---
 net/ipv4/tcp_input.c             | 4 +++-
 net/ipv4/tcp_minisocks.c         | 9 +++++++++
 net/ipv4/tcp_plb.c               | 1 +
 net/ipv4/tcp_timer.c             | 1 +
 net/ipv6/inet6_connection_sock.c | 8 ++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 7171442c3ed7..3d42ab45066c 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5014,8 +5014,10 @@ static void tcp_rcv_spurious_retrans(struct sock *sk,
 	    skb->protocol == htons(ETH_P_IPV6) &&
 	    (tcp_sk(sk)->inet_conn.icsk_ack.lrcv_flowlabel !=
 	     ntohl(ip6_flowlabel(ipv6_hdr(skb)))) &&
-	    sk_rethink_txhash(sk))
+	    sk_rethink_txhash(sk)) {
 		NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPDUPLICATEDATAREHASH);
+		sk_dst_reset(sk);
+	}
 
 	/* Save last flowlabel after a spurious retrans. */
 	tcp_save_lrcv_flowlabel(sk, skb);
diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index 199f0b579e89..ef4b3771e9d8 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -750,6 +750,15 @@ struct sock *tcp_check_req(struct sock *sk, struct sk_buff *skb,
 		 * Reset timer after retransmitting SYNACK, similar to
 		 * the idea of fast retransmit in recovery.
 		 */
+
+#if IS_ENABLED(CONFIG_IPV6)
+		if (sk->sk_family == AF_INET6)
+			inet_rsk(req)->ir_iif = tcp_v6_iif(skb);
+		else
+#endif
+			inet_rsk(req)->ir_iif =
+				inet_request_bound_dev_if(sk, skb);
+
 		if (!tcp_oow_rate_limited(sock_net(sk), skb,
 					  LINUX_MIB_TCPACKSKIPPEDSYNRECV,
 					  &tcp_rsk(req)->last_oow_ack_time)) {
diff --git a/net/ipv4/tcp_plb.c b/net/ipv4/tcp_plb.c
index 68ccdb9a5412..d7cc00a58e53 100644
--- a/net/ipv4/tcp_plb.c
+++ b/net/ipv4/tcp_plb.c
@@ -79,6 +79,7 @@ void tcp_plb_check_rehash(struct sock *sk, struct tcp_plb_state *plb)
 		return;
 
 	sk_rethink_txhash(sk);
+	sk_dst_reset(sk);
 	plb->consec_cong_rounds = 0;
 	tcp_sk(sk)->plb_rehash++;
 	NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPPLBREHASH);
diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index ea99988795e7..acc22fc532c2 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -299,6 +299,7 @@ static int tcp_write_timeout(struct sock *sk)
 	if (sk_rethink_txhash(sk)) {
 		tp->timeout_rehash++;
 		__NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTREHASH);
+		sk_dst_reset(sk);
 	}
 
 	return 0;
diff --git a/net/ipv6/inet6_connection_sock.c b/net/ipv6/inet6_connection_sock.c
index 37534e116899..2fe753bb38b4 100644
--- a/net/ipv6/inet6_connection_sock.c
+++ b/net/ipv6/inet6_connection_sock.c
@@ -48,6 +48,11 @@ struct dst_entry *inet6_csk_route_req(const struct sock *sk,
 	fl6->flowi6_uid = sk_uid(sk);
 	security_req_classify_flow(req, flowi6_to_flowi_common(fl6));
 
+	if (req->num_retrans)
+		fl6->mp_hash = jhash_1word(req->num_retrans,
+					   (__force u32)ireq->ir_rmt_port)
+				>> 1;
+
 	if (!dst) {
 		dst = ip6_dst_lookup_flow(sock_net(sk), sk, fl6, final_p);
 		if (IS_ERR(dst))
@@ -70,6 +75,9 @@ struct dst_entry *inet6_csk_route_socket(struct sock *sk,
 	fl6->saddr = np->saddr;
 	fl6->flowlabel = np->flow_label;
 	IP6_ECN_flow_xmit(sk, fl6->flowlabel);
+
+	if (sk->sk_txhash)
+		fl6->mp_hash = sk->sk_txhash >> 1;
 	fl6->flowi6_oif = sk->sk_bound_dev_if;
 	fl6->flowi6_mark = sk->sk_mark;
 	fl6->fl6_sport = inet->inet_sport;
-- 
2.52.0


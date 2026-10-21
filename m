Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792608911;
	b=gMRMH116njS7JOZSbnEP/B+NWEZN5surdAQkTija3SB2DndFLx23XzSXdaaD5QLfR6vu
	 lftVpMCmNSoWol58s6jigAFfXHbH/a1SymS6PkF4vrH9S63Wyt8v/6Kxpd/wG31TCyNTY
	 bhm1hUbIhs4S2mwyZB0HmJ+UI0OBczZPkAzYrrf0vUX63DT5+2tyG0+y137mUBM3PFzFc
	 XM/MbJu2i+0SzgeM6EFf/I3Pbj7JL4JOCyf3wHW43PfXYPwL6zyUr2IoLRjHde5RH0H1t
	 2l6takp7V2N8/gyv8g1DXtiE8DflKw7PEGyHdu45Mf9vArtZ+oon1ltKl1uuepu62zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792608911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Yu31U+dAfnm8FCX7sgyhJSvUaC8ivYdBxYdsQgQP8es=;
	b=2eTprZXHutu8W0oH1A3tlnMxnbx4wLVLH3BDTtwQQ3nqwrB+pXjlhra2JlQtqNhgG6Gk
	 WoEKZij9ZfalT6bENbe7FqbIpNqgjZ9CBAujjblZdz4iKj6wmWCUh6DGIsBGt5P2peLaW
	 PTmGd07vC9oPy0mmVg/TUWDKQFDUgXfSkR/F0+fFhkzdESjk7IjKvr6tfZE6tPzKC3ASZ
	 skNETUsDX89jMM7JXpGsWVmsZOpQOb6KOMspbwNN+wv+8VP4Bp98mU8NB1SH42Gv8hec+
	 TLBaSqtYx1WKKrEh6w1QNQ6kHEQFJl7ovd4gPGTR6Q3kSEC6d7YaJsUB8Lhd9qLU/Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qiYabEWS;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE1606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 18:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DE1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qiYabEWS
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so1017425a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792608910; x=1793213710; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yu31U+dAfnm8FCX7sgyhJSvUaC8ivYdBxYdsQgQP8es=;
        b=qiYabEWSd6g2pq2ZoojCrfHqwVwNM0U5A3T7+I5ijmH4OTOHKeVzkQd1DJOkXt67QG
         MD3vMswLxvkAb8z857bDH/fV/Ux788W7I/CYpUhzH/HThn7bOQYwunj2fdWJyH12Jc/h
         QQ4CW9hapXe3IeGo97gIjWNgf7+JVtzOYb/1Cv7lRkFp2CDPtFBZmK/qqGkQNK1J0PkW
         I1UrellxtsK9zlcLjmQDR2DTTJ35GKViN4N0XRQ5STT+wWKjeS3THWsgp3w9noRAcfDZ
         MstcnfLUUrDV9D+tgAz7jfDk9S+F83P4mBpUHycFL6L/hGhWqTkrXIwAiweNhiwUoXb0
         +06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608910; x=1793213710;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yu31U+dAfnm8FCX7sgyhJSvUaC8ivYdBxYdsQgQP8es=;
        b=NuSTFvC4kr7XerM2pAyop5xml3bdoPJkX6wxTg0TET7LKpboShPRxCVPFz0VMZpsWf
         DOUQB6D4zm/MvtrIbmGWi3VphV/aVjuOmUBR5az119mjSRAAiX6xVo3k+6DiIx+e0QSQ
         Wwc9CspEyQGQKjSIS+ljWWRWiBv9JORV/7B0WOVs8LhqKAzefwzd+/5rE+Y2Utgeqmte
         qF/7EU3s7yQ4NcO5jXVm1AERff8BI6XNGYVAc9xG/3d8kKiSwWxP2JeNywf27gypkGQ9
         +TqXrMS/9qDxFfafEAQtX7KWgvWS01xJtWKggBtGGOG9BGpKzblzfVoj7wY/qz+l7J6Q
         671Q==
X-Forwarded-Encrypted: i=1; AKwUvBzQEYpz0oH6dE47xPdjENiacMJrpwjXvd6XXgAKKDOelSQQi++sWNBobrV8t1w+l+6uDoBH/mrxqDZ7ZoDoM1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ226ZdQE4TjxE5xKmeFc77cO3LysjXEjk7NaRBTC818CTQBshY
	TvDCkZR/Hir/QK+a9scXeIBHzliQG7mu+eb92v750gU0QcNEruJXc0uJYQpfffCh2B96Gy0yuQZ
	DOg==
X-Received: from pjbbd18.prod.google.com ([2002:a17:90b:b92:b0:3aa:ff61:94cf])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1110:b0:3ad:a270:a623
 with SMTP id 98e67ed59e1d1-3ada27112a2mr450765a91.4.1792608909456; Wed, 21
 Oct 2026 11:55:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:54:47 +0000
In-Reply-To: <20261021185447.2914274-1-tavip@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021185447.2914274-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261021185447.2914274-3-tavip@google.com>
Subject: [PATCH v3 2/2] selftests: net: packetdrill: add test for negative
 sk_forward_alloc in tcp_wmem_schedule()
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a packetdrill test that drives sk->sk_forward_alloc negative via
tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
under TCP memory pressure fails with EAGAIN rather than returning a
negative copy length from tcp_wmem_schedule() and failing with EFAULT.

Assisted-by: LLM
Signed-off-by: Octavian Purdila <tavip@google.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 .../testing/selftests/net/packetdrill/config  |   2 +
 .../selftests/net/packetdrill/ksft_runner.sh  |   6 +
 .../tcp_wmem_schedule_negative_fwd_alloc.pkt  | 108 ++++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt

diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
index b7df8bf309200..a14a704dcbd49 100644
--- a/tools/testing/selftests/net/packetdrill/config
+++ b/tools/testing/selftests/net/packetdrill/config
@@ -1,6 +1,8 @@
+CONFIG_CGROUPS=y
 CONFIG_HZ=1000
 CONFIG_HZ_1000=y
 CONFIG_IPV6=y
+CONFIG_MEMCG=y
 CONFIG_NET_NS=y
 CONFIG_NET_SCH_FIFO=y
 CONFIG_NET_SCH_FQ=y
diff --git a/tools/testing/selftests/net/packetdrill/ksft_runner.sh b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
index 0a97d5ae34699..dcda2b93c76e0 100755
--- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
+++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
@@ -52,6 +52,12 @@ if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
 	failfunc=ktap_test_xfail
 fi
 
+pagesize=$(grep -E '^--define=REQUIRES_PAGESIZE=' $script | cut -d '=' -f 3 | tr -d '"')
+if [[ -n "$pagesize" && "$(getconf PAGESIZE)" != "$pagesize" ]]; then
+	ktap_skip_all "requires ${pagesize}B PAGE_SIZE"
+	exit "$KSFT_SKIP"
+fi
+
 ip_versions=$(grep -E '^--ip_version=' $script | cut -d '=' -f 2)
 if [[ -z $ip_versions ]]; then
 	ip_versions="ipv4 ipv6 ipv4-mapped-ipv6"
diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
new file mode 100644
index 0000000000000..f8b7386fe77e2
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that tcp_wmem_schedule() clamps negative sk->sk_forward_alloc to 0
+// when sk_wmem_schedule() fails under memory pressure and
+// sk->sk_wmem_queued >= sysctl_tcp_wmem[0], returning EAGAIN rather than EFAULT.
+//
+// Buffer and segment sizes are tuned for 4 KB pages and standard
+// CONFIG_MAX_SKB_FRAGS values (17 to 45).
+
+--define=REQUIRES_PAGESIZE="4096"
+--mtu=65535
+--tolerance_usecs=100000
+
+`set -e
+./defaults.sh
+ip link set dev tun0 mtu 65535
+sysctl -q net.ipv4.tcp_rmem="4096 131072 6291456"
+sysctl -q net.ipv4.tcp_wmem="4096 16384 4194304"
+cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+[ -n "$cgroot" ]
+echo +memory > "${cgroot}/cgroup.subtree_control"
+rmdir "${cgroot}/pkt_${PPID}" 2>/dev/null || true
+mkdir "${cgroot}/pkt_${PPID}"
+echo $PPID > "${cgroot}/pkt_${PPID}/cgroup.procs"
+`
+
+// Create listening socket in pkt_${PPID} memcg and establish connection
+0.000 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0.000 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
++0.000 bind(3, ..., ...) = 0
++0.000 listen(3, 1) = 0
+
++0.000 < S 0:0(0) win 65535 <mss 35000,nop,wscale 7>
++0.000 > S. 0:0(0) ack 1 <...>
++0.000 < . 1:1(0) ack 1 win 512
++0.000 accept(3, ..., ...) = 4
+
+// Move packetdrill back to its original cgroup so subsequent packetdrill allocations are not charged to pkt_${PPID}
++0.000 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
+orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
+echo $PPID > "${cgroot}${orig_cg}/cgroup.procs"`
+
++0.000 setsockopt(4, SOL_SOCKET, SO_SNDBUF, [200000], 4) = 0
++0.000 setsockopt(4, SOL_SOCKET, SO_RCVBUF, [112500], 4) = 0
+
+// 1. Warm up rcv_ssthresh to full window
++0.000 < P. 1:35001(35000) ack 1 win 512
++0.000 > . 1:1(0) ack 35001
++0.000 read(4, ..., 35000) = 35000
+
++0.000 < P. 35001:70001(35000) ack 1 win 512
++0.000 > . 1:1(0) ack 70001
++0.000 read(4, ..., 35000) = 35000
+
++0.000 < P. 70001:105001(35000) ack 1 win 512
++0.000 > . 1:1(0) ack 105001
++0.000 read(4, ..., 35000) = 35000
+
++0.000 < P. 105001:140001(35000) ack 1 win 512
++0.000 > . 1:1(0) ack 140001
++0.000 read(4, ..., 35000) = 35000
+
+// 2. Queue 79 KB on TX so sk_wmem_queued >= sysctl_tcp_wmem[0], while leaving
+//    both tail SKB space (26 KB) and sk_page_frag space (19.3 KB) >= 16 KB.
++0.000 write(4, ..., 79000) = 79000
+
+// 3a. Inject 6 high-density 35 KB segments (210 KB payload, 222.7 KB truesize
+//     across 8-page order-3 frags on both CONFIG_MAX_SKB_FRAGS=17 and 45) and
+//     read 100 bytes from the head SKB so before(skb->seq, tp->copied_seq) is true.
++0.000 < P. 140001:175001(35000) ack 1 win 512
++0.000 < P. 175001:210001(35000) ack 1 win 512
++0.000 read(4, ..., 100) = 100
+
++0.000 < P. 210001:245001(35000) ack 1 win 512
++0.000 < P. 245001:280001(35000) ack 1 win 512
++0.000 < P. 280001:315001(35000) ack 1 win 512
++0.000 < P. 315001:350001(35000) ack 1 win 512
+
+// 3b. Inject three smaller segments into the remaining advertised rcv_wnd.
+//     Their higher truesize pushes sk_rmem_alloc > sk_rcvbuf (225000) and
+//     exhausts sk_forward_alloc, triggering tcp_prune_queue() -> tcp_collapse()
+//     on the 3rd segment and driving sk->sk_forward_alloc <= -16.4 KB.
++0.000 < P. 350001:350801(800) ack 1 win 512
++0.000 < P. 350801:351601(800) ack 1 win 512
++0.000 < P. 351601:351901(300) ack 1 win 512
+
+// 4. Drain per-CPU memcg stock via memory.high=0, cap memory.max=0 (O_NONBLOCK
+//    avoids synchronous reclaim/OOM), and expect -EAGAIN on a 16 KB non-blocking
+//    write. Because copy (16 KB) minus sk_forward_alloc (<= -16.4 KB) exceeds
+//    PAGE_ALLOC_COSTLY_ORDER (32 KB), try_charge_memcg() fails without invoking
+//    the memcg OOM killer.
++0.010 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
+printf 0 | dd of="${cgroot}/pkt_${PPID}/memory.max" oflag=nonblock status=none`
++0.000 fcntl(4, F_SETFL, O_RDWR|O_NONBLOCK) = 0
++0.000 write(4, ..., 16384) = -1 EAGAIN (Resource temporarily unavailable)
+
++0.000 close(4) = 0
++0.000 close(3) = 0
+
+// Untimed cleanup command executed by packetdrill on both pass and early failure.
+`cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+[ -n "$cgroot" ] || exit 0
+runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
+orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
+echo $PPID > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
+echo $$ > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
+rmdir "${cgroot}/pkt_${PPID}"`
-- 
2.56.0.307.g5fe7bd680c-goog


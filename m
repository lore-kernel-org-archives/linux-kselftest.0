Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8912D448BB7
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 07:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792049872; cv=none; b=hDke/owlGzhK3B4yM1RjCmZYt4ElEf/thJV49vwUboCJq3Zu2iBu/wJvXwbN9XVmm4V7LAcej0ghlLLdyRNMqin9ZfU+zFZLqe2zSnKpKK1jxnKcW4n9l4TG3DguLg2v1vV0mNud7iTezIX0ajCfJ7mI5J3b2BckvJvq/qNZBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792049872; c=relaxed/simple;
	bh=17JN4X/31BH/BJ4zydzzOyB2IHXs5dXEYxegLQkbta8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UirGlDxdTTZ/IcRnuswT3cW/RqN9ns1kLaVQyGLmSCYyp8JWjlzD7+EgUZKBk4Rmqtp/vDaTCS0SEqQ+DFEhl3JZGF6VjcSCddWxXV5QSrkuvyT0HTuLKqGMv++8vnGyrTnLAKlKr1u8efi9n58ff6UkEwONXtoNUc5GgsB64Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q5DsEbn7; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q5DsEbn7"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so5790690a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792049870; x=1792654670; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5KNtI5NYvywtN2n2B4yxYgfhf/wGewyX53V1p6i6n4=;
        b=Q5DsEbn7VIquPpukbVCXljBR1Qnw6EOzeLRbgH4InlwzIsA6xZpNo+rsVvOMBDhF4V
         ePn09bX89mVmFuUvMN2H08YWVPt/zvWabfbtq/Ua49glE4eF6mpiKuGTj/UtfM5mYRIE
         V07U9zpgz2phPqlA6l1k3CmKdgXBvEUSjptz0j50KOYENzMO2s4JKUjIhTARJr73NfzC
         YTTUHkKQuoTKh+kVo6WQ5ttPX7VyFUw9zRT1elwogo82J+PgjfVDXMUCmXm86wCIariw
         XsjARCUN4uAK5y03v+hdsIFOITa7qrvhjSHErkdZPmX+qSas+cBP143hWPmBQXan2zN1
         fkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792049870; x=1792654670;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5KNtI5NYvywtN2n2B4yxYgfhf/wGewyX53V1p6i6n4=;
        b=WKHLDZsiJGdF5XQVsAdBcZL0JrTPBPwtNo/97zy7HQYy/PH7qpbBDYrm5kZ7ZZ61tY
         BEYBkfjXVOP4jRLlZzTjs8MTwlsrlSME1x1Pj2VaSfmtxRg6Zq3AlgVdu9Emumnr9p0V
         d6hFVP7BEXeCWMG+ONs3JktaBmjSMLbDdyGOGo+AsSREEfVB+SGivJdBLR7aDwJZaQxC
         H96z2Vv8BF50gURkxS8Ug5M1apavvFHRvSS/FQNLCFUARx7KWCXyxOpFOuT2l+QbyFc7
         VAQqfleeefdMdCsC+WIEunBWPPh9rngZzF0DJaaJIk+JUx+FuubDeqUi955+SEulTe4S
         gVWQ==
X-Forwarded-Encrypted: i=1; AKwUvByohS8pQZK58c/gvwZ3hSZ72U3UZ42uNECNpZPywcEjs5SwxZ5Z4hFTxT1rkTrCusIH2fI5TL6jrMVwDbdC6PQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZLtCVAFAqhIgdaXNoWnTV8tuA5DVjSSMM2S/zz2m2gyLtVGIg
	maH9opFnPitDjxR2EZi7cNUGxBzJhESpgSKkTBUc/l/0j5+9eKuFtz3+MKAoxW7AuI8xSrT7KGT
	EhA==
X-Received: from pgam24.prod.google.com ([2002:a05:6a02:2b58:b0:cc7:84e0:e066])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d07:b0:3e0:d38e:1ed9
 with SMTP id adf61e73a8af0-3e16be86c35mr17136921637.48.1792049869414; Thu, 15
 Oct 2026 00:37:49 -0700 (PDT)
Date: Thu, 15 Oct 2026 07:37:36 +0000
In-Reply-To: <20261015073736.2944215-1-tavip@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015073736.2944215-3-tavip@google.com>
Subject: [PATCH net 2/2] selftests: net: packetdrill: add test for negative
 sk_forward_alloc in tcp_wmem_schedule()
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Soheil Hassas Yeganeh <soheil@google.com>, Wei Wang <weiwan@google.com>, 
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
---
 .../testing/selftests/net/packetdrill/config  |   1 +
 .../tcp_wmem_schedule_negative_fwd_alloc.pkt  | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt

diff --git a/tools/testing/selftests/net/packetdrill/config b/tools/testing/selftests/net/packetdrill/config
index b7df8bf309200..dc3cd72a8da8c 100644
--- a/tools/testing/selftests/net/packetdrill/config
+++ b/tools/testing/selftests/net/packetdrill/config
@@ -1,6 +1,7 @@
 CONFIG_HZ=1000
 CONFIG_HZ_1000=y
 CONFIG_IPV6=y
+CONFIG_MEMCG=y
 CONFIG_NET_NS=y
 CONFIG_NET_SCH_FIFO=y
 CONFIG_NET_SCH_FQ=y
diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
new file mode 100644
index 0000000000000..db232b54c554e
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that tcp_wmem_schedule() clamps negative sk->sk_forward_alloc to 0
+// when sk_wmem_schedule() fails under memory pressure and
+// sk->sk_wmem_queued >= sysctl_tcp_wmem[0], returning EAGAIN rather than EFAULT.
+
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
+mkdir -p "${cgroot}/pkt_${PPID}"
+echo $PPID > "${cgroot}/pkt_${PPID}/cgroup.procs"
+`
+
+// Create listening socket in pkt_${PPID} memcg and establish connection
+0.000 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
++0.000 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
++0.000 bind(3, ..., ...) = 0
++0.000 listen(3, 1) = 0
+
++0.000 < S 0:0(0) win 65535 <mss 36000,nop,wscale 7>
++0.000 > S. 0:0(0) ack 1 <...>
++0.000 < . 1:1(0) ack 1 win 512
++0.000 accept(3, ..., ...) = 4
+
+// Move packetdrill back to its original cgroup so only the sockets remain charged to pkt_${PPID}
++0.000 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
+orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
+echo $PPID > "${cgroot}${orig_cg}/cgroup.procs"`
+
++0.000 setsockopt(4, SOL_SOCKET, SO_SNDBUF, [2097152], 4) = 0
++0.000 setsockopt(4, SOL_SOCKET, SO_RCVBUF, [145536], 4) = 0
+
+// 1. Warm up rcv_ssthresh to full window (~256 KB)
++0.000 < P. 1:36001(36000) ack 1 win 512
++0.000 > . 1:1(0) ack 36001
++0.000 read(4, ..., 36000) = 36000
+
++0.000 < P. 36001:72001(36000) ack 1 win 512
++0.000 > . 1:1(0) ack 72001
++0.000 read(4, ..., 36000) = 36000
+
++0.000 < P. 72001:108001(36000) ack 1 win 512
++0.000 > . 1:1(0) ack 108001
++0.000 read(4, ..., 36000) = 36000
+
++0.000 < P. 108001:144001(36000) ack 1 win 512
++0.000 > . 1:1(0) ack 144001
++0.000 read(4, ..., 36000) = 36000
+
+// 2. Queue 500 KB on TX so sk_wmem_queued >= sysctl_tcp_wmem[0]
++0.000 write(4, ..., 500000) = 500000
+
+// 3a. Inject 6 high-density 36 KB segments (216 KB payload, 222.7 KB truesize)
+//     and read 100 bytes from the head SKB so before(skb->seq, tp->copied_seq) is true.
++0.000 < P. 144001:180001(36000) ack 1 win 512
++0.000 read(4, ..., 100) = 100
+
++0.000 < P. 180001:216001(36000) ack 1 win 512
++0.000 < P. 216001:252001(36000) ack 1 win 512
++0.000 < P. 252001:288001(36000) ack 1 win 512
++0.000 < P. 288001:324001(36000) ack 1 win 512
++0.000 < P. 324001:360001(36000) ack 1 win 512
+
+// 3b. Inject 22 smaller 1000-byte segments into the remaining advertised rcv_wnd.
+//     Their higher truesize pushes sk_rmem_alloc > sk_rcvbuf (291072),
+//     triggering tcp_prune_queue -> tcp_collapse on the 216 KB of 36 KB SKBs
+//     and driving sk->sk_forward_alloc negative (-32768).
++0.000 < P. 360001:361001(1000) ack 1 win 512
++0.000 < P. 361001:362001(1000) ack 1 win 512
++0.000 < P. 362001:363001(1000) ack 1 win 512
++0.000 < P. 363001:364001(1000) ack 1 win 512
++0.000 < P. 364001:365001(1000) ack 1 win 512
++0.000 < P. 365001:366001(1000) ack 1 win 512
++0.000 < P. 366001:367001(1000) ack 1 win 512
++0.000 < P. 367001:368001(1000) ack 1 win 512
++0.000 < P. 368001:369001(1000) ack 1 win 512
++0.000 < P. 369001:370001(1000) ack 1 win 512
++0.000 < P. 370001:371001(1000) ack 1 win 512
++0.000 < P. 371001:372001(1000) ack 1 win 512
++0.000 < P. 372001:373001(1000) ack 1 win 512
++0.000 < P. 373001:374001(1000) ack 1 win 512
++0.000 < P. 374001:375001(1000) ack 1 win 512
++0.000 < P. 375001:376001(1000) ack 1 win 512
++0.000 < P. 376001:377001(1000) ack 1 win 512
++0.000 < P. 377001:378001(1000) ack 1 win 512
++0.000 < P. 378001:379001(1000) ack 1 win 512
++0.000 < P. 379001:380001(1000) ack 1 win 512
++0.000 < P. 380001:381001(1000) ack 1 win 512
++0.000 < P. 381001:382001(1000) ack 1 win 512
+
+// 4. Cap the socket memcg at its current usage and expect -EAGAIN on non-blocking write.
++0.010 `cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
+cat "${cgroot}/pkt_${PPID}/memory.current" > "${cgroot}/pkt_${PPID}/memory.max"`
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
2.56.0.176.g3575e65682-goog


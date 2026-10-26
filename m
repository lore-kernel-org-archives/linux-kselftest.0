Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984942;
	b=Dw79HgskDsV41fhtQkLshrx2ugwdrSshlwIZtv/8bXq5s3M/1cORi/eiemdKlqTuNVV7
	 RrS1zxZ1bXnpDfgrYLkERPgDv/c+XUoOF8Lj1wJAFdaYgJ/xr028/27DgfxqaLGAqv5wu
	 JhawCj5Z7bI89KzcbIHn5vODnytQxEwXYglnKVjd7miV0ObWZ4qzWiPrjTq+YCknnewaH
	 TFnXCjP6p6JHyhhqMUqkWV7asbalGkapsnKpXcFq03D2TpqojLI+wvFgUXmAJIXNjIJd4
	 MBsOq7tZeRCXR9VCnxIABps5Pw+Ql+y+jXMmVBRiQt/IsU0Qvuo+QTKtymXwGhAMDNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=x40x3fDhGGgehXKpGGRcJMG7MWAknRBMtZbK0YN/lfQ=;
	b=ZVWeSEJgYl0CjwDEQlLrGmQnrfjl08RFeWYOk8fljb37mk4FPX/7PifqWLTCZrrQQwO8
	 BQaDS3Y+X7evp/EAqG2YavrEBNSGkBtiSCMpkf9HKVSzY+fApVt5LlgnqdOmxmZl1cNxj
	 cBdMGo2hrqOspzYuWLzqBIefHIC2iVdhNtkIMPIjyI0gPTXc69Dzg8BebujcYYS+mU5mz
	 anFFGioD8OBkuTaERAG89kjBQyNsSUskI2JIHzYrfl718oWnEB6YRhmYUV+D47/6pFsJR
	 d2x6/9xGRZiV3UznNaoTqdmq6FgyO2S0OBp+DMLYNZpt/0Q28evf0e1ExgiqelNvhBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tavip.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RUC9kPc2;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D4606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 03:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C2D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tavip.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RUC9kPc2
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3700394a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792984941; x=1793589741; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x40x3fDhGGgehXKpGGRcJMG7MWAknRBMtZbK0YN/lfQ=;
        b=RUC9kPc2QgeKPHkz52+j9onBT7HbaXmL875LeBjYgZhW591Z5VhRDW39xOA/ZgA2NZ
         398u8ozP0Dawb18g5SU+G8mNQtQFg5wJ3rJCMk6z6Y/snoKxj1MwJeIg8B2v0pcgcW3/
         dr5/kO9Db94ToDqsVfRqSgkLlxs9OJUbcptKhaHJ9d2QzbwIj8oLW6a0y2+5d5qtevF1
         YCTQ1979rFx4q64M/qMMQtVh5jn8jzvBzjjlmZ1mwh4G4FloNOMFlf8qj2X7eEAqCdqN
         kmi7FUn1OQGceXNE1924FIHOGme3zDX5DpRz0NNOGkzKB38IWpfDR2wSBAMkKGNPDFHJ
         D38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984941; x=1793589741;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x40x3fDhGGgehXKpGGRcJMG7MWAknRBMtZbK0YN/lfQ=;
        b=Q1p6GwC4OZw3Jjqj5cQ4wWuHLAneSQlsE2ksWPWrNzfqSxIUvZHl2HYqmfawzbZmSs
         1FF/XexmqrAAAeHazWqrKiaPIMqKhtjUkjFJpIwqGk8inmPpLn442LZ+I3GPIh5N0+Tn
         AxRnjzghXQJzrHZkGH1Jek5Xj5OYSpH/2zXsduvHZApf3quRcqIw80CXgV0009r8Hkzx
         tOk71cBknes9W3z5yDwHsA30dAbYyTIQZi9qjleYSz3swkTe0LlROLa3O0KywCTb+ho8
         k8i3ITxNwQerIcERLaf9b5bhEzq4zixKPVd0QdWSC6h9yZI8WVSz9OnLC5Dyi/5j/Mts
         lnfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoCmVKuoPfTSlKimJXWGcg6gQ3fzrcUSuI0Tk6hxZnIJJytzF0rDFK1jzELfhweDOSyaZaitqrF8CBarHiGyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnq48AHEqdw6DC9B2B2ZWzcrVQRMjYvGZwGMJZCGb8w1OFpTNs
	by1HjxfD3G3qNgX3sY6LVJ3okwDi+sx2Pz2rS/Km/AefclJzgMxPf+IRZ2sL22lX/zWnBKX2BEm
	Mgw==
X-Received: from plcf10.prod.google.com ([2002:a17:903:104a:b0:2e9:9805:eafe])
 (user=tavip job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:fa8:b0:2e9:740c:371
 with SMTP id d9443c01a7336-2ea9c6c4eacmr45888055ad.38.1792984940836; Sun, 25
 Oct 2026 20:22:20 -0700 (PDT)
Date: Mon, 26 Oct 2026 03:22:16 +0000
In-Reply-To: <20261026032216.1145201-1-tavip@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026032216.1145201-3-tavip@google.com>
Subject: [PATCH net v4 2/2] selftests: net: packetdrill: add test for negative
 sk_forward_alloc in tcp_wmem_schedule()
From: Octavian Purdila <tavip@google.com>
To: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Octavian Purdila <tavip@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a packetdrill test that drives sk->sk_forward_alloc negative via
tcp_collapse() on the receive queue while sk->sk_wmem_queued exceeds
sysctl_tcp_wmem[0], and verifies that a subsequent non-blocking write()
under TCP memory pressure fails with EAGAIN rather than returning a
negative copy length from tcp_wmem_schedule() and failing with EFAULT.

Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 .../testing/selftests/net/packetdrill/config  |   2 +
 .../selftests/net/packetdrill/ksft_runner.sh  |  28 +++++
 .../tcp_wmem_schedule_negative_fwd_alloc.pkt  | 116 ++++++++++++++++++
 3 files changed, 146 insertions(+)
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
index 0a97d5ae34699..ba62f3840eb57 100755
--- a/tools/testing/selftests/net/packetdrill/ksft_runner.sh
+++ b/tools/testing/selftests/net/packetdrill/ksft_runner.sh
@@ -52,6 +52,34 @@ if [[ -n "${KSFT_MACHINE_SLOW}" ]]; then
 	failfunc=ktap_test_xfail
 fi
 
+pagesize=$(grep -E '^--define=REQUIRES_PAGESIZE=' $script | cut -d '=' -f 3 | tr -d '"')
+if [[ -n "$pagesize" && "$(getconf PAGESIZE)" != "$pagesize" ]]; then
+	ktap_skip_all "requires ${pagesize}B PAGE_SIZE"
+	exit "$KSFT_SKIP"
+fi
+
+if grep -q -E '^--define=REQUIRES_MEMCG=' $script; then
+	cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+	memcg_was_enabled=0
+	if [[ -n "$cgroot" ]] &&
+	   grep -qw memory "${cgroot}/cgroup.subtree_control" 2>/dev/null; then
+		memcg_was_enabled=1
+	fi
+	if [[ -z "$cgroot" ]] ||
+	   ! echo +memory > "${cgroot}/cgroup.subtree_control" 2>/dev/null; then
+		ktap_skip_all "requires cgroup2 memory controller"
+		exit "$KSFT_SKIP"
+	fi
+	cleanup_memcg() {
+		rmdir "${cgroot}"/pkt_* 2>/dev/null || true
+		if [[ "$memcg_was_enabled" -eq 0 ]]; then
+			echo -memory > "${cgroot}/cgroup.subtree_control" \
+				2>/dev/null || true
+		fi
+	}
+	trap cleanup_memcg EXIT
+fi
+
 ip_versions=$(grep -E '^--ip_version=' $script | cut -d '=' -f 2)
 if [[ -z $ip_versions ]]; then
 	ip_versions="ipv4 ipv6 ipv4-mapped-ipv6"
diff --git a/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
new file mode 100644
index 0000000000000..e4d8d13144f0a
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_wmem_schedule_negative_fwd_alloc.pkt
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test that tcp_wmem_schedule() clamps negative sk->sk_forward_alloc to 0
+// when sk_wmem_schedule() fails under memory pressure and
+// sk->sk_wmem_queued >= sysctl_tcp_wmem[0], returning EAGAIN rather than
+// EFAULT.
+//
+// Buffer and segment sizes are tuned for 4 KB pages and standard
+// CONFIG_MAX_SKB_FRAGS values (17 to 45).
+
+--define=REQUIRES_PAGESIZE="4096"
+--define=REQUIRES_MEMCG="1"
+--mtu=65535
+--tolerance_usecs=100000
+
+`set -e
+./defaults.sh
+ip link set dev tun0 mtu 65535
+sysctl -q net.ipv4.tcp_rmem="4096 131072 6291456"
+sysctl -q net.ipv4.tcp_wmem="4096 16384 4194304"
+taskset -cp 0 $PPID >/dev/null 2>&1 || true
+cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+[ -n "$cgroot" ]
+echo +memory > "${cgroot}/cgroup.subtree_control"
+rmdir "${cgroot}/pkt_${PPID}" 2>/dev/null || true
+mkdir "${cgroot}/pkt_${PPID}"
+echo 0 > "${cgroot}/pkt_${PPID}/memory.swap.max" 2>/dev/null || true
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
+// Move packetdrill back to its original cgroup so subsequent packetdrill
+// allocations are not charged to pkt_${PPID}.
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
+//     read 100 bytes from the head SKB so before(skb->seq, tp->copied_seq)
+//     holds.
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
+echo 0 > "${cgroot}/pkt_${PPID}/memory.high"
+printf 0 | dd of="${cgroot}/pkt_${PPID}/memory.max" oflag=nonblock status=none`
++0.000 fcntl(4, F_SETFL, O_RDWR|O_NONBLOCK) = 0
++0.000 write(4, ..., 16384) = -1 EAGAIN (Resource temporarily unavailable)
+
++0.000 close(4) = 0
++0.000 close(3) = 0
+
+// Untimed cleanup command executed by packetdrill on both pass and early
+// failure.
+`cgroot=$(mount -t cgroup2 | head -1 | awk '{print $3}')
+[ -n "$cgroot" ] || exit 0
+runner_pid=$(awk '/^PPid:/ {print $2}' /proc/$PPID/status)
+orig_cg=$(sed -n 's/^0:://p' /proc/$runner_pid/cgroup)
+echo $PPID > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
+echo $$ > "${cgroot}${orig_cg}/cgroup.procs" 2>/dev/null || true
+rmdir "${cgroot}/pkt_${PPID}"`
-- 
2.56.0.257.gf7497c7d27-goog


Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8064B47DFBD
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127273; cv=none; b=eBgFpgYJSPBYjqCPhKwbzGpkygILjPV6RJT0w74QYwJsfkbkFuKagTPhyAB8JoTCgxuHNB4f/zi5OdqI/7RjYhzDLPF8rAb5PU3vbx577LALkeppbPnlSdmvmaIAM5ywSg9s22ZglJBvYj4H6bHr0SYQYdKhsoZo0QBL5lRU5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127273; c=relaxed/simple;
	bh=IxAkk/33tiz9H88smr/LKk6TLSYHCBaXGlpP5ahBnLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjTcRg2bqMTubCcot5yC31+OyXAYMUMASw9kvn6GvzSaK0Kal60lKzxehfgkfFYA4/wADdVyugCBhsPVI+RWD6GCYs3IKRCRyX3EexVgqZnZGtrqD2oCBwHrKFyxDvhvOOqXQPXVpozJ+1yB+EoRWjX71vx26u2s8brKtq2bBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=op66BKic; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="op66BKic"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784127267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EzxkN0ejXTQh2wUnfoxzGBh8Ymoz3E2lArEKEFtPUU=;
	b=op66BKicsUEDzJU9EBMBIG9auGepduRlOXJENPcAc59EpmXyybvMIjdNDyRkn7EZKUdImP
	DJhrCbG28bjahdW9pPXsvj59PPM19OYtIBk6x8U2t8dcSsndFKQRREcgu4X421il3aIF69
	iXE+vKNgL1E5c7iYt+evt8eg7EKh8/Y=
From: Leon Hwang <leon.hwang@linux.dev>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ij@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Lance Yang <lance.yang@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH net-next v2 2/2] selftests/net: packetdrill: Add two tcp_purge_receive_queue tests
Date: Wed, 15 Jul 2026 22:53:27 +0800
Message-ID: <20260715145328.54597-3-leon.hwang@linux.dev>
In-Reply-To: <20260715145328.54597-1-leon.hwang@linux.dev>
References: <20260715145328.54597-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Run the tests:

 # ./ksft_runner.sh ./tcp_purge_receive_queue_disabled.pkt
 TAP version 13
 1..3
 ok 1 ipv4
 ok 2 ipv6
 ok 3 ipv4-mapped-ipv6
 # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0

 # ./ksft_runner.sh ./tcp_purge_receive_queue_enabled.pkt
 TAP version 13
 1..3
 ok 1 ipv4
 ok 2 ipv6
 ok 3 ipv4-mapped-ipv6
 # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0

Assisted-by: Codex:gpt-5.5
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 .../tcp_purge_receive_queue_disabled.pkt      | 40 ++++++++++++++++++
 .../tcp_purge_receive_queue_enabled.pkt       | 42 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_disabled.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_enabled.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_disabled.pkt b/tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_disabled.pkt
new file mode 100644
index 000000000000..a46f93eaab1f
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_disabled.pkt
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test: with tcp_purge_receive_queue disabled (default), receiving RST
+// in CLOSE_WAIT state does NOT purge the receive queue.
+// The unread data in the receive queue is still accessible to the
+// application.
+
+`./defaults.sh
+./set_sysctls.py /proc/sys/net/ipv4/tcp_purge_receive_queue=0`
+
+// Establish a connection (server side).
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,sackOK,nop,nop,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
+ +.1 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+// Remote sends 4KiB data so that receive queue is populated.
+ +.1 < . 1:4097(4096) ack 1 win 257
+   +0 > . 1:1(0) ack 4097
+
+// Remote sends FIN -> socket enters CLOSE_WAIT.
+ +.1 < F. 4097:4097(0) ack 1 win 257
+   +0~+.04 > . 1:1(0) ack 4098
+
+// Inject RST directly while in CLOSE_WAIT.
+ +.1 < R. 4098:4098(0) ack 1 win 257
+
+// With tcp_purge_receive_queue=0, the receive queue is NOT purged.
+// Data is still in the receive queue; read returns data.
+   +0 read(4, ..., 1) = 1
+
+   +0 close(4) = 0
+
+// Restore sysctls.
+`/tmp/sysctl_restore_${PPID}.sh`
diff --git a/tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_enabled.pkt b/tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_enabled.pkt
new file mode 100644
index 000000000000..b1d1dff28f50
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_purge_receive_queue_enabled.pkt
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+// Test: with tcp_purge_receive_queue enabled, receiving RST in
+// CLOSE_WAIT state purges the receive queue immediately.
+// The unread data is discarded, so read() observes EOF.
+//
+// RFC 9293 Section 3.10.7.4:
+//   "all segment queues should be flushed"
+
+`./defaults.sh
+./set_sysctls.py /proc/sys/net/ipv4/tcp_purge_receive_queue=1`
+
+// Establish a connection (server side).
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+   +0 < S 0:0(0) win 32792 <mss 1000,sackOK,nop,nop,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
+ +.1 < . 1:1(0) ack 1 win 257
+
+   +0 accept(3, ..., ...) = 4
+
+// Remote sends 4KiB data so that receive queue is populated.
+ +.1 < . 1:4097(4096) ack 1 win 257
+   +0 > . 1:1(0) ack 4097
+
+// Remote sends FIN -> socket enters CLOSE_WAIT.
+ +.1 < F. 4097:4097(0) ack 1 win 257
+   +0~+.04 > . 1:1(0) ack 4098
+
+// Inject RST directly while in CLOSE_WAIT.
+ +.1 < R. 4098:4098(0) ack 1 win 257
+
+// With tcp_purge_receive_queue=1, the receive queue IS purged.
+// Queue was purged by RST handler; read returns EOF.
+   +0 read(4, ..., 1) = 0
+
+   +0 close(4) = 0
+
+// Restore sysctls.
+`/tmp/sysctl_restore_${PPID}.sh`
-- 
2.55.0


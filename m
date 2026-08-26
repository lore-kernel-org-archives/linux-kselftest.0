Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711B44212E
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753538; cv=none; b=mrnd1aQV4kk0NpZpHPJvOj6/GVvdLjEPLsprTZPRah24K1e26gfNjNQf0HxOgdalygFsRYQLjc5dCgvOkHeB0hkh/QIsXPemEy1yU09D36fM6DSxXvYUvjE3QFBBdMjdnJ1RhGVXiZRNVtZy+smBSD/3T5bD5HvGpQtkiZDtBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753538; c=relaxed/simple;
	bh=2T40DwJCDpgsIuN5b4I+qBOudCNUtHr5SSG0IRYguhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qs9KctSrMOmiy2fr0fi1+iEBh1vEjmxjV2zFDk5siTvRdffuuV+AZlgmDVOt9F3CgQJh15PsPjSaq/9EbRXTbo+n6aZCrjGxOktYhhFgi/i65n2smB51A9LQQexpPE4p0yLE7z9Wq4Blv09ejZBC8lzHERRtrADlb/oLmXm3nF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GMTHVSBg; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GMTHVSBg"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2T40DwJCDpgsIuN5b4I+qBOudCNUtHr5SSG0IRYguhM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787753532; v=1; x=1788358332;
 b=GMTHVSBg4Fd3r9oKvqYWM9EjAgf6hvPshJGKARsDuoOX0OdEfE9KH0tgozLMtbB29gWJExg/
 bogEI6gRVqg+QkoDkv/fF38RfFyY2R69xX7evOQRl6Yb5IxGrX80kIHyJ4ndQcOifcvRV0mO8We
 TOlViJNTOdPUNi2R2p6Oj+7M=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from localhost.localdomain (147.136.157.2)
	by smtp.migadu.com with ESMTPS id cb30e2ce42366c84;
	Wed, 26 Aug 2026 14:12:11 +0000
X-Mizu-Trace-ID: cb30e2ce42366c84
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuchung Cheng <ycheng@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 2/2] selftests/net: packetdrill: add tcp_urg_ptr_retransmit
Date: Wed, 26 Aug 2026 22:11:27 +0800
Message-ID: <20260826141145.67823-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826141145.67823-1-jiayuan.chen@linux.dev>
References: <20260826141145.67823-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drive a connection into urgent mode and force a multi-segment retransmit,
checking that each retransmitted segment keeps its own urg_ptr.

The test asserts the fixed behaviour: the hole is retransmitted as two
independent skbs, each with its own urg_ptr (5001 and 4001) and no PSH.
An unpatched kernel instead sends one super-skb whose GSO split copies
urg_ptr onto the second segment and also sets PSH there, so on an unpatched
kernel the mismatch shows up on the PSH bit (actual P.U ... urg 5001) before
the urg_ptr:

	tcp_urg_ptr_retransmit.pkt:63: live packet field tcp_psh:
		expected: 0 (0x0) vs actual: 1 (0x1)
	script packet:  .U 1001:2001(1000) ack 1
	actual packet:  P.U 1001:2001(1000) ack 1 win 1050

After the fix the retransmit carries a per-segment urg_ptr and the test
passes.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../packetdrill/tcp_urg_ptr_retransmit.pkt    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransmit.pkt

diff --git a/tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransmit.pkt b/tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransmit.pkt
new file mode 100644
index 000000000000..22f750ce09c1
--- /dev/null
+++ b/tools/testing/selftests/net/packetdrill/tcp_urg_ptr_retransmit.pkt
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+--ip_version=ipv4
+//
+// Reproduce urg_ptr being copied across segments on a multi-segment retransmit
+// in urgent mode (regression since 10d3be569243).
+//
+//   server (kernel, under test)                 client (packetdrill)
+//     |  write(5000): 1:1001 .. 4001:5001            |     mss 1000 from
+//     | -------------------------------------------> |     the client SYN
+//     |  send(MSG_OOB): 5001:5002 urg 1              |     snd_up = 5002
+//     | -------------------------------------------> |
+//     |            SACK 2001:5002, leaving hole 1:2001|
+//     | <------------------------------------------- |
+//     |  retransmit hole 1:2001 as ONE skb:          |
+//     |    seq=1, 2 segments, urg_ptr = 5002-1 = 5001|
+//     |  tun tso off -> software GSO splits it:      |
+//     |    seg A  1:1001    urg_ptr 5001  (correct)  |
+//     |    seg B  1001:2001 urg_ptr ?                |
+//     |        want 5002-1001 = 4001                 |
+//     |        bug  inherits 5001  <- caught here    |
+//     | -------------------------------------------> |
+//
+
+`./defaults.sh`
+
+    0 socket(..., SOCK_STREAM, IPPROTO_TCP) = 3
+   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) = 0
+   +0 bind(3, ..., ...) = 0
+   +0 listen(3, 1) = 0
+
+// 1. client force mss=1000
+  +.1 < S 0:0(0) win 32792 <mss 1000,sackOK,nop,nop,nop,wscale 7>
+   +0 > S. 0:0(0) ack 1 <mss 1460,nop,nop,sackOK,nop,wscale 8>
+  +.1 < . 1:1(0) ack 1 win 320
+   +0 accept(3, ..., ...) = 4
+
+// 2. server sends 5000 bytes; TSO on, so packetdrill sees whole super-skbs
+   +0 write(4, ..., 5000) = 5000
+   +0 > P. 1:5001(5000) ack 1
+
+// 3. server send OOB
+   +0 send(4, ..., 1, MSG_OOB) = 1
+   +0 > PU. 5001:5002(1) ack 1 urg 1
+
+// We could disable GSO at the start of the script, but then the PSH flag on
+// the 5 initial server segments is not deterministic and hard to match. Keep
+// TSO on for the initial send (one super-skb, stable PSH) and disable it only
+// here, so software GSO splits the retransmit and each segment's urg_ptr is
+// checked on the wire.
+   +0 `ethtool -K tun0 tso off gso off gro off lro off 2>/dev/null`
+
+// 4. SACKed blocks reach dupthresh -> fast retransmit of the 1:2001 hole.
+ +.05 < . 1:1(0) ack 1 win 320 <sack 2001:3001,nop,nop>
+   +0 < . 1:1(0) ack 1 win 320 <sack 2001:4001,nop,nop>
+   +0 < . 1:1(0) ack 1 win 320 <sack 2001:5002,nop,nop>
+
+// Retransmit must keep a per-segment urg_ptr (5002 - seg.seq): seg A 5001,
+// seg B 4001. The fix sends the hole as two independent skbs, so seg B has
+// no PSH. Unpatched it goes out as one super-skb whose GSO split copies
+// urg_ptr onto seg B and also adds PSH there, so on an unpatched kernel the
+// mismatch shows up on the PSH bit before the urg_ptr.
+   +0 > U. 1:1001(1000) ack 1 urg 5001
+   +0 > U. 1001:2001(1000) ack 1 urg 4001
+
+  +.1 < . 1:1(0) ack 5002 win 320
-- 
2.43.0


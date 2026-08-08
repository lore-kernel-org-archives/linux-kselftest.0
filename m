Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE225DB12
	for <linux-kselftest@vger.kernel.org>; Sat,  8 Aug 2026 00:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786149938; cv=none; b=KjOK8hFTzz6okVP7VW55rshW6j+MCIVDpRNN0rSsTIDsbPJgU6VT8ceosi8uk+ToS+mSEJjvO9rxo9H2rrq3VuNBxnnncLE/aMPFvoa4Rj3B2xmTJ8KxfqC/bX3vpOGhxVSKgzwHpm1z3MbCz1ZDaRq8DW4Q6q+WttQMP4oFCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786149938; c=relaxed/simple;
	bh=6JFBwKELq3p91i047wCFcWOzA7D3+fIddhPNrrRCJpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWLyJyTGXhGWhfUMqHyZqjBiW71qsp4iyEDtzTUp+HRj+iS8L/rC1Mml8ypCjJRKzdT/jgF1/xSs7nPzOHksQUl+7rizSV/FVgp8OjHfjPW8Z3+hDYGsrNsQeGQOoMDD0AO0NoPtIKwdQ+7/SbcvnEM2g7BevLgAB55ZxSVTXjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUCwBUsj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUCwBUsj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-473987fc217so1142f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 17:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786149935; x=1786754735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fg4AnZi8xDl8kdhFdooCBfQePGOhkn+qz5uVYdeQjC0=;
        b=NUCwBUsj0mrnH2V60y1Oo6jMAEG+a8tGumDbAH2Tzq+tOrNNHRYIpPUIQsm8dAiSYG
         O+KudUMUxGBw5O3YJ8f58WLRt2A1ZzYMKKDiVugesDZpN4PELQCv15SDn0L6mOgT6jMx
         mKHwoa960kYeZwqVBau0zZg+eshQGE0+nB5eblT8yGtHbyObDK5/QnuncAfKwtjliDK2
         s9J6C3Bxu0xBYP9I3RWwjhZ0Mcx9tPv4lU2y5cEQwIex283DKRV2Hz0Tzm0RQfz2/y7E
         LYMH1e8zGboir0SVIF1Zf51qERscDHhBWqQO4GDc05mPpTb1p6jE44L3lNOrrQxstlOX
         GVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786149935; x=1786754735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fg4AnZi8xDl8kdhFdooCBfQePGOhkn+qz5uVYdeQjC0=;
        b=nrRcKA79IwT5i26MKsCqvRZnPTJIppJL6w6o9s6MuDTdZXaj5ekorJER+eEBrJNmEK
         WCCbVJHqzSt0nnISXS5111bRSvWAdXqLypUcZRZxQnGfWtLGgREZmhzIVt8ByzC6RurA
         CRk2NXHEUWrIGMsGY4zZkRlMPdEscKqNZ4VJFPZgf61GUrzUYfovQ9T9gu5ODDoNASEu
         Yx3tvOl5SEx9BE8EM4xVXl0W9mp3rQse43H4xmgVqSwLOS7Ybns/jlY3rOWIN6Zk8cKG
         NWnha1RFygcjPOrC5F3Flik2hhqRxtz5mIWctGa+Sd3u3YwndpPryG8V8bJ1TJz9/Xf2
         BptA==
X-Forwarded-Encrypted: i=1; AHgh+RpS3FbLKjVmuO2BKMgBr/sFVRmnxayr9IInalSV2vm8kIYuIAPfW0z9srdw9O2pH/kcdu1LoE889c2c+t1rzSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkyEF1tPamkUbnz8a5JJyuPjRsM0uBa9gSkQIoSrgHonsWLne
	sGPemTYlRRR6XaBYKA5iStmN/WbEIx7Y9lMwW1HqvWcndP9Ue47lEANu
X-Gm-Gg: AR+sD11nPtRXyCjBrZ7jGOQ22hUsasA/nhXKuMGiyzXnGifqFhzApKcx2JK+LBCDbbL
	6tPxUUQ5t4B1wP1Sq+H6h58hbxfyQFkGlCnyb3SoNF1771LbtivnXZ1aLKJPsmO6q/wFma10V1+
	nR0sfjwQy44wgf1iTCyUV7C5eYeQ/+ismutk7wQmzYCVyOIkQAe/1Ud0g7/A+r2Ssakkuj1hSbQ
	A+3FSbs7ZdtcB6Ldl8mZE8xHjWJabnGoo82gg5Iv2Juou4zaVkGBmymcTjdtYdxfg5Un1BY3+z0
	zWwvJGEtLce198O8X2QMy5lXoRJGzIH7tKorBoKhUSxq9UG5g2DdXRTuQPWI8SoSEv1odk75DM1
	myeVzZUj5tJy1iyk9Z/7oWUHPpTIRc8uyV8J2lHenzlGff4cOKxFz0tqECN1SQ50vkUkRgf61hj
	VQQ+gm0pAGUJ0FJNmUv502ip+Jm8rk54PRLcdVpTdk6JPDbcdOgKWMpIkGqpxRQP83AdVRm9ZEu
	1sLZnLQxa7B1lf+1GMwNJ2NU/4qxGX/2n8ndZ9D9AMOgOj/XdDH2j+rkNOGzdkL8amfQ73/vYAU
	cbqx1Sf2vOU9+Aphy0ha2gk=
X-Received: by 2002:a5d:5f56:0:b0:47f:7a7e:ffe4 with SMTP id ffacd0b85a97d-47fec487579mr22494044f8f.0.1786149934430;
        Fri, 07 Aug 2026 17:45:34 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-201-133.77.179.pool.telefonica.de. [77.179.201.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220aa83sm8848170f8f.36.2026.08.07.17.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:45:33 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: edumazet@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	lukma@denx.de,
	m-karicheri2@ti.com,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	ali@iusegentoo.com,
	qingfang.deng@linux.dev,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v3 3/3] selftests: net: hsr: add shared-mutation regression test
Date: Sat,  8 Aug 2026 02:45:24 +0200
Message-ID: <20260808004525.1551-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260808004525.1551-1-xiexinet@gmail.com>
References: <20260808004525.1551-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add regression coverage for both shared-data corruptions. Delay one
PRP egress and verify that queued clones retain their LAN IDs. For HSR
RedBox, deliver a tagged multicast to the master and interlink and
verify each source address.

Drain captures while injecting and merge both subtest results so
packet-socket pressure or a skip cannot hide a failure.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_shared_mutation.sh  | 242 ++++++++++++++++++
 2 files changed, 243 insertions(+)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_shared_mutation.sh

diff --git a/tools/testing/selftests/net/hsr/Makefile b/tools/testing/selftests/net/hsr/Makefile
index 31fb9326cf53..87fe34951b8b 100644
--- a/tools/testing/selftests/net/hsr/Makefile
+++ b/tools/testing/selftests/net/hsr/Makefile
@@ -5,6 +5,7 @@ top_srcdir = ../../../../..
 TEST_PROGS := \
 	hsr_ping.sh \
 	hsr_redbox.sh \
+	hsr_shared_mutation.sh \
 	link_faults.sh \
 	prp_ping.sh \
 # end of TEST_PROGS
diff --git a/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh b/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh
new file mode 100755
index 000000000000..0b8b8791190d
--- /dev/null
+++ b/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh
@@ -0,0 +1,242 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Verify that per-egress mutations of shared skb data are private:
+#
+# F2 (path/LAN ID): on an affected kernel the second slave's LAN-ID write
+# lands in the first slave's still-queued clone; with a netem delay on
+# slave A, injected frames leave A carrying B's LAN ID.
+#
+# F1 (RedBox source MAC): on an affected kernel an HSR-tagged multicast
+# frame received on a RedBox slave is cloned for master and interlink,
+# and the interlink's RedBox-MAC rewrite lands in the master clone's
+# buffer, so the local stack receives the RedBox MAC instead of the
+# originating node's MAC.
+
+ipv6=false
+
+source ./hsr_common.sh
+
+DUR=5
+
+require()
+{
+	command -v "$1" >/dev/null 2>&1 && return 0
+	echo "SKIP: $1 not available"
+	exit $ksft_skip
+}
+
+require ip
+require tc
+require python3
+
+trap cleanup_all_ns EXIT
+
+# ------------------------------------------------------- F2: LAN-ID isolation
+# PRP DANP (proto 1), AF_PACKET pre-tagged injection, netem on slave A.
+run_f2()
+{
+	setup_ns ns 2>/dev/null || return $ksft_skip
+	nsx() { ip netns exec "$ns" "$@"; }
+
+	# Probe sch_netem inside the disposable namespace only.
+	if ! nsx tc qdisc add dev lo root netem delay 1ms 2>/dev/null; then
+		echo "SKIP: sch_netem not available"
+		return $ksft_skip
+	fi
+	nsx tc qdisc del dev lo root 2>/dev/null
+
+	# Capability probes end here; setup or runtime failure below is FAIL.
+	nsx ip link add vA type veth peer name vAp ||
+		{ echo "FAIL: veth A"; return 1; }
+	nsx ip link add vB type veth peer name vBp ||
+		{ echo "FAIL: veth B"; return 1; }
+	for i in vA vB vAp vBp; do
+		nsx ip link set "$i" up || { echo "FAIL: $i up"; return 1; }
+	done
+	if ! nsx ip link add name prp0 type hsr slave1 vA slave2 vB \
+		supervision 45 proto 1 2>/dev/null; then
+		echo "SKIP: HSR/PRP not supported by this kernel"
+		return $ksft_skip
+	fi
+	nsx ip link set prp0 up || { echo "FAIL: prp0 up"; return 1; }
+	nsx tc qdisc add dev vA root netem delay 200ms ||
+		{ echo "FAIL: netem"; return 1; }
+
+	nsx python3 /dev/stdin "$DUR" <<'PYF2'
+import socket, struct, select, sys, time
+
+dur = int(sys.argv[1])
+def lanid(pkt):
+    if len(pkt) < 20 or pkt[-2:] != b"\x88\xfb":
+        return None
+    return (pkt[-4] >> 4) & 0xF
+
+SRC = bytes.fromhex(open("/sys/class/net/prp0/address").read().replace(":", ""))
+DST = bytes.fromhex("02aabbccdd01")
+PAY = bytes(range(46))
+rct0 = struct.pack(">H", 0) + struct.pack(">H", 52 & 0x0FFF) + b"\x88\xfb"
+frame = DST + SRC + b"\x08\x00" + PAY + rct0
+
+tx = socket.socket(socket.AF_PACKET, socket.SOCK_RAW); tx.bind(("prp0", 0))
+sA = socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
+        socket.ntohs(0x0003))
+sA.bind(("vAp", 0))
+sB = socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
+        socket.ntohs(0x0003))
+sB.bind(("vBp", 0))
+sA.setblocking(False); sB.setblocking(False)
+
+a, b = [], []
+
+def match(pkt):
+    return (pkt[:6] == DST and pkt[6:12] == SRC
+            and pkt[12:14] == b"\x08\x00" and pkt[14:14 + len(PAY)] == PAY)
+
+def drain(timeout):
+    wait = timeout
+    while True:
+        r, _, _ = select.select([sA, sB], [], [], wait)
+        if not r:
+            return
+        for s in r:
+            pkt = s.recv(65535)
+            if not match(pkt):
+                continue
+            lid = lanid(pkt)
+            if lid is not None:
+                (a if s is sA else b).append(lid)
+        wait = 0
+
+# Drain while sending so the burst cannot overflow the capture sockets'
+# receive buffers; the netem-delayed A-side frames arrive afterwards and
+# are collected below.
+for _ in range(200):
+    tx.send(frame)
+    drain(0)
+    time.sleep(0.001)
+
+end = time.time() + dur
+while time.time() < end:
+    drain(0.3)
+
+print("A-side count=%d lan ids=%s" % (len(a), sorted(set(a))))
+print("B-side count=%d lan ids=%s" % (len(b), sorted(set(b))))
+if len(a) < 150 or len(b) < 150:
+    print("FAIL: too few injected frames captured (A=%d B=%d, sent 200)"
+          % (len(a), len(b)))
+    sys.exit(1)
+bad_a = [x for x in a if (x & 1) != 0]
+bad_b = [x for x in b if (x & 1) != 1]
+if bad_a or bad_b:
+    print("FAIL: shared-mutation corruption - A: %d/%d wrong-lan,"
+          " B: %d/%d wrong-lan"
+          % (len(bad_a), len(a), len(bad_b), len(b)))
+    sys.exit(1)
+print("PASS: per-egress LAN IDs isolated (A all bit0=0, B all bit0=1)")
+sys.exit(0)
+PYF2
+}
+
+# --------------------------------------------- F1: RedBox source-MAC privacy
+# HSR RedBox (proto 0), tagged multicast from a slave: master must keep
+# the node MAC, interlink must carry the RedBox MAC.
+run_f1()
+{
+	setup_ns ns 2>/dev/null || return $ksft_skip
+	nsx() { ip netns exec "$ns" "$@"; }
+
+	nsx ip link add vA type veth peer name vAp ||
+		{ echo "FAIL: veth A"; return 1; }
+	nsx ip link add vB type veth peer name vBp ||
+		{ echo "FAIL: veth B"; return 1; }
+	nsx ip link add vI type veth peer name vIp ||
+		{ echo "FAIL: veth I"; return 1; }
+	for i in vA vB vI vAp vBp vIp; do
+		nsx ip link set "$i" up || { echo "FAIL: $i up"; return 1; }
+	done
+	if ! nsx ip link add name hsr0 type hsr slave1 vA slave2 vB \
+		interlink vI supervision 45 proto 0 2>/dev/null; then
+		echo "SKIP: HSR RedBox not supported by this kernel"
+		return $ksft_skip
+	fi
+	nsx ip link set hsr0 up || { echo "FAIL: hsr0 up"; return 1; }
+
+	nsx python3 /dev/stdin <<'PYF1'
+import socket, select, sys, time
+
+NODE  = bytes.fromhex("021122334455")
+MCAST = bytes.fromhex("01005e000001")
+RB    = bytes.fromhex(open("/sys/class/net/vI/address").read().replace(":", ""))
+PAY   = bytes(range(46))
+
+def frame(seq):
+    # LSDU size = payload + HSR tag (HSR_HLEN), as hsr_fill_tag() computes it
+    tag = (((1 << 12) | (len(PAY) + 6)).to_bytes(2, "big")
+           + seq.to_bytes(2, "big") + b"\x08\x00")
+    return MCAST + NODE + b"\x89\x2f" + tag + PAY
+
+tx = socket.socket(socket.AF_PACKET, socket.SOCK_RAW); tx.bind(("vAp", 0))
+sm = socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
+        socket.ntohs(0x0003))
+sm.bind(("hsr0", 0))
+si = socket.socket(socket.AF_PACKET, socket.SOCK_RAW,
+        socket.ntohs(0x0003))
+si.bind(("vIp", 0))
+sm.setblocking(False); si.setblocking(False)
+
+for i in range(3):
+    tx.send(frame(i + 1)); time.sleep(0.05)
+
+m_src = i_src = None
+end = time.time() + 4
+while time.time() < end and (m_src is None or i_src is None):
+    r, _, _ = select.select([sm, si], [], [], 0.3)
+    for s in r:
+        pkt = s.recv(65535)
+        # exact flow: dst, post-strip EtherType, exact payload, min length;
+        # h_source is the asserted value and must NOT be filtered on
+        if (len(pkt) < 60 or pkt[:6] != MCAST or pkt[12:14] != b"\x08\x00"
+                or pkt[14:14 + len(PAY)] != PAY):
+            continue
+        if s is sm and m_src is None:
+            m_src = pkt[6:12]
+        elif s is si and i_src is None:
+            i_src = pkt[6:12]
+
+print("master h_source    =", m_src.hex() if m_src else None)
+print("node MAC           =", NODE.hex())
+print("interlink h_source =", i_src.hex() if i_src else None)
+print("redbox MAC         =", RB.hex())
+if i_src != RB:
+    print("FAIL: interlink did not carry the RedBox MAC")
+    sys.exit(1)
+if m_src != NODE:
+    print("FAIL: master received %s instead of the node MAC "
+          "(shared-mutation corruption)"
+          % (m_src.hex() if m_src else "nothing"))
+    sys.exit(1)
+print("PASS: master kept node MAC, interlink kept RedBox MAC")
+sys.exit(0)
+PYF1
+}
+
+rc=0
+
+run_f2
+ret=$?
+rc=$(ksft_status_merge "$rc" "$ret")
+
+run_f1
+ret=$?
+rc=$(ksft_status_merge "$rc" "$ret")
+
+if [ "$rc" -eq 0 ]; then
+	echo "hsr_shared_mutation: per-egress mutation isolation (F1+F2) [ OK ]"
+elif [ "$rc" -eq "$ksft_skip" ]; then
+	echo "hsr_shared_mutation: subtests skipped (capabilities missing)"
+else
+	echo "hsr_shared_mutation: per-egress mutation isolation [ FAIL ]" \
+		"rc=$rc" 1>&2
+fi
+exit "$rc"
-- 
2.43.0


Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3AB3358C6
	for <linux-kselftest@vger.kernel.org>; Sun,  2 Aug 2026 20:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702316; cv=none; b=hWuOo/9xWI9UOISppPy3srHN19+KC7v7r83YgFe3suoosAACuUo55ewaBlu+eaNFfzSRX8sjz9GFMn8k/A7Zku7Z9j3dyGfwQjXE9mTDYKSwB/zZDT9r4/doQ7zi1hNc68ZD+K0l2yreeHxs9D4NasszlaM1efrSabXJ8sEzHOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702316; c=relaxed/simple;
	bh=O/cXKE8PHdSrPY6i7GHMHM3AUs0ttUIK7gFNtkMg3mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uU9efxXHhFlk5jII0RiQmHjXBN3T5qQXe4cIdI2Ft79YQjvgTzVREAsb8P1H5HsXzBQZIta6FK08LgT1WnB5YAv4aqFX07xyNsOXuHNR1YBPHFQRepsZBM/BDAW/SSDKR9xyfKkv1qK4cbQ9bdlSl0crfWzi5XeFN6LpGHxdiDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmLFRpFK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmLFRpFK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso2127725e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 02 Aug 2026 13:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702313; x=1786307113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGIqErHPfB/RtDVIqAJwDBitW5ofpgcLasPKai/zuNU=;
        b=qmLFRpFKW/8rD4vvrfwDLdZJX2rnALAzLgOwuPlDAVkRXwoIU1tdoMnLYGNR2hE5x3
         2SRi9IO+IG47U66z54PKX4tHw2DMWnV6LIaZ4xurebjlU+MDCJ5HnBb/mzq/qHqiITfB
         MGfSvDCJH/whF9Gh/LlzyeBeO5tba++Q5PEQgDTp0GOVWM5jrqS8sLUXLLVn06a9JV5T
         HhEPoSKn9ryTYb+qkgsT6hORSzQTcBKlsxcdohk1D3cSZioDMXX1iCw1pJjckJaDMOHO
         t0nul7dywT67fOyZjr+MexorBiFkXHD4egrf6a/2R03r4BvqfmjQmGMrx8Y8J9Vl4XWy
         ckGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702313; x=1786307113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGIqErHPfB/RtDVIqAJwDBitW5ofpgcLasPKai/zuNU=;
        b=lwbKlHwu0v54apudNvl0LRSpVQ1SNqCvkgt7Cu4vF2YlEhdEedPONjNHFp7GX6UNV3
         mPXjD49SFCS2Q9GrNRvYR+lwsfIiAqVkoEl8cmLO4f5KBm1AEkrpQKqpPvDARLGSzc4O
         ETzVrGOe1RiecHiTMLgzUqWtWO0CPqpLP7IyX0j+6L6r1UsEEsaTAwxnGXZ+Eb9fOdMH
         Y1aX0EeChBFFjZsjMIL7w3D4lEKDM8gHHj1dXZbaXmnXtJ4ovliUYEiLOppnHWZDrGxQ
         3dY7vWcj1uQX5V7lg0CSRt5O0AIirne55dEh+0kJZZk9O9s9CHw/ADw5cleupvmAr2Wx
         A6HA==
X-Forwarded-Encrypted: i=1; AHgh+RqB1iOkEA0Za+97M1m0EloMGs2u24skX35xWPSIXpgDBRio+PBpvZZwWN59wUdrEGq2pEfjqw1vsLNkM6ee3ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvJXVPxU55lg0lA5bpIt+HcjSunZnWIgKaiJc3mBjCqCqewjgG
	Ne7oHaUUGdn0Ch5PKI66hYMfOWrpo1AJghS9tR4r/BQ0BgVydJweulq7
X-Gm-Gg: AR+sD12DdSxc0cy/eurvnyVklwVdXsXzaTw11z0I0cnr76nCSHi7mQB5akBdSf3ZIjw
	0uzGFnVdN2BP8CzHABMGo8tijwUwba8jPg6OD49AAYvHCndUdiZwF+rg6bMX2trIef7OqRaOvCb
	ZAzUSLaxeXinZiCODhQ3OJ1Ysq2AtJvdlrKOCPCOBUY3kQfBF+mw7JIhNAkPblJvJG9tsH82MwW
	oThiJh3z/c54kmRPh02VeqIcrfNs17Bwpr9LZkfBIkUvLKHtB72wtkj4jW08Fj/J3ayhrbTfLuA
	e8TMBc2lwGc9Us2Vr1xBGFYcR0bFIXiN5/23hGK4C4usgt4PfZ1y7KfOZYI5082MHPndI1ETI42
	UnS8n1u+luW3g/8MdmV839qqlrAaupUfCx1uPASzmIOW+f+1sVlQOVewJd8l6HMOCI3MhgUtXPH
	5FKfIZbF/5BjwVRsVkD7uC8NsiTj8+E9mohv3GvIdvBQfgVt/+T/1i66mVsEhB67ApZX2lpj5oo
	G+sFlDe5t1/STPPjfGGqK6qmQD109shvLZ0NKh/SXBC2yagGvKfgY0GFwKf1YAFyBuLfC0LfsoK
	DjfwLaMCL5iIoMKHkGSI9Q==
X-Received: by 2002:a05:600c:5252:b0:493:f42e:1b3f with SMTP id 5b1f17b1804b1-4980c6a4284mr78781005e9.3.1785702312505;
        Sun, 02 Aug 2026 13:25:12 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-078-051-143-142.78.51.pool.telefonica.de. [78.51.143.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b23f6fsm132234365e9.0.2026.08.02.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:25:11 -0700 (PDT)
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
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net v2 3/3] selftests: net: hsr: add shared-mutation regression test
Date: Sun,  2 Aug 2026 22:25:04 +0200
Message-ID: <20260802202504.2962-4-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802202504.2962-1-xiexinet@gmail.com>
References: <20260802202504.2962-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover both shared-skb mutation classes with one test. The PRP LAN-ID
case injects 200 pre-tagged frames on the master with one slave
egress delayed by netem and selects exactly the injected flow: on an
affected kernel all 200 frames leave slave A with slave B LAN ID
(FAIL); with the helpers privatizing clone data before the ID update
both sides stay isolated (PASS). The HSR RedBox source-MAC case
injects a tagged multicast data frame on a slave of an HSR RedBox:
on an affected kernel the local stack receives the RedBox MAC
instead of the originating node MAC (FAIL); with the interlink-bound
skb privatized before the rewrite, the master keeps the node MAC and
the interlink keeps the RedBox MAC (PASS).

Capture filters select destination, post-strip EtherType, and the
exact payload while leaving the asserted source MAC unfiltered.
Capability probes (tc, python3, sch_netem, HSR/PRP support) exit
ksft_skip and that status is propagated; real failures exit 1.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 tools/testing/selftests/net/hsr/Makefile      |   1 +
 .../selftests/net/hsr/hsr_shared_mutation.sh  | 223 ++++++++++++++++++
 2 files changed, 224 insertions(+)
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
index 000000000000..05e7e803d286
--- /dev/null
+++ b/tools/testing/selftests/net/hsr/hsr_shared_mutation.sh
@@ -0,0 +1,223 @@
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
+for _ in range(200):
+    tx.send(frame); time.sleep(0.001)
+
+a, b = [], []
+end = time.time() + dur
+while time.time() < end:
+    r, _, _ = select.select([sA, sB], [], [], 0.3)
+    for s in r:
+        pkt = s.recv(65535)
+        if (pkt[:6] != DST or pkt[6:12] != SRC or pkt[12:14] != b"\x08\x00"
+                or pkt[14:14 + len(PAY)] != PAY):
+            continue
+        lid = lanid(pkt)
+        if lid is not None:
+            (a if s is sA else b).append(lid)
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
+    tag = (((1 << 12) | len(PAY)).to_bytes(2, "big")
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
+[ "$ret" -eq "$ksft_skip" ] && exit "$ksft_skip"
+[ "$ret" -eq 0 ] || rc=1
+
+run_f1
+ret=$?
+[ "$ret" -eq "$ksft_skip" ] && exit "$ksft_skip"
+[ "$ret" -eq 0 ] || rc=1
+
+if [ $rc -eq 0 ]; then
+	echo "hsr_shared_mutation: per-egress mutation isolation (F1+F2) [ OK ]"
+else
+	echo "hsr_shared_mutation: per-egress mutation isolation [ FAIL ]" \
+		"rc=$rc" 1>&2
+fi
+exit $rc
-- 
2.43.0


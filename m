Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB8372EDD
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345301; cv=none; b=GSDJMV+1vo5Y55QYjN+MIgtGn7H6FSprgpiJkgU81T/PzFbuxXmVszD9sch2g2A/hSzXvDj19b67KcZDCjcizjAWvoJku/6TH0RVg33/KFSL0Sn8HuGpMvyQmunW9lxuy+R9jwgX+rsNuLEdDFvS+WuNVgTV6cOvQ6jntDV+6mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345301; c=relaxed/simple;
	bh=DRtLKy9hSRbiduyc8T8lDu7DfaVWZtv/y3EUQIkVDZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVFPcAiYG+H7ajauALv91a7oXpYXyrMUdGF4Fd06wsPTO4NFplY0w9BJ9oMijKJDNFmMpugJjsQFOUIl75iyxu7+0CPcRMXQPbOxkZ/KEUxaDhHeIR64IM/LokTqq7cuA8v8NtV/t/zAPioitfHi6r8KSecVWEb5W6oGKtEABhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krqrsr99; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krqrsr99"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47af300b76bso75111f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 06:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345297; x=1783950097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3TQr2UZ7sWfwT8FupSSWzYmOIQH+++i/Bc0sXLTyLk=;
        b=krqrsr99S6n/JTiGgdSor0uSb6BASNSkYNCCmZNihpnJ+w6JaEzN9a3t9uN7P1ZypG
         CxwGTp+B7mdl2MJWmHmwCuL0pa57mER/QOwLhMhhi1r0YEzFPmqc4KlHOWcmwElmyLIc
         bO/LqTs4MwlkcUHeaWPmc8V2B2Bwn3uUiGcgr91VeMCUVltjLC0T/Ax8ZD75mRlvmVyQ
         /qb49JFwepJfjbGULqapiE861mpuwf0KGFbqL2KiDgzCB+3WbIp4hBF4EQXfCJM3IBBY
         NZYB1oi19q4uyHEl3dEQkbwbaq8sNL8nb7qon34rgPNl8sGJMWMTroIJrkkfg+IHIHbJ
         qDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345297; x=1783950097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x3TQr2UZ7sWfwT8FupSSWzYmOIQH+++i/Bc0sXLTyLk=;
        b=cYb+jVLtAX/0XdgPdvJX5jNLsyrWGHkTHAH0mFoNFTrksrJIdDpsf5JBhIHZWiNkX9
         YPbTUV/mqoGnxM5sxnp8Yt89P1+EyLmfSiZ/EjW0ALf/JhLm9rG1xkXu8V5seAWGDOs6
         xv7pd+cFlngR+/zEqUivZvEZtquwRkgcJPcCA+75hSiZu+MrZtNoSoT+qJJkWyYfd0w2
         7778aAyUmlWSY/0vUtzel9PTAS0ZEk87uzU6zjMYN3Infq0u6UimKtdfGU8DFOo8XQ8x
         n3DlTbWhDARAg0PQ/VV4cHeTH/90wlaldD+diqRfMbGkBowGsS3EvlU1EqYNqvYWFcxQ
         4rZw==
X-Forwarded-Encrypted: i=1; AHgh+RrH36tvhOxdMGzm3iqpBgq4jR8d41Mw9bS9/8J45dC9/Idj0v6xj9hRD+ieSYZMNo+GXvMUr37+8q3Ih8E4L7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUc2QqThyIavBav1e7oPel2b7QbMqaxqGJjaGGNB3VJpnz2D9X
	5ioHrvZ3oQSBc6AuiYLCdaKZM4T4my7uK737lZvB5oHmhlwsZaQBZ3hI
X-Gm-Gg: AfdE7ckRmosZ7JpLawkU1VUh+lvV/rg0mX/Mhb6RxgmpKwO/hrLPtVu9YzkcnbkyRja
	yJNoLpY5tdMQr7DMO+P/UmERnitcF7rsc0LsLLAwatPakkwD5dmCinRER/naGxDM7T8yZj1nszX
	mO4K/8rTXIdfhCXFnATbvc0ohgLDQEQ8jIv8p9W0Fahzyz67dQCGoPNuYzHN4/jVX59YjEezqxp
	DC+VrQVBcVYuofeh4JgOnPr8RjNLy57YSILXKZYd9rGnVtjuSE+hQrPOvS7hh5w9UHwztZ+ZUn/
	UEme0+Xl+ELn7ue0ufQkf+pRqafDBvG8Ezx9eH+RVCuDYN6lscPJjTarqDOWRUmT3A7UvSAgKzL
	XqGPLTDfyEN0F5n5J7KLW8E1/v8rDqmPWe2tBFT/On8268KHiVqwolN3Oclh+tV+qJrmo7iXGB1
	sJgk8G+d1hPpbwXSX7IfaxarNGsDRSmad1s8tiwhlXbCvOGv27oyR/To/QeubXu9E6DfTYzaix3
	6szVvaQGGP4tV+//LtLyw06Gl929l+RfTID/uhPlE8iGyg0FTU=
X-Received: by 2002:a05:6000:61e:b0:461:a159:4a74 with SMTP id ffacd0b85a97d-47aaadc9bd3mr6779053f8f.1.1783345296841;
        Mon, 06 Jul 2026 06:41:36 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5b6d-48fc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5b6d:48fc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm23960881f8f.23.2026.07.06.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:41:36 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Felix Maurer <fmaurer@redhat.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v2 4/4] selftests: net: hsr: add PRP RedBox test
Date: Mon,  6 Jul 2026 13:41:31 +0000
Message-ID: <20260706134131.61659-5-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706134131.61659-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
 <20260706134131.61659-1-xiexinet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kselftest that builds a PRP RedBox (interlink) with a SAN behind the
interlink and a peer DANP, and checks bidirectional unicast across the
interlink, preservation of the SAN source MAC on the PRP network, and that
the proxy-announce supervision frame carries the RedBox-MAC TLV (Type 30)
terminated by an EOT marker. It reuses the hsr_common.sh / lib.sh helpers
and skips cleanly on a kernel or iproute2 without PRP interlink support.

The background ping is killed by its exact PID: ip netns exec does not
isolate the PID namespace, so a pattern-based pkill could hit unrelated
processes on the host.

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 tools/testing/selftests/net/hsr/Makefile      |  1 +
 .../selftests/net/hsr/hsr_prp_redbox.sh       | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_prp_redbox.sh

diff --git a/tools/testing/selftests/net/hsr/Makefile b/tools/testing/selftests/net/hsr/Makefile
index 31fb9326c..2150e487a 100644
--- a/tools/testing/selftests/net/hsr/Makefile
+++ b/tools/testing/selftests/net/hsr/Makefile
@@ -4,6 +4,7 @@ top_srcdir = ../../../../..
 
 TEST_PROGS := \
 	hsr_ping.sh \
+	hsr_prp_redbox.sh \
 	hsr_redbox.sh \
 	link_faults.sh \
 	prp_ping.sh \
diff --git a/tools/testing/selftests/net/hsr/hsr_prp_redbox.sh b/tools/testing/selftests/net/hsr/hsr_prp_redbox.sh
new file mode 100755
index 000000000..479c89222
--- /dev/null
+++ b/tools/testing/selftests/net/hsr/hsr_prp_redbox.sh
@@ -0,0 +1,99 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test a PRP RedBox (PRP-SAN): a SAN that sits behind the interlink port must
+# reach, and be reached by, a peer DANP on the PRP network with its own MAC
+# preserved on the wire, and the RedBox must announce the SAN with a RedBox-MAC
+# TLV (terminated by an EOT marker) in its PRP supervision frames.
+#
+#   RB    PRP RedBox: prp0 over rb_a/rb_b (LAN A/B) + interlink rb_il
+#   PEER  peer DANP : prp0 over pe_a/pe_b, 100.64.0.2
+#   SAN   SAN       : san_il, own MAC, 100.64.0.51 (behind the interlink)
+
+ipv6=false
+
+source ./hsr_common.sh
+
+check_prerequisites
+
+if ! command -v tcpdump >/dev/null 2>&1; then
+	echo "SKIP: This test requires tcpdump"
+	exit $ksft_skip
+fi
+
+if ! ip link help hsr 2>&1 | grep -q interlink; then
+	echo "SKIP: iproute2 too old (no hsr interlink support)"
+	exit $ksft_skip
+fi
+
+setup_ns RB PEER SAN
+trap 'cleanup_ns "$RB" "$PEER" "$SAN"' EXIT
+
+ip link add rb_a netns "$RB" type veth peer name pe_a netns "$PEER"
+ip link add rb_b netns "$RB" type veth peer name pe_b netns "$PEER"
+ip link add rb_il netns "$RB" type veth peer name san_il netns "$SAN"
+
+ip -n "$RB"   link set rb_a up
+ip -n "$RB"   link set rb_b up
+ip -n "$RB"   link set rb_il up
+ip -n "$PEER" link set pe_a up
+ip -n "$PEER" link set pe_b up
+ip -n "$SAN"  link set san_il up
+ip -n "$SAN"  addr add 100.64.0.51/24 dev san_il
+
+# Feature gate: PRP interlink (RedBox) creation. A kernel without PRP RedBox
+# support rejects this with -EINVAL, so SKIP rather than FAIL.
+if ! ip -n "$RB" link add name prp0 type hsr slave1 rb_a slave2 rb_b \
+     interlink rb_il proto 1 2>/dev/null; then
+	echo "SKIP: kernel without PRP RedBox (interlink) support"
+	exit $ksft_skip
+fi
+ip -n "$RB"   link set prp0 up
+ip -n "$PEER" link add name prp0 type hsr slave1 pe_a slave2 pe_b proto 1
+ip -n "$PEER" link set prp0 up
+ip -n "$PEER" addr add 100.64.0.2/24 dev prp0
+sleep 1
+
+san_mac=$(ip -n "$SAN" -br link show san_il | awk '{print $3}')
+rb_mac=$(ip -n "$RB" -br link show rb_il | awk '{print $3}')
+
+# Bidirectional unicast across the interlink.
+do_ping "$PEER" 100.64.0.51
+do_ping "$SAN"  100.64.0.2
+stop_if_error "PRP RedBox bidirectional unicast failed"
+
+# The SAN source MAC must be preserved on the PRP network, not laundered to the
+# RedBox MAC: the peer resolves the SAN IP to the SAN's own MAC.
+neigh=$(ip -n "$PEER" neigh show 100.64.0.51 | awk '{print $5}')
+if [ "$neigh" != "$san_mac" ]; then
+	echo "SAN MAC preservation [ FAIL ]: peer resolved 100.64.0.51 to" \
+	     "'$neigh', expected $san_mac" 1>&2
+	ret=1
+fi
+stop_if_error "SAN MAC not preserved on the PRP network"
+
+# The proxy-announce supervision frame must carry, in order, the life-check TLV
+# (type 0x14, len 6) + MacAddressA == SAN MAC + the RedBox-MAC TLV (type 0x1e,
+# len 6) + MacAddressRedBox == RedBox MAC + the EOT marker (0x0000).
+ip netns exec "$SAN" ping -i 0.2 -q 100.64.0.2 >/dev/null 2>&1 &
+ping_pid=$!
+cap=$(ip netns exec "$PEER" timeout 5 tcpdump -i pe_a -nn -x \
+	"ether proto 0x88fb and ether src $rb_mac" 2>/dev/null || true)
+kill "$ping_pid" 2>/dev/null || true
+wait "$ping_pid" 2>/dev/null || true
+
+san_hex=$(echo "$san_mac" | tr -d ':')
+rb_hex=$(echo "$rb_mac" | tr -d ':')
+# Reassemble contiguous frame hex: drop the "0x0010:" offset labels and spaces.
+frame_hex=$(echo "$cap" | awk '/^[[:space:]]*0x[0-9a-f]+:/ {
+	sub(/^[[:space:]]*0x[0-9a-f]+:[[:space:]]*/, "");
+	gsub(/ /, ""); printf "%s", $0 }')
+if ! echo "$frame_hex" | grep -q "1406${san_hex}1e06${rb_hex}0000"; then
+	echo "supervision RedBox-MAC TLV [ FAIL ]: missing SAN MAC, Type-30" \
+	     "payload, or EOT" 1>&2
+	ret=1
+fi
+stop_if_error "PRP RedBox supervision RedBox-MAC TLV/EOT check failed"
+
+echo "INFO: PRP RedBox (PRP-SAN) conformance checks passed"
+exit $ret
-- 
2.53.0


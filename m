Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001683CE489
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 23:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783208833; cv=none; b=iJaT4mu1+QNgjwWQzuKqoUO+gPzYT7dIn1EH6vfwCx3W7QsBoez0kIjxNEtomSzVBE3+ADjHIq4B4HunkiHgXyCwQV4f8S4gd0R0pC+ej3twJNj6cF1/m/RlaDKgzTitthg+AfEeTJymxTIWmmzLj2X5hUZKQZN6t8o/sxO7RLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783208833; c=relaxed/simple;
	bh=c6u0aohjqBU/Q3GU8GYQABiWMQYMkuGgLfxTtqQYFCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwjYyB9YFVAPRAFUlEluW6b3mOCCaR+JJxcBOXjKboffTdH/tsKheKhXcyElw9AgpBI5md4Ch0IknQgragdjlH68CUef2sLxfkn4mSOjXcMLPX3TG4mUZkSsAectkJmm35jsE6Jc52ZMnflMBb+5xpqilaB4rvgUekOkWAUnfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0y1SqKa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0y1SqKa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490d6730461so1559285e9.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 16:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783208829; x=1783813629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7c5Kd78tweAwuxL5AUHUB+mgEUmZOa8oNeXbCD1VdM=;
        b=f0y1SqKafxakni3dHmEzn5b6OBjkXrzGASUceL2GOLaBDShcj0DmjZ+QMiYasY0KBN
         iZuwVviXYiVJvlc6TcNOI7zzifRImnBhtTgbmQRZQw5DQaQBPHLJ5NM9b2nVpeEOZWSE
         AC4yx1mtAOtYcHADTSsWM5MgWZEZ5CQImTjurZ9YYQNtIpRigeIyo7UUr9j4hTVYfs62
         xUuv1MOMa/uIimZHcWlbgMk16XKPFX+mvXRA2n/WR5vUyOd9gBi8YH0R7Z91o8zEQ+HI
         Xs/bO/GI1LvrfyMki/DY34gu8cAVDHzj0IiEXL4nCaB/GUK0rwyl1yNlJyoTgGb6tLjY
         SW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783208829; x=1783813629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7c5Kd78tweAwuxL5AUHUB+mgEUmZOa8oNeXbCD1VdM=;
        b=XKgcG/4RVeAG9MCVplrZmVzYyXlv/YOs/fp5tea+Mrl0eXPeIL5eFrKGq0/1dlKu1v
         yyAQRDfCWrNkPg7hdRSOHkFotUKx7NIi+SdO2eJsTyT+hTLygpcVlSolDfTG2eSLbrzk
         vwh3FIYJiyXQjgLCpnH0b42QsqoAJiDs48QdcxaGljNRtfAXh1/kXnyF9Zs+qGEx+GAW
         o/Gm97nYz1/9dy/Jv8NjIVxfJcKlRTUl7VdMBCOk64Vt9FdDoZ9FvCSnMD/KUD4+GOtY
         tAGbvM7k7rRqNtPa7k5c0JJKwQCr6uvc9e6wI2Aai0ujZysQsJ35F6WlKFTaDvZrJKC7
         Rf9w==
X-Forwarded-Encrypted: i=1; AFNElJ+LvjLNCHAch3dTiD1iNHDH8AIzFWmIahCo4ko5nx3eMowanwpmDkx1XkOwjKdTd++/tYPnMhyKiDpoyeedL/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34ToEIEiSP+COo3zZ4/5ZISli178CbgklIY5nh9B6ByvPKJq7
	Jqp29tUPHY2rg1gfqmfpE2hNmsRfNOA0kdPuZKQxgyfuYDp3C+daKlqd
X-Gm-Gg: AfdE7clgxCWGWHq1BFT8GFmhQ6P9epWIPLDYryDGXt9f2K3NFrC/OSLZS3/69tug1n/
	Tuhk1bHKHg637Bhngh1TSg9yfsQmteZoXGGAxoxxQxW42WCwky0xNvXPc3Bjpz3EyxeX2dG0cEK
	vaCHe30PW+nCLLA56PVArAcge5c75Aow9xqilcCzAw5F9WLLEWlSVFIcLH1sI+3gkRxEmHP8twe
	Vj+zAWmSTAlA2WovxpHdQNwGGr4+b1eoUPIgsuS2U2RheYVwTf48WQ1vYq6OIMbDVQY00ByFENC
	MAJW3NlnW3UlWg9/i88S+1pp3fcjWMcYXNRKI6X+IJbOPMNhHXl9+NtP9c9pOzuHs6RvHXMllQw
	aTuk0eWRj8Moa5lI8IE/tXTYgSpWjlTx/c5hTWJxVk36zxPwK/3/Lqq9Jvv0a2B6w8x2fWy9pj9
	t8n+KbJOGU6oah/PIVenyE5IhFQHJwEBJnBDUU5JctAu+OCl62M5S/RmMWcnOr7eqrJHoHaY4fB
	b1vgD3Tc2bCJEyGAoBqcqXO+8655tp4eaBsrU2CtZVMd6XQ9o4=
X-Received: by 2002:a05:600c:3515:b0:493:c136:9655 with SMTP id 5b1f17b1804b1-493d0f3e78emr33455825e9.5.1783208829343;
        Sat, 04 Jul 2026 16:47:09 -0700 (PDT)
Received: from hpubt (dynamic-2a02-3100-5cf8-ddfc-6651-06ff-fed8-72a4.310.pool.telefonica.de. [2a02:3100:5cf8:ddfc:6651:6ff:fed8:72a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm216014125e9.10.2026.07.04.16.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 16:47:08 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next 4/4] selftests: net: hsr: add PRP RedBox test
Date: Sat,  4 Jul 2026 23:47:04 +0000
Message-ID: <20260704234704.4297-5-xiexinet@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704234704.4297-1-xiexinet@gmail.com>
References: <20260704234704.4297-1-xiexinet@gmail.com>
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

Signed-off-by: Xin Xie <xiexinet@gmail.com>
---
 tools/testing/selftests/net/hsr/Makefile      |  1 +
 .../selftests/net/hsr/hsr_prp_redbox.sh       | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
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
index 000000000..8ae36737b
--- /dev/null
+++ b/tools/testing/selftests/net/hsr/hsr_prp_redbox.sh
@@ -0,0 +1,96 @@
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
+( ip netns exec "$SAN" ping -i 0.2 -q 100.64.0.2 >/dev/null 2>&1 & )
+cap=$(ip netns exec "$PEER" timeout 5 tcpdump -i pe_a -nn -x \
+	"ether proto 0x88fb and ether src $rb_mac" 2>/dev/null || true)
+ip netns exec "$SAN" pkill -f "ping -i 0.2" 2>/dev/null || true
+
+san_hex=$(echo "$san_mac" | tr -d ':')
+rb_hex=$(echo "$rb_mac" | tr -d ':')
+# Reassemble contiguous frame hex: drop the "0x0010:" offset labels and spaces.
+frame_hex=$(echo "$cap" | awk '/^[[:space:]]*0x[0-9a-f]+:/ {
+	sub(/^[[:space:]]*0x[0-9a-f]+:[[:space:]]*/, ""); gsub(/ /, ""); printf "%s", $0 }')
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


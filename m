Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D439B484
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784319315; cv=none; b=LMYVl6qKQVJCMfViQPQNAndjPqdoyOCAtzhI8NRFnBSReDPZ+i6xOf41z66w/fbnO8/YiLiOB2EgpjhIw4IFJyPEUO2b4FCrICXjuKwcRD2aj9vKJje6bwC+zwlFuQHk87orQPtWEfEzAgR/oZ+MTX3cO5Ym3ygcZlpAHchEVdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784319315; c=relaxed/simple;
	bh=diUIIKStfenJCEasoEwrp+wCmRi3qtN6/sa0FZ2l7bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TN+PdyISHJFmn0nNFWRT0iL6uiMKqvExcChygWZ/67Q8E5Ayx/zAO6xywi7lTQMORfTjXO/r0f4c6P2ubt1L72gsk+ikN7K4rKHANwm96W/piV4bypHG0w67MwPKJMAqeKSW1h2K03Ohm/Bg37YApeaq5Pi+mruIzzdvDmQQW/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8hK3rbW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8hK3rbW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f307dd9d5so280242f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784319308; x=1784924108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Pv4NrN4dYt4KyUEdjIMuVrZU8kjGasmAaF2k9w2Y9c=;
        b=m8hK3rbWJ9dCXRpYUMS8e5kU6ayjyoBM4AfwAuGK+XRLsdXJCcgqRxWGTYYYjC5bIL
         lwZ3rAcHJ1ELt8LLKUuViHJcNrhGhAxn1HUMzO1jNOB5E4+LcTilBy6ArFs/nrPSf0HE
         vqSsCccU5f8sxpGqR9Zzbst4KRwdQnG2UNfVjOv3uVaAF9RrjqMIOd7ylJLg+TkZ4/rc
         It3iUdpLnsm/VcuK1ff/CKLeIJJTAOyt6hWYvtqAMPfXzdSPCPisl6mNLMpVQbzV8Rwe
         zwVEgsTrPMTpSaDPT72+dPIzkk8/Z/9mH2WDYoxorwingznSCvnOR79Ky/msqvImTTJw
         gZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784319308; x=1784924108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Pv4NrN4dYt4KyUEdjIMuVrZU8kjGasmAaF2k9w2Y9c=;
        b=EOcWV/5KgtyE35NRm9jLgsajfcJB8adZbDoO5HFw2a12oPt3+6XCwclcdae3KATgt9
         4eqyl0TUxymNYYkH5QST8wmUYJGKBeo90HBhsE7JQBp47RvlVhmTzhSSlElpdaHiyWT+
         e9nzPNbW+5biKK0BR29xPkC4BBFvXMAp6STz8yXfw6bIYYUHyu5L7+GhxZY+YQ4vqwxC
         etQZxPANKvlKL0vPEWbs3P4Ba94xCUkr++vLeDesnO47AlgQWKnftPo6Oxj/1b5EQvUl
         l+9/CQGh+s0+j/eTktP80N7VhPnI98eTPscIoqfFE8pgp37feMN01J18EhKH1dNUq4pY
         D8Ig==
X-Forwarded-Encrypted: i=1; AHgh+RosfickdCQU3hbgGQ9uK4uFwy6Nqvwoee7eQYVrbcntUs7CMC2WgRt2vjyEHLrZnL5v4YuRn0KzFjEeAfYOeGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYS/RKgRi2pJ4X6AHegS1L9OwqRtqHAhumck38qoQwx5eYOO+3
	TzUEfZGkAwu+kWHiS1etkmR45TTXVfqoNUPQZj+W8GgJF19Iwd11cmVT
X-Gm-Gg: AfdE7cn+BRDYF0PERtgJFfhxVlqiOVsWs707aByFCnuR7rhokj85tckEDLLaJUpK2k3
	1J+aHtpC47DLZsGwrx72LOsFOVBrZK+GEL+5whkaRa8s+8QNkdixB8JKWiMHznanXQq0DfQb+21
	uLV6FNYjIP2WALpiqC94v+3WQxvVkGqq8et3aylu8UrkXMCnzneYchNACHFP24Pnhx7fhq+x6gE
	1Syt+FziNHnTXUE5S9JImo4qh3eCF/GhSyzNuCjYo7w4IXPY7OPkbVtA8nLs9/GLvO8T0pc44V6
	6hsORncQxeFuQBWWyuINSJNGLB3z3tm64MqtIWnExiF7SQqDBdfXMu3wjHOrXZbmmmYZ/2UBdoQ
	XY0zPMc4nVML3i5gx1kOSBb/U1KQXoqGoB7IXeFZmV+hESGGUw0tGRWp/rzJEuUcRBD97jKp6E2
	Ks5TC7puJgwYdexqHRJosCkdsGC+ch4X3QN6rQdnkngkR88cF5dc+DnoS7ZTwtn8dqLJ4SFkuh6
	Wr4ZslzovL+bAjgZUz2C0VUuYGAjJlaWcXBRZk=
X-Received: by 2002:a05:600c:46c7:b0:493:efdf:7c80 with SMTP id 5b1f17b1804b1-4954a40ebf0mr29386095e9.5.1784319307839;
        Fri, 17 Jul 2026 13:15:07 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-179-077-126.77.179.pool.telefonica.de. [77.179.77.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499a5847sm53179335e9.2.2026.07.17.13.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:15:06 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	wsa+renesas@sang-engineering.com,
	jie.luo@oss.qualcomm.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	fmancera@suse.de,
	bigeasy@linutronix.de,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	Xin Xie <xiexinet@gmail.com>
Subject: [PATCH net-next v4 4/4] selftests: net: hsr: add PRP RedBox test
Date: Fri, 17 Jul 2026 22:14:57 +0200
Message-ID: <20260717201457.54-5-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717201457.54-1-xiexinet@gmail.com>
References: <20260717201457.54-1-xiexinet@gmail.com>
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
index 31fb9326cf5..2150e487ac7 100644
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
index 00000000000..479c892225b
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


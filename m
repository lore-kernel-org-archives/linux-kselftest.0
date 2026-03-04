Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166A4385536
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 23:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665631; cv=none; b=gl8pklSUhmvsEjAgvcGUHEyIlCtauIt+Q2u/KKFE3ZsGNIe91VEJRKP2z4l2H3dD9BTLjXKviGfXZKN67a5CODc22il12DtO1OwDPagDeO/5cNGcOnF4ffdMxQihPaooVUQM6mCTki81wTQrKpeLV89Kps1Y4L0sqx736xQGW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665631; c=relaxed/simple;
	bh=qqo/sXxeUcdg1LLDHEKSMtN5BtI0DxP3q5LlITq11LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5eDln+SBhTh4dwuZxC2khHOJCXr9TRZ7yRNY92t5ABI4gL1s2Xlyc6OjoQnRyTgn8UkFHReuNBMjmhLIuD4Hpau5cXzHLvJlNm37fMv3puoTTtczZ7NewYBmWd6qEzCv2IdY1W/kAuuemHrWMo97X4saLIHtRNbr1CjBLu4c/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=NJ7jvaQS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="NJ7jvaQS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48371119eacso88526395e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 15:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1772665628; x=1773270428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAXxJSztMHv22laPSgiqC3TIngmb2awX71/Jw/42qZM=;
        b=NJ7jvaQS5lQdImf1FROY8w5QiH1xpuP0gsJI/YdyG6wvQh1m7hN6cQI8FYflaRM5/M
         YGLUKW3/rE7JlErlyVo8PmCBw5Zod6X1cJ9OG+9BdMIc+yV/2kTCLra9hLrmNLML5mLX
         1+pMZxRNzBVfp+ylfjmCx7qFqXNjNhbStqDtG5LRpLQpwm9GacfiEC06dTaF8HGJFFA1
         kdcaz0c/7DQW3IXcaYYRKuUlo1tls91uYx3C6vqNJgclhtbAaevCxWvnHWPy0baJ+Gz9
         7UMN56TBF/0zpeZPGQMx8UFakyQCZ8s0eiEcYD/QcwDHZY14LjKQ3+Ry0Nxd9lkgAn56
         3shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665628; x=1773270428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fAXxJSztMHv22laPSgiqC3TIngmb2awX71/Jw/42qZM=;
        b=O6Uz9vH07vbzh9JmRZzoUAhiApi8GYB0nDbEfyMlg1J1zRC3LANFns8z7G59RQ+T0k
         EShpvF2bHLGrwlZtGUNl4btnvm15qQwymmAWT3Jtzr7el4y5ClRbhR9UJ6yLoVKr0E01
         VapiB2DxFaJ90kpy8AH9hqOtlC559Bjys7XAFw6ZImgidpC15wM5vG8QU79JWeG5UMM6
         piQ5MdoeMmYa/X6GfGXMonGxQLRz4GUvLdx+5Gn+zgwpa3zSrIYenOoR7sB6IfwVAFwc
         qAXIMuUWvQGOWSKkxWmpCEmjVb1BmM911rGMcBHEM6kd1nXWuldnx4/SVprmBj2Azjna
         PCpw==
X-Forwarded-Encrypted: i=1; AJvYcCWXrG6rSz560CetoINBxSGeO2udNUIK9LB5aEO/VZs1nPnS5OxHxWBcqIVpMBWDWxg29BrXWB6MR+msVtMsM+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVTufTa/s0MIEuaulnRnGA6xegQVHH3JWK5+Fcd5kWPWSLdPJI
	ZDdjHb7Cc9XG0PVHPodYgMGSSV5X79+dOGKHhFgMJtmc4iGHT4/sbECKBZm/KFMcyZwRL9fqDFB
	t/+jLZCxs+99maraZT8FILgNEB2OKk3uWF4M5diVmc7u0FTREZC+28aZThqDawdE=
X-Gm-Gg: ATEYQzz85SrTYMcgygXkJv2GhFUh6pzfVJ8/+x1uszZIHd+sDM42BylZsC08s3P5MJe
	D4egcMCDC8D/3/XhmMdKMDTJBRW4C5p3vjveIHwMjoXTm+LCdHtdCMCZnzYcAcJB5jm+WQDsjQI
	lLrl29iuGiwE2auep5hMusHygiVqaAtuKsE6ZYvIWJY75U1vHcSFTQ8J1mnUqsdQqu2AdZ5GgSM
	0lANnipIoBKxsbon3BznJ7glwJgb4j8mFDNALptZS+suIHzAFGwx0TgOvDKqSw1XzR/CxKtP1Lx
	t6SDf0beyc9DnLSwQ6qvioYWHxDAxZ7S+Ub4mn/ILMCkn69j0zmqR4f1IcsAmWErEIwArDu3rGv
	P0xh/ugotX1HhQX5Th0nxe+axryvoHcBAOlAU3nhcI7OLM9YUoF/GEVczJXdNWPvgUrzeDzFbj+
	cRB2xBaNnbAGZwDJJdiAYI9vvrO1UlrnRgBcY=
X-Received: by 2002:a05:600c:8105:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4851983bf08mr56561535e9.6.1772665628413;
        Wed, 04 Mar 2026 15:07:08 -0800 (PST)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:880:4d86:fc53:5d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187caf9fsm87713475e9.7.2026.03.04.15.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:07:08 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	horms@kernel.org,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net-next 8/9] selftests: ovpn: add test for the FW mark feature
Date: Thu,  5 Mar 2026 00:06:26 +0100
Message-ID: <20260304230643.1014-9-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304230643.1014-1-antonio@openvpn.net>
References: <20260304230643.1014-1-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralf Lici <ralf@mandelbit.com>

Add a selftest to verify that the FW mark socket option is correctly
supported and its value propagated by ovpn.

The test adds and removes nftables DROP rules based on the mark value,
and checks that the rule counter aligns with the number of lost ping
packets.

Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: horms@kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 tools/testing/selftests/net/ovpn/Makefile     |  1 +
 tools/testing/selftests/net/ovpn/ovpn-cli.c   | 26 ++++-
 tools/testing/selftests/net/ovpn/test-mark.sh | 95 +++++++++++++++++++
 3 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/selftests/net/ovpn/test-mark.sh

diff --git a/tools/testing/selftests/net/ovpn/Makefile b/tools/testing/selftests/net/ovpn/Makefile
index d3a070db0bb5..7c87c95d957e 100644
--- a/tools/testing/selftests/net/ovpn/Makefile
+++ b/tools/testing/selftests/net/ovpn/Makefile
@@ -31,6 +31,7 @@ TEST_PROGS := \
 	test-close-socket.sh \
 	test-float.sh \
 	test-large-mtu.sh \
+	test-mark.sh \
 	test-tcp.sh \
 	test.sh \
 # end of TEST_PROGS
diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 8c684f61220b..01bdcc0a8049 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -6,6 +6,7 @@
  *  Author:	Antonio Quartulli <antonio@openvpn.net>
  */
 
+#include <stdint.h>
 #include <stdio.h>
 #include <inttypes.h>
 #include <stdbool.h>
@@ -133,6 +134,8 @@ struct ovpn_ctx {
 	enum ovpn_key_slot key_slot;
 	int key_id;
 
+	uint32_t mark;
+
 	const char *peers_file;
 };
 
@@ -521,6 +524,15 @@ static int ovpn_socket(struct ovpn_ctx *ctx, sa_family_t family, int proto)
 		return ret;
 	}
 
+	if (ctx->mark != 0) {
+		ret = setsockopt(s, SOL_SOCKET, SO_MARK, (void *)&ctx->mark,
+				 sizeof(ctx->mark));
+		if (ret < 0) {
+			perror("setsockopt for SO_MARK");
+			return ret;
+		}
+	}
+
 	if (family == AF_INET6) {
 		opt = 0;
 		if (setsockopt(s, IPPROTO_IPV6, IPV6_V6ONLY, &opt,
@@ -1693,12 +1705,13 @@ static void usage(const char *cmd)
 	fprintf(stderr, "\tvpnaddr: peer VPN IP\n");
 
 	fprintf(stderr,
-		"* new_multi_peer <iface> <lport> <peers_file>: add multiple peers as listed in the file\n");
+		"* new_multi_peer <iface> <lport> <peers_file> [mark]: add multiple peers as listed in the file\n");
 	fprintf(stderr, "\tiface: ovpn interface name\n");
 	fprintf(stderr, "\tlport: local UDP port to bind to\n");
 	fprintf(stderr,
 		"\tpeers_file: text file containing one peer per line. Line format:\n");
-	fprintf(stderr, "\t\t<peer_id> <tx_id> <raddr> <rport> <laddr> <lport> <vpnaddr>\n");
+	fprintf(stderr, "\t\t<peer_id> <tx_id> <raddr> <rport> <laddr> <lport> <vpnaddr> [mark]\n");
+	fprintf(stderr, "\tmark: socket FW mark value\n");
 
 	fprintf(stderr,
 		"* set_peer <iface> <peer_id> <keepalive_interval> <keepalive_timeout>: set peer attributes\n");
@@ -2241,6 +2254,15 @@ static int ovpn_parse_cmd_args(struct ovpn_ctx *ovpn, int argc, char *argv[])
 		}
 
 		ovpn->peers_file = argv[4];
+
+		ovpn->mark = 0;
+		if (argc > 5) {
+			ovpn->mark = strtoul(argv[5], NULL, 10);
+			if (errno == ERANGE || ovpn->mark > UINT32_MAX) {
+				fprintf(stderr, "mark value out of range\n");
+				return -1;
+			}
+		}
 		break;
 	case CMD_SET_PEER:
 		if (argc < 6)
diff --git a/tools/testing/selftests/net/ovpn/test-mark.sh b/tools/testing/selftests/net/ovpn/test-mark.sh
new file mode 100755
index 000000000000..1a107f9b5431
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/test-mark.sh
@@ -0,0 +1,95 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2020-2025 OpenVPN, Inc.
+#
+#	Author:	Ralf Lici <ralf@mandelbit.com>
+#		Antonio Quartulli <antonio@openvpn.net>
+
+#set -x
+set -e
+
+MARK=1056
+
+source ./common.sh
+
+cleanup
+
+modprobe -q ovpn || true
+
+for p in $(seq 0 "${NUM_PEERS}"); do
+	create_ns "${p}"
+done
+
+for p in $(seq 0 3); do
+	setup_ns "${p}" 5.5.5.$((p + 1))/24
+done
+
+# add peer0 with mark
+ip netns exec peer0 "${OVPN_CLI}" new_multi_peer tun0 any any 1 ASYMM \
+	"${UDP_PEERS_FILE}" ${MARK}
+for p in $(seq 1 3); do
+	ip netns exec peer0 "${OVPN_CLI}" new_key tun0 "${p}" 1 0 "${ALG}" 0 \
+		data64.key
+done
+
+for p in $(seq 1 3); do
+	add_peer "${p}"
+done
+
+for p in $(seq 1 3); do
+	ip netns exec peer0 "${OVPN_CLI}" set_peer tun0 "${p}" 60 120
+	ip netns exec peer"${p}" "${OVPN_CLI}" set_peer tun"${p}" \
+		$((p + 9)) 60 120
+done
+
+sleep 1
+
+for p in $(seq 1 3); do
+	ip netns exec peer0 ping -qfc 500 -w 3 5.5.5.$((p + 1))
+done
+
+echo "Adding an nftables drop rule based on mark value ${MARK}"
+ip netns exec peer0 nft flush ruleset
+ip netns exec peer0 nft 'add table inet filter'
+ip netns exec peer0 nft 'add chain inet filter output {
+	type filter hook output priority 0;
+	policy accept;
+}'
+ip netns exec peer0 nft add rule inet filter output \
+	meta mark == ${MARK} \
+	counter drop
+
+DROP_COUNTER=$(ip netns exec peer0 nft list chain inet filter output \
+	| sed -n 's/.*packets \([0-9]*\).*/\1/p')
+sleep 1
+
+# ping should fail
+for p in $(seq 1 3); do
+	PING_OUTPUT=$(ip netns exec peer0 ping \
+		-qfc 500 -w 1 5.5.5.$((p + 1)) 2>&1) && exit 1
+	echo "${PING_OUTPUT}"
+	LOST_PACKETS=$(echo "$PING_OUTPUT" \
+		| awk '/packets transmitted/ { print $1 }')
+	# increment the drop counter by the amount of lost packets
+	DROP_COUNTER=$((DROP_COUNTER + LOST_PACKETS))
+done
+
+# check if the final nft counter matches our counter
+TOTAL_COUNT=$(ip netns exec peer0 nft list chain inet filter output \
+	| sed -n 's/.*packets \([0-9]*\).*/\1/p')
+if [ "${DROP_COUNTER}" -ne "${TOTAL_COUNT}" ]; then
+	echo "Expected ${TOTAL_COUNT} drops, got ${DROP_COUNTER}"
+	exit 1
+fi
+
+echo "Removing the drop rule"
+ip netns exec peer0 nft flush ruleset
+sleep 1
+
+for p in $(seq 1 3); do
+	ip netns exec peer0 ping -qfc 500 -w 3 5.5.5.$((p + 1))
+done
+
+cleanup
+
+modprobe -r ovpn || true
-- 
2.52.0


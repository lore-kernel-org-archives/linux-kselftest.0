Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406FA30F7EB
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154240; cv=none; b=jdizNNSPtWz/KYiGUyqC6uA6e7v4PNVhdb6b48rhZ6r8GbJjDp6HhRH0Y7Q1sKDd6Z4ESEVnYqom6cWOAEPs/ZZdCdbhjE0rhEvTVRgHT6qBnxIFZZgcnaWgS6IE4CuGpoE5JUcu510XsuAyPTKDqWg9ycyo7LdsypjUBDvaP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154240; c=relaxed/simple;
	bh=HeMGDyF9dBpQXaVmwG0QTiwumSdppPensQWCjcnsyos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StJyMNfVkuvzrb+ZDVxN5RCoHj1R6GIxsep1H6vTUjc2qFo6YV770eEpZFkdYIEFoBEb/cX/mAJ4iAODjta/hOizPH0140219bcHzjlVhbAwYNF1UJvunX89BX9v9oBq2Sr8tHdzvN2vfIn7nTbO0uXveDFsRwNARCQDX7cXQbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=AMt3zVbc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="AMt3zVbc"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bcec8613so7064891f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773154237; x=1773759037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK4qYZgQdyi3oF+Fs4fMvWt7l8FWxonwPMP9g/CfoUo=;
        b=AMt3zVbc5JVTVODfD8uiUunZzdCl1baFN8IXAxUwUsM7Lq5uOrNCHL48WVDKaedUz5
         OFgJUw3scz/vboczlK7pfdxoYdY1FEEcBcqO6vx1oLjRzlrkw9D8Ljwoobu+X1uZifpw
         HqXzLRPIIk21mbYMby5QAj/VyMwU8dx3IDE4zqi7UwkFcZZVMIaMeP/iicL8eAttfulg
         +9MavkGPZDdNYFiGGbkusGhIMcyKLTQNcvWj68YQxgaCt8HHYdHQcebXj1VGmAQKb9ge
         f5DmplbttwSoKFjRI+XJk0/kahfyj6iX/Mi5S6qmJ2FddIF69UXIyFJOh4xa2CkQY7XC
         YLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154237; x=1773759037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nK4qYZgQdyi3oF+Fs4fMvWt7l8FWxonwPMP9g/CfoUo=;
        b=LbGKYf4lOnSFSCGMU6lm6RqIChyLG/0P2yQol7A08PMS+5zURUpa5JYiLi3tepODQI
         SMTjmsd77e1yx35pBoBA8JEtLVagqL7bt3ff7E8021bDGAsWTTbJCMgxgAEcKTYVI4S/
         +hbtl35YqZ2/cPMVMTLStCvZJ+dtHSs8zj5VruuHv01v1C/JkJMMKBYvvaoPm+qsYacA
         aGAmQlpPn5PkUP2syDeG8GGet4OWPTv3dNP/F+QvQ40Zqh9oskTZcteID/pdaBvSSMlA
         bgTh0t9MHIZuCQrx7dGxAkxykhiKmTYiM8bHc5wkk/wEE9WE8Spt/V7RRJNwOfYnJzTs
         tYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq8sLEdMb6r7zkGZ6+xwheUeMCttXOwTmLgaw9hG3fcccCov4mZUt3d2whetVqowOqK5qv/zCaDsPPZLQCUS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lakZtxkjNJuv7EIPVs59nsUxsklx0pkJovRiEscW1bsaEkfA
	Sa9gRafa/YJzJTlzuTZ+7q8UrmmiX6EGEYktRCBTEj0HUcktOYv81Gg3pIuOY50EG8XiOWUWZSI
	gdHFtqdAsOSWbxyYG2DN+Y4OT72oXKH6i6AzXZ7oNjhIMHbE5/XnOAHqnHiC7qoE=
X-Gm-Gg: ATEYQzzHGkr63eWJlCCSoxgWLJi+tVqSGqO/BIvxOaf1mc+RRpZ2oqp4mXq53dKItlQ
	4FELWOc/+PZ5SgFYkiX5LgXdultl3xCttgw/JYonHyxoDJs41o868882WU6cpyMypeCxf9MC2RY
	LVDykulO+rAUE2dWdXWWw9TeFG97iLQGUkauCf9N5vmfSlK46w69lvqMWuiYCheuhFVCJTOjkr0
	KgqDuOFgyiAm4Bo4MPy4X/hvG2hh3xUWfWMeniTdqgvs54+DYHPSUBNCyyLImOyBlS45ve17OSI
	aGPoPnFyL1TIDKmSEs5QKputWa1yXwxIkXj7c5lW+DGS5rDjkOyMxHhYzvHBJ7CsMfcYfGBcvPd
	snjGbZaow3GrNqV90eb9rPppTDwF1y8V31dd9QsmyLGFhqB9KWpp9E1aHk3+x8uFTsEbDXGWnXY
	HqqH6Ksd1VVYXudD8gUx257dA5gjk7ozHrp8U9
X-Received: by 2002:a05:6000:40cc:b0:439:b811:11de with SMTP id ffacd0b85a97d-439da3483c8mr27444471f8f.7.1773154236464;
        Tue, 10 Mar 2026 07:50:36 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:5594:94ef:1bd6:89e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35586700f8f.6.2026.03.10.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:50:36 -0700 (PDT)
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
Date: Tue, 10 Mar 2026 15:50:05 +0100
Message-ID: <20260310145006.30858-9-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260310145006.30858-1-antonio@openvpn.net>
References: <20260310145006.30858-1-antonio@openvpn.net>
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
index 0a673327ba9d..5d17d7330bd5 100644
--- a/tools/testing/selftests/net/ovpn/Makefile
+++ b/tools/testing/selftests/net/ovpn/Makefile
@@ -38,6 +38,7 @@ TEST_PROGS := \
 	test-close-socket.sh \
 	test-float.sh \
 	test-large-mtu.sh \
+	test-mark.sh \
 	test-tcp.sh \
 	test.sh \
 # end of TEST_PROGS
diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 5b58aca9366c..7f5a3737666c 100644
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
@@ -1693,13 +1705,14 @@ static void usage(const char *cmd)
 	fprintf(stderr, "\tvpnaddr: peer VPN IP\n");
 
 	fprintf(stderr,
-		"* new_multi_peer <iface> <lport> <peers_file>: add multiple peers as listed in the file\n");
+		"* new_multi_peer <iface> <lport> <peers_file> [mark]: add multiple peers as listed in the file\n");
 	fprintf(stderr, "\tiface: ovpn interface name\n");
 	fprintf(stderr, "\tlport: local UDP port to bind to\n");
 	fprintf(stderr,
 		"\tpeers_file: text file containing one peer per line. Line format:\n");
 	fprintf(stderr,
-		"\t\t<peer_id> <tx_id> <raddr> <rport> <laddr> <lport> <vpnaddr>\n");
+		"\t\t<peer_id> <tx_id> <raddr> <rport> <laddr> <lport> <vpnaddr> [mark]\n");
+	fprintf(stderr, "\tmark: socket FW mark value\n");
 
 	fprintf(stderr,
 		"* set_peer <iface> <peer_id> <keepalive_interval> <keepalive_timeout>: set peer attributes\n");
@@ -2243,6 +2256,15 @@ static int ovpn_parse_cmd_args(struct ovpn_ctx *ovpn, int argc, char *argv[])
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
index 000000000000..80fb31b99710
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
+ip netns exec peer0 "${OVPN_CLI}" new_multi_peer tun0 1 "${UDP_PEERS_FILE}" \
+	${MARK}
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


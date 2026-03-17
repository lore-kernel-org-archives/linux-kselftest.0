Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8703A7F62
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744041; cv=none; b=RLTAlCVRl6Emx52dH8xweTPQLbKrFBJuN5MckaSEJttNe4S1l6dklzN0t4qmgSTgqyXcY/mR2WWuceiwgc93lvp/sosaVfmckHFnkOvV5dn+ParJ1mtuz17fgWHkjEjj9BHNsxYhSfS38EQWCFN5ASkCPizbOHp9rGOLYjwt+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744041; c=relaxed/simple;
	bh=Z7TKiU2baXfDULkwj1ImK1LH2PaAIfWpDYtrKG0uRPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDjDcZrn5BBH5vUXcGetNgFnXg67F4qAYmuwhnVJmx3zSziB4DqsKB05ul8IzcDaUlZz2ESZ9Gwubli6dDV3EI4qrMvJs1YKqK8VikJ6KsGdThVad+uW8XMMV6UMlSeT7DqdkCN7eYU+1eAfDGHKBdvZjpDB+NDwxVZat/0xwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=LCqTe50o; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="LCqTe50o"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b6d9c981so459153f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773744038; x=1774348838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAk6/0FI/V+IuzszsYv8m/anwRDhiaLOVZ296LqlboI=;
        b=LCqTe50o3NCebmiEQNYPbm4oPyRF4PFXLOoyATFgvgLcT00wL/XG6eDQiI8gnkj0JS
         5+zJpn1js/ByujKoqoCHIPtnkdfC7mKW+rG6KvL3FbBWHh5MyqrHcyKaYwMyZ85IT4Lr
         aS7V++b0liGxfajrqUmmajzAFZ6Qrx/GObEAMXiBssX+21yT/6YT/e9PyezzwgZwvY/H
         tY0B1hTxe1xFDlON47GqaFgbmiCogNoE7WJfz60w+SCrfMjWUMJYchYJpUVOwxGh6y50
         zs+Yt7alLUVfvzTX7EiYTEIPfIWN300TJGeIFSvSQUDtzEReEhxJGcA3AX90qGLdu45+
         Cp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744038; x=1774348838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAk6/0FI/V+IuzszsYv8m/anwRDhiaLOVZ296LqlboI=;
        b=N5oAHHrIgUnpbiJDAR/dhMEK2dHtSY5mqNXgZFwmIqNDPqJaoYXlFZw5DXHS2kCf45
         MjkJGvfAvxBF2wDo1ka73NcaLZ89Yy07u8WmU1a+m6RqG2yvfEKhThAbjU/yTNWf9WZf
         Hanem8OREyc5+taKMzg5yTn4SKBzI+ACnzPr0TRvbzAVSdnTdv/mr3qEcLiWg7vI3CuO
         dCTWQOZIM0Pyc7d7wIdHLDEGmR0n7cBmVwrSIlxY1wlHzrSiJmJeyyJFVUCPz6YJ8asb
         BD7v5b9aLjb8A78G6SOXHfVELsgSWVIuRxtSisBzL1z7jeMtGI76MdBcbYI/e+7HjTLG
         49Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVLOf2f3jyHHpseH7/abWXJ6/2UETgNPpRW+/EtIuNUWR8xlw/p5SbOKm337Q9y2PQQVeI1ffYWaJDgE5Tuyhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+FI/xAjBFeTM7IMlLQoVL2gaVl3w8ItUe2KgPX/mJ8AKDkp7l
	B85pShYG4xs8GShS3eNo5OSins5BRA40bu3B+lMUsJB3tm/bWQwnfJZxWNcI0IPUWJgKQ14apt8
	lVcXZtwxiZzzd/YY03a13ctWRZK+YYPgRuKscXYaogCsbmpyTSJmqthE1p59sQdo=
X-Gm-Gg: ATEYQzyu97vbxjI/7MHpm1AtGN9tiPxYTQziHLcq1AKVqTeop6d1zmdPFGb7Bljgjsh
	izp4tfoLoN4bBm8tatcYPZwCGlj4Pk3BQT/P8mdi4XK0b2Kz0y58wdTTOVTRY8/qgplc9CrjFpm
	y/30UonfWL+dsoiSd1FGFBWrFHhqj/5mNczuTcy91r7BcvGGDQzgEADVM3XIm2j/5A8jZ77O6Fr
	Tu4r718YXG4DCgXfeHc8yXJrAGDlkGbKPsNH+vm0GewArG5bp1bYBA9uX0oON/T8mCqnRLtOLFp
	mBUx5y4C8R1vMdkSBvB7KlSXgitYR6GSO8E2NiTq/W4zftb+ZeWQR0ohJDBHHhpxVwGl+M1nmks
	uWI7T5E5W8Y+YIMlayiUe46KxWYK9a96QsrjaENvRr8AjGfkNE9K6gae92Wu96oUFP+epXFRWJN
	nqT3hoscQO9wcTFy0reFIllMRY10mCkM67Ggk=
X-Received: by 2002:a05:6000:616:b0:439:bee4:8a93 with SMTP id ffacd0b85a97d-43b498207b4mr5243996f8f.12.1773744038046;
        Tue, 17 Mar 2026 03:40:38 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:4f22:3f9:13dd:cf23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm49948215f8f.31.2026.03.17.03.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:40:37 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
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
Date: Tue, 17 Mar 2026 11:40:22 +0100
Message-ID: <20260317104023.192548-9-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317104023.192548-1-antonio@openvpn.net>
References: <20260317104023.192548-1-antonio@openvpn.net>
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
 tools/testing/selftests/net/ovpn/ovpn-cli.c   | 23 ++++-
 tools/testing/selftests/net/ovpn/test-mark.sh | 96 +++++++++++++++++++
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/ovpn/test-mark.sh

diff --git a/tools/testing/selftests/net/ovpn/Makefile b/tools/testing/selftests/net/ovpn/Makefile
index ce9f79c4f892..169f0464ac3a 100644
--- a/tools/testing/selftests/net/ovpn/Makefile
+++ b/tools/testing/selftests/net/ovpn/Makefile
@@ -38,6 +38,7 @@ TEST_PROGS := \
 	test-close-socket.sh \
 	test-float.sh \
 	test-large-mtu.sh \
+	test-mark.sh \
 	test-symmetric-id-float.sh \
 	test-symmetric-id-tcp.sh \
 	test-symmetric-id.sh \
diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 085446471397..d40953375c86 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -6,6 +6,7 @@
  *  Author:	Antonio Quartulli <antonio@openvpn.net>
  */
 
+#include <stdint.h>
 #include <stdio.h>
 #include <inttypes.h>
 #include <stdbool.h>
@@ -133,6 +134,7 @@ struct ovpn_ctx {
 	enum ovpn_key_slot key_slot;
 	int key_id;
 
+	uint32_t mark;
 	bool asymm_id;
 
 	const char *peers_file;
@@ -523,6 +525,15 @@ static int ovpn_socket(struct ovpn_ctx *ctx, sa_family_t family, int proto)
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
@@ -1704,7 +1715,7 @@ static void usage(const char *cmd)
 	fprintf(stderr, "\tvpnaddr: peer VPN IP\n");
 
 	fprintf(stderr,
-		"* new_multi_peer <iface> <lport> <id_type> <peers_file>: add multiple peers as listed in the file\n");
+		"* new_multi_peer <iface> <lport> <id_type> <peers_file> [mark]: add multiple peers as listed in the file\n");
 	fprintf(stderr, "\tiface: ovpn interface name\n");
 	fprintf(stderr, "\tlport: local UDP port to bind to\n");
 	fprintf(stderr, "\tid_type:\n");
@@ -1716,6 +1727,7 @@ static void usage(const char *cmd)
 		"\tpeers_file: text file containing one peer per line. Line format:\n");
 	fprintf(stderr,
 		"\t\t<peer_id> <tx_id> <raddr> <rport> <laddr> <lport> <vpnaddr>\n");
+	fprintf(stderr, "\tmark: socket FW mark value\n");
 
 	fprintf(stderr,
 		"* set_peer <iface> <peer_id> <keepalive_interval> <keepalive_timeout>: set peer attributes\n");
@@ -2284,6 +2296,15 @@ static int ovpn_parse_cmd_args(struct ovpn_ctx *ovpn, int argc, char *argv[])
 		}
 
 		ovpn->peers_file = argv[5];
+
+		ovpn->mark = 0;
+		if (argc > 6) {
+			ovpn->mark = strtoul(argv[6], NULL, 10);
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
index 000000000000..8534428ed3eb
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/test-mark.sh
@@ -0,0 +1,96 @@
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
+ip netns exec peer0 "${OVPN_CLI}" new_multi_peer tun0 1 ASYMM \
+	"${UDP_PEERS_FILE}" \
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


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB5F37FF63
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435122; cv=none; b=efYXQJVbY5yU7U6j74U23e0c9kp2CmtOQItZr6MY8q/WlyJBqCQfYwC1q6gP0f5LpZGFGd4B5D0hj7YQYfYccPdlK7nyfdcDbamVPGn37E6OsFqfUNcs+U4scGSsMeafeAi6Y917ta8/2Qr+sK291ILTOKFj9MuBQW1jC4YAhrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435122; c=relaxed/simple;
	bh=Z7TKiU2baXfDULkwj1ImK1LH2PaAIfWpDYtrKG0uRPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cptjl+ZbvyvotNkVlY8D4faNhh7PczGI8X+RZWrji15Q9mfNgV5Cu+FGOc9eXJtiFIgeokosxMI9kAN4SmUdeA0N0M45feOOJrRs5TnAfCA8gObSnv4c4fhiLWc2vbFaaDv8+QShh6wSy8/DA1Bfz2OHqY30miTROF60pG9fXas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=AJtZ4tu6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="AJtZ4tu6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso30491835e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773435118; x=1774039918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAk6/0FI/V+IuzszsYv8m/anwRDhiaLOVZ296LqlboI=;
        b=AJtZ4tu6g7zwGMTQFevjkTb40nDHMse0DwQnUgTBfCWWabiZx/skHF+kORs4zdR2V5
         e2M/ijVILXAXCMNkl3WDvX3i0BtRCRG4HS4JbGYfWYxcIiM1BtTWlXJjpVfDiVWtom8e
         w6pl9fYlpnYl76lCIA8xXNKwif3vpmcE/uMhEhw4XtVNP/Xl4gPNNK6xI2R95N79QMLq
         Kt4SAr7gyRczZJl1I0xx8wqXWGmBa0OVEOx0E1C4v5z7svTYjogjx1melDQ85SZolrF2
         o3/s1wqmd4bVpYXEIRZ9XSU/Wak9P80kMOmjk8DU0pSknwg0WK33IfmGRmvFLzAwfvWS
         zkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435118; x=1774039918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAk6/0FI/V+IuzszsYv8m/anwRDhiaLOVZ296LqlboI=;
        b=MDk5uW6C5mdDwMexbudZkD9XD6yaxqEM9TQeyp/GNkKDLalFFi2S5E/3p6uUoJaKu6
         kf1M+nRovGbi2cyCaycpSIVpkYYybCm7QpQdR123wzuyNlQpZxLN1anQiWJWhOwc3FGp
         poQM+4jlGPe/RZtjFNCZV4j0v4G/ls6d0EBhY/cEgz1o33S+enYZuR4XT9Bmr1mWQzp0
         1pqfn0OzmRvNTtwEO82A0V5rQyhvNiAM5v/n3QQV2FhSsSPj7eBn9GQFRyctLvvp9WrW
         9oPwblg+NEtAwlHlXiFJ/ZNeFHg71z1oaR3VMmegmokp7l2lGR75x7VVTmAyZVbRtjD8
         M9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr4L318hQY/Oq0mantlFRwCSm/lP4xquWMPitRX0sOMBcXHACkGGOEn7k+/l/UPmREQglWlB38Q00GhtmCd/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLUuUSUGkT/W7Vm+un65LOX3vPa4JLRevJNDI6HWfVX8mjJYbY
	DF/Ps5oln666Gp8SJxsEV/fS9Cj+2yeNWQxC4Pgxy2ldXflj9Fknt8lLQdsP3qVIfcqp/8TcITx
	Df/pLae6zTTyJV9apNKIlMHqD0oTpvy7VDGwTON/o9YomGut1evGi5LPHALBrBZw=
X-Gm-Gg: ATEYQzwHCCgElRHomzmJN9KmWxKzdTKkIxYgA4tREPggvF0velCrTYZj33YcPkFjaux
	pDrpYanm/M1NW7rph67gTbZQu/d0dOwnDVf9/ZMfFOu2+BAAWoqHi4RAq0RYVWOYKGQuOWjjHZ9
	wEgOMmAyrOZXgnoH8bsil9sQ56xrXkNpYt2NVUM1uBQKD04tDRLZRnLhqkI6jEA9w3TNiDkstnc
	Qbllb7bqPXzVGRQa1WjN9BK4Nf9VmrxT8WssB82DRLH0wXpWsuA4X03KqnSd1R/vBslcSor4/Xe
	hl1en24VMz/oCb8i06rB43gSQ3clot8FWgoyfA175HXZSyp8ChFYuWw86VSzhf/VzZky6oitT3F
	t7gSQmi25+E66VGOY8PoC/T4E+etpY76ehx2viGbR/QuevUbWWf+KXjcMdvnLtiyRpflX22eJtD
	ZUk+UwpJwQ/4/N0+0viSgodbU+PrtoBZO4HNO0
X-Received: by 2002:a05:600c:1f8d:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-48556711dfcmr77048855e9.32.1773435118370;
        Fri, 13 Mar 2026 13:51:58 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:9684:4355:e76d:6ae9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm23120468f8f.34.2026.03.13.13.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:51:57 -0700 (PDT)
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
Date: Fri, 13 Mar 2026 21:51:38 +0100
Message-ID: <20260313205139.2950-9-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260313205139.2950-1-antonio@openvpn.net>
References: <20260313205139.2950-1-antonio@openvpn.net>
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


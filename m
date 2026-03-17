Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C38A3A6F0D
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744039; cv=none; b=fkxDTB2Lbyr7zpzoZG3eoI83QA6jPgoghw+tKjfFNhV04QmI9c4xsHg+I1moBrQMkXgFv8ccvtPob+lb5B2ErNHTgr1Cz81hkG9sVtTeJstkDNS3ThbUKEMZJ74iXonCsdn6vkNkS9WutgmirZklf0i5YNWNMKTd39IOzx5rjSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744039; c=relaxed/simple;
	bh=xyWyAy3pcgeEejrj5bVkSNG0wtvU0GWpsYnYSFmuYZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQaTrvmFqPpq9frwzNawJuTaRA6Ay3BwYb9yw5LAJBsw3P77uA2/YJ2FxmOQUDkBQqoLoVXi3F+xn4lxBNndoYqcWPs+GB816E9JM3hoXJEde27xGlqZollCgLBfMsU86f0R4NBkh0mSMtvBUg1Bn1mVUAhotvyqL6ZIwuQnCPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=TPXhwY1m; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="TPXhwY1m"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so6269466f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773744036; x=1774348836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELHOmGcrTJbgZ+WLii3ZUyRxuYmuu1z58zScvLpmqNw=;
        b=TPXhwY1mtaEskQJYpXcIBn3M993df+qR2w6I9R3xGqYUcwoU0CQQb3CVOJy5lX5V7d
         kkNNrvcxMSqi1me2+IA0IAMa7F77KNVSvbUvGHGnWpvAoKp6iXfjpg32l0SGUmFq+alY
         DUH/Z1/Ec8jcToPnLNDqN7V3R7aruutIvkmAbUZtnlLVzeKhmJyjwpMqqYHGDLK4kDle
         ET58HhFwMj4Bns698ydEgqdhMQfgMbRypsUHgmkDVUA55AFfcoH0j3Hv59BVHqpZSv+3
         EnqWiaF11VcDwYrUfOdUiBBOvI8p8WsbbztGdIoKxyA4bOaLVKxzXxBDzfkccqMJqo+1
         CLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744036; x=1774348836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELHOmGcrTJbgZ+WLii3ZUyRxuYmuu1z58zScvLpmqNw=;
        b=ZtdTOzMyrK3G7hAVgdERl6ViEIodelpVfFq9iYvOZw91qrtRQ4vZg9U+5pFHQkoSu/
         ShhhljLajAX5SP6KV41sBrKtmd2Y7hnK8R9UETsLXXIbaOOFkexOt5oZtqA3bXXXfBfi
         rf6I4d7U+wsfVO0DRp3RtdMZn7Gs/G2t6zbvLFlr/f8pbio85x4PF7LKBfZ2HbHJPZ9M
         V+rMLsBDut6XOUiPcWeOJUvY5Yis931LshWXxt+GSuNLTUwbp95iwZA7yJrCjJilQsoH
         HOrLqYW4hyWz6+UfA3wplfLTNYqmwUaXO4OKVKScrm0O+wIgBK+Q2aB1G9Z4KGY4AxmV
         i77g==
X-Forwarded-Encrypted: i=1; AJvYcCVo+mLOGL/Y+3MoRA2Xtm4DEsyDKS8X51jESigmvzm6SiLlslsFWWqamYWqpIhHpkY/JBkmYZcQp6DXoWYyK1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYLdlzMobb0RGtOeKydql5kqi4dctfcZITpgKESjepdkBQlSF
	z20VksdIX+ZxqW/Xm26oLLC99J0X4lZgl4q+cAIG3RDInkVwCzhagVxmM4LSReNSihHgd4YxWZ8
	XpQqhme7OEu6pgpwFnfqLk+Ows5UigBOBBG2UIrtz6iYrBA1argwW0d6bNmxVaMw=
X-Gm-Gg: ATEYQzzOL11wC6tK9l9fi4gLhemvaFUg9Zk838iEdaQTv+s+m0Crfu8zOTXutT8/2f3
	Cqf+YG6CHZTYphlTydAiiHzogOpgDQKt0VeHXY5Sg3RzwMoGLFV/GEfgbB2TyR8GHVVgwDyICSO
	73PfazRtDVWsKDbcVL+SV7eoZriQlQ0h3Yc1aqK98jiyXPtxqV3ePBT/12hs9IxQq1Olwlw7wQO
	VAxV0ACIZo3r4ng5QVcbF2Y+MH9OohTZbhhrjmz/3cVX/wdI7qgHR8A7fg2FreHaZ4ltILvW/37
	15MMc6KAvvqndCVNQZSGZVkv77+owe/YndzNAG9AtbDsMSl6UxaW+zUyVdCw8X6DMLN3OITG774
	oHrrrewixDPQ0LfuscLfQSkQVowe6ydn4/26CCEvRPu5j9pLaaRRfnr52FZjTa3mwubLYUmZb9M
	2FxCV9KcNFSIbMWXQ8DGZ758ZMwAC2pdrptnQ=
X-Received: by 2002:a5d:5c89:0:b0:43b:4625:5933 with SMTP id ffacd0b85a97d-43b46255a29mr10128979f8f.30.1773744034261;
        Tue, 17 Mar 2026 03:40:34 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:4f22:3f9:13dd:cf23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm49948215f8f.31.2026.03.17.03.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:40:33 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	horms@kernel.org,
	Antonio Quartulli <antonio@openvpn.net>
Subject: [PATCH net-next 5/9] selftests: ovpn: add notification parsing and matching
Date: Tue, 17 Mar 2026 11:40:19 +0100
Message-ID: <20260317104023.192548-6-antonio@openvpn.net>
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

To verify that netlink notifications are correctly emitted and contain
the expected fields, this commit uses the tools/net/ynl/pyynl/cli.py
script to create multicast listeners. These listeners record the
captured notifications to a JSON file, which is later compared to the
expected output.

Cc: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org
Cc: horms@kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 tools/testing/selftests/net/ovpn/Makefile     |  9 ++++-
 tools/testing/selftests/net/ovpn/common.sh    | 34 +++++++++++++++++--
 .../selftests/net/ovpn/json/peer0-float.json  |  9 +++++
 .../selftests/net/ovpn/json/peer0.json        |  6 ++++
 .../selftests/net/ovpn/json/peer1-float.json  |  1 +
 .../selftests/net/ovpn/json/peer1.json        |  1 +
 .../selftests/net/ovpn/json/peer2-float.json  |  1 +
 .../selftests/net/ovpn/json/peer2.json        |  1 +
 .../selftests/net/ovpn/json/peer3-float.json  |  1 +
 .../selftests/net/ovpn/json/peer3.json        |  1 +
 .../selftests/net/ovpn/json/peer4-float.json  |  1 +
 .../selftests/net/ovpn/json/peer4.json        |  1 +
 .../selftests/net/ovpn/json/peer5-float.json  |  1 +
 .../selftests/net/ovpn/json/peer5.json        |  1 +
 .../selftests/net/ovpn/json/peer6-float.json  |  1 +
 .../selftests/net/ovpn/json/peer6.json        |  1 +
 .../testing/selftests/net/ovpn/tcp_peers.txt  |  1 +
 tools/testing/selftests/net/ovpn/test.sh      |  8 +++++
 18 files changed, 76 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer0-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer0.json
 create mode 120000 tools/testing/selftests/net/ovpn/json/peer1-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer1.json
 create mode 120000 tools/testing/selftests/net/ovpn/json/peer2-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer2.json
 create mode 120000 tools/testing/selftests/net/ovpn/json/peer3-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer3.json
 create mode 120000 tools/testing/selftests/net/ovpn/json/peer4-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer4.json
 create mode 120000 tools/testing/selftests/net/ovpn/json/peer5-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer5.json
 create mode 120000 tools/testing/selftests/net/ovpn/json/peer6-float.json
 create mode 100644 tools/testing/selftests/net/ovpn/json/peer6.json

diff --git a/tools/testing/selftests/net/ovpn/Makefile b/tools/testing/selftests/net/ovpn/Makefile
index e59271a25d76..88891d9f5c56 100644
--- a/tools/testing/selftests/net/ovpn/Makefile
+++ b/tools/testing/selftests/net/ovpn/Makefile
@@ -23,7 +23,14 @@ endif
 LDLIBS += $(NL_LDLIBS)
 
 
-TEST_FILES = common.sh
+TEST_FILES = \
+	common.sh \
+	data64.key \
+	json \
+	tcp_peers.txt \
+	udp_peers.txt \
+	../../../../net/ynl/pyynl/cli.py \
+# end of TEST_FILES
 
 TEST_PROGS := \
 	test-chachapoly.sh \
diff --git a/tools/testing/selftests/net/ovpn/common.sh b/tools/testing/selftests/net/ovpn/common.sh
index 88869c675d03..df0a541148fe 100644
--- a/tools/testing/selftests/net/ovpn/common.sh
+++ b/tools/testing/selftests/net/ovpn/common.sh
@@ -7,12 +7,18 @@
 UDP_PEERS_FILE=${UDP_PEERS_FILE:-udp_peers.txt}
 TCP_PEERS_FILE=${TCP_PEERS_FILE:-tcp_peers.txt}
 OVPN_CLI=${OVPN_CLI:-./ovpn-cli}
+YNL_CLI=${YNL_CLI:-../../../../net/ynl/pyynl/cli.py}
 ALG=${ALG:-aes}
 PROTO=${PROTO:-UDP}
 FLOAT=${FLOAT:-0}
 
+JQ_FILTER='map(select(.msg.peer | has("remote-ipv6") | not)) |
+	map(del(.msg.ifindex)) | sort_by(.msg.peer.id)[]'
 LAN_IP="11.11.11.11"
 
+declare -A tmp_jsons=()
+declare -A listener_pids=()
+
 create_ns() {
 	ip netns add peer${1}
 }
@@ -48,6 +54,14 @@ setup_ns() {
 	ip -n peer${1} link set tun${1} up
 }
 
+setup_listener() {
+	file=$(mktemp)
+	PYTHONUNBUFFERED=1 ip netns exec peer${p} ${YNL_CLI} --family ovpn \
+		--subscribe peers --output-json --duration 40 > ${file} &
+	listener_pids[$1]=$!
+	tmp_jsons[$1]="${file}"
+}
+
 add_peer() {
 	if [ "${PROTO}" == "UDP" ]; then
 		if [ ${1} -eq 0 ]; then
@@ -82,6 +96,24 @@ add_peer() {
 	fi
 }
 
+compare_ntfs() {
+	if [ ${#tmp_jsons[@]} -gt 0 ]; then
+		[ "$FLOAT" == 1 ] && suffix="-float"
+		expected="json/peer${1}${suffix}.json"
+		received="${tmp_jsons[$1]}"
+
+		kill -TERM ${listener_pids[$1]} || true
+		wait ${listener_pids[$1]} || true
+		printf "Checking notifications for peer ${1}... "
+		if diff <(jq -s "${JQ_FILTER}" ${expected}) \
+			<(jq -s "${JQ_FILTER}" ${received}); then
+			echo "OK"
+		fi
+
+		rm -f ${received} || true
+	fi
+}
+
 cleanup() {
 	# some ovpn-cli processes sleep in background so they need manual poking
 	killall $(basename ${OVPN_CLI}) 2>/dev/null || true
@@ -104,5 +136,3 @@ if [ "${PROTO}" == "UDP" ]; then
 else
 	NUM_PEERS=${NUM_PEERS:-$(wc -l ${TCP_PEERS_FILE} | awk '{print $1}')}
 fi
-
-
diff --git a/tools/testing/selftests/net/ovpn/json/peer0-float.json b/tools/testing/selftests/net/ovpn/json/peer0-float.json
new file mode 100644
index 000000000000..682fa58ad4ea
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer0-float.json
@@ -0,0 +1,9 @@
+{"name": "peer-float-ntf", "msg": {"ifindex": 0, "peer": {"id": 1, "remote-ipv4": "10.10.1.3", "remote-port": 1}}}
+{"name": "peer-float-ntf", "msg": {"ifindex": 0, "peer": {"id": 2, "remote-ipv4": "10.10.2.3", "remote-port": 1}}}
+{"name": "peer-float-ntf", "msg": {"ifindex": 0, "peer": {"id": 3, "remote-ipv4": "10.10.3.3", "remote-port": 1}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "userspace", "id": 1}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "userspace", "id": 2}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 3}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 4}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 5}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 6}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer0.json b/tools/testing/selftests/net/ovpn/json/peer0.json
new file mode 100644
index 000000000000..7c46a33d5ecd
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer0.json
@@ -0,0 +1,6 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "userspace", "id": 1}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "userspace", "id": 2}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 3}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 4}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 5}}}
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 6}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer1-float.json b/tools/testing/selftests/net/ovpn/json/peer1-float.json
new file mode 120000
index 000000000000..d28c328d1452
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer1-float.json
@@ -0,0 +1 @@
+peer1.json
\ No newline at end of file
diff --git a/tools/testing/selftests/net/ovpn/json/peer1.json b/tools/testing/selftests/net/ovpn/json/peer1.json
new file mode 100644
index 000000000000..5da4ea9d51fb
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer1.json
@@ -0,0 +1 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "userspace", "id": 1}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer2-float.json b/tools/testing/selftests/net/ovpn/json/peer2-float.json
new file mode 120000
index 000000000000..b9f09980aaa0
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer2-float.json
@@ -0,0 +1 @@
+peer2.json
\ No newline at end of file
diff --git a/tools/testing/selftests/net/ovpn/json/peer2.json b/tools/testing/selftests/net/ovpn/json/peer2.json
new file mode 100644
index 000000000000..8f6db4f8c2ac
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer2.json
@@ -0,0 +1 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "userspace", "id": 2}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer3-float.json b/tools/testing/selftests/net/ovpn/json/peer3-float.json
new file mode 120000
index 000000000000..2700b55bcf2e
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer3-float.json
@@ -0,0 +1 @@
+peer3.json
\ No newline at end of file
diff --git a/tools/testing/selftests/net/ovpn/json/peer3.json b/tools/testing/selftests/net/ovpn/json/peer3.json
new file mode 100644
index 000000000000..bdabd6fa2e64
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer3.json
@@ -0,0 +1 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 3}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer4-float.json b/tools/testing/selftests/net/ovpn/json/peer4-float.json
new file mode 120000
index 000000000000..460f6c14cd60
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer4-float.json
@@ -0,0 +1 @@
+peer4.json
\ No newline at end of file
diff --git a/tools/testing/selftests/net/ovpn/json/peer4.json b/tools/testing/selftests/net/ovpn/json/peer4.json
new file mode 100644
index 000000000000..c3734bb9251b
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer4.json
@@ -0,0 +1 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 4}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer5-float.json b/tools/testing/selftests/net/ovpn/json/peer5-float.json
new file mode 120000
index 000000000000..0f725c50ce19
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer5-float.json
@@ -0,0 +1 @@
+peer5.json
\ No newline at end of file
diff --git a/tools/testing/selftests/net/ovpn/json/peer5.json b/tools/testing/selftests/net/ovpn/json/peer5.json
new file mode 100644
index 000000000000..46c4a348299d
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer5.json
@@ -0,0 +1 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 5}}}
diff --git a/tools/testing/selftests/net/ovpn/json/peer6-float.json b/tools/testing/selftests/net/ovpn/json/peer6-float.json
new file mode 120000
index 000000000000..4d9ded3e0a84
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer6-float.json
@@ -0,0 +1 @@
+peer6.json
\ No newline at end of file
diff --git a/tools/testing/selftests/net/ovpn/json/peer6.json b/tools/testing/selftests/net/ovpn/json/peer6.json
new file mode 100644
index 000000000000..aa30f2cff625
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/json/peer6.json
@@ -0,0 +1 @@
+{"name": "peer-del-ntf", "msg": {"ifindex": 0, "peer": {"del-reason": "expired", "id": 6}}}
diff --git a/tools/testing/selftests/net/ovpn/tcp_peers.txt b/tools/testing/selftests/net/ovpn/tcp_peers.txt
index d753eebe8716..b8f3cb33eaa2 100644
--- a/tools/testing/selftests/net/ovpn/tcp_peers.txt
+++ b/tools/testing/selftests/net/ovpn/tcp_peers.txt
@@ -3,3 +3,4 @@
 3 5.5.5.4
 4 5.5.5.5
 5 5.5.5.6
+6 5.5.5.7
diff --git a/tools/testing/selftests/net/ovpn/test.sh b/tools/testing/selftests/net/ovpn/test.sh
index e8acdc303307..c2904342ec57 100755
--- a/tools/testing/selftests/net/ovpn/test.sh
+++ b/tools/testing/selftests/net/ovpn/test.sh
@@ -17,6 +17,10 @@ for p in $(seq 0 ${NUM_PEERS}); do
 	create_ns ${p}
 done
 
+for p in $(seq 0 ${NUM_PEERS}); do
+	setup_listener ${p}
+done
+
 for p in $(seq 0 ${NUM_PEERS}); do
 	setup_ns ${p} 5.5.5.$((${p} + 1))/24 ${MTU}
 done
@@ -112,6 +116,10 @@ for p in $(seq 3 ${NUM_PEERS}); do
 done
 sleep 5
 
+for p in $(seq 0 ${NUM_PEERS}); do
+	compare_ntfs ${p}
+done
+
 cleanup
 
 modprobe -r ovpn || true
-- 
2.52.0


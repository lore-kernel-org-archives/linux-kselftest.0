Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837338239E
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 23:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665627; cv=none; b=f/14x6bmDY24YRQRGxVgOKLPMav0lK/tqGyYneLxzXyp3hC8dQDeOgEiJE0tgFqh/2y/YCwpHjx2PSj2j9gTA9B2otv3QIZl0vBF9fof2cIovIxNB9RJgq/dJKN7genaWhsaplJXgo7Led+RruD7/kZ/OIBWF1hF4U7ANT0I5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665627; c=relaxed/simple;
	bh=VeDLmxZ/xJxnV9DjcdhWQ3rLgQRMFf5ddCJ4VtNheHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePg3ccIBWJRfsXCrHNKXdCZ/PMzcWb1rl+z8ZFrnMclwYVdrJyLqXTPSDdkCBC3HJvkj2JyZYic02e6GeHNq7JrN93qx/TlbQCttVFT57RHXswnDCTTnlx+ah5Vv0q2VHqT3qRU6zQ+rFZ4zaAkKU4NdHtKqzK9ZLgNVBxfApS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=XSr4Pyk9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="XSr4Pyk9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371bb515eso110263515e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 15:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1772665624; x=1773270424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vbXEfAgKTW3p+IJ6sjASNkE20Q/iJvji/4qE+bqJgA=;
        b=XSr4Pyk9r6wbyxwOvxFI9/KxiKD5xrD/OWy9GtFzaC21jDbgNRzPLos3+bcZ4D77h5
         9K+OvpITq2ni4r5XHoEcN+CED6SN+6jOQ4ryUF7Z8GxYNJV4TeLDpbKD6EksFiato++8
         Ho/Xz91vy2IAUEQa6/Fz06t8Fy8FwqEgml/hwF2h70mm+EYTNHO4c2pzk7ct7ewtZRAu
         OI0jZGS2a9ehkGi5PWDNopL5NhsnH8WFGfzdCssDx4RtQRWy9icwdUbGJ+NMbEiwWvWX
         LzAZYx2b5WbW8C6QyLglcuhN0fKvBDnIDtpRqyd+HuwAqJ816eIwuyFzXuVREJiERNrK
         sI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665624; x=1773270424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1vbXEfAgKTW3p+IJ6sjASNkE20Q/iJvji/4qE+bqJgA=;
        b=va+tvHqZk/x37+n759lzEQllWPmyE2SVS8H5U9H1d1wWdXf/spivKi9JFiUbvdAXLA
         L6ZXOrp0Ee5wT7gTO9GdLKoqnjyrbM7AlMCRy1ms+p+AT1VxuqKJUqtSSe9QppHi5Hyx
         cIjIoI5Eu60+980TF+9XCKcJiqIYwV6Ml6ZGjsD9iLdCLXd0qIiXSN3UiY8SguICrvMA
         eL+8PINsMbmoOoDxnmmgTurOyEBpS/PFlEMX8d8c3gk6s3Rf2ey7qnjA+gCGVeVpYeui
         AUKOqx+uHfj0pHJ6HhhXsYQxLQa8nekcdsaQc7tBOOYE6wIYw79ifqZ9tcT8NxvPIwpi
         iKxA==
X-Forwarded-Encrypted: i=1; AJvYcCUZbRpjqGsZ5SNrYehfFo0CFZ/fhDJAHD7ZN5UpT/MABEiZj0NklTk/ndv1wNf/L/r393eXgVSYmSb6+W9l1bo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLacEEjw/0yoL9B01UbNAAyrZRcdSWRgGuWZudcEBHvDQnLwYM
	FbK77Nryjm353Qh0GdsBVfFAXwYHAY3CLeheuvTUHpn89rEo3vEod+xS0qS24QnyJRwC7bZmxLE
	kmVqcSh7EEAZRV373mEg81kbpCfPRo7Z1vGC5O82YF34wkUif7fu2KcOdpeCtMWY=
X-Gm-Gg: ATEYQzw8ByKmlMq2SGKoWx1IjKpyhZLJa49zSp81O6xhfEAOpel7qFVQ8I4zfoo6AgF
	HjOZK9jOj69yFmC+hMl5RAm/u0FPDtsRe3RqTpHXUa6O5WDT7zcnHTllfn4Mx+dDJV7EKfm27If
	n+659qqNYKzDHKB1V21nqObB2ADVzBdgaw9AOh4otM2QWAmNhH5qfP6BDOmB0gr5aL6KfexDRwb
	1DP9T9ol/yRp14+n6s2DN0UPwlQBZUheYnT4KpXRTS1KqumtTg0cE9G1GumL0kmKEKgyidM6THD
	fFyXph36BNP4e7m7v5uwePU3jAIz++Ol89TWsDbc3ltw4trIeCNBSzmkvP67th6e43a5uony0Mj
	KCaRrHwAcunk1qSTwoBhIeJO84zx2kVbUDZYwF3JBia6IMWhaOyp0vsQr/iLcXe/1vrDpPBlrRp
	/W3eRJqzRXLhO4GhLzIxt0hEzWILaRMLBM0ik=
X-Received: by 2002:a05:600c:4f4c:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-48519849bd4mr67391235e9.10.1772665623909;
        Wed, 04 Mar 2026 15:07:03 -0800 (PST)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:880:4d86:fc53:5d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187caf9fsm87713475e9.7.2026.03.04.15.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:07:03 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Ralf Lici <ralf@mandelbit.com>,
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
Date: Thu,  5 Mar 2026 00:06:23 +0100
Message-ID: <20260304230643.1014-6-antonio@openvpn.net>
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

To verify that netlink notifications are correctly emitted and contain
the expected fields, this commit uses the tools/net/ynl/pyynl/cli.py
script to create multicast listeners. These listeners record the
captured notifications to a JSON file, which is later compared to the
expected output.

Since this change introduces additional dependencies (jq, pyyaml,
jsonschema), the tests are configured to check for their presence and
conditionally skip the notification check if they are missing.

Cc: linux-kselftest@vger.kernel.org
Cc: shuah@kernel.org
Cc: horms@kernel.org
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 .../selftests/net/ovpn/check_requirements.py  | 47 +++++++++++++++++++
 tools/testing/selftests/net/ovpn/common.sh    | 35 ++++++++++++++
 .../selftests/net/ovpn/json/peer0-float.json  |  9 ++++
 .../selftests/net/ovpn/json/peer0.json        |  6 +++
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
 .../selftests/net/ovpn/requirements.txt       |  1 +
 .../testing/selftests/net/ovpn/tcp_peers.txt  |  1 +
 tools/testing/selftests/net/ovpn/test.sh      | 10 ++++
 19 files changed, 121 insertions(+)
 create mode 100755 tools/testing/selftests/net/ovpn/check_requirements.py
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
 create mode 120000 tools/testing/selftests/net/ovpn/requirements.txt

diff --git a/tools/testing/selftests/net/ovpn/check_requirements.py b/tools/testing/selftests/net/ovpn/check_requirements.py
new file mode 100755
index 000000000000..161396989380
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/check_requirements.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2020-2026 OpenVPN, Inc.
+#
+#	Author: Antonio Quartulli <antonio@openvpn.net>
+#		    Ralf Lici <ralf@mandelbit.com>
+
+"""Check whether YNL python requirements are installed and version-compatible."""
+
+import sys
+from importlib.metadata import version, PackageNotFoundError
+from packaging.requirements import Requirement, InvalidRequirement
+from packaging.version import Version, InvalidVersion
+
+
+def check_requirements(requirements_path):
+    """Return dependency issues from requirements_path, or an empty list."""
+    issues = []
+    with open(requirements_path, encoding="utf-8") as f:
+        for line in f:
+            line = line.strip()
+            if not line or line.startswith("#"):
+                continue
+            try:
+                req = Requirement(line)
+                installed_version = Version(version(req.name))
+                if req.specifier and installed_version not in req.specifier:
+                    issues.append(
+                        f"{req.name}=={installed_version} does not satisfy {req.specifier}"
+                    )
+            except PackageNotFoundError:
+                issues.append(f"{req.name} is not installed")
+            except InvalidVersion:
+                issues.append(f"{req.name} has an invalid installed version")
+            except InvalidRequirement as e:
+                issues.append(f"Could not parse requirement line: '{line}' ({e})")
+    return issues
+
+
+problems = check_requirements("requirements.txt")
+if problems:
+    print("Dependency issues found:")
+    for p in problems:
+        print(" -", p)
+    sys.exit(1)
+else:
+    sys.exit(0)
diff --git a/tools/testing/selftests/net/ovpn/common.sh b/tools/testing/selftests/net/ovpn/common.sh
index 88869c675d03..f2b58361255d 100644
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
@@ -48,6 +54,18 @@ setup_ns() {
 	ip -n peer${1} link set tun${1} up
 }
 
+has_listener_requirements() {
+	./check_requirements.py && jq --version >/dev/null 2>&1
+}
+
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
@@ -82,6 +100,23 @@ add_peer() {
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
+		diff <(jq -s "${JQ_FILTER}" ${expected}) \
+			<(jq -s "${JQ_FILTER}" ${received})
+		echo "OK"
+
+		rm -f ${received} || true
+	fi
+}
+
 cleanup() {
 	# some ovpn-cli processes sleep in background so they need manual poking
 	killall $(basename ${OVPN_CLI}) 2>/dev/null || true
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
diff --git a/tools/testing/selftests/net/ovpn/requirements.txt b/tools/testing/selftests/net/ovpn/requirements.txt
new file mode 120000
index 000000000000..da9fd54081c5
--- /dev/null
+++ b/tools/testing/selftests/net/ovpn/requirements.txt
@@ -0,0 +1 @@
+../../../../net/ynl/requirements.txt
\ No newline at end of file
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
index e8acdc303307..3ec036fd7ebc 100755
--- a/tools/testing/selftests/net/ovpn/test.sh
+++ b/tools/testing/selftests/net/ovpn/test.sh
@@ -17,6 +17,12 @@ for p in $(seq 0 ${NUM_PEERS}); do
 	create_ns ${p}
 done
 
+if has_listener_requirements; then
+	for p in $(seq 0 ${NUM_PEERS}); do
+		setup_listener ${p}
+	done
+fi
+
 for p in $(seq 0 ${NUM_PEERS}); do
 	setup_ns ${p} 5.5.5.$((${p} + 1))/24 ${MTU}
 done
@@ -112,6 +118,10 @@ for p in $(seq 3 ${NUM_PEERS}); do
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


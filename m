Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C3274670
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 07:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991088; cv=none; b=ObDGvCGRQW1pwoWWzffMno/TFOgFxMj+fExbOeWg+r6zliG3ozeG1kqkzFd4EzGDGsBvcc35Hlnh+qWcQeud8A8d8VjJW8MJQzXUTBj0uTN5guiS6EINpYKYbkNLOOkypNZD7GGFbVHCuivOjxSa6NAew86f+xALRhaejchjmhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991088; c=relaxed/simple;
	bh=ErVOA8JE+DS4aIaxQjhbKTrzl+8zQ8UKzp3fd+qXOIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLhzY+qjRj8Oun4LyY2T0oW/DStxlIgeQm9QCwWkc8p5WsmPxYUZbsAEir+MqNeRCBzuYp6SbAOMbI6TJMWyoN86VMrthXzXaSl19D69x9Dr6mpXqswxKTcKTUMVHMRlMPRI9HKDdoIgVVL2MseMaygn9CCRRbvQvcSn5AO/JzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvhgSUne; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvhgSUne"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so3379213a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773991085; x=1774595885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iEDyL2ovMbppv+kKspNCEoyFDlT/jpSI/u8aCoC/3/I=;
        b=bvhgSUneRO1bYN9naWlouFpcxv+BX5evcTg1a87i+7bISEnnJ9zUv+oPBC+MupJUUH
         Jol/jgsD0gFBrfVd0ncwlKkv9jeW7Ef6Pb3uYBnq+ccvyJKNl+JPIUa6PRN0vWGpZLnI
         kCA4NhSiVJ+rMqmoaPVQbXppkMoSTsTT4QjHnonVMGjuf4gzrJg0zQgf3em3VORV6EME
         dZKgmuFMaAlh53Jeej1AYJ4BRZqQiSTJQ1IQh8eFGaBMaGat0HDMiw5N/R5y5CyQ65zn
         cXjNVCjqP3mTqQOsVD4r5tLlSkjQTaBKMIK2U1Pkj5NV/b2uEXEfpNeBRUqlgcCvLbUM
         140w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991085; x=1774595885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEDyL2ovMbppv+kKspNCEoyFDlT/jpSI/u8aCoC/3/I=;
        b=PNGlTIDTg1dBna4ZaOrIsm+rjArP5bVgYbBFFeb7VkeXqC/E2tWecjLXLIggEBhnBH
         FHeAShWvupPe0jrpvVvNGyZsHMGTx8F/N2rYo3iGDZRTq3u7mR7CS/hm7J27GcQAHM2/
         6EXoqS22wbded2r75r2/e+zad9Tj0ZgpJesm1o51r2ivUYD72XttRCKdt3xHcwGL0snE
         1RlyWRkhz41toXpjnxx4C08qwNHTA4z2Mli2L9igUGkuimIM8a3yrdfs8tBxnFRJbt/L
         GNSMlgj8feAr1YjsHjwhGN7LesFCiCMMnuLDuDnN0ODoUd7UD/57KRmy0Ll9B9YGQqsk
         WZbA==
X-Forwarded-Encrypted: i=1; AJvYcCVSENorxhJVo+kTYplKMF/9J0wAHNgmKkrxUwrv425PNMZJ1vHilUKf+DdleH3/IUGecU0KGSvSFRuDtiWNYTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/b1+UnaI9nxNkpwaOQFFFWcYwbaHhYba3cGM9cqPwATbOv66+
	UBXjat4PR8VSLTeXUEpKrxUWbgygVuF+s/mpsBjNCurEtvxP0zBTVJt9
X-Gm-Gg: ATEYQzwyCm1g6XLUS1NQ7zO/IiY6OWRO7SFRsUwlJ2+/dYk86i/fl2frZJeiCTCxSFC
	WJk86QWYHDYRlxb4IXU1/Oz7cYHxP5V0ClRGQwyfND7L6i7APBHAAZofawaCFoLO/wxMa/ldnPE
	vs1GCuXRlTTj4CMuMIo8WOErKNCCK/ODIW2vtHQty2LMlJyUX3IltyvnksdqOrDaWvdfYlcsxcm
	3jNSMUKVVG25SNt2urD36jERlrNMybJqjBUVeUVRNb97f2vEblRBQyOiS9H6pzJbg30iacOcTPR
	iYAIHx68OL2C3TcEMeSqh3+RCZmpfdIOf0c9LPU8OSrmbcjZU1eShZ+J3LHKktiwU/wwetz56EH
	8GBj457/OMszEVghmFxUdNEPTHZgzD0VaXNh6Mc9GsIXvpiGLJ+cdIa/9URweLCsZsd9gnlY2
X-Received: by 2002:a05:6402:46c9:b0:667:f3dd:6065 with SMTP id 4fb4d7f45d1cf-668cc2b8c3emr978060a12.1.1773991084451;
        Fri, 20 Mar 2026 00:18:04 -0700 (PDT)
Received: from gmail.com ([2a09:bac1:5540::49b:47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d1cc5d16sm1087043a12.16.2026.03.20.00.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:18:03 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH net-next] selftests: net: add tests for PPP
Date: Fri, 20 Mar 2026 15:17:54 +0800
Message-ID: <20260320071755.483733-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ping and iperf3 tests for ppp_async.c and pppoe.c.

Signed-off-by: Qingfang Deng <dqfext@gmail.com>
---
 MAINTAINERS                                   |  1 +
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
 tools/testing/selftests/net/ppp/config        |  8 ++++
 tools/testing/selftests/net/ppp/ppp_async.sh  | 37 +++++++++++++++++
 tools/testing/selftests/net/ppp/ppp_common.sh | 40 +++++++++++++++++++
 .../selftests/net/ppp/pppoe-server-options    |  2 +
 tools/testing/selftests/net/ppp/pppoe.sh      | 36 +++++++++++++++++
 8 files changed, 140 insertions(+)
 create mode 100644 tools/testing/selftests/net/ppp/Makefile
 create mode 100644 tools/testing/selftests/net/ppp/config
 create mode 100755 tools/testing/selftests/net/ppp/ppp_async.sh
 create mode 100644 tools/testing/selftests/net/ppp/ppp_common.sh
 create mode 100644 tools/testing/selftests/net/ppp/pppoe-server-options
 create mode 100755 tools/testing/selftests/net/ppp/pppoe.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index a09bf30a057d..d553437d5ac1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21078,6 +21078,7 @@ PPP PROTOCOL DRIVERS AND COMPRESSORS
 L:	linux-ppp@vger.kernel.org
 S:	Orphan
 F:	drivers/net/ppp/ppp_*
+F:	tools/testing/selftests/net/ppp/
 
 PPS SUPPORT
 M:	Rodolfo Giometti <giometti@enneenne.com>
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..65f84e8a0cf0 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -78,6 +78,7 @@ TARGETS += net/netfilter
 TARGETS += net/openvswitch
 TARGETS += net/ovpn
 TARGETS += net/packetdrill
+TARGETS += net/ppp
 TARGETS += net/rds
 TARGETS += net/tcp_ao
 TARGETS += nolibc
diff --git a/tools/testing/selftests/net/ppp/Makefile b/tools/testing/selftests/net/ppp/Makefile
new file mode 100644
index 000000000000..d2cbd6099255
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+top_srcdir = ../../../../..
+
+TEST_PROGS := \
+	ppp_async.sh \
+	pppoe.sh
+# end of TEST_PROGS
+
+TEST_FILES := \
+	ppp_common.sh \
+	pppoe-server-options
+# end of TEST_FILES
+
+include ../../lib.mk
diff --git a/tools/testing/selftests/net/ppp/config b/tools/testing/selftests/net/ppp/config
new file mode 100644
index 000000000000..7053aa9d8d74
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/config
@@ -0,0 +1,8 @@
+CONFIG_PACKET=y
+CONFIG_PPP=m
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPPOE=m
+CONFIG_PPPOE_HASH_BITS_4=y
+CONFIG_TTY=y
diff --git a/tools/testing/selftests/net/ppp/ppp_async.sh b/tools/testing/selftests/net/ppp/ppp_async.sh
new file mode 100755
index 000000000000..5c0eb84945e8
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_async.sh
@@ -0,0 +1,37 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+source ppp_common.sh
+
+# Temporary files for PTY symlinks
+TTY_SERVER=$(mktemp -u /tmp/ppp_async_server.XXXXXX)
+TTY_CLIENT=$(mktemp -u /tmp/ppp_async_client.XXXXXX)
+
+cleanup() {
+	cleanup_all_ns
+	[ -n "$SOCAT_PID" ] && kill "$SOCAT_PID" 2>/dev/null || true
+}
+
+trap cleanup EXIT
+
+require_command socat
+ppp_common_init
+
+# Create the virtual serial device
+socat -d PTY,link="$TTY_SERVER",rawer PTY,link="$TTY_CLIENT",rawer &
+SOCAT_PID=$!
+
+# Wait for symlinks to be created
+slowwait 5 [ -L "$TTY_SERVER" ]
+
+# Start the PPP Server
+ip netns exec "$NS_SERVER" pppd "$TTY_SERVER" 115200 \
+	"$IP_SERVER":"$IP_CLIENT" \
+	local noauth nodefaultroute debug
+
+# Start the PPP Client
+ip netns exec "$NS_CLIENT" pppd "$TTY_CLIENT" 115200 \
+	local noauth updetach nodefaultroute debug
+
+ppp_test_connectivity
diff --git a/tools/testing/selftests/net/ppp/ppp_common.sh b/tools/testing/selftests/net/ppp/ppp_common.sh
new file mode 100644
index 000000000000..b34d4ab0effe
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_common.sh
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0
+
+source ../lib.sh
+
+IP_SERVER="192.168.200.1"
+IP_CLIENT="192.168.200.2"
+
+ppp_common_init() {
+	# Package requirements
+	require_command pppd
+	require_command iperf3
+
+	# Check for root privileges
+	if [ "$(id -u)" -ne 0 ];then
+		echo "SKIP: Need root privileges"
+		exit $ksft_skip
+	fi
+
+	# Namespaces
+	setup_ns NS_SERVER NS_CLIENT
+}
+
+ppp_check_addr() {
+	dev=$1
+	addr=$2
+	ns=$3
+	ip -netns "$ns" -4 addr show dev "$dev" 2>/dev/null | grep -q "$addr"
+	return $?
+}
+
+ppp_test_connectivity() {
+	slowwait 10 ppp_check_addr "ppp0" "$IP_CLIENT" "$NS_CLIENT"
+
+	ip netns exec "$NS_CLIENT" ping -c 3 "$IP_SERVER"
+
+	ip netns exec "$NS_SERVER" iperf3 -s -1 -D
+	wait_local_port_listen "$NS_SERVER" 5201 tcp
+
+	ip netns exec "$NS_CLIENT" iperf3 -c "$IP_SERVER" -Z -t 2
+}
diff --git a/tools/testing/selftests/net/ppp/pppoe-server-options b/tools/testing/selftests/net/ppp/pppoe-server-options
new file mode 100644
index 000000000000..66c8c9d319e9
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe-server-options
@@ -0,0 +1,2 @@
+noauth
+noipdefault
diff --git a/tools/testing/selftests/net/ppp/pppoe.sh b/tools/testing/selftests/net/ppp/pppoe.sh
new file mode 100755
index 000000000000..0ebedfe3eabe
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe.sh
@@ -0,0 +1,36 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+source ppp_common.sh
+
+VETH_SERVER="veth-server"
+VETH_CLIENT="veth-client"
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+require_command pppoe-server
+ppp_common_init
+
+# Create the veth pair
+ip link add "$VETH_SERVER" type veth peer name "$VETH_CLIENT"
+ip link set "$VETH_SERVER" netns "$NS_SERVER"
+ip link set "$VETH_CLIENT" netns "$NS_CLIENT"
+ip -netns "$NS_SERVER" link set "$VETH_SERVER" up
+ip -netns "$NS_CLIENT" link set "$VETH_CLIENT" up
+
+# Start the PPP Server
+ip netns exec "$NS_SERVER" pppoe-server -I "$VETH_SERVER" \
+	-L "$IP_SERVER" -R "$IP_CLIENT" -N 1 -q "$(command -v pppd)" \
+	-k -O "$(pwd)/pppoe-server-options"
+
+# Start the PPP Client
+ip netns exec "$NS_CLIENT" pppd \
+	local debug updetach noipdefault noauth nodefaultroute \
+	plugin pppoe.so nic-"$VETH_CLIENT"
+
+ppp_test_connectivity
-- 
2.43.0


Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F56306B11
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774107985; cv=none; b=KYcd7I323YUE+1eTUV4F9tihB+tN17SajJkNH/v6XcbyN2JUxnKeBo9yxMJRHK9F1vDHAUcqUxa34WS0GqFInQShxp5fqYI/FmPYWS2gSf2HJDfo5LD8C2adlKdwVrBZiwqcvTsx8y15SURmBamBOg5ylYOBAPMcr4l9E5j/m+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774107985; c=relaxed/simple;
	bh=nnxG0eRKYNSthOuI73Ok8N/M8RHRxBwSWGKJ5034GIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=numgudH061NK0QHMkQw/tb6f5DL94qp1D0JVWVCK7zhicx6mEkwlPH6foeS//7g4pzrrWhPgRvbki6B7GiYVwccsElScKwz6Jp5PPaJ6Fb+9AGvH3wsF6rrtxkj3svnPEuL0HvP/QOizHKx1DdTHjFzAZk+OmpP+4nsGhZ445fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCiAtjGc; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCiAtjGc"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6687be9791cso4313222a12.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774107981; x=1774712781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nu3xcczzSYEf5dCv3Y4BzObcBQU5HeHhrYyNdqsbtPY=;
        b=lCiAtjGc9UbqTNdiQkCNTpmvZkkauayS09yi2Jg3uZirbbJXAFUL+mKDEsi4+RziwN
         f6pWwLF9uxJeHn18Mz/UuyrM5WyPJnmN/FDpBtVyMuQTe+L03fqRH0IdQXBX8M9vxXfw
         gk1MNQlDD9tQ8oqTgJcUkNAE3bbePnnskcnxvxYDDiDsmeqXm8nBTG8nrJ+1UEnpsGok
         fJeyhPcicPyryMUtPGMUuvj6OT/3Rd+TtcVDSuYnPgvywEyt+iKmga/f6RXst/7FUNy/
         S9ohe0YEQ7FB8z/TOsgnKzr5vMlPR52URl7e0LOdRKqCw3Na25VadKxNHFq6pU+/4Y3y
         DjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774107981; x=1774712781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu3xcczzSYEf5dCv3Y4BzObcBQU5HeHhrYyNdqsbtPY=;
        b=azPcyHT3cgqX6eOgOUm+6s6h2O/ztzXDnvELTZ0cT5Ido85x+G2zKsno+6hirawhxe
         v6xB6zNUTp6x2P8VroBgFGczTHgF7bCQjb9izX/FcX9WVAgJGnHNzecbLQZV/5bhdEwh
         3lMDzkD0oE5YsdivASl19xjux/WikJLVlNglbsioFLTXvNd/cGcxY7pYptrJaefvqxZu
         Rm9Ip8bBzi/rUkrWxf9EUnSxgN0NcyrXievZ0MT/Rvsir5f7TH7JBBDAunUp8zVkMwKg
         NWSqQ9nNGoVa+1iWMFs2ySoO5SFQVyoCxyHDQrNS+SPJJqqNDGsgX4LGA1ScrwzFyg56
         /n4g==
X-Forwarded-Encrypted: i=1; AJvYcCVd5GOc85XO58HuNuGP2X1yUXfhRqhz0N6Mc9hLpv5Io03rcLsrjt0fHO8Lyer1nA2Zsc0MxH0ayJqgyZp1lJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr4FqsBP7iTjQf6Pk6aSEUfXM6UVIxlRwMcd2Qp807nKLoifDx
	JWQ2VWmy6gdL0iaPuzQfm++DEn7bR/UiLGwIwUi04Jh0EtvLPEWeUnFK
X-Gm-Gg: ATEYQzzelcyUSqbnjpaJCqhreS4JxY25esss2ziFqPrsqROKkVXoeZEaICIz9Feo1q2
	IDXi2SZMGuTnv/8GBrbD8fWhfHM4VfPog65s9VK8+LCQvurKx69kAPT40DQeZeU/6V0Z5uGlwTe
	tqyD7lQSQq3jAUyVsonndzLrNdsdY/NrNFnMSRBORCqkn+oOAbpvNZekwIcCnTAsw5toO5Jw8+b
	Ef7H6MWNKzbnDhRGpRmFj4GFSf/wPqTQxOd5WhRkw4iArotI70tM4EspED7gQgN2c+Kf2+Gm1X7
	kbAnd8UBwRmvLPZzbt2c7fgrm/iEcheIGt2xDcEX1VpT1hY34YABoASKvx4G5sGk8zwBzCxybdC
	E2T3S/tMfMJ74nzG930PF7mp8Bxk+fyEjuPuq8NvvI265ptD2CTLWt//w19KqeAflVqZlEH6/
X-Received: by 2002:a17:906:2746:b0:b97:f9c9:af61 with SMTP id a640c23a62f3a-b982f4e922fmr375345266b.45.1774107980894;
        Sat, 21 Mar 2026 08:46:20 -0700 (PDT)
Received: from gmail.com ([2a09:bac1:5500::49b:47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983e4e9b65sm175140266b.31.2026.03.21.08.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:46:20 -0700 (PDT)
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
Subject: [PATCH net-next v2] selftests: net: add tests for PPP
Date: Sat, 21 Mar 2026 23:46:15 +0800
Message-ID: <20260321154616.2754-1-dqfext@gmail.com>
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
v2: fix shellcheck and add trailing backslashes.
 - https://lore.kernel.org/netdev/20260320071755.483733-1-dqfext@gmail.com/

 MAINTAINERS                                   |  1 +
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
 tools/testing/selftests/net/ppp/config        |  8 ++++
 tools/testing/selftests/net/ppp/ppp_async.sh  | 37 ++++++++++++++++
 tools/testing/selftests/net/ppp/ppp_common.sh | 42 +++++++++++++++++++
 .../selftests/net/ppp/pppoe-server-options    |  2 +
 tools/testing/selftests/net/ppp/pppoe.sh      | 36 ++++++++++++++++
 8 files changed, 142 insertions(+)
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
index 000000000000..b39b0abadde6
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+
+top_srcdir = ../../../../..
+
+TEST_PROGS := \
+	ppp_async.sh \
+	pppoe.sh \
+# end of TEST_PROGS
+
+TEST_FILES := \
+	ppp_common.sh \
+	pppoe-server-options \
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
index 000000000000..9ddfba0f9a05
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_common.sh
@@ -0,0 +1,42 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# shellcheck disable=SC2153
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


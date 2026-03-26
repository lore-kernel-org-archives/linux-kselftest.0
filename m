Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDBE224AF7
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774491415; cv=none; b=bm/Uw5zvftUcYXF4UFcMV09BVLxyRynDFD/t5i52DzxKgdWeakv8qoFY36yBl4BDDGuykDyNwfuDwNBAuUgESCQNqWuss78szPyI1TvLHhYufDHuiwjG5TSNIqMmp235j5RUYOCB0s07lgV1IXVVUxcoz/aP2is2Bx9FbleUCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774491415; c=relaxed/simple;
	bh=XL210it0gtQsEszctI6MjLScbi4X8gcsVy8bQGL8kHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBgJfbw+9UtEhaFFo84TKN46pMgSHwKLyo1ODKAIFp+Q2DaSPEQzj9hdEYW1W4IC9tzLnmUSraFfjtaAfCfcFhLPbI8QHTnys+S5X0FDwpCetIpEDxhtasxdZQm+ltJ8zYNqHr+S2zuQrjIyBWv+mvWcjvHoM05oaEJVMaBUhk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET2C75lD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET2C75lD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-668d4751a3bso593969a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 19:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774491411; x=1775096211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmgS7jmIsFb12HXFzHaausAdN0MMTikyDLHIG6ToCYY=;
        b=ET2C75lDl3dF1GWBDNPPHXY6R+M/C7yiiikMHpM6L8envXWQe/S06lOBVxuzZnA+6b
         FQjhSqIgqpIyX30rocEXzH2Get1UZZ7y6Carv5gxGD2I1rnbR4HIbAlVrjRJX8b9MNCv
         n3j0layCpgYYJj79JuO5zwwCn33L8W9De3yxnUUAgtN8/CuCCD27/AfVAJldCs5La8Fe
         3TrW2WRrDLEbaaVF9XBcksDDx4VrDhy62uIHTCvmFMQVSb1B5GL3viBfvgwdEdhnC3J1
         G5DW9VDwRT+dd/4kZnkCmgSsGY6Gn4+JgyGUFrnJ2ymOxnIMi+kfGTV8aCq90nvUYMSd
         q0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774491411; x=1775096211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmgS7jmIsFb12HXFzHaausAdN0MMTikyDLHIG6ToCYY=;
        b=PLXHKs6guwlc76skygKN937UrcZdUHQymQDa+dStK5xFrPo0Hg3wNsQ7+HZUZfW84s
         Nqz+XJ9u1V8Yls9n1fyr8uF3CyzKuz2pznqfhZL78xBIrcVIDxZvSPPzxcsRpwyoZlF7
         oPhRNgAlQXbcSQ+rbucRTIiMMZjh5oplNJzRyOalEW0cHWB+aMz3HJVthP0ZPgIyPP8u
         QDHFlv9VeA4aQXvUaaIWzVYMcX98/HXgAXcQ/eT2vqBZXzBpXH9H5SZyfVNpcDSmYpob
         lMku6Ar95RFJT+StzFy7XTmHe5pOxpLQb3CUK3fWQUU5EvmOnoctWYwj6OwxQYtibnw5
         s3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY0CWOjzvpbIwYUXGtpPkWQUvTCuU2bWxMBAoZnXl9x3eNaHPfFs0Tj+kfcvxo/tNyzU9WtFjv31tYMvX1MKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyknckfIJQmjmErXa3kAa6sWU4Ctj+dU1x2kdp9l0E7NHvBSfY1
	uRyXs2XmOgR5jGXU70T10jvNLm0/Meme8aYE1vxQgnQGi5etlVqUHXbH
X-Gm-Gg: ATEYQzwU6Iq66NKonCz5eSWYomRuxSiOB6rin6/PE0XCyhKa0FkTC7FC1sinTLcqBOf
	5/NrdMo0W4czjKOlWasqSjD8tQwX3vbuBCy8aLLEp2VFkpbNIt3zbLuuynFlCGQBRl7rI1U/oJB
	ouCzbFKo7DSielwmVp2rtmDxb6QCY8rC+TLjEF2tvR1ynCQIlY89cF2KxAC88IWNGAssYoU4F4I
	R+8y/VWqQgOHOP0dVw2V7kV3bPBWlxwkenFq6OtY603AHp9H0C0IPdD2KS0+tbtVHVXeMfxqbrX
	HNCTAuYe6cpm2EjbEK1E1WtwCEymbYzU/Ml9or3TuVmo1TyTaxEypCws8SAtNs1xgQza+JhUIKr
	lSDsvVqzA7oN1DnAuvL8j29OzldIHImqFB2nXtRC9flVckIqf20FBZc8JludXgp+UzA21kyKuK6
	BrkYF1e9JKKdJw
X-Received: by 2002:a05:6402:40d1:b0:66a:11c9:f6bd with SMTP id 4fb4d7f45d1cf-66a826e30admr3331546a12.27.1774491410742;
        Wed, 25 Mar 2026 19:16:50 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:4e24:270f::3e4:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad541489esm447262a12.0.2026.03.25.19.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:16:49 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Felix Maurer <fmaurer@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Antonio Quartulli <antonio@openvpn.net>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-ppp@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH net-next v4] selftests: net: add tests for PPP
Date: Thu, 26 Mar 2026 10:16:24 +0800
Message-ID: <20260326021642.29170-1-dqfext@gmail.com>
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
v4: double quote $EXIT_STATUS (SC2086)
 https://lore.kernel.org/netdev/20260325014411.3596-1-dqfext@gmail.com/

 MAINTAINERS                                   |  1 +
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
 tools/testing/selftests/net/ppp/config        |  9 ++++
 tools/testing/selftests/net/ppp/ppp_async.sh  | 43 ++++++++++++++++++
 tools/testing/selftests/net/ppp/ppp_common.sh | 44 +++++++++++++++++++
 .../selftests/net/ppp/pppoe-server-options    |  2 +
 tools/testing/selftests/net/ppp/pppoe.sh      | 40 +++++++++++++++++
 8 files changed, 155 insertions(+)
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
index 000000000000..b45d25c5b970
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/config
@@ -0,0 +1,9 @@
+CONFIG_IPV6=y
+CONFIG_PACKET=y
+CONFIG_PPP=m
+CONFIG_PPP_ASYNC=m
+CONFIG_PPP_BSDCOMP=m
+CONFIG_PPP_DEFLATE=m
+CONFIG_PPPOE=m
+CONFIG_PPPOE_HASH_BITS_4=y
+CONFIG_VETH=y
diff --git a/tools/testing/selftests/net/ppp/ppp_async.sh b/tools/testing/selftests/net/ppp/ppp_async.sh
new file mode 100755
index 000000000000..c47a6f5c02dd
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_async.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+source ppp_common.sh
+
+# Temporary files for PTY symlinks
+TTY_DIR=$(mktemp -d /tmp/ppp.XXXXXX)
+TTY_SERVER="$TTY_DIR"/server
+TTY_CLIENT="$TTY_DIR"/client
+
+cleanup() {
+	cleanup_all_ns
+	[ -n "$SOCAT_PID" ] && kill_process "$SOCAT_PID"
+	rm -fr "$TTY_DIR"
+}
+
+trap cleanup EXIT
+
+require_command socat
+ppp_common_init
+modprobe -q ppp_async
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
+
+log_test "PPP async"
+
+exit "$EXIT_STATUS"
diff --git a/tools/testing/selftests/net/ppp/ppp_common.sh b/tools/testing/selftests/net/ppp/ppp_common.sh
new file mode 100644
index 000000000000..c72218813f95
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/ppp_common.sh
@@ -0,0 +1,44 @@
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
+	check_err $?
+
+	ip netns exec "$NS_SERVER" iperf3 -s -1 -D
+	wait_local_port_listen "$NS_SERVER" 5201 tcp
+
+	ip netns exec "$NS_CLIENT" iperf3 -c "$IP_SERVER" -Z -t 2
+	check_err $?
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
index 000000000000..d5d9b898d537
--- /dev/null
+++ b/tools/testing/selftests/net/ppp/pppoe.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
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
+modprobe -q pppoe
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
+
+log_test "PPPoE"
+
+exit "$EXIT_STATUS"
-- 
2.43.0


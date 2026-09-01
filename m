Received: from mta0.migadu.com (out-219.mta0.migadu.com [91.218.175.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DAC43CE70
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277797; cv=none; b=jmu84X/tiJTFTkGVsijfaTXBKIg3Z5dMXTi8UNiOe/ITJLiIYGtVrM4Xa3i/00In69B0pz17IawIPuzT8t5U8AbRgEOtnn84MkH4Bv77u0k3pWsHnAqxhw3hEgLCSx8sgE+rZki4G1xqyBk3SylUGOtgH1yfXi/RZF6CufC9K40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277797; c=relaxed/simple;
	bh=F0bBIHe1MyCfM51N1WFyC6FjsgGzCr35+ZEAE47ireU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaQyLAdZJEim7klqthfyASeeSlPm70L0TyuLpJqU2FgLvkpmaRwZwoKKQWEYFTsHb7dxhA+z9QanWpwlEA3qVEGESpfcVTfNaKZDFDm4ahyIG5jbd5CcS2gwbnYG7RPLmQzZsj1bFGmh3xnddPLAerm81QOnsLIqiOc1XsdyNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PIGs+YUa; arc=none smtp.client-ip=91.218.175.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PIGs+YUa"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F0bBIHe1MyCfM51N1WFyC6FjsgGzCr35+ZEAE47ireU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788277792; v=1; x=1788882592;
 b=PIGs+YUajCh3NG1okaYLNgkQNlx7Zxb/jlVKR5bPbQzR85gmsuo/SDx6TcuU9OtLyWpdZq1l
 NtgNKwIp1lCMb2L6G6jps44NXsB5YamnyLdZ8h0EYS1vNxLjTTUTEZ4xwEXMh5X7mwBrsQwkYzN
 6+V80iLsCMHedx/+rHbw7fgw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83e5b4cfbad47177;
	Tue, 01 Sep 2026 15:49:52 +0000
X-Mizu-Trace-ID: 83e5b4cfbad47177
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v1 2/2] selftests: netdevsim: add a kTLS device offload test
Date: Tue,  1 Sep 2026 23:48:57 +0800
Message-ID: <20260901154914.11637-3-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901154914.11637-1-jiayuan.chen@linux.dev>
References: <20260901154914.11637-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run kTLS over a linked netdevsim pair, one port per netns.  The test
reads /proc/net/tls_stat around the setsockopt() calls and fails unless
both directions landed on the device path, so it cannot quietly pass on
the software one.  It then does a bulk transfer both ways, small
MSG_MORE writes, splice() with TLS_TX_ZEROCOPY_RO, and a run with the
record limit at its minimum so that whole records pack several to a
segment, checking the payload each time, plus the ethtool off/on path.

  # ./tls.sh
  PASS: tls-hw-tx-offload advertised and on by default
  PASS: tls-hw-rx-offload advertised and on by default
  PASS: per-port debugfs tls file exists
  PASS: offloaded TLS data transfer
  PASS: tx and rx contexts installed on both ports
  PASS: both ends used the device path
  PASS: no silent fallback to the software path
  PASS: no decrypt errors
  PASS: driver counted offloaded packets both ways
  PASS: all offload contexts released on close
  PASS: no device contexts left behind
  PASS: both offload features turned off on both ports
  PASS: offload declined once the feature is off
  PASS: software path used when offload is off
  PASS: both offload features turned back on
  PASS: offload works again after re-enabling

  passed: 16 failed: 0

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 .../drivers/net/netdevsim/.gitignore          |   2 +
 .../selftests/drivers/net/netdevsim/Makefile  |   7 +
 .../selftests/drivers/net/netdevsim/config    |   2 +
 .../selftests/drivers/net/netdevsim/tls.sh    | 334 ++++++++++++
 .../drivers/net/netdevsim/tls_offload.c       | 505 ++++++++++++++++++
 5 files changed, 850 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/netdevsim/.gitignore
 create mode 100755 tools/testing/selftests/drivers/net/netdevsim/tls.sh
 create mode 100644 tools/testing/selftests/drivers/net/netdevsim/tls_offload.c

diff --git a/tools/testing/selftests/drivers/net/netdevsim/.gitignore b/tools/testing/selftests/drivers/net/netdevsim/.gitignore
new file mode 100644
index 000000000000..9d4f57cb2baa
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netdevsim/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+tls_offload
diff --git a/tools/testing/selftests/drivers/net/netdevsim/Makefile b/tools/testing/selftests/drivers/net/netdevsim/Makefile
index 9808c2fbae9e..5beb4ed64eb5 100644
--- a/tools/testing/selftests/drivers/net/netdevsim/Makefile
+++ b/tools/testing/selftests/drivers/net/netdevsim/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0+ OR MIT
 
+CFLAGS += $(KHDR_INCLUDES)
+
 TEST_PROGS := \
 	devlink.sh \
 	devlink_in_netns.sh \
@@ -15,9 +17,14 @@ TEST_PROGS := \
 	peer.sh \
 	psample.sh \
 	tc-mq-visibility.sh \
+	tls.sh \
 	udp_tunnel_nic.sh \
 # end of TEST_PROGS
 
+TEST_GEN_FILES := \
+	tls_offload
+# end of TEST_GEN_FILES
+
 TEST_FILES := \
 	ethtool-common.sh
 # end of TEST_FILES
diff --git a/tools/testing/selftests/drivers/net/netdevsim/config b/tools/testing/selftests/drivers/net/netdevsim/config
index 5117c78ddf0a..5893111ba136 100644
--- a/tools/testing/selftests/drivers/net/netdevsim/config
+++ b/tools/testing/selftests/drivers/net/netdevsim/config
@@ -8,4 +8,6 @@ CONFIG_NET_SCH_MULTIQ=y
 CONFIG_NET_SCH_PRIO=y
 CONFIG_PSAMPLE=y
 CONFIG_PTP_1588_CLOCK_MOCK=y
+CONFIG_TLS=m
+CONFIG_TLS_DEVICE=y
 CONFIG_VXLAN=m
diff --git a/tools/testing/selftests/drivers/net/netdevsim/tls.sh b/tools/testing/selftests/drivers/net/netdevsim/tls.sh
new file mode 100755
index 000000000000..59b7d1c0e514
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netdevsim/tls.sh
@@ -0,0 +1,334 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Exercise netdevsim's emulated kTLS device offload over a linked
+# netdevsim pair, one port per network namespace.
+#
+# shellcheck disable=SC2154 # ksft_skip comes from lib.sh
+
+lib_dir=$(dirname "$0")
+# shellcheck source=./../../../net/lib.sh
+# shellcheck disable=SC1091
+source "$lib_dir"/../../../net/lib.sh
+
+# Device IDs and the nssv/nscl namespaces are picked the same way as peer.sh.
+NSIM_DEV_1_ID=$((256 + RANDOM % 256))
+NSIM_DEV_1_SYS=/sys/bus/netdevsim/devices/netdevsim$NSIM_DEV_1_ID
+NSIM_DEV_2_ID=$((512 + RANDOM % 256))
+NSIM_DEV_2_SYS=/sys/bus/netdevsim/devices/netdevsim$NSIM_DEV_2_ID
+
+NSIM_DEV_SYS_NEW=/sys/bus/netdevsim/new_device
+NSIM_DEV_SYS_DEL=/sys/bus/netdevsim/del_device
+NSIM_DEV_SYS_LINK=/sys/bus/netdevsim/link_device
+
+DEBUGFS=/sys/kernel/debug/netdevsim
+NSIM_DEV_1_TLS=$DEBUGFS/netdevsim$NSIM_DEV_1_ID/ports/0/tls
+NSIM_DEV_2_TLS=$DEBUGFS/netdevsim$NSIM_DEV_2_ID/ports/0/tls
+
+SRV_IP=192.168.13.1
+CLI_IP=192.168.13.2
+PORT=4433
+
+SYNCDIR=
+BIN=$lib_dir/tls_offload
+
+# The helpers allow themselves 20s to connect and 20s to meet at the barrier.
+READY_TIMEOUT_SEC=30
+
+num_pass=0
+num_fail=0
+
+check()
+{
+	local msg="$1"
+	local ret="$2"
+
+	if [ "$ret" -eq 0 ]; then
+		echo "PASS: $msg"
+		num_pass=$((num_pass + 1))
+	else
+		echo "FAIL: $msg"
+		num_fail=$((num_fail + 1))
+	fi
+}
+
+# defer takes a command, not a redirection.
+# shellcheck disable=SC2317,SC2329 # invoked from a defer scope
+nsim_dev_del()
+{
+	echo "$1" > "$NSIM_DEV_SYS_DEL"
+}
+
+# Already reaped on the normal path, so ignore both failures.
+# shellcheck disable=SC2317,SC2329 # invoked from a defer scope
+kill_wait()
+{
+	kill "$1" 2>/dev/null
+	wait "$1" 2>/dev/null
+	return 0
+}
+
+# Each resource is handed to defer only once it exists, so a run that loses a
+# race for one of the global names does not tear down the winner's.
+setup()
+{
+	set -e
+
+	echo "$NSIM_DEV_1_ID" > "$NSIM_DEV_SYS_NEW"
+	defer nsim_dev_del "$NSIM_DEV_1_ID"
+	echo "$NSIM_DEV_2_ID" > "$NSIM_DEV_SYS_NEW"
+	defer nsim_dev_del "$NSIM_DEV_2_ID"
+	udevadm settle 2>/dev/null || sleep 1
+
+	NSIM_DEV_1_NAME=$(find "$NSIM_DEV_1_SYS"/net -maxdepth 1 -type d ! \
+		-path "$NSIM_DEV_1_SYS"/net -exec basename {} \;)
+	NSIM_DEV_2_NAME=$(find "$NSIM_DEV_2_SYS"/net -maxdepth 1 -type d ! \
+		-path "$NSIM_DEV_2_SYS"/net -exec basename {} \;)
+
+	ip netns add nssv
+	defer ip netns del nssv
+	ip netns add nscl
+	defer ip netns del nscl
+
+	ip link set "$NSIM_DEV_1_NAME" netns nssv
+	ip link set "$NSIM_DEV_2_NAME" netns nscl
+
+	ip netns exec nssv ip addr add "$SRV_IP/24" dev "$NSIM_DEV_1_NAME"
+	ip netns exec nscl ip addr add "$CLI_IP/24" dev "$NSIM_DEV_2_NAME"
+
+	ip netns exec nssv ip link set dev "$NSIM_DEV_1_NAME" up
+	ip netns exec nscl ip link set dev "$NSIM_DEV_2_NAME" up
+
+	NSIM_DEV_1_FD=$((256 + RANDOM % 256))
+	exec {NSIM_DEV_1_FD}</var/run/netns/nssv
+	NSIM_DEV_1_IFIDX=$(ip netns exec nssv \
+		cat /sys/class/net/"$NSIM_DEV_1_NAME"/ifindex)
+
+	NSIM_DEV_2_FD=$((256 + RANDOM % 256))
+	exec {NSIM_DEV_2_FD}</var/run/netns/nscl
+	NSIM_DEV_2_IFIDX=$(ip netns exec nscl \
+		cat /sys/class/net/"$NSIM_DEV_2_NAME"/ifindex)
+
+	echo "$NSIM_DEV_1_FD:$NSIM_DEV_1_IFIDX $NSIM_DEV_2_FD:$NSIM_DEV_2_IFIDX" \
+		> "$NSIM_DEV_SYS_LINK"
+
+	SYNCDIR=$(mktemp -d)
+	defer rm -rf "$SYNCDIR"
+	set +e
+}
+
+feature()
+{
+	local netns="$1"
+	local dev="$2"
+	local feat="$3"
+
+	ip netns exec "$netns" ethtool -k "$dev" 2>/dev/null | \
+		sed -n "s/^$feat: \([a-z]*\).*/\1/p"
+}
+
+dbg_field()
+{
+	sed -n "s/.*\<$2=\([0-9]*\).*/\1/p" "$1" | head -1
+}
+
+tls_stat()
+{
+	ip netns exec "$1" cat /proc/net/tls_stat | \
+		awk -v name="$2" '$1 == name {print $2}'
+}
+
+# shellcheck disable=SC2317,SC2329 # invoked by name from slowwait
+both_ready()
+{
+	[ -e "$SYNCDIR/server.ready" ] && [ -e "$SYNCDIR/client.ready" ]
+}
+
+# Both ends park once their offload is installed and before any data is
+# sent, so the driver's context count can be sampled without racing the
+# transfer.  Pass "nosample" when the offload is expected to be refused,
+# since then neither end ever reaches the barrier.
+run_pair()
+{
+	local sample="${1:-sample}"
+	local srv_rc cli_rc ready=1
+
+	rm -f "$SYNCDIR"/*.ready "$SYNCDIR"/go
+	CONNS_1=0
+	CONNS_2=0
+
+	defer_scope_push
+
+	ip netns exec nssv "$BIN" server "$SRV_IP" "$PORT" "$SYNCDIR" &
+	local srv_pid=$!
+	defer kill_wait "$srv_pid"
+	ip netns exec nscl "$BIN" client "$SRV_IP" "$PORT" "$SYNCDIR" &
+	local cli_pid=$!
+	defer kill_wait "$cli_pid"
+
+	if [ "$sample" = "sample" ]; then
+		# Comfortably longer than the helpers take to get to the
+		# barrier.  Timing out here means a sample would be stale, so
+		# fail the run rather than assert on it.
+		slowwait "$READY_TIMEOUT_SEC" both_ready >/dev/null || ready=0
+		if [ "$ready" -eq 1 ]; then
+			CONNS_1=$(dbg_field "$NSIM_DEV_1_TLS" count)
+			CONNS_2=$(dbg_field "$NSIM_DEV_2_TLS" count)
+			: "${CONNS_1:=0}"
+			: "${CONNS_2:=0}"
+		fi
+	fi
+	touch "$SYNCDIR/go"
+
+	wait "$srv_pid"; srv_rc=$?
+	wait "$cli_pid"; cli_rc=$?
+
+	defer_scope_pop
+
+	[ "$ready" -eq 1 ] && [ "$srv_rc" -eq 0 ] && [ "$cli_rc" -eq 0 ]
+}
+
+###
+### Code start
+###
+
+if [ "$(id -u)" -ne 0 ]; then
+	echo "SKIP: need root"
+	exit "$ksft_skip"
+fi
+
+if ! command -v ethtool >/dev/null; then
+	echo "SKIP: ethtool not found"
+	exit "$ksft_skip"
+fi
+
+if [ ! -x "$BIN" ]; then
+	echo "SKIP: $BIN not built"
+	exit "$ksft_skip"
+fi
+
+modprobe netdevsim 2>/dev/null
+if [ ! -d /sys/bus/netdevsim ]; then
+	echo "SKIP: netdevsim not available"
+	exit "$ksft_skip"
+fi
+
+modprobe tls 2>/dev/null
+if [ ! -e /proc/net/tls_stat ]; then
+	echo "SKIP: kernel TLS not available"
+	exit "$ksft_skip"
+fi
+
+trap defer_scopes_cleanup EXIT
+setup
+
+# /proc/net/tls_stat only proves generic kTLS.  Without CONFIG_TLS_DEVICE the
+# netdevsim TLS hooks are stubbed out: no offload features and no per-port tls
+# debugfs file.  That is an unsupported configuration for this test, not a
+# failure - skip it.
+if [ ! -e "$NSIM_DEV_1_TLS" ]; then
+	echo "SKIP: netdevsim built without TLS device offload (CONFIG_TLS_DEVICE=n)"
+	exit "$ksft_skip"
+fi
+
+# The offload has to be advertised, and on by default like the other
+# netdevsim crypto offloads.
+for f in tls-hw-tx-offload tls-hw-rx-offload; do
+	[ "$(feature nssv "$NSIM_DEV_1_NAME" "$f")" = "on" ]
+	check "$f advertised and on by default" $?
+done
+
+[ -e "$NSIM_DEV_1_TLS" ]
+check "per-port debugfs tls file exists" $?
+
+# Main data path run.
+run_pair
+check "offloaded TLS data transfer" $?
+
+# Sampled at the barrier, so each port must be holding exactly the TX and
+# the RX context of its own socket.
+[ "$CONNS_1" -eq 2 ] && [ "$CONNS_2" -eq 2 ]
+check "tx and rx contexts installed on both ports" $?
+
+# Both ends must have gone through the device path, not the SW fallback.
+[ "$(tls_stat nssv TlsTxDevice)" -ge 1 ] && \
+	[ "$(tls_stat nssv TlsRxDevice)" -ge 1 ] && \
+	[ "$(tls_stat nscl TlsTxDevice)" -ge 1 ] && \
+	[ "$(tls_stat nscl TlsRxDevice)" -ge 1 ]
+check "both ends used the device path" $?
+
+[ "$(tls_stat nssv TlsTxSw)" -eq 0 ] && [ "$(tls_stat nscl TlsTxSw)" -eq 0 ]
+check "no silent fallback to the software path" $?
+
+[ "$(tls_stat nssv TlsDecryptError)" -eq 0 ] && \
+	[ "$(tls_stat nscl TlsDecryptError)" -eq 0 ]
+check "no decrypt errors" $?
+
+# The driver must have seen the records go by in both directions.
+[ "$(dbg_field "$NSIM_DEV_1_TLS" tx_packets)" -ge 1 ] && \
+	[ "$(dbg_field "$NSIM_DEV_1_TLS" rx_packets)" -ge 1 ] && \
+	[ "$(dbg_field "$NSIM_DEV_2_TLS" tx_packets)" -ge 1 ] && \
+	[ "$(dbg_field "$NSIM_DEV_2_TLS" rx_packets)" -ge 1 ]
+check "driver counted offloaded packets both ways" $?
+
+# Sockets are closed by now, so every context must have been given back.
+# TX contexts are torn down from a workqueue after the socket is destroyed
+# (tls_device_sk_destruct() -> tls_device_tx_del_task), so tls_dev_del() may
+# not have run yet - poll rather than sample once.
+# shellcheck disable=SC2317,SC2329 # invoked by name from busywait
+all_ctx_released()
+{
+	[ "$(dbg_field "$NSIM_DEV_1_TLS" count)" -eq 0 ] &&
+		[ "$(dbg_field "$NSIM_DEV_2_TLS" count)" -eq 0 ]
+}
+
+busywait 2000 all_ctx_released >/dev/null
+check "all offload contexts released on close" $?
+
+[ "$(tls_stat nssv TlsCurrTxDevice)" -eq 0 ] && \
+	[ "$(tls_stat nssv TlsCurrRxDevice)" -eq 0 ]
+check "no device contexts left behind" $?
+
+set_features()
+{
+	local want="$1"
+	local ret=0
+	local f
+
+	for f in tls-hw-tx-offload tls-hw-rx-offload; do
+		ip netns exec nssv ethtool -K "$NSIM_DEV_1_NAME" "$f" "$want"
+		ip netns exec nscl ethtool -K "$NSIM_DEV_2_NAME" "$f" "$want"
+
+		[ "$(feature nssv "$NSIM_DEV_1_NAME" "$f")" = "$want" ] || ret=1
+		[ "$(feature nscl "$NSIM_DEV_2_NAME" "$f")" = "$want" ] || ret=1
+	done
+
+	return "$ret"
+}
+
+# Turning the features off has to make the offload refuse the connection;
+# the test binary insists on the device path, so it must now fail.
+set_features off
+check "both offload features turned off on both ports" $?
+
+run_pair nosample
+rc=$?
+[ "$rc" -ne 0 ]
+check "offload declined once the feature is off" $?
+
+# Both directions on both ends have to have landed on the software path.
+[ "$(tls_stat nssv TlsTxSw)" -ge 1 ] && [ "$(tls_stat nssv TlsRxSw)" -ge 1 ] && \
+	[ "$(tls_stat nscl TlsTxSw)" -ge 1 ] && \
+	[ "$(tls_stat nscl TlsRxSw)" -ge 1 ]
+check "software path used when offload is off" $?
+
+set_features on
+check "both offload features turned back on" $?
+
+run_pair
+check "offload works again after re-enabling" $?
+
+echo
+echo "passed: $num_pass failed: $num_fail"
+[ "$num_fail" -eq 0 ] && exit 0
+exit 1
diff --git a/tools/testing/selftests/drivers/net/netdevsim/tls_offload.c b/tools/testing/selftests/drivers/net/netdevsim/tls_offload.c
new file mode 100644
index 000000000000..0d7c8950ca6c
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netdevsim/tls_offload.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kTLS device offload data path exercise, driven by tls.sh.
+ *
+ * One instance runs as the server and one as the client, each in its own
+ * network namespace, connected back to back by a linked netdevsim pair.
+ * Both ends enable kTLS and rely on netdevsim's emulated TLS offload, so
+ * every record travels through net/tls/tls_device.c rather than the
+ * software path.
+ *
+ * The two processes rendezvous through a shared directory so that neither
+ * side sends before the other has installed its RX offload.
+ */
+
+#define _GNU_SOURCE
+
+#include <arpa/inet.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <netinet/in.h>
+#include <netinet/tcp.h>
+#include <stdarg.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/socket.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/tls.h>
+
+#ifndef SOL_TLS
+#define SOL_TLS			282
+#endif
+
+#ifndef TCP_ULP
+#define TCP_ULP			31
+#endif
+
+#define BULK_LEN		(200 * 1024)
+#define MORE_FRAGS		64
+#define SPLICE_FRAG_LEN		4096
+#define SPLICE_FRAGS		8
+
+/* TLS_MIN_RECORD_SIZE_LIM and TLS_MAX_PAYLOAD_SIZE, which are not uapi. */
+#define REC_LIM_MIN		64
+#define REC_LIM_MAX		16384
+
+#define SMALL_RECS		100
+#define SMALL_LEN		(REC_LIM_MIN * SMALL_RECS)
+
+#define SYNC_TIMEOUT_MS		20000
+#define CONNECT_TIMEOUT_MS	20000
+
+/* accept() and the transfers have no timeout of their own, and tls.sh waits
+ * on both helpers.  Bound the whole run so a stuck peer cannot hang the test.
+ */
+#define RUN_TIMEOUT_SEC		120
+
+static const char *role;
+
+static void die(const char *what)
+{
+	fprintf(stderr, "%s: %s: %s\n", role, what, strerror(errno));
+	exit(1);
+}
+
+static void fail(const char *fmt, ...)
+{
+	va_list ap;
+
+	fprintf(stderr, "%s: ", role);
+	va_start(ap, fmt);
+	vfprintf(stderr, fmt, ap);
+	va_end(ap);
+	fprintf(stderr, "\n");
+	exit(1);
+}
+
+static void msleep(unsigned int ms)
+{
+	struct timespec ts = {
+		.tv_sec = ms / 1000,
+		.tv_nsec = (ms % 1000) * 1000000L,
+	};
+
+	nanosleep(&ts, NULL);
+}
+
+/* /proc/net/tls_stat is per netns, so both ends can check that their own
+ * connection really landed on the device path.
+ */
+static unsigned long read_tls_stat(const char *name)
+{
+	char line[256];
+	unsigned long val;
+	FILE *f;
+
+	f = fopen("/proc/net/tls_stat", "r");
+	if (!f)
+		die("open /proc/net/tls_stat");
+
+	while (fgets(line, sizeof(line), f)) {
+		char key[64];
+
+		if (sscanf(line, "%63s %lu", key, &val) != 2)
+			continue;
+		if (!strcmp(key, name)) {
+			fclose(f);
+			return val;
+		}
+	}
+
+	fclose(f);
+	fail("%s not found in /proc/net/tls_stat", name);
+	return 0;
+}
+
+static void fill_pattern(char *buf, size_t len, unsigned int seed)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		buf[i] = (char)(seed + i * 31 + (i >> 8) * 7);
+}
+
+static void check_pattern(const char *buf, size_t len, unsigned int seed,
+			  const char *what)
+{
+	char *want = malloc(len);
+	size_t i;
+
+	if (!want)
+		die("malloc");
+
+	fill_pattern(want, len, seed);
+	for (i = 0; i < len; i++) {
+		if (buf[i] != want[i])
+			fail("%s: payload mismatch at byte %zu: got 0x%02x want 0x%02x",
+			     what, i, (unsigned char)buf[i],
+			     (unsigned char)want[i]);
+	}
+
+	free(want);
+}
+
+static void write_all(int fd, const char *buf, size_t len)
+{
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t n = send(fd, buf + done, len - done, 0);
+
+		if (n < 0) {
+			if (errno == EINTR)
+				continue;
+			die("send");
+		}
+		done += n;
+	}
+}
+
+static void read_all(int fd, char *buf, size_t len)
+{
+	size_t done = 0;
+
+	while (done < len) {
+		ssize_t n = recv(fd, buf + done, len - done, 0);
+
+		if (n < 0) {
+			if (errno == EINTR)
+				continue;
+			die("recv");
+		}
+		if (n == 0)
+			fail("peer closed after %zu of %zu bytes", done, len);
+		done += n;
+	}
+}
+
+static void enable_ktls(int fd)
+{
+	struct tls12_crypto_info_aes_gcm_128 ci = {};
+	unsigned long tx_before, rx_before;
+
+	tx_before = read_tls_stat("TlsTxDevice");
+	rx_before = read_tls_stat("TlsRxDevice");
+
+	if (setsockopt(fd, IPPROTO_TCP, TCP_ULP, "tls", sizeof("tls")))
+		die("setsockopt(TCP_ULP, tls)");
+
+	ci.info.version = TLS_1_2_VERSION;
+	ci.info.cipher_type = TLS_CIPHER_AES_GCM_128;
+	memset(ci.iv, 'i', sizeof(ci.iv));
+	memset(ci.key, 'k', sizeof(ci.key));
+	memset(ci.salt, 's', sizeof(ci.salt));
+	memset(ci.rec_seq, 0, sizeof(ci.rec_seq));
+
+	if (setsockopt(fd, SOL_TLS, TLS_TX, &ci, sizeof(ci)))
+		die("setsockopt(TLS_TX)");
+	if (setsockopt(fd, SOL_TLS, TLS_RX, &ci, sizeof(ci)))
+		die("setsockopt(TLS_RX)");
+
+	/* The whole point of the exercise: refuse to silently fall back to
+	 * the software path, otherwise the test would pass without ever
+	 * touching tls_device.c.
+	 */
+	if (read_tls_stat("TlsTxDevice") != tx_before + 1)
+		fail("TX did not land on the device path (TlsTxDevice %lu -> %lu)",
+		     tx_before, read_tls_stat("TlsTxDevice"));
+	if (read_tls_stat("TlsRxDevice") != rx_before + 1)
+		fail("RX did not land on the device path (TlsRxDevice %lu -> %lu)",
+		     rx_before, read_tls_stat("TlsRxDevice"));
+}
+
+static void sync_path(char *out, size_t len, const char *dir, const char *who)
+{
+	if ((size_t)snprintf(out, len, "%s/%s.ready", dir, who) >= len)
+		fail("sync dir path too long");
+}
+
+static void rendezvous(const char *dir, const char *me, const char *peer)
+{
+	char mine[PATH_MAX], theirs[PATH_MAX];
+	unsigned int waited = 0;
+	int fd;
+
+	sync_path(mine, sizeof(mine), dir, me);
+	sync_path(theirs, sizeof(theirs), dir, peer);
+
+	fd = open(mine, O_CREAT | O_WRONLY, 0600);
+	if (fd < 0)
+		die("create sync file");
+	close(fd);
+
+	while (access(theirs, F_OK)) {
+		if (waited >= SYNC_TIMEOUT_MS)
+			fail("timed out waiting for %s", peer);
+		msleep(20);
+		waited += 20;
+	}
+}
+
+/* Both ends stop here with their offload installed and no data sent yet,
+ * so that the driver state can be inspected from the outside.
+ */
+static void wait_for_go(const char *dir)
+{
+	unsigned int waited = 0;
+	char go[PATH_MAX];
+
+	if ((size_t)snprintf(go, sizeof(go), "%s/go", dir) >= sizeof(go))
+		fail("sync dir path too long");
+
+	while (access(go, F_OK)) {
+		if (waited >= SYNC_TIMEOUT_MS)
+			fail("timed out waiting for go");
+		msleep(20);
+		waited += 20;
+	}
+}
+
+/* Small writes with MSG_MORE accumulate into one open record before it is
+ * pushed, which is the interesting part of tls_push_data().
+ */
+static void send_msg_more(int fd, unsigned int seed)
+{
+	char buf[MORE_FRAGS + 1];
+	int i;
+
+	fill_pattern(buf, sizeof(buf), seed);
+
+	for (i = 0; i < MORE_FRAGS; i++) {
+		if (send(fd, buf + i, 1, MSG_MORE) != 1)
+			die("send(MSG_MORE)");
+	}
+	if (send(fd, buf + MORE_FRAGS, 1, 0) != 1)
+		die("send(last)");
+}
+
+/* splice() reaches tls_push_data() with MSG_SPLICE_PAGES once
+ * TLS_TX_ZEROCOPY_RO is enabled, which is a distinct fragment path.
+ */
+static void send_splice(int fd, unsigned int seed)
+{
+	char buf[SPLICE_FRAG_LEN];
+	int val = 1;
+	int i;
+
+	if (setsockopt(fd, SOL_TLS, TLS_TX_ZEROCOPY_RO, &val, sizeof(val)))
+		die("setsockopt(TLS_TX_ZEROCOPY_RO)");
+
+	for (i = 0; i < SPLICE_FRAGS; i++) {
+		int p[2];
+
+		fill_pattern(buf, sizeof(buf), seed + i * SPLICE_FRAG_LEN);
+
+		if (pipe(p))
+			die("pipe");
+		if (write(p[1], buf, sizeof(buf)) != sizeof(buf))
+			die("write to pipe");
+		if (splice(p[0], NULL, fd, NULL, sizeof(buf),
+			   i == SPLICE_FRAGS - 1 ? 0 : SPLICE_F_MORE) !=
+		    sizeof(buf))
+			die("splice");
+		close(p[0]);
+		close(p[1]);
+	}
+
+	val = 0;
+	if (setsockopt(fd, SOL_TLS, TLS_TX_ZEROCOPY_RO, &val, sizeof(val)))
+		die("setsockopt(TLS_TX_ZEROCOPY_RO off)");
+}
+
+/* A record can be up to 16K, so normally one segment carries a piece of a
+ * single record.  Shrinking the limit puts a dozen or so whole records in
+ * every segment instead, which is the multi-record path through the driver.
+ */
+static void send_small_records(int fd, unsigned int seed)
+{
+	char buf[SMALL_LEN];
+	uint16_t limit;
+
+	limit = REC_LIM_MIN;
+	if (setsockopt(fd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
+		       sizeof(limit)))
+		die("setsockopt(TLS_TX_MAX_PAYLOAD_LEN)");
+
+	fill_pattern(buf, sizeof(buf), seed);
+	write_all(fd, buf, sizeof(buf));
+
+	limit = REC_LIM_MAX;
+	if (setsockopt(fd, SOL_TLS, TLS_TX_MAX_PAYLOAD_LEN, &limit,
+		       sizeof(limit)))
+		die("setsockopt(TLS_TX_MAX_PAYLOAD_LEN restore)");
+}
+
+#define SEED_C2S_BULK	0x11
+#define SEED_S2C_BULK	0x22
+#define SEED_C2S_MORE	0x33
+#define SEED_C2S_SPLICE	0x44
+#define SEED_C2S_SMALL	0x55
+
+static void run_client(int fd)
+{
+	char *buf = malloc(BULK_LEN);
+
+	if (!buf)
+		die("malloc");
+
+	fill_pattern(buf, BULK_LEN, SEED_C2S_BULK);
+	write_all(fd, buf, BULK_LEN);
+
+	read_all(fd, buf, BULK_LEN);
+	check_pattern(buf, BULK_LEN, SEED_S2C_BULK, "server -> client bulk");
+
+	send_msg_more(fd, SEED_C2S_MORE);
+	send_splice(fd, SEED_C2S_SPLICE);
+	send_small_records(fd, SEED_C2S_SMALL);
+
+	/* Wait for the server's verdict before tearing anything down. */
+	read_all(fd, buf, 1);
+	if (buf[0] != 'k')
+		fail("server reported a failure");
+
+	free(buf);
+}
+
+static void run_server(int fd)
+{
+	size_t splice_len = (size_t)SPLICE_FRAG_LEN * SPLICE_FRAGS;
+	char *buf = malloc(BULK_LEN);
+	char more[MORE_FRAGS + 1];
+	char *sbuf;
+	char ok = 'k';
+	int i;
+
+	sbuf = malloc(splice_len);
+	if (!buf || !sbuf)
+		die("malloc");
+
+	read_all(fd, buf, BULK_LEN);
+	check_pattern(buf, BULK_LEN, SEED_C2S_BULK, "client -> server bulk");
+
+	fill_pattern(buf, BULK_LEN, SEED_S2C_BULK);
+	write_all(fd, buf, BULK_LEN);
+
+	read_all(fd, more, sizeof(more));
+	check_pattern(more, sizeof(more), SEED_C2S_MORE, "client -> server MSG_MORE");
+
+	read_all(fd, sbuf, splice_len);
+	for (i = 0; i < SPLICE_FRAGS; i++)
+		check_pattern(sbuf + (size_t)i * SPLICE_FRAG_LEN,
+			      SPLICE_FRAG_LEN, SEED_C2S_SPLICE +
+			      i * SPLICE_FRAG_LEN, "client -> server splice");
+
+	read_all(fd, buf, SMALL_LEN);
+	check_pattern(buf, SMALL_LEN, SEED_C2S_SMALL,
+		      "client -> server small records");
+
+	write_all(fd, &ok, 1);
+
+	free(sbuf);
+	free(buf);
+}
+
+static int do_server(const char *ip, int port, const char *syncdir)
+{
+	struct sockaddr_in sa = {};
+	int lfd, fd, one = 1;
+
+	lfd = socket(AF_INET, SOCK_STREAM, 0);
+	if (lfd < 0)
+		die("socket");
+	if (setsockopt(lfd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)))
+		die("SO_REUSEADDR");
+
+	sa.sin_family = AF_INET;
+	sa.sin_port = htons(port);
+	if (inet_pton(AF_INET, ip, &sa.sin_addr) != 1)
+		fail("bad bind address %s", ip);
+
+	if (bind(lfd, (struct sockaddr *)&sa, sizeof(sa)))
+		die("bind");
+	if (listen(lfd, 1))
+		die("listen");
+
+	fd = accept(lfd, NULL, NULL);
+	if (fd < 0)
+		die("accept");
+	close(lfd);
+
+	enable_ktls(fd);
+	rendezvous(syncdir, "server", "client");
+	wait_for_go(syncdir);
+
+	run_server(fd);
+
+	close(fd);
+	return 0;
+}
+
+static int do_client(const char *ip, int port, const char *syncdir)
+{
+	struct sockaddr_in sa = {};
+	unsigned int waited = 0;
+	int fd;
+
+	sa.sin_family = AF_INET;
+	sa.sin_port = htons(port);
+	if (inet_pton(AF_INET, ip, &sa.sin_addr) != 1)
+		fail("bad server address %s", ip);
+
+	for (;;) {
+		fd = socket(AF_INET, SOCK_STREAM, 0);
+		if (fd < 0)
+			die("socket");
+		if (!connect(fd, (struct sockaddr *)&sa, sizeof(sa)))
+			break;
+		close(fd);
+		if (waited >= CONNECT_TIMEOUT_MS)
+			die("connect");
+		msleep(20);
+		waited += 20;
+	}
+
+	enable_ktls(fd);
+	rendezvous(syncdir, "client", "server");
+	wait_for_go(syncdir);
+
+	run_client(fd);
+
+	close(fd);
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	int port;
+
+	if (argc != 5) {
+		fprintf(stderr,
+			"usage: %s server|client <ip> <port> <syncdir>\n",
+			argv[0]);
+		return 2;
+	}
+
+	role = argv[1];
+	port = atoi(argv[3]);
+
+	alarm(RUN_TIMEOUT_SEC);
+
+	if (!strcmp(role, "server"))
+		return do_server(argv[2], port, argv[4]);
+	if (!strcmp(role, "client"))
+		return do_client(argv[2], port, argv[4]);
+
+	fprintf(stderr, "unknown role %s\n", role);
+	return 2;
+}
-- 
2.43.0


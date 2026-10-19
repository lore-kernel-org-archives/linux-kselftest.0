Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445932;
	b=sKiM6w/C/pZpA00CfeQOPE4t/ekVAGNBb03Tz7FvipsdBc6/pN6QXZ5lRDGpm6bff7X2
	 drXAqnlKmbYZBuDDCmJnFTnUl5IRDVlIRVc5SylEp6lha/e/IXen04pWuc5XA+oE/drW3
	 FCbn6Quf1HUKjkfSrf+QPDm5Ba3Xp6ArdvXAtRC+T+L1baK0+g3J81Zu7vVV4DJSHq35S
	 MN2qbYc9DwxDgPIhCWRpFRRoEI2IerLExxFks2yhp9pNdcVWez9HWvVReEb92sDPdWhCZ
	 xEsGPbVa27hmwUg5fQSQIVspZMqhJYI75lc4DIhk1v7R1GSTsZbCfEW+FRkyqNFiGvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445932;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lMNj17CX/Hn7DyYFqL5TY7waJXxPfh0sqycM3l/wxlA=;
	b=O0AHLvtQjX0lcCZAcOaNP7GMMQW+pifKSP+Zo6dfWB0q0lf4QelE20rv5fRaq35H/c8e
	 bBU2SU0d8Zt8rUZqZvtAXxaUNsR3DwJpHYVBpghLVU+K5vU8Eoc2AEtNQypXTEuViqSJ2
	 7a2y1nyGMmL59FYu2Bu3bXsWk3Tg6qeQFL2TR+tlIPI24tshegwlFuPFl4mcgA6H9/P/g
	 Na7/Ea63GjUmojCcNelt7ysnqq1PB58HnJojWZwU/mrQR92icl2iGT3vE8lSnnUytNykR
	 +kazGJ8CTacH0reZDz8rtZDewfEA5/7BWuHN6MKK47xZQH6mjG0zgViR2J/q01JDdAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FPEF5iZN;
	arc=none smtp.remote-ip=91.218.175.56
Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF8460A3810
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 21:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF8460A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FPEF5iZN
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3WsDz3kl6c8EJ1fanXi87kkMifM8tX+/OTLI1R7HEDQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792445929; v=1; x=1793050729;
 b=FPEF5iZNH9gdeC42FAvktU2HZf9z/D+Smznl4QSAVjjQO50CgIOimCL+vcUP6pFO0QaJkFQN
 /rYDUjI2MX8IvgPWdL+gB5hmPlXbEfWwIsdLuZ6Ua/U2lRQnVPDFaFEtkI8lgdsXdX4as916xD0
 6YD39IhG780IjbjdtwjDrzh8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3ecf33f37604901c;
	Mon, 19 Oct 2026 21:38:49 +0000
X-Mizu-Trace-ID: 3ecf33f37604901c
X-Migadu-Flow: FLOW_OUT
From: Zhu Yanjun <yanjun.zhu@linux.dev>
To: jgg@ziepe.ca,
	leon@kernel.org,
	shuah@kernel.org,
	zyjzyj2000@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yanjun.zhu@linux.dev
Subject: [PATCH v2 2/2] selftests/rdma: Add netkit-based automated test script for RXE
Date: Mon, 19 Oct 2026 14:38:21 -0700
Message-ID: <20261019213821.44842-3-yanjun.zhu@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019213821.44842-1-yanjun.zhu@linux.dev>
References: <20261019213821.44842-1-yanjun.zhu@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a shell script to automate functional and tracing tests for the
Soft-RoCE (RXE) driver over netkit network interfaces. The script creates
an isolated network namespace, sets up a netkit link pair (nk0/nk1),
attaches RXE links, and runs an rping client/server verification test
along with kernel tracing output collection.

Signed-off-by: Zhu Yanjun <yanjun.zhu@linux.dev>
---
 .../testing/selftests/rdma/rxe_pkg_netkit.sh  | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100755 tools/testing/selftests/rdma/rxe_pkg_netkit.sh

diff --git a/tools/testing/selftests/rdma/rxe_pkg_netkit.sh b/tools/testing/selftests/rdma/rxe_pkg_netkit.sh
new file mode 100755
index 000000000000..a876bd9d57ef
--- /dev/null
+++ b/tools/testing/selftests/rdma/rxe_pkg_netkit.sh
@@ -0,0 +1,83 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+# Copyright (c) 2026 Zhu Yanjun <yanjun.zhu@linux.dev>
+if [ "$(id -u)" -ne 0 ]; then
+    echo "SKIP: This test must be run as root"
+    exit 4
+fi
+
+for cmd in ip rdma rping; do
+    if ! command -v "$cmd" >/dev/null 2>&1; then
+        echo "SKIP: Required tool '$cmd' not found"
+        exit 4
+    fi
+done
+
+if ! modprobe -n netkit >/dev/null 2>&1 || ! modprobe -n rdma_rxe >/dev/null 2>&1; then
+    echo "SKIP: Required kernel modules (netkit or rdma_rxe) are not available"
+    exit 4
+fi
+
+# exec > /dev/null
+
+set -e
+
+CUR_WD="$(dirname "$0")"
+[ "$CUR_WD" = "." ] && CUR_WD="$(pwd)"
+
+cleanup() {
+    set +e
+    [ -n "$DUMP_PID" ] && kill -9 "$DUMP_PID" 2>/dev/null
+    unset DUMP_PID
+
+    rdma link del rxe1 2>/dev/null
+    ip link del nk0 2>/dev/null
+    ip netns delete ns0 2>/dev/null
+
+    rm -f "$CUR_WD/rxe_netkit_dump" "$CUR_WD/rxe_pkg_kernel_dump.o" "$CUR_WD/rxe_pkg_kernel.skel.h"
+}
+
+trap cleanup EXIT INT TERM
+
+# Clear tracing buffer
+echo > /sys/kernel/debug/tracing/trace
+
+# Create network namespace and netkit peer links
+ip netns add ns0
+ip link add nk0 type netkit mode l2 peer name nk1
+ip link set nk0 up
+ip link set nk1 up
+
+# Configure namespace interface
+ip link set nk1 netns ns0
+ip netns exec ns0 ip addr add 10.0.0.1/24 dev nk1
+ip netns exec ns0 ip link set nk1 up
+
+# Configure host interface
+ip addr add 10.0.0.2/24 dev nk0
+
+# Start dump utility in background
+"$CUR_WD/rxe_netkit_dump" &
+DUMP_PID=$!
+
+# Add RXE links over netkit devices
+ip netns exec ns0 rdma link add rxe0 type rxe netdev nk1
+rdma link add rxe1 type rxe netdev nk0
+
+# Start rping server in namespace
+ip netns exec ns0 rping -s -a 10.0.0.1 -C 3 &
+
+# Add wait time
+sleep 1
+
+# Run rping client on host
+rping -c -a 10.0.0.1 -C 3
+
+# Tear down RDMA links and netkit devices
+ip netns exec ns0 rdma link del rxe0
+rdma link del rxe1
+ip link del nk0
+ip netns delete ns0
+
+# Display kernel trace output
+cat /sys/kernel/debug/tracing/trace
-- 
2.54.0


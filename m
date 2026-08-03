Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8D404882;
	Mon,  3 Aug 2026 11:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756627; cv=none; b=EcY2/JHti7pJOYgHzr8QHVUUmDqMuKpiY4JVpBbXm+ytCVBW74qCE66zW4j2H/51u1/lbL/0Ef9fCGY3ProZQ6XbbeBOnAkfy4f89VOAhsJIbu7Nbz+UC1F0Q3wewiSRVdRxJK1muRuOQWg7q1Yvjhp4ibJPR30mrEBX/XzAyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756627; c=relaxed/simple;
	bh=AjM2MO51YaD/20ANbK8/dd2+NM1SwbRTQ+pS+JW1jxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIl89eLuuzKDCGBwTO7iUdVFTM2JKdnmx3Dxk84ToaEJvJmgdvb2lTrk7crmYgbdd1DLmXWrLYKawxcNL22C2gWw7tf/KVF4aYPGwTNy52AxaC+SztowI5x0Ppr5N9lqjV5gUg26ZCB2slkuf5EJJLNBhrhVNZeVvw8JrB08sz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=X7RsFCdZ; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="X7RsFCdZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=LneVCdwt4a641BU8gjs8Eo1IBiq12eQXdI0uc4M4nlY=; b=X7RsFCdZpQ7/LLCGpTn5gXZtsb
	yO9VA/affSNurHMcv1PS717806iR2j/IoWXOI/VkyKd3ZWFHDiyC7LUwGvPkYcNIAtaVCk4i5epwb
	28Dvw9KL299U2Wwx5bFnCm5YWylzdpSk0Xrr/buD9+M8t0dogTKiKOoWMuh7Hf5udI4r5geapkqLV
	cv7U3om0liNW6fvgJyNwWhBFCGoT1pN9mVwppTTNhcrs6PlKHuaogVJ2Q4hIMHAsj4FwAs7N59Yro
	hBIU7UM0kMJ5vsOkOmuPcYhFCN226GAd0mVzOGLXzRI7AZGh9xX8GCvQ3XvSS9QIrYN29Qe65MbIn
	dsHOuc2Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wqqs9-00CKNn-0n;
	Mon, 03 Aug 2026 11:30:21 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 03 Aug 2026 04:30:04 -0700
Subject: [PATCH net-next 2/2] selftests: netconsole: add a userdata torture
 test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-netcons-userdata-rcu-v1-2-1e5e6b62b75d@debian.org>
References: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org>
In-Reply-To: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=7668; i=leitao@debian.org;
 h=from:subject:message-id; bh=AjM2MO51YaD/20ANbK8/dd2+NM1SwbRTQ+pS+JW1jxM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcHvA7w3ETx6aULbxTGcGGM5vu646qs4eifJRJ
 2IGt4GO2QGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanB7wAAKCRA1o5Of/Hh3
 bVDpD/95cZwPQ4xJdRoaxlKsgwp+Kd5B0i2j+7L6htWYL3UTGmd5u9s5/Sbj64Ack37WPc+LIzl
 Hz9WN/VK/+DHI2oxfajQEAIInmiW6WXvsuO48G0ZhjWCr+J+0fWmjbQy/lrgKJacPq7F321E2Qw
 KRiPgtHpn+8BEGbN2xVlo7unYhr5m22lVEzor0F3++6i5vzKkm4aoxkLBTzXFb/pM2xlgI6TdSt
 Ac1fylIGvyjdprLCR5uIqc22UkSg0B7QsYJ0qg+jCdfbP0f6ZpwrUpSgzDCYEbLaqbrkteWrH4L
 FabRQHTNS5avs0rplOupLo1KNVa6P12rFBK/Ogpc5zI/M6jenwpDioHp4NxDf+fDR0M7X/D3Axo
 h3n3e1wNNM7fyVGt4QC2Ok+bpq+6+1NJbwmIvkQSuB1qJyuanPiJZSv65QTVhkEFLQPdEGgZzb+
 Z7IXeKmxNkFnxWxZp6N52vH4/c353DJXv4DTSfOPgU4kKy9ZKskFpZ4nReBFuZcld8fxvg5pTQk
 /CEfq4qWtxyR5f4oorYITxI7HfucXemEhoe33zXSFAdYGOWsAMpRbM970OUnXAdOBEmzvD7JKQa
 E5APSgnhVOLExkG3u1aKlBMZqyjVmgzH+d/zxyB33JZABhJ9AClTPwnzq27Us1A92Le95nQ7oWj
 nDefQ6JG3Sir54Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The userdata payload is rebuilt and republished on every configfs write,
including while the target is enabled and messages are being sent.

Add netcons_userdata.sh that runs random tests with userdata.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 .../selftests/drivers/net/netconsole/Makefile      |   1 +
 .../drivers/net/netconsole/netcons_userdata.sh     | 224 +++++++++++++++++++++
 2 files changed, 225 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/netconsole/Makefile b/tools/testing/selftests/drivers/net/netconsole/Makefile
index b56c70b7e2742..f0674c0017fc4 100644
--- a/tools/testing/selftests/drivers/net/netconsole/Makefile
+++ b/tools/testing/selftests/drivers/net/netconsole/Makefile
@@ -13,6 +13,7 @@ TEST_PROGS := \
 	netcons_resume.sh \
 	netcons_sysdata.sh \
 	netcons_torture.sh \
+	netcons_userdata.sh \
 # end of TEST_PROGS
 
 include ../../../lib.mk
diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_userdata.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_userdata.sh
new file mode 100755
index 0000000000000..bf4c041d4d615
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_userdata.sh
@@ -0,0 +1,224 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0
+
+# Exercise the netconsole userdata payload.
+#
+# The first part checks that the payload the target transmits follows what
+# configfs says: a value shows up in the next message, an update replaces the
+# previous one, clearing the value drops the entry, and so does removing the
+# key.
+#
+# The second part rewrites values, creates and deletes keys, and clears the
+# payload entirely while messages are being sent, so the transmit path keeps
+# picking up payloads that are being replaced underneath it. It runs twice,
+# once with a payload small enough to fit in a single packet and once large
+# enough to be fragmented.
+#
+# Author: Breno Leitao <leitao@debian.org>
+
+set -euo pipefail
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
+
+# Number of times each torture worker loops
+ITERATIONS=${1:-200}
+
+# Keys owned by each torture worker. Workers do not share keys, so a failing
+# configfs operation means a real problem and not a lost race.
+CHURN_KEY="churnkey"
+TRANSIENT_KEY="transientkey"
+# Number of keys used to push a message past MAX_PRINT_CHUNK
+BULK_KEYS=8
+
+USERDATA_DIR="${NETCONS_PATH}/userdata"
+# Values are capped at MAX_EXTRADATA_VALUE_LEN(200) bytes, so ${BULK_KEYS}
+# entries of this size are enough to force fragmentation
+LONG_VALUE=$(printf -- 'v%.0s' {1..190})
+
+function write_key() {
+	local KEY="${1}"
+	local VALUE="${2}"
+
+	mkdir -p "${USERDATA_DIR}/${KEY}"
+	echo "${VALUE}" > "${USERDATA_DIR}/${KEY}/value"
+}
+
+# Send a single message and capture it on the destination interface
+function send_and_capture() {
+	rm -f "${OUTPUT_FILE}"
+
+	listen_port_and_save_to "${OUTPUT_FILE}" &
+	wait_for_port "${NAMESPACE}" "${PORT}" "${IP_VERSION}"
+	echo "${MSG}: ${TARGET}" > /dev/kmsg
+	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}" || true
+	pkill_socat
+	validate_msg "${OUTPUT_FILE}"
+}
+
+function expect_in_msg() {
+	local WANTED="${1}"
+
+	if ! grep -q -- "${WANTED}" "${OUTPUT_FILE}"; then
+		echo "FAIL: '${WANTED}' not found in ${OUTPUT_FILE}" >&2
+		cat "${OUTPUT_FILE}" >&2
+		exit "${ksft_fail}"
+	fi
+}
+
+function expect_not_in_msg() {
+	local UNWANTED="${1}"
+
+	if grep -q -- "${UNWANTED}" "${OUTPUT_FILE}"; then
+		echo "FAIL: '${UNWANTED}' found in ${OUTPUT_FILE}" >&2
+		cat "${OUTPUT_FILE}" >&2
+		exit "${ksft_fail}"
+	fi
+}
+
+# Every write publishes a new payload and frees the previous one. An empty
+# value is skipped when the payload is formatted, so this also drives the
+# target through having no payload at all.
+function churn_value() {
+	local i
+
+	for i in $(seq "${ITERATIONS}")
+	do
+		echo "value${i}" > "${USERDATA_DIR}/${CHURN_KEY}/value"
+		echo > "${USERDATA_DIR}/${CHURN_KEY}/value"
+	done
+}
+
+# Create and delete a key underneath the sender
+function churn_key() {
+	local i
+
+	for i in $(seq "${ITERATIONS}")
+	do
+		mkdir "${USERDATA_DIR}/${TRANSIENT_KEY}"
+		echo "transient${i}" > "${USERDATA_DIR}/${TRANSIENT_KEY}/value"
+		rmdir "${USERDATA_DIR}/${TRANSIENT_KEY}"
+	done
+}
+
+# Keep the transmit path busy while the payload is being replaced
+function send_messages() {
+	local i
+
+	for i in $(seq "${ITERATIONS}")
+	do
+		echo "${MSG}: ${TARGET} ${i}" > /dev/kmsg
+	done
+}
+
+# Run the workers concurrently and fail if any of them hits an error
+function run_workers() {
+	local PIDS=()
+	local WORKER
+	local PID
+
+	for WORKER in "$@"
+	do
+		"${WORKER}" &
+		PIDS+=("$!")
+	done
+
+	for PID in "${PIDS[@]}"
+	do
+		if ! wait "${PID}"
+		then
+			echo "FAIL: userdata torture worker failed" >&2
+			exit "${ksft_fail}"
+		fi
+	done
+}
+
+function create_bulk_keys() {
+	local i
+
+	for i in $(seq "${BULK_KEYS}")
+	do
+		write_key "bulk${i}" "${LONG_VALUE}"
+	done
+}
+
+function delete_bulk_keys() {
+	local i
+
+	for i in $(seq "${BULK_KEYS}")
+	do
+		rmdir "${USERDATA_DIR}/bulk${i}"
+	done
+}
+
+# ========== #
+# Start here #
+# ========== #
+
+modprobe netdevsim 2> /dev/null || true
+modprobe netconsole 2> /dev/null || true
+
+IP_VERSION="ipv4"
+# The content of kmsg will be saved to the following file
+OUTPUT_FILE="/tmp/${TARGET}"
+
+# Check for basic system dependency and exit if not found
+check_for_dependencies
+# Set current loglevel to KERN_INFO(6), and default to KERN_NOTICE(5)
+echo "6 5" > /proc/sys/kernel/printk
+# Remove the namespace, interfaces and netconsole target on exit
+trap cleanup EXIT
+# Create one namespace and two interfaces
+set_network "${IP_VERSION}"
+# Create a dynamic target for netconsole
+create_dynamic_target
+
+# ===================================================
+# TEST #1
+# A value written to configfs reaches the destination
+# ===================================================
+write_key "${USERDATA_KEY}" "first"
+send_and_capture
+expect_in_msg "${USERDATA_KEY}=first"
+
+# ===================================================
+# TEST #2
+# Updating the value replaces the previous payload
+# ===================================================
+write_key "${USERDATA_KEY}" "second"
+send_and_capture
+expect_in_msg "${USERDATA_KEY}=second"
+expect_not_in_msg "${USERDATA_KEY}=first"
+
+# ===================================================
+# TEST #3
+# Clearing the value drops the entry
+# ===================================================
+echo > "${USERDATA_DIR}/${USERDATA_KEY}/value"
+send_and_capture
+expect_not_in_msg "${USERDATA_KEY}="
+
+# ===================================================
+# TEST #4
+# Removing the key drops the entry
+# ===================================================
+write_key "${USERDATA_KEY}" "third"
+rmdir "${USERDATA_DIR}/${USERDATA_KEY}"
+send_and_capture
+expect_not_in_msg "${USERDATA_KEY}="
+rm "${OUTPUT_FILE}"
+
+# ===================================================
+# TEST #5
+# Torture the payload while messages are being sent,
+# first unfragmented and then fragmented
+# ===================================================
+write_key "${CHURN_KEY}" "${USERDATA_VALUE}"
+run_workers churn_value churn_key send_messages
+
+create_bulk_keys
+run_workers churn_value churn_key send_messages
+delete_bulk_keys
+
+exit "${ksft_pass}"

-- 
2.53.0-Meta


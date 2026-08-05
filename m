Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCB42CB18;
	Wed,  5 Aug 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927562; cv=none; b=sMKcJdlGsLoPwgmBJU3cCRzooi+TNMBlN7gLZ42tktgVdCCoqLw3Jzdhq1QfbP4ucEoZdfFJgwzsOcC8S5mMg4RfvqQLfI8+edKHHgxm1EQfoj8OQxLRCHuf85Hh7r4tsRcnzNagTQpXV4GvzpKrbWciKg2jvhyUp7tQnkno8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927562; c=relaxed/simple;
	bh=MsmLy0KjlGvz7Z+I9vf/fAAWD7ems2kzDzIs+rWqR4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5KXgE/phvqzS0PhSZdMIoFqPjcaX/ytBZjae1cZz1ZBUHLx277xt01+A8H/HKJ8pdP5v1hoDuAE/Ha0OWb+pF5uo+FtpeIiDv1lMJhupPnL9L9sTKgQej159DDD6AVPrzGqAnunfM77MWHjnly7SIuepHISJfr+RngbMJC4DA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=YPjxJGki; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="YPjxJGki"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=TOslnepK47dHho2QtfJP4nojTAlEBKd7pBk23hTvEPI=; b=YPjxJGki8nLrPvNgsPP6aYL2Oe
	ftRQb3GR6sW+LM9EadVOTltC2h9jqHndN3eAANyihbCyOKLBqnKkoLJoWvMSCkFeeKXlqtO5FdZHG
	uthlCHreyeD/3HAm9kmovNvfWZ6qWIr6pNjxIMz1kS8asRD4F+iyjyNKsQ/+W94AKu/N0yYHqFGaf
	CG2BY3J7tPtkR3/y6Jlt6dmnUc3pJ5rS2ugtyjYSNUc2hPkdC4CqEBIAvF9WsxwsQeFdVyy+H8zAO
	5o2caMz/vDY87+XruDOo2oCvQjwWWjiL0XMq9VdWi/i1ALdp5sEpU2tunkU+ogawZ/33zd8V/PSHq
	6NsGKZxA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrZL6-00Ds06-2H;
	Wed, 05 Aug 2026 10:59:13 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 05 Aug 2026 03:58:20 -0700
Subject: [PATCH net-next v2 2/2] selftests: netconsole: add a userdata
 torture test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-netcons-userdata-rcu-v2-2-c5e80f6a7a46@debian.org>
References: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
In-Reply-To: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=7858; i=leitao@debian.org;
 h=from:subject:message-id; bh=MsmLy0KjlGvz7Z+I9vf/fAAWD7ems2kzDzIs+rWqR4U=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcxdyU49Eq39dS0DaUaU14fogFML6x64isjCHn
 kxAtisg2eOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanMXcgAKCRA1o5Of/Hh3
 bYrHD/45reACrbzUBBwp5mGFuADIc40UlfxMsg73d7Qk2xdg3VB0C+h3HdcM4LckZivUHwkShv1
 3WOZmxN1DvvlOycNsqrGsi/005Osqg55etCye5EwOlJ/l9/Pbn92mPdWNygbkBVvoj/XcSl/G2k
 Q0imwZH8yCFlBKWglH3mhGLYFxlVdjiB41N/siH3GoG6xnTxDthm72UqOQj2Zuz3WBD+tYENdsx
 PIkonZPGeI0PVCMxBx0kKuYdn4ePzGtOHJrV9ew7VivlIdNFPgHztvecs9smuN21+gGmVHhrw35
 abVdLBifWJr74pycF9F4QfFpMQBIvXKJQNf8j7Eb2ixAE/ZrJpm/Wt6BIt4zPRsgLhLNAZEetcv
 qAcezyvt1+Y9//nm7t8cJH+KcEStdynqQgE8lVQ4UCYwf+cNTPtw6fzaqEI+igmABNaK7KNn2X2
 eP+ZQtFSjueTXdgG/qYKBwAQSF5sDD4SytxDM6xs3+xGwUyH+SAPW78oslRVmV4diQ2Oxr3HOIy
 vDzsBuCZZ6jc/Zqa6EM8HEJXdFsiWy1uMdh9oY8bZD6wM3idjwSqdUVXVd2lj4kQ2U2T4MHAw8R
 VX3LA1X3cHEP+zpv3n4hG8a0Boc2H+oFhorLj19Qv6jDHaZzqGYRztuk0KJkxAdqs+hcz8jpoOJ
 XckwDB86KlTgRaQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The userdata payload is rebuilt and republished on every configfs write,
including while the target is enabled and messages are being sent.

Add netcons_userdata.sh that runs random tests with userdata.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 .../selftests/drivers/net/netconsole/Makefile      |   1 +
 .../drivers/net/netconsole/netcons_userdata.sh     | 229 +++++++++++++++++++++
 2 files changed, 230 insertions(+)

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
index 0000000000000..113903f4ce1c5
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_userdata.sh
@@ -0,0 +1,229 @@
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
+	local RET=0
+	local PID
+
+	for WORKER in "$@"
+	do
+		"${WORKER}" &
+		PIDS+=("$!")
+	done
+
+	# Reap every worker before reporting a failure, otherwise a surviving
+	# worker keeps writing to configfs while the exit trap cleans it up.
+	for PID in "${PIDS[@]}"
+	do
+		wait "${PID}" || RET=1
+	done
+
+	if [[ "${RET}" -ne 0 ]]
+	then
+		echo "FAIL: userdata torture worker failed" >&2
+		exit "${ksft_fail}"
+	fi
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


Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DED3E5A0E;
	Tue, 18 Aug 2026 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049018; cv=none; b=TsraC/WV8P26Q/zNbrwpRx+WDSZxSBpfkRFVgOo++auIlRCk5T7gW+BhwQxVH/8QwAQIDvz1WC8/pZALJ1k9YDAcG6qeRLhF6C3g17SuePfKz00wrys+QTTn41e0Wdi9N1mwObUxwUOpJGaPdmw+aoWd0RO+A/skc2ZAhgMEF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049018; c=relaxed/simple;
	bh=+9MOoBeACdx26BYEWPAq/ZHeh7mKiNyWJP1qhkqZhJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZPZyX1y2/0QjFSKwXTqSWqwsQOI0HNL6TPmK/MntDwDdBy0+gKP/sfxK34VlwNUxMtmZwVX6EwGngOSm0s+dUHRQU+VoFir0YA+P3pBTJIDE3x48lSfqDyDGfyVCbcain674FamhJ99pF+KE8gq5U2mjyqNmKVCqvKbGXbQFmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=iTDCAimJ; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="iTDCAimJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=Z0bBxF8VnIEwXxGroB2RBoES/eXA6hsdail7v/CV2Po=; b=iTDCAimJieGfQs+Mu/oTarJg+T
	/jR0jW2ga1i8IVipTHn9JPFt+gfTSSUN0sk4X26GoH2dFlvHtWVkNppH7+xPYVEiheZej+Qqe6mCZ
	6KZpacCzc1N8XclcLHCUTjrkBgTEdPC1ZQvFPzEeh84aOzKyQDZPtPR4PoPIaWzaHBlaGK/N29f1P
	POhkVs3HIz5SqDRgT9Oj7WqLjkbl5YYerr1sCYdFz3CZ6dtEOliXO6YwE1A4Txx5RMNl+nyjJMnXV
	WX2C5sq24reVWThP7V4cnOMU/6/xS+vobclqp1TrVHfKcscU+ulZYZ54NBTMqaMY5vdQET4o2UPRw
	j7VEjBzA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwH5B-008x7a-1x;
	Tue, 18 Aug 2026 10:30:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 18 Aug 2026 03:29:16 -0700
Subject: [PATCH net-next RFC 6/6] selftests: netcons: test the per-target
 rate limit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-netcons_ratelimit-v1-6-8c5d2d17789c@debian.org>
References: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org>
In-Reply-To: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: paulmck@kernel.org, davej@codemonkey.org.uk, riel@surriel.com, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, samuelcrossley@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=6255; i=leitao@debian.org;
 h=from:subject:message-id; bh=+9MOoBeACdx26BYEWPAq/ZHeh7mKiNyWJP1qhkqZhJ0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqhDQOky3Hoa0R4sv9+HXwWMjKOARiDoGcitDLA
 O1B1TLK2fGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaoQ0DgAKCRA1o5Of/Hh3
 bW1fD/wOkp0X2FsVMsxo0Tg425Tqnxwu/bKLAaeK+7l9QOVFu210kxx/Y0PdLrb85Sqw8h27bve
 J0cWap08ObcUzHW2vYLmzZ3E/oeOOOf8iwmE3ji58htVhf2MfeKeeS+ApXkJMd+Hz5IU7BdGnBi
 F2RDqfXsarbtUUpu6mpQX5RLbky3IG7lSeL5gmqXzIQs+4bnb44oWmcLsCCikhpBQC4yy/YOe1g
 B534BNmdO//9gBdxW98KEC3yExHygFiFZEKt//l5GqiSRK36oP0D63766ZoxgUV6aOri+weUxXp
 JK2JHcoqe3MN9ZMdJB47/3gr1SE/bMaB1e5dUV/47BXq6+rrCauZme4UUi7m3WIYa8nVUwf2AZH
 2riULcTjivisZ34tRVHdOVbXBLtjAhvgkFLNdxe2xt3gVJ9PvnsVVsx8AxcBTvbqRixMfd279cW
 82F26c0W62MfnTb5SCWMNfRJgY8dro+qo6x4yJO4/++4J5sL6bcuhcmH0suNfCPTHi9G31y3k9T
 Dlgeas5LR3m4G+BVldTtlVk3aDIbaqx9Y10bdl8C6z3sa11mobmHYLKTTRwneU/jvpfp/w0yQAN
 DevKhEsyfWghMwO1lJfq3SziP+8ldJ/pqe1SO8p4LG3YiTOIu6dtXFStmQ77rTso80RfXep0Thx
 iIqhuIjNHa2n2RQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Check that a new target starts unlimited and that a configured burst caps
what the target transmits. Dropping the interval back to zero has to
restore unlimited delivery and report what was lost to the receiver.

Only an upper bound is checked on the number of messages received.
netconsole is best-effort UDP and unrelated kernel messages draw from the
same bucket, so what arrives is not an exact count, while the cap is.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 .../selftests/drivers/net/netconsole/Makefile      |   1 +
 .../drivers/net/netconsole/netcons_ratelimit.sh    | 160 +++++++++++++++++++++
 2 files changed, 161 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/netconsole/Makefile b/tools/testing/selftests/drivers/net/netconsole/Makefile
index f0674c0017fc4..04cce40f162e9 100644
--- a/tools/testing/selftests/drivers/net/netconsole/Makefile
+++ b/tools/testing/selftests/drivers/net/netconsole/Makefile
@@ -10,6 +10,7 @@ TEST_PROGS := \
 	netcons_cmdline.sh \
 	netcons_fragmented_msg.sh \
 	netcons_overflow.sh \
+	netcons_ratelimit.sh \
 	netcons_resume.sh \
 	netcons_sysdata.sh \
 	netcons_torture.sh \
diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_ratelimit.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_ratelimit.sh
new file mode 100755
index 0000000000000..38dd1599fe57d
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/netconsole/netcons_ratelimit.sh
@@ -0,0 +1,160 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0
+
+# This test exercises the per-target rate limit. It configures a small burst
+# over an interval long enough that the bucket is never refilled, sends many
+# more messages than the burst allows, and checks that the target stops
+# transmitting once the bucket is empty.
+#
+# Clearing the interval has to restore unlimited delivery and tell the
+# receiver how many messages it missed, which is verified last.
+#
+# Author: Breno Leitao <leitao@debian.org>
+
+set -euo pipefail
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "${SCRIPTDIR}"/../lib/sh/lib_netcons.sh
+
+# Messages sent while the limit is in place, comfortably above BURST so that
+# the bucket is drained
+MSG_COUNT=50
+BURST=5
+# Long enough that the bucket is not refilled while the test runs
+INTERVAL_MS=60000
+# Default the target starts with, as documented in netconsole.rst
+DEFAULT_BURST=10
+# What the target sends once it can transmit again
+DROP_NOTICE="messages dropped by rate limit"
+
+# The content of kmsg will be saved to the following file
+OUTPUT_FILE="/tmp/${TARGET}"
+
+function count_msgs() {
+	local FILE="${1}"
+
+	if [ ! -f "${FILE}" ]
+	then
+		echo 0
+		return
+	fi
+
+	# grep exits 1 on no match, which is a valid result here
+	grep -c "${MSG}" "${FILE}" || true
+}
+
+function send_msgs() {
+	local COUNT="${1}"
+	local I
+
+	for I in $(seq "${COUNT}")
+	do
+		echo "${MSG}: ${TARGET} ${I}" > /dev/kmsg
+	done
+}
+
+# A freshly created target has to be unlimited, otherwise every existing
+# netconsole user would start dropping messages after an upgrade
+function check_defaults() {
+	local INTERVAL BURST_DEFAULT
+
+	INTERVAL=$(cat "${NETCONS_PATH}"/ratelimit_interval_ms)
+	BURST_DEFAULT=$(cat "${NETCONS_PATH}"/ratelimit_burst)
+
+	if [ "${INTERVAL}" -ne 0 ] ||
+	   [ "${BURST_DEFAULT}" -ne "${DEFAULT_BURST}" ]
+	then
+		echo "FAIL: unexpected rate limit defaults:" \
+		     "interval=${INTERVAL} burst=${BURST_DEFAULT}" >&2
+		exit "${ksft_fail}"
+	fi
+}
+
+function check_limited() {
+	local RECEIVED
+
+	RECEIVED=$(count_msgs "${OUTPUT_FILE}")
+
+	# Unrelated kernel messages share the bucket, so fewer than BURST of
+	# ours can get through, but never more
+	if [ "${RECEIVED}" -gt "${BURST}" ]
+	then
+		echo "FAIL: received ${RECEIVED} messages with ratelimit_burst=${BURST}" >&2
+		cat "${OUTPUT_FILE}" >&2
+		exit "${ksft_fail}"
+	fi
+}
+
+# The notice below travels ahead of the message that reopened the bucket, so
+# waiting for the file to appear is not enough
+function msg_received() {
+	grep -q "${MSG}" "${OUTPUT_FILE}" 2> /dev/null
+}
+
+# The messages lost above have to be reported to the receiver
+function check_drops_reported() {
+	if ! grep -q "${DROP_NOTICE}" "${OUTPUT_FILE}"
+	then
+		echo "FAIL: no rate limit notice in ${OUTPUT_FILE}" >&2
+		cat "${OUTPUT_FILE}" >&2
+		exit "${ksft_fail}"
+	fi
+}
+
+# ========== #
+# Start here #
+# ========== #
+
+modprobe netdevsim 2> /dev/null || true
+modprobe netconsole 2> /dev/null || true
+
+# Check for basic system dependency and exit if not found
+check_for_dependencies
+# Remove the namespace, interfaces and netconsole target on exit
+trap cleanup EXIT
+
+# Set current loglevel to KERN_INFO(6), and default to KERN_NOTICE(5)
+echo "6 5" > /proc/sys/kernel/printk
+# Create one namespace and two interfaces
+set_network
+# Create a dynamic target for netconsole
+create_dynamic_target
+
+check_defaults
+
+# Set the burst before the interval, so that no message escapes while the
+# target still carries the default burst
+echo "${BURST}" > "${NETCONS_PATH}"/ratelimit_burst
+echo "${INTERVAL_MS}" > "${NETCONS_PATH}"/ratelimit_interval_ms
+
+listen_port_and_save_to "${OUTPUT_FILE}" &
+wait_for_port "${NAMESPACE}" "${PORT}" "ipv4"
+send_msgs "${MSG_COUNT}"
+# This half of the test is about messages that never arrive, so there is
+# nothing to busywait on
+sleep 1
+pkill_socat
+check_limited
+rm -f "${OUTPUT_FILE}"
+
+# Dropping the interval back to zero has to make the target unlimited again
+echo 0 > "${NETCONS_PATH}"/ratelimit_interval_ms
+
+listen_port_and_save_to "${OUTPUT_FILE}" &
+wait_for_port "${NAMESPACE}" "${PORT}" "ipv4"
+send_msgs 1
+if ! busywait "${BUSYWAIT_TIMEOUT}" msg_received
+then
+	echo "FAIL: Timed out waiting (${BUSYWAIT_TIMEOUT} ms) for netconsole" \
+	     "message in ${OUTPUT_FILE} after clearing the rate limit" >&2
+	exit "${ksft_fail}"
+fi
+validate_msg "${OUTPUT_FILE}"
+check_drops_reported
+pkill_socat
+rm -f "${OUTPUT_FILE}"
+
+trap - EXIT
+cleanup
+exit "${ksft_pass}"

-- 
2.53.0-Meta


Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0B37D119
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111094; cv=none; b=GkEZDKedC+fqvs72vHsnesMcrVJtPcCoWXaV2RY5FoMvMUtWhh4m6Ku+xfkwEhBfbbpl8ILvB26IEEHL3Cl9cry50J5FMiO4t+pTCDxrq41pIksH+BkOOYAlbP5AfV/oXSmVzS1KfFVdJsL8mNCQxUgkziet8n2sZMUbX1m9bPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111094; c=relaxed/simple;
	bh=VlP7KCCmCqgAytGjzFELSVN/ZRu7AUVxx10WyoU5m+U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JBQxdynAI+d6uX45dKhwf/RGUxx2lcy93cujHjz+Pn2w5OvzHg+JXzjvH951cRQCkBWS6N/TYobicmf5X5nDlZJcxmw3ZHlcCA4toeqbB6mopm2ziYQjn3mexkAfBnkqa1WJZPL7lSh45Mv9G//xtt4+MM9ZLLntRQxs/SX8//I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rkh/D5u+; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rkh/D5u+"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-127133794b6so885778c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775111082; x=1775715882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xhzFvy72ssCn2O3NoHeM6hn0rGVxPSe1zjhrn8cpSME=;
        b=Rkh/D5u+Tz2/WT1eQbw1IBBkETlEP18ivAmaJ+9Bowl4HgMvBD5PQBDOZXzFr1qaog
         M5rUs14uBMiBvjFP4FI/2gWmw5LYzbN/FF6aT6kFFZ4pIeCL+AmiEELiawBI2zum7B/c
         PsjwK7Wh4e2jA0FHjKm7vTg1sbmHyJVX35Lc5h9ek/Sdw2BPWlChMg+rXJiI98XJLcDR
         LiU3x9YKHiEfwmBEIxLHHsAgWgFTU2o5CtBXXYljYIl1lPE0fuAoxJkVX1LR2F3Fzr2H
         2Qn3yowA22iPRTBI5cPOBo6pu/yhKetw1TNi2bJPhVdNY0UhAmaZnFvTPz93UzOB+4I0
         RnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111082; x=1775715882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhzFvy72ssCn2O3NoHeM6hn0rGVxPSe1zjhrn8cpSME=;
        b=jzbHHIe1aNI9vfVTjSMiM1xZdSBdVCWk5JgFGi0jEuGKYzv9Hfm1sU9WouT8xzNsQQ
         E0CmIPbAJtBCyhrkrvLGgfS6xrWAK+C7otBlXp68Y3+sqjr0M+6XzyP3CMDjrsrXW1V7
         TD7UFtEZmnir+V5HmawAj8qOqB0BIB+Mj2e7LCfYuwjc4mPqLCg6aY23KwimC6+tBLeC
         mbylvfhan8aSmW5Y4/zxunq8f7aFMqKfIO0S4A5F9Ro8eDEB4nb/9TAcdbzPG5GX8KH1
         W4BII1gsXmbUNTEe9g7xvb02MujMLhDv0Y8NAyU8jYryJmMDpfWhAGFeCnVoh808X5fM
         gm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxwT8B47vo6Pe6RdWM+b1xPQqx3IgFNoL7cn42KLdf35m3kViKSQJWS9TfOsCdveWt/ewZ8Xo1NL3e7vqJWhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT///HZZD2yKNTtRGsch1XJVQvfpujGTVSp2yNGbAW8EQJ+Ef1
	LbmscbbVgc4MeNPzCXCYqaiS9aZkoTiCE1ug1J9N70Jegl0JA3oj+EFWKkcY+UlbJasaQJHXLhq
	QMP+jUCSIRqrrJwsj49c2Vw==
X-Received: from dldoa9.prod.google.com ([2002:a05:701a:ca89:b0:12a:7182:6cb])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:1a81:b0:128:d786:8ac8 with SMTP id a92af1059eb24-12bee4d4ef8mr1191422c88.0.1775111082120;
 Wed, 01 Apr 2026 23:24:42 -0700 (PDT)
Date: Thu, 02 Apr 2026 06:24:20 +0000
In-Reply-To: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111069; l=12865;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=VlP7KCCmCqgAytGjzFELSVN/ZRu7AUVxx10WyoU5m+U=; b=h/uE+37BhQv2ufHd1kj9w1HmWMKXvlOTk+Y9Z3sVg4D0cbH4kusUKiu74LVXwDjG8UnD16Jhh
 UKVx/CGsaahCsrSVn60YBQjS0+FOWoZWV5hs6ftPo9vebWS3z3e2bi4
X-Mailer: b4 0.14.3
Message-ID: <20260402-teaming-driver-internal-v3-7-e8cfdec3b5c2@google.com>
Subject: [PATCH net-next v3 7/7] selftests: net: Add tests for team driver
 decoupled tx and rx control
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

Use ping and tcpdump to verify that independent rx and tx enablement
of team driver member interfaces works as intended.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v3:
- None

Changes in v2:
- Fix shellcheck failures.
- Link to v1: https://lore.kernel.org/all/20260331053353.2504254-8-marcharvey@google.com/
---
 tools/testing/selftests/drivers/net/team/Makefile  |   1 +
 .../drivers/net/team/decoupled_enablement.sh       | 249 +++++++++++++++++++++
 .../testing/selftests/drivers/net/team/options.sh  |  99 +++++++-
 3 files changed, 348 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
index dab922d7f83d..7c58cf82121e 100644
--- a/tools/testing/selftests/drivers/net/team/Makefile
+++ b/tools/testing/selftests/drivers/net/team/Makefile
@@ -2,6 +2,7 @@
 # Makefile for net selftests
 
 TEST_PROGS := \
+	decoupled_enablement.sh \
 	dev_addr_lists.sh \
 	non_ether_header_ops.sh \
 	options.sh \
diff --git a/tools/testing/selftests/drivers/net/team/decoupled_enablement.sh b/tools/testing/selftests/drivers/net/team/decoupled_enablement.sh
new file mode 100755
index 000000000000..e2944af02d57
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/team/decoupled_enablement.sh
@@ -0,0 +1,249 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# These tests verify the decoupled RX and TX enablement of team driver member
+# interfaces.
+#
+# Topology
+#
+#  +---------------------+  NS1
+#  |      test_team1     |
+#  |          |          |
+#  |        eth0         |
+#  |          |          |
+#  |          |          |
+#  +---------------------+
+#             |
+#  +---------------------+  NS2
+#  |          |          |
+#  |          |          |
+#  |        eth0         |
+#  |          |          |
+#  |      test_team2     |
+#  +---------------------+
+
+export ALL_TESTS="
+	team_test_tx_enablement
+	team_test_rx_enablement
+"
+
+test_dir="$(dirname "$0")"
+# shellcheck disable=SC1091
+source "${test_dir}/../../../net/lib.sh"
+# shellcheck disable=SC1091
+source "${test_dir}/team_lib.sh"
+
+NS1=""
+NS2=""
+export NODAD="nodad"
+PREFIX_LENGTH="64"
+NS1_IP="fd00::1"
+NS2_IP="fd00::2"
+NS1_IP4="192.168.0.1"
+NS2_IP4="192.168.0.2"
+MEMBERS=("eth0")
+PING_COUNT=5
+PING_TIMEOUT_S=1
+PING_INTERVAL=0.1
+
+while getopts "4" opt; do
+	case $opt in
+		4)
+			echo "IPv4 mode selected."
+			export NODAD=
+			PREFIX_LENGTH="24"
+			NS1_IP="${NS1_IP4}"
+			NS2_IP="${NS2_IP4}"
+			;;
+		\?)
+			echo "Invalid option: -$OPTARG" >&2
+			exit 1
+			;;
+	esac
+done
+
+# This has to be sourced after opts are gathered...
+export REQUIRE_MZ=no
+export NUM_NETIFS=0
+# shellcheck disable=SC1091
+source "${test_dir}/../../../net/forwarding/lib.sh"
+
+# Create the network namespaces, veth pair, and team devices in the specified
+# mode.
+# Globals:
+#   RET - Used by test infra, set by `check_err` functions.
+# Arguments:
+#   mode - The team driver mode to use for the team devices.
+environment_create()
+{
+	trap cleanup_all_ns EXIT
+	setup_ns ns1 ns2
+	NS1="${NS_LIST[0]}"
+	NS2="${NS_LIST[1]}"
+
+	# Create the interfaces.
+	ip -n "${NS1}" link add eth0 type veth peer name eth0 netns "${NS2}"
+	ip -n "${NS1}" link add test_team1 type team
+	ip -n "${NS2}" link add test_team2 type team
+
+	# Set up the receiving network namespace's team interface.
+	setup_team "${NS2}" test_team2 roundrobin "${NS2_IP}" \
+			"${PREFIX_LENGTH}" "${MEMBERS[@]}"
+}
+
+# Set a particular option value for team or team port.
+# Arguments:
+#   namespace - The namespace name that has the team.
+#   option_name - The option name to set.
+#   option_value - The value to set the option to.
+#   team_name - The name of team to set the option for.
+#   member_name - The (optional) optional name of the member port.
+set_option_value()
+{
+	local namespace="$1"
+	local option_name="$2"
+	local option_value="$3"
+	local team_name="$4"
+	local member_name="$5"
+	local port_flag="--port=${member_name}"
+
+	ip netns exec "${namespace}" teamnl "${team_name}" setoption \
+			"${option_name}" "${option_value}" "${port_flag}"
+	return $?
+}
+
+# Send some pings and return the ping command return value.
+try_ping()
+{
+	ip netns exec "${NS1}" ping -i "${PING_INTERVAL}" -c "${PING_COUNT}" \
+			"${NS2_IP}" -W "${PING_TIMEOUT_S}"
+}
+
+# Checks tcpdump output from net/forwarding lib, and checks if there are any
+# ICMP(4 or 6) packets.
+# Arguments:
+#   interface - The interface name to search for.
+#   ip_address - The destination IP address (4 or 6) to search for.
+did_interface_receive_icmp()
+{
+	local interface="$1"
+	local ip_address="$2"
+	local packet_count
+
+	packet_count=$(tcpdump_show "$interface" | grep -c \
+			"> ${ip_address}: ICMP")
+	echo "Packet count for ${interface} was ${packet_count}"
+
+	if [[ "$packet_count" -gt 0 ]]; then
+		true
+	else
+		false
+	fi
+}
+
+# Test JUST tx enablement with a given mode.
+# Globals:
+#   RET - Used by test infra, set by `check_err` functions.
+# Arguments:
+#   mode - The mode to set the team interfaces to.
+team_test_mode_tx_enablement()
+{
+	local mode="$1"
+	export RET=0
+
+	# Set up the sender team with the correct mode.
+	setup_team "${NS1}" test_team1 "${mode}" "${NS1_IP}" \
+			"${PREFIX_LENGTH}" "${MEMBERS[@]}"
+	check_err $? "Failed to set up sender team"
+
+	### Scenario 1: Member interface initially enabled.
+	# Expect ping to pass
+	try_ping
+	check_err $? "Ping failed when TX enabled"
+
+	### Scenario 2: Once tx-side interface disabled.
+	# Expect ping to fail.
+	set_option_value "${NS1}" tx_enabled false test_team1 eth0
+	check_err $? "Failed to disable TX"
+	tcpdump_start eth0 "${NS2}"
+	try_ping
+	check_fail $? "Ping succeeded when TX disabled"
+	tcpdump_stop eth0
+	# Expect no packets to be transmitted, since TX is disabled.
+	did_interface_receive_icmp eth0 "${NS2_IP}"
+	check_fail $? "eth0 IS transmitting when TX disabled"
+	tcpdump_cleanup eth0
+
+	### Scenario 3: The interface has tx re-enabled.
+	# Expect ping to pass.
+	set_option_value "${NS1}" tx_enabled true test_team1 eth0
+	check_err $? "Failed to reenable TX"
+	try_ping
+	check_err $? "Ping failed when TX reenabled"
+
+	log_test "TX failover of '${mode}' test"
+}
+
+# Test JUST rx enablement with a given mode.
+# Globals:
+#   RET - Used by test infra, set by `check_err` functions.
+# Arguments:
+#   mode - The mode to set the team interfaces to.
+team_test_mode_rx_enablement()
+{
+	local mode="$1"
+	export RET=0
+
+	# Set up the sender team with the correct mode.
+	setup_team "${NS1}" test_team1 "${mode}" "${NS1_IP}" \
+			"${PREFIX_LENGTH}" "${MEMBERS[@]}"
+	check_err $? "Failed to set up sender team"
+
+	### Scenario 1: Member interface initially enabled.
+	# Expect ping to pass
+	try_ping
+	check_err $? "Ping failed when RX enabled"
+
+	### Scenario 2: Once rx-side interface disabled.
+	# Expect ping to fail.
+	set_option_value "${NS1}" rx_enabled false test_team1 eth0
+	check_err $? "Failed to disable RX"
+	tcpdump_start eth0 "${NS2}"
+	try_ping
+	check_fail $? "Ping succeeded when RX disabled"
+	tcpdump_stop eth0
+	# Expect packets to be transmitted, since only RX is disabled.
+	did_interface_receive_icmp eth0 "${NS2_IP}"
+	check_err $? "eth0 not transmitting when RX disabled"
+	tcpdump_cleanup eth0
+
+	### Scenario 3: The interface has rx re-enabled.
+	# Expect ping to pass.
+	set_option_value "${NS1}" rx_enabled true test_team1 eth0
+	check_err $? "Failed to reenable RX"
+	try_ping
+	check_err $? "Ping failed when RX reenabled"
+
+	log_test "RX failover of '${mode}' test"
+}
+
+team_test_tx_enablement()
+{
+	team_test_mode_tx_enablement broadcast
+	team_test_mode_tx_enablement roundrobin
+	team_test_mode_tx_enablement random
+}
+
+team_test_rx_enablement()
+{
+	team_test_mode_rx_enablement broadcast
+	team_test_mode_rx_enablement roundrobin
+	team_test_mode_rx_enablement random
+}
+
+require_command teamnl
+require_command tcpdump
+require_command ping
+environment_create
+tests_run
+exit "${EXIT_STATUS}"
diff --git a/tools/testing/selftests/drivers/net/team/options.sh b/tools/testing/selftests/drivers/net/team/options.sh
index 44888f32b513..c87cf998a427 100755
--- a/tools/testing/selftests/drivers/net/team/options.sh
+++ b/tools/testing/selftests/drivers/net/team/options.sh
@@ -11,10 +11,14 @@ if [[ $# -eq 0 ]]; then
         exit $?
 fi
 
-ALL_TESTS="
+export ALL_TESTS="
         team_test_options
+        team_test_enabled_implicit_changes
+        team_test_rx_enabled_implicit_changes
+        team_test_tx_enabled_implicit_changes
 "
 
+# shellcheck disable=SC1091
 source "${test_dir}/../../../net/lib.sh"
 
 TEAM_PORT="team0"
@@ -176,12 +180,105 @@ team_test_options()
         team_test_option mcast_rejoin_count 0 5
         team_test_option mcast_rejoin_interval 0 5
         team_test_option enabled true false "${MEMBER_PORT}"
+        team_test_option rx_enabled true false "${MEMBER_PORT}"
+        team_test_option tx_enabled true false "${MEMBER_PORT}"
         team_test_option user_linkup true false "${MEMBER_PORT}"
         team_test_option user_linkup_enabled true false "${MEMBER_PORT}"
         team_test_option priority 10 20 "${MEMBER_PORT}"
         team_test_option queue_id 0 1 "${MEMBER_PORT}"
 }
 
+team_test_enabled_implicit_changes()
+{
+        export RET=0
+
+        attach_port_if_specified "${MEMBER_PORT}"
+        check_err $? "Couldn't attach ${MEMBER_PORT} to master"
+
+        # Set enabled to true.
+        set_and_check_get enabled true "--port=${MEMBER_PORT}"
+        check_err $? "Failed to set 'enabled' to true"
+
+        # Show that both rx enabled and tx enabled are true.
+        get_and_check_value rx_enabled true "--port=${MEMBER_PORT}"
+        check_err $? "'Rx_enabled' wasn't implicitly set to true"
+        get_and_check_value tx_enabled true "--port=${MEMBER_PORT}"
+        check_err $? "'Tx_enabled' wasn't implicitly set to true"
+
+        # Set enabled to false.
+        set_and_check_get enabled false "--port=${MEMBER_PORT}"
+        check_err $? "Failed to set 'enabled' to true"
+
+        # Show that both rx enabled and tx enabled are false.
+        get_and_check_value rx_enabled false "--port=${MEMBER_PORT}"
+        check_err $? "'Rx_enabled' wasn't implicitly set to false"
+        get_and_check_value tx_enabled false "--port=${MEMBER_PORT}"
+        check_err $? "'Tx_enabled' wasn't implicitly set to false"
+
+        log_test "'Enabled' implicit changes"
+}
+
+team_test_rx_enabled_implicit_changes()
+{
+	export RET=0
+
+	attach_port_if_specified "${MEMBER_PORT}"
+	check_err $? "Couldn't attach ${MEMBER_PORT} to master"
+
+	# Set enabled to true.
+	set_and_check_get enabled true "--port=${MEMBER_PORT}"
+	check_err $? "Failed to set 'enabled' to true"
+
+	# Set rx_enabled to false.
+	set_and_check_get rx_enabled false "--port=${MEMBER_PORT}"
+	check_err $? "Failed to set 'rx_enabled' to false"
+
+	# Show that enabled is false.
+	get_and_check_value enabled false "--port=${MEMBER_PORT}"
+	check_err $? "'enabled' wasn't implicitly set to false"
+
+	# Set rx_enabled to true.
+	set_and_check_get rx_enabled true "--port=${MEMBER_PORT}"
+	check_err $? "Failed to set 'rx_enabled' to true"
+
+	# Show that enabled is true.
+	get_and_check_value enabled true "--port=${MEMBER_PORT}"
+	check_err $? "'enabled' wasn't implicitly set to true"
+
+	log_test "'Rx_enabled' implicit changes"
+}
+
+team_test_tx_enabled_implicit_changes()
+{
+	export RET=0
+
+	attach_port_if_specified "${MEMBER_PORT}"
+	check_err $? "Couldn't attach ${MEMBER_PORT} to master"
+
+	# Set enabled to true.
+	set_and_check_get enabled true "--port=${MEMBER_PORT}"
+	check_err $? "Failed to set 'enabled' to true"
+
+	# Set tx_enabled to false.
+	set_and_check_get tx_enabled false "--port=${MEMBER_PORT}"
+	check_err $? "Failed to set 'tx_enabled' to false"
+
+	# Show that enabled is false.
+	get_and_check_value enabled false "--port=${MEMBER_PORT}"
+	check_err $? "'enabled' wasn't implicitly set to false"
+
+	# Set tx_enabled to true.
+	set_and_check_get tx_enabled true "--port=${MEMBER_PORT}"
+	check_err $? "Failed to set 'tx_enabled' to true"
+
+	# Show that enabled is true.
+	get_and_check_value enabled true "--port=${MEMBER_PORT}"
+	check_err $? "'enabled' wasn't implicitly set to true"
+
+	log_test "'Tx_enabled' implicit changes"
+}
+
+
 require_command teamnl
 setup
 tests_run

-- 
2.53.0.1185.g05d4b7b318-goog


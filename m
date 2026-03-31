Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29CC36F42C
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935326; cv=none; b=hr3c+65huKM1uzyjX98l7kFWcQVtWL22zzEJomir9R/7nHFvRx5q9lPkyGbogpGwToptct6XwrHReJH2IqikzYduTwgelC+3RdcjGeAXSJc8cDVf5FcMr7T2LQjtgsm3BW+fO4L0Z4wHcMBaUdKW59HWIW80VaoWB9BO+XJlLOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935326; c=relaxed/simple;
	bh=eQ/KgCN8r2hDbOo6YE7TKejlMIBmCD2gUiNJtY/yXWQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MPmeLN/pSuj6g6H0sxElwRY3Lr9FKhX9PE8oFTVGSbxlvt3DchDkM3IakoPO3bgNs7vbE1PbVFhadqS+kDypJgWYKtAWOu+LVTJ+/DfR8ZqZW4W26Rz1oQJG0EkSVY7cyqAllJCoW+6Upu6IgSzKphigtuJrv9UdYIXff+5uh4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kdy55zmH; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kdy55zmH"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso5617169eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774935324; x=1775540124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQZonfh/qYgns905ny1WsQYOWg0tfapOD4UJbZ2MbqQ=;
        b=Kdy55zmHuYN4A7y7JXV08VN6ajRD9nUlftkqMHfJoyVclFJsRuHxsnulC80OwrX68s
         bQfdDaT7OS5XHuns3gdWqKRkCxaV+6AHA+czkBImQ3OD0oXluJS0ol4aL0UPa42Xi8uL
         42mc2s7RmU/JkgFvSdFzkMrGO19zyQwLehUZF1ygBIgd34ev4qUjZblGf7HYD1Tlfi3n
         DR6w3qELd85YLHigGmzJMUm75NNAD2HLBNAiVvFXJ8Xg4V/yVW8mXYAgh4xHcDXVMPLH
         PBqf3tdcrG7UYQPOnJa1hzUVBr5V6w5Ily1HOGQwOn778kXstZLR2hUnMzpIpVjOxqbT
         2TUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935324; x=1775540124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQZonfh/qYgns905ny1WsQYOWg0tfapOD4UJbZ2MbqQ=;
        b=e3lE2WPKJ0Ak8Webyxf8cxn+0MFpqO0O+xi8yXdDVnc6UXIG0HVwtTXbVKDsreCJGj
         Ri6RVOYisI/6tYQjXdqrTm7lcl+n8hguOdsPyXbVHkZmRNeWH0jCdwQJdJuUveNWYaAj
         H9kgw4XR/z4uFPSnNp+spt5dd4TnigxrMTpSolVmM71biWIJXUw6au5t/yRcnAGzrxi5
         T6X4vr3Z6xmAuwerJ3A+NP9Dj6+59XX04NuhhJeBr1pcl3Yxbj+g1hi61LzvQ2BYZa9T
         mbDYvejW3rF1sCntkDCdVqkFtLBGyUmdv7aYoWBnD9mPnfA5EXUS+w+BORQsLU49bMSO
         gc+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTGcMrXySwShqN0J/C0h3SKgJqy/xedspySkcTCaND5Fg0V8691tsJxgpz6tQ4xdlOokjsVH8ht28+3E/QFAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySvkQieAHXx4Fp7c4j3HcYQHljNkJ5zvccaPuecqvqSosFuYaJ
	Jk7qPeiEjahuO0WrpTuNLBi9dZYa0zu6oj6JYwbnX+Rx/bfY4U4EJVUEM2UycabdqC+sKyCs78O
	l4PaOxnSN/oY28rugVR4AMg==
X-Received: from dlai13.prod.google.com ([2002:a05:701b:270d:b0:128:d185:c6ff])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b8a:b0:127:3f2a:af21 with SMTP id a92af1059eb24-12ab2884cf3mr7957350c88.15.1774935322798;
 Mon, 30 Mar 2026 22:35:22 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:33:53 +0000
In-Reply-To: <20260331053353.2504254-1-marcharvey@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331053353.2504254-1-marcharvey@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331053353.2504254-8-marcharvey@google.com>
Subject: [PATCH net-next 7/7] selftests: net: Add tests for team driver
 decoupled tx and rx control
From: Marc Harvey <marcharvey@google.com>
To: jiri@resnulli.us, andrew+netdev@lunn.ch
Cc: willemb@google.com, maheshb@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="UTF-8"

Use ping and tcpdump to verify that independent rx and tx enablement
of team driver member interfaces works as intended.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
 .../selftests/drivers/net/team/Makefile       |   1 +
 .../drivers/net/team/decoupled_enablement.sh  | 200 ++++++++++++++++++
 .../selftests/drivers/net/team/options.sh     |  96 +++++++++
 .../selftests/drivers/net/team/team_lib.sh    |  16 ++
 4 files changed, 313 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/team/decoupled_enablement.sh

diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
index 621c8eba2c32..e46460820e13 100644
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
index 000000000000..23ea2cf666b1
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/team/decoupled_enablement.sh
@@ -0,0 +1,200 @@
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
+ALL_TESTS="
+	team_test_tx_enablement
+	team_test_rx_enablement
+"
+
+test_dir="$(dirname "$0")"
+source "${test_dir}/../../../net/lib.sh"
+
+NS1=""
+NS2=""
+NODAD="nodad"
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
+			NODAD=
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
+# This has to be sourced after opts are gathered... (because of the forwarding
+# lib)
+source "${test_dir}/team_lib.sh"
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
+try_ping()
+{
+	ip netns exec "${NS1}" ping -i "${PING_INTERVAL}" -c "${PING_COUNT}" \
+			"${NS2_IP}" -W "${PING_TIMEOUT_S}"
+}
+
+team_test_mode_tx_enablement()
+{
+	local mode="$1"
+	RET=0
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
+team_test_mode_rx_enablement()
+{
+	local mode="$1"
+	RET=0
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
+
+	### Scenario 3: The interface has tx re-enabled.
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
+require_command teamnl ping pv
+environment_create
+tests_run
+exit "${EXIT_STATUS}"
diff --git a/tools/testing/selftests/drivers/net/team/options.sh b/tools/testing/selftests/drivers/net/team/options.sh
index 44888f32b513..75ebfe9f8d95 100755
--- a/tools/testing/selftests/drivers/net/team/options.sh
+++ b/tools/testing/selftests/drivers/net/team/options.sh
@@ -13,6 +13,9 @@ fi
 
 ALL_TESTS="
         team_test_options
+        team_test_enabled_implicit_changes
+        team_test_rx_enabled_implicit_changes
+        team_test_tx_enabled_implicit_changes
 "
 
 source "${test_dir}/../../../net/lib.sh"
@@ -176,12 +179,105 @@ team_test_options()
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
+        RET=0
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
+        check_err $? "'Rx_enabled' wasn't implicitly set to true"
+        get_and_check_value tx_enabled false "--port=${MEMBER_PORT}"
+        check_err $? "'Tx_enabled' wasn't implicitly set to true"
+
+        log_test "'Enabled' implicit changes"
+}
+
+team_test_rx_enabled_implicit_changes()
+{
+	RET=0
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
+	RET=0
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
diff --git a/tools/testing/selftests/drivers/net/team/team_lib.sh b/tools/testing/selftests/drivers/net/team/team_lib.sh
index 94fdb07edc30..f0f41a19ec47 100644
--- a/tools/testing/selftests/drivers/net/team/team_lib.sh
+++ b/tools/testing/selftests/drivers/net/team/team_lib.sh
@@ -127,3 +127,19 @@ did_interface_receive()
 		false
 	fi
 }
+
+did_interface_receive_icmp()
+{
+	local interface="$1"
+	local ip_address="$2"
+
+	local packet_count=$(tcpdump_show "$interface" | grep \
+			"> ${ip_address}: ICMP" | wc -l)
+	echo "Packet count for ${interface} was ${packet_count}"
+
+	if [[ "$packet_count" -gt 0 ]]; then
+		true
+	else
+		false
+	fi
+}
-- 
2.53.0.1018.g2bb0e51243-goog


Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C74332601
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444700; cv=none; b=ahXNzGf3xAgChQKGp58884bHF3ZbbqsZVyblVb6EoUyO8B1M1MjpE+QDuthPFsbEuewIJDZ2CPQxbNmy0bpZs0dH7fOudGFZRKCoGmghTxIowzN0FbRdI/+Y75jgIAq9S1jTk1gSrajiymV6T+jr3uOQjfZgUiSxTLbKi84rdK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444700; c=relaxed/simple;
	bh=0YVOs6mvzRfLSGgpBVleOvTUosfL7jK3Yi1QX4/ZK24=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g7zw5fp+rUTic+qT8I27f7fqrMo0nSGFv2nvGi3X8Hhs5n6SB9GGJ5mKyPM7n9w6muyaLI56JmjqX2Bk5G3JmMNHHUK73FYCCS1DwIB/cAxwS8SDNJzUBXxK3C3pkqp4qMEEJilJ/D4VQAGZykd/CnLFpya6sfg6M+LFBTB5l3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uInh/hjS; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uInh/hjS"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c3b8880ca9so4037352eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775444697; x=1776049497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oEaMAxrEww+uVIXzB0dGp70Z6IRO+JDIEBNf8Q3zoDo=;
        b=uInh/hjSyl/Kg9/lS0U8Zfp8ONZsMjBhCtdobW/lXuyyt6VJUrgyCOd72goMKRPjfl
         7YVNkhzHrWVjjT8Y4sG/o/G4k2gIWFvSqIYQXFiYzAhz6YEhMwg/2TNbNXNOrnA4vwID
         0lrz0iR8A3udRp4b31Q9DWFw6RZaW64ZVlmDd64VW0b5CawlGgDEHcJAL+sf2HRtNEoE
         6IZ+1RoR41Hdlae0V2B8QkPwEO3wH+xAqcBg8LOcavFtxB+ozAnSiR7aD3/gQLlM3YF7
         O1p32AE5Khb+MEayfMvkCxQWVXqVnwBcAukiOQcBeUYBO5GKH3TXc4PW9YEbblU/OTC7
         r8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444697; x=1776049497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEaMAxrEww+uVIXzB0dGp70Z6IRO+JDIEBNf8Q3zoDo=;
        b=my2jbGHxU1kWfGpkguu9en5qz3q1cvaW23proExtIG9IWbBrjKFVGWkJFGXvxOolSR
         NisCBd7tti5IqAkebFva1BcOpw8Zte2RGvZAUuA3vSIfV6FZZ2lDoYIDNU2cDevKbFkd
         jB9C8cNEKZ7VHfk88LQF7rE8E7WWBCGJKviPmrycg4x3s9h9J9KjyB0PyWqJlJK4rOTS
         rOotR9LmnpWYXqo3dxFoqYi3qrWijDZXAYTFOe2UhNoWLRTQ+g5hyJlFF3bvAxlkJLiF
         5xR9ci4Ur9MwE8zvObqcLu8UcJv1h6uYxOCmNbSq1Km6rYepCcBnucJkHoiI3USYoGYw
         i1zw==
X-Forwarded-Encrypted: i=1; AJvYcCWlW2Q77tz8/61OJvBSZKTjrgdl4jQ/M8Mb5sP6n7qFbR9T4CpgfxR0VyRJgNTO096FlVZ0bcURwnfQ/i+VFW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTG8IxUc5X220M7mR6LaV0upjyMMarXIh9MpxsCfB1uJxP2LWt
	804EMN3rQz8iFA0aAb9/XLYonabBzDyTRitHLOG5FneI/0MH6sAXWi1IQGAx2U6UyQem9H10Cc5
	hHf7Oz840jaOs7WIEar7+AA==
X-Received: from dycqz3.prod.google.com ([2002:a05:7301:df43:b0:2c7:e5a2:e154])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:478f:b0:2cb:c1f8:a7f5 with SMTP id 5a478bee46e88-2cbfb98f856mr4961970eec.19.1775444696851;
 Sun, 05 Apr 2026 20:04:56 -0700 (PDT)
Date: Mon, 06 Apr 2026 03:03:41 +0000
In-Reply-To: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775444686; l=11204;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=0YVOs6mvzRfLSGgpBVleOvTUosfL7jK3Yi1QX4/ZK24=; b=NcidsS6imbvbIpo7qVxPTh1J+olq28BF4dpUnZ3bMIi4f4lERYkmrWF5KZMLDiFr+M129TjJb
 GkJYRl46OOGAxS/WbsrsSoGl6rbdLtChxZU0uRdKYlZziy7VN8SZFbm
X-Mailer: b4 0.14.3
Message-ID: <20260406-teaming-driver-internal-v5-5-e8a3f348a1c5@google.com>
Subject: [PATCH net-next v5 05/10] selftests: net: Add test for enablement of
 ports with teamd
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

There are no tests that verify enablement and disablement of team driver
ports with teamd. This should work even with changes to the enablement
option, so it is important to test.

This test sets up an active-backup network configuration across two
network namespaces, and tries to send traffic while changing which
link is the active one.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v5:
- Make test wait for inactive link to stop receiving traffic after
  setting it to inactive, since there was a race condition.
- Change test teardown to try graceful shutdown first, then use
  sigkill if needed.
- Manually delete leftover teamd files during teardown.
- Use tcpdump instead of checking rx counters.
- Link to v4: https://lore.kernel.org/netdev/20260403-teaming-driver-internal-v4-5-d3032f33ca25@google.com/

Changes in v4:
- None

Changed in v3:
- Make test cleanup kill teamd instead of terminate.
- Link to v2: https://lore.kernel.org/netdev/20260401-teaming-driver-internal-v2-5-f80c1291727b@google.com/

Changes in v2:
- Fix shellcheck failures.
- Remove dependency on net forwarding lib and pipe viewer tools.
- Use iperf3 for tcp instead of netcat.
- Link to v1: https://lore.kernel.org/all/20260331053353.2504254-6-marcharvey@google.com/
---
 tools/testing/selftests/drivers/net/team/Makefile  |   1 +
 .../testing/selftests/drivers/net/team/team_lib.sh |  26 +++
 .../drivers/net/team/teamd_activebackup.sh         | 251 +++++++++++++++++++++
 tools/testing/selftests/net/lib.sh                 |  13 ++
 4 files changed, 291 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
index 777da2e0429e..dab922d7f83d 100644
--- a/tools/testing/selftests/drivers/net/team/Makefile
+++ b/tools/testing/selftests/drivers/net/team/Makefile
@@ -7,6 +7,7 @@ TEST_PROGS := \
 	options.sh \
 	propagation.sh \
 	refleak.sh \
+	teamd_activebackup.sh \
 	transmit_failover.sh \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/net/team/team_lib.sh b/tools/testing/selftests/drivers/net/team/team_lib.sh
index a3102bdcb99c..43db0be19a42 100644
--- a/tools/testing/selftests/drivers/net/team/team_lib.sh
+++ b/tools/testing/selftests/drivers/net/team/team_lib.sh
@@ -144,3 +144,29 @@ did_interface_receive()
 		false
 	fi
 }
+
+# Return true if the given interface in the given namespace does NOT receive
+# traffic over a 1 second period.
+# Arguments:
+#   interface - The name of the interface.
+#   ip_address - The destination IP address.
+#   namespace - The name of the namespace that the interface is in.
+check_no_traffic()
+{
+	local interface="$1"
+	local ip_address="$2"
+	local namespace="$3"
+	local rc
+
+	save_tcpdump_outputs "${namespace}" "${interface}"
+	did_interface_receive "${interface}" "${ip_address}"
+	rc=$?
+
+	clear_tcpdump_outputs "${interface}"
+
+	if [[ "${rc}" -eq 0 ]]; then
+		return 1
+	else
+		return 0
+	fi
+}
diff --git a/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh b/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
new file mode 100755
index 000000000000..9061fdcdfc1b
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
@@ -0,0 +1,251 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# These tests verify that teamd is able to enable and disable ports via the
+# active backup runner.
+#
+# Topology:
+#
+#  +-------------------------+  NS1
+#  |        test_team1       |
+#  |            +            |
+#  |      eth0  |  eth1      |
+#  |        +---+---+        |
+#  |        |       |        |
+#  +-------------------------+
+#           |       |
+#  +-------------------------+  NS2
+#  |        |       |        |
+#  |        +-------+        |
+#  |      eth0  |  eth1      |
+#  |            +            |
+#  |        test_team2       |
+#  +-------------------------+
+
+export ALL_TESTS="teamd_test_active_backup"
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
+NS1_TEAMD_CONF=""
+NS2_TEAMD_CONF=""
+NS1_TEAMD_PID=""
+NS2_TEAMD_PID=""
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
+			echo "Invalid option: -${OPTARG}" >&2
+			exit 1
+			;;
+	esac
+done
+
+teamd_config_create()
+{
+	local runner=$1
+	local dev=$2
+	local conf
+
+	conf=$(mktemp)
+
+	cat > "${conf}" <<-EOF
+	{
+		"device": "${dev}",
+		"runner": {"name": "${runner}"},
+		"ports": {
+			"eth0": {},
+			"eth1": {}
+		}
+	}
+	EOF
+	echo "${conf}"
+}
+
+# Create the network namespaces, veth pair, and team devices in the specified
+# runner.
+# Globals:
+#   RET - Used by test infra, set by `check_err` functions.
+# Arguments:
+#   runner - The Teamd runner to use for the Team devices.
+environment_create()
+{
+	local runner=$1
+
+	echo "Setting up two-link aggregation for runner ${runner}"
+	echo "Teamd version is: $(teamd --version)"
+	trap environment_destroy EXIT
+
+	setup_ns ns1 ns2
+	NS1="${NS_LIST[0]}"
+	NS2="${NS_LIST[1]}"
+
+	for link in $(seq 0 1); do
+		ip -n "${NS1}" link add "eth${link}" type veth peer name \
+				"eth${link}" netns "${NS2}"
+		check_err $? "Failed to create veth pair"
+	done
+
+	NS1_TEAMD_CONF=$(teamd_config_create "${runner}" "test_team1")
+	NS2_TEAMD_CONF=$(teamd_config_create "${runner}" "test_team2")
+	echo "Conf files are ${NS1_TEAMD_CONF} and ${NS2_TEAMD_CONF}"
+
+	ip netns exec "${NS1}" teamd -d -f "${NS1_TEAMD_CONF}"
+	check_err $? "Failed to create team device in ${NS1}"
+	NS1_TEAMD_PID=$(pgrep -f "teamd -d -f ${NS1_TEAMD_CONF}")
+
+	ip netns exec "${NS2}" teamd -d -f "${NS2_TEAMD_CONF}"
+	check_err $? "Failed to create team device in ${NS2}"
+	NS2_TEAMD_PID=$(pgrep -f "teamd -d -f ${NS2_TEAMD_CONF}")
+
+	echo "Created team devices"
+	echo "Teamd PIDs are ${NS1_TEAMD_PID} and ${NS2_TEAMD_PID}"
+
+	for link in $(seq 0 1); do
+		in_all_ns "ip link set eth${link} up"
+		check_err $? "Failed to set eth${link} up"
+	done
+
+	ip -n "${NS1}" link set test_team1 up
+	check_err $? "Failed to set test_team1 up in ${NS1}"
+	ip -n "${NS2}" link set test_team2 up
+	check_err $? "Failed to set test_team2 up in ${NS2}"
+
+	ip -n "${NS1}" addr add "${NS1_IP}/${PREFIX_LENGTH}" "${NODAD}" dev \
+			test_team1
+	check_err $? "Failed to add address to team device in ${NS1}"
+	ip -n "${NS2}" addr add "${NS2_IP}/${PREFIX_LENGTH}" "${NODAD}" dev \
+			test_team2
+	check_err $? "Failed to add address to team device in ${NS2}"
+
+	slowwait 2 timeout 0.5 ip netns exec "${NS1}" ping -W 1 -c 1 "${NS2_IP}"
+}
+
+# Tear down the environment: kill teamd and delete network namespaces.
+environment_destroy()
+{
+	echo "Tearing down two-link aggregation"
+
+	rm "${NS1_TEAMD_CONF}"
+	rm "${NS2_TEAMD_CONF}"
+
+	# First, try graceful teamd teardown.
+	ip netns exec "${NS1}" teamd -k -t test_team1
+	ip netns exec "${NS2}" teamd -k -t test_team2
+
+	# If teamd can't be killed gracefully, then sigkill.
+	if kill -0 "${NS1_TEAMD_PID}" 2>/dev/null; then
+		echo "Sending sigkill to teamd for test_team1"
+		kill -9 "${NS1_TEAMD_PID}"
+		rm /var/run/teamd/test_team1.{pid,sock}
+	fi
+	if kill -0 "${NS2_TEAMD_PID}" 2>/dev/null; then
+		echo "Sending sigkill to teamd for test_team2"
+		kill -9 "${NS2_TEAMD_PID}"
+		rm /var/run/teamd/test_team2.{pid,sock}
+	fi
+	cleanup_all_ns
+}
+
+# Change the active port for an active-backup mode team.
+# Arguments:
+#   namespace - The network namespace that the team is in.
+#   team - The name of the team.
+#   active_port - The port to make active.
+set_active_port()
+{
+	local namespace=$1
+	local team=$2
+	local active_port=$3
+
+	ip netns exec "${namespace}" teamdctl "${team}" state item set \
+			runner.active_port "${active_port}"
+	slowwait 2 bash -c "ip netns exec ${namespace} teamdctl ${team} state \
+			item get runner.active_port | grep -q ${active_port}"
+}
+
+# Wait for an interface to stop receiving traffic. If it keeps receiving traffic
+# for the duration of the timeout, then return an error.
+# Arguments:
+#   - namespace - The network namespace that the interface is in.
+#   - interface - The name of the interface.
+wait_to_stop_receiving()
+{
+	local namespace=$1
+	local interface=$2
+
+	echo "Waiting for ${interface} in ${namespace} to stop receiving"
+	slowwait 10 check_no_traffic "${interface}" "${NS2_IP}" \
+			"${namespace}"
+}
+
+# Test that active backup runner can change active ports.
+# Globals:
+#   RET - Used by test infra, set by `check_err` functions.
+teamd_test_active_backup()
+{
+	export RET=0
+
+	start_listening_and_sending
+
+	### Scenario 1: Don't manually set active port, just make sure team
+	# works.
+	save_tcpdump_outputs "${NS2}" test_team2
+	did_interface_receive test_team2 "${NS2_IP}"
+	check_err $? "Traffic did not reach team interface in NS2."
+	clear_tcpdump_outputs test_team2
+
+	### Scenario 2: Choose active port.
+	set_active_port "${NS1}" test_team1 eth1
+	set_active_port "${NS2}" test_team2 eth1
+
+	wait_to_stop_receiving "${NS2}" eth0
+	save_tcpdump_outputs "${NS2}" eth0 eth1
+	did_interface_receive eth0 "${NS2_IP}"
+	check_fail $? "eth0 IS transmitting when inactive"
+	did_interface_receive eth1 "${NS2_IP}"
+	check_err $? "eth1 not transmitting when active"
+	clear_tcpdump_outputs eth0 eth1
+
+	### Scenario 3: Change active port.
+	set_active_port "${NS1}" test_team1 eth0
+	set_active_port "${NS2}" test_team2 eth0
+
+	wait_to_stop_receiving "${NS2}" eth1
+	save_tcpdump_outputs "${NS2}" eth0 eth1
+	did_interface_receive eth0 "${NS2_IP}"
+	check_err $? "eth0 not transmitting when active"
+	did_interface_receive eth1 "${NS2_IP}"
+	check_fail $? "eth1 IS transmitting when inactive"
+	clear_tcpdump_outputs eth0 eth1
+
+	log_test "teamd active backup runner test"
+
+	stop_sending_and_listening
+}
+
+require_command teamd
+require_command teamdctl
+require_command iperf3
+require_command tcpdump
+environment_create activebackup
+tests_run
+exit "${EXIT_STATUS}"
diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
index e915386daf1b..b3827b43782b 100644
--- a/tools/testing/selftests/net/lib.sh
+++ b/tools/testing/selftests/net/lib.sh
@@ -224,6 +224,19 @@ setup_ns()
 	NS_LIST+=("${ns_list[@]}")
 }
 
+in_all_ns()
+{
+	local ret=0
+	local ns_list=("${NS_LIST[@]}")
+
+	for ns in "${ns_list[@]}"; do
+		ip netns exec "${ns}" "$@"
+		(( ret = ret || $? ))
+	done
+
+	return "${ret}"
+}
+
 # Create netdevsim with given id and net namespace.
 create_netdevsim() {
     local id="$1"

-- 
2.53.0.1185.g05d4b7b318-goog


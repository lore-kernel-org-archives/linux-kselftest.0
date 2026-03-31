Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872736F42C
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935319; cv=none; b=rcKaAHq68zP6MmV6Tr7D/nZ71cKhygKdvq9gqrBYeNrtfleoKQaM04bDZ5NwG0du1aDEHbEqdjRp76rvAHTsOJu+MQVaKVWLpb9KkTF1A5TxrZTFXmkDW0O2+UUqv9DYUVxThM3ax9EGtd8sTIZ8sZj7Wh+wfrfRc1IxGnsF+Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935319; c=relaxed/simple;
	bh=pKiWRihRvlGks0okyOYyPDEPFKjjOVCsUvAnhjoRKI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qYu1NJSe2kmRy1JEc0SDaLQdTvv9xQJHoPTW7QuIEVXCb596FLMSeuwjcgL+4K3NYhPJjZ76V6MFz2UonWoTnt2rj0dXtdCK0g6q1Blzkb3uozs+p8vxM/v0OMyzgF9YXA7KeHfjQh4zRCkCQGlQnnGAhrkQtQl/wMotmhsKDpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k2AtBQIR; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2AtBQIR"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-127133794b6so5434841c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 22:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774935316; x=1775540116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfd2knNOulbBWCcxPt2oZiiLITuqrl5bDnBg0/N3ctQ=;
        b=k2AtBQIRgRQDBZ18FMOAvKVWgZpQeco1qd8Oix/q25jCNGfBdEVWRmSpzDvSojU3MK
         I8b6nNN/zE7FUQaWmeTAEQZ4htCTwkFEh9zcsHhzdnibXMSt7y61BSLGz4lZvyr/9838
         7fPbCAWD8iHEWr2ELYT+qOmeHrGavAaxOuiHk0nvoY7IRAOJ1EdRgUzTXDVolW9cvHIQ
         sTjDIy8YR+2T0kIMJEzakuohHmcN3VVrYNyI0C6TxkH9apV5qjF8hYl1QogtPjmMfo95
         VemGDeOm81rB7SqcANkUxq2vWqp71Ud7YqyneUhn9FvhQ9LLICG0CXzh10ddZ1pzODSw
         KddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935316; x=1775540116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfd2knNOulbBWCcxPt2oZiiLITuqrl5bDnBg0/N3ctQ=;
        b=hGNyqp7AoozqZGzmz/NorMHc8/GhTlrF3Ys33Cr1En1upvQK6Cv9ikPWBj/9C23i6x
         FnI7LDXmmEQog4vTPDj0upiofacelx2JJvdTvxSA0qkYWQZiyTvp8QzW4Yx4NreM3G2w
         gjTsxE9IPJ9ptqzi5d+g/uuihxu5pIepmpLStuY0shf0iw2kjB9KgY2t8+nISYpKu6rW
         zfiMQgMtKssNLzsj239Y7RcbgcqpKFCPrCqW8bcmNtdTBedqTCRioNqPyjp/Rp5rcKMv
         Y0ver+UT0qvxbiGY/X8O6WA7/JA1BIbF5z0icnYkJi7GHec6wBeFNsTVKnmNCNpJFpdx
         oP8A==
X-Forwarded-Encrypted: i=1; AJvYcCVA2HSUDL3/qWyLntsNyJSPFNl/9UpnublAnIj18MexjtVPcB8v6+zNE+hNvHpUCfWBSaKdG8ivd6IEvhAE8Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhvMy5/0rwdtGT3+9RGNt5MvHxB4Ovb9QIrd1Za7b+NhqGnA+y
	j4NVQt6d69KV9krurVejOoAVLzZpUVC//k8fElAp1B07VeSmhCDE4tC9zNOZfmJvcQoPCGEtbaf
	xND1gr/aI9fYNywXLl8EU6A==
X-Received: from dlae2.prod.google.com ([2002:a05:701b:2302:b0:128:f2cd:cb37])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr8746040c88.6.1774935315403;
 Mon, 30 Mar 2026 22:35:15 -0700 (PDT)
Date: Tue, 31 Mar 2026 05:33:51 +0000
In-Reply-To: <20260331053353.2504254-1-marcharvey@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331053353.2504254-1-marcharvey@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331053353.2504254-6-marcharvey@google.com>
Subject: [PATCH net-next 5/7] selftests: net: Add test for enablement of ports
 with teamd
From: Marc Harvey <marcharvey@google.com>
To: jiri@resnulli.us, andrew+netdev@lunn.ch
Cc: willemb@google.com, maheshb@google.com, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="UTF-8"

There are no tests that verify enablement and disablement of team driver
ports with teamd. This should work even with changes to the enablement
option, so it is important to test.

This test sets up an active-backup network configuration across two
network namespaces, and tries to send traffic while changing which
link is the active one.

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
 .../selftests/drivers/net/team/Makefile       |   1 +
 .../drivers/net/team/teamd_activebackup.sh    | 208 ++++++++++++++++++
 tools/testing/selftests/net/lib.sh            |  13 ++
 3 files changed, 222 insertions(+)
 create mode 100755 tools/testing/selftests/drivers/net/team/teamd_activebackup.sh

diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
index ed11edf07655..621c8eba2c32 100644
--- a/tools/testing/selftests/drivers/net/team/Makefile
+++ b/tools/testing/selftests/drivers/net/team/Makefile
@@ -7,6 +7,7 @@ TEST_PROGS := \
 	options.sh \
 	propagation.sh \
 	refleak.sh \
+	teamd_activebackup.sh \
 	transmit_failover.sh \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh b/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
new file mode 100755
index 000000000000..fe8a30a8d5e6
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
@@ -0,0 +1,208 @@
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
+ALL_TESTS="teamd_test_active_backup"
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
+MEMBERS=("eth0" "eth1")
+NS1_TEAMD_CONF=""
+NS2_TEAMD_CONF=""
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
+			echo "Invalid option: -${OPTARG}" >&2
+			exit 1
+			;;
+	esac
+done
+
+# This has to be sourced after opts are gathered... (because of the forwarding
+# lib)
+source "${test_dir}/team_lib.sh"
+
+teamd_config_create()
+{
+	local runner=$1
+	local dev=$2
+	local conf
+
+	conf=$(mktemp)
+
+	cat > $conf <<-EOF
+	{
+		"device": "${dev}",
+		"runner": {"name": "${runner}"},
+		"ports": {
+			"eth0": {},
+			"eth1": {}
+		}
+	}
+	EOF
+	echo $conf
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
+	ip netns exec "${NS2}" teamd -d -f "${NS2_TEAMD_CONF}"
+	check_err $? "Failed to create team device in ${NS2}"
+	echo "Created team devices"
+
+	rm "${NS1_TEAMD_CONF}"
+	rm "${NS2_TEAMD_CONF}"
+	NS1_TEAMD_CONF=""
+	NS2_TEAMD_CONF=""
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
+	ip -n "${NS1}" addr add "${NS1_IP}/${PREFIX_LENGTH}" dev test_team1
+	check_err $? "Failed to add address to team device in ${NS1}"
+	ip -n "${NS2}" addr add "${NS2_IP}/${PREFIX_LENGTH}" dev test_team2
+	check_err $? "Failed to add address to team device in ${NS2}"
+
+	slowwait 2 timeout 0.5 ip netns exec "${NS1}" ping -W 1 -c 1 "${NS2_IP}"
+}
+
+# Tear down the environment: kill teamd and delete network namespaces.
+environment_destroy()
+{
+	echo "Tearing down two-link aggregation"
+	ip netns exec "${NS1}" teamd -k -t test_team1
+	ip netns exec "${NS2}" teamd -k -t test_team2
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
+# Test that active backup runner can change active ports.
+# Globals:
+#   RET - Used by test infra, set by `check_err` functions.
+teamd_test_active_backup()
+{
+	RET=0
+
+	start_listening_and_sending
+
+	### Scenario 1: Don't manually set active port, just make sure team
+	# works.
+	save_tcpdump_outputs "${NS2}" test_team2
+	did_interface_receive test_team2 "${NS2_IP}"
+	check_err $? "Traffic did not reach team interface in NS2."
+
+	### Scenario 2: Choose active port.
+	set_active_port "${NS1}" test_team1 eth1
+	set_active_port "${NS2}" test_team2 eth1
+	save_tcpdump_outputs "${NS2}" "${MEMBERS[@]}"
+
+	did_interface_receive eth0 "${NS2_IP}"
+	check_fail $? "eth0 IS transmitting when disabled"
+	did_interface_receive eth1 "${NS2_IP}"
+	check_err $? "eth1 not transmitting when enabled"
+
+	### Scenario 3: Change active port.
+	set_active_port "${NS1}" test_team1 eth0
+	set_active_port "${NS2}" test_team2 eth0
+	save_tcpdump_outputs "${NS2}" "${MEMBERS[@]}"
+
+	did_interface_receive eth0 "${NS2_IP}"
+	check_err $? "eth0 not transmitting when enabled"
+	did_interface_receive eth1 "${NS2_IP}"
+	check_fail $? "eth1 IS transmitting when disabled"
+
+	log_test "teamd active backup runner test"
+
+	stop_sending_and_listening
+}
+
+require_command teamd teamdctl nc pv
+environment_create activebackup
+tests_run
+exit "${EXIT_STATUS}"
diff --git a/tools/testing/selftests/net/lib.sh b/tools/testing/selftests/net/lib.sh
index b40694573f4c..992342b1dd7c 100644
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
+		ip netns exec "${ns}" bash -c "$@"
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
2.53.0.1018.g2bb0e51243-goog


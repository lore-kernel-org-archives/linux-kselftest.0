Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891986;
	b=wbTVfKd2lOZDE5wBPUE1HIGQHQoV2UlOjb1P5EXh9GhUl46f4b/pBkepiPWi2tZbdu9V
	 S3oh3vYNXaYGxAguwslcisbLfBV4FqNEQC0ut65G+YAxq8AUIaX2I23qHeEKjY5uRRY1x
	 x8bHJx4xPq6Ii/aiBowEUcbHvw7grbn9Szxz/p+j9A2Bt5M6I5EjRBJwYQVP34s30HCO1
	 0ptzLTfpw7vKquWEDDf0XfaKeu4cr/5cYtvqB4hTHeKoXoYHxG4uYa4PjIExDu6EBvw5Q
	 O8DkBGBVWdIbHa43+QXwwP/7hb60LkdJoJGwRfP6gxYLnewItSmWlNMt8/yaVJOAXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891986;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=XhDCMsPb24TVds9GjakDE14ZOfMzBwarrChtHM9Y3q8=;
	b=LYCuUlaDn+e+syeiDVWMgl2wUwXRWIrp+6YjDf/mX7xGH1WijTY7oWgWx1GnzpTCrgi1
	 I7zo8TlfjCxH3+IpE9V4Afwve+CfwyNu/K6MnDw6/i9kgg62aSOq66GkM/YS7x7F3u8c+
	 G/aOXi1KFdqSlfI0ytz0qmDcmt5cNC/SA/1d4lkjjZXxFDpGCSZtPV3o0COjBkxkMfQLX
	 W2s3Il9cDNniAu/aZbNgaI51DZAPoysWkEd9hOnYPP31Zfmw2gNTQHhY8gox5Sv7OqIIv
	 rgDdlXxiZGu10Jxp3vYwsM5+t90oEx42JfHoeJDelnjNmJU8qbgpzueUMtLV0F+D9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gbqcbFcz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7C606D830
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC7C606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gbqcbFcz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793891983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XhDCMsPb24TVds9GjakDE14ZOfMzBwarrChtHM9Y3q8=;
	b=gbqcbFczhSTd/yHWZ8IIC5/JZXpvy6tk8yqihUeFUgjNdAylgp1Ni/1tbTmhX1cdV6mWMj
	T7uQ0PUOB+wZdBFbEox3uIRiF0EKMP+WxEKfjGAD28ik97jRqXtECj/IZpfMFR1vYI4Gva
	ruW2oJjWgD3yOhs9iAU6cpywwI5ysBk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-IEh-2pT4PfaDNJZRATbaAA-1; Thu,
 05 Nov 2026 10:19:38 -0500
X-MC-Unique: IEh-2pT4PfaDNJZRATbaAA-1
X-Mimecast-MFC-AGG-ID: IEh-2pT4PfaDNJZRATbaAA_1793891974
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03A041955DE9;
	Thu,  5 Nov 2026 15:19:34 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B63FB195608C;
	Thu,  5 Nov 2026 15:19:29 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 06/14] selftests: dpll: add pin state tests
Date: Thu,  5 Nov 2026 16:18:44 +0100
Message-ID: <20261105151852.1844305-7-poros@redhat.com>
In-Reply-To: <20261105151852.1844305-1-poros@redhat.com>
References: <20261105151852.1844305-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add dpll_features.sh, a script that exercises individual device and pin
callbacks with get/set roundtrips over netlink. It creates a dpllsim
device with the standard pin layout by default or runs against the
device named by DPLL_DEV_ID, and picks the pin to reconfigure up front,
the first input pin that is not connected on the device, so that no
test touches the reference the device is locked to. The first test
moves that pin between the disconnected and selectable states, reads
the state back after each step and restores the original state at the
end. It never connects the pin, which could make it the reference.

A driver may refuse a state the capability promises, for a constraint
the interface does not tell. That is a skip on a device provided by
the user, with the reason the tool reported, and a failure on the
device the script created, whose simulator accepts both states. The
restore is deferred right after the original state is read, and the
cleanup handler of every script that defers runs the pending restores
before it removes the devices the script created, so that an
interrupted run puts the device back as well.

The stress script gains a test that floods one input pin of a fresh
device with state changes. The library gains the state setter both
use, which keeps the extack line of the tool in DPLL_LAST_ERR so that
a test can tell a refusal from a failure, and a check whether the pin
set usage of the tool knows a keyword, so that a test skips on a tool
too old for it rather than every script requiring a newer tool.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v2:
- quote the ksft_skip expansion (netdev CI shellcheck)

v1: https://lore.kernel.org/all/20261103093910.596225-7-poros@redhat.com/
---
 .../selftests/drivers/net/dpll/Makefile       |   1 +
 .../drivers/net/dpll/dpll_features.sh         | 183 ++++++++++++++++++
 .../selftests/drivers/net/dpll/dpll_stress.sh |  57 ++++++
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  |  76 +++++++-
 4 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/drivers/net/dpll/dpll_features.sh

diff --git a/tools/testing/selftests/drivers/net/dpll/Makefile b/tools/testing/selftests/drivers/net/dpll/Makefile
index 7752fb518b6e9b..7cb42c93b0c9a1 100644
--- a/tools/testing/selftests/drivers/net/dpll/Makefile
+++ b/tools/testing/selftests/drivers/net/dpll/Makefile
@@ -8,6 +8,7 @@ TEST_INCLUDES := \
 
 TEST_PROGS := \
 	dpll_basic.sh \
+	dpll_features.sh \
 	dpll_stress.sh \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_features.sh b/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
new file mode 100755
index 00000000000000..c73417a058e0a0
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
@@ -0,0 +1,183 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# DPLL device and pin feature tests. Exercises individual dpll_device_ops
+# and dpll_pin_ops callbacks, verifying get/set roundtrips through the
+# netlink interface. By default a dpllsim device with a known pin layout
+# is created; set DPLL_DEV_ID to run against an existing device instead,
+# the simulator-only tests then skip unless that device is a dpllsim one.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../../net/lib.sh"
+source "$SCRIPTDIR/../lib/sh/dpll_lib.sh"
+
+ALL_TESTS="
+	test_pin_state_transitions
+"
+
+##############################################################################
+# Pin-level feature tests
+
+test_pin_state_transitions()
+{
+	local before state after reason
+
+	RET=0
+
+	if [ -z "$PIN_TUNE_ID" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "no spare input pin"
+		return
+	fi
+	if ! dpll_pin_set_supports state; then
+		log_test_skip "DPLL pin state transitions" \
+		    "dpll tool lacks pin set state"
+		return
+	fi
+	if ! dpll_pin_has_capability "$PIN_TUNE_ID" state-can-change; then
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "state cannot change"
+		return
+	fi
+
+	before=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "state not reported"
+		return
+	fi
+	# Restore the original state even when the test aborts half way.
+	defer dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"
+
+	# The pin is not connected, see how PIN_TUNE_ID is picked, and the
+	# test never connects it, it moves the pin between the disconnected
+	# and selectable states only and ends at the original one. A pin
+	# that is connected may become the reference the device locks to.
+	#
+	# A driver may refuse a state the capability promises, for a
+	# constraint the interface does not tell. On a device provided by
+	# the user that is a skip with the reason the tool reported, on
+	# the created device a failure, the simulator accepts both states.
+	# The test ends there, whichever set was refused, a state that was
+	# not set has nothing to read back and the deferred restore puts
+	# the pin back. A refused restore is treated the same way when
+	# nothing failed before it, afterwards it is one more failure, a
+	# skip would hide the earlier one.
+	for state in disconnected selectable; do
+		if ! dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+					"$state"; then
+			reason=${DPLL_LAST_ERR%%$'\n'*}
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin state transitions" \
+			    "cannot set pin state to $state${reason:+, $reason}"
+			return
+		fi
+		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+		if [ "$after" != "$state" ]; then
+			check_err 1 "pin not $state, state '$after'"
+		fi
+	done
+
+	if ! dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		reason=${reason:+, $reason}
+		if [ "$RET" -eq 0 ]; then
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin state transitions" \
+			    "cannot set pin state to $before$reason"
+			return
+		fi
+		check_err 1 "cannot restore pin state$reason"
+	fi
+	after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ "$after" != "$before" ]; then
+		check_err 1 "pin state not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin state transitions"
+}
+
+##############################################################################
+
+cleanup()
+{
+	# A second signal must not abort the teardown half way.
+	trap '' INT TERM
+
+	# Run the pending restores of an interrupted test first, the device
+	# they apply to may be one the user provided.
+	defer_scopes_cleanup
+	if [ -n "$DPLL_CREATED_DEVICE" ]; then
+		dpllsim_delete_device "$DPLL_CREATED_DEVICE" ||
+			log_info "cannot delete device $DPLL_CREATED_DEVICE"
+	fi
+	# The device whose creation a signal interrupted is recorded by the
+	# library alone, a double delete of a tracked one is harmless.
+	if [ -n "$DPLLSIM_CREATED_NAME" ]; then
+		dpllsim_delete_device "$DPLLSIM_CREATED_NAME" ||
+			log_info "cannot delete device $DPLLSIM_CREATED_NAME"
+	fi
+	dpll_lib_cleanup
+}
+
+dpll_lib_check_prereqs
+# Another run would find the devices of this one left behind, see the
+# lock in the library.
+dpll_lib_lock
+
+# The module check may mount configfs, so the exit trap that unmounts it
+# again has to be in place before. INT and TERM exit through it as well,
+# so that a timeout imposed by the harness still restores the device.
+trap cleanup EXIT
+trap 'exit 1' INT TERM
+
+if [ -n "${DPLL_DEV_ID:-}" ]; then
+	dpll_lib_init
+else
+	dpllsim_check_module
+	if ! dpllsim_setup_standard_device; then
+		echo "SKIP: cannot create dpllsim device"
+		exit "$ksft_skip"
+	fi
+	DPLL_DEV_ID=$DPLLSIM_DEV_ID
+	DPLL_CREATED_DEVICE=$DPLLSIM_CREATED_NAME
+	DPLL_MODULE_NAME="dpllsim"
+fi
+
+log_info "testing DPLL device $DPLL_DEV_ID (module $DPLL_MODULE_NAME)"
+
+# PIN_TUNE_ID is the input pin the tests reconfigure. It must not be the
+# reference the device is locked to, so it is the first input pin that
+# is not connected on the device. When the first dumped input pin and
+# another one both qualify the other one is taken, so that the first
+# pin, the one a simulated device locks to once it is connected, is left
+# alone. Tests that need the pin skip when there is none rather than
+# reconfiguring the reference.
+pick_tune_pin()
+{
+	local pin_id state
+
+	PIN_TUNE_ID=""
+	for pin_id in "${input_pins[@]}"; do
+		state=$(dpll_pin_get_state "$DPLL_DEV_ID" "$pin_id")
+		case "$state" in
+		disconnected|selectable)
+			;;
+		*)
+			continue
+			;;
+		esac
+		PIN_TUNE_ID=$pin_id
+		[ "$pin_id" != "${input_pins[0]}" ] && return
+	done
+}
+
+mapfile -t input_pins < <(dpll_pin_find_by_direction "$DPLL_DEV_ID" input)
+pick_tune_pin
+
+tests_run
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
index e5a1c4d88da580..ee543e2cd8703c 100755
--- a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
@@ -15,6 +15,7 @@ source "$SCRIPTDIR/../lib/sh/dpll_lib.sh"
 
 ALL_TESTS="
 	test_rapid_create_delete
+	test_pin_state_flooding
 	test_deploy_cycle
 "
 
@@ -45,6 +46,7 @@ cleanup()
 	# A second signal must not abort the teardown half way.
 	trap '' INT TERM
 
+	defer_scopes_cleanup
 	for dev in "${CREATED_DEVICES[@]}"; do
 		dpllsim_delete_device "$dev" ||
 			log_info "cannot delete device $dev"
@@ -133,6 +135,61 @@ test_rapid_create_delete()
 	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
 }
 
+test_pin_state_flooding()
+{
+	local clock_id name dev_id pin_id i last state fails=0
+	local states=(connected disconnected selectable)
+
+	RET=0
+
+	if ! dpll_pin_set_supports state; then
+		log_test_skip "DPLL pin state flooding" \
+			      "dpll tool lacks pin set state"
+		return
+	fi
+
+	dpllsim_alloc_clock_id; clock_id=$DPLLSIM_CLOCK_ID
+	if ! create_stress_device "$clock_id" 10; then
+		check_err 1 "cannot create device"
+		log_test "DPLL pin state flooding"
+		return
+	fi
+	name=$DPLLSIM_CREATED_NAME
+	track_device "$name"
+
+	if ! dev_id=$(dpll_device_wait_by_clock_id "$clock_id" dpllsim); then
+		check_err 1 "device not visible on netlink"
+	else
+		pin_id=$(dpll_pin_find_by_direction "$dev_id" input | head -1)
+		if [ -z "$pin_id" ]; then
+			check_err 1 "no input pin on stress device"
+		else
+			for i in $(seq 1 50); do
+				last=${states[i % 3]}
+				dpll_pin_set_state "$dev_id" "$pin_id" \
+						   "$last" ||
+					fails=$((fails + 1))
+			done
+			if [ "$fails" -gt 0 ]; then
+				check_err 1 "$fails of 50 state changes failed"
+			fi
+			state=$(dpll_pin_get_state "$dev_id" "$pin_id")
+			if [ "$state" != "$last" ]; then
+				check_err 1 \
+				    "state expected '$last', got '$state'"
+			fi
+		fi
+	fi
+
+	if dpllsim_delete_device "$name"; then
+		untrack_device "$name"
+	else
+		check_err 1 "cannot delete device $name"
+	fi
+
+	log_test "DPLL pin state flooding"
+}
+
 test_deploy_cycle()
 {
 	local clock_id name i
diff --git a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
index ade1ac65f98b46..ee91ad1722971d 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -5,7 +5,8 @@
 # tool and around the dpllsim configfs interface for creating virtual DPLL
 # devices. Sourcing this file has no side effects; call
 # dpll_lib_check_prereqs and dpll_lib_init explicitly. net/lib.sh must be
-# sourced first, it provides ksft_skip, busywait and log_info.
+# sourced first, it provides ksft_skip, busywait and log_info to the
+# library and defer to the scripts.
 #
 # Copyright (c) 2026 Red Hat, Inc.
 #
@@ -86,6 +87,44 @@ dpll_lib_lock()
 	fi
 }
 
+# Print the usage block of the given command of the given object from
+# the help of the dpll tool, "dpll pin set" for instance. The help lists
+# one usage per command, each starting with "Usage: dpll <obj> <cmd>" or
+# with "dpll <obj> <cmd>" indented under the first, possibly wrapped
+# over further lines. The block starts at the line that names the
+# command, with a space after the name so that a command whose name
+# merely begins the same way does not match, and ends before the next
+# line that names another command of the object, or at the end of the
+# help when none follows. Return 1 when the help has no usage for the
+# command, in which case nothing is printed.
+__dpll_usage_block()
+{
+	local obj=$1
+	local cmd=$2
+
+	dpll "$obj" help 2>&1 | \
+		awk -v start="[[:space:]]dpll $obj $cmd([[:space:]]|$)" \
+		    -v other="[[:space:]]dpll $obj [a-z-]+([[:space:]]|$)" \
+		    '$0 ~ start { s = 1; print; next }
+		     s && $0 ~ other { exit }
+		     s { print }
+		     END { exit !s }'
+}
+
+# Return 0 when the dpll tool knows the given "pin set" keyword, such as
+# state or frequency. A test that sets something checks its keyword
+# first and skips on a tool that is too old for it. Only the "pin set"
+# usage is searched, a keyword that only "pin show" knows must not
+# count, and the keyword must stand on its own between blanks or
+# brackets, a hyphenated compound that contains it does not count.
+dpll_pin_set_supports()
+{
+	local usage
+
+	usage=$(__dpll_usage_block pin set) || return 1
+	grep -qE "(^|[[:space:][])$1([[:space:]]|$)" <<< "$usage"
+}
+
 # Detect the DPLL device to test. DPLL_DEV_ID may be set by the user to
 # force a specific device; an empty value means auto-detect, which takes
 # the first device that is not a dpllsim one, so that an instance of the
@@ -323,6 +362,41 @@ dpll_pin_get_state()
 	__dpll_pin_dev_field "$1" "$2" '.state'
 }
 
+# Return 0 when the pin advertises the given capability, named as
+# iproute2 prints it (state-can-change, priority-can-change, ...).
+dpll_pin_has_capability()
+{
+	local pin_id=$1
+	local name=$2
+	local out
+
+	out=$(dpll pin show id "$pin_id" -j 2>/dev/null) || return 1
+	jq -e --arg name "$name" \
+	   '(.pin[0]? // .) | .capabilities | index($name) != null' \
+	   <<< "$out" &> /dev/null
+}
+
+##############################################################################
+# Pin setters
+#
+# Every setter returns the status of the tool and keeps what the tool
+# printed on stderr in DPLL_LAST_ERR, the "Error: ..." line that carries
+# the extack message of the kernel, so that a caller can tell a refusal
+# it may skip on from a failure.
+
+DPLL_LAST_ERR=""
+
+# $3: connected / disconnected / selectable
+dpll_pin_set_state()
+{
+	local dev_id=$1
+	local pin_id=$2
+	local state=$3
+
+	DPLL_LAST_ERR=$(dpll pin set id "$pin_id" parent-device "$dev_id" \
+			     state "$state" 2>&1 >/dev/null)
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
-- 
2.56.0


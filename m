Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488691;
	b=3En0Py+YDtNZUxL1hKHLFXAepPswDUkBtceKmInaM2UOIiQTqf5rvUrwrpxRImysaQ7B
	 TPXto2pWOKDtdtj3WzKccW5omcV4Sk5kgarq/2lJOAGZTSCWg5p1NYe8IKPSSc8x5hpUM
	 zH3HlE6iRSHlXCmSFKuzHMQ3TDwuaiFVarab6KyA0AsSBt6USY5eeZh0v+eFsCVt6SXjn
	 IU4igI7wLEXEAFJL/NTj5NZPVFyaFkMckaQnPbIGf7mxE+9+zNu0mncSZnPB4ZeV7g3QK
	 Weva5Jy3RVXEhrkSeKcY7zOIlzlruczadhGmKhZAMSmHWU/GF6ugXK97W2kxJpHaRFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488691;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=qDFW1TREdPi/PGd4qtnzJicc5iNoSKEbkSdrwl6zUrI=;
	b=RofN4ttXTy74FtkWOlLh3iuKa779yIAbvWO20ae1aVrOaYq7QTkN9sXChYP/T2+AnlJT
	 +yBMOnkW3Efnl4e4Ed7ooPVq07dYb0LJ1lXjO4Tmlq9irxd9wxqov+9Lf9FooaJrGuaDY
	 tBKOomhujHrtTnvLV1Zw2tqGur4w4ZCld+l0TAOyKPI6Cln8Yv0Qm5xLwuYKlv/uyZbbA
	 oPa3via1yytv2ropP5J6A2nb+aNz2RkGKjTblmn1aZ3KR86DVTAlyIcMg8lBhPXgd7Ej5
	 U01vbLN4danVMAZoA9H2t7+VZAvQEDsr+Q9s7uhM7LkGPI4sCNrUyCMCMOYkrKr0qBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I3odnfX1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A9606A332
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168A9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I3odnfX1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDFW1TREdPi/PGd4qtnzJicc5iNoSKEbkSdrwl6zUrI=;
	b=I3odnfX1b1Ub7GA+wze0ZyzIq1AqahzV8XIoRg3IwD2IpAjbF8flKfWHKuRFexjTY8vwJS
	3d6dZGAZrT6LQvaRJA6lE5mdd2b4eKsKlxWcS0pWKWqs305Stezpy2NsYWJYMWYATdojnZ
	vXJfjtk+LPLyelX2Q+02xssueuh0fY8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-nu2LtSg0MxmLyuW-QmQs3A-1; Thu,
 12 Nov 2026 08:04:44 -0500
X-MC-Unique: nu2LtSg0MxmLyuW-QmQs3A-1
X-Mimecast-MFC-AGG-ID: nu2LtSg0MxmLyuW-QmQs3A_1794488682
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8300E195399E;
	Thu, 12 Nov 2026 13:04:42 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90DC81956089;
	Thu, 12 Nov 2026 13:04:37 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v4 06/14] selftests: dpll: add pin state tests
Date: Thu, 12 Nov 2026 14:03:51 +0100
Message-ID: <20261112130359.840795-7-poros@redhat.com>
In-Reply-To: <20261112130359.840795-1-poros@redhat.com>
References: <20261112130359.840795-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add dpll_features.sh, a script that exercises individual device and pin
callbacks with get/set roundtrips over netlink. It creates a dpllsim
device with the standard pin layout by default or runs against the
device named by DPLL_DEV_ID or the first device of the driver named by
DPLL_DRIVER, and picks the pin to reconfigure up front, so that no test
touches the reference the device is locked to. The pin is an input that
is disconnected or selectable on the device and that none of its parent
devices reports as connected or, where the tool prints the operational
state, as active, since a pin can be registered on several devices.
When the first input pin and another one both qualify the other one is
taken, drivers tend to list their primary reference first. On hardware
a spare pin with a valid signal can still be selected while a test
reconfigures it, which the header of the script points out.

The first test moves that pin through the states of the device mode,
as Documentation/driver-api/dpll.rst defines them, reads the state back
after each step and restores the original state at the end. In
automatic mode these are disconnected and selectable, and on the
device the script created the test then checks that connected is
refused. Hardware drivers are not held to that, ice accepts connected
in automatic mode, and a pin with the state-connected-override
capability would take over the reference. In manual mode connected and
disconnected
are the states, connecting the pin makes it the reference, so the test
finds the pin connected before, connects it back at the end and checks
that it is the reference again.

A driver may refuse a state the capability promises, for a constraint
the interface does not tell. That is a skip on a device provided by
the user, with the reason the tool reported, and a failure on the
device the script created, whose simulator accepts both states of its
mode. A refusal that follows a failed readback leaves the test failed,
dpll_log_test_skip_or_fail no longer turns a recorded failure into a
skip. The restores are deferred right after the original states are
read, the reconnect of the reference first, since deferred commands run
last in first out and the test pin has to be disconnected again before
the reference is connected back. The cleanup handler of every script
that defers runs the pending restores before it removes the devices the
script created, so that an interrupted run puts the device back as
well. defer drops the status of what it runs, so the restores go
through dpll_restore, which logs one that fails. A pin that cannot be
queried is a failure, not a pin that is in use or lacks a capability.

The stress script gains a test that floods one input pin of a fresh
device with changes between the states of automatic mode and ends on
selectable, the state a fresh pin is not in, so that the readback after
the flood catches a setter that stores nothing. The library
gains the state setter both use, which keeps the extack line of the
tool in DPLL_LAST_ERR so that a test can tell a refusal from a failure,
the device mode getter, and a check whether the pin set usage of the
tool knows a keyword, so that a test skips on a tool too old for it
rather than every script requiring a newer tool.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v4:
- defer the reconnect of the reference before the restore of the test
  pin, deferred commands run last in first out
- do not let a refusal turn a test that already failed into a skip
- pick the spare pin by all its parent devices and by the operational
  state where the tool prints it, and leave it alone when the automatic
  selection took it in the meantime
- accept connected when a pin was set selectable in automatic mode,
  the device may pick the pin it was offered as its reference, also
  when the restore makes it selectable again
- end the state flood on selectable, so that the readback catches a
  setter that stores nothing
- fail when the pin dump fails or the simulated device cannot be created
- say in the header what the tests change on a device the user provided
- log a deferred restore that fails, defer drops the status of what it
  runs
- tell a pin that could not be queried from one that is in use or
  lacks a capability, and log the reason of a refusal that follows a
  failure
- take the number of state changes of the flood from one variable
- add the Reviewed-by given to v3 (Ivan Vecera)

v3:
- follow the mode of the device under test: disconnected and
  selectable in automatic mode, where the simulator is checked to
  refuse connected, connected and disconnected in manual mode, where
  the pin connected before is connected back at the end
- cycle the state flooding test through the states of automatic mode
- add the device mode getter to the library
- honor DPLL_DRIVER like dpll_basic.sh does
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll
- the Reviewed-by and Acked-by of v2 are not carried over, the
  state test changed

v2:
- quote the ksft_skip expansion (netdev CI shellcheck)

v3: https://lore.kernel.org/all/20261109093523.931201-7-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-7-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-7-poros@redhat.com/
---
 tools/testing/selftests/drivers/dpll/Makefile |   1 +
 .../selftests/drivers/dpll/dpll_features.sh   | 339 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 102 +++++-
 .../selftests/drivers/dpll/dpll_stress.sh     |  73 ++++
 4 files changed, 513 insertions(+), 2 deletions(-)
 create mode 100755 tools/testing/selftests/drivers/dpll/dpll_features.sh

diff --git a/tools/testing/selftests/drivers/dpll/Makefile b/tools/testing/selftests/drivers/dpll/Makefile
index 7e839ae71cd22f..1349d078fa2660 100644
--- a/tools/testing/selftests/drivers/dpll/Makefile
+++ b/tools/testing/selftests/drivers/dpll/Makefile
@@ -9,6 +9,7 @@ TEST_FILES := dpll_lib.sh
 
 TEST_PROGS := \
 	dpll_basic.sh \
+	dpll_features.sh \
 	dpll_stress.sh \
 # end of TEST_PROGS
 
diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
new file mode 100755
index 00000000000000..0a00a18bded2c5
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -0,0 +1,339 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# DPLL device and pin feature tests. Exercises individual dpll_device_ops
+# and dpll_pin_ops callbacks, verifying get/set roundtrips through the
+# netlink interface. By default a dpllsim device with a known pin layout
+# is created. Set DPLL_DEV_ID or DPLL_DRIVER to run against an existing
+# device instead, the checks that hold for the simulator alone then run
+# only when the script created the device, which DPLL_DRIVER=dpllsim
+# asks for.
+#
+# The tests reconfigure a spare input pin of the device and restore it
+# afterwards, see pick_tune_pin. A pin the device uses as its reference
+# is never picked, but on hardware a spare pin that carries a valid
+# signal can still be selected while a test reconfigures it, so do not
+# point the script at a device whose reference must not be disturbed.
+#
+# Copyright (c) 2026 Red Hat, Inc.
+
+SCRIPTDIR=$(dirname "$(readlink -e "${BASH_SOURCE[0]}")")
+
+source "$SCRIPTDIR/../../net/lib.sh"
+source "$SCRIPTDIR/dpll_lib.sh"
+
+# The input pins of the device under test, read once it is known.
+input_pins=()
+
+ALL_TESTS="
+	test_pin_state_transitions
+"
+
+##############################################################################
+# Pin-level feature tests
+
+# Find the input pin connected on the device, the reference of a device in
+# manual mode. Prints nothing when there is none.
+find_connected_pin()
+{
+	local pin_id
+
+	for pin_id in "${input_pins[@]}"; do
+		if [ "$(dpll_pin_get_state "$DPLL_DEV_ID" "$pin_id")" = \
+		     connected ]; then
+			echo "$pin_id"
+			return
+		fi
+	done
+}
+
+# Return 0 when PIN_TUNE_ID advertises the capability. Otherwise log the
+# test, as failed when the pin could not be queried and as skipped or
+# failed with the given reason when it lacks the capability, and return
+# 1.
+# $1: capability, $2: test name, $3: reason
+pin_tune_capable()
+{
+	dpll_pin_has_capability "$PIN_TUNE_ID" "$1"
+	case $? in
+	0)
+		return 0
+		;;
+	1)
+		dpll_log_test_skip_or_fail "$2" "$3"
+		;;
+	*)
+		check_err 1 "pin $PIN_TUNE_ID query failed"
+		log_test "$2"
+		;;
+	esac
+	return 1
+}
+
+test_pin_state_transitions()
+{
+	local mode before state after reason ref_pin
+	local states
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
+	pin_tune_capable state-can-change "DPLL pin state transitions" \
+			 "state cannot change" || return
+
+	# The states a user may request depend on the device mode, see
+	# Documentation/driver-api/dpll.rst: connected and disconnected
+	# select and deselect the reference in manual mode, selectable and
+	# disconnected offer a pin to the automatic selection or withdraw
+	# it. The simulator runs in automatic mode.
+	mode=$(dpll_device_get_mode "$DPLL_DEV_ID")
+	case "$mode" in
+	automatic)
+		states="disconnected selectable"
+		;;
+	manual)
+		states="connected disconnected"
+		;;
+	*)
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "device mode '$mode' not handled"
+		return
+		;;
+	esac
+
+	before=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "state not reported"
+		return
+	fi
+	# The automatic selection may have taken the pin since it was
+	# picked, it is the reference then and not to be touched.
+	if [ "$mode" = automatic ] && [ "$before" = connected ]; then
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "spare input pin became the reference"
+		return
+	fi
+
+	# In manual mode connecting the pin makes it the reference and
+	# takes that over from the pin connected so far, so that one is
+	# connected back at the end. The deferred commands run last in
+	# first out, so the reconnect is deferred first and runs after the
+	# restore deferred below has disconnected the test pin again. In
+	# automatic mode the pin is not connected, see how PIN_TUNE_ID is
+	# picked, and the test never connects it, the device keeps the
+	# reference it locked to.
+	ref_pin=""
+	if [ "$mode" = manual ]; then
+		ref_pin=$(find_connected_pin)
+		if [ -n "$ref_pin" ]; then
+			defer dpll_restore dpll_pin_set_state "$DPLL_DEV_ID" \
+			      "$ref_pin" connected
+		fi
+	fi
+	# Restore the original state even when the test aborts half way.
+	defer dpll_restore dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+	      "$before"
+
+	# A driver may refuse a state the capability promises, for a
+	# constraint the interface does not tell. On a device provided by
+	# the user that is a skip with the reason the tool reported, on
+	# the created device a failure, the simulator accepts both states
+	# of its mode. The test ends there, whichever set was refused, a
+	# state that was not set has nothing to read back and the deferred
+	# restores put the pins back. A refusal after a readback failed
+	# does not turn the test into a skip, see
+	# dpll_log_test_skip_or_fail. A refused restore is treated the same
+	# way when nothing failed before it, afterwards it is one more
+	# failure.
+	for state in $states; do
+		if ! dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+					"$state"; then
+			reason=${DPLL_LAST_ERR%%$'\n'*}
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin state transitions" \
+			    "cannot set pin state to $state${reason:+, $reason}"
+			return
+		fi
+		# A device in automatic mode may pick the pin it was
+		# offered as its reference, the pin reports connected
+		# then.
+		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+		if [ "$after" != "$state" ] &&
+		   [ "$mode/$state/$after" != automatic/selectable/connected ]
+		then
+			check_err 1 "pin not $state, state '$after'"
+		fi
+	done
+	state=$after
+
+	# Connected is not a state of automatic mode and the simulator
+	# refuses it. Hardware drivers are not held to that, ice for one
+	# accepts it there, and a pin with the state-connected-override
+	# capability would take over the reference, so the check runs on
+	# the device the script created only.
+	if [ "$mode" = automatic ] && [ -n "$DPLL_CREATED_DEVICE" ]; then
+		if dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+					connected; then
+			check_err 1 "connected accepted in automatic mode"
+		fi
+		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+		if [ "$after" != "$state" ]; then
+			check_err 1 "refused state changed the pin to '$after'"
+		fi
+	fi
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
+	# The automatic selection may pick a pin that is selectable again,
+	# like it may in the loop above.
+	after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ "$after" != "$before" ] &&
+	   [ "$mode/$before/$after" != automatic/selectable/connected ]; then
+		check_err 1 "pin state not restored, got '$after'"
+	fi
+
+	if [ -n "$ref_pin" ]; then
+		dpll_pin_set_state "$DPLL_DEV_ID" "$ref_pin" connected
+		check_err $? "cannot connect the reference pin $ref_pin back"
+		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$ref_pin")
+		if [ "$after" != connected ]; then
+			check_err 1 "reference pin $ref_pin is '$after'"
+		fi
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
+if [ -n "${DPLL_DEV_ID:-}" ] || [ -n "${DPLL_DRIVER:-}" ]; then
+	dpll_lib_init
+fi
+# With the module there, a device that cannot be created, registered or
+# found on netlink is a failure of what the tests cover, not a skip.
+if [ -z "${DPLL_DEV_ID:-}" ]; then
+	dpllsim_check_module
+	if ! dpllsim_setup_standard_device; then
+		echo "FAIL: cannot create dpllsim device"
+		exit "$ksft_fail"
+	fi
+	DPLL_DEV_ID=$DPLLSIM_DEV_ID
+	DPLL_CREATED_DEVICE=$DPLLSIM_CREATED_NAME
+	DPLL_MODULE_NAME="dpllsim"
+fi
+
+log_info "testing DPLL device $DPLL_DEV_ID (module $DPLL_MODULE_NAME)"
+
+# Return 0 when the pin is a spare input of the device: disconnected or
+# selectable on it and not reported as connected by any of its parent
+# devices nor, where the tool prints the operational state, as active.
+# A pin can be registered on several devices, and what a test changes
+# on it, the frequency for one, is shared by all of them. Return 1 when
+# the pin is not spare and 2 when it could not be queried.
+# $1: device id, $2: pin id
+pin_is_spare()
+{
+	local out
+
+	out=$(dpll pin show id "$2" -j 2>/dev/null) || return 2
+	jq -e --argjson dev "$1" '
+		(.pin[0]? // .) | [.["parent-device"][]?] |
+		any(.[]; .["parent-id"] == $dev and
+			 (.state == "disconnected" or
+			  .state == "selectable")) and
+		all(.[]; .state != "connected" and .operstate != "active")' \
+		<<< "$out" &> /dev/null || return 1
+}
+
+# PIN_TUNE_ID is the input pin the tests reconfigure. It must not be the
+# reference the device is locked to, so it is taken from the spare
+# inputs, see pin_is_spare. When the first dumped input pin and another
+# one both qualify the other one is taken, drivers tend to list their
+# primary reference first. Tests that need the pin skip when there is
+# none rather than reconfiguring the reference. A pin that cannot be
+# queried is a failure, not a pin that is in use.
+pick_tune_pin()
+{
+	local pin_id
+
+	PIN_TUNE_ID=""
+	for pin_id in "${input_pins[@]}"; do
+		pin_is_spare "$DPLL_DEV_ID" "$pin_id"
+		case $? in
+		0)
+			;;
+		1)
+			continue
+			;;
+		*)
+			echo "FAIL: cannot query pin $pin_id"
+			exit "$ksft_fail"
+			;;
+		esac
+		PIN_TUNE_ID=$pin_id
+		[ "$pin_id" != "${input_pins[0]}" ] && return
+	done
+}
+
+# A dump that failed is not a device without input pins.
+if ! dpll_pin_ids_read input_pins dpll_pin_find_by_direction \
+		       "$DPLL_DEV_ID" input; then
+	echo "FAIL: cannot dump the pins of DPLL device $DPLL_DEV_ID"
+	exit "$ksft_fail"
+fi
+pick_tune_pin
+
+tests_run
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 2da8cbe8a883ef..783db2a4dbc180 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -7,7 +7,7 @@
 # script calls dpll_lib_check_prereqs and dpll_lib_lock first, and
 # dpll_lib_init when it can run against an existing device. net/lib.sh
 # must be sourced first, it provides ksft_skip, ksft_fail, busywait and
-# log_info.
+# log_info to the library and defer to the scripts.
 #
 # Copyright (c) 2026 Red Hat, Inc.
 #
@@ -88,6 +88,44 @@ dpll_lib_lock()
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
 # force a specific device. Otherwise DPLL_DRIVER names the driver whose
 # first device is taken, by the module name the device reports, dpllsim
@@ -155,7 +193,8 @@ DPLL_CREATED_DEVICE=""
 # known, so a missing pin, attribute or capability on it can only mean a
 # failed query or broken tooling. Report such a condition as a failure
 # on the created device and as a skip on a device the user provided,
-# where it is a property of the hardware.
+# where it is a property of the hardware. A test that recorded a failure
+# before stays failed on either, a skip would hide that failure.
 # $1: test name, $2: reason
 dpll_log_test_skip_or_fail()
 {
@@ -165,6 +204,11 @@ dpll_log_test_skip_or_fail()
 	if [ -n "$DPLL_CREATED_DEVICE" ]; then
 		check_err 1 "$reason on the device created by the test"
 		log_test "$name"
+	elif [ "$RET" -ne 0 ]; then
+		# The failed test reports the message of its first failure,
+		# so this reason is logged next to it.
+		log_test "$name"
+		log_info "$name: $reason"
 	else
 		log_test_skip "$name" "$reason"
 	fi
@@ -203,6 +247,11 @@ dpll_device_get_module()
 	__dpll_device_field "$1" '.["module-name"]'
 }
 
+dpll_device_get_mode()
+{
+	__dpll_device_field "$1" '.mode'
+}
+
 # Look up the netlink device id by the clock-id chosen at create time,
 # restricted to the devices of the given module when one is named. The
 # clock-id is the only reliable handle on a device the test created, as
@@ -373,6 +422,55 @@ dpll_pin_get_state()
 	__dpll_pin_dev_field "$1" "$2" '.state'
 }
 
+# Return 0 when the pin advertises the given capability, named as
+# iproute2 prints it (state-can-change, priority-can-change, ...), 1
+# when it does not and 2 when the pin could not be queried.
+dpll_pin_has_capability()
+{
+	local pin_id=$1
+	local name=$2
+	local out
+
+	out=$(dpll pin show id "$pin_id" -j 2>/dev/null) || return 2
+	jq -e --arg name "$name" \
+	   '(.pin[0]? // .) | (.capabilities // []) | index($name) != null' \
+	   <<< "$out" &> /dev/null || return 1
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
+# Run a setter that puts a pin back and log when it fails. The scripts
+# defer their restores through this, defer drops the status of what it
+# runs and a pin left changed would go unnoticed.
+# $1...: setter and its arguments
+dpll_restore()
+{
+	local reason
+
+	"$@" && return 0
+	reason=${DPLL_LAST_ERR%%$'\n'*}
+	log_info "restore failed: $*${reason:+, $reason}"
+}
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
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
index b21325d8368fb2..396d44c7bbe351 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -15,6 +15,7 @@ source "$SCRIPTDIR/dpll_lib.sh"
 
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
@@ -133,6 +135,77 @@ test_rapid_create_delete()
 	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
 }
 
+test_pin_state_flooding()
+{
+	local clock_id name dev_id pin_ids pin_id i last state fails=0
+	local changes=${STRESS_STATE_CHANGES:-50}
+	# The states of automatic mode, the mode the simulator runs in. A
+	# fresh pin is disconnected, so the flood ends on selectable, the
+	# last change takes states[0] whatever their number, and the
+	# readback after it catches a setter that stores nothing.
+	local states=(selectable disconnected)
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
+		dpll_pin_ids_read pin_ids dpll_pin_find_by_direction \
+				  "$dev_id" input
+		check_err $? "pin dump failed"
+		pin_id=${pin_ids[0]:-}
+		if [ -z "$pin_id" ]; then
+			check_err 1 "no input pin on stress device"
+		else
+			for i in $(seq 1 "$changes"); do
+				last=${states[(changes - i) % 2]}
+				dpll_pin_set_state "$dev_id" "$pin_id" \
+						   "$last" ||
+					fails=$((fails + 1))
+			done
+			if [ "$fails" -gt 0 ]; then
+				check_err 1 \
+				    "$fails of $changes state changes failed"
+			fi
+			# A device in automatic mode may pick the pin it
+			# was offered as its reference, the pin reports
+			# connected then.
+			state=$(dpll_pin_get_state "$dev_id" "$pin_id")
+			case "$state" in
+			selectable|connected)
+				;;
+			*)
+				check_err 1 \
+				    "state expected '$last', got '$state'"
+				;;
+			esac
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
-- 
2.56.0


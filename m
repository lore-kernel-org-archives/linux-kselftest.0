Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597590;
	b=DTRjah3LFk23H9ajSakXu3ChTD2WnjGectiU4r9wufPazaZJ3B+SsgcLT3rBCksbWkB5
	 bYZCSD+41fK6kuAnDDKfVHbbEFprd8yfWVpjZ90dhuAdvvpIhOAl2F6pCQG9T/CvqF2Bu
	 Vzjv3ww76BV5YzWEns6YosgWJ1BR7gbhura9KbQGNAdU8zhfhUkuRYoYaEplUrT4Lc2gW
	 JCy1UbjUvuMyofPeT3o7v0qWAkInLspN5e5IfcL9BAfVfHym4O6igmN2LpJEVYbAHGkoz
	 tSVoOU/vwwprIagro6Yc9kGI5Op+dSHjZPNEPJFMIwjbsHizTDQl99pG/kpXMzBz3hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597590;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=kTxLKP3LG93zgXDr1b4pQlZfnhmTDRxbcKvpC6x9WQQ=;
	b=h3NLnL/HoNc1NK3CbT0icxe5+CqLIew7eim65mQVhLVZmHPUNH5BjKs0YolFeHbbLBkg
	 aDSWNZd3OA3zyN9qPAbWBX6YxYObE9Z83RJyAJptV4YzlfjRZueHvjK6V0xSkWJ7mqLj5
	 m+esLtgH5zcaQMDqRf1SeG0/KBvKM4Viq8O6zshSMqdqWoISiyJgiTRxEXn8u4RlnBIqJ
	 cpibLTS3DGr0w10FiZIqYvWYqxHujGVNy3xVNdaNYUuuCKTBXDE/7MSsRzToS8FhyQ3O0
	 /5wKjamxecnvsOQSB4ntJEH9yfV6DUXROAMUyT0FFFjwsLrrqScs03+QIzEUZfx9rSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hy7xLkWa;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE2C606A333
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DE2C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hy7xLkWa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTxLKP3LG93zgXDr1b4pQlZfnhmTDRxbcKvpC6x9WQQ=;
	b=hy7xLkWaDLUBnIh6ak649Diqy0ISo6xBILWyFwNlw/ET0Y+nQ8hDTVMCfSnjm+YSCa9ysq
	P5qSaIRTaOV1sl2f2N0A5Ti/xkBUYY/LVBVbvSAmI4UlqfjBj0N4e+y5wj6iyUeNh5XdiK
	VM5CuC2EbgSNAnYJsz0oMoElvOrSIQQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-3J9JfWcPP9ueN5Ldo69eeg-1; Wed,
 25 Nov 2026 09:06:22 +0000
X-MC-Unique: 3J9JfWcPP9ueN5Ldo69eeg-1
X-Mimecast-MFC-AGG-ID: 3J9JfWcPP9ueN5Ldo69eeg_1795597580
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57F12195604A;
	Wed, 25 Nov 2026 09:06:20 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB2CD195B3C5;
	Wed, 25 Nov 2026 09:06:14 +0000 (UTC)
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
Subject: [PATCH net-next v5 06/14] selftests: dpll: add pin state tests
Date: Wed, 25 Nov 2026 10:05:13 +0100
Message-ID: <20261125090522.3777494-7-poros@redhat.com>
In-Reply-To: <20261125090522.3777494-1-poros@redhat.com>
References: <20261125090522.3777494-1-poros@redhat.com>
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

Add dpll_features.sh, a script that exercises individual pin callbacks
with get/set roundtrips over netlink. It creates a dpllsim device with
the standard pin layout by default or runs against the device named by
DPLL_DEV_ID or the first device of the driver named by DPLL_DRIVER, and
picks the pin to reconfigure up front, so that no test touches the
reference the device is locked to. The pin is an input that is
disconnected or selectable on the device and that none of its parent
devices reports as connected or, where the tool prints the operational
state, as active, since a pin can be registered on several devices. A
parent device that is locked or in holdover and shows no such input
hides its reference, so no pin is picked then, while an unlocked device
has no reference yet. The NCO input of zl3073x, which iproute2 prints as
a pin of unknown type so far, and both pins of a connected reference
sync pair are left alone. The comment above pin_is_spare has the
details. When the first input pin and another one both qualify the other
one is taken, drivers tend to list their primary reference first. Every
test checks again that the pin is spare before it changes it. A spare
pin can still be selected while a test reconfigures it, which the header
of the script points out.

The first test moves that pin between disconnected and selectable, the
states of automatic mode as Documentation/driver-api/dpll.rst defines
them, reads the state back after each step and restores the original
state at the end. On the device the script created it then checks that
connected is refused. Hardware drivers are not held to refusing
connected, ice accepts it in automatic mode, and a pin with the
state-connected-override capability would take over the reference. On a
device provided by the user a disconnected pin is offered to the
selection only when its priority ranks below the one of the reference on
every device it is registered on, it could take over otherwise, and the
readback accepts that the device picked the pin as its reference. Manual
mode, where connecting the pin makes it the reference, is left out until
the simulator can change its mode, a device provided by the user in
manual mode is a skip.

A driver may refuse a state the capability promises, for a constraint
the interface does not tell. That is a skip on a device provided by the
user, with the reason the tool reported, and a failure on the device the
script created, whose simulator accepts both states of its mode. A
refusal that follows a failed readback leaves the test failed,
dpll_log_test_skip_or_fail no longer turns a recorded failure into a
skip. The restore is deferred right after the original state is read. It
acts only while the pin is changed, when the test ends early or its own
restore was refused, one that gets to the end otherwise restores the pin
itself and checks it. The cleanup handler of every script that defers
runs the pending restores before it removes the devices the script
created, so that an interrupted run puts the device back as well. defer
reports nothing about what it runs, so the restores go through
dpll_restore, which logs one that fails, fails the run and returns its
status. A pin that cannot be queried is a failure, not a pin that is in
use or lacks a capability, and so is a device that does not report its
mode or the state of the pin, both are mandatory.

The stress script gains a test that floods one input pin of a fresh
device with changes between the states of automatic mode and ends on
selectable, the state a fresh pin is not in, so that the readback after
the flood catches a setter that stores nothing. The library gains the
state setter both use, which keeps the extack line of the tool in
DPLL_LAST_ERR so that a test can tell a refusal from a failure, the
device mode getter and a check whether the pin set usage of the tool
knows a keyword, so that a test skips on a tool too old for it rather
than every script requiring a newer tool.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- take a pin a device reports active as its reference, zl3073x
  reports the reference of automatic mode as selectable
- pick a pin only when every device it is registered on shows which
  input it uses or reports unlocked, that is not locked to any input
  yet; a device that is locked or in holdover without one hides its
  reference and the pin cannot be told from it
- leave out the NCO input of zl3073x, which no iproute2 release names
  so far and prints as a pin of unknown type, and both pins of a
  connected reference sync pair, the sync source is named by the dump
  of the other pin only
- check right before the test that the pin is still spare, by all its
  parent devices and the operational state instead of its state on
  the device alone
- skip the state test when the state read before it is neither
  disconnected nor selectable, the selection may have taken the pin
  since the check, and say that zl3073x keeps reporting a pin it
  selected as selectable
- leave manual mode out of the state test until the simulator can
  change its mode, no device in this series could run it
- report a pin state that cannot be read back as such, not as a wrong
  state, in the state test and after the state flood
- return the status of a failed restore from dpll_restore,
  DEFER_PAUSE_ON_FAIL stops on it
- offer a disconnected pin to the automatic selection of a device
  provided by the user only when it ranks below the reference on
  every device it is registered on, ice shares the state of a pin
  between its devices, and not at all when one of them has no
  reference and would lock to it
- accept a reference picked by the selection in automatic mode only
  on a device provided by the user, the simulator selects no pin
- fail when the device does not report its mode or the pin its state,
  both are mandatory
- skip the deferred restores once the test restored the pin itself
- ignore further signals in the INT and TERM handler and run the
  cleanup from it, see patch 2
- correct the comment on what the keyword check of the pin set usage
  accepts
- call the script a pin feature test in its header, no device
  callback is exercised yet, and say there what the tests leave alone
- skip the state flood when STRESS_STATE_CHANGES is not a positive
  number, the readback had no change to compare with
- say in the comment on the lock that a run of the feature tests
  against a device the user provided takes it as well
- report a failed pin dump of the state flood once, it counted as a
  missing input pin as well
- keep the state that was set when a readback in the loop failed, the
  check of the refused state compared with an empty one
- keep the deferred restores armed when a restore of the test itself
  is refused on a run that failed before
- check the flood count with the helper of the other stress tests
- say in the header that a pin sharing its input with another one, as
  U.FL2 with SMA2 on E810-T, changes that one too
- fail the run when a deferred restore fails, a refused restore left
  the pin changed behind a skip
- run a deferred restore only while the pin is changed, a refused write
  of the value the pin still held failed the run; TUNE_CHANGED is
  raised before a set of another value, so that a signal during the set
  restores the pin too, and cleared when the set is refused or the
  restore of the test went through, tune_restore checks it for the
  priority, frequency and phase adjust tests as well
- keep the commit message in its four paragraphs on the choice of the
  pin, the state test, refusals and restores, and the flood test, and
  the changelog with one item per review comment
- the Reviewed-by of v4 is not carried over, the state test changed

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

v4: https://lore.kernel.org/all/20261112130359.840795-7-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-7-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-7-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-7-poros@redhat.com/
---
 tools/testing/selftests/drivers/dpll/Makefile |   1 +
 .../selftests/drivers/dpll/dpll_features.sh   | 477 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 116 ++++-
 .../selftests/drivers/dpll/dpll_stress.sh     |  73 +++
 4 files changed, 662 insertions(+), 5 deletions(-)
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
index 00000000000000..61ebfd9e718922
--- /dev/null
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -0,0 +1,477 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# DPLL pin feature tests. Exercises individual dpll_pin_ops callbacks,
+# verifying get/set roundtrips through the netlink interface. By default
+# a dpllsim device with a known pin layout is created. Set DPLL_DEV_ID or
+# DPLL_DRIVER to run against an existing device instead, the checks that
+# hold for the simulator alone then run only when the script created the
+# device, which DPLL_DRIVER=dpllsim asks for.
+#
+# The tests reconfigure a spare input pin of the device and restore it
+# afterwards, see pin_is_spare. A pin is taken only when it can be told
+# from the reference of every device it is registered on, and the tests
+# leave alone what could change the input a device uses. The state test
+# runs in automatic mode only, and on a device the user provided it
+# offers a disconnected pin to the automatic selection only when it
+# ranks below the reference. A spare pin can still be selected while a
+# test reconfigures it, when the reference fails meanwhile or when an
+# unlocked device is about to lock to it. A pin that shares its input with
+# another one, as U.FL2 does with SMA2 on E810-T, does not show that
+# through the interface, and reconfiguring it changes the other pin too.
+# So do not point the script at a device that must not be disturbed.
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
+# 1 while a test that tunes PIN_TUNE_ID may have left the pin at another
+# value than the one it found. It is raised before a set of another value,
+# a signal is handled only once the set returned, and lowered when the set
+# was refused or the restore of the test went through.
+TUNE_CHANGED=0
+
+# Run a deferred restore of a test that tunes PIN_TUNE_ID while the pin is
+# changed, the test returned early or its own restore was refused. A pin
+# that holds the value the test found needs no write, and a device may
+# refuse one for a reason of its own, ice while it resets, which would
+# fail the run, see dpll_restore.
+# $1...: setter and its arguments
+tune_restore()
+{
+	[ "$TUNE_CHANGED" -eq 1 ] || return 0
+	dpll_restore "$@"
+}
+
+# Return 0 when the pin ranks below the reference on every device it is
+# registered on, a lower value ranks higher, so that offering it to the
+# automatic selection cannot make any of them switch to it. A device
+# that shows no reference counts against the pin, an unlocked one would
+# lock to it. Return 1 otherwise and 2 when the pins could not be dumped.
+# $1: pin id
+pin_ranks_below_refs()
+{
+	local out
+
+	out=$(dpll pin show -j 2>/dev/null) || return 2
+	jq -e --argjson id "$1" '
+		(.pin? // [.]) as $pins |
+		[$pins[] | select(.id == $id) | .["parent-device"][]?] as $on |
+		($on | length) > 0 and
+		all($on[]; . as $mine |
+			[$pins[] | .["parent-device"][]? |
+			 select(.["parent-id"] == $mine["parent-id"] and
+				.direction == "input" and
+				(.state == "connected" or
+				 .operstate == "active")) | .prio] as $refs |
+			($refs | length) > 0 and
+			($mine.prio | type) == "number" and
+			all($refs[]; type == "number" and . < $mine.prio))' \
+		<<< "$out" &> /dev/null || return 1
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
+# Return 0 when PIN_TUNE_ID is still a spare input, see pin_is_spare. The
+# automatic selection may take it while the tests run, a test leaves it
+# alone then. Otherwise log the test as skipped or failed, or as failed
+# when the devices or the pins could not be dumped, and return 1.
+# $1: test name
+pin_tune_spare()
+{
+	pin_is_spare "$DPLL_DEV_ID" "$PIN_TUNE_ID"
+	case $? in
+	0)
+		return 0
+		;;
+	1)
+		dpll_log_test_skip_or_fail "$1" \
+		    "the input pin is not spare any more"
+		;;
+	*)
+		check_err 1 "device or pin dump failed"
+		log_test "$1"
+		;;
+	esac
+	return 1
+}
+
+test_pin_state_transitions()
+{
+	local mode before state after reason may_pick changed
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
+	# In automatic mode selectable and disconnected offer a pin to the
+	# automatic selection or withdraw it, see
+	# Documentation/driver-api/dpll.rst. The simulator runs in automatic
+	# mode. Manual mode, where connecting the pin makes it the reference,
+	# is not covered until the simulator can change its mode, a device
+	# the user provided in that mode is a skip. The mode and the state of
+	# a pin on a device are mandatory, an empty one is a query that
+	# failed.
+	mode=$(dpll_device_get_mode "$DPLL_DEV_ID")
+	case "$mode" in
+	automatic)
+		;;
+	"")
+		check_err 1 "device mode not reported"
+		log_test "DPLL pin state transitions"
+		return
+		;;
+	*)
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "device mode '$mode' not covered"
+		return
+		;;
+	esac
+
+	pin_tune_spare "DPLL pin state transitions" || return
+	before=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$before" ]; then
+		check_err 1 "pin state not reported"
+		log_test "DPLL pin state transitions"
+		return
+	fi
+	# The selection may have taken the pin since pin_tune_spare
+	# looked, ice reports it connected then. The test would withdraw
+	# the reference, and the restore would write connected, which ice
+	# takes for disabling the input.
+	case "$before" in
+	disconnected|selectable)
+		;;
+	*)
+		dpll_log_test_skip_or_fail "DPLL pin state transitions" \
+		    "the input pin is not spare any more"
+		return
+		;;
+	esac
+	# Offering a disconnected pin to the automatic selection hands it
+	# its priority, and with a better one than the reference it takes
+	# over once its signal qualifies. A driver may share the state of a
+	# pin between the devices it is registered on, ice does. So on a
+	# device the user provided the pin is offered only when it ranks
+	# below the reference on every one of them. A device without a
+	# reference would lock to the pin and counts against it.
+	if [ -z "$DPLL_CREATED_DEVICE" ] && [ "$before" = disconnected ]; then
+		pin_ranks_below_refs "$PIN_TUNE_ID"
+		case $? in
+		0)
+			;;
+		1)
+			log_test_skip "DPLL pin state transitions" \
+			    "the spare input pin could be selected"
+			return
+			;;
+		*)
+			check_err 1 "pin dump failed"
+			log_test "DPLL pin state transitions"
+			return
+			;;
+		esac
+	fi
+
+	# The pin is not connected, see how PIN_TUNE_ID is picked, and the
+	# test never connects it, the device keeps the reference it locked
+	# to. The deferred restore runs only while the pin is in another state
+	# than the test found, when the test returns early or its own
+	# restore was refused. One that gets to the end puts the pin back
+	# itself and checks it.
+	# A device the user provided may pick the pin it was offered in
+	# automatic mode as its reference, ice reports the pin connected
+	# then, zl3073x keeps reporting it selectable. The simulator selects
+	# no pin and reports the state it was set to.
+	may_pick=""
+	[ -z "$DPLL_CREATED_DEVICE" ] && may_pick=1
+	TUNE_CHANGED=0
+	defer tune_restore dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+	      "$before"
+
+	# A driver may refuse a state the capability promises, for a
+	# constraint the interface does not tell. On a device provided by
+	# the user that is a skip with the reason the tool reported, on
+	# the created device a failure, the simulator accepts both states.
+	# The test ends there, whichever set was refused, a state that was
+	# not set has nothing to read back and the deferred restore puts the
+	# pin back when an earlier set changed it. A refusal after a
+	# readback failed does not turn the test into a skip, see
+	# dpll_log_test_skip_or_fail. A refused restore is treated the same
+	# way when nothing failed before it, afterwards it is one more
+	# failure. When the deferred restore is refused as well the run
+	# fails, see dpll_restore.
+	for state in disconnected selectable; do
+		changed=$TUNE_CHANGED
+		[ "$state" = "$before" ] || TUNE_CHANGED=1
+		if ! dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+					"$state"; then
+			TUNE_CHANGED=$changed
+			reason=${DPLL_LAST_ERR%%$'\n'*}
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin state transitions" \
+			    "cannot set pin state to $state${reason:+, $reason}"
+			return
+		fi
+		[ "$state" = "$before" ] && TUNE_CHANGED=0
+		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+		if [ -z "$after" ]; then
+			check_err 1 "cannot read the pin state back"
+		elif [ "$after" != "$state" ] &&
+		     [ "$may_pick/$state/$after" != 1/selectable/connected ]
+		then
+			check_err 1 "pin not $state, state '$after'"
+		fi
+	done
+	# A pin the selection picked may report connected. A readback that
+	# failed was reported above and leaves the state that was set.
+	if [ -n "$after" ]; then
+		state=$after
+	fi
+
+	# Connected is not a state of automatic mode and the simulator
+	# refuses it. Hardware drivers are not held to that, ice for one
+	# accepts it there, and a pin with the state-connected-override
+	# capability would take over the reference, so the check runs on
+	# the device the script created only.
+	if [ -n "$DPLL_CREATED_DEVICE" ]; then
+		changed=$TUNE_CHANGED
+		TUNE_CHANGED=1
+		if dpll_pin_set_state "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+					connected; then
+			check_err 1 "connected accepted in automatic mode"
+		else
+			TUNE_CHANGED=$changed
+		fi
+		after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+		if [ -z "$after" ]; then
+			check_err 1 "cannot read the pin state back"
+		elif [ "$after" != "$state" ]; then
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
+	else
+		TUNE_CHANGED=0
+	fi
+	# The automatic selection may pick a pin that is selectable again,
+	# like it may in the loop above.
+	after=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the restored pin state back"
+	elif [ "$after" != "$before" ] &&
+	     [ "$may_pick/$before/$after" != 1/selectable/connected ]; then
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
+# again has to be in place before. INT and TERM run the cleanup as well,
+# so that a timeout imposed by the harness still restores the device, and
+# ignore any further signal, an exit inside the cleanup would end the
+# teardown half way. Their handler drops the exit trap and calls the
+# cleanup itself, a signal that comes while the script exits is handled
+# before the exit trap gets to the cleanup, and the exit of the handler
+# would end the exit trap there.
+trap cleanup EXIT
+trap 'trap "" INT TERM; trap - EXIT; cleanup; exit 1' INT TERM
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
+# Return 0 when the pin is a spare input of the device, one a test can
+# reconfigure without touching a reference. That takes all of this:
+# - The pin is disconnected or selectable on the device, and no device it
+#   is registered on reports it as connected or, where the tool prints
+#   the operational state, as active. What a test changes on a pin, the
+#   frequency for one, is shared by all its devices.
+# - Every device it is registered on shows which input it uses, or
+#   reports the lock status unlocked, which the uAPI defines as not
+#   locked to any valid input yet. A device that is locked or in holdover
+#   has or had a reference, and when no input shows as connected or
+#   active the pin cannot be told from it. zl3073x marks the reference of
+#   automatic mode by the operational state alone, which iproute2 up to
+#   7.1 does not print.
+# - It is not the NCO input of zl3073x, connecting that puts the channel
+#   in NCO mode. No iproute2 release names that pin type so far, the
+#   tool prints it as unknown, so a pin of a type the tool cannot name
+#   is left alone as well.
+# - It is in no connected reference sync pair, neither as the pin that
+#   carries the base frequency, whose dump lists the pair, nor as the
+#   sync source, which only the dump of the other pin names.
+# Return 1 when the pin is not spare and 2 when the devices or the pins
+# could not be dumped.
+# $1: device id, $2: pin id
+pin_is_spare()
+{
+	local devs pins
+
+	devs=$(dpll device show -j 2>/dev/null) || return 2
+	pins=$(dpll pin show -j 2>/dev/null) || return 2
+	jq -e -s --argjson dev "$1" --argjson id "$2" '
+		(.[0].device? // [.[0]]) as $devs |
+		(.[1].pin? // [.[1]]) as $pins |
+		[$pins[] | .["parent-device"][]? |
+		 select(.direction == "input" and
+			(.state == "connected" or .operstate == "active")) |
+		 .["parent-id"]] as $shown |
+		[$devs[] | select(.["lock-status"] != "unlocked") | .id]
+		as $held |
+		($pins[] | select(.id == $id)) as $pin |
+		[$pin["parent-device"][]?] as $on |
+		$pin.type != "int-nco" and $pin.type != "unknown" and
+		all($pin["reference-sync"][]?; .state != "connected") and
+		all($pins[] | .["reference-sync"][]?;
+		    .id != $id or .state != "connected") and
+		any($on[]; .["parent-id"] == $dev and
+			   (.state == "disconnected" or
+			    .state == "selectable")) and
+		all($on[]; .state != "connected" and
+			   .operstate != "active" and
+			   (.["parent-id"] as $p |
+			    ($shown | index($p)) != null or
+			    ($held | index($p)) == null))' \
+		<<< "$devs"$'\n'"$pins" &> /dev/null || return 1
+}
+
+# PIN_TUNE_ID is the input pin the tests reconfigure. It must not be a
+# reference, so it is taken from the spare inputs, see pin_is_spare.
+# When the first dumped input pin and another one both qualify the other
+# one is taken, drivers tend to list their primary reference first.
+# Tests that need the pin skip when there is none rather than
+# reconfiguring a reference. A dump that fails is a failure, not a
+# device without a spare pin.
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
+			echo "FAIL: cannot dump the DPLL devices and pins"
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
index 19e652a8e8da4e..6a80177e1e0306 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -7,8 +7,8 @@
 # script calls dpll_lib_check_prereqs first, then dpll_lib_lock unless it
 # only reads a device the user named, and dpll_lib_init when it can run
 # against an existing device. net/lib.sh
-# must be sourced first, it provides ksft_skip, ksft_fail, busywait and
-# log_info.
+# must be sourced first, the library uses its exit codes, its logging
+# and its busywait, the scripts its defer as well.
 #
 # Copyright (c) 2026 Red Hat, Inc.
 #
@@ -60,8 +60,10 @@ dpll_lib_check_prereqs()
 # The scripts that create dpllsim devices share the one dpllsim directory
 # and cannot run alongside each other, so each takes a lock on
 # DPLL_LOCK_FILE before it mounts or creates anything and skips when
-# another run holds it. The file lives under /run rather than in the
-# world-writable /tmp, where a planted symlink could redirect the open.
+# another run holds it. A run of the feature tests against a device the
+# user provided takes it as well, two of them would change the same
+# pins. The file lives under /run rather than in the world-writable
+# /tmp, where a planted symlink could redirect the open.
 DPLL_RUN_DIR="/run/dpll-selftest"
 DPLL_LOCK_FILE="$DPLL_RUN_DIR/lock"
 DPLL_LOCK_FD=""
@@ -98,6 +100,45 @@ dpll_lib_lock()
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
+# count, and the keyword must follow a blank or an opening bracket and
+# be followed by a blank or the end of the line, a hyphenated compound
+# that contains it does not count.
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
@@ -175,7 +216,8 @@ DPLL_CREATED_DEVICE=""
 # known, so a missing pin, attribute or capability on it can only mean a
 # failed query or broken tooling. Report such a condition as a failure
 # on the created device and as a skip on a device the user provided,
-# where it is a property of the hardware.
+# where it is a property of the hardware. A test that recorded a failure
+# before stays failed on either, a skip would hide that failure.
 # $1: test name, $2: reason
 dpll_log_test_skip_or_fail()
 {
@@ -185,6 +227,11 @@ dpll_log_test_skip_or_fail()
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
@@ -223,6 +270,11 @@ dpll_device_get_module()
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
@@ -395,6 +447,60 @@ dpll_pin_get_state()
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
+# defer their restores through this, defer reports nothing about what
+# it runs and a pin left changed would go unnoticed. A failed restore
+# fails the run, since the test that deferred it has logged its result
+# already and defer drops the status. The status of the setter is
+# returned as well, DEFER_PAUSE_ON_FAIL stops on a failed restore.
+# $1...: setter and its arguments
+dpll_restore()
+{
+	local reason
+
+	"$@" && return 0
+	reason=${DPLL_LAST_ERR%%$'\n'*}
+	log_info "restore failed: $*${reason:+, $reason}"
+	EXIT_STATUS=$(ksft_exit_status_merge "$EXIT_STATUS" "$ksft_fail")
+	return 1
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
index 55b2a1acde47a1..3c859825750974 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -13,10 +13,12 @@ source "$SCRIPTDIR/dpll_lib.sh"
 
 ALL_TESTS="
 	test_rapid_create_delete
+	test_pin_state_flooding
 	test_deploy_cycle
 "
 
 STRESS_ITERATIONS=${STRESS_ITERATIONS:-20}
+STRESS_STATE_CHANGES=${STRESS_STATE_CHANGES:-50}
 
 CREATED_DEVICES=()
 
@@ -43,6 +45,7 @@ cleanup()
 
 	local dev
 
+	defer_scopes_cleanup
 	for dev in "${CREATED_DEVICES[@]}"; do
 		dpllsim_delete_device "$dev" ||
 			log_info "cannot delete device $dev"
@@ -155,6 +158,76 @@ test_rapid_create_delete()
 	log_test "DPLL rapid create/delete ($STRESS_ITERATIONS iterations)"
 }
 
+test_pin_state_flooding()
+{
+	local clock_id name dev_id pin_ids pin_id i last state fails=0
+	local changes=$STRESS_STATE_CHANGES
+	# The states of automatic mode, the mode the simulator runs in. A
+	# fresh pin is disconnected, so the flood ends on selectable, the
+	# last change takes states[0] whatever their number, and the
+	# readback after it catches a setter that stores nothing.
+	local states=(selectable disconnected)
+
+	RET=0
+
+	# The readback compares with the last change, so there has to be
+	# one.
+	stress_counts_valid "DPLL pin state flooding" STRESS_STATE_CHANGES ||
+		return
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
+		if ! dpll_pin_ids_read pin_ids dpll_pin_find_by_direction \
+				       "$dev_id" input; then
+			check_err 1 "pin dump failed"
+		elif [ "${#pin_ids[@]}" -eq 0 ]; then
+			check_err 1 "no input pin on stress device"
+		else
+			pin_id=${pin_ids[0]}
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
+			state=$(dpll_pin_get_state "$dev_id" "$pin_id")
+			if [ -z "$state" ]; then
+				check_err 1 "cannot read the pin state back"
+			elif [ "$state" != "$last" ]; then
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
-- 
2.56.1


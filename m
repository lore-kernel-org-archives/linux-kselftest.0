Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488680;
	b=RGXex6dUN6v1vp7jzFc8JtN2fdACAz10nelsH66me0kgkt6/kpUbzwdFdHYF9qJ0eSYV
	 1sxgC5DJu+ufyoaVWfvzXnwdNKylv2dm/wtgJcLdGCUhKTDEAQ+cnDRxJSDJlfrl33Fa7
	 uMYFm6pHe6KsIg6JEApLl8ndpY20IkicPYVf7ltQXMzAD0VE6P14sJvOhG8SnPOA9DXA0
	 Y3/3HJ4ZQOSDR0Eo68zj5thqnaTfuUrQ9KX5e4nkDB8+d4zDghnkOsmaOZRO0ljZVAl4v
	 BrexuFXnoua/hW7mwzF0VHZfDs/R9rwKsKEeLlae7NS1aQYAwrCbb1nTuTWTge83ZZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488680;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=iIgC2UJs/J+OWP3OnvPJhhvB990bewZLEaf8cdWFDZk=;
	b=Q+mdikyxD4/7A4EjG+AOxLiIlVXrrvgbk53iBfRki9uM4nrFSlSSu3c7lwljuaGsXEuL
	 xJ4IvbkCy6iKE7iWgAo9AV4yJEE3TYuOwt+lAK6762zWW6p1152L+jhsU7CaccYyv8Tq+
	 +iy27Wtqq/N5zePi895r48n5aVL0BMgmX7xIyZ4WrFZwXg9Uc0TYFLJhaSeP2TqLlIvyc
	 GaTA4tazw8ptDnxDHfg+a3RYIboVQp120h0dDAsxSIa77vMWucH+DpaM7aTz6ojUPUM+x
	 eutYyy3nBNXs1nSOMrDj5W2SVdeiqk6mq2D0Fd6PIdYvE56XdslwbCu1UhD1HHe6AQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GWvDt5NE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DFC606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DFC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GWvDt5NE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIgC2UJs/J+OWP3OnvPJhhvB990bewZLEaf8cdWFDZk=;
	b=GWvDt5NEC06UthBgZHMg8VFGnGfVVCWsLbIfWvDIQcYxP0Ygf+1nNwvxQv9bft5U3cKQbP
	rrLviPxGfbiHdz3RyW3VUNe//19wkui6VDWf1+X+v1FOlqjOtpvmNpHN2mUVjLcEc8zdKS
	vT+5vdGjeXouFxIaUPyx0raRcTa9jMY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-CefRNoM5POuZlyAn5iH4Jg-1; Thu,
 12 Nov 2026 08:04:35 -0500
X-MC-Unique: CefRNoM5POuZlyAn5iH4Jg-1
X-Mimecast-MFC-AGG-ID: CefRNoM5POuZlyAn5iH4Jg_1794488672
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B5D31955E9C;
	Thu, 12 Nov 2026 13:04:32 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 77CF21956087;
	Thu, 12 Nov 2026 13:04:27 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@nvidia.com>,
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
Subject: [PATCH net-next v4 04/14] selftests: dpll: add pin enumeration and property tests
Date: Thu, 12 Nov 2026 14:03:49 +0100
Message-ID: <20261112130359.840795-5-poros@redhat.com>
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

Extend the library with pin queries. Pins of a device are collected
from the full pin dump with jq, since older iproute2 lacks the device
filter of "pin show", and the fields that live in the parent-device
nest are read through a helper that selects the nest of the device
under test. The helpers that work on the full dump normalize its shape
the same way the id-based ones do, so that a tool printing a flat
object instead of the dump wrapper works with all of them. Like the
device queries, every pin query runs the tool first and jq on what it
printed, so that a query which fails returns the status of the tool
instead of the empty output a missing attribute produces too. The
prerequisite check now also requires a tool that knows "pin show", so
that a tool too old for the pin queries is a skip up front rather than
a failed query in every test. The dpllsim helpers gain
dpllsim_add_pin, which creates a pin directory and writes its type,
frequency and direction, and the standard device grows a GNSS input,
an external input and an external output.

The helpers that print a list of pin ids are read through
dpll_pin_ids_read, which keeps their status where a process
substitution or a pipeline would drop it, so that a pin dump that fails
is reported as a failure rather than as a device without pins.

dpll_basic.sh checks that the enumeration yields a numeric id for every
pin of the device, the ids are taken from the dump as they are and jq
prints null for a pin without one, that every pin has an id and a type
and carries the direction in the parent-device nest, and that an input
pin reports a valid state. The property test does not go on to query
pins by an id that is not one, and reports a pin it cannot query at all
as one failure rather than as one per attribute. The frequency is not
required, a pin without a frequency callback does not report one. The
device the script created has the standard pins, so an empty pin list
or a missing input pin on it means a failed query or broken tooling
rather than a pinless device. The library gains
dpll_log_test_skip_or_fail for such conditions, which fails on the
device the script created, recorded in DPLL_CREATED_DEVICE next to
DPLL_DEV_ID, and skips on a device the user provided. The stress script
creates its devices with a random set of pins of every type and both
directions, MUX pins always as inputs, and the deploy cycle test runs
with the standard pin set.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v4:
- read the pin lists through dpll_pin_ids_read, which keeps the status
  of the dump, so that a failed dump is a failure and not a device
  without pins
- correct the comment on pins without a parent-device nest

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v2:
- quote the ksft_skip and ret expansions (netdev CI shellcheck)

v3: https://lore.kernel.org/all/20261109093523.931201-5-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-5-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-5-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_basic.sh      | 164 +++++++++++++-
 .../selftests/drivers/dpll/dpll_lib.sh        | 205 +++++++++++++++++-
 .../selftests/drivers/dpll/dpll_stress.sh     |  46 +++-
 3 files changed, 390 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_basic.sh b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
index 2f9a4370088a79..c6b223d1368c4a 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_basic.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_basic.sh
@@ -1,11 +1,12 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 #
-# Basic DPLL subsystem test. Read-only validation of the device properties
-# exposed over netlink. Runs against a hardware DPLL device when one is
-# present (or when DPLL_DEV_ID is set), otherwise against a freshly
-# created dpllsim device. DPLL_DRIVER names the driver to take the
-# device from, dpllsim for a created one although hardware is present.
+# Basic DPLL subsystem test. Read-only validation of device and pin
+# enumeration and of the properties exposed over netlink. Runs against a
+# hardware DPLL device when one is present (or when DPLL_DEV_ID is set),
+# otherwise against a freshly created dpllsim device. DPLL_DRIVER names
+# the driver to take the device from, dpllsim for a created one although
+# hardware is present.
 #
 # Copyright (c) 2026 Red Hat, Inc.
 
@@ -16,8 +17,29 @@ source "$SCRIPTDIR/dpll_lib.sh"
 
 ALL_TESTS="
 	test_device_properties
+	test_pin_enumeration
+	test_pin_properties
+	test_pin_state
 "
 
+# Fail on every entry of a pin id list that is not a number. The ids are
+# taken from the dump as they are, so a pin without one shows up as the
+# "null" jq prints for a missing field, not as an empty line. Return 1
+# when any entry is invalid.
+check_pin_ids()
+{
+	local id ret=0
+
+	for id in "$@"; do
+		if ! [[ "$id" =~ ^[0-9]+$ ]]; then
+			check_err 1 "invalid pin id '$id'"
+			ret=1
+		fi
+	done
+
+	return "$ret"
+}
+
 test_device_properties()
 {
 	local json
@@ -43,6 +65,129 @@ test_device_properties()
 	log_test "DPLL device properties"
 }
 
+test_pin_enumeration()
+{
+	local pin_ids
+
+	RET=0
+
+	# A dump that failed is not a device without pins.
+	if ! dpll_pin_ids_read pin_ids dpll_pin_get_ids "$DPLL_DEV_ID"; then
+		check_err 1 "pin dump failed"
+		log_test "DPLL pin enumeration"
+		return
+	fi
+	if [ "${#pin_ids[@]}" -eq 0 ]; then
+		dpll_log_test_skip_or_fail "DPLL pin enumeration" \
+		    "no pins found"
+		return
+	fi
+	check_pin_ids "${pin_ids[@]}"
+
+	log_test "DPLL pin enumeration (${#pin_ids[@]} pins)"
+}
+
+check_pin_properties()
+{
+	local pin_id=$1
+	local json field
+
+	# A pin that cannot be queried at all would be reported as one
+	# that misses every attribute, so bail out on that first.
+	if ! json=$(dpll_pin_json "$pin_id") || [ -z "$json" ]; then
+		check_err 1 "pin $pin_id query failed"
+		return
+	fi
+
+	# Frequency is optional, a pin without a frequency callback such
+	# as a recovered clock pin does not report it.
+	for field in '.id' '.type'; do
+		if ! jq -e "$field" <<< "$json" &> /dev/null; then
+			check_err 1 \
+			    "pin $pin_id is missing the $field attribute"
+		fi
+	done
+
+	# A pin registered on a parent pin has no parent-device nest, but
+	# when the device under test is in it, that entry must carry the
+	# direction. A pin can be registered on more than one device, so
+	# match on parent-id instead of taking the first entry.
+	if jq -e --argjson dev "$DPLL_DEV_ID" \
+		'[.["parent-device"][]? | select(.["parent-id"] == $dev)] |
+		 length > 0' <<< "$json" &> /dev/null; then
+		if ! jq -e --argjson dev "$DPLL_DEV_ID" \
+			'.["parent-device"][]? |
+			 select(.["parent-id"] == $dev) | .direction' \
+			<<< "$json" &> /dev/null; then
+			check_err 1 \
+			    "pin $pin_id parent-device is missing direction"
+		fi
+	fi
+}
+
+test_pin_properties()
+{
+	local pin_ids pin_id
+
+	RET=0
+
+	if ! dpll_pin_ids_read pin_ids dpll_pin_get_ids "$DPLL_DEV_ID"; then
+		check_err 1 "pin dump failed"
+		log_test "DPLL pin properties"
+		return
+	fi
+	if [ "${#pin_ids[@]}" -eq 0 ]; then
+		dpll_log_test_skip_or_fail "DPLL pin properties" "no pins found"
+		return
+	fi
+	if ! check_pin_ids "${pin_ids[@]}"; then
+		log_test "DPLL pin properties"
+		return
+	fi
+
+	for pin_id in "${pin_ids[@]}"; do
+		check_pin_properties "$pin_id"
+	done
+
+	log_test "DPLL pin properties (${#pin_ids[@]} pins)"
+}
+
+test_pin_state()
+{
+	local pin_ids pin_id state
+
+	RET=0
+
+	if ! dpll_pin_ids_read pin_ids dpll_pin_find_by_direction \
+			       "$DPLL_DEV_ID" input; then
+		check_err 1 "pin dump failed"
+		log_test "DPLL pin state"
+		return
+	fi
+	pin_id=${pin_ids[0]:-}
+	if [ -z "$pin_id" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin state" "no input pin"
+		return
+	fi
+
+	# The pin was found through its parent-device nest for this device
+	# and the state is mandatory there, so an empty value is a failed
+	# query rather than a state.
+	state=$(dpll_pin_get_state "$DPLL_DEV_ID" "$pin_id")
+	case "$state" in
+	"")
+		check_err 1 "cannot read the state of pin $pin_id"
+		;;
+	connected|disconnected|selectable)
+		;;
+	*)
+		check_err 1 "pin $pin_id reports invalid state '$state'"
+		;;
+	esac
+
+	log_test "DPLL pin state"
+}
+
 ##############################################################################
 
 cleanup()
@@ -50,9 +195,9 @@ cleanup()
 	# A second signal must not abort the teardown half way.
 	trap '' INT TERM
 
-	if [ -n "$CREATED_DEVICE" ]; then
-		dpllsim_delete_device "$CREATED_DEVICE" ||
-			log_info "cannot delete device $CREATED_DEVICE"
+	if [ -n "$DPLL_CREATED_DEVICE" ]; then
+		dpllsim_delete_device "$DPLL_CREATED_DEVICE" ||
+			log_info "cannot delete device $DPLL_CREATED_DEVICE"
 	fi
 	# The device whose creation a signal interrupted is recorded by the
 	# library alone, a double delete of a tracked one is harmless.
@@ -68,7 +213,6 @@ dpll_lib_check_prereqs
 # lock in the library.
 dpll_lib_lock
 
-CREATED_DEVICE=""
 # The device selection and the module check may mount configfs, so the
 # exit trap that unmounts it again has to be in place before. INT and
 # TERM exit through it as well, so that a timeout imposed by the harness
@@ -86,8 +230,8 @@ if [ -z "$DPLL_DEV_ID" ]; then
 		echo "FAIL: cannot create dpllsim device"
 		exit "$ksft_fail"
 	fi
-	CREATED_DEVICE=$DPLLSIM_CREATED_NAME
 	DPLL_DEV_ID=$DPLLSIM_DEV_ID
+	DPLL_CREATED_DEVICE=$DPLLSIM_CREATED_NAME
 	DPLL_MODULE_NAME="dpllsim"
 fi
 
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 9fe7f2f62dd460..2da8cbe8a883ef 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -46,6 +46,10 @@ dpll_lib_check_prereqs()
 		echo "SKIP: dpll tool too old, missing 'device show'"
 		exit "$ksft_skip"
 	fi
+	if ! dpll pin help 2>&1 | grep -q "show"; then
+		echo "SKIP: dpll tool too old, missing 'pin show'"
+		exit "$ksft_skip"
+	fi
 }
 
 # The scripts that create dpllsim devices share the one dpllsim directory
@@ -142,14 +146,39 @@ __dpll_lib_dump_failed()
 	exit "$ksft_fail"
 }
 
+# Name of the dpllsim device a script created as the device under test,
+# set by the script next to DPLL_DEV_ID. Empty when the user provided
+# the device.
+DPLL_CREATED_DEVICE=""
+
+# The layout and the capabilities of the device a script created are
+# known, so a missing pin, attribute or capability on it can only mean a
+# failed query or broken tooling. Report such a condition as a failure
+# on the created device and as a skip on a device the user provided,
+# where it is a property of the hardware.
+# $1: test name, $2: reason
+dpll_log_test_skip_or_fail()
+{
+	local name=$1
+	local reason=$2
+
+	if [ -n "$DPLL_CREATED_DEVICE" ]; then
+		check_err 1 "$reason on the device created by the test"
+		log_test "$name"
+	else
+		log_test_skip "$name" "$reason"
+	fi
+}
+
 ##############################################################################
 # Device queries
 #
 # "dpll device show id X -j" may print either a flat object or a dump-style
 # {"device":[...]} wrapper depending on the iproute2 version, so normalize
-# with (.device[0]? // .) before extracting fields. The tool is run first
-# and jq only on what it printed, so that a failed query returns its
-# status instead of the empty output a missing field produces too.
+# with (.device[0]? // .) before extracting fields, same for pins. The
+# device helpers run the tool first and jq only on what it printed, so
+# that a failed query returns its status instead of the empty output a
+# missing field produces too.
 
 dpll_device_json()
 {
@@ -231,12 +260,126 @@ dpll_device_wait_gone_by_clock_id()
 	busywait "$BUSYWAIT_TIMEOUT" __dpll_device_absent_by_clock_id "$@"
 }
 
+##############################################################################
+# Pin queries
+#
+# Attributes of the pin itself are read by pin id alone. Attributes that
+# live in the parent-device nest (state, prio, ...) take the device id in
+# addition, to select the nest of the device under test. The helpers
+# that work on the full pin dump normalize its shape like the id-based
+# ones do, with (.pin? // [.]), so that a flat object would work too.
+# Like the device queries, every helper runs the tool first and jq only
+# on what it printed, and returns 1 when the tool failed.
+
+dpll_pin_json()
+{
+	local pin_id=$1
+	local out
+
+	out=$(dpll pin show id "$pin_id" -j 2>/dev/null) || return 1
+	jq '(.pin[0]? // .)' <<< "$out"
+}
+
+__dpll_pin_field()
+{
+	local pin_id=$1; shift
+	local out
+
+	out=$(dpll pin show id "$pin_id" -j 2>/dev/null) || return 1
+	jq -r "(.pin[0]? // .) | $1 // empty" <<< "$out"
+}
+
+# Fields living in the parent-device nest matching the given device
+__dpll_pin_dev_field()
+{
+	local dev_id=$1
+	local pin_id=$2; shift 2
+	local out
+
+	out=$(dpll pin show id "$pin_id" -j 2>/dev/null) || return 1
+	jq -r --argjson dev "$dev_id" \
+	   "(.pin[0]? // .) | .[\"parent-device\"][]? |
+	    select(.[\"parent-id\"] == \$dev) | $1 // empty" <<< "$out"
+}
+
+# Print ids of all pins belonging to the device, one per line: pins
+# registered on the device directly plus pins registered on those pins
+# (MUX children), followed recursively so that children of children are
+# included too. Older iproute2 lacks the "pin show device <id>" filter,
+# so filter the full dump with jq.
+dpll_pin_get_ids()
+{
+	local dev_id=$1
+	local out
+
+	out=$(dpll pin show -j 2>/dev/null) || return 1
+	jq -r --argjson dev "$dev_id" '
+		(.pin? // [.]) as $pins |
+		def children($ids):
+			[$pins[] | select(any(.["parent-pin"][]?;
+					     .["parent-id"] as $p |
+					     $ids | index($p))) | .id];
+		def closure($ids):
+			(($ids + children($ids)) | unique) as $n |
+			if ($n | length) == ($ids | length) then $ids
+			else closure($n) end;
+		closure([$pins[] |
+			 select(any(.["parent-device"][]?;
+				    .["parent-id"] == $dev)) | .id])
+		as $all |
+		$pins[] | select(.id as $i | $all | index($i)) | .id' \
+		<<< "$out"
+}
+
+# Print ids of all non-MUX pins of the device with the given direction
+# (input/output), one per line. Direction lives in the parent-device nest.
+dpll_pin_find_by_direction()
+{
+	local dev_id=$1
+	local dir=$2
+	local out
+
+	out=$(dpll pin show -j 2>/dev/null) || return 1
+	jq -r --argjson dev "$dev_id" --arg dir "$dir" \
+	   '(.pin? // [.])[] | select(.type != "mux") |
+	    select(.["parent-device"][]? |
+		   (.["parent-id"] == $dev and .direction == $dir)) |
+	    .id' <<< "$out"
+}
+
+# Run a helper that prints one pin id per line, dpll_pin_get_ids or
+# dpll_pin_find_by_direction with its arguments, and store the ids in the
+# array named by $1. Return 1 when the helper failed, the status a
+# process substitution or a pipeline would drop, so that a caller can
+# tell a failed dump from a device without such pins.
+# $1: array name, $2...: helper and its arguments
+dpll_pin_ids_read()
+{
+	local -n __dpll_ids=$1; shift
+	local out
+
+	__dpll_ids=()
+	out=$("$@") || return 1
+	[ -z "$out" ] || mapfile -t __dpll_ids <<< "$out"
+}
+
+dpll_pin_get_frequency()
+{
+	__dpll_pin_field "$1" '.frequency'
+}
+
+dpll_pin_get_state()
+{
+	__dpll_pin_dev_field "$1" "$2" '.state'
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
-# Each directory under $DPLLSIM_CFG is one simulated device. Writing 1 to
-# <dev>/live registers the device with the DPLL core, writing 0
-# unregisters it. The structure (clock_id) can only be changed while the
+# Each directory under $DPLLSIM_CFG is one simulated device; its pins are
+# directories under <dev>/pins/. Writing 1 to <dev>/live registers the
+# device and its pins with the DPLL core, writing 0 unregisters them. The
+# structure (pins, clock_id, pin attributes) can only be changed while the
 # device is not live.
 #
 # dpllsim_available loads the dpllsim module and mounts configfs when
@@ -324,6 +467,28 @@ dpllsim_create_device()
 	fi
 }
 
+# $1: device name, $2: pin name (becomes the board-label), $3: type (gnss,
+# int-oscillator, ext, synce-eth-port, mux), $4: frequency in Hz,
+# $5: direction (input/output)
+dpllsim_add_pin()
+{
+	local dev=$1
+	local pin=$2
+	local type=$3
+	local frequency=$4
+	local direction=$5
+	local pin_path="$DPLLSIM_CFG/$dev/pins/$pin"
+
+	mkdir "$pin_path" 2>/dev/null || return 1
+
+	if ! echo "$type" 2>/dev/null > "$pin_path/type" ||
+	   ! echo "$frequency" 2>/dev/null > "$pin_path/frequency" ||
+	   ! echo "$direction" 2>/dev/null > "$pin_path/direction"; then
+		rmdir "$pin_path" 2>/dev/null
+		return 1
+	fi
+}
+
 dpllsim_deploy()
 {
 	echo 1 2>/dev/null > "$DPLLSIM_CFG/$1/live"
@@ -334,17 +499,22 @@ dpllsim_undeploy()
 	echo 0 2>/dev/null > "$DPLLSIM_CFG/$1/live"
 }
 
-# Take the device offline and remove it. Every step is attempted even
-# when an earlier one failed, the return value is non-zero when any did.
-# A device that does not exist counts as deleted.
+# Take the device offline and remove it together with all its pins.
+# Every step is attempted even when an earlier one failed, the return
+# value is non-zero when any did. A device that does not exist counts as
+# deleted.
 dpllsim_delete_device()
 {
 	local dev_path="$DPLLSIM_CFG/$1"
-	local ret=0
+	local pin_path ret=0
 
 	[ -d "$dev_path" ] || return 0
 
 	dpllsim_undeploy "$1" || ret=1
+	for pin_path in "$dev_path"/pins/*/; do
+		[ -d "$pin_path" ] || continue
+		rmdir "$pin_path" || ret=1
+	done
 	rmdir "$dev_path" || ret=1
 
 	return "$ret"
@@ -357,8 +527,12 @@ dpllsim_alloc_clock_id()
 	DPLLSIM_CLOCK_ID=$((DPLLSIM_NEXT_CLOCK_ID++))
 }
 
-# Create a device, deploy it and resolve the netlink device id. Sets
-# DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and DPLLSIM_DEV_ID.
+# Create a device with the standard 3-pin layout, deploy it and resolve
+# the netlink device id. Sets DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and
+# DPLLSIM_DEV_ID.
+#   gnss0: GNSS, 1 Hz, input
+#   ext0: EXT, 10 MHz, input
+#   out0: EXT, 10 MHz, output
 dpllsim_setup_standard_device()
 {
 	local clock_id name
@@ -368,6 +542,13 @@ dpllsim_setup_standard_device()
 	name="std$clock_id"
 	dpllsim_create_device "$name" "$clock_id" || return 1
 
+	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input ||
+	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input ||
+	   ! dpllsim_add_pin "$name" out0 ext 10000000 output; then
+		dpllsim_delete_device "$name"
+		return 1
+	fi
+
 	if ! dpllsim_deploy "$name"; then
 		dpllsim_delete_device "$name"
 		return 1
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
index 01d57ab0172b0f..b21325d8368fb2 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -58,15 +58,47 @@ cleanup()
 	dpll_lib_cleanup
 }
 
-# Create a device named after the given clock-id and deploy it. Sets
-# DPLLSIM_CREATED_NAME.
+# Pin type and a frequency the simulator supports for it.
+STRESS_PIN_KINDS=(
+	"gnss 1"
+	"ext 10000000"
+	"ext 25000000"
+	"synce-eth-port 10000000"
+	"int-oscillator 25000000"
+	"mux 2048000"
+)
+
+# Create a device named after the given clock-id with the given pin count
+# and deploy it. Sets DPLLSIM_CREATED_NAME.
 create_stress_device()
 {
 	local clock_id=$1
+	local num_pins=$2
 	local name="st$clock_id"
+	local i type freq dir
+	local dirs=(input output)
 
 	dpllsim_create_device "$name" "$clock_id" || return 1
 
+	# Always have at least one plain input pin, then random ones
+	if ! dpllsim_add_pin "$name" ext0 ext 10000000 input; then
+		dpllsim_delete_device "$name"
+		return 1
+	fi
+	for i in $(seq 1 $((num_pins - 1))); do
+		read -r type freq <<< \
+			"${STRESS_PIN_KINDS[RANDOM % ${#STRESS_PIN_KINDS[@]}]}"
+		# A MUX pin is an input selector, the simulator rejects an
+		# output one
+		dir=${dirs[RANDOM % 2]}
+		[ "$type" = mux ] && dir=input
+		if ! dpllsim_add_pin "$name" "pin$i" "$type" "$freq" \
+				     "$dir"; then
+			dpllsim_delete_device "$name"
+			return 1
+		fi
+	done
+
 	if ! dpllsim_deploy "$name"; then
 		dpllsim_delete_device "$name"
 		return 1
@@ -84,7 +116,7 @@ test_rapid_create_delete()
 	for i in $(seq 1 "$STRESS_ITERATIONS"); do
 		dpllsim_alloc_clock_id; clock_id=$DPLLSIM_CLOCK_ID
 
-		if ! create_stress_device "$clock_id"; then
+		if ! create_stress_device "$clock_id" 5; then
 			check_err 1 "failed to create device (iteration $i)"
 			break
 		fi
@@ -116,6 +148,14 @@ test_deploy_cycle()
 	fi
 	track_device "$name"
 
+	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input ||
+	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input ||
+	   ! dpllsim_add_pin "$name" out0 ext 10000000 output; then
+		check_err 1 "cannot add pins"
+		log_test "DPLL deploy/undeploy cycling"
+		return
+	fi
+
 	for i in $(seq 1 "$STRESS_ITERATIONS"); do
 		if ! dpllsim_deploy "$name"; then
 			check_err 1 "deploy failed (iteration $i)"
-- 
2.56.0


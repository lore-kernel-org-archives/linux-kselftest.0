Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597598;
	b=FhRLrDYLMo6zIqvfWb1nCofdG6ySAZEqo6YEHD+earIkS5dDWciyFzba6odYx2rP8N7S
	 oozYr7HrTHHbehpauc2pQ57Ra7RG/zY6th/PY7x9OQ7GaUkV+eqMmoayIX5FrTYo8WIBa
	 0Ea+CKP43Wv96MsFZgO+Cpy44pIaMUg0tsUcyjyoEFNZHkR098UTlmlF+7Vy3m7TUfyM4
	 9f7cky/Ha8rWxUSvCMY3FM5F4bG6TdFpdVfSKh5GW9qNAdKv/XS5cUTwGBh18Bktw6ENy
	 EBnllN9+ciwzR6St0c60zmO3vbQKoCNoNaBfSYT/1NUmfcSFV2WDq26oTyNt08p/Z1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597598;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=fjjfYlIiii3n2jE45mcabWFCrd/7dMLb4hoddwK42fk=;
	b=Uq8+GRZcGZecGgCXg8vYpqT+YeqPk2rEgebBtmVqG4fDBgPSYq7j3vOC9YpaU8xOKVir
	 9Y7x9CKGqlOeuwFDz4i/pIF/KqIzHxxW1v9X48eM6Tp1/zG1kyUa9JGtMvMKl9BiYnsHE
	 n4aB5rClTuyvVwkGMkIWNMiwhYhn0CQn6HBstOFqbxKelpbpSDUxZdUnjydzPGRyPYiq/
	 yvxBoL3/afkfKc0RvTfQD+6KdEiWs2kPTYjvQZ8YiCMkP+tp+9dfyho8+4tMjpAbhW91c
	 Amr3O9Ev7n8wUiez0ntD7XHgnRVtgLUii3tHF/jf/gg/z1YPYZ9Xb+yaIrBUuKD0FFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wz8M5gon;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79968606A332
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79968606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wz8M5gon
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjjfYlIiii3n2jE45mcabWFCrd/7dMLb4hoddwK42fk=;
	b=Wz8M5gonbjQ+upVs3Srtw3D64o+/t8IsqE6sXG5eLFs+i0vaUdj0SVkh5FI9yWk0Zu/ePI
	N29wchIiDyOZ1QLzMBYGWghsdi7CCRTekRKmVK9v1R0fAjFvqjovfbxb9+LFbQ1n54hLwm
	2reJB8XMCIeUfCClYuzy0RE0eq9k724=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-Y8IxctLhP_miprhIO_rfDg-1; Wed,
 25 Nov 2026 09:06:33 +0000
X-MC-Unique: Y8IxctLhP_miprhIO_rfDg-1
X-Mimecast-MFC-AGG-ID: Y8IxctLhP_miprhIO_rfDg_1795597591
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 386F918002C6;
	Wed, 25 Nov 2026 09:06:31 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B6287195B3C8;
	Wed, 25 Nov 2026 09:06:25 +0000 (UTC)
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
Subject: [PATCH net-next v5 08/14] selftests: dpll: add pin priority test
Date: Wed, 25 Nov 2026 10:05:15 +0100
Message-ID: <20261125090522.3777494-9-poros@redhat.com>
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

Add a test that sets a new priority on an input pin, reads it back and
restores the original value. The range of priorities a device accepts is
not advertised over netlink, so the test tries the two values above the
current one first, none above 255 though, ice hands the priority to its
firmware as 8 bits and a larger value would turn into a small one that
ranks high. A lower value ranks higher, and in automatic mode a
selectable pin that outranks the reference takes over from it once its
signal qualifies, so one below the current value and the small values 1
and 7 are tried only when the selection does not consider the pin, in
manual mode or when the pin is disconnected. A driver may still refuse
all of the values for a constraint the interface does not tell, so that
is a skip on a device provided by the user, with the reason the tool
reported, and a failure on the device the script created, whose
simulator accepts every value the test tries. A current value the device
does not take back could not be restored, so the test writes it back
once before it touches the pin, which changes nothing, and ends there
when that is refused. The test skips when the dpll tool lacks the prio
keyword of pin set, and the restore is deferred right after that write
so that an interrupted run restores the value too. A pin that does not
advertise the priority-can-change capability or does not report a
priority is a skip on a device provided by the user and a failure on the
device the script created, whose input pins have both.

The dpllsim_add_pin helper gains an optional priority argument, which is
written only when it is given, so that a pin without one keeps the
default of the simulator. A priority is accepted for input pins only,
so the callers pass one for those alone.

The standard device lays its inputs out as gnss0 with priority 0 and
ext0 with priority 1, the plain input pin every stress device has gets
priority 1 as well and its extra input pins get random ones.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- try the values above the current priority first and the ones that
  rank higher only when the pin is out of the selection, a selectable
  pin that outranks the reference could take over from it
- try no value above 255, ice truncates the priority to 8 bits and
  256 would become 0, the highest one
- fail when the device does not report its mode or the pin its state
- check that the pin is still spare before the test, and fail when
  its priority cannot be queried
- correct the commit message on the candidates and on the priorities
  of the stress devices
- drop the claim about ice and 255 from the changelog and say that it
  is the input pins of the created device that have a priority
- name the reason the tool reported when the restore fails
- report a value that cannot be read back as such, not as a wrong one
- add the priorities in dpllsim_add_standard_pins, the one copy of the
  standard layout now
- say in the changelog that the plain input pin of the stress devices
  gets priority 1
- skip the deferred restore once the test restored the priority itself,
  ice refuses any write while it resets and a refused repeat would fail
  the run
- leave the deferred restore out when nothing was changed, and take a
  refused restore of the test like the state test does, a skip when
  nothing failed before it, the deferred one tries again
- count the pin as changed from before the set of the new value, see
  patch 6
- say why the last two candidates are 1 and 7, both lie in the 0 to 14
  zl3073x accepts and one of them differs from the current value
- skip the test when the state read before the candidates is neither
  disconnected nor selectable, as the state test does, the selection
  may have taken the pin since the spare check
- the Reviewed-by and Acked-by of v4 are not carried over, the test
  changed

v4:
- write the current priority back before the pin is touched and end
  the test when the device refuses it, the pin could not be restored
- say that the simulator accepts every value the test tries, not every
  priority, and drop "active reference" from the layout comment
- tell a failed capability query from a missing capability and log a
  deferred restore that fails

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v4: https://lore.kernel.org/all/20261112130359.840795-9-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-9-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-9-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-9-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 133 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        |  32 ++++-
 .../selftests/drivers/dpll/dpll_stress.sh     |  11 +-
 3 files changed, 166 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index 61ebfd9e718922..34e6b28ee224c5 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -33,6 +33,7 @@ input_pins=()
 
 ALL_TESTS="
 	test_pin_state_transitions
+	test_pin_priority_get_set
 "
 
 ##############################################################################
@@ -130,6 +131,138 @@ pin_tune_spare()
 	return 1
 }
 
+test_pin_priority_get_set()
+{
+	local before target after reason candidate mode state
+	local -a candidates
+
+	RET=0
+
+	if [ -z "$PIN_TUNE_ID" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "no spare input pin"
+		return
+	fi
+	if ! dpll_pin_set_supports prio; then
+		log_test_skip "DPLL pin priority set/get" \
+		    "dpll tool lacks pin set prio"
+		return
+	fi
+	pin_tune_capable priority-can-change "DPLL pin priority set/get" \
+			 "priority cannot change" || return
+	pin_tune_spare "DPLL pin priority set/get" || return
+
+	# A query that failed is not a pin without a priority.
+	if ! before=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID"); then
+		check_err 1 "pin $PIN_TUNE_ID query failed"
+		log_test "DPLL pin priority set/get"
+		return
+	fi
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "prio not reported"
+		return
+	fi
+	# A device may report a priority it does not accept back, one that
+	# marks an unused pin for instance, and the pin could not be
+	# restored then. Writing the current value changes nothing, so
+	# that is tried before the pin is touched.
+	if ! dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "cannot write the current prio back${reason:+, $reason}"
+		return
+	fi
+	TUNE_CHANGED=0
+	defer tune_restore dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+	      "$before"
+
+	# A lower value ranks higher, and in automatic mode a pin that is
+	# selectable and outranks the reference takes over from it once its
+	# signal qualifies. So the values above the current one are tried
+	# first, and the ones that rank higher only when the selection does
+	# not consider the pin, in manual mode or when it is disconnected.
+	# The accepted range is not advertised, a refusal of all of them is
+	# a skip on a device the user provided, the simulator accepts every
+	# value tried here. No value above 255 is tried, ice hands the
+	# priority to its firmware as 8 bits and a larger value would turn
+	# into a small one, which ranks high. The last two, 1 and 7, lie in
+	# the 0 to 14 zl3073x accepts, and one of them differs from the
+	# current value whatever it is.
+	mode=$(dpll_device_get_mode "$DPLL_DEV_ID")
+	state=$(dpll_pin_get_state "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$mode" ] || [ -z "$state" ]; then
+		check_err 1 "device mode or pin state not reported"
+		log_test "DPLL pin priority set/get"
+		return
+	fi
+	# The selection may have taken the pin since pin_tune_spare
+	# looked, as in the state test, and a priority that ranks lower
+	# could make the device leave it for another input.
+	case "$state" in
+	disconnected|selectable)
+		;;
+	*)
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "the input pin is not spare any more"
+		return
+		;;
+	esac
+	candidates=("$((before + 1))" "$((before + 2))")
+	if [ "$mode" != automatic ] || [ "$state" = disconnected ]; then
+		candidates+=("$((before - 1))" 1 7)
+	fi
+	target=""
+	reason="no value left to try"
+	for candidate in "${candidates[@]}"; do
+		[ "$candidate" -ge 0 ] && [ "$candidate" -le 255 ] &&
+			[ "$candidate" != "$before" ] || continue
+		TUNE_CHANGED=1
+		if dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+				     "$candidate"; then
+			target=$candidate
+			break
+		fi
+		TUNE_CHANGED=0
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+	done
+	if [ -z "$target" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "cannot set a new prio${reason:+, $reason}"
+		return
+	fi
+	after=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the priority back"
+	elif [ "$after" != "$target" ]; then
+		check_err 1 "priority expected $target, got '$after'"
+	fi
+
+	# A refused restore is taken like in the state test, the deferred
+	# one tries again.
+	if ! dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		reason=${reason:+, $reason}
+		if [ "$RET" -eq 0 ]; then
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin priority set/get" \
+			    "cannot restore pin priority$reason"
+			return
+		fi
+		check_err 1 "cannot restore pin priority$reason"
+	else
+		TUNE_CHANGED=0
+	fi
+	after=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the restored priority back"
+	elif [ "$after" != "$before" ]; then
+		check_err 1 "priority not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin priority set/get"
+}
+
 test_pin_state_transitions()
 {
 	local mode before state after reason may_pick changed
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 6a80177e1e0306..b67dba21ba9b4b 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -462,6 +462,11 @@ dpll_pin_has_capability()
 	   <<< "$out" &> /dev/null || return 1
 }
 
+dpll_pin_get_prio()
+{
+	__dpll_pin_dev_field "$1" "$2" '.prio'
+}
+
 ##############################################################################
 # Pin setters
 #
@@ -501,6 +506,16 @@ dpll_pin_set_state()
 			     state "$state" 2>&1 >/dev/null)
 }
 
+dpll_pin_set_prio()
+{
+	local dev_id=$1
+	local pin_id=$2
+	local prio=$3
+
+	DPLL_LAST_ERR=$(dpll pin set id "$pin_id" parent-device "$dev_id" \
+			     prio "$prio" 2>&1 >/dev/null)
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
@@ -620,7 +635,9 @@ dpllsim_create_device()
 
 # $1: device name, $2: pin name (becomes the board-label), $3: type (gnss,
 # int-oscillator, ext, synce-eth-port, mux), $4: frequency in Hz,
-# $5: direction (input/output)
+# $5: direction (input/output), $6: prio (optional, input pins only).
+# The priority is written only when one is given, so a pin without one
+# keeps the default of the simulator.
 dpllsim_add_pin()
 {
 	local dev=$1
@@ -628,13 +645,16 @@ dpllsim_add_pin()
 	local type=$3
 	local frequency=$4
 	local direction=$5
+	local prio=${6:-}
 	local pin_path="$DPLLSIM_CFG/$dev/pins/$pin"
 
 	mkdir "$pin_path" 2>/dev/null || return 1
 
 	if ! echo "$type" 2>/dev/null > "$pin_path/type" ||
 	   ! echo "$frequency" 2>/dev/null > "$pin_path/frequency" ||
-	   ! echo "$direction" 2>/dev/null > "$pin_path/direction"; then
+	   ! echo "$direction" 2>/dev/null > "$pin_path/direction" ||
+	   { [ -n "$prio" ] &&
+	     ! echo "$prio" 2>/dev/null > "$pin_path/prio"; }; then
 		rmdir "$pin_path" 2>/dev/null
 		return 1
 	fi
@@ -702,16 +722,16 @@ dpllsim_alloc_clock_id()
 # not live. Return 1 when a pin cannot be added.
 dpllsim_add_standard_pins()
 {
-	dpllsim_add_pin "$1" gnss0 gnss 1 input &&
-	dpllsim_add_pin "$1" ext0 ext 10000000 input &&
+	dpllsim_add_pin "$1" gnss0 gnss 1 input 0 &&
+	dpllsim_add_pin "$1" ext0 ext 10000000 input 1 &&
 	dpllsim_add_pin "$1" out0 ext 10000000 output
 }
 
 # Create a device with the standard 3-pin layout, deploy it and resolve
 # the netlink device id. Sets DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and
 # DPLLSIM_DEV_ID.
-#   gnss0: GNSS, 1 Hz, input
-#   ext0: EXT, 10 MHz, input
+#   gnss0: GNSS, 1 Hz, input, prio 0
+#   ext0: EXT, 10 MHz, input, prio 1
 #   out0: EXT, 10 MHz, output
 dpllsim_setup_standard_device()
 {
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
index 3c859825750974..1596c3f1e70b55 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -78,7 +78,7 @@ create_stress_device()
 	local clock_id=$1
 	local num_pins=$2
 	local name="st$clock_id"
-	local i type freq dir
+	local i type freq dir prio
 	local dirs=(input output)
 
 	if ! dpllsim_create_device "$name" "$clock_id"; then
@@ -87,7 +87,7 @@ create_stress_device()
 	fi
 
 	# Always have at least one plain input pin, then random ones
-	if ! dpllsim_add_pin "$name" ext0 ext 10000000 input; then
+	if ! dpllsim_add_pin "$name" ext0 ext 10000000 input 1; then
 		dpllsim_delete_device "$name" || track_device "$name"
 		return 1
 	fi
@@ -98,8 +98,11 @@ create_stress_device()
 		# output one
 		dir=${dirs[RANDOM % 2]}
 		[ "$type" = mux ] && dir=input
-		if ! dpllsim_add_pin "$name" "pin$i" "$type" "$freq" \
-				     "$dir"; then
+		# Only input pins accept a priority
+		prio=""
+		[ "$dir" = input ] && prio=$((RANDOM % 128))
+		if ! dpllsim_add_pin "$name" "pin$i" "$type" "$freq" "$dir" \
+				     "$prio"; then
 			dpllsim_delete_device "$name" || track_device "$name"
 			return 1
 		fi
-- 
2.56.1


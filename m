Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488720;
	b=Yth353OkrRtBGtu7drEvAZOa4e6cKSlZYsZecge4vitv0wdGk33dgDo1XqmfwmXVGpdi
	 SBY9WcZJzbLEqXMjtxQJdwoZCmMElSH120n7jp4BNQ/XQxPRYqey4MhEmD1Bx/mpYqGVY
	 rwqIsuZs9iiCHeRna8XgS1IWDakdfC/U6CMvSwZrwUVqkdQ77CDH0hRipXRud8rzOR7FE
	 j9FAP9GbzC1/5hg7WPXjm7I9crQb+dXg0DUV1jjlP4rPua21A8eii1Ggo30Z8XixCg68C
	 9ipUf8eNBoVS/GByGKT3+QeqTAKPbhjzqygbqXfuwPQZYGkvw1WrMfHtDovMsj4to8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488720;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=fqFBWa0sJGN+YXmp9mIovTjqJm0J726p1DqOZhnUNWQ=;
	b=g+fJ3qgGf1wbo+sN6R5iPsFNzOlc6wtxzZtCmTNrUyVrs9CO0irX6XDvsoOYBayv42QP
	 ZflaTtNFuYpnztpz0u1tD/GsjY7P065YzVJT8GGdBWFwk4ryp2U5uofHQ1AmHkAN2M+Fv
	 rh6UNDNPJWFYlmQigKTZG5gS7J/9TYwk9KGRJfjuIaoU+DsAAdU997f1pndDRrx2uWK64
	 7hIyxsQ5VfyQMS1rUPDWVtpk8DaXu4v7robcjjjLvVpK1ULchvGOZqDG+uIKEAkrosdKN
	 w9CQTA4zidtKxxvkD3qxQ7IR+OmUe4ukjtJUeqClOWmB2vkj1R5xDRav3Ov+uzrXwnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MeYuPeui;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD47606A885
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD47606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MeYuPeui
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fqFBWa0sJGN+YXmp9mIovTjqJm0J726p1DqOZhnUNWQ=;
	b=MeYuPeuijY21bNlmG74Eal/w5jc18V+NJRUlNqnMOwPRH5rDi7ZH5Np5PYSfC3PjMWgS3J
	0+2cM0uf2pEMwTFCeq9EDrZcXhmYakz7SuTEYJ/AQsXiSP8FPbRAxYlwImYb/dxDSEI/B9
	GGQQzW7b0k+mcYIy/ogE93vU5+/tMgE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-3Vp-7nAtOrq0EqycjaJWsQ-1; Thu,
 12 Nov 2026 08:04:57 -0500
X-MC-Unique: 3Vp-7nAtOrq0EqycjaJWsQ-1
X-Mimecast-MFC-AGG-ID: 3Vp-7nAtOrq0EqycjaJWsQ_1794488695
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63DFF18974FC;
	Thu, 12 Nov 2026 13:04:52 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE60A1956087;
	Thu, 12 Nov 2026 13:04:47 +0000 (UTC)
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
Subject: [PATCH net-next v4 08/14] selftests: dpll: add pin priority test
Date: Thu, 12 Nov 2026 14:03:53 +0100
Message-ID: <20261112130359.840795-9-poros@redhat.com>
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

Add a test that sets a new priority on an input pin, reads it back and
restores the original value. The range of priorities a device accepts is
not advertised over netlink, so the test tries one below the current
value and then the small values every driver accepts, since a large
current value may mark an unused pin outside the settable range, as the
ice driver does with 255. A driver may still refuse all of them for a
constraint the interface does not tell, so that is a skip on a device
provided by the user, with the reason the tool reported, and a failure
on the device the script created, whose simulator accepts every value
the test tries. A current value the device does not take back could
not be restored, so the test writes it back once before it touches the
pin, which changes nothing, and ends there when that is refused. The
test skips when the dpll tool lacks the prio keyword of pin set, and
the restore is deferred right after that write so that an interrupted
run restores the value too. A pin that does not advertise the
priority-can-change capability or does not report a priority is a skip
on a device provided by the user and a failure on the device the script
created, whose pins have both.

The dpllsim_add_pin helper gains an optional priority argument, which is
written only when it is given, so that a pin without one keeps the
default of the simulator. A priority is accepted for input pins only,
so the callers pass one for those alone.

The standard device lays its inputs out as gnss0 with priority 0 and
ext0 with priority 1, and the stress devices get random priorities on
their input pins.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
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

v3: https://lore.kernel.org/all/20261109093523.931201-9-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-9-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-9-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 74 +++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 32 ++++++--
 .../selftests/drivers/dpll/dpll_stress.sh     | 15 ++--
 3 files changed, 109 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index 0a00a18bded2c5..f7340bd89602fe 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -27,6 +27,7 @@ input_pins=()
 
 ALL_TESTS="
 	test_pin_state_transitions
+	test_pin_priority_get_set
 "
 
 ##############################################################################
@@ -70,6 +71,79 @@ pin_tune_capable()
 	return 1
 }
 
+test_pin_priority_get_set()
+{
+	local before target after reason candidate
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
+
+	before=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
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
+	defer dpll_restore dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+	      "$before"
+
+	# The accepted range is not advertised, so try one below the current
+	# value and then small values, a refusal of all of them is a skip on
+	# a device the user provided, the simulator accepts every value
+	# tried here.
+	target=""
+	for candidate in $((before - 1)) 1 7; do
+		[ "$candidate" -ge 0 ] && [ "$candidate" != "$before" ] ||
+			continue
+		if dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" \
+				     "$candidate"; then
+			target=$candidate
+			break
+		fi
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+	done
+	if [ -z "$target" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "cannot set a new prio${reason:+, $reason}"
+		return
+	fi
+	after=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ "$after" != "$target" ]; then
+		check_err 1 "priority expected $target, got '$after'"
+	fi
+
+	dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"
+	check_err $? "cannot restore pin priority"
+	after=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ "$after" != "$before" ]; then
+		check_err 1 "priority not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin priority set/get"
+}
+
 test_pin_state_transitions()
 {
 	local mode before state after reason ref_pin
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 783db2a4dbc180..b8f4375a4f76a7 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -437,6 +437,11 @@ dpll_pin_has_capability()
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
@@ -471,6 +476,16 @@ dpll_pin_set_state()
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
@@ -567,7 +582,9 @@ dpllsim_create_device()
 
 # $1: device name, $2: pin name (becomes the board-label), $3: type (gnss,
 # int-oscillator, ext, synce-eth-port, mux), $4: frequency in Hz,
-# $5: direction (input/output)
+# $5: direction (input/output), $6: prio (optional, input pins only).
+# The priority is written only when one is given, so a pin without one
+# keeps the default of the simulator.
 dpllsim_add_pin()
 {
 	local dev=$1
@@ -575,13 +592,16 @@ dpllsim_add_pin()
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
@@ -628,8 +648,8 @@ dpllsim_alloc_clock_id()
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
@@ -640,8 +660,8 @@ dpllsim_setup_standard_device()
 	name="std$clock_id"
 	dpllsim_create_device "$name" "$clock_id" || return 1
 
-	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input ||
-	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input ||
+	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input 0 ||
+	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input 1 ||
 	   ! dpllsim_add_pin "$name" out0 ext 10000000 output; then
 		dpllsim_delete_device "$name"
 		return 1
diff --git a/tools/testing/selftests/drivers/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
index 396d44c7bbe351..1745643955da16 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_stress.sh
@@ -77,13 +77,13 @@ create_stress_device()
 	local clock_id=$1
 	local num_pins=$2
 	local name="st$clock_id"
-	local i type freq dir
+	local i type freq dir prio
 	local dirs=(input output)
 
 	dpllsim_create_device "$name" "$clock_id" || return 1
 
 	# Always have at least one plain input pin, then random ones
-	if ! dpllsim_add_pin "$name" ext0 ext 10000000 input; then
+	if ! dpllsim_add_pin "$name" ext0 ext 10000000 input 1; then
 		dpllsim_delete_device "$name"
 		return 1
 	fi
@@ -94,8 +94,11 @@ create_stress_device()
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
 			dpllsim_delete_device "$name"
 			return 1
 		fi
@@ -221,8 +224,8 @@ test_deploy_cycle()
 	fi
 	track_device "$name"
 
-	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input ||
-	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input ||
+	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input 0 ||
+	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input 1 ||
 	   ! dpllsim_add_pin "$name" out0 ext 10000000 output; then
 		check_err 1 "cannot add pins"
 		log_test "DPLL deploy/undeploy cycling"
-- 
2.56.0


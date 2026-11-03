Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698817;
	b=DqXYrhIP5ktCpg3epV3acdWCnjxzA8bcKTuGNn7wdBe+IUgsApCfSoE+448ooGHyDHzo
	 1vLrH9kUv4AXDc2tdqkVSSVOdpTGEmhfniGzH1OebvLfl58+TuXah7OKGYj6wDfuocCun
	 TqPgDzbso8S7yz2Uyh3++9gPViEi3UrBeJvxteehbxqfQ1UzcKkHqikBgUJAp/E1A3fGS
	 Ht/hYPUd+5bOcNIJmniH1Z5CS6TTn0yXTzoVty3XnTUlwg9yF5ahSxlLaQ3lFoQ8cZ+fI
	 70gJGiP/Jcbe24cguQwXw9W8HhrJIvhx9dxDgX44y3Y7a6HoELOmCSOCVqv3Sg3Qc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698817;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Mx2XMqgF8eug2rq+roYGzDO6Igo6yslKBiLjwdQmkWk=;
	b=V13yetBvdHouPn6RCSNhKEgYsvrZ2CMQWxu8l5iJG9FMyffMZbGN3c3qGcnIZb1vD1Kv
	 Ezcfj7HKaFhWE5BH/NQvNLrNBWnzyYxXvfVpwOSzNhzSya+vF0wX7svEJPEDvSD022D7h
	 MOZolXFKAiVXl4+Z8qPt9/VXIkEGP2KkcgqUwYOdafn6ncSR901QyzzBn/IQ0/EICkyY5
	 lp5E5UVldBF4S56j7aBwTcp2wYdkm7ABHEVrCXPne/RPobE1xXykTidBx5mPO2M/Xgs8y
	 WW1MUruxRpySTKXitJj3BCEJLJMRnBNcP1tdRgyd2kKdOLeW88/7NJFVzFCxMgFAtMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AgVDfHu0;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFF6606A331
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AFF6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AgVDfHu0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mx2XMqgF8eug2rq+roYGzDO6Igo6yslKBiLjwdQmkWk=;
	b=AgVDfHu0FEj/w/eMBcSFYmiUUV2GBn4G7vkgJvxlMHeS95kHMcDiDGDfQPac9CVZ1XEYPb
	Gp52KwzlRmMenWGJnTJbrHX4g1tMgPPNGv6y2hIRxwhHYsuUiu4lKHM2Ddh3ybe6C3Nnw1
	GGP/vUAM5tcm+EQ+nOnYmC0lOT3lpy0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-COqjxwjKPKCf0eZv_xnREw-1; Tue,
 03 Nov 2026 04:40:12 -0500
X-MC-Unique: COqjxwjKPKCf0eZv_xnREw-1
X-Mimecast-MFC-AGG-ID: COqjxwjKPKCf0eZv_xnREw_1793698810
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C84F19540D4;
	Tue,  3 Nov 2026 09:40:10 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22E6F7EB;
	Tue,  3 Nov 2026 09:40:05 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH net-next 08/14] selftests: dpll: add pin priority test
Date: Tue,  3 Nov 2026 10:39:04 +0100
Message-ID: <20261103093910.596225-9-poros@redhat.com>
In-Reply-To: <20261103093910.596225-1-poros@redhat.com>
References: <20261103093910.596225-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Add a test that sets a new priority on an input pin, reads it back and
restores the original value. The range of priorities a device accepts is
not advertised over netlink, so the test tries one below the current
value and then the small values every driver accepts, since a large
current value may mark an unused pin outside the settable range, as the
ice driver does with 255. A driver may still refuse all of them for a
constraint the interface does not tell, so that is a skip on a device
provided by the user, with the reason the tool reported, and a failure
on the device the script created, whose simulator accepts every
priority. The test skips when the dpll tool lacks the prio keyword of
pin set, and the restore is deferred right after the original value is
read so that an interrupted run restores it too. A pin that does not
advertise the priority-can-change capability or does not report a
priority is a skip on a device provided by the user and a failure on the
device the script created, whose pins have both.

The dpllsim_add_pin helper gains an optional priority argument, which is
written only when it is given, so that a pin without one keeps the
default of the simulator. A priority is accepted for input pins only,
so the callers pass one for those alone.

The standard device lays its inputs out as gnss0 with priority 0 and
ext0 with priority 1, and the stress devices get random priorities on
their input pins.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 .../drivers/net/dpll/dpll_features.sh         | 65 +++++++++++++++++++
 .../selftests/drivers/net/dpll/dpll_stress.sh | 15 +++--
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  | 32 +++++++--
 3 files changed, 100 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_features.sh b/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
index 42271769b2e706..941b7ee848f951 100755
--- a/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
@@ -16,11 +16,76 @@ source "$SCRIPTDIR/../lib/sh/dpll_lib.sh"
 
 ALL_TESTS="
 	test_pin_state_transitions
+	test_pin_priority_get_set
 "
 
 ##############################################################################
 # Pin-level feature tests
 
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
+	if ! dpll_pin_has_capability "$PIN_TUNE_ID" priority-can-change; then
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "priority cannot change"
+		return
+	fi
+
+	before=$(dpll_pin_get_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID")
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin priority set/get" \
+		    "prio not reported"
+		return
+	fi
+	defer dpll_pin_set_prio "$DPLL_DEV_ID" "$PIN_TUNE_ID" "$before"
+
+	# The accepted range is not advertised, so try one below the current
+	# value and then small values, a refusal of all of them is a skip on
+	# a device the user provided, the simulator accepts every priority.
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
 	local before state after reason
diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
index ee543e2cd8703c..60e42107c67efe 100755
--- a/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_stress.sh
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
@@ -205,8 +208,8 @@ test_deploy_cycle()
 	fi
 	track_device "$name"
 
-	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input ||
-	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input ||
+	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input 0 ||
+	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input 1 ||
 	   ! dpllsim_add_pin "$name" out0 ext 10000000 output; then
 		check_err 1 "cannot add pins"
 		log_test "DPLL deploy/undeploy cycling"
diff --git a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
index badb787815d42f..613ed365e3e311 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -373,6 +373,11 @@ dpll_pin_has_capability()
 	   <<< "$out" &> /dev/null
 }
 
+dpll_pin_get_prio()
+{
+	__dpll_pin_dev_field "$1" "$2" '.prio'
+}
+
 ##############################################################################
 # Pin setters
 #
@@ -394,6 +399,16 @@ dpll_pin_set_state()
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
@@ -475,7 +490,9 @@ dpllsim_create_device()
 
 # $1: device name, $2: pin name (becomes the board-label), $3: type (gnss,
 # int-oscillator, ext, synce-eth-port, mux), $4: frequency in Hz,
-# $5: direction (input/output)
+# $5: direction (input/output), $6: prio (optional, input pins only).
+# The priority is written only when one is given, so a pin without one
+# keeps the default of the simulator.
 dpllsim_add_pin()
 {
 	local dev=$1
@@ -483,13 +500,16 @@ dpllsim_add_pin()
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
@@ -537,8 +557,8 @@ dpllsim_alloc_clock_id()
 # Create a device with the standard 3-pin layout, deploy it and resolve
 # the netlink device id. Sets DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and
 # DPLLSIM_DEV_ID.
-#   gnss0: GNSS, 1 Hz, input
-#   ext0: EXT, 10 MHz, input
+#   gnss0: GNSS, 1 Hz, input, prio 0 (active reference)
+#   ext0: EXT, 10 MHz, input, prio 1
 #   out0: EXT, 10 MHz, output
 dpllsim_setup_standard_device()
 {
@@ -549,8 +569,8 @@ dpllsim_setup_standard_device()
 	name="std$clock_id"
 	dpllsim_create_device "$name" "$clock_id" || return 1
 
-	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input ||
-	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input ||
+	if ! dpllsim_add_pin "$name" gnss0 gnss 1 input 0 ||
+	   ! dpllsim_add_pin "$name" ext0 ext 10000000 input 1 ||
 	   ! dpllsim_add_pin "$name" out0 ext 10000000 output; then
 		dpllsim_delete_device "$name"
 		return 1
-- 
2.56.0


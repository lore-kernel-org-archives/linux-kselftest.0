Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892018;
	b=sqVa61dSL/vOJXyjn/qTI2qmemjqG88qtDxIF8be+gkwUpXARzyFxTsbwFPKVAEWWS/8
	 T3MdB+knvMvJyv/uNEsOaF9+jMPkqCyZwODb7sBIZOwavK+Vdk6p7grH4cTTFwP3kn1Yf
	 zY8FohDQsLSW48EEJrTcA+QjWbzX3o5zHimSn+OhoX9XG+NnBoyzQ9+VBI3L5lMYszOqK
	 Ra6+gqV1WrdcoaJ65nIZBL7G2rBJJ2wYx8IimWJpj7UdINDdYjLQQ4jNkJ0UO847t+C6w
	 xQDZXmbp0gV3X84m8mIeOl9BPgWm9fa921COZ/hY6E0e1uUK8DnHbJ1Npl6DhYaRDmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892018;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=L/CdhryJiipUbYS/l1SRrDfFMR14AT3msIO1rjF9bSU=;
	b=f9sHerCBkzPSiXETKmAZkcBJH/skBhDFLm6J36xSd/gm2sUHlfe6L2DaXUt7nNxLAhfC
	 qfwgiFWDdF+f0nVZoMHiL/JcIw0NdYDyhtF9AEnZHxOib+/ghYCjPoWbYKaICY/MIa8ey
	 AaXHuDah2EajOsnCMXAuCThU888FTS7KbjKY/zhlpG8IiR5SOtBTI722oY8w+ABoRZ2wd
	 nvN0U0SmXhlKtLDgpTowcnmtG8vuKQBHFR8IIEsbQr5tdVFQnjXfZzBiFU72x2coD6qQQ
	 j9JuPt3m39Vm4Gq4fMumMrn5ZvVRTkdRMqDA6lo8OJvrAkZdQ3W7qBDjCp65QRaRsWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BkS5Je1g;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCD606EEB4
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCCD606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BkS5Je1g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793892015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/CdhryJiipUbYS/l1SRrDfFMR14AT3msIO1rjF9bSU=;
	b=BkS5Je1gnsCystdtcwigTBc/v6/5ztolELZWO/wRlcchZiBJgFRU6tFsFTDVGUer0Jo5JC
	Sj6hrY5J2oHTVSURwId98manNjmgZ05yxALTewk7Lzpej9p8RwdAtwwRkG7/Q5YabiR88K
	nY8PVlIFeZzdBytTsnUUe/PxxUcXaEc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-GzQbPtJxNh2Ln3P9yNLxvA-1; Thu,
 05 Nov 2026 10:20:01 -0500
X-MC-Unique: GzQbPtJxNh2Ln3P9yNLxvA-1
X-Mimecast-MFC-AGG-ID: GzQbPtJxNh2Ln3P9yNLxvA_1793891983
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EDC31955EA6;
	Thu,  5 Nov 2026 15:19:43 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1E5561956089;
	Thu,  5 Nov 2026 15:19:38 +0000 (UTC)
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
Subject: [PATCH net-next v2 08/14] selftests: dpll: add pin priority test
Date: Thu,  5 Nov 2026 16:18:46 +0100
Message-ID: <20261105151852.1844305-9-poros@redhat.com>
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
index c73417a058e0a0..61003ba280d658 100755
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
index ee91ad1722971d..1c3e27eb09775d 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -376,6 +376,11 @@ dpll_pin_has_capability()
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
@@ -397,6 +402,16 @@ dpll_pin_set_state()
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
@@ -478,7 +493,9 @@ dpllsim_create_device()
 
 # $1: device name, $2: pin name (becomes the board-label), $3: type (gnss,
 # int-oscillator, ext, synce-eth-port, mux), $4: frequency in Hz,
-# $5: direction (input/output)
+# $5: direction (input/output), $6: prio (optional, input pins only).
+# The priority is written only when one is given, so a pin without one
+# keeps the default of the simulator.
 dpllsim_add_pin()
 {
 	local dev=$1
@@ -486,13 +503,16 @@ dpllsim_add_pin()
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
@@ -540,8 +560,8 @@ dpllsim_alloc_clock_id()
 # Create a device with the standard 3-pin layout, deploy it and resolve
 # the netlink device id. Sets DPLLSIM_CREATED_NAME, DPLLSIM_CLOCK_ID and
 # DPLLSIM_DEV_ID.
-#   gnss0: GNSS, 1 Hz, input
-#   ext0: EXT, 10 MHz, input
+#   gnss0: GNSS, 1 Hz, input, prio 0 (active reference)
+#   ext0: EXT, 10 MHz, input, prio 1
 #   out0: EXT, 10 MHz, output
 # shellcheck disable=SC2120 # the argument is optional
 dpllsim_setup_standard_device()
@@ -553,8 +573,8 @@ dpllsim_setup_standard_device()
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


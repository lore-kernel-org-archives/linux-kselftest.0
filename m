Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597619;
	b=cDQ/CizdkdsqrbRJxLX10I5S6OLtw46flaFDTvwdxZ+VqDFo+DlpItjg8AZ+jHl/NHy1
	 ZMqK/BUidj1Vl9p+2FpH7F276NoI13LWObzPpr0CH69qLYhlrp0m1s4NSbsTj+sogEGOg
	 +MRfqfMsGeO3NTbio8sNSQ7/XTR8zkmRnfOeZw0jVc2/U4WEF2Ko7JoILJfr/fl335OW9
	 vebjLM3ZcXbnFIG4dfpX+CPl2Ph3Mr2q+3C0B6sD/mds2iFu4C0U7jT81Nf08YkOiWowe
	 Kr5+IWvh0tPLLgb0uCH6I0H3P/D6t1y4Fn9Kt8q5kqKYBw5qDKhyqasKAlhCIcjZgvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597619;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=AhItLfQpACoVrUIQY9O8ef7LhhRQGiQcSZF4DsZLEwg=;
	b=Mts3uok75sv3J99OqsJ7gjtsh+zMPCUjOCBCeeq4lXq+JqA/s7DHjN+evZHQA8RitwqS
	 oXe6gVDmqBjCQLkOSgtKVkBEONBMdnW0+evpTRCI9qU1DUU94xLQSFz8UiWjedjRzk7bt
	 xiPilUTboYlavYxNEG1SKv4/TAsytcy6kConNJuW0kAXWmwFtxo9O6Hyy2ixBp/8qDEGM
	 CedvORNYnOtd1nLHD04oNJB99auVxlrMCWPnIVPyjwX4Z3Ex7wzxJ8RHA0M1WzbXOyPDx
	 8CARcNopl5g4dvDlTV4607VzKMiZxXTtV4JVypXcBZGufuPu+7Yjcydf6wS4HHUneLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CjLBVK8x;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41E606A329
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F41E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CjLBVK8x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhItLfQpACoVrUIQY9O8ef7LhhRQGiQcSZF4DsZLEwg=;
	b=CjLBVK8xbyWTXPTSl1IBfrpbkh5HVySG6aNT9v8uPoF/v2oWRRxec4uV543M9hVFOuFLZ3
	ST+8ah2QU80op2mNIeEWLrgf67VegTCk/6YiR4u36ShntGf6Z+JbDrjqjOGEZes50SeRmr
	o64IKQD1XHwjlPMzKIKbtpHAsgmwnWg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-f3fAmtryPziXVw4BqE7Vog-1; Wed,
 25 Nov 2026 09:06:55 +0000
X-MC-Unique: f3fAmtryPziXVw4BqE7Vog-1
X-Mimecast-MFC-AGG-ID: f3fAmtryPziXVw4BqE7Vog_1795597612
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A19C0195D005;
	Wed, 25 Nov 2026 09:06:52 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 391EC195B3C8;
	Wed, 25 Nov 2026 09:06:48 +0000 (UTC)
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
Subject: [PATCH net-next v5 12/14] selftests: dpll: add pin phase adjust test
Date: Wed, 25 Nov 2026 10:05:19 +0100
Message-ID: <20261125090522.3777494-13-poros@redhat.com>
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

Add a test that reads the phase adjustment range and granularity a pin
advertises, picks another value, sets it, reads it back and restores the
original value. On the device the script created that is the largest
multiple of the granularity inside the range, or the smallest one when
that is already the current value. On a device provided by the user it
is the value one granularity step away from the current one, the end of
the range can be a large phase step there, 2.1 ms on zl3073x. The test
skips when the dpll tool lacks the phase-adjust keyword of pin set. A
pin that reports no phase adjustment, no range or a range too narrow to
pick a different value is a skip on a device provided by the user and a
failure on the device the script created, whose pins report a wide
range.

The core refuses a value outside the advertised range and one that is
not a multiple of the granularity a driver reports, the current value
included, so a pin that sits at such a value could not be put back. The
test bails out on either before it touches the pin. It then writes the
current value back, which changes nothing and which the core refuses
with EOPNOTSUPP for a driver without a setter, and defers the restore
once that went through, so that an interrupted run restores the value
too.

The granularity is only reported by drivers that have the core enforce
one. Without it the target on the created device is computed with a
granularity of 1 and the step on hardware is 1 ns, and a driver may
refuse it for a granularity of its own or for any other constraint the
interface does not advertise. A refused set is therefore a skip on a
device provided by the user, with the reason the tool reported, and a
failure on the device the script created, whose simulator accepts every
value its range and granularity allow. The test ends there, a value that
was not set has nothing to read back.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- on a device provided by the user step from the current phase adjust
  by the granularity or by 1 ns, the end of the range is a phase step
  of 2.1 ms on zl3073x
- check that the pin is still spare before the test
- write the current phase adjust back before the restore is deferred,
  like the priority and the frequency tests do
- name the reason the tool reported when the restore fails
- report a value that cannot be read back as such, not as a wrong one
- fail on the created device when the range is too narrow to pick
  another value, a skip there would hide a regression of the simulator
- skip the deferred restore once the test restored the phase adjust
  itself, a refused repeat would fail the run
- leave the deferred restore out when nothing was changed, and take a
  refused restore of the test like the state test does, a skip when
  nothing failed before it, the deferred one tries again
- count the pin as changed from before the set of the new value, see
  patch 6
- the 2.1 ms of zl3073x in the description is S32_MAX ps, the end of
  the phase adjust range the driver advertises

v4:
- bail out when the current value lies outside the advertised range,
  it could not be restored
- tell a failed query from a pin without a phase adjust or a range and
  log a deferred restore that fails

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v4: https://lore.kernel.org/all/20261112130359.840795-13-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-13-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-13-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-13-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 144 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        |  15 ++
 2 files changed, 159 insertions(+)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index acaf61b36624c1..ebcd0d09293b7d 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -35,6 +35,7 @@ ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
 	test_pin_frequency_set_get
+	test_pin_phase_adjust_set_get
 "
 
 ##############################################################################
@@ -456,6 +457,149 @@ test_pin_state_transitions()
 	log_test "DPLL pin state transitions"
 }
 
+test_pin_phase_adjust_set_get()
+{
+	local before target after json min max gran step reason
+
+	RET=0
+
+	if [ -z "$PIN_TUNE_ID" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "no spare input pin"
+		return
+	fi
+	if ! dpll_pin_set_supports phase-adjust; then
+		log_test_skip "DPLL pin phase-adjust set/get" \
+		    "dpll tool lacks pin set phase-adjust"
+		return
+	fi
+	pin_tune_spare "DPLL pin phase-adjust set/get" || return
+
+	# A query that failed is not a pin without a phase adjust.
+	if ! before=$(dpll_pin_get_phase_adjust "$PIN_TUNE_ID") ||
+	   ! json=$(dpll_pin_json "$PIN_TUNE_ID"); then
+		check_err 1 "pin $PIN_TUNE_ID query failed"
+		log_test "DPLL pin phase-adjust set/get"
+		return
+	fi
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "phase adjust not reported"
+		return
+	fi
+	if ! [[ "$before" =~ ^-?[0-9]+$ ]]; then
+		check_err 1 "phase adjust '$before' is not a number"
+		log_test "DPLL pin phase-adjust set/get"
+		return
+	fi
+
+	# Pick a target inside the advertised range different from the
+	# current value and a multiple of the granularity.
+	min=$(jq -r '.["phase-adjust-min"] // empty' <<< "$json")
+	max=$(jq -r '.["phase-adjust-max"] // empty' <<< "$json")
+	gran=$(jq -r '.["phase-adjust-gran"] // empty' <<< "$json")
+	if [ -z "$min" ] || [ -z "$max" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "no adjust range"
+		return
+	fi
+	# The core refuses a value outside the range or off the
+	# granularity, the current one included. A pin that sits at such a
+	# value could not be put back, so bail out before the restore is
+	# scheduled.
+	if [ "$before" -lt "$min" ] || [ "$before" -gt "$max" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "current phase adjust outside the adjust range"
+		return
+	fi
+	if [ -n "$gran" ] && [ $((before % gran)) -ne 0 ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "current phase adjust not a granularity multiple"
+		return
+	fi
+	# For a driver without a phase adjust setter the core refuses the
+	# current value as well, writing it changes nothing otherwise. The
+	# restore is deferred once that went through.
+	if ! dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "cannot write the phase adjust back${reason:+, $reason}"
+		return
+	fi
+	TUNE_CHANGED=0
+	defer tune_restore dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"
+
+	if [ -n "$DPLL_CREATED_DEVICE" ]; then
+		# The simulator is checked at the ends of its range. Shell
+		# division truncates towards zero, so round the bounds towards
+		# the inside of the range explicitly, which matters for
+		# negative ones.
+		[ -n "$gran" ] || gran=1
+		target=$((max / gran * gran))
+		[ "$target" -gt "$max" ] && target=$((target - gran))
+		if [ "$target" = "$before" ]; then
+			target=$((min / gran * gran))
+			[ "$target" -lt "$min" ] && target=$((target + gran))
+		fi
+	else
+		# On hardware the end of the range can be a large phase step,
+		# 2.1 ms on zl3073x, which the outputs see once the pin becomes
+		# the reference. Step by the granularity, or by 1 ns when the
+		# driver reports none, towards the inside of the range.
+		step=${gran:-1000}
+		target=$((before + step))
+		[ "$target" -gt "$max" ] && target=$((before - step))
+	fi
+	if [ "$target" = "$before" ] || [ "$target" -gt "$max" ] ||
+	   [ "$target" -lt "$min" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "range too narrow"
+		return
+	fi
+
+	# A driver may enforce a granularity it does not report or another
+	# constraint, a skip on a device the user provided, the simulator
+	# accepts every value its range and granularity allow.
+	TUNE_CHANGED=1
+	if ! dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$target"; then
+		TUNE_CHANGED=0
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "cannot set phase-adjust=$target${reason:+, $reason}"
+		return
+	fi
+	after=$(dpll_pin_get_phase_adjust "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the phase adjust back"
+	elif [ "$after" != "$target" ]; then
+		check_err 1 "phase-adjust expected $target, got '$after'"
+	fi
+
+	# A refused restore is taken like in the state test, the deferred
+	# one tries again.
+	if ! dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		reason=${reason:+, $reason}
+		if [ "$RET" -eq 0 ]; then
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin phase-adjust set/get" \
+			    "cannot restore phase-adjust$reason"
+			return
+		fi
+		check_err 1 "cannot restore phase-adjust$reason"
+	else
+		TUNE_CHANGED=0
+	fi
+	after=$(dpll_pin_get_phase_adjust "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the restored phase adjust back"
+	elif [ "$after" != "$before" ]; then
+		check_err 1 "phase-adjust not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin phase-adjust set/get"
+}
+
 test_pin_frequency_set_get()
 {
 	local before target after reason json near=true
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 3930f51a87d618..11152d958bca9d 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -467,6 +467,11 @@ dpll_pin_get_prio()
 	__dpll_pin_dev_field "$1" "$2" '.prio'
 }
 
+dpll_pin_get_phase_adjust()
+{
+	__dpll_pin_field "$1" '.["phase-adjust"]'
+}
+
 ##############################################################################
 # Pin setters
 #
@@ -526,6 +531,16 @@ dpll_pin_set_frequency()
 			     2>&1 >/dev/null)
 }
 
+# $2: phase adjust in ps
+dpll_pin_set_phase_adjust()
+{
+	local pin_id=$1
+	local phase_adjust=$2
+
+	DPLL_LAST_ERR=$(dpll pin set id "$pin_id" phase-adjust \
+			     "$phase_adjust" 2>&1 >/dev/null)
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
-- 
2.56.1


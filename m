Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892011;
	b=ySxrR50IOEXtKlbgUxqwRISk799HsV7BWMRJtfb4j1M90iQLZjXp6Ji2HFUk/y+TRc7B
	 q/CziC6EE3fcuEpJlmI7WjMBHiBcJLAp4h5kgN6ijMbeqP7sd6dtPtZd8Me8v9D9Xy9eZ
	 M7JwgACb1cMTVzozEIgTtnuZ0X36qDISLj58pQIgUNQLSEmlDVZm1Oz6KzoAfqT5kQH0V
	 8CamMK4xBsW/hEPNBbkeWJgLjjU0OQZ0JFsmyBiFcr0vPlfj/H/JHBG1oDWwxeT02SRHQ
	 VHamHrFZF1OCEWx4dYErMD+BPmKMEKNe5XjgXVGIuQOLQV1MciIjK9CQcDAi80l4dRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892011;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=gZYKwWmACWE2pCi/f3kBHmuV3zAc2HhpJzJ88i8S/g4=;
	b=v4/Cv2zGMFg/NzxmatZvIi/AoSV1FyK1shykcFjndA+Vyw1CNe1xN6x3io6or2Gw66m4
	 z1/rLEYoumL+Z49Mxgfv/IqWVeyIOdK5ORqUhk+bHxbOQiyHz/P6k4kI8D+S8ecemYIca
	 8So3vtYC5ij4kU7H+wX67+gIdO5+KcpiVrqgZIet+VOKdg/Ax7Ekz7g2tHjaPBpzPF3V8
	 cRMf1u/SFNPFOF76naWelM3nAFR5xfzc9zr2kwczfZhOeYeQltGJUw378Y9x8eNDPxbsM
	 nk3JkIo363mLT2uAQyrUvSyiiwKVWWK5/Bi96H7MVr5K24JtxPbOOMYZv4Z5VTms3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=exYQ5r6o;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13C86083611
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13C86083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=exYQ5r6o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793892009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZYKwWmACWE2pCi/f3kBHmuV3zAc2HhpJzJ88i8S/g4=;
	b=exYQ5r6oPTHocwZegsSXtp2a95IOgWS8FoLIwEcoQaNNNjbfWMjEPruLVNpBFsXzIJrGk3
	jV4667fYmd1xwwOJDFqG3jkf1/j8s/epKCWKvMnPTLqw+z0c5x1UaWZOT1d3y9B8TvHmlg
	RJaNBu1ZMaOcoW4e+/6yd4I/BtuZEgA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-QsdvjPR1OUywDsBfYr4kkA-1; Thu,
 05 Nov 2026 10:20:06 -0500
X-MC-Unique: QsdvjPR1OUywDsBfYr4kkA-1
X-Mimecast-MFC-AGG-ID: QsdvjPR1OUywDsBfYr4kkA_1793892004
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F404E1955F1F;
	Thu,  5 Nov 2026 15:20:03 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49A9B1956089;
	Thu,  5 Nov 2026 15:19:58 +0000 (UTC)
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
Subject: [PATCH net-next v2 12/14] selftests: dpll: add pin phase adjust test
Date: Thu,  5 Nov 2026 16:18:50 +0100
Message-ID: <20261105151852.1844305-13-poros@redhat.com>
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

Add a test that reads the phase adjustment range and granularity a
pin advertises, picks the largest multiple of the granularity inside
the range, or the smallest one when that is already the current value,
sets it, reads it back and restores the original value. It skips when
the dpll tool lacks the phase-adjust keyword of pin set and when the
range is too narrow to pick a different value. A pin that reports no
phase adjustment or no range is a skip on a device provided by the user
and a failure on the device the script created, whose pins report
both.

The core refuses a value that is not a multiple of the granularity a
driver reports, the current value included, so a pin that sits at such
a value could not be put back. The test bails out on that before it
schedules the restore, which is deferred right after so that an
interrupted run restores the value too.

The granularity is only reported by drivers that have the core enforce
one. Without it the target is computed with a granularity of 1, and a
driver may refuse it for a granularity of its own or for any other
constraint the interface does not advertise. A refused set is therefore
a skip on a device provided by the user, with the reason the tool
reported, and a failure on the device the script created, whose
simulator accepts every value its range and granularity allow. The
test ends there, a value that was not set has nothing to read back.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 .../drivers/net/dpll/dpll_features.sh         | 85 +++++++++++++++++++
 .../selftests/drivers/net/lib/sh/dpll_lib.sh  | 10 +++
 2 files changed, 95 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/dpll/dpll_features.sh b/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
index a39098fbf73135..1466ddd6538348 100755
--- a/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/net/dpll/dpll_features.sh
@@ -18,6 +18,7 @@ ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
 	test_pin_frequency_set_get
+	test_pin_phase_adjust_set_get
 "
 
 ##############################################################################
@@ -166,6 +167,90 @@ test_pin_state_transitions()
 	log_test "DPLL pin state transitions"
 }
 
+test_pin_phase_adjust_set_get()
+{
+	local before target after json min max gran reason
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
+
+	before=$(dpll_pin_get_phase_adjust "$PIN_TUNE_ID")
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "phase adjust not reported"
+		return
+	fi
+
+	# Pick a target inside the advertised range different from the
+	# current value, a multiple of the granularity, which is taken as 1
+	# when the driver reports none.
+	json=$(dpll_pin_json "$PIN_TUNE_ID")
+	min=$(jq -r '.["phase-adjust-min"] // empty' <<< "$json")
+	max=$(jq -r '.["phase-adjust-max"] // empty' <<< "$json")
+	gran=$(jq -r '.["phase-adjust-gran"] // empty' <<< "$json")
+	if [ -z "$min" ] || [ -z "$max" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "no adjust range"
+		return
+	fi
+	# A current value that is not a granularity multiple could not be
+	# written back, so bail out before the restore is scheduled.
+	if [ -n "$gran" ] && [ $((before % gran)) -ne 0 ]; then
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "current phase adjust not a granularity multiple"
+		return
+	fi
+	[ -n "$gran" ] || gran=1
+	defer dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"
+
+	# Shell division truncates towards zero, so round the bounds towards
+	# the inside of the range explicitly, which matters for negative ones.
+	target=$((max / gran * gran))
+	[ "$target" -gt "$max" ] && target=$((target - gran))
+	if [ "$target" = "$before" ]; then
+		target=$((min / gran * gran))
+		[ "$target" -lt "$min" ] && target=$((target + gran))
+	fi
+	if [ "$target" = "$before" ] || [ "$target" -gt "$max" ] ||
+	   [ "$target" -lt "$min" ]; then
+		log_test_skip "DPLL pin phase-adjust set/get" "range too narrow"
+		return
+	fi
+
+	# A driver may enforce a granularity it does not report or another
+	# constraint, a skip on a device the user provided, the simulator
+	# accepts every value its range and granularity allow.
+	if ! dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$target"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin phase-adjust set/get" \
+		    "cannot set phase-adjust=$target${reason:+, $reason}"
+		return
+	fi
+	after=$(dpll_pin_get_phase_adjust "$PIN_TUNE_ID")
+	if [ "$after" != "$target" ]; then
+		check_err 1 "phase-adjust expected $target, got '$after'"
+	fi
+
+	dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"
+	check_err $? "cannot restore phase-adjust"
+	after=$(dpll_pin_get_phase_adjust "$PIN_TUNE_ID")
+	if [ "$after" != "$before" ]; then
+		check_err 1 "phase-adjust not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin phase-adjust set/get"
+}
+
 test_pin_frequency_set_get()
 {
 	local before target after reason
diff --git a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
index 9718d73c60b444..8fa2a9936a0eb2 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -381,6 +381,11 @@ dpll_pin_get_prio()
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
@@ -417,6 +422,11 @@ dpll_pin_set_frequency()
 	DPLL_LAST_ERR=$(dpll pin set id "$1" frequency "$2" 2>&1 >/dev/null)
 }
 
+dpll_pin_set_phase_adjust()
+{
+	DPLL_LAST_ERR=$(dpll pin set id "$1" phase-adjust "$2" 2>&1 >/dev/null)
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
-- 
2.56.0


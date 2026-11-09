Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217017;
	b=K539BRe/YWRAMEpQ2Pk+Ob0I+9ezdkl/zM+oBPQxzgWp+mzzz0wSXro4AXk+iIPZZW0g
	 3Yh4XS0fHLvpNBMsb0Q/x8FGvb4GJN1F5/VWXoEzMioVSW4UViEk0qhCHmAbGpot7aTK3
	 8TvP1EuzKX6SLZYMhWa0mgFLpLUe2MzP3mjEN1weqkarrXFsQvq/VjKzjbJzKneD13KGv
	 y7pWb9jdTKUD4NGL9Wn70BB8cyCbOawD722tTIweW0NlHN4m8GMZO9aG7Mh+Kk/qWTWG2
	 KMX15yHTgsZXKwBaGkUNLwgZoLL9Tuqr679W2NGoVsBFi9Zl+OST3N89yIqJTf88qLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217017;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=1rtg4RdlEF0QrRH/wITnIIOw1lbwfFcifrbFysiJ6Tc=;
	b=24CyKXlL7syhbY2cqes+j8vqV12tBALh/ZwfxWJ/6mDXzh4fCQMor/28w8G8UXX6yZrp
	 DHRFBKqdlD297cnMqXCtne8eTlxXZagbhYu/dPaRA4KGRo9YFPx3KAsWharaziZ/7v8yw
	 b6UR6WrCbeGQUeSeFmkjCWmlEw0UALqBKwsaybZB5M+T32OJcyyrVMzUB5QF/D5rq7XK7
	 DfYRzkEEUqokGOxCIqX7gDnhov1LsAN9z6iVrl2aOXQKULg01ZDplU+TCFsQOSicNwUdA
	 WnXDKptfOtRNAQ3Hllp28TMnjTCi2pshlDx/ZW/BLLjjwGt+9s55BcExRIzsqygzJ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjWYVPm7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD611606A33E
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 09:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD611606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjWYVPm7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794217016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rtg4RdlEF0QrRH/wITnIIOw1lbwfFcifrbFysiJ6Tc=;
	b=BjWYVPm7OZEWgh5jg1xC1aPgLP948gHRX6JNB9+HiVXwezKdViN8DwhpvVU/3P4KLylJ5w
	wDglLBgedbH63dZ7pJEvDnVqX/O2OgFEI9E4zSy8mLEJPL97uEkbI4gkSZjdmoIfGPu43/
	AhIW96CNacJKlU+QY8MKVMFRkmn4H2s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-WiUbeLOANCmQ5sI8mXFqiQ-1; Mon,
 09 Nov 2026 04:36:54 -0500
X-MC-Unique: WiUbeLOANCmQ5sI8mXFqiQ-1
X-Mimecast-MFC-AGG-ID: WiUbeLOANCmQ5sI8mXFqiQ_1794217012
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 348B218005BC;
	Mon,  9 Nov 2026 09:36:52 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.50])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 632E318004E9;
	Mon,  9 Nov 2026 09:36:47 +0000 (UTC)
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
Subject: [PATCH net-next v3 12/14] selftests: dpll: add pin phase adjust test
Date: Mon,  9 Nov 2026 10:35:21 +0100
Message-ID: <20261109093523.931201-13-poros@redhat.com>
In-Reply-To: <20261109093523.931201-1-poros@redhat.com>
References: <20261109093523.931201-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v2: https://lore.kernel.org/all/20261105151852.1844305-13-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-13-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 85 +++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 10 +++
 2 files changed, 95 insertions(+)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index 6649936c710e43..b529b19e355dbb 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -19,6 +19,7 @@ ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
 	test_pin_frequency_set_get
+	test_pin_phase_adjust_set_get
 "
 
 ##############################################################################
@@ -238,6 +239,90 @@ test_pin_state_transitions()
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
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index 2583a5aa3fe18d..69b66481394b7a 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -400,6 +400,11 @@ dpll_pin_get_prio()
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
@@ -436,6 +441,11 @@ dpll_pin_set_frequency()
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


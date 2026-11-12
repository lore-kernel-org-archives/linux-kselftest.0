Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488719;
	b=KqOwGqG4QaJ8IKt82GLaa/ymbvXeXE537Y40hx5XDVGLKl0DbT2p66XriJfMz/hQ4Pnl
	 eUSyyWbbbjtEuXdGszaD2u32aSVwdIIBHlhfV33YVCCRIjTaCj/VHaZTxIp2PRzCkxdzI
	 jxEDGmQxbGWsGNGDZS54mHAreYg96eEkPI8nmMWJL/Ho+Weil8j2GCQ6dZgtxPpX9Tv23
	 mT/b6ndcGSrTaRi1y3l3PqdTkejTTsIZw0wl9XQt6s3j4yl/0Eo7Q8D6wfpNnq4xn8n5X
	 WRegiGhGk7QEYxxP6b7OHYIjTYNFZoupSVgCraRU4cGkeEoLSwGdueqmcKLtEE5izCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488719;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=4ylK5LKVbmFh7GaEAG+riq3A0xgSVCiixRaTi2H1VOM=;
	b=pd18ZFBzLMm0cB0ZRjJeuMFnXWJJtqS2BDqD0iWMNXKnHTpQk5UWZ+PjCVsFRHvKKqxU
	 QT7eFXqdumixeS5UYyXc1e89cz9If9PjlY2COPKErXmLzVzsPdk5Sple+p/6368HHZz9j
	 RFzR2eOfbGd0i/Eh7oKnZvRcUMzz3qNaUdekbdTKUqx9LjVfab9M6e1sRqa8FvejhDejX
	 NdAOTV5uHX1WygmRAg81rqcszsQ2TJshgAT3bt2cJIVDLfnRu/BsvbDYRYKx2b1xhEr2A
	 lsR4hab7PwxakBHc+8NsqQ0KxnzKnqEvf2T6GR8zUPYpH9m5Fj+2Er0dbEa5T2q5wMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="R3/Lvdqd";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C0606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3C0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R3/Lvdqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ylK5LKVbmFh7GaEAG+riq3A0xgSVCiixRaTi2H1VOM=;
	b=R3/LvdqdE8uKOg2OCQv8uIK2yVkS4VRPRGZafSR+ufAyNY0A2Q9OYmgnKF91QSVDrZSqKZ
	PLzb2lwCtLbSvAs37f1wsyKfoJDZJsu7M/bopxjl1yGQB09Av2AiOOXBWtnjSHJJs/v0Sf
	7uxVPZy8qrB0LQ8uOI5eFmw8ERa9xYk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-PZ_FaMQyOOerGUW8kR-8ng-1; Thu,
 12 Nov 2026 08:05:14 -0500
X-MC-Unique: PZ_FaMQyOOerGUW8kR-8ng-1
X-Mimecast-MFC-AGG-ID: PZ_FaMQyOOerGUW8kR-8ng_1794488712
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71612195605C;
	Thu, 12 Nov 2026 13:05:12 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9300C1956087;
	Thu, 12 Nov 2026 13:05:07 +0000 (UTC)
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
Subject: [PATCH net-next v4 12/14] selftests: dpll: add pin phase adjust test
Date: Thu, 12 Nov 2026 14:03:57 +0100
Message-ID: <20261112130359.840795-13-poros@redhat.com>
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

Add a test that reads the phase adjustment range and granularity a
pin advertises, picks the largest multiple of the granularity inside
the range, or the smallest one when that is already the current value,
sets it, reads it back and restores the original value. It skips when
the dpll tool lacks the phase-adjust keyword of pin set and when the
range is too narrow to pick a different value. A pin that reports no
phase adjustment or no range is a skip on a device provided by the user
and a failure on the device the script created, whose pins report
both.

The core refuses a value outside the advertised range and one that is
not a multiple of the granularity a driver reports, the current value
included, so a pin that sits at such a value could not be put back. The
test bails out on either before it schedules the restore, which is
deferred right after so that an interrupted run restores the value too.

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
v4:
- bail out when the current value lies outside the advertised range,
  it could not be restored
- tell a failed query from a pin without a phase adjust or a range and
  log a deferred restore that fails

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v3: https://lore.kernel.org/all/20261109093523.931201-13-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-13-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-13-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 102 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        |  15 +++
 2 files changed, 117 insertions(+)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index ebb52c85262016..7b7e077073db58 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -29,6 +29,7 @@ ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
 	test_pin_frequency_set_get
+	test_pin_phase_adjust_set_get
 "
 
 ##############################################################################
@@ -298,6 +299,107 @@ test_pin_state_transitions()
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
+	# current value, a multiple of the granularity, which is taken as 1
+	# when the driver reports none.
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
+	[ -n "$gran" ] || gran=1
+	defer dpll_restore dpll_pin_set_phase_adjust "$PIN_TUNE_ID" "$before"
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
 	local before target after reason json
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index fa1895ab17f518..6b99dae5a4f379 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -442,6 +442,11 @@ dpll_pin_get_prio()
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
@@ -496,6 +501,16 @@ dpll_pin_set_frequency()
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
2.56.0


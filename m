Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698836;
	b=5Hmh5SKkK7UGqjPBxsnviprKAsYfobaMPaSacZtvSVgB8d3kJ6rvsWEL+v5hn4Z7SVOX
	 dfsaiQXqnUXvIibQlKVbfsb0+8gKktJXk0PHjSffNJG1RQnaejAf1K/F3OGCZIto6ypVc
	 oSoCssI+2/UR3JBumsjUcxQfRVZ5eJ5PS9KIsDgBWKHNpXzUMjdup6ejmxhbXxDR+KpTL
	 5fX1nFOtIFBOvWbG1yTiJ7/10GHt17Ec0DTEeWALpKT3gQl6a+z+xlvwvbql5Av5uaqOZ
	 38iIqnIVPzHOLwPlSkPslPWidPToriWuGKJd0+zYpWVDWLyHDs3hBiM4q3AEO+3fL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698836;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=v6QyOsbXU4EPMQx8nxwCOGm990+flpxoZH6MHqIORBU=;
	b=TPL6iD65S/aiqBfoT2mXTC7mrDG40yKgJl5uRMhbjJ4BvIQbj8loW0sraAtr6LGmJFE2
	 70BNV94ZpHwKqENaf/1/HH8vRwFpIfdTAqXRQfHFhXFlxDrSdvhRSuwQtnzYHeFUL3iYR
	 8LKWyl/Qpfw1lnFiPa1r7smTnPLEQiloRz9v5Jd4Fpf87vKqzZXoAYjBsJMoYu8tzhh/H
	 oBeNpVSHNZEFNQ7jxN4cxbMee4bDIV1jjk4jWuQAiu7GFswsq/OAbfyYsrJ9EF1u7MioF
	 WUrRkcmt8mnWC6PleyIO9ev0x74EdSjlWYuCd9ktjxCZxCZqEKmUA0mO0tXbc1syBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OtJPDNWo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14AA606D822
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14AA606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OtJPDNWo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6QyOsbXU4EPMQx8nxwCOGm990+flpxoZH6MHqIORBU=;
	b=OtJPDNWoNIPbAmNxPOW9We7xxPWHGQJxefYM9dgNnECkGDCbvlzEuWNdUzqIpqvRH0hmDc
	1mi8XgVQDQoQxB2NqzOkyNoKWasX8oUamd48jEP7rUWqO5QsfgYvoXyQ0sygzRfnuMmlYu
	BI5gbQHqP/8K5uEwpxilxiAI8BZlYck=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-54_ML5o5MP6UtyUqo_fX_A-1; Tue,
 03 Nov 2026 04:40:30 -0500
X-MC-Unique: 54_ML5o5MP6UtyUqo_fX_A-1
X-Mimecast-MFC-AGG-ID: 54_ML5o5MP6UtyUqo_fX_A_1793698828
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63E00195394E;
	Tue,  3 Nov 2026 09:40:28 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6E6DF7E9;
	Tue,  3 Nov 2026 09:40:24 +0000 (UTC)
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
Subject: [PATCH net-next 12/14] selftests: dpll: add pin phase adjust test
Date: Tue,  3 Nov 2026 10:39:08 +0100
Message-ID: <20261103093910.596225-13-poros@redhat.com>
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
index 66e11f7f44eec9..ebbad30988d2ec 100755
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
index 191948442ef8bd..a968f780393d75 100644
--- a/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/net/lib/sh/dpll_lib.sh
@@ -378,6 +378,11 @@ dpll_pin_get_prio()
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
@@ -414,6 +419,11 @@ dpll_pin_set_frequency()
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


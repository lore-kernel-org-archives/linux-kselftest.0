Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488708;
	b=kqCUxvWd6mqM33TqiRFmkrImqpi8tc6tQoArBsLboZ7IYPx9Lwghp+kO6it9UNEDyQ0w
	 5C4jw/HPcHd/KI4gUc6TWJX1pedYlkJPXFV5PxhQ+tK6PW2bJpTDU/VUIiRyjlL2FYvEW
	 yt1nNQtTbllEqGC0+dKs2e1KNZWc0kzNFxEoUK/3ogzCZIUiDGKX3Xn/y/uLF6dP8Jo7d
	 cWiXBjOFEUM8i7rVIX952vl+mxP1LDxij0RU7CGkOA/hLVAza1rt8GGuV/3G6Fx1bwDCv
	 k/53GokJMtRvO8mta5gUbUpdkIYDPakEYnUmvSMs83ujCaOgK3cQGLNJaTNaLt1uQAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488708;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=tDQxHhk/J9FAZ/ZJ9hqtDhHRSc+cud2d/g6Oy285pMg=;
	b=fAJANQkDvMaLmf9RG49pOeOXyGcwmBln2LJKWcSaMTDRJXzy/8ZgSpdpkyIaYfkT7pSw
	 XnHDJIJCujPnbEoT62Bx3C7J44SGixG5s0tvtcaHW6kzyfQJzOXJlzeJYMw3JAx5nIYjS
	 wRljXBZgHy4HOqvr+kkp074eDYXSPhl5hoJD6FC5NXPulyGegZfSsVLeXTKMGghOubmM/
	 PZJYNrKsc2G9fxcY1L3SkABlj6knLN8LFDJC1vG9FuLeAqMCJT0GO22EJuRML+EZ/z38h
	 o1PZlpSSau5iy78V5Xo4MA7FuMbyEHi/o/0ilEr0Zmp9uNFZrby8cihs03l5+wwA6zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hAKnggxH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E16606A335
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E16606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hAKnggxH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDQxHhk/J9FAZ/ZJ9hqtDhHRSc+cud2d/g6Oy285pMg=;
	b=hAKnggxHU+vweR1EfhAX152TakJEGH3+pF2jVXB9ygrMO80d1v7MGUEjIOUxokzp2TeZgE
	AAqFNQOFoIPVQ/PG3y/fWacXIQ1v2HsjXL3e2sZnB/d+zBmRbL2MXkIZNs9ZDTuxboshQw
	u6s2Y8IIIsES/nnmT/9VSEfDI34zSkg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-tWguW-ZiPva6ipfPGWWfkw-1; Thu,
 12 Nov 2026 08:05:04 -0500
X-MC-Unique: tWguW-ZiPva6ipfPGWWfkw-1
X-Mimecast-MFC-AGG-ID: tWguW-ZiPva6ipfPGWWfkw_1794488702
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 105011955DC3;
	Thu, 12 Nov 2026 13:05:02 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75E1E1956087;
	Thu, 12 Nov 2026 13:04:57 +0000 (UTC)
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
Subject: [PATCH net-next v4 10/14] selftests: dpll: add pin frequency test
Date: Thu, 12 Nov 2026 14:03:55 +0100
Message-ID: <20261112130359.840795-11-poros@redhat.com>
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

Add a test that picks a supported frequency other than the current one
from the frequency-supported list of an input pin, sets it, reads it
back and restores the original value. Both ends of every advertised
range are candidates, so that a pin advertising a single range wider
than one value still has one. It skips when the dpll tool lacks the
frequency keyword of pin set, and the restore is deferred right after
the original value is read so that an interrupted run restores it too.
The core refuses a frequency outside the supported ranges, so a pin
whose current frequency is not in them could not be put back, zl3073x
reports a sub-Hz reference as 0 Hz and does not offer that. The test
bails out on such a pin before it touches it. The frequency belongs to
the pin and not to one of its parent devices, which is why the pin the
script picks must not be the reference of any of them.
A pin that reports no frequency or advertises a single frequency only
is a skip on a device provided by the user and a failure on the device
the script created, whose pins advertise several.

The driver may refuse the candidate. A driver without a frequency
setter refuses every value with EOPNOTSUPP, and a driver with
constraints of its own refuses values the advertised ranges allow,
zl3073x for instance wants the frequencies of an output pair to divide
each other. On a device provided by the user a refused set is a skip
that names the reason the tool reported, which the setter keeps in
DPLL_LAST_ERR, on the created device the simulator accepts every
advertised value and the refusal is a failure. Once the set went
through, a refused restore is a failure on either.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v4:
- bail out before touching a pin whose current frequency is not among
  the supported ones, it could not be restored
- tell a failed query from a pin without a frequency, check that the
  value is a number and log a deferred restore that fails
- name the arguments of dpll_pin_set_frequency like the other setters

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v3: https://lore.kernel.org/all/20261109093523.931201-11-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-11-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-11-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 90 +++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        | 10 +++
 2 files changed, 100 insertions(+)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index f7340bd89602fe..ebb52c85262016 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -28,6 +28,7 @@ input_pins=()
 ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
+	test_pin_frequency_set_get
 "
 
 ##############################################################################
@@ -297,6 +298,95 @@ test_pin_state_transitions()
 	log_test "DPLL pin state transitions"
 }
 
+test_pin_frequency_set_get()
+{
+	local before target after reason json
+
+	RET=0
+
+	if [ -z "$PIN_TUNE_ID" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "no spare input pin"
+		return
+	fi
+	if ! dpll_pin_set_supports frequency; then
+		log_test_skip "DPLL pin frequency set/get" \
+		    "dpll tool lacks pin set frequency"
+		return
+	fi
+
+	# A query that failed is not a pin without a frequency.
+	if ! before=$(dpll_pin_get_frequency "$PIN_TUNE_ID"); then
+		check_err 1 "pin $PIN_TUNE_ID query failed"
+		log_test "DPLL pin frequency set/get"
+		return
+	fi
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "frequency not reported"
+		return
+	fi
+	if ! [[ "$before" =~ ^[0-9]+$ ]]; then
+		check_err 1 "frequency '$before' is not a number"
+		log_test "DPLL pin frequency set/get"
+		return
+	fi
+	if ! json=$(dpll_pin_json "$PIN_TUNE_ID"); then
+		check_err 1 "pin $PIN_TUNE_ID query failed"
+		log_test "DPLL pin frequency set/get"
+		return
+	fi
+	# The core refuses a frequency outside the supported ranges, the
+	# current one included, and a driver may report one it does not
+	# offer, zl3073x reads a sub-Hz reference back as 0 Hz. Such a pin
+	# could not be restored, so bail out before it is touched.
+	if ! jq -e --argjson cur "$before" \
+		'any(.["frequency-supported"][]?;
+		     .["frequency-min"] <= $cur and
+		     .["frequency-max"] >= $cur)' <<< "$json" &> /dev/null; then
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "current frequency is not a supported one"
+		return
+	fi
+	defer dpll_restore dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"
+
+	# Pick a supported frequency different from the current one. Both
+	# ends of every supported range are candidates, so a pin with a
+	# single range still has an alternative unless it is one value wide.
+	target=$(jq -r --argjson cur "$before" \
+		    '[.["frequency-supported"][]? |
+		      .["frequency-min"], .["frequency-max"] |
+		      numbers | select(. != $cur)][0] // empty' <<< "$json")
+	if [ -z "$target" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "no alternative supported frequency"
+		return
+	fi
+
+	# A driver without a frequency setter or with constraints of its own
+	# may refuse the candidate, a skip on a device the user provided, the
+	# simulator accepts every advertised value.
+	if ! dpll_pin_set_frequency "$PIN_TUNE_ID" "$target"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "cannot set frequency=$target${reason:+, $reason}"
+		return
+	fi
+	after=$(dpll_pin_get_frequency "$PIN_TUNE_ID")
+	if [ "$after" != "$target" ]; then
+		check_err 1 "frequency expected $target, got '$after'"
+	fi
+
+	dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"
+	check_err $? "cannot restore frequency"
+	after=$(dpll_pin_get_frequency "$PIN_TUNE_ID")
+	if [ "$after" != "$before" ]; then
+		check_err 1 "frequency not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin frequency set/get"
+}
+
 ##############################################################################
 
 cleanup()
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index b8f4375a4f76a7..fa1895ab17f518 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -486,6 +486,16 @@ dpll_pin_set_prio()
 			     prio "$prio" 2>&1 >/dev/null)
 }
 
+# $2: frequency in Hz
+dpll_pin_set_frequency()
+{
+	local pin_id=$1
+	local frequency=$2
+
+	DPLL_LAST_ERR=$(dpll pin set id "$pin_id" frequency "$frequency" \
+			     2>&1 >/dev/null)
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
-- 
2.56.0


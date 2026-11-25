Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597615;
	b=ErHRxdQzv0JgC1e8Dbn1IhwPnXlKCq4DEtF0M6DCJiG6eYjNwggOR8kPzkEdsU/4JuD8
	 FRMTxQwOtRzVRROPfJMseFLXlyT5LkT4Gk8j3LBDD2tT0mBCyscjsRgG1JbxKPHM9klv+
	 gkzksciwQmn7pxT3hz6oGRs6TY09xOO76yK6ns3GOF4OZ8D/gEzd78EixQloo9l6qG4MJ
	 NiYH6YT2qNYWQw1LmezomzE4NbP2SKZjCeAwizA3dpPVZOHzF/tzEpWMZcQJkMa8gT6vJ
	 X27ksI6YvwxJcQHX08c//YXm5Yhgzd5BYxLAKaS1cKuM+keXp7Txpv6LiiKigCk96lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597615;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=uW23+9sNHePFd5U/TXUiY1rkEAjyDru2bIK31sMCA5M=;
	b=v0YBpcXXcBAZiiQ+C3qw+4n08wg1U5jUEDQ854I3m6EA6W7MBTazHa04BV3Klr4/aZ6/
	 SXgiCAxyrzfl0oVnM7qSLmFDNXn+d4i86X/J0vFf/fgfWK3zHPA7VtuX3ZgRpYg31HlGf
	 gqabHQxwLvOA4DQ4HHXUrhyKw/fwUq0EHFMk0pphcAVmZY98OAMKigj8UbHtcmx49mnz7
	 k0wuZ4BiR2gjtuP/ppRQ7egbQ5WKJQzwXnj27zSkigDAkcdATAq4cXnbEjdab8SrfMmT7
	 N6Po8So9XQkxSmLmmrKd/UB9ZDc4cj0kdGdwkzf3ulkkDbkkeuOknpEb1pen9vvzzvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fuzEZUDM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B2606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062B2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fuzEZUDM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW23+9sNHePFd5U/TXUiY1rkEAjyDru2bIK31sMCA5M=;
	b=fuzEZUDMUKLvopZjZ+4ks7VMAv5rFdRdcPZYpaF7kaxkLROg2ZuWvKgmN8IMDlIWsPEw3f
	r3qW6DJETdmRqVwUtFVCjYy1PVvEsw+bLGezQHMERE2iGSnJIWsGU4Yp7ATXnDd8/6bkzs
	0MQOkh+xjNdNIkeF6x6KOL0pGXu/X8s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-olUAx1JhOsWMTG9ZNSgDHw-1; Wed,
 25 Nov 2026 09:06:46 +0000
X-MC-Unique: olUAx1JhOsWMTG9ZNSgDHw-1
X-Mimecast-MFC-AGG-ID: olUAx1JhOsWMTG9ZNSgDHw_1795597603
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA6E2195D011;
	Wed, 25 Nov 2026 09:06:41 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B9AD9195B3C5;
	Wed, 25 Nov 2026 09:06:36 +0000 (UTC)
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
Subject: [PATCH net-next v5 10/14] selftests: dpll: add pin frequency test
Date: Wed, 25 Nov 2026 10:05:17 +0100
Message-ID: <20261125090522.3777494-11-poros@redhat.com>
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

Add a test that picks a supported frequency other than the current one
from the frequency-supported list of an input pin, sets it, reads it
back and restores the original value. Both ends of every advertised
range are candidates, so that a pin advertising a single range wider
than one value still has one. On a device provided by the user the
candidate closest to the current frequency is taken, an end of a wide
range is far from what the input carries. It skips when the dpll tool
lacks the frequency keyword of pin set, and the restore is deferred
before the pin is changed so that an interrupted run restores it too.
The core refuses a frequency outside the supported ranges, so a pin
whose current frequency is not in them could not be put back, zl3073x
reports a sub-Hz reference as 0 Hz and does not offer that. The test
bails out on such a pin before it touches it. The frequency belongs to
the pin and not to one of its parent devices, which is why the pin the
script picks must not be the reference of any of them. A pin that
reports no frequency or advertises a single frequency only is a skip on
a device provided by the user and a failure on the device the script
created, whose ext pins advertise several, the gnss pin advertises 1 Hz
only.

The driver may refuse the candidate. For a driver without a frequency
setter the core refuses every supported value with EOPNOTSUPP, the
current one included, so the test writes that back before it defers the
restore and ends there when it is refused. A driver with constraints of
its own refuses values the advertised ranges allow. On a device provided
by the user a refused set is a skip that names the reason the tool
reported, which the setter keeps in DPLL_LAST_ERR, on the created device
the simulator accepts every advertised value and the refusal is a
failure. A refused restore is taken as in the state test, the deferred
one tries again.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- on a device provided by the user take the supported frequency
  closest to the current one, an end of a wide range is far from what
  the input carries
- check that the pin is still spare before the test, and write the
  current frequency back before the restore is deferred
- correct the commit message, the divisibility rule of zl3073x is for
  output pins and the gnss pin of the simulator has one frequency
- say in the changelog that it is the core that refuses the values for
  a driver without a setter, and drop that case from the comment on a
  refused candidate, it ends at the write back now
- name the reason the tool reported when the restore fails
- report a value that cannot be read back as such, not as a wrong one
- a pin of a connected reference sync pair is not taken any more, see
  patch 6
- skip the deferred restore once the test restored the frequency
  itself, a refused repeat would fail the run
- leave the deferred restore out when nothing was changed, and take a
  refused restore of the test like the state test does, a skip when
  nothing failed before it, the deferred one tries again
- count the pin as changed from before the set of the new value, see
  patch 6
- keep the keys frequency-supported, frequency-min and frequency-max in
  the jq filter, every dpll release prints them and the netlink spec
  names them so
- say in the description that a refused restore is taken as in the
  state test, it still called it a failure on either device

v4:
- bail out before touching a pin whose current frequency is not among
  the supported ones, it could not be restored
- tell a failed query from a pin without a frequency, check that the
  value is a number and log a deferred restore that fails
- name the arguments of dpll_pin_set_frequency like the other setters

v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v4: https://lore.kernel.org/all/20261112130359.840795-11-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-11-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-11-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-11-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 127 ++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        |  10 ++
 2 files changed, 137 insertions(+)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index 34e6b28ee224c5..acaf61b36624c1 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -34,6 +34,7 @@ input_pins=()
 ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
+	test_pin_frequency_set_get
 "
 
 ##############################################################################
@@ -455,6 +456,132 @@ test_pin_state_transitions()
 	log_test "DPLL pin state transitions"
 }
 
+test_pin_frequency_set_get()
+{
+	local before target after reason json near=true
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
+	pin_tune_spare "DPLL pin frequency set/get" || return
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
+	# A driver without a frequency setter refuses the current value as
+	# well, writing it changes nothing otherwise. The restore is
+	# deferred once that went through.
+	if ! dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "cannot write the frequency back${reason:+, $reason}"
+		return
+	fi
+	TUNE_CHANGED=0
+	defer tune_restore dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"
+
+	# Pick a supported frequency different from the current one. Both
+	# ends of every supported range are candidates, so a pin with a
+	# single range still has an alternative unless it is one value wide.
+	# On hardware the one closest to the current frequency is taken, an
+	# end of a wide range is far from what the input carries, the
+	# simulator is checked with the first one.
+	[ -n "$DPLL_CREATED_DEVICE" ] && near=false
+	target=$(jq -r --argjson cur "$before" --argjson near "$near" \
+		    '[.["frequency-supported"][]? |
+		      .["frequency-min"], .["frequency-max"] |
+		      numbers | select(. != $cur)] |
+		     if $near then min_by(if . > $cur then . - $cur
+					  else $cur - . end)
+		     else .[0] end // empty' <<< "$json")
+	if [ -z "$target" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "no alternative supported frequency"
+		return
+	fi
+
+	# A driver with constraints of its own may refuse the candidate, a
+	# skip on a device the user provided, the simulator accepts every
+	# advertised value.
+	TUNE_CHANGED=1
+	if ! dpll_pin_set_frequency "$PIN_TUNE_ID" "$target"; then
+		TUNE_CHANGED=0
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "cannot set frequency=$target${reason:+, $reason}"
+		return
+	fi
+	after=$(dpll_pin_get_frequency "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the frequency back"
+	elif [ "$after" != "$target" ]; then
+		check_err 1 "frequency expected $target, got '$after'"
+	fi
+
+	# A refused restore is taken like in the state test, the deferred
+	# one tries again.
+	if ! dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"; then
+		reason=${DPLL_LAST_ERR%%$'\n'*}
+		reason=${reason:+, $reason}
+		if [ "$RET" -eq 0 ]; then
+			dpll_log_test_skip_or_fail \
+			    "DPLL pin frequency set/get" \
+			    "cannot restore frequency$reason"
+			return
+		fi
+		check_err 1 "cannot restore frequency$reason"
+	else
+		TUNE_CHANGED=0
+	fi
+	after=$(dpll_pin_get_frequency "$PIN_TUNE_ID")
+	if [ -z "$after" ]; then
+		check_err 1 "cannot read the restored frequency back"
+	elif [ "$after" != "$before" ]; then
+		check_err 1 "frequency not restored, got '$after'"
+	fi
+
+	log_test "DPLL pin frequency set/get"
+}
+
 ##############################################################################
 
 cleanup()
diff --git a/tools/testing/selftests/drivers/dpll/dpll_lib.sh b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
index b67dba21ba9b4b..3930f51a87d618 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -516,6 +516,16 @@ dpll_pin_set_prio()
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
2.56.1


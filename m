Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217009;
	b=coZhp1j6mE9yyeqwcs2sy5UviZ8W9kxXhF2QJXWv9NCHDQYyIn1r7NmFMnJImst2pcp6
	 pkqTmcEdY/n5GnQOAiOneY/lG2OfmvmRdxNlG5VsHUYyQbyaO2k9yCoTflQhQz3UTvwPl
	 Ot8MTtfr9mE3xhgkU5qKW4djfOmVhsu4EO9DfHAPIvakXinRpMs/5LPbuqIWn5sl01YOw
	 qqi1FLnKebrPBZ1OhW5BZ9gsz2SAky9gQ1FGjFBIuNIx+6i+mTVo4wIbi4rTqLywutpRc
	 ZNsRB8/CWY9jooUIqhpxkIXKCj6Q0CRgK0Q7cGgsZbY7hatYdxhlqwgoECZa5teDH+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217009;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=jZIoRpnltXuk6LNkP3YpM99EoFKHLTP+XsfPsA9lkPc=;
	b=e6gR0/uhkGA0+nQ2elKt3lUjDktiTgRrWcXrVWwLZ/PSNkC36EXaylFg0YiJuDESa7g7
	 GBDiE+DUp3mwkzB/mL2tsvC9iEZnj6QRybMNLkcuFxyQWZp1s8JQRdTJ3NH5tQK0FN7Hi
	 fHdRa9e6wKeilNCLJTBjwc/SXv3efUk8V6bhqd9sUSBydXplyn9g3xIKm4ksikW5Q0l5h
	 GXTMjQugGWLmUqykSVYhMDghiAZAnHz/9939O5k8IdvqdA0fft0C43u5/a0+vDp+dTep6
	 8+GkxQpy0xqXeNtt6rr/AijSgOTey/fS3yvtwKRMsgY8LCaFs9KDL/BRLJFWhy52SMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H96Gaxsw;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120A606D820
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 09:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B120A606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H96Gaxsw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794217007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZIoRpnltXuk6LNkP3YpM99EoFKHLTP+XsfPsA9lkPc=;
	b=H96GaxswhCnjSY5A/yh4TDXb3AzyRajKrNmku4ZgpWadoQtP/zP3XrB4e3fAD8uAdbl/IO
	vqOE8A5zNSmkHyUNY65/Z6P51jn4zp1Q811/j/pcLAX7aiWnaVQvilERqqwBdxw3mD69lb
	i+1M3wCi7t8AWwlfdWV8ZlQOG6JwtQA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-mbQsdEB0NDCCGtKtog2KkQ-1; Mon,
 09 Nov 2026 04:36:44 -0500
X-MC-Unique: mbQsdEB0NDCCGtKtog2KkQ-1
X-Mimecast-MFC-AGG-ID: mbQsdEB0NDCCGtKtog2KkQ_1794217002
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3540F1955F6D;
	Mon,  9 Nov 2026 09:36:42 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.50])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B689518004F7;
	Mon,  9 Nov 2026 09:36:37 +0000 (UTC)
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
Subject: [PATCH net-next v3 10/14] selftests: dpll: add pin frequency test
Date: Mon,  9 Nov 2026 10:35:19 +0100
Message-ID: <20261109093523.931201-11-poros@redhat.com>
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

Add a test that picks a supported frequency other than the current one
from the frequency-supported list of an input pin, sets it, reads it
back and restores the original value. Both ends of every advertised
range are candidates, so that a pin advertising a single range wider
than one value still has one. It skips when the dpll tool lacks the
frequency keyword of pin set, and the restore is deferred right after
the original value is read so that an interrupted run restores it too.
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
v3:
- follow the move of the selftests to
  tools/testing/selftests/drivers/dpll

v2: https://lore.kernel.org/all/20261105151852.1844305-11-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-11-poros@redhat.com/
---
 .../selftests/drivers/dpll/dpll_features.sh   | 64 +++++++++++++++++++
 .../selftests/drivers/dpll/dpll_lib.sh        |  5 ++
 2 files changed, 69 insertions(+)

diff --git a/tools/testing/selftests/drivers/dpll/dpll_features.sh b/tools/testing/selftests/drivers/dpll/dpll_features.sh
index b4b1eff322a219..6649936c710e43 100755
--- a/tools/testing/selftests/drivers/dpll/dpll_features.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_features.sh
@@ -18,6 +18,7 @@ source "$SCRIPTDIR/dpll_lib.sh"
 ALL_TESTS="
 	test_pin_state_transitions
 	test_pin_priority_get_set
+	test_pin_frequency_set_get
 "
 
 ##############################################################################
@@ -237,6 +238,69 @@ test_pin_state_transitions()
 	log_test "DPLL pin state transitions"
 }
 
+test_pin_frequency_set_get()
+{
+	local before target after reason
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
+	before=$(dpll_pin_get_frequency "$PIN_TUNE_ID")
+	if [ -z "$before" ]; then
+		dpll_log_test_skip_or_fail "DPLL pin frequency set/get" \
+		    "frequency not reported"
+		return
+	fi
+	defer dpll_pin_set_frequency "$PIN_TUNE_ID" "$before"
+
+	# Pick a supported frequency different from the current one. Both
+	# ends of every supported range are candidates, so a pin with a
+	# single range still has an alternative unless it is one value wide.
+	target=$(dpll_pin_json "$PIN_TUNE_ID" | \
+		 jq -r --argjson cur "$before" \
+		    '[.["frequency-supported"][]? |
+		      .["frequency-min"], .["frequency-max"] |
+		      numbers | select(. != $cur)][0] // empty')
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
index 6fe707c2609c55..2583a5aa3fe18d 100644
--- a/tools/testing/selftests/drivers/dpll/dpll_lib.sh
+++ b/tools/testing/selftests/drivers/dpll/dpll_lib.sh
@@ -431,6 +431,11 @@ dpll_pin_set_prio()
 			     prio "$prio" 2>&1 >/dev/null)
 }
 
+dpll_pin_set_frequency()
+{
+	DPLL_LAST_ERR=$(dpll pin set id "$1" frequency "$2" 2>&1 >/dev/null)
+}
+
 ##############################################################################
 # dpllsim configfs interface
 #
-- 
2.56.0


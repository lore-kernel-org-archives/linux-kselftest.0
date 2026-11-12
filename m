Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488716;
	b=1S1mYtWzWu9OT8NIcvbadNNyq6gPGiZmew21kWwB2h75DUiBhR87Z82mnDBSNOV3lzcq
	 UMPMPnaXp066rLH8bEsNusd6+hW7Dg4gdCELPUETMSxzStEfZPuWpBW/+Gzz1wRGglHxg
	 +Mmt9gEUjYfanVM8ND6MEXaAH4eY61lluTaw58QzrEng835tyx9aw+sZ837IYqK9Kqpiz
	 QstpY16eOvKuW/f11ru7fYuPe3487PsJZfcG6VId+hnyun5TF4OErPMMTtfoSAGYhWS4m
	 v8/fIdZxbpmQydp0JDYBrEI/xp0tfYG4jZoSzyGYHaZjTfpsJiLxzUzdr29gYi4amqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488716;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=t1fJ/wJWt3Lqxwy/UBy6ocoRSFR0dJZeo0j+oHrlYtY=;
	b=BArMX1zviNsDtw8wSgifZcbW71DvgIMDQfATvXlidHazteHouW5EcYtaVR7PbS6oRafv
	 qnGsdt4e4QVloBaJtDM2fS0PDUWGH0pmz9MBjyY8zVtowaneNGVuOCoMd1WpYEn5X/iGw
	 sweKfG62CLtDGiHD4z4cTPztl/PnHUUAmqDQGDJ2hsnLA9U2ao340KRinq75BpYypUM+8
	 hTCiYMlEuZ/wFDb6LQF2foYXj7OBaGmrPUXEdEncbiBBlfNuwWO0XMTAu5HTK3GUxkjJP
	 5mJZbRxtbNZ/Gn4eDxaHq3RKCzxsQCdGuh2x9O6Agbv/uv6Sc4KtYUxqzsyIGaXgU3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="im8/OYRv";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B2F606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B2F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=im8/OYRv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t1fJ/wJWt3Lqxwy/UBy6ocoRSFR0dJZeo0j+oHrlYtY=;
	b=im8/OYRvruoTJUb3CTZ45oivXxXigjKCJj1MnbBAcuP6DB1aCM31KlW6eVo+JqdPm3MaIH
	2R9fSZn8VtvclQEg980iCAUDjbQrVNs+r/F9/Gqt0HfHdEtjOfb8CFRmh3JSGrTXcjeGbo
	GNyDa2NaLV1NjbU3eY8Ksa7nfR4JyFQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-K9TjI3-pOi6RYwQpVkh0fg-1; Thu,
 12 Nov 2026 08:05:09 -0500
X-MC-Unique: K9TjI3-pOi6RYwQpVkh0fg-1
X-Mimecast-MFC-AGG-ID: K9TjI3-pOi6RYwQpVkh0fg_1794488707
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F3FC18A68C0;
	Thu, 12 Nov 2026 13:05:07 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 734661956089;
	Thu, 12 Nov 2026 13:05:02 +0000 (UTC)
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
Subject: [PATCH net-next v4 11/14] dpll: dpllsim: Add support to adjust phase
Date: Thu, 12 Nov 2026 14:03:56 +0100
Message-ID: <20261112130359.840795-12-poros@redhat.com>
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

Add support to get and set the phase adjustment of input and output
pins. The pins advertise a granularity of 100 ps and a symmetric range
whose ends are the largest multiples of the granularity that fit a
32-bit signed value, so that the advertised ends themselves are
settable, the core validates the requested value against both and the
driver stores it. The adjustment is reset to zero every time the device
goes live, so that repeated deploy cycles start from a known state. It
becomes the baseline of the simulated phase offset measurements once
those exist.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c    | 40 ++++++++++++++++++++++++++++++++++
 drivers/dpll/dpllsim/dpllsim.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 0cce8fef232cd3..0260bffd157000 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -12,6 +12,11 @@
 
 #include "dpllsim.h"
 
+#define DPLLSIM_PHASE_ADJUST_GRAN		100	/* ps */
+/* Largest multiple of the granularity, so the range ends are settable */
+#define DPLLSIM_PHASE_ADJUST_MAX \
+	(S32_MAX - S32_MAX % DPLLSIM_PHASE_ADJUST_GRAN)
+
 static struct dpll_pin_frequency dpllsim_freq_1pps[] = {
 	DPLL_PIN_FREQUENCY_RANGE(1, 1),
 };
@@ -182,6 +187,33 @@ static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+static int dpllsim_pin_phase_adjust_get(const struct dpll_pin *pin,
+					void *pin_priv,
+					const struct dpll_device *dpll,
+					void *dpll_priv, s32 *phase_adjust,
+					struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	*phase_adjust = sim_pin->phase_adjust;
+	return 0;
+}
+
+static int dpllsim_pin_phase_adjust_set(const struct dpll_pin *pin,
+					void *pin_priv,
+					const struct dpll_device *dpll,
+					void *dpll_priv,
+					const s32 phase_adjust,
+					struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	sim_pin->phase_adjust = phase_adjust;
+	return 0;
+}
+
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
 	.frequency_set = dpllsim_pin_frequency_set,
@@ -190,6 +222,8 @@ static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.state_on_dpll_set = dpllsim_pin_state_set,
 	.prio_get = dpllsim_pin_prio_get,
 	.prio_set = dpllsim_pin_prio_set,
+	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
+	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -197,6 +231,8 @@ static const struct dpll_pin_ops dpllsim_output_pin_ops = {
 	.frequency_set = dpllsim_pin_frequency_set,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
+	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
+	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
 };
 
 static const struct dpll_pin_ops *
@@ -212,6 +248,9 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 {
 	prop->type = pin->type;
 	prop->board_label = config_item_name(&pin->item);
+	prop->phase_range.min = -DPLLSIM_PHASE_ADJUST_MAX;
+	prop->phase_range.max = DPLLSIM_PHASE_ADJUST_MAX;
+	prop->phase_gran = DPLLSIM_PHASE_ADJUST_GRAN;
 
 	switch (pin->type) {
 	case DPLL_PIN_TYPE_GNSS:
@@ -275,6 +314,7 @@ static void dpllsim_pin_reset(struct dpllsim_pin *pin)
 	pin->state = DPLL_PIN_STATE_DISCONNECTED;
 	pin->frequency = pin->cfg_frequency;
 	pin->prio = pin->cfg_prio;
+	pin->phase_adjust = 0;
 }
 
 /* Build sim->pins in registration order, the order the pins were created */
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index cd99227f1e4e1d..94383e71d7fcec 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -45,6 +45,7 @@ struct dpllsim_pin {
 	 */
 	u64 frequency;
 	u32 prio;
+	s32 phase_adjust;
 };
 
 struct dpllsim_dev {
-- 
2.56.0


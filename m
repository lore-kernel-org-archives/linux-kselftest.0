Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892006;
	b=m2h5eqCNkMG5pzOJ5w6Adx6kfyNvaVlAY6eZ3qUIx+OqmF5SZfNPJfPba+thKSenQdRL
	 gs4iNy8tolztpedhrf8wC5ZuszTpYW5bp/1cwObJtXLLTeGZTVyb7qRxkBAQrXESK26Zu
	 H0fhGx5W6BAztOyLE2H0VDZD4zNci0FJGtSHpawOME2dWUeH8nJJzy5bRtZYSvkO5p5Ah
	 /BrRfqHw2TX1mIS88tCRvcvUI6whclW5lhocaXW6YuSSVCzoNpNYj5CDk4mX+3ECn50nA
	 EAfIpLepfruhkvFgybPgCrA00C2RP6pAF0jF/VOnrBDu+XtEDJTXEenz/Sg1Sn0uhqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892006;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=BDBlOY8W9b3BZZK/0rBE+HxFIA8B69zgRNZ3n8k1JjM=;
	b=dArI8YZ9NZo9GMh2VZWfhMz6Oaa8m0k+TuwutTJLoy4+83sns5EkJPJTYeSWTLHtPHno
	 lXUkTJJHS3utr8hvwUxpUpUg2EHoCB11DgAbJPiRy3Er007OtRr1OSptLrDKW2qWw/wVo
	 lFe1tj1o/Hx6RDVIHSJiqH+Gh3lh6RsOomX68QkndjLg41TkBz5bKgrGeaH3o8Ej07eBo
	 u6bp25UAEzf36Pk4uxqKRyAIK7yYe8mcg/Y8VRBkq3bZHkX07xmqcF/ugx2MCq2weaTBY
	 PJhYSwguEdXbcMRJfvZ0rhwyKG5K2fHoFHnf6qy4Nrj4ZvWLnMF6BkA1I3pzFl4KXVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fy55l4+l;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71032606D80D
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71032606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fy55l4+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793892005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDBlOY8W9b3BZZK/0rBE+HxFIA8B69zgRNZ3n8k1JjM=;
	b=fy55l4+l5KqRNNEHD3/6b8WRrF/kNGIXqmMvGpURKZMdRlImVWSaHfAJBClaY0ec6yZAKI
	iBvEcAQDNSr5q9AK6ApaRgMPEf6uIsMi2RvW6mG07ipP/KF3ba78rkFdb0JBSXsBHZTI46
	+q9pn0DUcz8lTZYa2e6tfyYRpKX6+uY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-5A0vRQ9ePOqNd5u1djBWeQ-1; Thu,
 05 Nov 2026 10:20:01 -0500
X-MC-Unique: 5A0vRQ9ePOqNd5u1djBWeQ-1
X-Mimecast-MFC-AGG-ID: 5A0vRQ9ePOqNd5u1djBWeQ_1793891998
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77A591955F11;
	Thu,  5 Nov 2026 15:19:58 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3666A1956089;
	Thu,  5 Nov 2026 15:19:54 +0000 (UTC)
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
Subject: [PATCH net-next v2 11/14] dpll: dpllsim: Add support to adjust phase
Date: Thu,  5 Nov 2026 16:18:49 +0100
Message-ID: <20261105151852.1844305-12-poros@redhat.com>
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

Add support to get and set the phase adjustment of input and output
pins. The pins advertise a granularity of 100 ps and a symmetric range
whose ends are the largest multiples of the granularity that fit a
32-bit signed value, so that the advertised ends themselves are
settable, the core validates the requested value against both and the
driver stores it. The adjustment is reset to zero every time the device
goes live, so that repeated deploy cycles start from a known state. It
becomes the baseline of the simulated phase offset measurements once
those exist.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 drivers/dpll/dpllsim/dpll.c    | 40 ++++++++++++++++++++++++++++++++++
 drivers/dpll/dpllsim/dpllsim.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 3caccd38a7e74a..77e7ae994bf104 100644
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
@@ -159,6 +164,33 @@ static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
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
@@ -167,6 +199,8 @@ static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.state_on_dpll_set = dpllsim_pin_state_set,
 	.prio_get = dpllsim_pin_prio_get,
 	.prio_set = dpllsim_pin_prio_set,
+	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
+	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -174,6 +208,8 @@ static const struct dpll_pin_ops dpllsim_output_pin_ops = {
 	.frequency_set = dpllsim_pin_frequency_set,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
+	.phase_adjust_get = dpllsim_pin_phase_adjust_get,
+	.phase_adjust_set = dpllsim_pin_phase_adjust_set,
 };
 
 static const struct dpll_pin_ops *
@@ -189,6 +225,9 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 {
 	prop->type = pin->type;
 	prop->board_label = config_item_name(&pin->item);
+	prop->phase_range.min = -DPLLSIM_PHASE_ADJUST_MAX;
+	prop->phase_range.max = DPLLSIM_PHASE_ADJUST_MAX;
+	prop->phase_gran = DPLLSIM_PHASE_ADJUST_GRAN;
 
 	switch (pin->type) {
 	case DPLL_PIN_TYPE_GNSS:
@@ -250,6 +289,7 @@ static void dpllsim_pin_reset(struct dpllsim_pin *pin)
 {
 	pin->ops = dpllsim_pin_select_ops(pin);
 	pin->state = DPLL_PIN_STATE_DISCONNECTED;
+	pin->phase_adjust = 0;
 }
 
 /* Build sim->pins in registration order, the order the pins were created */
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index f59447d26a8668..886ac27f5f92d6 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -43,6 +43,7 @@ struct dpllsim_pin {
 
 	/* Simulated state, guarded by dev->lock */
 	enum dpll_pin_state state;
+	s32 phase_adjust;
 };
 
 struct dpllsim_dev {
-- 
2.56.0


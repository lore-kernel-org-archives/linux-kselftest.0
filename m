Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597581;
	b=aSJ+F2GyJkYaVCmlcyki531R63907txOrcvNl5ruG0w9HGdoQfJdktKUBB/EQsWJSHgp
	 NPKX6Qj8cgHb99mMnEniw6qHwHGMo6UWB/5e+sJGt33+bICup/d/s+9Nl2j24hyftnJFs
	 KXmEoIPpfzMr03EQl+yiqVo+wtQ8FZewe3uFMWViz2XPfFggXM8hpybyBLb/3FIrLTT1p
	 n4h7SuNE9HVcgNeM7x1P4HJe+Yr36bvv87MOk+QSUC4w3fH+n50bzqiNrktkgy/thBvWB
	 TesoBlW88WFAkCj55QLPt8oH+aGsBTAzJ+E14FlcFbz6Qiy9VEIWxxXF4Q9NDV4nhmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597581;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=kOs16NLTN8+YO2+yhAYKGH28Cemhmi5Se/R7+XhBznA=;
	b=UK36HSxlweBoW4WpbxvNWL4VB+nafsweirEXw23Q1FsT9+sfD4O/2zNZ/AQxuzQnEN/b
	 SZnF+8myWQVM8zVdLDl4fPCUjAXrZcgzx6Oa1NREDbO1ikGpeo3d6D90CaEUyBibQtide
	 +CJ67jNzqkhbxDOeMrLUNgM4FjIOtLS7//fqdT0L1Upnwz3qL4mHAlRw6L+ZWi0oDhZ1f
	 DGVNhsIoVSYYY7PUTiSVPhAmKow4dIb2aXyVN/48uKSOf+DgqaV1I7YYGpo6BPjBBeqPq
	 ZLedPelWgRwt9MshXlsodRd4PpdS5LQpl7YslN7YE7ypvPlZ3I2VcK0cTqXk1pgVkhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ktw1axHX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FF7606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41FF7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ktw1axHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOs16NLTN8+YO2+yhAYKGH28Cemhmi5Se/R7+XhBznA=;
	b=Ktw1axHX/F+MzMW/6/c1FBUg15rJZrplkiYn0+Km0bbWhyBllnhmSWGxOk7U89ORgSduai
	njc6lMzGJWCES/nbPWqSqky+y0VnHG6PMGTQb+36IvzXVKF0du6Y1WnbykTLEOcHLh4TJl
	IcWNKHiBVIbEZiPzTe+b4gRikmwBuG8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-QMxfV_pDPs6bGjyrSF4cLw-1; Wed,
 25 Nov 2026 09:06:16 +0000
X-MC-Unique: QMxfV_pDPs6bGjyrSF4cLw-1
X-Mimecast-MFC-AGG-ID: QMxfV_pDPs6bGjyrSF4cLw_1795597574
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56B461800542;
	Wed, 25 Nov 2026 09:06:14 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0008195B3C8;
	Wed, 25 Nov 2026 09:06:08 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Ivan Vecera <ivecera@redhat.com>,
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
Subject: [PATCH net-next v5 05/14] dpll: dpllsim: Add support to set input pin state
Date: Wed, 25 Nov 2026 10:05:12 +0100
Message-ID: <20261125090522.3777494-6-poros@redhat.com>
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

Add support for setting the state of input pins on the device.
Implement the state_on_dpll_set callback for input pins and advertise
the state-can-change capability for them, so that userspace can move a
pin between the states valid for the device mode. The core checks the
capability only, the states a mode allows are up to the driver: in
automatic mode a pin is selectable or disconnected, in manual mode
connected or disconnected, as Documentation/driver-api/dpll.rst
describes them. The device reports automatic mode, so connected is
refused with -EINVAL and an extack message. The check is written for
both modes already, so that manual mode has nothing to add to it when
it arrives. The driver stores the requested state and reports it back
unchanged, it does not act on it yet. Output pins keep reporting their
state only.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- no changes

v4:
- no change, add the Reviewed-by given to v3 (Ivan Vecera)

v3:
- refuse pin states that are not valid in the device mode, so that
  connected is refused in automatic mode, the mode the device reports,
  with an extack message (Ivan Vecera)
- the Acked-by of v2 is not carried over, the callback changed

v4: https://lore.kernel.org/all/20261112130359.840795-6-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-6-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-6-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-6-poros@redhat.com/
---
 drivers/dpll/dpllsim/dpll.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 7323747ccf2a62..d838a2bbdf52f6 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -104,10 +104,46 @@ static int dpllsim_pin_state_get(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+/*
+ * The states a user may request depend on the device mode: connected and
+ * disconnected select and deselect the reference in manual mode, selectable
+ * and disconnected offer a pin to or withdraw it from the automatic
+ * selection. The core checks the state-can-change capability only.
+ */
+static bool dpllsim_pin_state_valid(const struct dpllsim_dev *sim,
+				    enum dpll_pin_state state)
+{
+	if (state == DPLL_PIN_STATE_DISCONNECTED)
+		return true;
+	if (sim->mode == DPLL_MODE_MANUAL)
+		return state == DPLL_PIN_STATE_CONNECTED;
+	return state == DPLL_PIN_STATE_SELECTABLE;
+}
+
+static int dpllsim_pin_state_set(const struct dpll_pin *pin, void *pin_priv,
+				 const struct dpll_device *dpll,
+				 void *dpll_priv, enum dpll_pin_state state,
+				 struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+	struct dpllsim_dev *sim = sim_pin->dev;
+
+	guard(mutex)(&sim->lock);
+	if (!dpllsim_pin_state_valid(sim, state)) {
+		NL_SET_ERR_MSG_FMT(extack, "Pin state not valid in %s mode",
+				   sim->mode == DPLL_MODE_MANUAL ?
+				   "manual" : "automatic");
+		return -EINVAL;
+	}
+	sim_pin->state = state;
+	return 0;
+}
+
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
+	.state_on_dpll_set = dpllsim_pin_state_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -149,6 +185,12 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_ext);
 		break;
 	}
+
+	/* Capabilities follow the ops the pin is served by */
+	if (dpllsim_pin_select_ops(pin) == &dpllsim_input_pin_ops)
+		prop->capabilities = DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
+	else
+		prop->capabilities = 0;
 }
 
 static bool dpllsim_pin_frequency_valid(struct dpllsim_pin *pin)
-- 
2.56.1


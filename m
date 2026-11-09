Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216986;
	b=C3fF52pUEnZ/IAlo3PNjOWUtDiN0QKDXk2RRculB7lN+chb0UWbI8gQOwY0nKNoNffXm
	 DDjS9p/qTd17229WxyshB83IKSF8gl1D0w97qwO/qET0irow7q5eJCgNwqE2HGrVHvLCR
	 mT72zc7A5jVOL8ne11lwYNlm4NbnAYKsS4WKQzrPyA/0zRd6fgPaaTjBMNVPUOqwcH2d4
	 N8F8lLjkV7JvX93oG+qTHL8yBgwBinoxNo31gEXzBN5QrmOeUHL2OEFMOemnj1P0OoBC6
	 2hyynf1hXxAFsfaB0t/GT7hFXrMBSTg5lRfsP9ij+6Z53JrJfK9uw8ZjfU9SlspKzDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216986;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=QuBgA2e8QPY48MESrCdXXkhIC68z59uPc1JVscwI/74=;
	b=ObCQflAtIlXN+UoLE2KUdTBRIZwE0nz17T7wGJpS9hj2ZCzL1BPphQ4iYy0tZMsZ0vSd
	 OUx5hKQQRW/bHdmT9ojPtnXMIRqS4Vi/TNIDEJtyyAhBtbrKIcDcCz2p9VmkAR6zuMJEG
	 GoOYZlVFurJtc0tTQhNlrg9BtN6Vs8ZTj/9OQJNDqB1SO1f9cXWpwKhSgYksc+Jl6WsJz
	 TFqUfrwMyQNDKfyhzOntgZuBPrahpkqyvmnVCM0uxcb6sXDMYEyIxFG8YuNZk8lFooL8v
	 5PaftQ+8OiDs48Pvf3WgcDIlkKTt5KFKqhpCAmQu0TOkrWJBMmS9lAiwI+Pyn6TrPVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlVDwCYI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B49606D833
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 09:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B49606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DlVDwCYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794216984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuBgA2e8QPY48MESrCdXXkhIC68z59uPc1JVscwI/74=;
	b=DlVDwCYIDPmZs/5qwMrV4NK5M2qB5RP792hRtlIUE7ZRoMaZhSAuudcVoWp4/pG8IZ2p0f
	wg742eu7H48IRbhewCmG0an72Im41sMeepKKEG05A8jP0j6+U36lyPTuzaeXJWyHLBUuPl
	RB7PRKyOFjx/kI9AYB2o9YajfXoS3XQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-wYHW6xu4O7SjWwN01tDAMQ-1; Mon,
 09 Nov 2026 04:36:18 -0500
X-MC-Unique: wYHW6xu4O7SjWwN01tDAMQ-1
X-Mimecast-MFC-AGG-ID: wYHW6xu4O7SjWwN01tDAMQ_1794216976
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3220D1955F10;
	Mon,  9 Nov 2026 09:36:16 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.50])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5232A1800446;
	Mon,  9 Nov 2026 09:36:11 +0000 (UTC)
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
Subject: [PATCH net-next v3 05/14] dpll: dpllsim: Add support to set input pin state
Date: Mon,  9 Nov 2026 10:35:14 +0100
Message-ID: <20261109093523.931201-6-poros@redhat.com>
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

Signed-off-by: Petr Oros <poros@redhat.com>
---
v3:
- refuse pin states that are not valid in the device mode, so that
  connected is refused in automatic mode, the mode the device reports,
  with an extack message (Ivan Vecera)
- the Acked-by of v2 is not carried over, the callback changed

v2: https://lore.kernel.org/all/20261105151852.1844305-6-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-6-poros@redhat.com/
---
 drivers/dpll/dpllsim/dpll.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index a1d5921fb8d017..794020d0c112e8 100644
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
2.56.0


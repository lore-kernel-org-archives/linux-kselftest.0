Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597617;
	b=iyJrqCJrwwb/1Yyz3ogTlkfsCLn5IaAEcgEsIhr6ibof9fDcUIncuK0zY+fio+TKRZEW
	 ZyV0c1ToKdnEd65Ks7kB+GRTBFSmXxuzbAZTdJkNrpQc6KPLi8q796O7v7V+4h9sQkGyn
	 ImnXoMki0y5WmC/1KNms4hpIrVSmszExxhBKRe1M4YO5uN5uQeT/7HFGfbvJ+sul9QDKN
	 npjK2EWpJc2zVml1HKiPN8YlPNR1BmTRdyLuNrdlDqGG3D6Job9t/YEfgI3jLM5NvzJKy
	 LD9SS/ccOnOSy2XAkmE4BnPgFf1srHyU2Xvt1T+ji3Zbxw79nz5RaF6qUGfORvd4stA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597617;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=YkdgIb/ogo49IQqVcaPEdvjpurmZVmFsATKQs9T1HpA=;
	b=Rj6hYclxGq0Jtm4lAzQNotHb7kbCjyRoi4kz/sI7JBS4NFw81ZDz5A6dY8+OhHmwCrQY
	 kSy80o4ErIulw29Iua0ioxYFClWkewTIKNSXJNwTJTTBooXR0u6XPRJ8WIahyMzD8W8oR
	 ZtLFmFPYTnQ3b9jAshSfUYu6HDBTQ0yNVSufyHvmelOR/AsBLU1qbLrvLrW393O2bo/0m
	 lmxAbVhtT6zZ3t2xoeKB19B/BzYeLq4wpdKnKI1HFKs48eHbwXZRMvkpk517U13uwbpJk
	 nPXXPZK1HF3dfWOHiNXGUAPGx09m/awpM5UzscHD/ooiGuHrVr1McWnXpw8ff7uKtWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TQvSdiuc;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F26606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TQvSdiuc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkdgIb/ogo49IQqVcaPEdvjpurmZVmFsATKQs9T1HpA=;
	b=TQvSdiucBDBc/kWvgdRkp+dzvu6VpKfU1DaExQyiVef7v3OR3qmZ/giawLkcTY4GMf0/nL
	mPuc1l15MkzzbxazEE5Va58CrxK5P+jIisEEtqEeO2R4R/VbLCej8FfhhoXKGzLxWTGCTt
	OYOdRODI1bC0h/OtZZLUfQEb3gs92qo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-49-9iQ6ZORUMH64adUKdNZFsg-1; Wed,
 25 Nov 2026 09:06:52 +0000
X-MC-Unique: 9iQ6ZORUMH64adUKdNZFsg-1
X-Mimecast-MFC-AGG-ID: 9iQ6ZORUMH64adUKdNZFsg_1795597610
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC385195DE0C;
	Wed, 25 Nov 2026 09:06:47 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50D5F195B3D9;
	Wed, 25 Nov 2026 09:06:42 +0000 (UTC)
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
Subject: [PATCH net-next v5 11/14] dpll: dpllsim: Add support to adjust phase
Date: Wed, 25 Nov 2026 10:05:18 +0100
Message-ID: <20261125090522.3777494-12-poros@redhat.com>
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

Add support to get and set the phase adjustment of input and output
pins. The pins advertise a granularity of 100 ps and a symmetric range
whose ends are the largest multiples of the granularity that fit a
32-bit signed value, so that the advertised ends themselves are
settable, the core validates the requested value against both and the
driver stores it. The adjustment is reset to zero every time the device
goes live, so that repeated deploy cycles start from a known state. It
becomes the baseline of the simulated phase offset measurements once
those exist. The documentation of the simulator describes the range, the
granularity and the reset, and says that a pin state set over netlink is
not kept across a live transition either.

Reviewed-by: Ivan Vecera <ivecera@redhat.com>
Acked-by: Jiri Pirko <jiri@nvidia.com>
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- describe the phase adjust range, its granularity and its reset in
  the documentation, and that a pin state set over netlink is not
  kept across a live transition either
- give the phase adjust its own comment in the pin structure, it
  starts from 0 and has no configured value
- split the documentation sentence on values set over netlink, only an
  input pin takes a state and neither the state nor a phase adjust has
  a configfs attribute

v4: https://lore.kernel.org/all/20261112130359.840795-12-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-12-poros@redhat.com/
v2: https://lore.kernel.org/all/20261105151852.1844305-12-poros@redhat.com/
v1: https://lore.kernel.org/all/20261103093910.596225-12-poros@redhat.com/
---
 Documentation/driver-api/dpllsim.rst | 13 ++++++---
 drivers/dpll/dpllsim/dpll.c          | 40 ++++++++++++++++++++++++++++
 drivers/dpll/dpllsim/dpllsim.h       |  2 ++
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
index c36a35f0b39fa8..f8c357de78d9e0 100644
--- a/Documentation/driver-api/dpllsim.rst
+++ b/Documentation/driver-api/dpllsim.rst
@@ -63,11 +63,16 @@ priority other than the default, and with ``ENOENT`` when a pin
 directory is being created or removed at the same time. An ``EINVAL``
 does not name the pin, the attributes of the pins show which one it is.
 
-Every live transition starts from the configured values. A frequency or
-a priority set over netlink while the instance is live is reported back
+Every live transition starts from the configured values, and every pin
+starts disconnected and with a phase adjust of 0. A frequency or a
+priority set over netlink while the instance is live is reported back
 over netlink, it is not written to the ``frequency`` or ``prio``
-attribute and is gone once the instance is taken down. The driver
-stores the priority, it does not select a reference by it.
+attribute and is gone once the instance is taken down. The same holds
+for the state of an input pin and for a phase adjust set over netlink,
+neither has an attribute. The driver stores the priority, it does not
+select a reference by it.
+Input and output pins accept a phase adjust in steps of 100 ps between
+-2147483600 and 2147483600 ps.
 
 Example
 =======
diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index 3c6ce1a64217dc..90150301805a45 100644
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
index fc5eef0324f56f..0443f148d83a56 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -45,6 +45,8 @@ struct dpllsim_pin {
 	 */
 	u64 frequency;
 	u32 prio;
+	/* Starts from 0 at live=1, changed by the netlink setter */
+	s32 phase_adjust;
 };
 
 struct dpllsim_dev {
-- 
2.56.1


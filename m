Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597593;
	b=oU0AQA6yvVnjXQ4Ebb89Azi2FR4Jx2AQhMsu6CIztQ7f3U1P++XEtYAkzRsQnUgPgymY
	 wX1AuRk/B4TfuE6BqtitCCFXfn+XweJBfm7vkRJRZ6mqmXYOhxGl2Hw8+wItVOmPymp9d
	 bank8u8W8VOAN+/oCh3QmZRkpKB/YSM4aVXGyHTt3IlbYo21gm2/f8NuVzMTmSYSBDlUT
	 uYHPH34yTbUpMrM5CEpdKzcm0zV/rYdpu0VUc7kuoVQHAyDpNcR8rAth6efp/idFsXEPD
	 7yZgGgEUNePVnCWNoxf8P8uzQom++rL0LRSOI9eoYeOP70czjPvhI/nDFS+l+SypsAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597593;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=2iIasKPsBs+LRz1JXjycfpG5i+doDDlfmNtf2Mrqj9g=;
	b=GrBuZIa4iAxm4wydA8jPAJzzktcQm34VHcCkinpKfXnKThewXusYmZWFurKaCBkRGBLk
	 qXnLfRHON8YPBILHUPp2XgKX+kOLh3RlgB+5XwyjoWBpBT3UiDFYdj7jAEuzSyUM8/NrR
	 ONl4BmvIMTDQzYcz3DEn/0Bss/IV2HMJqJZE4qgn64jAkwx6H8pPUsbjBl2vEqmhgbDNZ
	 WcJB/MjLv3EPJs6054WE2CKiyI6WbJjac1d1YfKVdF7dVFQZABTLit4yx6s7v+3sxaoOl
	 RbaJcrfuNMtSLkGXpPuN5uZMJBNTZrDVN46/qKEGLCidLOHDGnhHx82clLCF41J77PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rb7CdESC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E0F606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E0F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rb7CdESC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795597591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2iIasKPsBs+LRz1JXjycfpG5i+doDDlfmNtf2Mrqj9g=;
	b=Rb7CdESCL2R5XZOljCByztp6KZOjF9wHZcETxgs8S0V20QVTIQLvgM5KzVqgbdDArdpYCc
	R0fpluXj5L5Uhk6tgoEVf7S8ZbsxBFQm+VpmfS1Tif0YM46X9FzU6RlRhgEmjjZGGq6JLL
	Cd86sNJ0uiZ20szhIzx3iIoTrAAe2rY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-Do682KxvODWaWDWumfB4zg-1; Wed,
 25 Nov 2026 09:06:27 +0000
X-MC-Unique: Do682KxvODWaWDWumfB4zg-1
X-Mimecast-MFC-AGG-ID: Do682KxvODWaWDWumfB4zg_1795597585
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C9EE195608D;
	Wed, 25 Nov 2026 09:06:25 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C35C0195B3C8;
	Wed, 25 Nov 2026 09:06:20 +0000 (UTC)
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
Subject: [PATCH net-next v5 07/14] dpll: dpllsim: Add support to get/set priority on input pins
Date: Wed, 25 Nov 2026 10:05:14 +0100
Message-ID: <20261125090522.3777494-8-poros@redhat.com>
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

Add support for getting and setting the priority of input pins.
Implement the prio_get and prio_set callbacks and advertise the
priority-can-change capability for input pins, which includes the MUX
type pins since those are always inputs.

The initial priority of a pin is configured through a new prio attribute
of the pin directory, which takes a value between 0 and 255 and defaults
to 128, so that a test can lay out the reference order before the device
goes live. Like the other pin attributes it is writable only while the
device is not live. Priority changes made over netlink are stored and
reported back, the driver does not select a reference by them. They are
kept apart from the configured value, so that every live transition
starts from what configfs holds, the way the pin state starts from
disconnected, and the attribute keeps showing what was configured. The
setter rejects a value above 255 with EINVAL and an extack message. A
priority is meaningful for input pins only, so live fails with EINVAL
when an output pin was given a priority other than the default, next to
the frequency validation.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- correct a comparison in the changelog, the pin state starts from
  disconnected and not from configfs, no code change

v4:
- keep the priority set over netlink apart from the configured one,
  every live transition starts from the configured value and the
  attribute keeps showing it
- document that, and that the driver only stores the priority
- the Reviewed-by and Acked-by of v3 are not carried over, the
  behaviour of the driver changed

v4: https://lore.kernel.org/all/20261112130359.840795-8-poros@redhat.com/
v3: https://lore.kernel.org/all/20261109093523.931201-8-poros@redhat.com/
---
 Documentation/driver-api/dpllsim.rst | 18 ++++++++---
 drivers/dpll/dpllsim/core.c          | 31 +++++++++++++++++++
 drivers/dpll/dpllsim/dpll.c          | 46 ++++++++++++++++++++++++++--
 drivers/dpll/dpllsim/dpllsim.h       |  6 ++++
 4 files changed, 95 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
index 5b878ff51331c3..ce71c8bad6b375 100644
--- a/Documentation/driver-api/dpllsim.rst
+++ b/Documentation/driver-api/dpllsim.rst
@@ -38,6 +38,8 @@ Pin directory ``/sys/kernel/config/dpllsim/<dev>/pins/<pin>/``:
                (default 0, which is rejected)
 ``direction``  ``input`` or ``output`` (default ``input``), a ``mux`` pin
                must be an input
+``prio``       Initial priority 0-255 of an input pin, output pins must
+               keep the default (default 128)
 =============  ===============================================================
 
 The pin directory name becomes the board label of the pin. Pins are
@@ -56,10 +58,16 @@ The frequencies a pin type supports:
 
 The pin configuration is checked when 1 is written to ``live``. The
 write fails with ``EINVAL`` when a pin has a frequency its type does not
-support or when a ``mux`` pin is an output, and with ``ENOENT`` when a
-pin directory is being created or removed at the same time. An
-``EINVAL`` does not name the pin, the attributes of the pins show which
-one it is.
+support, when a ``mux`` pin is an output or when an output pin has a
+priority other than the default, and with ``ENOENT`` when a pin
+directory is being created or removed at the same time. An ``EINVAL``
+does not name the pin, the attributes of the pins show which one it is.
+
+Every live transition starts from the configured values. A priority set
+over netlink while the instance is live is reported back over netlink,
+it is not written to the ``prio`` attribute and is gone once the
+instance is taken down. The driver stores the priority, it does not
+select a reference by it.
 
 Example
 =======
@@ -73,8 +81,10 @@ output, then make it live::
     mkdir pins/gnss0
     echo gnss > pins/gnss0/type
     echo 1 > pins/gnss0/frequency
+    echo 0 > pins/gnss0/prio
     mkdir pins/ext0
     echo 10000000 > pins/ext0/frequency
+    echo 1 > pins/ext0/prio
     mkdir pins/out0
     echo 10000000 > pins/out0/frequency
     echo output > pins/out0/direction
diff --git a/drivers/dpll/dpllsim/core.c b/drivers/dpll/dpllsim/core.c
index 3d0fba45323b6a..c7e0a218000403 100644
--- a/drivers/dpll/dpllsim/core.c
+++ b/drivers/dpll/dpllsim/core.c
@@ -132,10 +132,40 @@ static ssize_t dpllsim_pin_frequency_store(struct config_item *item,
 }
 CONFIGFS_ATTR(dpllsim_pin_, frequency);
 
+static ssize_t dpllsim_pin_prio_show(struct config_item *item, char *page)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+
+	guard(mutex)(&pin->dev->lock);
+	return sysfs_emit(page, "%u\n", pin->cfg_prio);
+}
+
+static ssize_t dpllsim_pin_prio_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+	u32 val;
+	int err;
+
+	err = kstrtou32(page, 10, &val);
+	if (err)
+		return err;
+	if (val > DPLLSIM_PIN_PRIO_MAX)
+		return -EINVAL;
+
+	guard(mutex)(&pin->dev->lock);
+	if (dpllsim_dev_frozen(pin->dev))
+		return -EBUSY;
+	pin->cfg_prio = val;
+	return count;
+}
+CONFIGFS_ATTR(dpllsim_pin_, prio);
+
 static struct configfs_attribute *dpllsim_pin_attrs[] = {
 	&dpllsim_pin_attr_type,
 	&dpllsim_pin_attr_direction,
 	&dpllsim_pin_attr_frequency,
+	&dpllsim_pin_attr_prio,
 	NULL,
 };
 
@@ -178,6 +208,7 @@ static struct config_item *dpllsim_pins_make_item(struct config_group *group,
 	pin->dev = sim;
 	pin->type = DPLL_PIN_TYPE_EXT;
 	pin->direction = DPLL_PIN_DIRECTION_INPUT;
+	pin->cfg_prio = DPLLSIM_DEFAULT_PIN_PRIO;
 	list_add_tail(&pin->list, &sim->pin_list);
 
 	return &pin->item;
diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index d838a2bbdf52f6..ecc8dd7af46ef3 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -139,11 +139,43 @@ static int dpllsim_pin_state_set(const struct dpll_pin *pin, void *pin_priv,
 	return 0;
 }
 
+static int dpllsim_pin_prio_get(const struct dpll_pin *pin, void *pin_priv,
+				const struct dpll_device *dpll,
+				void *dpll_priv, u32 *prio,
+				struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	*prio = sim_pin->prio;
+	return 0;
+}
+
+static int dpllsim_pin_prio_set(const struct dpll_pin *pin, void *pin_priv,
+				const struct dpll_device *dpll,
+				void *dpll_priv, u32 prio,
+				struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	if (prio > DPLLSIM_PIN_PRIO_MAX) {
+		NL_SET_ERR_MSG_FMT(extack, "Pin priority must be in range 0-%u",
+				   DPLLSIM_PIN_PRIO_MAX);
+		return -EINVAL;
+	}
+
+	guard(mutex)(&sim_pin->dev->lock);
+	sim_pin->prio = prio;
+	return 0;
+}
+
 static const struct dpll_pin_ops dpllsim_input_pin_ops = {
 	.frequency_get = dpllsim_pin_frequency_get,
 	.direction_get = dpllsim_pin_direction_get,
 	.state_on_dpll_get = dpllsim_pin_state_get,
 	.state_on_dpll_set = dpllsim_pin_state_set,
+	.prio_get = dpllsim_pin_prio_get,
+	.prio_set = dpllsim_pin_prio_set,
 };
 
 static const struct dpll_pin_ops dpllsim_output_pin_ops = {
@@ -188,7 +220,8 @@ static void dpllsim_pin_props(struct dpllsim_pin *pin,
 
 	/* Capabilities follow the ops the pin is served by */
 	if (dpllsim_pin_select_ops(pin) == &dpllsim_input_pin_ops)
-		prop->capabilities = DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;
+		prop->capabilities = DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE |
+				     DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE;
 	else
 		prop->capabilities = 0;
 }
@@ -214,10 +247,18 @@ static bool dpllsim_pin_direction_valid(const struct dpllsim_pin *pin)
 	       pin->direction == DPLL_PIN_DIRECTION_INPUT;
 }
 
+/* Priority is meaningful for input pins only */
+static bool dpllsim_pin_prio_valid(const struct dpllsim_pin *pin)
+{
+	return pin->direction == DPLL_PIN_DIRECTION_INPUT ||
+	       pin->cfg_prio == DPLLSIM_DEFAULT_PIN_PRIO;
+}
+
 static void dpllsim_pin_reset(struct dpllsim_pin *pin)
 {
 	pin->ops = dpllsim_pin_select_ops(pin);
 	pin->state = DPLL_PIN_STATE_DISCONNECTED;
+	pin->prio = pin->cfg_prio;
 }
 
 /* Build sim->pins in registration order, the order the pins were created */
@@ -228,7 +269,8 @@ static int dpllsim_order_pins(struct dpllsim_dev *sim)
 
 	list_for_each_entry(pin, &sim->pin_list, list) {
 		if (!dpllsim_pin_frequency_valid(pin) ||
-		    !dpllsim_pin_direction_valid(pin))
+		    !dpllsim_pin_direction_valid(pin) ||
+		    !dpllsim_pin_prio_valid(pin))
 			return -EINVAL;
 		count++;
 	}
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index af33afc70cb2ee..44afcd9918c400 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -12,6 +12,9 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 
+#define DPLLSIM_DEFAULT_PIN_PRIO		128
+#define DPLLSIM_PIN_PRIO_MAX			255
+
 #define DPLLSIM_MAX_PINS			128
 
 struct dpllsim_dev;
@@ -25,6 +28,7 @@ struct dpllsim_pin {
 	enum dpll_pin_type type;
 	enum dpll_pin_direction direction;
 	u64 frequency;
+	u32 cfg_prio;
 
 	/* Resolved at live=1 */
 	int idx;
@@ -35,6 +39,8 @@ struct dpllsim_pin {
 
 	/* Simulated state, guarded by dev->lock */
 	enum dpll_pin_state state;
+	/* Starts from cfg_prio at live=1, changed by the netlink setter */
+	u32 prio;
 };
 
 struct dpllsim_dev {
-- 
2.56.1


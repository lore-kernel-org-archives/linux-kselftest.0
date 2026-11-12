Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488695;
	b=U9zlO+4o5cx5Bi+NH79DC6EmV/m4NvVrupuYmnXFy5+iFCULw9RKg7H0VJ3z0yQIFyM4
	 nctTTdcqCkzJ1NR3dR4yC+MSuTSd2AivYYqFRXRMBOS/nqh6OIlR2PClQwTkYfd4AoZ1C
	 0HySDToUDA/6ONX9uNFbwRn1iUV1zcuETZGI5FKrBdY12wTmvLdDJH7WaJkXj6GqMDACW
	 nOgde5HqAoXYI0hJky0WCo2pERM2u5nY/WZZVIBTYMBS+qpXoA/YkYwmpPUMl2BVHx4L2
	 5hXLvXg1IJbe9t/ms5p7E7NaDLbkPBM8vkDkBoFfGqEe8daIhb/MOzhDNZpx9+TIPNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488695;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Kg0MZQvjdwOk69GFrP5+fW73LqRRrmNtJ2Rz4IAm6xo=;
	b=tCr/qpV/AkExm36pst3JochPPcijmE6hjwispSa0jKHf/XDht7U1CH7HG3/H0aDZgTVC
	 TEBeMqZHHPjj/oyo7fb5D5Gsd6w32RcMORSVvSPczNO8XL/0v5FeE/2T4tRselJT/UvNr
	 /cmjDB14TxK7pnCBNpIju6bDt1a9g6hnDtzvbdjP8U2+U4hwYHhwMzEHqqQpj5vmTZURB
	 FZQIimmcHQCqkYUSuF6XmAItG9f3ygpyFIy6eOgkb7xFQiuOXoyBpRNPkskdo2fsKkQfZ
	 iBiQxPsmaYSckfvLtgrHq7spbsb6D7hmoFxeO0jSWnI1OoyROesz2juCcTDd73odiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBNFv5qW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC88606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 13:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC88606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hBNFv5qW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794488694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kg0MZQvjdwOk69GFrP5+fW73LqRRrmNtJ2Rz4IAm6xo=;
	b=hBNFv5qWdjrRpBqfMT9OgKcXNIJ63naJkak34YPaBSl/mg4o7rABCHbDFNry8U26mcWYlD
	n5u2Xq4XhXmNQKcyxyXG8aeoJX9Hwbd9U4azn+6uHXlJoEoaqxWJjBu1+zJhObjueL8KVr
	KS0jiqciJAgqz+PMj3iFB200IvE53WI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-53sTMzbhP7e160BL-MRGGg-1; Thu,
 12 Nov 2026 08:04:49 -0500
X-MC-Unique: 53sTMzbhP7e160BL-MRGGg-1
X-Mimecast-MFC-AGG-ID: 53sTMzbhP7e160BL-MRGGg_1794488687
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CAB018A68C8;
	Thu, 12 Nov 2026 13:04:47 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.7])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EAEF31956087;
	Thu, 12 Nov 2026 13:04:42 +0000 (UTC)
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
Subject: [PATCH net-next v4 07/14] dpll: dpllsim: Add support to get/set priority on input pins
Date: Thu, 12 Nov 2026 14:03:52 +0100
Message-ID: <20261112130359.840795-8-poros@redhat.com>
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

Add support for getting and setting the priority of input pins.
Implement the prio_get and prio_set callbacks and advertise the
priority-can-change capability for input pins, which includes the MUX
type pins since those are always inputs.

The initial priority of a pin is configured through a new prio
attribute of the pin directory, which takes a value between 0 and 255
and defaults to 128, so that a test can lay out the reference order
before the device goes live. Like the other pin attributes it is
writable only while the device is not live. Priority changes made over
netlink are stored and reported back, the driver does not select a
reference by them. They are kept apart from the configured value, so
that every live transition starts from what configfs holds, like the
pin state does, and the attribute keeps showing what was configured.
The setter rejects a value above 255 with EINVAL and an extack message.
A priority is meaningful for input pins only, so live fails with EINVAL
when an output pin was given a priority other than the default, next
to the frequency validation.

Signed-off-by: Petr Oros <poros@redhat.com>
---
v4:
- keep the priority set over netlink apart from the configured one,
  every live transition starts from the configured value and the
  attribute keeps showing it
- document that, and that the driver only stores the priority
- the Reviewed-by and Acked-by of v3 are not carried over, the
  behaviour of the driver changed

v3: https://lore.kernel.org/all/20261109093523.931201-8-poros@redhat.com/
---
 Documentation/driver-api/dpllsim.rst | 15 +++++++--
 drivers/dpll/dpllsim/core.c          | 31 +++++++++++++++++++
 drivers/dpll/dpllsim/dpll.c          | 46 ++++++++++++++++++++++++++--
 drivers/dpll/dpllsim/dpllsim.h       |  6 ++++
 4 files changed, 94 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
index a0e5ea44d2c6d3..27cfc4b2c71518 100644
--- a/Documentation/driver-api/dpllsim.rst
+++ b/Documentation/driver-api/dpllsim.rst
@@ -37,6 +37,8 @@ Pin directory ``/sys/kernel/config/dpllsim/<dev>/pins/<pin>/``:
                (default 0, which is rejected)
 ``direction``  ``input`` or ``output`` (default ``input``), a ``mux`` pin
                must be an input
+``prio``       Initial priority 0-255 of an input pin, output pins must
+               keep the default (default 128)
 =============  ===============================================================
 
 The pin directory name becomes the board label of the pin. Pins are
@@ -55,8 +57,15 @@ The frequencies a pin type supports:
 
 The pin configuration is checked when 1 is written to ``live``. The
 write fails with ``EINVAL`` when a pin has a frequency its type does not
-support or when a ``mux`` pin is an output, and with ``ENOENT`` when a
-pin directory is being created or removed at the same time.
+support, when a ``mux`` pin is an output or when an output pin has a
+priority other than the default, and with ``ENOENT`` when a pin
+directory is being created or removed at the same time.
+
+Every live transition starts from the configured values. A priority set
+over netlink while the instance is live is reported back over netlink,
+it is not written to the ``prio`` attribute and is gone once the
+instance is taken down. The driver stores the priority, it does not
+select a reference by it.
 
 Example
 =======
@@ -70,8 +79,10 @@ output, then make it live::
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
index 21c56aa4ecf5ac..fca16ec0976684 100644
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
index 794020d0c112e8..9fdb5dbeba4400 100644
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
index 73b846b66f79c7..54f4f1636f64e4 100644
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
2.56.0


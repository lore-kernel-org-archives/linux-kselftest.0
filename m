Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698793;
	b=hImB2KVYaSIj3NXrgAGsIawtSItAmF252I48sTfFlsWWMLFKgXny4xM7nzrpZsbfYhzv
	 Ft855rSijuPv6az+ZGEDj78poYj6ZuW2Fv8BdqdKzfSXhbGcaDZzvF5heViOtEvzaatAP
	 iJPXzQBOhJpOtirkiQe/QBs/dy+tjDKrVaT6WVNEdwoWmC3ibleKXUkR2dDduQojdHu1w
	 Up4IEGo++doWVwT3VRh3HaLPqt8IPtyx9mU/x+b0hFk42zV142cLP9MK+vh8wGnkCew+0
	 CvH1+nazAypYnyIDUPd4zFuDYcHJFuWfHmyTClV1Q7awjN9/Dr2c66Y8AI0bL7pZYJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698793;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=/JpKhuRcXEQ35ABg9hpHRmXRj8rkyqBDRvfAMQTAiqA=;
	b=Q2cU0Bl8aZYloMHTLhvnwLLL31GxUZZqn1c/Xbi8FVf0C9plwPY9ilw8vgqCcm5wpKzK
	 OxuGWdU0JxKeuHr5p387R4j/BfOZXyCXvk6Y6r9CUxUiDKyl79b49DRCeMV+C78BoOcsr
	 XLtGPQmeKccOwAjPZsSWxeYGsJMDfpvR6evYjba2HCyj5vIlw+deo6nkG6yDvnZ+CUcte
	 8wpaxKSK/ckSa0Y82DRLLNuD2Krp22be0WXDTyouhgLT/HsiYvPkpqPG3rlrUfP+E2ar3
	 8tJtkK+hYi3tpBlD0bPNvqi2Mb2uVpg9zDH9L8UTvhCf9DOWKuOBafnQ0ROL2HbRWBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BiTbJiAU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F81D606A33F
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F81D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BiTbJiAU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JpKhuRcXEQ35ABg9hpHRmXRj8rkyqBDRvfAMQTAiqA=;
	b=BiTbJiAU7vyrr9JisecFbQXnp/VhluUHoT56JiB6cfz0TpjcdtLV1Fe69ROvIEmmwmidnm
	I4ycf767aHKyeo0GWswjW3mFgtQ+V68MUTrdLe0nfA1lTUt6s/p5mSL8Lq8hqGQ8kU/RDF
	aKIwgoU1i0VoPtA3asnyMpt6l3YDiu0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602--xs74sRdN1edNM-sOrFLvg-1; Tue,
 03 Nov 2026 04:39:50 -0500
X-MC-Unique: -xs74sRdN1edNM-sOrFLvg-1
X-Mimecast-MFC-AGG-ID: -xs74sRdN1edNM-sOrFLvg_1793698788
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1398A1955BCB;
	Tue,  3 Nov 2026 09:39:48 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C832C7E2;
	Tue,  3 Nov 2026 09:39:43 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH net-next 03/14] dpll: dpllsim: Add configurable pins
Date: Tue,  3 Nov 2026 10:38:59 +0100
Message-ID: <20261103093910.596225-4-poros@redhat.com>
In-Reply-To: <20261103093910.596225-1-poros@redhat.com>
References: <20261103093910.596225-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Pins are the unit of most DPLL netlink interaction, so let a device
instance carry an arbitrary set of them. Each directory created under
the pins/ group of an instance is one pin with type, frequency and
direction attributes. The type takes the names of the DPLL pin type
enum as iproute2 prints them, the direction is input or output and the
frequency must be one of the frequencies the driver advertises as
supported for the type. The pin directory name becomes the board label
of the pin, which gives tests a stable handle to find a pin by. The
attributes are writable only while the instance is not live and return
EBUSY otherwise.

At live=1 the pins are ordered as created and each pin records its
index in that order, which is the pin index it is registered under.
Their frequencies are validated against the per type tables, a MUX pin
configured as output is rejected since a MUX pin stands for an input
selector, and all pin handles are obtained up front, so that a failure
leaves nothing half visible. The device is registered first and the
pins after it, so that every pin registration event reaches userspace
with a valid device, and a failure unwinds exactly what was registered
in reverse order. While the instance is live the pin items are held
with configfs_depend_item_unlocked(), which makes rmdir of a pin fail
with EBUSY until the instance is taken down.

The pins register with the mandatory callbacks only, direction_get and
state_on_dpll_get, plus frequency_get since the frequency is known from
the configuration. The input and output ops tables are identical here
and diverge when input pins gain their setters in the next patches. The
state is always reported as disconnected for now, the settable pin
features follow in separate patches.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 Documentation/driver-api/dpllsim.rst |  40 +++-
 drivers/dpll/dpllsim/core.c          | 225 ++++++++++++++++++++-
 drivers/dpll/dpllsim/dpll.c          | 280 ++++++++++++++++++++++++++-
 drivers/dpll/dpllsim/dpllsim.h       |  32 +++
 4 files changed, 565 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
index 86a5d523534055..e7c5ee93392c21 100644
--- a/Documentation/driver-api/dpllsim.rst
+++ b/Documentation/driver-api/dpllsim.rst
@@ -12,10 +12,12 @@ Configuration interface
 =======================
 
 Devices are described in configfs under ``/sys/kernel/config/dpllsim/``.
-A directory created there is a device instance. Attributes are written
-while the instance is not live, then ``live`` is set to 1 to register
-the device with the DPLL subsystem. Writing 0 unregisters it again.
-Structural attributes return ``EBUSY`` while the instance is live.
+A directory created there is a device instance, a directory created in
+its ``pins/`` subdirectory is a pin. Attributes are written while the
+instance is not live, then ``live`` is set to 1 to register the device
+and its pins with the DPLL subsystem. Writing 0 unregisters everything
+again. Structural attributes return ``EBUSY`` while the instance is live
+and pins of a live instance cannot be removed.
 
 Device directory ``/sys/kernel/config/dpllsim/<dev>/``:
 
@@ -25,17 +27,41 @@ Device directory ``/sys/kernel/config/dpllsim/<dev>/``:
 ``live``                 1 registers the device, 0 unregisters it
 =======================  =====================================================
 
+Pin directory ``/sys/kernel/config/dpllsim/<dev>/pins/<pin>/``:
+
+=============  ===============================================================
+``type``       ``gnss``, ``int-oscillator``, ``ext``, ``synce-eth-port`` or
+               ``mux`` (default ``ext``)
+``frequency``  Frequency in Hz, must be supported by the pin type
+               (default 0, which is rejected)
+``direction``  ``input`` or ``output`` (default ``input``), a ``mux`` pin
+               must be an input
+=============  ===============================================================
+
+The pin directory name becomes the board label of the pin. Pins are
+registered in the order the directories were created.
+
 Example
 =======
 
-Create a device and make it live::
+Create a device with a GNSS input, an external input and an external
+output, then make it live::
 
     cd /sys/kernel/config/dpllsim
     mkdir dev0 && cd dev0
     echo 100 > clock_id
+    mkdir pins/gnss0
+    echo gnss > pins/gnss0/type
+    echo 1 > pins/gnss0/frequency
+    mkdir pins/ext0
+    echo 10000000 > pins/ext0/frequency
+    mkdir pins/out0
+    echo 10000000 > pins/out0/frequency
+    echo output > pins/out0/direction
     echo 1 > live
 
     dpll device show
+    dpll pin show
 
-To remove the device, write 0 to ``live`` and remove the device
-directory.
+To remove the device, write 0 to ``live``, remove the pin directories
+and finally the device directory.
diff --git a/drivers/dpll/dpllsim/core.c b/drivers/dpll/dpllsim/core.c
index 0772f409d013b7..97b3cf48772e7f 100644
--- a/drivers/dpll/dpllsim/core.c
+++ b/drivers/dpll/dpllsim/core.c
@@ -6,12 +6,14 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 
 #include "dpllsim.h"
@@ -23,6 +25,182 @@ static struct dpllsim_dev *to_dpllsim_dev(struct config_item *item)
 	return container_of(to_config_group(item), struct dpllsim_dev, group);
 }
 
+static struct dpllsim_pin *to_dpllsim_pin(struct config_item *item)
+{
+	return container_of(item, struct dpllsim_pin, item);
+}
+
+static const struct {
+	const char *name;
+	enum dpll_pin_type type;
+} dpllsim_pin_types[] = {
+	{ "gnss", DPLL_PIN_TYPE_GNSS },
+	{ "int-oscillator", DPLL_PIN_TYPE_INT_OSCILLATOR },
+	{ "ext", DPLL_PIN_TYPE_EXT },
+	{ "synce-eth-port", DPLL_PIN_TYPE_SYNCE_ETH_PORT },
+	{ "mux", DPLL_PIN_TYPE_MUX },
+};
+
+static ssize_t dpllsim_pin_type_show(struct config_item *item, char *page)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+	int i;
+
+	guard(mutex)(&pin->dev->lock);
+	for (i = 0; i < ARRAY_SIZE(dpllsim_pin_types); i++)
+		if (dpllsim_pin_types[i].type == pin->type)
+			return sysfs_emit(page, "%s\n",
+					  dpllsim_pin_types[i].name);
+	return -EINVAL;
+}
+
+static ssize_t dpllsim_pin_type_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpllsim_pin_types); i++)
+		if (sysfs_streq(page, dpllsim_pin_types[i].name))
+			break;
+	if (i == ARRAY_SIZE(dpllsim_pin_types))
+		return -EINVAL;
+
+	guard(mutex)(&pin->dev->lock);
+	if (dpllsim_dev_frozen(pin->dev))
+		return -EBUSY;
+	pin->type = dpllsim_pin_types[i].type;
+	return count;
+}
+CONFIGFS_ATTR(dpllsim_pin_, type);
+
+static ssize_t dpllsim_pin_direction_show(struct config_item *item, char *page)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+
+	guard(mutex)(&pin->dev->lock);
+	return sysfs_emit(page, "%s\n",
+			  pin->direction == DPLL_PIN_DIRECTION_INPUT ?
+			  "input" : "output");
+}
+
+static ssize_t dpllsim_pin_direction_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+	enum dpll_pin_direction direction;
+
+	if (sysfs_streq(page, "input"))
+		direction = DPLL_PIN_DIRECTION_INPUT;
+	else if (sysfs_streq(page, "output"))
+		direction = DPLL_PIN_DIRECTION_OUTPUT;
+	else
+		return -EINVAL;
+
+	guard(mutex)(&pin->dev->lock);
+	if (dpllsim_dev_frozen(pin->dev))
+		return -EBUSY;
+	pin->direction = direction;
+	return count;
+}
+CONFIGFS_ATTR(dpllsim_pin_, direction);
+
+static ssize_t dpllsim_pin_frequency_show(struct config_item *item, char *page)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+
+	guard(mutex)(&pin->dev->lock);
+	return sysfs_emit(page, "%llu\n", pin->frequency);
+}
+
+static ssize_t dpllsim_pin_frequency_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+	u64 val;
+	int err;
+
+	err = kstrtou64(page, 10, &val);
+	if (err)
+		return err;
+
+	guard(mutex)(&pin->dev->lock);
+	if (dpllsim_dev_frozen(pin->dev))
+		return -EBUSY;
+	pin->frequency = val;
+	return count;
+}
+CONFIGFS_ATTR(dpllsim_pin_, frequency);
+
+static struct configfs_attribute *dpllsim_pin_attrs[] = {
+	&dpllsim_pin_attr_type,
+	&dpllsim_pin_attr_direction,
+	&dpllsim_pin_attr_frequency,
+	NULL,
+};
+
+static void dpllsim_pin_release(struct config_item *item)
+{
+	struct dpllsim_pin *pin = to_dpllsim_pin(item);
+
+	kfree(pin);
+}
+
+static const struct configfs_item_operations dpllsim_pin_item_ops = {
+	.release	= dpllsim_pin_release,
+};
+
+static const struct config_item_type dpllsim_pin_type = {
+	.ct_item_ops	= &dpllsim_pin_item_ops,
+	.ct_attrs	= dpllsim_pin_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_item *dpllsim_pins_make_item(struct config_group *group,
+						  const char *name)
+{
+	struct dpllsim_dev *sim = container_of(group, struct dpllsim_dev,
+					       pins_group);
+	struct dpllsim_pin *pin;
+
+	lockdep_assert_held(&dpllsim_subsys.su_mutex);
+
+	if (dpllsim_dev_frozen(sim))
+		return ERR_PTR(-EBUSY);
+	if (list_count_nodes(&sim->pin_list) >= DPLLSIM_MAX_PINS)
+		return ERR_PTR(-ENOSPC);
+
+	pin = kzalloc_obj(*pin);
+	if (!pin)
+		return ERR_PTR(-ENOMEM);
+
+	config_item_init_type_name(&pin->item, name, &dpllsim_pin_type);
+	pin->dev = sim;
+	pin->type = DPLL_PIN_TYPE_EXT;
+	pin->direction = DPLL_PIN_DIRECTION_INPUT;
+	list_add_tail(&pin->list, &sim->pin_list);
+
+	return &pin->item;
+}
+
+/* Pin mkdir and rmdir run under the subsystem mutex like live transitions */
+static void dpllsim_pins_drop_item(struct config_group *group,
+				   struct config_item *item)
+{
+	list_del(&to_dpllsim_pin(item)->list);
+	config_item_put(item);
+}
+
+static const struct configfs_group_operations dpllsim_pins_group_ops = {
+	.make_item	= dpllsim_pins_make_item,
+	.drop_item	= dpllsim_pins_drop_item,
+};
+
+static const struct config_item_type dpllsim_pins_type = {
+	.ct_group_ops	= &dpllsim_pins_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
 /* The clock id is checked at live=1, so both share the subsystem mutex */
 static ssize_t dpllsim_dev_clock_id_show(struct config_item *item, char *page)
 {
@@ -82,9 +260,39 @@ static bool dpllsim_clock_id_in_use(struct dpllsim_dev *sim)
 	return false;
 }
 
+/* Pins of a live device cannot be removed */
+static void dpllsim_dev_undepend_pins(struct dpllsim_dev *sim,
+				      struct dpllsim_pin *last)
+{
+	struct dpllsim_pin *pin;
+
+	list_for_each_entry(pin, &sim->pin_list, list) {
+		if (pin == last)
+			break;
+		configfs_undepend_item_unlocked(&pin->item);
+	}
+}
+
+static int dpllsim_dev_depend_pins(struct dpllsim_dev *sim)
+{
+	struct dpllsim_pin *pin;
+	int err;
+
+	list_for_each_entry(pin, &sim->pin_list, list) {
+		err = configfs_depend_item_unlocked(&dpllsim_subsys,
+						    &pin->item);
+		if (err) {
+			dpllsim_dev_undepend_pins(sim, pin);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 /*
- * The subsystem mutex excludes the live transitions of the other
- * instances for the whole deploy sequence.
+ * The subsystem mutex excludes pin mkdir and rmdir and the live
+ * transitions of the other instances for the whole deploy sequence.
  */
 static ssize_t dpllsim_dev_live_store(struct config_item *item,
 				      const char *page, size_t count)
@@ -104,6 +312,7 @@ static ssize_t dpllsim_dev_live_store(struct config_item *item,
 
 	if (!live) {
 		dpllsim_dev_undeploy(sim);
+		dpllsim_dev_undepend_pins(sim, NULL);
 		return count;
 	}
 
@@ -112,10 +321,16 @@ static ssize_t dpllsim_dev_live_store(struct config_item *item,
 	if (dpllsim_clock_id_in_use(sim))
 		return -EEXIST;
 
-	err = dpllsim_dev_deploy(sim);
+	err = dpllsim_dev_depend_pins(sim);
 	if (err)
 		return err;
 
+	err = dpllsim_dev_deploy(sim);
+	if (err) {
+		dpllsim_dev_undepend_pins(sim, NULL);
+		return err;
+	}
+
 	return count;
 }
 CONFIGFS_ATTR(dpllsim_dev_, live);
@@ -154,11 +369,15 @@ static struct config_group *dpllsim_make_group(struct config_group *group,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&sim->lock);
+	INIT_LIST_HEAD(&sim->pin_list);
 	sim->mode = DPLL_MODE_AUTOMATIC;
 	sim->lock_status = DPLL_LOCK_STATUS_UNLOCKED;
 	sim->lock_status_error = DPLL_LOCK_STATUS_ERROR_NONE;
 
 	config_group_init_type_name(&sim->group, name, &dpllsim_dev_type);
+	config_group_init_type_name(&sim->pins_group, "pins",
+				    &dpllsim_pins_type);
+	configfs_add_default_group(&sim->pins_group, &sim->group);
 
 	return &sim->group;
 }
diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
index ae2c8fcf238c68..a1d5921fb8d017 100644
--- a/drivers/dpll/dpllsim/dpll.c
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -4,12 +4,39 @@
  * Copyright (c) 2026 Red Hat, Inc.
  */
 
+#include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/dpll.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "dpllsim.h"
 
+static struct dpll_pin_frequency dpllsim_freq_1pps[] = {
+	DPLL_PIN_FREQUENCY_RANGE(1, 1),
+};
+
+static struct dpll_pin_frequency dpllsim_freq_synce[] = {
+	DPLL_PIN_FREQUENCY_RANGE(1544000, 1544000),
+	DPLL_PIN_FREQUENCY_RANGE(2048000, 2048000),
+	DPLL_PIN_FREQUENCY_RANGE(10000000, 10000000),
+	DPLL_PIN_FREQUENCY_RANGE(25000000, 25000000),
+};
+
+static struct dpll_pin_frequency dpllsim_freq_ext[] = {
+	DPLL_PIN_FREQUENCY_RANGE(1, 1),
+	DPLL_PIN_FREQUENCY_RANGE(10000000, 10000000),
+	DPLL_PIN_FREQUENCY_RANGE(19440000, 19440000),
+	DPLL_PIN_FREQUENCY_RANGE(25000000, 25000000),
+	DPLL_PIN_FREQUENCY_RANGE(77760000, 77760000),
+	DPLL_PIN_FREQUENCY_RANGE(125000000, 125000000),
+	DPLL_PIN_FREQUENCY_RANGE(156250000, 156250000),
+};
+
+static struct dpll_pin_frequency dpllsim_freq_int_osc[] = {
+	DPLL_PIN_FREQUENCY_RANGE(25000000, 25000000),
+};
+
 static int dpllsim_mode_get(const struct dpll_device *dpll, void *priv,
 			    enum dpll_mode *mode,
 			    struct netlink_ext_ack *extack)
@@ -39,6 +66,229 @@ static const struct dpll_device_ops dpllsim_dpll_ops = {
 	.lock_status_get = dpllsim_lock_status_get,
 };
 
+static int dpllsim_pin_frequency_get(const struct dpll_pin *pin,
+				     void *pin_priv,
+				     const struct dpll_device *dpll,
+				     void *dpll_priv, u64 *frequency,
+				     struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	*frequency = sim_pin->frequency;
+	return 0;
+}
+
+static int dpllsim_pin_direction_get(const struct dpll_pin *pin,
+				     void *pin_priv,
+				     const struct dpll_device *dpll,
+				     void *dpll_priv,
+				     enum dpll_pin_direction *direction,
+				     struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	*direction = sim_pin->direction;
+	return 0;
+}
+
+static int dpllsim_pin_state_get(const struct dpll_pin *pin, void *pin_priv,
+				 const struct dpll_device *dpll,
+				 void *dpll_priv, enum dpll_pin_state *state,
+				 struct netlink_ext_ack *extack)
+{
+	struct dpllsim_pin *sim_pin = pin_priv;
+
+	guard(mutex)(&sim_pin->dev->lock);
+	*state = sim_pin->state;
+	return 0;
+}
+
+static const struct dpll_pin_ops dpllsim_input_pin_ops = {
+	.frequency_get = dpllsim_pin_frequency_get,
+	.direction_get = dpllsim_pin_direction_get,
+	.state_on_dpll_get = dpllsim_pin_state_get,
+};
+
+static const struct dpll_pin_ops dpllsim_output_pin_ops = {
+	.frequency_get = dpllsim_pin_frequency_get,
+	.direction_get = dpllsim_pin_direction_get,
+	.state_on_dpll_get = dpllsim_pin_state_get,
+};
+
+static const struct dpll_pin_ops *
+dpllsim_pin_select_ops(const struct dpllsim_pin *pin)
+{
+	if (pin->direction == DPLL_PIN_DIRECTION_INPUT)
+		return &dpllsim_input_pin_ops;
+	return &dpllsim_output_pin_ops;
+}
+
+static void dpllsim_pin_props(struct dpllsim_pin *pin,
+			      struct dpll_pin_properties *prop)
+{
+	prop->type = pin->type;
+	prop->board_label = config_item_name(&pin->item);
+
+	switch (pin->type) {
+	case DPLL_PIN_TYPE_GNSS:
+		prop->freq_supported = dpllsim_freq_1pps;
+		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_1pps);
+		break;
+	case DPLL_PIN_TYPE_INT_OSCILLATOR:
+		prop->freq_supported = dpllsim_freq_int_osc;
+		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_int_osc);
+		break;
+	case DPLL_PIN_TYPE_MUX:
+	case DPLL_PIN_TYPE_SYNCE_ETH_PORT:
+		prop->freq_supported = dpllsim_freq_synce;
+		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_synce);
+		break;
+	default:
+		prop->freq_supported = dpllsim_freq_ext;
+		prop->freq_supported_num = ARRAY_SIZE(dpllsim_freq_ext);
+		break;
+	}
+}
+
+static bool dpllsim_pin_frequency_valid(struct dpllsim_pin *pin)
+{
+	struct dpll_pin_properties prop = {};
+	int i;
+
+	dpllsim_pin_props(pin, &prop);
+	for (i = 0; i < prop.freq_supported_num; i++)
+		if (pin->frequency >= prop.freq_supported[i].min &&
+		    pin->frequency <= prop.freq_supported[i].max)
+			return true;
+
+	return false;
+}
+
+/* A MUX pin stands for an input selector, so it is an input itself */
+static bool dpllsim_pin_direction_valid(const struct dpllsim_pin *pin)
+{
+	return pin->type != DPLL_PIN_TYPE_MUX ||
+	       pin->direction == DPLL_PIN_DIRECTION_INPUT;
+}
+
+static void dpllsim_pin_reset(struct dpllsim_pin *pin)
+{
+	pin->ops = dpllsim_pin_select_ops(pin);
+	pin->state = DPLL_PIN_STATE_DISCONNECTED;
+}
+
+/* Build sim->pins in registration order, the order the pins were created */
+static int dpllsim_order_pins(struct dpllsim_dev *sim)
+{
+	struct dpllsim_pin *pin;
+	int count = 0, i;
+
+	list_for_each_entry(pin, &sim->pin_list, list) {
+		if (!dpllsim_pin_frequency_valid(pin) ||
+		    !dpllsim_pin_direction_valid(pin))
+			return -EINVAL;
+		count++;
+	}
+
+	sim->pins = kzalloc_objs(*sim->pins, count);
+	if (!sim->pins)
+		return -ENOMEM;
+
+	sim->num_pins = 0;
+	list_for_each_entry(pin, &sim->pin_list, list) {
+		pin->idx = sim->num_pins;
+		sim->pins[sim->num_pins++] = pin;
+	}
+
+	for (i = 0; i < sim->num_pins; i++)
+		dpllsim_pin_reset(sim->pins[i]);
+
+	return 0;
+}
+
+static void dpllsim_put_pins(struct dpllsim_dev *sim)
+{
+	int i;
+
+	for (i = sim->num_pins - 1; i >= 0; i--) {
+		struct dpllsim_pin *pin = sim->pins[i];
+
+		if (pin->dpll_pin) {
+			dpll_pin_put(pin->dpll_pin, &pin->tracker);
+			pin->dpll_pin = NULL;
+		}
+	}
+}
+
+static int dpllsim_get_pins(struct dpllsim_dev *sim)
+{
+	int i, err;
+
+	for (i = 0; i < sim->num_pins; i++) {
+		struct dpllsim_pin *pin = sim->pins[i];
+		struct dpll_pin_properties prop = {};
+		struct dpll_pin *dpll_pin;
+
+		dpllsim_pin_props(pin, &prop);
+		dpll_pin = dpll_pin_get(sim->clock_id, pin->idx, THIS_MODULE,
+					&prop, &pin->tracker);
+		if (IS_ERR(dpll_pin)) {
+			err = PTR_ERR(dpll_pin);
+			goto err_put_pins;
+		}
+		pin->dpll_pin = dpll_pin;
+	}
+
+	return 0;
+
+err_put_pins:
+	dpllsim_put_pins(sim);
+	return err;
+}
+
+static void dpllsim_unregister_pins(struct dpllsim_dev *sim)
+{
+	int i;
+
+	for (i = sim->num_pins - 1; i >= 0; i--) {
+		struct dpllsim_pin *pin = sim->pins[i];
+
+		if (pin->registered)
+			dpll_pin_unregister(sim->dpll, pin->dpll_pin, pin->ops,
+					    pin);
+		pin->registered = false;
+	}
+}
+
+static int dpllsim_register_pins(struct dpllsim_dev *sim)
+{
+	struct dpllsim_pin *pin;
+	int i, err;
+
+	for (i = 0; i < sim->num_pins; i++) {
+		pin = sim->pins[i];
+
+		err = dpll_pin_register(sim->dpll, pin->dpll_pin, pin->ops,
+					pin);
+		if (err)
+			goto err_unregister;
+		pin->registered = true;
+	}
+
+	return 0;
+
+err_unregister:
+	dpllsim_unregister_pins(sim);
+	return err;
+}
+
+/*
+ * Registration order matters: the device must be registered before pins
+ * so that pin registration events reach userspace with a valid device,
+ * while pin handles must be obtained up front so that a failure leaves
+ * nothing half-visible.
+ */
 int dpllsim_dev_deploy(struct dpllsim_dev *sim)
 {
 	struct dpll_device *dpll;
@@ -48,15 +298,27 @@ int dpllsim_dev_deploy(struct dpllsim_dev *sim)
 	if (IS_ERR(dpll))
 		return PTR_ERR(dpll);
 
-	/* From here on the configuration is frozen */
+	/* From here on the pin configuration is frozen */
 	mutex_lock(&sim->lock);
 	sim->dpll = dpll;
 	mutex_unlock(&sim->lock);
 
+	err = dpllsim_order_pins(sim);
+	if (err)
+		goto err_put_dpll;
+
+	err = dpllsim_get_pins(sim);
+	if (err)
+		goto err_free_pins;
+
 	err = dpll_device_register(sim->dpll, DPLL_TYPE_PPS,
 				   &dpllsim_dpll_ops, sim);
 	if (err)
-		goto err_put_dpll;
+		goto err_put_pins;
+
+	err = dpllsim_register_pins(sim);
+	if (err)
+		goto err_unregister_device;
 
 	mutex_lock(&sim->lock);
 	sim->registered = true;
@@ -64,6 +326,14 @@ int dpllsim_dev_deploy(struct dpllsim_dev *sim)
 
 	return 0;
 
+err_unregister_device:
+	dpll_device_unregister(sim->dpll, &dpllsim_dpll_ops, sim);
+err_put_pins:
+	dpllsim_put_pins(sim);
+err_free_pins:
+	kfree(sim->pins);
+	sim->pins = NULL;
+	sim->num_pins = 0;
 err_put_dpll:
 	dpll_device_put(sim->dpll, &sim->tracker);
 	mutex_lock(&sim->lock);
@@ -77,8 +347,14 @@ void dpllsim_dev_undeploy(struct dpllsim_dev *sim)
 	scoped_guard(mutex, &sim->lock)
 		sim->registered = false;
 
+	dpllsim_unregister_pins(sim);
 	dpll_device_unregister(sim->dpll, &dpllsim_dpll_ops, sim);
+	dpllsim_put_pins(sim);
 	dpll_device_put(sim->dpll, &sim->tracker);
 	scoped_guard(mutex, &sim->lock)
 		sim->dpll = NULL;
+
+	kfree(sim->pins);
+	sim->pins = NULL;
+	sim->num_pins = 0;
 }
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
index 5667f8827c98c1..73b846b66f79c7 100644
--- a/drivers/dpll/dpllsim/dpllsim.h
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -9,10 +9,39 @@
 
 #include <linux/configfs.h>
 #include <linux/dpll.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 
+#define DPLLSIM_MAX_PINS			128
+
+struct dpllsim_dev;
+
+struct dpllsim_pin {
+	struct config_item item;
+	struct list_head list;
+	struct dpllsim_dev *dev;
+
+	/* Configuration, writable only until dpllsim_dev_frozen() */
+	enum dpll_pin_type type;
+	enum dpll_pin_direction direction;
+	u64 frequency;
+
+	/* Resolved at live=1 */
+	int idx;
+	struct dpll_pin *dpll_pin;
+	const struct dpll_pin_ops *ops;
+	dpll_tracker tracker;
+	bool registered;
+
+	/* Simulated state, guarded by dev->lock */
+	enum dpll_pin_state state;
+};
+
 struct dpllsim_dev {
 	struct config_group group;
+	struct config_group pins_group;
+	/* Pin items, guarded by the configfs subsystem mutex */
+	struct list_head pin_list;
 
 	/*
 	 * Set from the start of a live transition until the device is
@@ -27,6 +56,9 @@ struct dpllsim_dev {
 	 * the live attribute reports, see dpllsim_dev_live().
 	 */
 	bool registered;
+	/* Pins in registration order, valid while @dpll is set */
+	struct dpllsim_pin **pins;
+	int num_pins;
 
 	/* Guarded by the subsystem mutex */
 	u64 clock_id;
-- 
2.56.0


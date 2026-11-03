Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698787;
	b=a1KRGdX+49u9P/A7n8VTyO+WMTZWnCJKlRm22Yjy30qCgnKFXrv0MqRFvw4cfgUdP5Sy
	 0LBChvv3wZKMVfAXb4wi8ja2NpPA9jMGBhWQJmDLRlsRX5YQbDgynIsfqPSZkfgoyCroc
	 zdV8kU8A4o5MePcxYEMe/hE3CLnWZcwrHdmcaOh23okx1IyBBridL37c87S010fF5EJQx
	 p1KzHya0UXY/pZMxqb0q2D0JlMxQ2jEDTLrSRvoeMvy5XMhEm9u5VLLi0542L35tTS0MB
	 cj36y7adzN0RZC/rbaFfj7uao4roTgd2RBI8vjc07UkSaFyNp+w6cL1ArfXRvFWdX0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698787;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=eOsKCbPhCyEpCJ6tLgX5nurmGls0+kL+9dos5tpQ6Vc=;
	b=4Kk5dOk6l+t6+o5upSAvvHCkmoxSJvOH5VF5Z8lFadObfjKHHRESljO0zlaIgRjL08t2
	 vlWE7Q+ZX8ihAdmIjg82ZNgp0g0rxiXxM66XMK7Me3CWBbsYk3hpIrzm/ld5rAIxGy47L
	 APUOjBfxIH6twaafziQHSAQDgMDguLHPFrWCnRDxbGprSsdZiIv+bXzNQ+ih1vp0XO5eM
	 ZQBAgFsuZUjHzUE2GhV7/HwOIFxPA2xGYLZ+7ZJaQTyi77b2cXjknQp8qqKAp10A7NJy3
	 y2gqsiFWSXnwMB5EQIqi69KsJU8HA/3pDZk1S5Fn2xjesf+6zkZDlSaZJTh4mqXGDEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AlFYkHLf;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733DD606D80F
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 09:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733DD606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AlFYkHLf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793698784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eOsKCbPhCyEpCJ6tLgX5nurmGls0+kL+9dos5tpQ6Vc=;
	b=AlFYkHLfK1Py4qaKQbvg7U6YiDucxmk8pKpnFVHvQ4htpR99D4A9RV7jMSFOutIo7XstBV
	rWjhuPWfa9zCN5WUXkA3+c875wvPbngtouriK5a3956GY6QuqyHVEAiOoYxqSrgFAXb7fP
	HzpZkW6jgGHTAWmTdy2q9baAE/4v3JE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-457--NKfPrmhOge9f6qrFb8akQ-1; Tue,
 03 Nov 2026 04:39:41 -0500
X-MC-Unique: -NKfPrmhOge9f6qrFb8akQ-1
X-Mimecast-MFC-AGG-ID: -NKfPrmhOge9f6qrFb8akQ_1793698779
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C70E195399E;
	Tue,  3 Nov 2026 09:39:38 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.32.42])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 247607E9;
	Tue,  3 Nov 2026 09:39:33 +0000 (UTC)
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
Subject: [PATCH net-next 01/14] dpll: dpllsim: Add simulated DPLL device driver
Date: Tue,  3 Nov 2026 10:38:57 +0100
Message-ID: <20261103093910.596225-2-poros@redhat.com>
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

Add dpllsim, a driver providing simulated DPLL devices for testing the
DPLL subsystem and its userspace tooling without real hardware, in the
same spirit as netdevsim for network devices. The DPLL core identifies
a device by clock ID, index and module only, so the driver needs no bus
and no struct device at all.

Instances are created and configured at runtime through configfs,
following the gpio-sim precedent for objects that userspace creates on
demand. Creating a directory under /sys/kernel/config/dpllsim/ allocates
an instance, its clock_id attribute selects the clock ID, writing 1 to
live registers the DPLL device with the core and writing 0 unregisters
it again. Removing the directory tears a live instance down implicitly.
Keeping registration separate from creation lets a test register and
unregister the same device repeatedly, which is where the core bugs the
driver is meant to catch tend to live, and it allows the structural
attributes to be refused with EBUSY while the device is visible to
userspace. Unlike sysfs, configfs does not imply a stable ABI, which
suits a driver whose knobs exist only to drive tests.

Reading live reports whether the device is registered with the DPLL
subsystem, it turns 1 only once the whole live transition succeeded and
0 again as the first step of the teardown. The configuration is frozen
earlier, from the moment the transition obtains the device handle, so
that a configuration write racing with the transition is refused rather
than lost.

The device registers as a PPS type DPLL with the two mandatory callbacks
only. mode_get reports automatic mode and lock_status_get reports
unlocked with no error. Pins come with the following patches and the
simulation of lock acquisition with a later series.

Document the configfs layout under Documentation/driver-api and add a
MAINTAINERS entry.

Signed-off-by: Petr Oros <poros@redhat.com>
---
 Documentation/driver-api/dpllsim.rst |  41 +++++
 Documentation/driver-api/index.rst   |   1 +
 MAINTAINERS                          |   7 +
 drivers/dpll/Kconfig                 |   1 +
 drivers/dpll/Makefile                |   1 +
 drivers/dpll/dpllsim/Kconfig         |  16 ++
 drivers/dpll/dpllsim/Makefile        |   4 +
 drivers/dpll/dpllsim/core.c          | 221 +++++++++++++++++++++++++++
 drivers/dpll/dpllsim/dpll.c          |  84 ++++++++++
 drivers/dpll/dpllsim/dpllsim.h       |  58 +++++++
 10 files changed, 434 insertions(+)
 create mode 100644 Documentation/driver-api/dpllsim.rst
 create mode 100644 drivers/dpll/dpllsim/Kconfig
 create mode 100644 drivers/dpll/dpllsim/Makefile
 create mode 100644 drivers/dpll/dpllsim/core.c
 create mode 100644 drivers/dpll/dpllsim/dpll.c
 create mode 100644 drivers/dpll/dpllsim/dpllsim.h

diff --git a/Documentation/driver-api/dpllsim.rst b/Documentation/driver-api/dpllsim.rst
new file mode 100644
index 00000000000000..86a5d523534055
--- /dev/null
+++ b/Documentation/driver-api/dpllsim.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+DPLL simulator (dpllsim)
+==========================
+
+The dpllsim driver provides simulated DPLL devices for testing the DPLL
+subsystem and its userspace tooling without real hardware, similar to
+what netdevsim provides for network devices.
+
+Configuration interface
+=======================
+
+Devices are described in configfs under ``/sys/kernel/config/dpllsim/``.
+A directory created there is a device instance. Attributes are written
+while the instance is not live, then ``live`` is set to 1 to register
+the device with the DPLL subsystem. Writing 0 unregisters it again.
+Structural attributes return ``EBUSY`` while the instance is live.
+
+Device directory ``/sys/kernel/config/dpllsim/<dev>/``:
+
+=======================  =====================================================
+``clock_id``             Clock ID of the DPLL device, must be nonzero and
+                         unique among live instances
+``live``                 1 registers the device, 0 unregisters it
+=======================  =====================================================
+
+Example
+=======
+
+Create a device and make it live::
+
+    cd /sys/kernel/config/dpllsim
+    mkdir dev0 && cd dev0
+    echo 100 > clock_id
+    echo 1 > live
+
+    dpll device show
+
+To remove the device, write 0 to ``live`` and remove the device
+directory.
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index aaf5d76ed074ed..e2271889e33400 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -87,6 +87,7 @@ Subsystem-specific APIs
    crypto/index
    dmaengine/index
    dpll
+   dpllsim
    edac
    extcon
    firmware/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 09713dc4c6a77d..147a5466902bc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8070,6 +8070,13 @@ F:	Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-drive
 F:	drivers/net/ethernet/freescale/dpaa2/dpaa2-switch*
 F:	drivers/net/ethernet/freescale/dpaa2/dpsw*
 
+DPLL SIMULATOR DRIVER (dpllsim)
+M:	Petr Oros <poros@redhat.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/driver-api/dpllsim.rst
+F:	drivers/dpll/dpllsim/
+
 DPLL SUBSYSTEM
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 M:	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
diff --git a/drivers/dpll/Kconfig b/drivers/dpll/Kconfig
index be98969f040ab6..c6bd5392ce8753 100644
--- a/drivers/dpll/Kconfig
+++ b/drivers/dpll/Kconfig
@@ -24,5 +24,6 @@ config DPLL_REFCNT_TRACKER
 	  If unsure, say N.
 
 source "drivers/dpll/zl3073x/Kconfig"
+source "drivers/dpll/dpllsim/Kconfig"
 
 endmenu
diff --git a/drivers/dpll/Makefile b/drivers/dpll/Makefile
index 9e7a3a3e592e81..1ee1daa3a46cc7 100644
--- a/drivers/dpll/Makefile
+++ b/drivers/dpll/Makefile
@@ -9,3 +9,4 @@ dpll-y                  += dpll_netlink.o
 dpll-y                  += dpll_nl.o
 
 obj-$(CONFIG_ZL3073X)	+= zl3073x/
+obj-$(CONFIG_DPLLSIM)	+= dpllsim/
diff --git a/drivers/dpll/dpllsim/Kconfig b/drivers/dpll/dpllsim/Kconfig
new file mode 100644
index 00000000000000..45ed93ba3dee5a
--- /dev/null
+++ b/drivers/dpll/dpllsim/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DPLLSIM
+	tristate "DPLL simulator driver"
+	depends on NET
+	select DPLL
+	select CONFIGFS_FS
+	help
+	  This driver provides simulated DPLL devices for testing and
+	  development of the DPLL subsystem and its userspace tooling
+	  without real hardware. Devices with arbitrary pin topologies
+	  are created and configured at runtime through configfs,
+	  similar to what gpio-sim provides for GPIO.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called dpllsim.
diff --git a/drivers/dpll/dpllsim/Makefile b/drivers/dpll/dpllsim/Makefile
new file mode 100644
index 00000000000000..905df2ee00874f
--- /dev/null
+++ b/drivers/dpll/dpllsim/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DPLLSIM) += dpllsim.o
+dpllsim-y := core.o dpll.o
diff --git a/drivers/dpll/dpllsim/core.c b/drivers/dpll/dpllsim/core.c
new file mode 100644
index 00000000000000..0772f409d013b7
--- /dev/null
+++ b/drivers/dpll/dpllsim/core.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DPLL simulator - configfs control plane
+ * Copyright (c) 2026 Red Hat, Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cleanup.h>
+#include <linux/configfs.h>
+#include <linux/kstrtox.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#include "dpllsim.h"
+
+static struct configfs_subsystem dpllsim_subsys;
+
+static struct dpllsim_dev *to_dpllsim_dev(struct config_item *item)
+{
+	return container_of(to_config_group(item), struct dpllsim_dev, group);
+}
+
+/* The clock id is checked at live=1, so both share the subsystem mutex */
+static ssize_t dpllsim_dev_clock_id_show(struct config_item *item, char *page)
+{
+	struct dpllsim_dev *sim = to_dpllsim_dev(item);
+
+	guard(mutex)(&dpllsim_subsys.su_mutex);
+	return sysfs_emit(page, "%llu\n", sim->clock_id);
+}
+
+static ssize_t dpllsim_dev_clock_id_store(struct config_item *item,
+					  const char *page, size_t count)
+{
+	struct dpllsim_dev *sim = to_dpllsim_dev(item);
+	u64 val;
+	int err;
+
+	err = kstrtou64(page, 10, &val);
+	if (err)
+		return err;
+
+	guard(mutex)(&dpllsim_subsys.su_mutex);
+	if (dpllsim_dev_frozen(sim))
+		return -EBUSY;
+	sim->clock_id = val;
+	return count;
+}
+CONFIGFS_ATTR(dpllsim_dev_, clock_id);
+
+static ssize_t dpllsim_dev_live_show(struct config_item *item, char *page)
+{
+	struct dpllsim_dev *sim = to_dpllsim_dev(item);
+
+	guard(mutex)(&sim->lock);
+	return sysfs_emit(page, "%d\n", dpllsim_dev_live(sim));
+}
+
+/*
+ * Two live instances must not share a clock id, dpll_device_get() would
+ * hand out the same dpll_device to both of them instead of registering
+ * a new one.
+ */
+static bool dpllsim_clock_id_in_use(struct dpllsim_dev *sim)
+{
+	struct config_item *item;
+
+	lockdep_assert_held(&dpllsim_subsys.su_mutex);
+
+	list_for_each_entry(item, &dpllsim_subsys.su_group.cg_children,
+			    ci_entry) {
+		struct dpllsim_dev *other = to_dpllsim_dev(item);
+
+		if (other != sim && dpllsim_dev_live(other) &&
+		    other->clock_id == sim->clock_id)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * The subsystem mutex excludes the live transitions of the other
+ * instances for the whole deploy sequence.
+ */
+static ssize_t dpllsim_dev_live_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct dpllsim_dev *sim = to_dpllsim_dev(item);
+	bool live;
+	int err;
+
+	err = kstrtobool(page, &live);
+	if (err)
+		return err;
+
+	guard(mutex)(&dpllsim_subsys.su_mutex);
+
+	if (live == dpllsim_dev_live(sim))
+		return count;
+
+	if (!live) {
+		dpllsim_dev_undeploy(sim);
+		return count;
+	}
+
+	if (!sim->clock_id)
+		return -EINVAL;
+	if (dpllsim_clock_id_in_use(sim))
+		return -EEXIST;
+
+	err = dpllsim_dev_deploy(sim);
+	if (err)
+		return err;
+
+	return count;
+}
+CONFIGFS_ATTR(dpllsim_dev_, live);
+
+static struct configfs_attribute *dpllsim_dev_attrs[] = {
+	&dpllsim_dev_attr_clock_id,
+	&dpllsim_dev_attr_live,
+	NULL,
+};
+
+static void dpllsim_dev_release(struct config_item *item)
+{
+	struct dpllsim_dev *sim = to_dpllsim_dev(item);
+
+	mutex_destroy(&sim->lock);
+	kfree(sim);
+}
+
+static const struct configfs_item_operations dpllsim_dev_item_ops = {
+	.release	= dpllsim_dev_release,
+};
+
+static const struct config_item_type dpllsim_dev_type = {
+	.ct_item_ops	= &dpllsim_dev_item_ops,
+	.ct_attrs	= dpllsim_dev_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *dpllsim_make_group(struct config_group *group,
+					       const char *name)
+{
+	struct dpllsim_dev *sim;
+
+	sim = kzalloc_obj(*sim);
+	if (!sim)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&sim->lock);
+	sim->mode = DPLL_MODE_AUTOMATIC;
+	sim->lock_status = DPLL_LOCK_STATUS_UNLOCKED;
+	sim->lock_status_error = DPLL_LOCK_STATUS_ERROR_NONE;
+
+	config_group_init_type_name(&sim->group, name, &dpllsim_dev_type);
+
+	return &sim->group;
+}
+
+/* Runs under the subsystem mutex, unlike release */
+static void dpllsim_drop_item(struct config_group *group,
+			      struct config_item *item)
+{
+	struct dpllsim_dev *sim = to_dpllsim_dev(item);
+
+	if (dpllsim_dev_live(sim))
+		dpllsim_dev_undeploy(sim);
+	config_item_put(item);
+}
+
+static const struct configfs_group_operations dpllsim_group_ops = {
+	.make_group	= dpllsim_make_group,
+	.drop_item	= dpllsim_drop_item,
+};
+
+static const struct config_item_type dpllsim_type = {
+	.ct_group_ops	= &dpllsim_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem dpllsim_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= "dpllsim",
+			.ci_type	= &dpllsim_type,
+		},
+	},
+};
+
+static int __init dpllsim_init(void)
+{
+	int err;
+
+	config_group_init(&dpllsim_subsys.su_group);
+	mutex_init(&dpllsim_subsys.su_mutex);
+	err = configfs_register_subsystem(&dpllsim_subsys);
+	if (err) {
+		pr_err("failed to register the configfs subsystem: %d\n", err);
+		mutex_destroy(&dpllsim_subsys.su_mutex);
+	}
+
+	return err;
+}
+module_init(dpllsim_init);
+
+static void __exit dpllsim_exit(void)
+{
+	configfs_unregister_subsystem(&dpllsim_subsys);
+	mutex_destroy(&dpllsim_subsys.su_mutex);
+}
+module_exit(dpllsim_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Simulated DPLL device driver");
+MODULE_AUTHOR("Petr Oros <poros@redhat.com>");
diff --git a/drivers/dpll/dpllsim/dpll.c b/drivers/dpll/dpllsim/dpll.c
new file mode 100644
index 00000000000000..ae2c8fcf238c68
--- /dev/null
+++ b/drivers/dpll/dpllsim/dpll.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DPLL simulator - DPLL subsystem interface
+ * Copyright (c) 2026 Red Hat, Inc.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/dpll.h>
+#include <linux/module.h>
+
+#include "dpllsim.h"
+
+static int dpllsim_mode_get(const struct dpll_device *dpll, void *priv,
+			    enum dpll_mode *mode,
+			    struct netlink_ext_ack *extack)
+{
+	struct dpllsim_dev *sim = priv;
+
+	guard(mutex)(&sim->lock);
+	*mode = sim->mode;
+	return 0;
+}
+
+static int dpllsim_lock_status_get(const struct dpll_device *dpll, void *priv,
+				   enum dpll_lock_status *status,
+				   enum dpll_lock_status_error *status_error,
+				   struct netlink_ext_ack *extack)
+{
+	struct dpllsim_dev *sim = priv;
+
+	guard(mutex)(&sim->lock);
+	*status = sim->lock_status;
+	*status_error = sim->lock_status_error;
+	return 0;
+}
+
+static const struct dpll_device_ops dpllsim_dpll_ops = {
+	.mode_get = dpllsim_mode_get,
+	.lock_status_get = dpllsim_lock_status_get,
+};
+
+int dpllsim_dev_deploy(struct dpllsim_dev *sim)
+{
+	struct dpll_device *dpll;
+	int err;
+
+	dpll = dpll_device_get(sim->clock_id, 0, THIS_MODULE, &sim->tracker);
+	if (IS_ERR(dpll))
+		return PTR_ERR(dpll);
+
+	/* From here on the configuration is frozen */
+	mutex_lock(&sim->lock);
+	sim->dpll = dpll;
+	mutex_unlock(&sim->lock);
+
+	err = dpll_device_register(sim->dpll, DPLL_TYPE_PPS,
+				   &dpllsim_dpll_ops, sim);
+	if (err)
+		goto err_put_dpll;
+
+	mutex_lock(&sim->lock);
+	sim->registered = true;
+	mutex_unlock(&sim->lock);
+
+	return 0;
+
+err_put_dpll:
+	dpll_device_put(sim->dpll, &sim->tracker);
+	mutex_lock(&sim->lock);
+	sim->dpll = NULL;
+	mutex_unlock(&sim->lock);
+	return err;
+}
+
+void dpllsim_dev_undeploy(struct dpllsim_dev *sim)
+{
+	scoped_guard(mutex, &sim->lock)
+		sim->registered = false;
+
+	dpll_device_unregister(sim->dpll, &dpllsim_dpll_ops, sim);
+	dpll_device_put(sim->dpll, &sim->tracker);
+	scoped_guard(mutex, &sim->lock)
+		sim->dpll = NULL;
+}
diff --git a/drivers/dpll/dpllsim/dpllsim.h b/drivers/dpll/dpllsim/dpllsim.h
new file mode 100644
index 00000000000000..5667f8827c98c1
--- /dev/null
+++ b/drivers/dpll/dpllsim/dpllsim.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * DPLL simulator - internal header
+ * Copyright (c) 2026 Red Hat, Inc.
+ */
+
+#ifndef _DPLLSIM_H
+#define _DPLLSIM_H
+
+#include <linux/configfs.h>
+#include <linux/dpll.h>
+#include <linux/mutex.h>
+
+struct dpllsim_dev {
+	struct config_group group;
+
+	/*
+	 * Set from the start of a live transition until the device is
+	 * undeployed, written under both the subsystem mutex and @lock.
+	 * Freezes the configuration, see dpllsim_dev_frozen().
+	 */
+	struct dpll_device *dpll;
+	dpll_tracker tracker;
+	/*
+	 * True while the device is registered with the DPLL subsystem,
+	 * written under both the subsystem mutex and @lock. This is what
+	 * the live attribute reports, see dpllsim_dev_live().
+	 */
+	bool registered;
+
+	/* Guarded by the subsystem mutex */
+	u64 clock_id;
+
+	/* Simulated state, guarded by @lock */
+	enum dpll_mode mode;
+	enum dpll_lock_status lock_status;
+	enum dpll_lock_status_error lock_status_error;
+
+	/* Protects the simulated state */
+	struct mutex lock;
+};
+
+/* Configuration changes are refused from the start of a live transition */
+static inline bool dpllsim_dev_frozen(const struct dpllsim_dev *sim)
+{
+	return !!sim->dpll;
+}
+
+/* Live means registered with the DPLL subsystem */
+static inline bool dpllsim_dev_live(const struct dpllsim_dev *sim)
+{
+	return sim->registered;
+}
+
+int dpllsim_dev_deploy(struct dpllsim_dev *sim);
+void dpllsim_dev_undeploy(struct dpllsim_dev *sim);
+
+#endif /* _DPLLSIM_H */
-- 
2.56.0


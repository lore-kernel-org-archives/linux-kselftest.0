From: brendanhiggins@google.com (Brendan Higgins)
Date: Tue, 16 Oct 2018 16:51:14 -0700
Subject: [RFC v1 25/31] kunit: added concept of platform mocking
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <20181016235120.138227-26-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181016235114.z2TnjMT5cD6ltZPJWJDsU_JlH_HTFQeb2Kn94DBBDCg@z>

Platform mocking is the mocking of all platform specific functions that
interact directly with hardware. In effect, this provides the ability to
mock any hardware behavior.

Signed-off-by: Brendan Higgins <brendanhiggins at google.com>
---
 drivers/base/Makefile                |  1 +
 drivers/base/platform-mock.c         | 65 ++++++++++++++++++++++++++++
 include/linux/platform_device_mock.h | 64 +++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/base/platform-mock.c
 create mode 100644 include/linux/platform_device_mock.h

diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 704f442958103..77cc599daa020 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL) += pinctrl.o
 obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
 obj-$(CONFIG_GENERIC_MSI_IRQ_DOMAIN) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
+obj-$(CONFIG_PLATFORM_MOCK) += platform-mock.o
 
 obj-y			+= test/
 
diff --git a/drivers/base/platform-mock.c b/drivers/base/platform-mock.c
new file mode 100644
index 0000000000000..3df9f1b0bb50f
--- /dev/null
+++ b/drivers/base/platform-mock.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Fake platform device API for unit testing platform drivers.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#include <linux/platform_device_mock.h>
+#include <linux/of_platform.h>
+
+struct device_node *of_fake_node(struct test *test, const char *name)
+{
+	struct device_node *node;
+
+	node = test_kzalloc(test, sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return NULL;
+
+	of_node_init(node);
+
+	return node;
+}
+
+struct platform_device *
+of_fake_probe_platform(struct test *test,
+		       const struct platform_driver *driver,
+		       const char *node_name)
+{
+	struct platform_device *pdev;
+	struct device_node *of_node;
+	int ret;
+
+	of_node = of_fake_node(test, node_name);
+	if (!of_node)
+		return ERR_PTR(-ENOMEM);
+
+	test_info(test, "Creating device");
+	pdev = of_platform_device_create(of_node, node_name, NULL);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	test_info(test, "Probing");
+	ret = driver->probe(pdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pdev;
+}
+
+struct platform_device *of_fake_probe_platform_by_name(struct test *test,
+						       const char *driver_name,
+						       const char *node_name)
+{
+	const struct device_driver *driver;
+
+	test_info(test, "Locating driver by name");
+	driver = driver_find(driver_name, &platform_bus_type);
+	if (!driver)
+		return ERR_PTR(-ENODEV);
+
+	return of_fake_probe_platform(test,
+				      to_platform_driver(driver),
+				      node_name);
+}
diff --git a/include/linux/platform_device_mock.h b/include/linux/platform_device_mock.h
new file mode 100644
index 0000000000000..898539d166f66
--- /dev/null
+++ b/include/linux/platform_device_mock.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Fake platform device API for unit testing platform drivers.
+ *
+ * Copyright (C) 2018, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins at google.com>
+ */
+
+#include <linux/platform_device.h>
+#include <kunit/mock.h>
+
+static inline struct platform_driver *platform_driver_find(const char *name)
+{
+	struct device_driver *driver;
+
+	driver = driver_find(name, &platform_bus_type);
+	if (!driver)
+		return NULL;
+
+	return to_platform_driver(driver);
+}
+
+/**
+ * of_fake_node()
+ * @test: the test to associate node with
+ * @name: name of the node
+ *
+ * The &struct device_node returned is allocated as a root node with the given
+ * name and otherwise behaves as a real &struct device_node.
+ *
+ * Returns: the faked &struct device_node
+ */
+struct device_node *of_fake_node(struct test *test, const char *name);
+
+/**
+ * of_fake_probe_platform()
+ * @test: the test to associate the fake platform device with
+ * @driver: driver to probe
+ * @node_name: name of the device node created
+ *
+ * Creates a &struct platform_device and an associated &struct device_node,
+ * probes the provided &struct platform_driver with the &struct platform_device.
+ *
+ * Returns: the &struct platform_device that was created
+ */
+struct platform_device *
+of_fake_probe_platform(struct test *test,
+		       const struct platform_driver *driver,
+		       const char *node_name);
+
+/**
+ * of_fake_probe_platform_by_name()
+ * @test: the test to associate the fake platform device with
+ * @driver_name: name of the driver to probe
+ * @node_name: name of the device node created
+ *
+ * Same as of_fake_probe_platform() but looks up the &struct platform_driver by
+ * the provided name.
+ *
+ * Returns: the &struct platform_device that was created
+ */
+struct platform_device *of_fake_probe_platform_by_name(struct test *test,
+						       const char *driver_name,
+						       const char *node_name);
-- 
2.19.1.331.ge82ca0e54c-goog

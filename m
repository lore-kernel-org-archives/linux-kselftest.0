Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813248;
	b=NiKIcPHoz+J+cGvARCh9YjQzILq00JCp3tSMYrmNBjH7UGfxLXuRo1cXMIX9wFc+9moo
	 gFuIYTLAC+i6zQFniBU3O45SNb0AuMn6NssCP/T8xT5b/2arbOZT2ypfzD6Ri5udTZNY5
	 2f355rR055ScMDUh21S9c6YC2PGq5Rwrkd6MvrWVGPPWWjST6DoaOTLfsysLkyguPqKdr
	 3Iv6b8unllZ4vGOznjcgBeIZ3pLrUQLTBxMvS6qAnQNaHZWuO4qE3iiDJ0YWur84/Acry
	 dovB+AuLh1mpZcv9+8qDYfGBg0TqsExOjNv8rqmEj/DeKhGm6mVoOIHYxNZufRLvZlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BuQq4JFvVTaug2dVoyrAXV50xaKQGTRvxFBICoP+1lY=;
	b=pSBAekuyKnpEMuOP8e+jLAsYuoe5S+3+ljG3Hb9n6vae4BLyfNej8wDxieA5ElbGcGpQ
	 tl30ydvWeIowEA/Nn7JqUxoauGiwITVRlxdI3KFoNmeZZBZcE2ktMtRNCsJSMqHspQCw1
	 xTno1r54Pc0YKvpRn+sLoOS9JRzBTFw7gLQ/wzFhfaD91YvHFNdN9QS7TTIi9PjRvPgRm
	 D7R7jBLDtJ67emEeWD/7DzVD9w0QqDs8ERZvpsGTo/L7ogEkdG0xZXgw5tfkyD3hue+1x
	 YbanJj/BJWQa8qdalGVZkdWOp9QWhUTZk6dx/Qu4m8vLqFKW/fmiadVG51QK0/hdpeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="H8/CqWCT";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77D1606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 07:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D77D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H8/CqWCT
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37f14feca60so926369eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 23:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794813247; x=1795418047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuQq4JFvVTaug2dVoyrAXV50xaKQGTRvxFBICoP+1lY=;
        b=H8/CqWCTBX3T0VcGJ2jrluTGPGUVgzz1JASg41S5R1Qdg4jnN5GpKV3Afo9WM8mSfv
         o0s3h6K93MKvcwSLfck/sep5GjJZRQBMA+CRc8CY06xzx768Bz/UNiKpgCXiar8kru0C
         WLfuOFU8oPu1J67damPggINww+tLFZ8Bj7asCjIdjjlJ+4WHyPbnuy6GadwTQU+mL9s7
         G9ALolM4oBkfoukg3yz71D/ukO30O1hqlkzy7QKpkBXINwuxkaUZHw2LPj/DFrrWxWFm
         jilQt0O2BbGrGB6gViJQqJ7xIroCh0jeiAW99rxpU6OX9Pq6+FZf7mWsNE/QF8bgZEso
         KXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813247; x=1795418047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuQq4JFvVTaug2dVoyrAXV50xaKQGTRvxFBICoP+1lY=;
        b=PiRNNShix3qCgt5Ojp05yUShy1VoJUSAhux8nv6LF3RExRsdtVV1oeruuy62T2SpT3
         Z1H9x0bjL/MwQWxK60zUSmrvmMTiJcJKuVQigd6jwK5eexaSu9uORXnpsj3fZHFPAz2h
         Hk6dVkkGQyFhohYP74DBINUEsTuniHKvuV+idWxUrHGBoTBuIN0cq7g8tfa+BlKBBHec
         BAthrKb0uQqzOC+ELrEinUmv6lWWcT61JLaKa8sbXMNcbANSOsCUtdw3KpGEEip0C4vP
         CsrtwCpUUpZuBqmxpKQ1JNmaXhw+NwSRmmNq6hK9s1SerpCnlnK0Oyh7aTsdfStQCMUo
         L9iQ==
X-Forwarded-Encrypted: i=1; AL+hErEKYY/o9N1FLa9bs1HAf5QNCFjQW1XzLj2+ZTazNBz20PSDlpVL5cpn8bXDl2/OungpYC0NMc8PWenccYPBPGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mCuPCUfbbQ4bpeVSDADKVYJkIbgKPNCp/nOmCnASdJt20EO1/
	A7TnGKOXb43swpUiMhBpwEJdAf9tLnMBkgt4XNnbBt8bF20Jw26UJap2ufHRpZ4w1o0=
X-Gm-Gg: AYBFou05WmOm/B89ID73638SNTRdcLNDt8jklGE6hMl+kish6ZGLWGarrOQtZzmgDzj
	PyvLM+0z6IEMWYHSlTXVXQrx2hDant3Y1/K4hsK1AtoM+qQu5ilnxTYjz0nLAXrNXGIf8/XWRza
	aiUN/PEWNE4j4k9V+hS5eb2xtPKTrW2kq275WT4Rs0oftOxgoS0BrNR+santkX7Mxv5vb1H0Gj1
	NxbHK9PgX1xg8A6iu5WD3EqZv9tKjRZi/l87NU6wBPQ7vu+lEO5MKgmHsIbQ0r+UW75l4xVzLqQ
	fCDDd031GMYY8KyAMRe9DJyUryVPgdaZUBlW4gMaZLZOGnl6E2GpwYbvar013Q16gUW9u2W6z/s
	hrsm5ZJbzwHraVYdLlQqmQh92flpbU10K6gKRuEVneQn8j3pt5iP5c4xGBmZNqO6H3sVL2WIt3X
	+B6e4KkRP/pQMRQ8EopGjCXHI/wMnw2BVTttXawSvxD3Z3Se/KZg1QJsJSjj9n6YNkKWxqCaqlE
	/odpzry+E4s4TKBVRFdc2BxqV0ZlUEpc11eTGkm2rZ6kJKZxoa2ImLNnOZVje89yuL7XZvvqNar
	HjVu7GxeY75veVUgOuGrivcqw+nnJA2L5ylVAtlMdWhH3cargYTmzIoVrPuuFnXwgrWtDIqcgSt
	RW/jucIY=
X-Received: by 2002:a05:7301:c017:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37967dd4caamr9968595eec.38.1794813246758;
        Sun, 15 Nov 2026 23:14:06 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm47858505eec.8.2026.11.15.23.13.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 23:14:06 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: fustini@kernel.org,
	jgg@ziepe.ca,
	james.morse@arm.com,
	ben.horgan@arm.com,
	xiaqinxin@huawei.com,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	babu.moger@amd.com,
	kevin.tian@intel.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	randy.dunlap@infradead.org,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH v2 1/4] resctrl: Add registered device assignment
Date: Mon, 16 Nov 2026 15:13:40 +0800
Message-ID: <20261116071338.35991-7-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
References: <20261116071338.35991-6-zhangzhanpeng.jasper@bytedance.com>
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

Keep requester discovery and hardware programming in providers. Common
resctrl owns a bus/name registry and resource-group membership, with one
sleepable set_ids callback per provider. Keep filesystem integration small
and separate from the registry implementation.

Snapshot runtime availability at mount, serialize assignment with
unregister, reject removal of assigned groups, and quarantine ID reuse
after an uncertain hardware update. Recovery and dynamic creation of the
first devices file are intentionally outside this RFC.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 fs/resctrl/Makefile            |   2 +-
 fs/resctrl/devices.c           | 233 +++++++++++++++++++++++++++++++++
 fs/resctrl/internal.h          |   8 ++
 fs/resctrl/rdtgroup.c          |  28 ++++
 include/linux/resctrl_device.h |  53 ++++++++
 5 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 fs/resctrl/devices.c
 create mode 100644 include/linux/resctrl_device.h

diff --git a/fs/resctrl/Makefile b/fs/resctrl/Makefile
index e67f34d2236a..1cd663c3309a 100644
--- a/fs/resctrl/Makefile
+++ b/fs/resctrl/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RESCTRL_FS)		+= rdtgroup.o ctrlmondata.o monitor.o
+obj-$(CONFIG_RESCTRL_FS)		+= rdtgroup.o ctrlmondata.o monitor.o devices.o
 obj-$(CONFIG_RESCTRL_FS_PSEUDO_LOCK)	+= pseudo_lock.o
 
 # To allow define_trace.h's recursive include:
diff --git a/fs/resctrl/devices.c b/fs/resctrl/devices.c
new file mode 100644
index 000000000000..f98d375e6934
--- /dev/null
+++ b/fs/resctrl/devices.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Registered, independently tagged devices assigned to resctrl groups. */
+#include <linux/capability.h>
+#include <linux/device.h>
+#include <linux/resctrl_device.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+/* All registry, ownership and callback access is under rdtgroup_mutex. */
+struct resctrl_device {
+	struct list_head list;
+	struct device *dev;
+	const struct resctrl_device_ops *ops;
+	struct rdtgroup *group; /* NULL denotes the default group. */
+	char *token; /* Stable bus/name identity; not a sysfs pathname. */
+};
+
+static LIST_HEAD(resctrl_devices);
+/* No recovery protocol yet: never recycle IDs after an uncertain update. */
+static bool devices_quarantined;
+/* File visibility is a mount-time capability snapshot. */
+static bool devices_enabled;
+
+static struct resctrl_device *resctrl_device_find(struct device *dev)
+{
+	struct resctrl_device *entry;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+	list_for_each_entry(entry, &resctrl_devices, list)
+		if (entry->dev == dev)
+			return entry;
+	return NULL;
+}
+
+int resctrl_device_register(struct device *dev,
+			    const struct resctrl_device_ops *ops)
+{
+	struct resctrl_device *entry, *other;
+	int ret = 0;
+
+	if (!dev->bus || !ops || !ops->set_ids ||
+	    strpbrk(dev->bus->name, "/ \t\n\r\v\f,") ||
+	    strpbrk(dev_name(dev), "/ \t\n\r\v\f,"))
+		return -EINVAL;
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+	entry->token = kasprintf(GFP_KERNEL, "%s/%s", dev->bus->name,
+				 dev_name(dev));
+	if (!entry->token) {
+		kfree(entry);
+		return -ENOMEM;
+	}
+	entry->dev = get_device(dev);
+	entry->ops = ops;
+
+	mutex_lock(&rdtgroup_mutex);
+	list_for_each_entry(other, &resctrl_devices, list) {
+		if (other->dev == dev || !strcmp(other->token, entry->token)) {
+			ret = -EEXIST;
+			goto out;
+		}
+	}
+	list_add_tail(&entry->list, &resctrl_devices);
+out:
+	mutex_unlock(&rdtgroup_mutex);
+	if (ret) {
+		put_device(entry->dev);
+		kfree(entry->token);
+		kfree(entry);
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(resctrl_device_register);
+
+void resctrl_device_unregister(struct device *dev)
+{
+	struct resctrl_device *entry;
+
+	mutex_lock(&rdtgroup_mutex);
+	entry = resctrl_device_find(dev);
+	if (!entry)
+		goto out;
+
+	if (entry->ops->set_ids(dev, (struct resctrl_device_ids){})) {
+		devices_quarantined = true;
+		dev_err(dev, "resctrl: reset failed; ID reuse disabled\n");
+	}
+	list_del(&entry->list);
+	put_device(entry->dev);
+	kfree(entry->token);
+	kfree(entry);
+out:
+	mutex_unlock(&rdtgroup_mutex);
+}
+EXPORT_SYMBOL_GPL(resctrl_device_unregister);
+
+bool resctrl_devices_visible(void)
+{
+	lockdep_assert_held(&rdtgroup_mutex);
+	return devices_enabled;
+}
+
+int resctrl_devices_prepare_mount(void)
+{
+	lockdep_assert_held(&rdtgroup_mutex);
+	if (devices_quarantined)
+		return -EIO;
+	devices_enabled = !list_empty(&resctrl_devices);
+	return 0;
+}
+
+/* Must precede freeing any resource group or its IDs. */
+void resctrl_devices_unmount(void)
+{
+	struct resctrl_device *entry;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+	list_for_each_entry(entry, &resctrl_devices, list) {
+		if (entry->group &&
+		    entry->ops->set_ids(entry->dev,
+					(struct resctrl_device_ids){})) {
+			devices_quarantined = true;
+			dev_err(entry->dev, "resctrl: unmount reset failed\n");
+		}
+		entry->group = NULL;
+	}
+	devices_enabled = false;
+}
+
+/* Includes monitor children when the caller changes/removes a CTRL group. */
+int resctrl_devices_check_group(struct rdtgroup *group)
+{
+	struct resctrl_device *entry;
+
+	lockdep_assert_held(&rdtgroup_mutex);
+	if (devices_quarantined) {
+		rdt_last_cmd_puts("Device QoS state uncertain; reboot required\n");
+		return -EIO;
+	}
+	list_for_each_entry(entry, &resctrl_devices, list) {
+		if (entry->group == group ||
+		    (entry->group && entry->group->type == RDTMON_GROUP &&
+		     entry->group->mon.parent == group)) {
+			rdt_last_cmd_puts("Move assigned devices to the default group first\n");
+			return -EBUSY;
+		}
+	}
+	return 0;
+}
+
+int resctrl_devices_show(struct kernfs_open_file *of, struct seq_file *s,
+			 void *v)
+{
+	struct rdtgroup *group = rdtgroup_kn_lock_live(of->kn);
+	struct resctrl_device *entry;
+	int ret = 0;
+
+	if (!group) {
+		ret = -ENOENT;
+		goto out;
+	}
+	if (devices_quarantined) {
+		ret = -EIO;
+		goto out;
+	}
+	if (group == &rdtgroup_default)
+		group = NULL;
+	list_for_each_entry(entry, &resctrl_devices, list)
+		if (entry->group == group)
+			seq_printf(s, "%s\n", entry->token);
+out:
+	rdtgroup_kn_unlock(of->kn);
+	return ret;
+}
+
+ssize_t resctrl_devices_write(struct kernfs_open_file *of, char *buf,
+			      size_t nbytes, loff_t off)
+{
+	struct resctrl_device_ids ids;
+	struct resctrl_device *entry;
+	struct rdtgroup *group;
+	char *token;
+	int ret = -ENODEV;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+	group = rdtgroup_kn_lock_live(of->kn);
+	if (!group) {
+		ret = -ENOENT;
+		goto out;
+	}
+	if (off || memchr(buf, '\0', nbytes)) {
+		ret = -EINVAL;
+		goto out;
+	}
+	token = strim(buf);
+	if (devices_quarantined) {
+		ret = -EIO;
+		goto out;
+	}
+	if (group->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
+	    group->mode == RDT_MODE_PSEUDO_LOCKED ||
+	    (group->type == RDTMON_GROUP &&
+	     group->mon.parent->mode != RDT_MODE_SHAREABLE)) {
+		ret = -EBUSY;
+		goto out;
+	}
+	/* One registered identity per write, with no path or list parsing. */
+	if (!*token || strpbrk(token, " \t\n\r\v\f,")) {
+		ret = -EINVAL;
+		goto out;
+	}
+	ids.closid = group->closid;
+	ids.rmid = group->mon.rmid;
+	list_for_each_entry(entry, &resctrl_devices, list) {
+		if (strcmp(entry->token, token))
+			continue;
+		ret = entry->ops->set_ids(entry->dev, ids);
+		if (!ret)
+			entry->group = group == &rdtgroup_default ? NULL : group;
+		else if (ret == -EIO || ret == -ETIMEDOUT)
+			devices_quarantined = true;
+		break;
+	}
+out:
+	if (ret)
+		rdt_last_cmd_printf("Device assignment failed: %d\n", ret);
+	rdtgroup_kn_unlock(of->kn);
+	return ret ? ret : nbytes;
+}
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..4bebd998bdb7 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -335,6 +335,14 @@ __printf(1, 2)
 void rdt_last_cmd_printf(const char *fmt, ...);
 
 struct rdtgroup *rdtgroup_kn_lock_live(struct kernfs_node *kn);
+bool resctrl_devices_visible(void);
+int resctrl_devices_prepare_mount(void);
+void resctrl_devices_unmount(void);
+int resctrl_devices_check_group(struct rdtgroup *group);
+int resctrl_devices_show(struct kernfs_open_file *of, struct seq_file *s,
+			 void *v);
+ssize_t resctrl_devices_write(struct kernfs_open_file *of, char *buf,
+			      size_t nbytes, loff_t off);
 void rdtgroup_kn_unlock(struct kernfs_node *kn);
 bool info_kn_lock(struct kernfs_node *kn);
 void info_kn_unlock(struct kernfs_node *kn);
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..4d3417273934 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1560,6 +1560,9 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 		}
 		rdtgrp->mode = RDT_MODE_SHAREABLE;
 	} else if (!strcmp(buf, "exclusive")) {
+		ret = resctrl_devices_check_group(rdtgrp);
+		if (ret)
+			goto out;
 		if (!rdtgroup_mode_test_exclusive(rdtgrp)) {
 			ret = -EINVAL;
 			goto out;
@@ -1572,6 +1575,9 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 		rdtgrp->mode = RDT_MODE_EXCLUSIVE;
 	} else if (IS_ENABLED(CONFIG_RESCTRL_FS_PSEUDO_LOCK) &&
 		   !strcmp(buf, "pseudo-locksetup")) {
+		ret = resctrl_devices_check_group(rdtgrp);
+		if (ret)
+			goto out;
 		ret = rdtgroup_locksetup_enter(rdtgrp);
 		if (ret)
 			goto out;
@@ -2158,6 +2164,14 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_tasks_show,
 		.fflags		= RFTYPE_BASE,
 	},
+	{
+		.name		= "devices",
+		.mode		= 0600,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= resctrl_devices_write,
+		.seq_show	= resctrl_devices_show,
+		.fflags		= RFTYPE_BASE,
+	},
 	{
 		.name		= "mon_hw_id",
 		.mode		= 0444,
@@ -2225,6 +2239,8 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
 		fflags |= RFTYPE_DEBUG;
 
 	for (rft = rfts; rft < rfts + len; rft++) {
+		if (!strcmp(rft->name, "devices") && !resctrl_devices_visible())
+			continue;
 		if (rft->fflags && ((fflags & rft->fflags) == rft->fflags)) {
 			ret = rdtgroup_add_file(kn, rft);
 			if (ret)
@@ -3132,6 +3148,7 @@ static void resctrl_fs_teardown(void)
 	if (!rdtgroup_default.kn)
 		return;
 
+	resctrl_devices_unmount();
 	rmdir_all_sub();
 	rdtgroup_unassign_cntrs(&rdtgroup_default);
 	mon_put_kn_priv();
@@ -3192,6 +3209,9 @@ static int rdt_get_tree(struct fs_context *fc)
 		ret = -EBUSY;
 		goto out;
 	}
+	ret = resctrl_devices_prepare_mount();
+	if (ret)
+		goto out;
 
 	ret = setup_rmid_lru_list();
 	if (ret)
@@ -4278,6 +4298,9 @@ static int rdtgroup_rmdir(struct kernfs_node *kn)
 		goto out;
 	}
 	parent_kn = rdt_kn_parent(kn);
+	ret = resctrl_devices_check_group(rdtgrp);
+	if (ret)
+		goto out;
 
 	/*
 	 * If the rdtgroup is a ctrl_mon group and parent directory
@@ -4394,6 +4417,11 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		ret = -EPERM;
 		goto out;
 	}
+	if (rdtgrp->mon.parent != new_prdtgrp) {
+		ret = resctrl_devices_check_group(rdtgrp);
+		if (ret)
+			goto out;
+	}
 
 	/*
 	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
diff --git a/include/linux/resctrl_device.h b/include/linux/resctrl_device.h
new file mode 100644
index 000000000000..a39f674739d6
--- /dev/null
+++ b/include/linux/resctrl_device.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_RESCTRL_DEVICE_H
+#define _LINUX_RESCTRL_DEVICE_H
+
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/types.h>
+
+struct device;
+
+/* Resource-group IDs, interpreted by the architecture's request tagger. */
+struct resctrl_device_ids {
+	u32 closid;
+	u32 rmid;
+};
+
+/**
+ * struct resctrl_device_ops - program one independently tagged requester
+ * @set_ids: Complete the update before returning zero. Validation errors must
+ *	leave the old IDs intact. Return -EIO if hardware state is uncertain;
+ *	resctrl then prevents ID reuse. Called in sleepable context, serialized
+ *	with assignment and unregister. Must not call back into resctrl.
+ */
+struct resctrl_device_ops {
+	int (*set_ids)(struct device *dev, struct resctrl_device_ids ids);
+};
+
+#ifdef CONFIG_RESCTRL_FS
+/*
+ * Register only after hardware and driver-private state are ready. The bus and
+ * device names must remain stable until unregister. Initial IDs must be zero.
+ * The driver must own the tag fields exclusively, including across reattach.
+ */
+int resctrl_device_register(struct device *dev,
+			    const struct resctrl_device_ops *ops);
+
+/*
+ * Remove the requester and drain callbacks BEFORE freeing driver state.
+ * This also resets its IDs. A failed reset quarantines resctrl until reboot,
+ * rather than recycling IDs which the device might still be using.
+ */
+void resctrl_device_unregister(struct device *dev);
+#else
+static inline int
+resctrl_device_register(struct device *dev, const struct resctrl_device_ops *ops)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void resctrl_device_unregister(struct device *dev) { }
+#endif
+
+#endif
-- 
2.50.1 (Apple Git-155)


Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC40472769
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 13:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034471; cv=none; b=gDjYGMmtbu+GGYY1dzL+zs9C83mPpof1ZdzzATRmn5LEmD64G7Ucnur8v5SQgb5aUI6kF1uFrlkO6oUcZ8rvxPkyq2Svma2CcIzdOQrgTXLR8zZOs+VyYY1yO3rWwy+a8neSAFQS0LenPZWTEOZJlUaWcYKtiHbUBCqYViWn5EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034471; c=relaxed/simple;
	bh=lv5kWIUDJUDMWlaCosjBEeMFcK6y35rawRF3K3p6LiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EpmGfsMOAsVqU50pFVy1c/zbhrgSS7DyLSxrV17fcWK6yFoxIEWcpa6dqSDgWXdxcTkAjdKokoh8/tZTFzTsEWqypIMtmzguC0uMI5CgVT1rUJSY3ckRD1k4S8YUwZa70OxHBkixRloNITVTpJfnR03Ka2iFa40DWlzdOdUHj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=U45udnMq; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="U45udnMq"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7eb61bbeb25so536844a34.1
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 06:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784034467; x=1784639267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kK72RdH/1XE7usLQ2kyIcth7swn3eieDHyIRvr+BBH8=;
        b=U45udnMqaRZQYTEY2xcBi0M4W2vUhMTmAeF6XPlvn5POmzhX0S/qIAJm4JpRAYuGJZ
         Xza0KcZZb6L11iYH80cfE1EL61aN1GTIJzhJEUAlGvH7C9chaIMK7we+5yElY1Vw0S0A
         vNA60ayZANYgV7fOe4iCTfXrCL5tv3rGoOY2bLP/SoUVxoG8FT23+P8fTGmWBynlNFu9
         b9vn3gTaXL6VI+5i7PgEB01YjYPKqfZk2SvR90qNulndqSgPgKstfQAWMfNxGjTY+KjL
         abAYHjPeb+t/xwLkuijg5mk7LF93U41yrHlBsjdIfc+sjyZ07YJ+AH3EDPB1R6Oj/wIo
         m9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034467; x=1784639267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kK72RdH/1XE7usLQ2kyIcth7swn3eieDHyIRvr+BBH8=;
        b=jwKVcIBkmKLvYxwRC7m7lmjvvdWprA6mTwNDDKbcMmaXC9CLGq6kywyCC6e61ZTmzS
         Gviu39X9Q7NS3kzM6c8VA0WA1ypxNogZVp0lJzcc//PQ8DOPRPaldcfjmqlzzVq4Agzc
         3urD3DnXExhBB7zZu1KrehXSQz4gQ2cpfwoO0cgAtoj2oAdzV6jIEZTBT0uFX0G1yk3O
         2VuokwCzNCyPwhj78JVu8h/YYYRzkhNQFV8x9aoSy5zlOohZ9dhhqF1tlGmj60tVCHc8
         7G2z1S4nEgl4tRZ48tDMaiR5YlRn40ciOwuycG1mY5WP17R07VSyuvXMYOTEf7wil8+O
         M0/A==
X-Forwarded-Encrypted: i=1; AFNElJ815WEMIAQYEvQ0oZXY2jlYmdMeEu8GXyxJ2usNb9Zw+cHk47fAIAXUMWP4ksM7+HlnwUxlpd2nm30V62mQUHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2zT56IbkusRVWjJtig+dylgRR+4TIpCT0y8hibfeVrVd5ODx
	wxxxG2kSNM+n7EMtt0pEsj4+8Lk5WJrWAQrj2IQoSVLP/LupmTT798KPe8BOu8lZtfA=
X-Gm-Gg: AfdE7cnPyPcTkxTvOzUx64O4GEpHcyGGndV0imG3R/DiCmyOnwxwIWkH1md61pGEJCt
	LHrB/80CiVM06SCUWzs4o9pZFsn+uvMJ3hx0z9ogrp9QFEFC9KoyNZDFVpgDuB3DAwlqEo0R0kS
	4c48qRA9gJ1ZJ8muIbK6UlthjnhLvWE+Y9TALPHEnXr9YXDwOw6x9EXwYu4l9S9iFPK4icPKY0j
	Vs6czpY8samVg22KFg7MAG/ApKRnm3FpX6dLcvT8igOLHPFZWe0zIDRCDQf4N431TbHBx8h3hWC
	kAzEdze+F2vZxdEemgC7ZqH0w59fpmiAhsCKFWUr99u+AzsuERdnU6eMnOOuRJ6QSih0pJvvUQR
	1NwlHcEzkoOcjcypj2iHoF8Qaci4vqnBMnNYyGBTD29YkY1foYWWga2+An/PDVslbdvfYGwfBPu
	7XCW1K4vIB9f1cLLuGFmPPCpWC820JXu9AmISq4zZL5mPOxIzgFilpMdmiGrE6kg==
X-Received: by 2002:a05:6830:3492:b0:7e9:bd00:c6ad with SMTP id 46e09a7af769-7ec097e11c2mr8750217a34.16.1784034466935;
        Tue, 14 Jul 2026 06:07:46 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcab8efc3sm14657738a34.0.2026.07.14.06.07.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 06:07:46 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: joro@8bytes.org,
	palmer@dabbelt.com,
	tony.luck@intel.com,
	reinette.chatre@intel.com,
	tomasz.jeznach@linux.dev
Cc: will@kernel.org,
	robin.murphy@arm.com,
	fustini@kernel.org,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	corbet@lwn.net,
	shuah@kernel.org,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	cuiyunhui@bytedance.com,
	yuanzhu@bytedance.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [RFC PATCH 3/7] resctrl: Add a devices file for external requester assignment
Date: Tue, 14 Jul 2026 21:06:53 +0800
Message-ID: <20260714130657.46963-4-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not overload the resctrl tasks file with architecture-specific
non-PID tokens. The tasks ABI remains a list of task IDs, while the new
devices file carries external requesters assigned to a resctrl group.

Add architecture hooks for assigning and showing those external
objects, and reject group removal, reparenting, or pseudo-lock setup
while devices are still assigned. The teardown path performs a
best-effort reset to the default group.

The devices file is an assignment interface only. It does not describe
a new resource schema or domain; resource allocation and monitoring
policy remain described by the existing schemata and info files.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 Documentation/filesystems/resctrl.rst |  26 ++++
 arch/Kconfig                          |   6 +
 fs/resctrl/rdtgroup.c                 | 206 +++++++++++++++++++++++++-
 include/linux/resctrl.h               |  45 ++++++
 4 files changed, 280 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..fce61d019114 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -581,6 +581,32 @@ All groups contain the following files:
 	idle tasks. Instead, a CPU's idle task is always considered as a
 	member of the group owning the CPU.
 
+"devices":
+	On architectures that support external requester assignment through
+	resctrl, reading this file shows the devices or device groups assigned
+	to this resource group. Writing an architecture-specific device token
+	moves that external requester to the group. Multiple tokens can be
+	separated by commas and are processed sequentially. A failure aborts the
+	write, but requesters moved before the failure remain in their new groups.
+
+	On RISC-V, an IOMMU group is identified by the following token::
+
+		 iommu_group:<group-id>
+
+	Each assigned IOMMU group is reported on a separate line when the file is
+	read. Writing the token to the root control group's devices file restores
+	the IOMMU group to the reserved default QoS IDs. Default assignments are
+	not listed in the root devices file.
+
+	This file only controls external requester membership. Resource
+	allocation and monitoring policy remains described by schemata and
+	info files.
+
+	Resource groups with assigned devices cannot be removed or reparented.
+	Move devices to another group first.
+
+	Failures will be logged to /sys/fs/resctrl/info/last_cmd_status.
+
 "cpus":
 	Reading this file shows a bitmask of the logical CPUs owned by
 	this group. Writing a mask to this file will add and remove
diff --git a/arch/Kconfig b/arch/Kconfig
index fa7507ac8e13..36a4f4fbb164 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1615,6 +1615,12 @@ config ARCH_HAS_CPU_RESCTRL
 	  monitoring and control interfaces provided by the 'resctrl'
 	  filesystem (see RESCTRL_FS).
 
+config ARCH_HAS_RESCTRL_DEVICES
+	bool
+	help
+	  An architecture selects this option to indicate that external
+	  device objects can be attached to resctrl resource groups.
+
 config HAVE_ARCH_COMPILER_H
 	bool
 	help
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index af2cbab14497..2e424c911049 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -99,13 +99,32 @@ void rdt_last_cmd_puts(const char *s)
 	seq_buf_puts(&last_cmd_status, s);
 }
 
+void resctrl_last_cmd_puts(const char *s)
+{
+	rdt_last_cmd_puts(s);
+}
+
+static void rdt_last_cmd_vprintf(const char *fmt, va_list ap)
+{
+	lockdep_assert_held(&rdtgroup_mutex);
+	seq_buf_vprintf(&last_cmd_status, fmt, ap);
+}
+
 void rdt_last_cmd_printf(const char *fmt, ...)
 {
 	va_list ap;
 
 	va_start(ap, fmt);
-	lockdep_assert_held(&rdtgroup_mutex);
-	seq_buf_vprintf(&last_cmd_status, fmt, ap);
+	rdt_last_cmd_vprintf(fmt, ap);
+	va_end(ap);
+}
+
+void resctrl_last_cmd_printf(const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	rdt_last_cmd_vprintf(fmt, ap);
 	va_end(ap);
 }
 
@@ -766,6 +785,151 @@ static int rdtgroup_move_task(pid_t pid, struct rdtgroup *rdtgrp,
 	return ret;
 }
 
+static bool rdtgroup_effective_ids(struct rdtgroup *r,
+				   struct resctrl_group_ids *ids)
+{
+	if (!r || !ids)
+		return false;
+
+	if (r->type == RDTMON_GROUP)
+		ids->closid = r->mon.parent->closid;
+	else if (r->type == RDTCTRL_GROUP)
+		ids->closid = r->closid;
+	else
+		return false;
+
+	ids->rmid = r->mon.rmid;
+	return true;
+}
+
+#ifdef CONFIG_ARCH_HAS_RESCTRL_DEVICES
+static void show_rdt_devices(struct rdtgroup *r, struct seq_file *s)
+{
+	struct resctrl_group_ids ids;
+
+	if (rdtgroup_effective_ids(r, &ids))
+		resctrl_arch_devices_show(s, ids);
+}
+
+static int rdtgroup_reset_all_devices(struct rdtgroup *to)
+{
+	struct resctrl_group_ids default_ids;
+
+	if (!to || !rdtgroup_effective_ids(to, &default_ids))
+		return 0;
+
+	return resctrl_arch_devices_reset_all(default_ids);
+}
+
+static bool rdtgroup_arch_devices_assigned(struct rdtgroup *rdtgrp)
+{
+	struct resctrl_group_ids ids;
+
+	if (!rdtgroup_effective_ids(rdtgrp, &ids))
+		return false;
+
+	return resctrl_arch_devices_assigned(ids);
+}
+
+static bool rdtgroup_child_arch_devices_assigned(struct rdtgroup *rdtgrp)
+{
+	struct rdtgroup *crgrp;
+
+	list_for_each_entry(crgrp, &rdtgrp->mon.crdtgrp_list, mon.crdtgrp_list) {
+		if (rdtgroup_arch_devices_assigned(crgrp))
+			return true;
+	}
+
+	return false;
+}
+
+static int rdtgroup_reject_assigned_devices(struct rdtgroup *rdtgrp,
+					    bool include_children,
+					    const char *operation)
+{
+	if (!rdtgroup_arch_devices_assigned(rdtgrp) &&
+	    (!include_children || !rdtgroup_child_arch_devices_assigned(rdtgrp)))
+		return 0;
+
+	rdt_last_cmd_printf("Move devices out before %s group\n", operation);
+	return -EBUSY;
+}
+
+static ssize_t rdtgroup_devices_write(struct kernfs_open_file *of,
+				      char *buf, size_t nbytes, loff_t off)
+{
+	struct resctrl_group_ids ids;
+	struct rdtgroup *rdtgrp;
+	char *tok;
+	int ret = 0;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		rdtgroup_kn_unlock(of->kn);
+		return -ENOENT;
+	}
+	rdt_last_cmd_clear();
+
+	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
+	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
+		ret = -EINVAL;
+		rdt_last_cmd_puts("Pseudo-locking in progress\n");
+		goto unlock;
+	}
+
+	if (!rdtgroup_effective_ids(rdtgrp, &ids)) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	while ((tok = strsep(&buf, ","))) {
+		tok = strim(tok);
+		if (!*tok) {
+			rdt_last_cmd_puts("Device list parsing error\n");
+			ret = -EINVAL;
+			break;
+		}
+
+		ret = resctrl_arch_devices_write(tok, ids);
+		if (ret)
+			break;
+	}
+
+unlock:
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret ?: nbytes;
+}
+
+static int rdtgroup_devices_show(struct kernfs_open_file *of,
+				 struct seq_file *s, void *v)
+{
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (rdtgrp)
+		show_rdt_devices(rdtgrp, s);
+	else
+		ret = -ENOENT;
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret;
+}
+#else
+static inline int rdtgroup_reset_all_devices(struct rdtgroup *to)
+{
+	return 0;
+}
+
+static inline int rdtgroup_reject_assigned_devices(struct rdtgroup *rdtgrp,
+						   bool include_children,
+						   const char *operation)
+{
+	return 0;
+}
+#endif
+
 static ssize_t rdtgroup_tasks_write(struct kernfs_open_file *of,
 				    char *buf, size_t nbytes, loff_t off)
 {
@@ -1491,6 +1655,11 @@ static ssize_t rdtgroup_mode_write(struct kernfs_open_file *of,
 		rdtgrp->mode = RDT_MODE_EXCLUSIVE;
 	} else if (IS_ENABLED(CONFIG_RESCTRL_FS_PSEUDO_LOCK) &&
 		   !strcmp(buf, "pseudo-locksetup")) {
+		ret = rdtgroup_reject_assigned_devices(rdtgrp, true,
+						       "entering pseudo-locksetup");
+		if (ret)
+			goto out;
+
 		ret = rdtgroup_locksetup_enter(rdtgrp);
 		if (ret)
 			goto out;
@@ -2067,6 +2236,16 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_tasks_show,
 		.fflags		= RFTYPE_BASE,
 	},
+#ifdef CONFIG_ARCH_HAS_RESCTRL_DEVICES
+	{
+		.name		= "devices",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= rdtgroup_devices_write,
+		.seq_show	= rdtgroup_devices_show,
+		.fflags		= RFTYPE_BASE,
+	},
+#endif
 	{
 		.name		= "mon_hw_id",
 		.mode		= 0444,
@@ -3061,6 +3240,8 @@ static void rmdir_all_sub(void)
 	/* Move all tasks to the default resource group */
 	rdt_move_group_tasks(NULL, &rdtgroup_default, NULL);
 
+	WARN_ON_ONCE(rdtgroup_reset_all_devices(&rdtgroup_default));
+
 	list_for_each_entry_safe(rdtgrp, tmp, &rdt_all_groups, rdtgroup_list) {
 		/* Free any child rmids */
 		free_all_child_rdtgrp(rdtgrp);
@@ -3970,6 +4151,11 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	struct rdtgroup *prdtgrp = rdtgrp->mon.parent;
 	u32 closid, rmid;
 	int cpu;
+	int ret;
+
+	ret = rdtgroup_reject_assigned_devices(rdtgrp, false, "removing");
+	if (ret)
+		return ret;
 
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
@@ -4020,6 +4206,11 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 {
 	u32 closid, rmid;
 	int cpu;
+	int ret;
+
+	ret = rdtgroup_reject_assigned_devices(rdtgrp, true, "removing");
+	if (ret)
+		return ret;
 
 	/* Give any tasks back to the default group */
 	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
@@ -4093,7 +4284,10 @@ static int rdtgroup_rmdir(struct kernfs_node *kn)
 	    rdtgrp != &rdtgroup_default) {
 		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP ||
 		    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
-			ret = rdtgroup_ctrl_remove(rdtgrp);
+			ret = rdtgroup_reject_assigned_devices(rdtgrp, true,
+							       "removing");
+			if (!ret)
+				ret = rdtgroup_ctrl_remove(rdtgrp);
 		} else {
 			ret = rdtgroup_rmdir_ctrl(rdtgrp, tmpmask);
 		}
@@ -4210,6 +4404,12 @@ static int rdtgroup_rename(struct kernfs_node *kn,
 		goto out;
 	}
 
+	if (rdtgrp->mon.parent != new_prdtgrp) {
+		ret = rdtgroup_reject_assigned_devices(rdtgrp, false, "reparenting");
+		if (ret)
+			goto out;
+	}
+
 	/*
 	 * Allocate the cpumask for use in mongrp_reparent() to avoid the
 	 * possibility of failing to allocate it after kernfs_rename() has
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 73ff522448a0..a4b5c2d5e814 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -8,6 +8,8 @@
 #include <linux/pid.h>
 #include <linux/resctrl_types.h>
 
+struct seq_file;
+
 #ifdef CONFIG_ARCH_HAS_CPU_RESCTRL
 #include <asm/resctrl.h>
 #endif
@@ -18,6 +20,49 @@
 
 #define RESCTRL_PICK_ANY_CPU		-1
 
+/**
+ * struct resctrl_group_ids - resctrl control and monitoring IDs
+ * @closid: resource control class ID
+ * @rmid: resource monitoring ID
+ */
+struct resctrl_group_ids {
+	u32 closid;
+	u32 rmid;
+};
+
+void resctrl_last_cmd_puts(const char *s);
+void resctrl_last_cmd_printf(const char *fmt, ...) __printf(1, 2);
+
+#ifdef CONFIG_ARCH_HAS_RESCTRL_DEVICES
+int resctrl_arch_devices_write(char *tok, struct resctrl_group_ids ids);
+void resctrl_arch_devices_show(struct seq_file *s,
+			       struct resctrl_group_ids ids);
+bool resctrl_arch_devices_assigned(struct resctrl_group_ids ids);
+int resctrl_arch_devices_reset_all(struct resctrl_group_ids default_ids);
+#else
+static inline int resctrl_arch_devices_write(char *tok,
+					     struct resctrl_group_ids ids)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void resctrl_arch_devices_show(struct seq_file *s,
+					     struct resctrl_group_ids ids)
+{
+}
+
+static inline bool resctrl_arch_devices_assigned(struct resctrl_group_ids ids)
+{
+	return false;
+}
+
+static inline int
+resctrl_arch_devices_reset_all(struct resctrl_group_ids default_ids)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 int proc_resctrl_show(struct seq_file *m,
-- 
2.50.1 (Apple Git-155)


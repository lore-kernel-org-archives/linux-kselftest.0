Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890457;
	b=v0zGiEAJ2USxWzkHbMx/Psrvf47AoopIlBDwhhO+dSe9CFtWolfBihodmM+ob2MEYnxk
	 d5F3bik4juxeQuZvOv9GqkE5+PZLIcoWJY1ZgFogAmQISTiCwbG1ixpMSrCjvH5nBbbd2
	 jDXRp5FU531ui4j+oWtBm6CzgeI9XTKExV+Bh0wdD09tXtlZMHQYDSffl9HqZebm68EeA
	 Zb5bEAYHBdWkGksVFge+CP1tI+LfGU8IE5pXYdnh8QG9/GexyzC3NFbfM2+K46vCUnQr3
	 jeJtZAgWVb6awEr1gY0NF8K107mtsrcGMYPTyoFuWJDImbrgr3KAkc6QFLmU9FktpLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=herPMHPokgx3q7klLpgUehruDwzqYgIa/ATg6qpJFmw=;
	b=GFq+S5ObUBp2h2ozAH5tbpUZtQ5Uu5tgEm6LsRum2ATEJJQquXZhp9WWLsy5QMhrJKoq
	 dBAfYH5X+2iKo7hfJdZvikDxs+ngsZfn3Gr1goXKshf4r4xhd+s4iQwO1jai7NcYTWLX1
	 Sw8CObTSOtzilgjKCNMre0y+2rX/PGgrcc8dsQPOXjqzq5DQFPP5n+0A7DCXVqM+Nr2NZ
	 oxKvnlKfrpODw+KnN6yOvkbeLq3aghyK4Y/FWmH+bf/cquCks+yhds1nomoAXHg70Bax7
	 EFO0WDp9kgoIYuA4KzE0KB72PJ3hnO5WL1+tL5b9HeDrRL5zbCB4UMpgEDP200H3IQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gCgQyTR6;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66B606A683
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB66B606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=gCgQyTR6
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677d35fd1d2so9246797d50.1
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890456; x=1796495256; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=herPMHPokgx3q7klLpgUehruDwzqYgIa/ATg6qpJFmw=;
        b=gCgQyTR6dymSBDJRNM68W3cC7kXangemHSHvErQL4AjEBXUtQXQSWIni6rnvqfHf2G
         9Fg2MiBsvsz522bBrOriztf2wXov7PSBgHBorVhbYRIieL/8eRI+qqssj9rpS11NKUaU
         S1XE5RWLm+qetLk/fNaNXX47S7OypfaHOWALU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890456; x=1796495256;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=herPMHPokgx3q7klLpgUehruDwzqYgIa/ATg6qpJFmw=;
        b=fOcxSqu7RWYbKvSZ1d/09tSRgfCqyhMWLjnCL+Bl9snm9FmBFVvBIfcAMjIb4fWXvg
         YRDVCON9hoUr9CCypHJWXUi+aT+UP8r2vQow8+ZxxrOKRGCILAEIYhdQb1gDC/w/2xRe
         VdZ/+furInHR1NWPnhHurLv2RpcG0o2H8sX6DOh65Kzac+cEgxn5cG7zAKQXYhMdkSzI
         dsxsYgCRPrRcz32/juhoi/AGlNF1aOV84ZukLcroZ14vrzh3lQx1pqZqkkWE34rbFo+Z
         KfCtOhT1GPVgpydwrK2U5MrVXpd0gu+pT8/HwpIb9CioCgHcZQqq0Ax9+Noz3DuFyAdR
         plPg==
X-Forwarded-Encrypted: i=1; AL+hErGFX+7rKMSSPl0fXTCmM4Iypmc/wfvNVGGAk+9+wdsocyp2inYPu5sQPfStSqrGcKjseouAY/wzj4vfrUXEFns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j2hvOz2tGl1/EpKtVf/ten6OmKHgVugxMkP88w9qB0Hz8rZT2
	62z2n536K66RwOZ7WhtXPHUnkSjOG9Cyuy0+QQIVqCgQNNC4zpHhaZvkwrczgmbkhq0=
X-Gm-Gg: AZFdTZckYg6/3vsildAzHcZSo36SXwMVaHhfxfwi1BaUGbyykvxiteNHcX5LexExx3R
	0a0g53bWoccvuxfTP1+loTZtn2+cmeL/NFcMVdcMMIhm3NRsScPmTyAGohuowTjJY6Rld4fIm2A
	/76Bq48k8ecWqVYR7ncah+XRNZ+00UUplnwhisDOjnmvk9+CYgwIYJchKulJmISDTpM4HnSkeSs
	BuHHuhg/woAoe7SPcuPGNBuKsupFCs8rsgq9Qt4vMvI1tbdE4qVHt/K4IkzSZLb9b9F3hMf5SgY
	kyY6VZwMYr04ZbWNwmLEJdIDOw/XPmK17bjtYWIXzX/XC6lludhOVe1TK0WeQc3UbnY/D8znC/U
	LzEZZIlbp7AMP9iAKDdZjpIvtkEiFhltqXmI6LuUCQ+nOQHERCBBrmvt+fORVK1VJb9KR3RgMAr
	dgnOBnR49kT6diKyOxLmW44aFfEE1PJIvRmLdrVuIQuvOy3fsJPLCaTkNr/9EqzF1HvF8NhXP8G
	FK0rQ5i5KO4+yORSNZZY8OoqYC//u9N7GMqCjucTUV0uciQcnMa35De839E515L3I6XbWhK3O3T
	c/bpvDI8TxCc7ZjKZY5PnAPJfT+Rk+69OIpTN448QZIkJFIo5Ovo+rOVkgbgfCFIF3x7kJusRAa
	xT3NseUmw8DtdyA2IYET+NWNQbrkHbJqOqnry9VjAdkOQus4YuZI6n3XqW2knUoouBNBjO0WKzG
	NJ+jgci9gyJ1xonBcSp/Cw4U6WcJfHTiNkkWFcFvj6rHN6urzYLkEUY7nym0g6driHM7//TktH1
	1vqDBR4wsKlnkkXDzOyXUY=
X-Received: by 2002:a05:690e:438d:b0:67d:a676:262c with SMTP id 956f58d0204a3-67df45165b1mr5810763d50.98.1795890456040;
        Sat, 28 Nov 2026 10:27:36 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330acc4sm12841529d50.4.2026.11.28.10.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:34 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:33 -0800
Message-ID: <796edd4ceaa5cf5a28403dab816c04c47754c4df.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/7] liveupdate: Make failed retrieves distinguishable from
 dropped files
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
    Mike Rapoport <rppt@kernel.org>,
    Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
    Baoquan He <baoquan.he@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    kernel-team@meta.com,
    Breno Leitao <leitao@debian.org>,
    sashiko-bot@kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

At Meta, we want to use live update to upgrade hypervisors in place and
preserve service fd stores across systemctl kexec. Our kernel rollout
stops automatically when host health checks fail.

We need it to stop if the new kernel can't give back state that a VMM or
service handed over. We also want to track files that userspace never
asks for.

Today the process that tries a retrieve sees its error, but a fleet
collector can't see that error or tell whether a session went unclaimed.
Opening /dev/liveupdate to check would itself trigger deserialisation on
the first open and can get in the way of the real restorer because the
device is exclusive-open. The collector polls procfs and sysfs, so it
needs a result it can read after the event.

Let's expose the incoming deserialisation state and aggregate session
and file counts under /sys/class/misc/liveupdate/incoming/. A collector
can stop the rollout on state=failed or files_failed > 0, and track
files that were dropped or are still held. The session owner already
knows which VM or service it belongs to, so there is no need to expose
session names.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-class-misc-liveupdate   | 44 ++++++++++++++++
 Documentation/userspace-api/liveupdate.rst    |  7 +++
 MAINTAINERS                                   |  1 +
 kernel/liveupdate/luo_core.c                  | 50 +++++++++++++++++++
 kernel/liveupdate/luo_file.c                  | 16 +++++-
 kernel/liveupdate/luo_internal.h              | 34 +++++++++++++
 kernel/liveupdate/luo_session.c               |  6 +++
 7 files changed, 156 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-misc-liveupdate

diff --git a/Documentation/ABI/testing/sysfs-class-misc-liveupdate b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
new file mode 100644
index 000000000000..25e3b49d7aeb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
@@ -0,0 +1,44 @@
+What:		/sys/class/misc/liveupdate/incoming/
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:
+		Incoming Live Update Orchestrator (LUO) state and counters.
+		Present when live update is enabled. Each attribute is read
+		independently.
+Users:		system monitoring
+
+What:		/sys/class/misc/liveupdate/incoming/state
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Status of incoming LUO sessions:
+
+		"none"          No sessions were handed over.
+		"pending"       Deserialization has not finished. It
+		                starts on the first open of /dev/liveupdate.
+		"deserialized"  The sessions can be retrieved.
+		"failed"        Deserialization failed. Opening
+		                /dev/liveupdate returns -EIO.
+Users:		system monitoring
+
+What:		/sys/class/misc/liveupdate/incoming/sessions
+What:		/sys/class/misc/liveupdate/incoming/files
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Number of sessions deserialized and number of files in
+		those sessions, respectively. Counts can be partial while
+		state is "pending" or after it changes to "failed".
+Users:		system monitoring
+
+What:		/sys/class/misc/liveupdate/incoming/files_retrieved
+What:		/sys/class/misc/liveupdate/incoming/files_failed
+What:		/sys/class/misc/liveupdate/incoming/files_dropped
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Number of successful retrieves, permanent retrieve failures,
+		and files discarded at session finish without a recorded
+		retrieve outcome, respectively. Retrieves and failures are
+		counted when they occur.
+Users:		system monitoring
diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
index cdd74627ab75..39bbb91d0dd4 100644
--- a/Documentation/userspace-api/liveupdate.rst
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -45,6 +45,13 @@ For details, see:
 - `sd_pid_notify_with_fds(3)
   <https://www.freedesktop.org/software/systemd/man/latest/sd_pid_notify_with_fds.html>`_
 
+Monitoring
+==========
+
+Read ``/sys/class/misc/liveupdate/incoming/`` to monitor incoming
+sessions and file retrievals without opening ``/dev/liveupdate``.
+See Documentation/ABI/testing/sysfs-class-misc-liveupdate for the sysfs ABI.
+
 See Also
 ========
 
diff --git a/MAINTAINERS b/MAINTAINERS
index a946fbbd74f0..5c74e7dfcdc0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15524,6 +15524,7 @@ L:	kexec@lists.infradead.org
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/ABI/testing/sysfs-class-misc-liveupdate
 F:	Documentation/core-api/liveupdate.rst
 F:	Documentation/mm/memfd_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index 1b2bda22902d..ba174e9aae03 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -75,6 +75,8 @@ static struct {
  */
 DECLARE_RWSEM(luo_register_rwlock);
 
+struct luo_incoming_stats luo_incoming_stats;
+
 static int __init early_liveupdate_param(char *buf)
 {
 	return kstrtobool(buf, &luo_global.enabled);
@@ -423,11 +425,59 @@ static const struct file_operations luo_fops = {
 	.unlocked_ioctl	= luo_ioctl,
 };
 
+static const char * const luo_incoming_state_names[] = {
+	[LUO_INCOMING_NONE]		= "none",
+	[LUO_INCOMING_PENDING]		= "pending",
+	[LUO_INCOMING_DESERIALIZED]	= "deserialized",
+	[LUO_INCOMING_FAILED]		= "failed",
+};
+
+static ssize_t state_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	enum luo_incoming_state state = READ_ONCE(luo_incoming_stats.state);
+
+	return sysfs_emit(buf, "%s\n", luo_incoming_state_names[state]);
+}
+static DEVICE_ATTR_RO(state);
+
+#define LUO_INCOMING_ATTR_RO(_name)					\
+static ssize_t _name##_show(struct device *dev,				\
+			    struct device_attribute *attr, char *buf)	\
+{									\
+	return sysfs_emit(buf, "%ld\n",					\
+			  atomic_long_read(&luo_incoming_stats._name));	\
+}									\
+static DEVICE_ATTR_RO(_name)
+
+LUO_INCOMING_ATTR_RO(sessions);
+LUO_INCOMING_ATTR_RO(files);
+LUO_INCOMING_ATTR_RO(files_retrieved);
+LUO_INCOMING_ATTR_RO(files_failed);
+LUO_INCOMING_ATTR_RO(files_dropped);
+
+static struct attribute *luo_incoming_attrs[] = {
+	&dev_attr_state.attr,
+	&dev_attr_sessions.attr,
+	&dev_attr_files.attr,
+	&dev_attr_files_retrieved.attr,
+	&dev_attr_files_failed.attr,
+	&dev_attr_files_dropped.attr,
+	NULL
+};
+
+static const struct attribute_group luo_incoming_group = {
+	.name	= "incoming",
+	.attrs	= luo_incoming_attrs,
+};
+__ATTRIBUTE_GROUPS(luo_incoming);
+
 static struct luo_device_state luo_dev = {
 	.miscdev = {
 		.minor = MISC_DYNAMIC_MINOR,
 		.name  = "liveupdate",
 		.fops  = &luo_fops,
+		.groups = luo_incoming_groups,
 	},
 	.in_use = ATOMIC_INIT(0),
 };
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 9bda37b0dc4f..f8eee426d0bc 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -545,6 +545,16 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
 	memset(file_set_ser, 0, sizeof(*file_set_ser));
 }
 
+/* Record the first retrieve result. A negative status is permanent. */
+static void luo_file_set_retrieve_status(struct luo_file *luo_file, int status)
+{
+	luo_file->retrieve_status = status;
+	if (status > 0)
+		atomic_long_inc(&luo_incoming_stats.files_retrieved);
+	else
+		atomic_long_inc(&luo_incoming_stats.files_failed);
+}
+
 /**
  * luo_retrieve_file - Restores a preserved file from a file_set by its token.
  * @file_set: The file_set from which to retrieve the file.
@@ -613,7 +623,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	err = luo_file->fh->ops->retrieve(&args);
 	if (err) {
 		/* Keep the error code for later use. */
-		luo_file->retrieve_status = err;
+		luo_file_set_retrieve_status(luo_file, err);
 		return err;
 	}
 
@@ -627,7 +637,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 			  luo_file->file, GFP_KERNEL));
 
 	*filep = luo_file->file;
-	luo_file->retrieve_status = 1;
+	luo_file_set_retrieve_status(luo_file, 1);
 
 	return 0;
 }
@@ -724,6 +734,8 @@ int luo_file_finish(struct luo_file_set *file_set)
 					   struct luo_file, list);
 
 		luo_file_finish_one(file_set, luo_file);
+		if (!luo_file->retrieve_status)
+			atomic_long_inc(&luo_incoming_stats.files_dropped);
 
 		if (luo_file->file) {
 			xa_erase(&luo_preserved_files,
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dac6644bfb18..504963fc9898 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -77,6 +77,40 @@ struct luo_session {
 
 extern struct rw_semaphore luo_register_rwlock;
 
+/**
+ * enum luo_incoming_state - Deserialization state of incoming sessions
+ * @LUO_INCOMING_NONE: No incoming sessions.
+ * @LUO_INCOMING_PENDING: Deserialization has not finished.
+ * @LUO_INCOMING_DESERIALIZED: Sessions are ready to retrieve.
+ * @LUO_INCOMING_FAILED: Deserialization failed.
+ */
+enum luo_incoming_state {
+	LUO_INCOMING_NONE,
+	LUO_INCOMING_PENDING,
+	LUO_INCOMING_DESERIALIZED,
+	LUO_INCOMING_FAILED,
+};
+
+/**
+ * struct luo_incoming_stats - Incoming session and file counters
+ * @state: Deserialization state.
+ * @sessions: Sessions deserialized.
+ * @files: Files in deserialized sessions.
+ * @files_retrieved: Files retrieved.
+ * @files_failed: Permanent retrieve failures.
+ * @files_dropped: Files discarded without a retrieve outcome.
+ */
+struct luo_incoming_stats {
+	enum luo_incoming_state state;
+	atomic_long_t sessions;
+	atomic_long_t files;
+	atomic_long_t files_retrieved;
+	atomic_long_t files_failed;
+	atomic_long_t files_dropped;
+};
+
+extern struct luo_incoming_stats luo_incoming_stats;
+
 static inline struct liveupdate_session *luo_session_from_file_set(struct luo_file_set *file_set)
 {
 	struct luo_session *session;
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f1b86f701238..88959cc5bb8b 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -547,6 +547,7 @@ int __init luo_session_setup_incoming(u64 sessions_pa)
 		return err;
 
 	sh->active = true;
+	luo_incoming_stats.state = LUO_INCOMING_PENDING;
 	return 0;
 }
 
@@ -581,6 +582,9 @@ static int luo_session_deserialize_one(struct luo_session_header *sh,
 		return err;
 	}
 
+	atomic_long_inc(&luo_incoming_stats.sessions);
+	atomic_long_add(session->file_set.count, &luo_incoming_stats.files);
+
 	return 0;
 }
 
@@ -624,12 +628,14 @@ int luo_session_deserialize(void)
 	}
 
 	kho_block_set_destroy(&sh->block_set);
+	WRITE_ONCE(luo_incoming_stats.state, LUO_INCOMING_DESERIALIZED);
 
 	return 0;
 
 save_err:
 	kho_block_set_destroy(&sh->block_set);
 	saved_err = err;
+	WRITE_ONCE(luo_incoming_stats.state, LUO_INCOMING_FAILED);
 	return err;
 }
 
-- 
2.56.1


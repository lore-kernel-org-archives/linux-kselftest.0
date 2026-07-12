Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60685340A76
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871127; cv=none; b=hcIGYM1U7MTVBBmHQF9cxGG/DyCbX0+tmx2I79cL6fRPuxwpXfTymmiz20lbVLji1KkbgkXMhWNJuudFoqwLxmHhCfiWkJD+I+cUo7H8MNNAhMtRzCsZNqbF+YCrAqK2dV7Pcp+t/lx6joVX1EH1SKgcQ0iwlVb8hLtRfw+xtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871127; c=relaxed/simple;
	bh=EKPuuIUD6wUc5+OroNJRPEyMtD/v/hjeTMdbe72dyRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+zYkSdbVdaOFzzVSiFwgzmqXDAoWhC5hzRTGelSLtvXkbUu6aFQ0ff9SzdIGDWCN4XWbbZZjLfne4c1JItq/o3ixwfte8u3apVDkxwoWeO1g6/tfLmDF/ZewBVpd/o1pobeG77xMFZao7NvukdqatliG6Mu16J/FRI3WRczd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CAff8r6R; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CAff8r6R"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92edb12cdf2so132865785a.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871124; x=1784475924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYjx2PN1x6uh3R9+6IQFG7Hc6bZQLBpnO2wEgzswHD4=;
        b=CAff8r6RtlxjeTYnXbXf5DJin6ZCszujFXE4OTu7YtHVmkr6MH3MndFr9kojOt3ZfP
         zDaAcZNVASMDyq677XfgcGt0qFBMD0JjbV3VYQZCdM+tOrpz+hUN2NPtl24jWARX6xWz
         /ju1DZJlw9kVTy5IluTfrNkHY6ioxTxl5NKaCW2SwmrcaN+WKl1rTlCBGqtFtpSXYh0r
         eBJI8WvVDX1pSaxdK57QQ4xiGdjM3NvYqx4BDquc4PlogWD+oi1PnC+XU8f4pUJkJeoT
         kY+Gg7TcyqLeH8P5uTmARK/1UJa7j/xggTA85l50P7pwD2ZpeGFMNHxE/Sd+/1/pMtC9
         rcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871124; x=1784475924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYjx2PN1x6uh3R9+6IQFG7Hc6bZQLBpnO2wEgzswHD4=;
        b=s+eFEpCtxPjNq6dyZfhX5RmqzNvjFOVKs1/8vS48ZRX8wXaoxP8DllYdrAEOJK4oc7
         j0haf5/zFTW4VgmUGVRMUy4rotWucvkWiFnFZgqKWXUkBmtZFlKucXCe1zPO/9ULNYHA
         1/79yjupTFuBghaAL0iinGNTRO3sJNdCqXaWvuJp5oNH/GMNk6n+85/fChTNfZQMN/zT
         TusPN9BREwqanFzRux8WNdPwJdC9omWqp9212GDFjtwVVkyFpZLH0nW98FxDnYXsUtwM
         YE1CmsGewvVJ2bG+FGRd2JUhZAamGzHyBVam615p1w+Uj02531wVL3VDBBk1cYh5QAxz
         /nNg==
X-Forwarded-Encrypted: i=1; AHgh+Rre0StcHbJtc1O0H9ez17A0YR3lQcdfXEbYL6PNpVHv+aL1xgj/JOIUsLnBnkjlvJ3qV8PMpr6VtP9wh9PY0k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YztyIPBuy96xCTis9u0o+53JAtFaERDFzlNJ3MJ/EFeDhMgie36
	L8qVHnDlPCwKuUIeA4zB5yP3N89DLjt3sEVnZ3GoC60qdR+47DukpxKL11ZhOjedgI0=
X-Gm-Gg: AfdE7ck+Z7AbX2UmPIc7N2cb8z52ugRirNfpF5d7TNWtTOT4U0d5R2AYSBuYG9ZhsXc
	3NgSruanz1xU9fPKWR3Dh0QfPbIHOZWHNb/2uD2MIxRYabv6NfCOqPvHmE03cOF0SkiQLR1rvMs
	TTY8cOLnNS7OFL9a2wxTQyzkrsfnONbg5snC+FKybcMmZ/+wLh7drEuSg14aPe+XFunwPVO6KOG
	9jH8c0G65cAiDTfvj4Pj1lWvOTy0LOQAdKaM5N9XQAF7qm06n6geffY1Hrj7H2X0mF01wnJPNDg
	EDDY0x+4frHNIu2lPm4MvhG93h6qgdEV52XU/r+pHek1UlxMiGrb0GDGngSSoR0r19oLj5a4sIF
	ASGTXvipHLHlQzIAtQlLmU8LX941vyTOcu2xG/caAevqmMwovL7FEtk4esk/P2YsQ3yVur53TMw
	dOxwW58eVXjQSNNAC7/mDhQldUEPqCAfraqwNyyUpCY78K+BD8+sYMeolirPW1R9qTFhEbY7Nxu
	A==
X-Received: by 2002:a05:620a:2894:b0:92e:7533:ef67 with SMTP id af79cd13be357-92ef2be4e04mr657175885a.20.1783871124238;
        Sun, 12 Jul 2026 08:45:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:23 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: [PATCH v7 05/10] mm/memory_hotplug: add __add_memory_driver_managed() with online_type arg
Date: Sun, 12 Jul 2026 11:44:59 -0400
Message-ID: <20260712154505.3564379-6-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing callers of add_memory_driver_managed cannot select the
preferred online type (ZONE_NORMAL vs ZONE_MOVABLE), requiring it to
hot-add memory as offline blocks, and then follow up by onlining each
memory block individually.

Most drivers prefer the system default, but the CXL driver wants to
plumb a preferred policy through the dax kmem driver.

Refactor APIs to add a new interface which allows the dax kmem module
to select a preferred policy.

Overriding the configured auto-online policy is only safe for known
in-tree modules, where we know the override reflects a different,
user-requested policy.  We do not want arbitrary out-of-tree drivers
silently overriding the system-wide onlining policy, so restrict the
new interface to the kmem module using EXPORT_SYMBOL_FOR_MODULES()
rather than a plain EXPORT_SYMBOL_GPL().  Other in-tree modules (e.g.
cxl_core) can be added to the allowed list as the need arises.

Refactor add_memory_driver_managed, extract __add_memory_driver_managed
- Add proper kernel-doc for add_memory_driver_managed while refactoring
- New helper accepts an explicit online_type.
- New helper validates online_type is between OFFLINE and ONLINE_MOVABLE

Refactor: add_memory_resource, extract __add_memory_resource
- new helper accepts an explicit online_type

Original APIs now explicitly pass the system-default to new helpers.

No functional change for existing users.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/memory_hotplug.h |  3 ++
 mm/memory_hotplug.c            | 61 +++++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f19893f5fa948..593e42c221ada 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -295,6 +295,9 @@ extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory_resource(int nid, struct resource *resource,
 			       mhp_t mhp_flags);
+int __add_memory_driver_managed(int nid, u64 start, u64 size,
+				const char *resource_name, mhp_t mhp_flags,
+				enum mmop online_type);
 extern int add_memory_driver_managed(int nid, u64 start, u64 size,
 				     const char *resource_name,
 				     mhp_t mhp_flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index be8e8e2cd1535..aaee8470eb2ad 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1495,10 +1495,10 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
  *
  * we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLUG
  */
-int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
+static int __add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags,
+				 enum mmop online_type)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
-	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1586,7 +1586,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-	if (mhp_get_default_online_type() != MMOP_OFFLINE)
+	if (online_type != MMOP_OFFLINE)
 		walk_memory_blocks(start, size, &online_type,
 				   online_memory_block);
 
@@ -1604,7 +1604,13 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	return ret;
 }
 
-/* requires device_hotplug_lock, see add_memory_resource() */
+int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
+{
+	return __add_memory_resource(nid, res, mhp_flags,
+				     mhp_get_default_online_type());
+}
+
+/* requires device_hotplug_lock, see __add_memory_resource() */
 int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags)
 {
 	struct resource *res;
@@ -1632,7 +1638,15 @@ int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags)
 }
 EXPORT_SYMBOL_GPL(add_memory);
 
-/*
+/**
+ * __add_memory_driver_managed - add driver-managed memory with explicit online_type
+ * @nid: NUMA node ID where the memory will be added
+ * @start: Start physical address of the memory range
+ * @size: Size of the memory range in bytes
+ * @resource_name: Resource name in format "System RAM ($DRIVER)"
+ * @mhp_flags: Memory hotplug flags
+ * @online_type: Auto-Online behavior (offline, online, kernel, movable)
+ *
  * Add special, driver-managed memory to the system as system RAM. Such
  * memory is not exposed via the raw firmware-provided memmap as system
  * RAM, instead, it is detected and added by a driver - during cold boot,
@@ -1640,6 +1654,7 @@ EXPORT_SYMBOL_GPL(add_memory);
  *
  * Reasons why this memory should not be used for the initial memmap of a
  * kexec kernel or for placing kexec images:
+ *
  * - The booting kernel is in charge of determining how this memory will be
  *   used (e.g., use persistent memory as system RAM)
  * - Coordination with a hypervisor is required before this memory
@@ -1652,9 +1667,12 @@ EXPORT_SYMBOL_GPL(add_memory);
  *
  * The resource_name (visible via /proc/iomem) has to have the format
  * "System RAM ($DRIVER)".
+ *
+ * Return: 0 on success, negative error code on failure.
  */
-int add_memory_driver_managed(int nid, u64 start, u64 size,
-			      const char *resource_name, mhp_t mhp_flags)
+int __add_memory_driver_managed(int nid, u64 start, u64 size,
+		const char *resource_name, mhp_t mhp_flags,
+		enum mmop online_type)
 {
 	struct resource *res;
 	int rc;
@@ -1664,6 +1682,9 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 	    resource_name[strlen(resource_name) - 1] != ')')
 		return -EINVAL;
 
+	if (online_type < MMOP_OFFLINE || online_type > MMOP_ONLINE_MOVABLE)
+		return -EINVAL;
+
 	lock_device_hotplug();
 
 	res = register_memory_resource(start, size, resource_name);
@@ -1672,7 +1693,7 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 		goto out_unlock;
 	}
 
-	rc = add_memory_resource(nid, res, mhp_flags);
+	rc = __add_memory_resource(nid, res, mhp_flags, online_type);
 	if (rc < 0)
 		release_memory_resource(res);
 
@@ -1680,6 +1701,30 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 	unlock_device_hotplug();
 	return rc;
 }
+EXPORT_SYMBOL_FOR_MODULES(__add_memory_driver_managed, "kmem");
+
+/**
+ * add_memory_driver_managed - add driver-managed memory
+ * @nid: NUMA node ID where the memory will be added
+ * @start: Start physical address of the memory range
+ * @size: Size of the memory range in bytes
+ * @resource_name: Resource name in format "System RAM ($DRIVER)"
+ * @mhp_flags: Memory hotplug flags
+ *
+ * Add driver-managed memory with the system default online type set by
+ * build config or kernel boot parameter.
+ *
+ * See __add_memory_driver_managed for more details.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int add_memory_driver_managed(int nid, u64 start, u64 size,
+			      const char *resource_name, mhp_t mhp_flags)
+{
+	return __add_memory_driver_managed(nid, start, size, resource_name,
+			mhp_flags,
+			mhp_get_default_online_type());
+}
 EXPORT_SYMBOL_GPL(add_memory_driver_managed);
 
 /*
-- 
2.53.0-Meta


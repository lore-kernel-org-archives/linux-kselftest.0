Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890464;
	b=nh1lUu2/OFsBuxiLNH5kJs1GA9NI9WrE3E4HIt421auY24G6V+ClAiBc07jVFlKi5Gzi
	 JtwpVedSJ0mBdqJla1RvjI7XLeHgT3DGRIuXJ6KOCS38ttqldY3alPtoNdXsYt4Qlx30q
	 LstTrGMqO1sQUDQ2agQTXXXKWtUFp03yuNrlg5jxqbNxlZ/9O9gzR2DPGhyW7hvoySVSJ
	 TY9jxfqCI9rGpwtYbKQOrWzOtU9bjc3dY8p8eDuZ1z2zoWjyH6jWRppHCaMud8mTpJxsu
	 EsLLiVHqH/q0Scc9DnVJHq/pmwdPscsnSg8RHVda05tUlLnZyEtTatO8FMYTAIAdB+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=1BuqhSIPxOjAmCucDj7na1oR1XC2SnDbOY7PDeOt/i0=;
	b=0imrFRAniAU8XiFi8cSYJmNDdU2vHYp7LFdDquwcNlfySmKms5Jmk/JBREQ6yGNddPuT
	 f8nUrHIbfl4y8eHWVgc4gld0j4OccnlvvP4JTjzKapElvJCTcgyx5dUatA9lEZVGmmX2v
	 7uVfRVeEZOl4LheehYguRRDiOKR/19uFOIoz7BKO1dNBhxdlIdq84O1DAetihw0611qny
	 LFIpdtaRP/Oya0ZlSWyMD8XYc5OlxDS6RvEgoGHqy2G1wGF5+25H1HKFBx13PVQWWWYwT
	 +a62VU893G003JoRNuKzlAElEt4RcXOkgu4OlI+oi/+1GBtTif34yGTGEOjR2glrPww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=hguNE+q6;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7123606A334
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7123606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=hguNE+q6
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4cc793704so71967517b3.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890463; x=1796495263; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1BuqhSIPxOjAmCucDj7na1oR1XC2SnDbOY7PDeOt/i0=;
        b=hguNE+q6q05/XBHcliywefCJlNDeWWQLkFTRDw85ekN3eQwvpRPCw5iiEcIZ967ALx
         1tw/GMP2t2Ja7XCrJXQ423Ijej5fK0ME1bUzbtHvQLZ00cxcQ70TS+SAdohdqdxNN0LI
         vYgpkZCfBencE0LEWGJez4R2bpW/3TSoCwMcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890463; x=1796495263;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BuqhSIPxOjAmCucDj7na1oR1XC2SnDbOY7PDeOt/i0=;
        b=fU8PKjnrtlNysdK81SsRattKtv/4Ow+oQQo2mSUvdNVBftwYho5AMukzUHoyA5HkfA
         fTUZdHbno018tX9Sn2B2q5f8FHMhSpCrHO9da02R8LWk+sVxnmrg50k8X5L+wCklF2qG
         r9B7NToyeWxdm9lQakQJ2Vn947DHysEed5gUoC7wYhGWh2GVNfiXDe1FSPZ8HH4drFqe
         5Uzqbe8SKDbano3DOz5UsrYhfCJW4JTF/5Dtxzmq0cDGuOWFYQ6gUVV52Laf1i43zeKr
         grRBI4K1ynbhzJ2mL7Gz502WRKI2HdaDj7LGbi6FwQX0TrezrOX6VoJJIqk3fdAtLimY
         XeOA==
X-Forwarded-Encrypted: i=1; AL+hErGvmY8cfbjNC65RLIBpVPA7s8ouVbZxJpI4WiAIjzWq+bPOlw4QTBbUTohtabNi8ujD8c9osyACDVGd2JvFtK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HbkMpwSTOYIki4C/YaT67MGP3tNl8a9Mc2ei4G9HA7Vlja7hJ
	9UOLwj/k2mbcsUUYIMaClPQ7BpNQy63nXYoU2uUDdjs4pFkeAHyGdLeyKU/oI8lVlOk=
X-Gm-Gg: AZFdTZe/JjuOmH/XgS4R4LGiHvO7X8q5IcADvDzqA0ZtUWFrHTqrYGzhh80/pEMvInt
	bmOaB52UkSDtAhbpiePUeg8UP7tJpJJk/Yt3+F5xfklN0F5Ffsf80rnO4xdCXkouG+dhsKyAYJm
	MavAjVdWVklsPp7lfInWU6Qoo8ED9SpZLWYSIyXFJLPv8PHb+L/E3jGBYsZeuEfhyOUmp8RtKGi
	RVaDrHSLM682wJ6M0ck192jIJxgRcNfHICa0sFswLyWCvdAikudVwE6moOFvxMU0kvU1l8avZTw
	XPfazFvBj2UOyrPHbMv1iI9NzV7m9WnKEPsm3+/fUCKK/sCDaZXsItKGSCmVzIQ0yAx4QX75gH1
	XhVZMmatpeTHgGWpRtl6xQddXKg4pElP/Fllg5frC0FztLmm8qoWYQs7jnyDuBuyBNo7Wl+od/s
	vkrXwMkcSPvxZmr7/Fs/TNhVDNNOxdwtwmnl8hBwvmHbQ2tPjSVXmjgJ+RzR+a8zsnkkWSTFWcI
	uedj1rLkJJUsWKopvnCfhEJ0zt05PgoWgjjZpu9Gbt/R9CuhCcqvQnp4iotUIP7lS+31tLYFlMW
	e5NVUQXlZ6oCmlepC9HGrjchSoR0e1E8PAK7qh3k/yP8e/IUXNLSSYYu66qav5RCJfHCEf3z+ZX
	mWsBHndS3zyuLQd3TRIYLhnjFlimUHG3vTjC/ilIhbh+RpbgpECZA90zH0q0BwIlRa0P+d5ATOk
	yeIIUKE2NnJ0vdEk4I9fRAfAEexgF+e3RegMUQ530qFnqGKliA+QqpQgXxv3o9V8ZVtnkJgmWcy
	QZ6tR1O5pgsd/FEqkvwnkVN0mcujYXl00q/zWF0G7vX
X-Received: by 2002:a05:690c:6a12:b0:8b0:c673:993c with SMTP id 00721157ae682-8b52042d88amr87827227b3.21.1795890462742;
        Sat, 28 Nov 2026 10:27:42 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202c089dsm107728577b3.22.2026.11.28.10.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:41 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:40 -0800
Message-ID: <1b0354d4bd39765d151632c0d7ab38bbae96dffa.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 5/7] kho: Report how much handover memory is preserved and
 restored
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

Most memory the previous kernel preserved stays reserved until its user
restores it through KHO, either to use it again or to free it. If
nothing does, it stays reserved for as long as the kernel runs. On a
hypervisor host that can be gigabytes, but amusingly nothing really
shows it reliably. The host simply has less memory than it should, which
is not exactly obvious.

All preserved memory is reserved in kho_preserved_memory_reserve(), and
everything restored through KHO goes through kho_restore_page(), so KHO
can count both easily. Let's add preserved_size and restored_size, in
bytes, to /sys/kernel/kho/incoming/.

For example, after a live update preserving a 64 MiB memfd:

                     preserved_size  restored_size
    before retrieval       67403776           8192
    after finish           67403776       67395584

The 8 KiB left are the incoming KHO FDT and LUO's FLB header.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/ABI/testing/sysfs-kernel-kho  | 10 ++++++++++
 Documentation/admin-guide/mm/kho.rst        |  3 +++
 kernel/liveupdate/kexec_handover.c          | 15 +++++++++++++++
 kernel/liveupdate/kexec_handover_internal.h |  2 ++
 kernel/liveupdate/kho_sysfs.c               | 16 ++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kho b/Documentation/ABI/testing/sysfs-kernel-kho
index 21488e35d1f3..a8251d663ce6 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kho
+++ b/Documentation/ABI/testing/sysfs-kernel-kho
@@ -9,3 +9,13 @@ Description:	read only
 		           the walk of its preserved memory map.
 		"failed"   The kernel rejected the handover.
 Users:		system monitoring
+
+What:		/sys/kernel/kho/incoming/preserved_size
+What:		/sys/kernel/kho/incoming/restored_size
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Bytes preserved by the previous kernel and bytes restored
+		through KHO, respectively. Both are 0 unless the incoming
+		state is "revived".
+Users:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 8810813a5d0a..a12c1398eff2 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -87,6 +87,9 @@ sysfs Interfaces
 ``/sys/kernel/kho/incoming/state``
     Status of the incoming KHO handover.
 
+``/sys/kernel/kho/incoming/preserved_size`` and ``restored_size``
+    Bytes preserved by the previous kernel and bytes restored through KHO.
+
 See Documentation/ABI/testing/sysfs-kernel-kho for the sysfs ABI.
 
 debugfs Interfaces
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index aff96aa401f8..5d9b724ab754 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -103,6 +103,8 @@ struct kho_in {
 	char previous_release[__NEW_UTS_LEN + 1];
 	u32 kexec_count;
 	enum kho_incoming_state state;
+	unsigned long preserved_pages;
+	atomic_long_t restored_pages;
 	struct kho_debugfs dbg;
 	struct kho_radix_tree radix_tree;
 };
@@ -545,6 +547,7 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio,
 		kho_init_pages(page, nr_pages);
 
 	adjust_managed_page_count(page, nr_pages);
+	atomic_long_add(nr_pages, &kho_in.restored_pages);
 	return page;
 }
 
@@ -636,6 +639,7 @@ static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
 	info.magic = KHO_PAGE_MAGIC;
 	info.order = order;
 	page->private = info.page_private;
+	kho_in.preserved_pages += 1UL << order;
 
 	return 0;
 }
@@ -1746,6 +1750,7 @@ err:
 	kho_in.fdt_phys = 0;
 	kho_in.radix_tree.root = NULL;
 	kho_in.state = KHO_INCOMING_FAILED;
+	kho_in.preserved_pages = 0;
 }
 
 static __init int kho_out_fdt_setup(void)
@@ -1777,6 +1782,16 @@ enum kho_incoming_state kho_in_state(void)
 	return kho_in.state;
 }
 
+u64 kho_in_preserved_size(void)
+{
+	return (u64)kho_in.preserved_pages << PAGE_SHIFT;
+}
+
+u64 kho_in_restored_size(void)
+{
+	return (u64)atomic_long_read(&kho_in.restored_pages) << PAGE_SHIFT;
+}
+
 static void __init kho_in_kexec_metadata(void)
 {
 	struct kho_kexec_metadata *metadata;
diff --git a/kernel/liveupdate/kexec_handover_internal.h b/kernel/liveupdate/kexec_handover_internal.h
index b559f5d43116..9e2d1b0ef753 100644
--- a/kernel/liveupdate/kexec_handover_internal.h
+++ b/kernel/liveupdate/kexec_handover_internal.h
@@ -29,6 +29,8 @@ enum kho_incoming_state {
 };
 
 enum kho_incoming_state kho_in_state(void);
+u64 kho_in_preserved_size(void);
+u64 kho_in_restored_size(void);
 
 #ifdef CONFIG_KEXEC_HANDOVER_DEBUGFS
 int kho_debugfs_init(void);
diff --git a/kernel/liveupdate/kho_sysfs.c b/kernel/liveupdate/kho_sysfs.c
index eb2e4ce72f20..e87a417d9254 100644
--- a/kernel/liveupdate/kho_sysfs.c
+++ b/kernel/liveupdate/kho_sysfs.c
@@ -21,8 +21,24 @@ static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
 }
 static struct kobj_attribute state_attr = __ATTR_RO(state);
 
+static ssize_t preserved_size_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kho_in_preserved_size());
+}
+static struct kobj_attribute preserved_size_attr = __ATTR_RO(preserved_size);
+
+static ssize_t restored_size_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kho_in_restored_size());
+}
+static struct kobj_attribute restored_size_attr = __ATTR_RO(restored_size);
+
 static struct attribute *incoming_attrs[] = {
 	&state_attr.attr,
+	&preserved_size_attr.attr,
+	&restored_size_attr.attr,
 	NULL
 };
 
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383621;
	b=BEZ0FvD34BtO/HlQgjgGHmpxGpHYBtnVF9knwKPWjwS8eSqutuwjnd4A4w5iF6sQJEA+
	 2RBeOmdWmc62cYtIxWQttA2nZctsLEmYP6aasY/rCIRMTpNMSi7pij9Cxi+qT7kx0qiRv
	 /3hu4FJdScNpd0PJu41R5zoWtUyKGYiAioSBWEZwCVfgKOi+Hcqt3KH3soCP2/Xfsno4K
	 hcZ/DuinOsFPmKFoqjRzqXfLoqmvlo5CakmNPFBdewcfnoDX4pUPWXNXqdGeTbtU5FScN
	 4UG6vBwm/uiJWzGHZeDRpQum8HYz5zZHPS4iOdaf+w0xWxRh7EWvDsyvnY4YrI4BkoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=sK/H9HvHFSTiGugEGJQyMUnIkFUyigqct4WxtQyCZAI=;
	b=SB7OuWjQnNo5+zxRJNTvsGwWfSJR0yQy979m9AtxTMbgHQkH2r+BIoQlS5HjQIsu92vU
	 nmmENwCi+7YBXPAev/zWbP0annX4Tk4DzCJNutvBlFjeaL2tFkquIIGblAbTGmBpZgq4h
	 sP2WtREjLouNsOrZis4vmognuC/wBlMdTzOfH+I3Igv6H7iqM4A+NusbmXF2agX2IIkoN
	 bTVt1nNy4Xczma5lHtt5hzcTigvHR39k7mCASGP8i14PXGbAi00E6TmCvpMF7+sk6iRen
	 YcVU2twVEthgTcH394Aq2TaAHmy/mUOueLzyXl3DPne2yb+G2aFRytjs9y0TTht5FeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xaDRSLAB;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F8660A2600
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F8660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xaDRSLAB
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b904d10882so1303139b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383620; x=1794988420; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sK/H9HvHFSTiGugEGJQyMUnIkFUyigqct4WxtQyCZAI=;
        b=xaDRSLABpfcz35+Jp7pKiITUvAgjZWk7/Jh/8WetpYrTZp9CkHwV1EFlgkfEgMjmYv
         CAloFN3rxioko73QaTac1MJq4Cz7jyUCaeLiA6+2dXFCbPQpfk0fEAMmN6TJuRIhT/jM
         r4DvfBb3kH3jy0wwVbSjIj9ATNuoAA338rnD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383620; x=1794988420;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK/H9HvHFSTiGugEGJQyMUnIkFUyigqct4WxtQyCZAI=;
        b=1jYKBtU3YUAtAa8ybidzIprzF1TIrmt7/Ar2PwFj5auOnd1JcT9wDO3/euQOxONUxD
         b36fkPQs3SGsoXa+WMbZDe124dBJgfCfqWlwtoTqfK5Qmk9hfxrhFwMnUb5tBzJdy98k
         KmXx40kkuWR9bBQfe+2XZmtLB5s9zKarI5gWFrZwKVfr9UMLXbQaoKdv2rqcDx1DZD0s
         kquW4vyIpAt0QuBayGf6EmaIjlbt5SF+x6DPsWIBpJJGooBeS9rvoYIia4l8s+pwS1DQ
         MS/ZMYEDtAKLC4N9bKk3If7TfC2X/RrPGD/gn30rjdT2AG0ZNqsctJFlOPNLHRSLaePV
         I0sg==
X-Forwarded-Encrypted: i=1; AL+hErE+rH8B+O+SrJHvUHQaGnsdLLT5rVsjkWkPLs1V6VyeZr/tcz9Amg1XoJRd522R02Eg4o0Avaeje2dJSs9xVfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SsOXMh+NxTcZyz5DCfkj7ogsx74VtW/kMOrNLJYrO13yl8mTB
	HNj7kvUca+Arp5BHwbbbRqzy3n8caSzMr6xLs2o9WKhUAIG17ZUaY+DpjwNxu+z79dY=
X-Gm-Gg: AYBFou0j6TaB7u4V1LAHdSkt1NF7OlE2VQcPTvJil2Q2JYH8/EI+wyi5aMjcxsFKqvj
	r3JitO7JMiSO6Kayh0IiTjZ7vAyqWyafRWvJ2nPfDvO6h91ZcwrP+ffQp1LdZBgbI4Sa1N9SAfO
	pCzwrwdm5ibb7gqfJWcrFXeGolKNBUL7csxwmJts+0Vt8rcbrAvraxqa7m/p16xM3IZVtKlfuDw
	1aURNx5s0je/id6D4RWu0Jj1Yp9Zq9/HmfuwybKLedYvLtfExGxfj71YfJl+9jgoLhMil9S6SIc
	uLvZivXttKYEpjrdVRvzjZ21Z9wqWciIJkDFb9TFScZrXHbJGEM9VojTmA9Cr9kRlnhZZuVmEDI
	0L9Mi8IQJwCbiAdJ1309QN81ic3qtMAp3HzMgriv6SBnM8yNXjpjjFw4XhpEGMVMK8PUFfCbcyw
	yehkBJReeQ4FTh09vXFoxAstUv2rtWIJUGErOlJFHTPIuhr/AOPaPrElIIrF2aX8Aef2/qw7JBg
	gZaA8N1EGeEGs4LL9xshL7mPh1JyqdSUBaiy4eskYFLKAQliEduq8bxzvwr1r07yKiWIsztgZMw
	3xye9FdShH7RbohexQB3kqsrCYz2s+J86SFErg4BbitU3sBNemHMgsjGrMCTtwUD3AAZdV72srA
	ibcHva1pgr2u0qfepcWdnZsSBMtDB/fv+FeN8NxkE1A8b51xkV/fWzLuje5FhQgypV3koTqleGl
	JJ+ieKsA6ebuH+PgkGBROgG6pRmJJvZsUK/6h5gTSVvGwkg9HEzPVqeA==
X-Received: by 2002:a05:6a00:2d2a:b0:8a0:1e49:71bb with SMTP id d2e1a72fcca58-8bc1ddf8792mr1803838b3a.57.1794383619946;
        Tue, 10 Nov 2026 23:53:39 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm1842597b3a.14.2026.11.10.23.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:39 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:35 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 7/9] kho: Report how much handover memory is preserved and
 restored
Message-ID: <920192d01c6534b5754648e12840f73cdcfa73de.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Most memory the previous kernel preserved stays reserved until its user
restores it through KHO, either to use it again or to free it. If
nothing does, it stays reserved for as long as the kernel runs. On a
hypervisor host that can be gigabytes, but amusingly nothing really
shows it reliably. The host simply has less memory than it should, which
is not exactly obvious.

All preserved memory is reserved in kho_preserved_memory_reserve(), and
everything restored through KHO goes through kho_restore_page(), so KHO
can count both easily. Let's add preserved_size and restored_size, in
bytes, to /sys/kernel/kexec/kho_incoming/.

For example, after a live update preserving a 64 MiB memfd:

                     preserved_size  restored_size
    before retrieval       67403776           8192
    after retrieval        67403776       67395584

The 8 KiB left are the incoming KHO FDT and LUO's FLB header.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 10 ++++++++
 Documentation/admin-guide/mm/kho.rst          |  3 +++
 kernel/liveupdate/kexec_handover.c            | 23 +++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 5636cd060cb2..2b9f9917d2d4 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -79,3 +79,13 @@ Description:	read only
 		           the walk of its preserved memory map.
 		"failed"   The kernel rejected the handover.
 User:		system monitoring
+
+What:		/sys/kernel/kexec/kho_incoming/preserved_size
+What:		/sys/kernel/kexec/kho_incoming/restored_size
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Bytes preserved by the previous kernel and bytes restored
+		through KHO, respectively. Both are 0 unless the incoming
+		state is "revived".
+User:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index 9d74d4ce18b5..37a62daa7622 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -91,6 +91,9 @@ sysfs Interfaces
 ``/sys/kernel/kexec/kho_incoming/state``
     Status of the incoming KHO handover.
 
+``/sys/kernel/kexec/kho_incoming/preserved_size`` and ``restored_size``
+    Bytes preserved by the previous kernel and bytes restored through KHO.
+
 See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
 
 debugfs Interfaces
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index dfd6fa7e4a71..fe6b66270124 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -110,6 +110,8 @@ struct kho_in {
 	char previous_release[__NEW_UTS_LEN + 1];
 	u32 kexec_count;
 	enum kho_incoming_state state;
+	unsigned long preserved_pages;
+	atomic_long_t restored_pages;
 	struct kho_debugfs dbg;
 	struct kho_radix_tree radix_tree;
 };
@@ -552,6 +554,7 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio,
 		kho_init_pages(page, nr_pages);
 
 	adjust_managed_page_count(page, nr_pages);
+	atomic_long_add(nr_pages, &kho_in.restored_pages);
 	return page;
 }
 
@@ -643,6 +646,7 @@ static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
 	info.magic = KHO_PAGE_MAGIC;
 	info.order = order;
 	page->private = info.page_private;
+	kho_in.preserved_pages += 1UL << order;
 
 	return 0;
 }
@@ -978,8 +982,26 @@ static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
 }
 static struct kobj_attribute state_attr = __ATTR_RO(state);
 
+static ssize_t preserved_size_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", (u64)kho_in.preserved_pages << PAGE_SHIFT);
+}
+static struct kobj_attribute preserved_size_attr = __ATTR_RO(preserved_size);
+
+static ssize_t restored_size_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	u64 pages = atomic_long_read(&kho_in.restored_pages);
+
+	return sysfs_emit(buf, "%llu\n", pages << PAGE_SHIFT);
+}
+static struct kobj_attribute restored_size_attr = __ATTR_RO(restored_size);
+
 static struct attribute *kho_incoming_attrs[] = {
 	&state_attr.attr,
+	&preserved_size_attr.attr,
+	&restored_size_attr.attr,
 	NULL
 };
 
@@ -1785,6 +1807,7 @@ static void __init kho_mem_retrieve(void)
 	kho_in.fdt_phys = 0;
 	kho_in.radix_tree.root = NULL;
 	kho_in.state = KHO_INCOMING_FAILED;
+	kho_in.preserved_pages = 0;
 }
 
 static __init int kho_out_fdt_setup(void)
-- 
2.54.0


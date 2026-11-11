Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383586;
	b=q3tWl+NxAgTtbqbMtvp1Thg+02T5cHJ0L9fcERxwTdCD3w67qcRRuXCoSVvJp1LymrU8
	 m8JLG1ORQLG3yxlK3AAAJey4kyUZxRFqjWkq6fv+cq1W+ebaKUNfEuXNRdj6pfJE9iDK3
	 lf66hk72OZivTbCoxTiwdTYU+ug/iZT95mgl+QIlTLKmOXSLPERQ4bNWuI0K4aNik/HN2
	 3BFUrZS57eVAixCWhL5JZgNLBUAZiBbYfCa1ao5jTAghuaBbwfK4bK+wN9cK58LBtt4Zm
	 apP7IJLIPhAo93AvydM2Jirex8G8xdG32uc2SMvAcsnS2Lfxscy8paZxmks0i1tXZjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=OO34thgIpfnBLKDxy+V7gJ/LfMCRQ5G6mslroPjHH60=;
	b=uNQjZ0Qn91wqbhR+V5C8dw4Y6YnlDy/iBJklrw7rLM4VDqldh8wiRhNPz/hmx3iQn5JG
	 gAJFUCDFL6d23cLEf+QPdvvlgWH3OLgeh6tF0FMF93Y8BoebLjz+E5OlCagLvgCOAz239
	 VX1zpOWQE1liMVy3JKNajSm70S8iA7i+xvlXtQkrfBGt9gDDs5wm+WxiV92fdjQ48SSWb
	 bPmzsly4JcB0Zw3mht5cZnU89mNEb+8ePcCuGAqvy+/FivDdLSZBSo/ZxhGYU0z2fdXjv
	 3UOvdoJrTWW0BWR5feQN8TT2cPzOzKX33FNV4RPnx2aPr7XsAuwoQZdwjxQwxrJA7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qh9LCOAD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A9606A330
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123A9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qh9LCOAD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so26276045e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383584; x=1794988384; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OO34thgIpfnBLKDxy+V7gJ/LfMCRQ5G6mslroPjHH60=;
        b=qh9LCOADWEzmdiA75k2jWPNA0yBkjcxg5am/zcWGrzyzxcPxj7HPRox/Oa3brD1NcL
         JuXhUs0YWmoz/GUqgeUUom1FHtCXUO1eJnyrm6j1KAAShstl/Q8QAyyuxuAt14eq2G/B
         yOpjPxWgYdBpuiNdPO8eTYjd5FuDD4HLBWXh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383584; x=1794988384;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OO34thgIpfnBLKDxy+V7gJ/LfMCRQ5G6mslroPjHH60=;
        b=hSYlsr0qve4hSQW1YQQJ0yJdO6neOm3E5ALiDUPpok9gP0c22JYv42szCjmkP2zRIV
         97GRCll20Rz3nw7V0iet5FxdNgqnOd9s2R9h8Y4JD9HZczNO/PcqfXYB05roQe6EbZyA
         DdqVV74qx7BuFF3tGP0wdlzzg1Yxhe7foiEw0xjUUeLc6J9AGVHwpsV7/l2n+ZdpKcaK
         AM0z3TANagMgw9fJIIhiB9RgGCzWIwufH7Ez+Uf5tRFreKbkQHl/CxPCXIAfHv1Mu38y
         84jojwKBNaQ7kArdn9AiBnxr/wlk/TtVksk8UnWOL2UYrGWmObTDueVjb/PmohA9FX6f
         P2/w==
X-Forwarded-Encrypted: i=1; AL+hErGgtfMp8nT0diMBa/gUKdZKsDRUXRMd0MC9X/Q2bs0EvQjYqdd6JPw+9Pm+BaK/onOFriiqfcDnzUZMv9k77bM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/tjT+WFyjNH0qcl9Z/JYPTJto7grvx6P8+FQ7Dmvuj9W0N8fK
	rrCf+HBE44o1mDnHdyZkbPHvhP80GAj1ArQymcwEGpfeYPzISnDhx35q6eurgh1TzIA=
X-Gm-Gg: AYBFou2LZbi4ZW+ptWG1MRQYRFVptKP4FQtiGNsvS8QmFN5jtAtz3NUSskq8B9yJOsH
	DvwNC14JQJKm/cgKDgBdJOhSWBmql2i/cJnDI2bVMJwN5uw4Jx6OdNyoh7NMQnUriln20LvwYhG
	LOM5Tt7Vkrc0Uy1A4eXBUXffq90DmGLJqg6OlA5bd1c9kHfiECQa/DCHTm4yehHY6vsNwbcyuCh
	p351jQPdbzIN1SB4gzL2NS63LeF+s5grPlhV+5CG7SbBAw4IZzqfkq44v0ZzKSdhmY3JJcdwwHz
	4F28px1KfVk71kxhC8tvc75/IbV6guae9nBz+bz+eSXQBoxMmfrVwbygWC2eRA8Ph0q/a+UKN9V
	iTnfNIAsvnVjUAV63dKB4T5r9ME2vUkVKHESba23vPmiiwwDQKHgCJX+xClIXv9AwtA0+aftijC
	JE5iiin+HX9VoEXcuVAfke3C3nFDccOZJqOIN9zgH/SFUMUtb7sedDoxVsRy333gzxUNM8ZJtvz
	HHhvSpk2DYfnxCbsCh8lNCKF5vpl14GFT2XfzkWt0Im5e8r+jS8UI4Yr7kMzxVsXnLv3FS0lJIr
	k/elun+H42J9zwVFZ1eqQBoKoGeCygPBoSyMxlq4GzLUl59nhf5zsGVtQqMSMueHiohc+fxb0Vz
	bplVLb33NfG6dbha0mRe3kVuSL+tQKe0DMrPwvVevHNyLDEHSxAEFtI+3Ydk2TcbhJo5rz6P0rv
	my+GuH4Qwma6n5cfGQhYJd3P0eKnNo5WhoxuX35XHQNJkQkjcEPFc3
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4ba093811c8mr23533605e9.5.1794383584057;
        Tue, 10 Nov 2026 23:53:04 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a763sm120391615e9.4.2026.11.10.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:03 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:01 -0800
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
Subject: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
 monitoring
Message-ID: <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
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

We want to use live update at Meta to upgrade hypervisors whose VMs
can't be migrated away first. But this poses a problem: whether we can
enable KHO on a class of host depends on how much memory it leaves
available for unmovable allocations. In an early test, a 64 GiB host
with hugetlb_cma=6G set aside about 30 GiB of bootmem, which the running
kernel can only use for movable allocations.

The reservation varies with the kernel, memory size, NUMA layout and
command line. Our fleet collector needs the actual size from each host
so we can decide where to enable KHO and catch a kernel release that
takes those hosts over their bootmem budget.

Today the collector would have to sum kho/out/bootmem_len in debugfs,
which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma
count in /proc/zoneinfo includes bootmem after a cold boot but not after
a KHO kexec. On an 8 GiB QEMU guest booted with
kho_bootmem=32M,1536M,512M:

                CmaTotal  CmaFree     zoneinfo cma (all zones)
    cold boot   0 kB      2127872 kB  2129920 kB
    KHO kexec   0 kB       881336 kB  0 kB

Even if bootmem becomes a CMA area, CmaTotal will still include other
areas such as hugetlb CMA, so inferring the bootmem size is still
error-prone.

Let's report the total bootmem reservation in bytes at
/sys/kernel/kexec/kho_bootmem_size.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-kernel-kexec-kdump          |  8 ++++++++
 Documentation/admin-guide/mm/kho.rst              |  9 +++++++++
 include/linux/kexec_handover.h                    |  1 +
 kernel/kexec_core.c                               | 13 +++++++++++++
 kernel/liveupdate/kexec_handover.c                | 15 +++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index f59051b5d96d..80941a7d8a7c 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -59,3 +59,11 @@ Description:	read only
 		to the crash (kdump) kernel. It lists the start and end physical
 		addresses of CMA regions assigned for crashkernel use.
 User:		kdump service
+
+What:		/sys/kernel/kexec/kho_bootmem_size
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Total size of the KHO bootmem regions in bytes. Returns 0
+		when KHO is disabled.
+User:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index f9d2cc5999ee..c329d720bf25 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -81,6 +81,15 @@ At scale, correlating crashes to the previous kernel version enables
 faster root cause analysis when issues only occur in specific kernel
 transition scenarios.
 
+sysfs Interfaces
+================
+
+``/sys/kernel/kexec/kho_bootmem_size``
+    Total size of the KHO bootmem regions in bytes, or 0 when KHO is
+    disabled.
+
+See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
+
 debugfs Interfaces
 ==================
 
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index ef2b188c8ed0..736d51e79fd2 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -40,6 +40,7 @@ void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t bootmem_phys,
 		  u64 bootmem_len);
 
 bool kho_bootmem_overlap(phys_addr_t phys, size_t size);
+phys_addr_t kho_bootmem_size(void);
 
 static inline enum migratetype kho_bootmem_migratetype(unsigned long pfn,
 						       enum migratetype mt)
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index f4a31565c447..ed105e6351eb 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/kexec.h>
+#include <linux/kexec_handover.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
@@ -1324,6 +1325,15 @@ static struct kobj_attribute crash_elfcorehdr_size_attr = __ATTR_RO(crash_elfcor
 #endif /* CONFIG_CRASH_HOTPLUG */
 #endif /* CONFIG_CRASH_DUMP */
 
+#ifdef CONFIG_KEXEC_HANDOVER
+static ssize_t kho_bootmem_size_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)kho_bootmem_size());
+}
+static struct kobj_attribute kho_bootmem_size_attr = __ATTR_RO(kho_bootmem_size);
+#endif
+
 static struct attribute *kexec_attrs[] = {
 	&loaded_attr.attr,
 #ifdef CONFIG_CRASH_DUMP
@@ -1335,6 +1345,9 @@ static struct attribute *kexec_attrs[] = {
 #ifdef CONFIG_CRASH_HOTPLUG
 	&crash_elfcorehdr_size_attr.attr,
 #endif
+#endif
+#ifdef CONFIG_KEXEC_HANDOVER
+	&kho_bootmem_size_attr.attr,
 #endif
 	NULL
 };
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 3046b89e5db4..21d77e29d2bb 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -942,6 +942,21 @@ static void __init kho_reserve_bootmem(void)
 	kho_enable = false;
 }
 
+phys_addr_t kho_bootmem_size(void)
+{
+	phys_addr_t size = 0;
+	unsigned int i;
+
+	/* kho_init() can disable KHO without clearing kho_bootmem_cnt. */
+	if (!kho_enable)
+		return 0;
+
+	for (i = 0; i < kho_bootmem_cnt; i++)
+		size += kho_bootmem[i].size;
+
+	return size;
+}
+
 /*
  * Look for free blocks of 1G. This is a heuristic chosen to work efficiently
  * with large systems with hundreds of gigabytes of memory. It will work poorly
-- 
2.54.0


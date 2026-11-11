Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438872;
	b=u+CQ0i27pn0ts7S4fYqGuIsU8Qw0HBgbHfDZEf0niZ9tk/pVTUFDhHjj2hf03s1IOSiH
	 66iMvfceK1wOV/aF07ptmmmTdLBlarR19c3rb9XNq9DIYY9QoZuRz2kVwAhi55WY4K/1k
	 ct+yA6PMz6wxf2RfK/sbT1aNZqdTBNyCMDVNfI6nuVi7xqIDwTeYLqfypTVIXYnCpw/9V
	 a3gUJTIC4S+Zxf1U93RC0Y42xNfJroY+nTxFBkxYYuElsKwWKTxI8cO+wk+4qG+X5FfyY
	 8VSJ1PxApm0F7Ii4VDL6Zy+tcZwBdEkzRsOOeOcyFKOPB0HXHHkex+4fH6v/s5G8T2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DVdMMVnHovVouauLZSJMD6AHtT5aNNb/DqiljF977ik=;
	b=hAgnVmWQV+FalOoddtNdHN8lIWBGJHtnzRtTnNAMbyTXf2M/Xrb/kXwo9IoUmL/fuYIq
	 NVyR4K4oBC6IVXak7Q8k2hxKe15IGmO5oHIvMD7kwujkAnklKnlWbS7/3Mu9LxoByrCf1
	 HqpwkU48duQbjy4OVpdWW59WHXhKGco89QztsBRAWCTuH/ht2Wq6W6wYZV3nJUwpoQYxZ
	 ujN/6nvgcYw+xNx+iORpLOZpK+KVT5kz2SeC+RWkSmoZVfsB62lEEflzqN8KAJxN8Tc9n
	 aNgjFhOWTJQm8wER3GBkxbD7paelu7wNp7P6LmLeJYFeRXZ8KBGxt+b6BnbehpQNcDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kvS0zyNs;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B02606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 23:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B02606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kvS0zyNs
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so1218822137.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 15:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794438866; x=1795043666; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DVdMMVnHovVouauLZSJMD6AHtT5aNNb/DqiljF977ik=;
        b=kvS0zyNsproPmuwYK8MWJrWagwCI5gmQVIM8I77DyxzoKRCEVr74LTy06oE9xrvhQM
         A7I34wabPoA7Sd4vcWNCcTzJjpKya+viMI7eHt7LdyJnWEfM+i4EKYCc+nOxM2kszh16
         WXSUzesEiKPj/Vu86sC1ubMblHw7SICF0tA2j3PSrjUq7HLgsVnupJFDiurRnlwxBkFT
         wrN8ayxpTXyKTRbxy7GkKNXyYYGrLQ62JIiZVr/6a6Vuy86vTJG3mjHrIJPZVvVrLK3J
         7egRtcPqTRC4T+JK0YAPq22nJHpHXClMDwLxsK26QPbjJDlppFqm9L7tht8/eZ5V1ch7
         cBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794438866; x=1795043666;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVdMMVnHovVouauLZSJMD6AHtT5aNNb/DqiljF977ik=;
        b=R20HaBR+CkbTRMYiA2TbkRfzC2Vg/TtO1C8KSv5V9DA3lMh7voDj3E5Yl7x8x5hMDT
         ncACsGC0TCTgpc1pdZ74M2p9zAwOQLrSrLTv0FEiJ2oqqEmpNSWksL2Ycvr/se/yaxHU
         ImhTUTL7geDbabBSrW3k8IYWlHrWXuM6fbrnwGezNV8+2U8xSLcSlpztWecvBNbEzt/n
         FWr9qvNDxEUi4dxr8chQ18WCOYga9+dszeVuUVkO9qjDREG/4U51/nppma0WFAUj2gN3
         nfWdMR/9KzNFsK3Vfg4XQLEerH0VLtNAKt+xXIeiXiklKtXlXe4gmd8K507B9RKMf+u1
         Uz4A==
X-Forwarded-Encrypted: i=1; AL+hErEJh3Sp9Da/u4FXnVzNxnG1hf+T4KMNftaHDM4l7SUOiFR95tmdc4t0aLM+ln8KOrIJNmw+AJaHzPnLH1LPfco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YHwo9GO0YPtR4njjFHtIKmZ/djsEMgrCePiPouBr3ugTt8bIm
	EcIu7xRDRnvLEJOalFZuZ3Zb7egh7qhZ9tKYWkh8y2l/Cie2JJBUwZaiagjF57Ovi4k=
X-Gm-Gg: AYBFou1GVAuxZdei5g9KqgctSU9+sAEIPtd5FfvmfOLX1QHJr4v/TFLCBQCEwgJDOsn
	hk6UZpupdt0YUU2jhr4IJvB5rWmb5rpI+GHx4MBZVW79XStDMEVJXXqeA4Hw1cYuRznk589AtBN
	Su1cXwJ8s+S9b9hAjZ6eT62Es4p21H+XiDZzk0cQTKOsnuwPwnWxKSxQDJ7TX6g/KnVPH7U+uT/
	drqv5s9dtm+29f4YBqjaSOEYGl2mZWEvzAEaEISQb3N4d8yhJfLnGAA8CghQOdwvIswaHyxLCX9
	Hh7pHFPzzJrNpKtPCSgrqJe8zqNy6p+RpdlV2pcV+SHgwKydY0WHkM/uJRf2b5RedSTweuuXaQK
	zKkLmRt3x7yJNOqNVXtyzP/AbUvuStZOEurQIfVFhgzQ3K8oxsgV1z49Yiv6drGKQHCoj0w9b3W
	CxowpjI/eefbC6kyu3jHwXETk9RCrTJJDr6LXdDherkf0TGetGaT7nYw9LZMg57GrzRq16yNb+M
	F3bPT+5ECBHMCWB8nsVOzFnQTVuB0YnN0Ue9sTe8DO/cSaxtIO4wGPVaCHJJrAM4qzZINpJiHnb
	vLeTV/gMK+ZA47AdacjUa5mtH9F2HrQhcUXZpH6A5ZuDSW4vdTnSrldB2WDlR6P2g7XZv1f7KWp
	CskGFJTwlikiYMMpok/+jjhE28eA+2k6d6EdQ6iQB0jcY
X-Received: by 2002:a05:6102:5126:b0:7d2:7377:32db with SMTP id ada2fe7eead31-7d5060a7703mr1403477137.24.1794438865829;
        Wed, 11 Nov 2026 15:14:25 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c22302403sm4344200241.10.2026.11.11.15.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:14:25 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
 monitoring
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@meta.com
In-Reply-To: <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
 <c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
Date: Wed, 11 Nov 2026 18:14:22 -0500
Message-Id: <179443886218.2329176.10742245280418377061.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=9scWIMT8bcH1hJE5tzuaZbvTMzuuUTRWsydhjCoHQQ8=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq9PbPj7WdaeKNG/W4QNGLva9/0FB58zcLhfiDz
 D1uxgEKxc2JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavT2zwAKCRC7dyhM23N6
 3lFzEACWzSLOLHD1CYufzDO7hpK/ihqAdc830DtEx9ApghbfTfc1chnrI57/Wp2D9h7buNVVH45
 vnopS5ouz/fz6MCr1CLzZSlDrGgLZR5dCamAyBUTezBztIbRa8TcuC96hhwyPFxjLEdLW+NKjkp
 /qgGjQVOh7kd1VSE0obnNl+tVRoNL6cznEf+LKlobs40aMr6EqkNL654Zl9rdx1w9jor1+dj6nU
 SVEH/8uk2nvb6CFV70dA+aWyqVVWOJ2J6KtdOpTZPFofGAdDfeAhj7vyOPmcRUjvLjs/0rjq6yL
 B1PRB/UrzDRXrEwBO3Tx1t/T2M+v1u5MME0yEVugXvjpvWPFMLdZoGZmv0M42/e9uS6gjD3/9kp
 qwKDfUjqZpnelcj92WBqr5oycg1c9RqKoc+fqMyXJUcrZI1UAvnwEPzku4mXigZPnlq1RVnH66u
 /hCOahaJCjJObbeQzwGGNF/jlZMU1LPHOn8hryQG2VdTv0LdwyGH3wAoFY7dwMotlsBN3fiiaq5
 gLTvD+Ylxp9lmXxm7K1sivMmR5vGkUcohFKJ+kmiBYDPvL5R04L8owhQQiJuZe4i012L1tGFk99
 06tbJ14sWZItiw1bysAP3Gh/qrXB6ycrzrN45vbpceX0VcALyQPyEsYouSwcnWC/IZqDo6Cakcz
 8R+Ei1KWFz4evKA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> We want to use live update at Meta to upgrade hypervisors whose VMs
> can't be migrated away first. But this poses a problem: whether we can

Awesome.

> enable KHO on a class of host depends on how much memory it leaves
> available for unmovable allocations. In an early test, a 64 GiB host
> with hugetlb_cma=6G set aside about 30 GiB of bootmem, which the running
> kernel can only use for movable allocations.
> 
> The reservation varies with the kernel, memory size, NUMA layout and
> command line. Our fleet collector needs the actual size from each host
> so we can decide where to enable KHO and catch a kernel release that
> takes those hosts over their bootmem budget.

HM, that works for cold boot not for live update :-)

> 
> Today the collector would have to sum kho/out/bootmem_len in debugfs,
> which isn't a userspace ABI. In /proc/meminfo, free bootmem contributes
> to CmaFree, but the reservation doesn't contribute to CmaTotal. The cma

Is this a different bug?

> count in /proc/zoneinfo includes bootmem after a cold boot but not after
> a KHO kexec. On an 8 GiB QEMU guest booted with
> kho_bootmem=32M,1536M,512M:
> 
>                 CmaTotal  CmaFree     zoneinfo cma (all zones)
>     cold boot   0 kB      2127872 kB  2129920 kB
>     KHO kexec   0 kB       881336 kB  0 kB
> 
> Even if bootmem becomes a CMA area, CmaTotal will still include other
> areas such as hugetlb CMA, so inferring the bootmem size is still
> error-prone.
> 
> Let's report the total bootmem reservation in bytes at
> /sys/kernel/kexec/kho_bootmem_size.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> index f59051b5d96d..80941a7d8a7c 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> @@ -59,3 +59,11 @@ Description:	read only
>  		to the crash (kdump) kernel. It lists the start and end physical
>  		addresses of CMA regions assigned for crashkernel use.
>  User:		kdump service
> +
> +What:		/sys/kernel/kexec/kho_bootmem_size

I have some concerns about exposing this as a stable API. What if we get 
rid of bootmem or make it resizable? We only recently renamed it from 
scratch to bootmem, and we have been exploring for way to optimize it.

I would keep this exposed under /sys/kernel/debug/kho/bootmem_size for 
now, and not worry about it being stable.

> +Date:		Nov 2026
> +Contact:	kexec@lists.infradead.org
> +Description:	read only
> +		Total size of the KHO bootmem regions in bytes. Returns 0
> +		when KHO is disabled.
> +User:		system monitoring
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
> index f9d2cc5999ee..c329d720bf25 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -81,6 +81,15 @@ At scale, correlating crashes to the previous kernel version enables
>  faster root cause analysis when issues only occur in specific kernel
>  transition scenarios.
>  
> +sysfs Interfaces
> +================
> +
> +``/sys/kernel/kexec/kho_bootmem_size``
> +    Total size of the KHO bootmem regions in bytes, or 0 when KHO is
> +    disabled.
> +
> +See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
> +
>  debugfs Interfaces
>  ==================
>  
> diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
> index ef2b188c8ed0..736d51e79fd2 100644
> --- a/include/linux/kexec_handover.h
> +++ b/include/linux/kexec_handover.h
> @@ -40,6 +40,7 @@ void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t bootmem_phys,
>  		  u64 bootmem_len);
>  
>  bool kho_bootmem_overlap(phys_addr_t phys, size_t size);
> +phys_addr_t kho_bootmem_size(void);
>  
>  static inline enum migratetype kho_bootmem_migratetype(unsigned long pfn,
>  						       enum migratetype mt)
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index f4a31565c447..ed105e6351eb 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -13,6 +13,7 @@
>  #include <linux/slab.h>
>  #include <linux/fs.h>
>  #include <linux/kexec.h>
> +#include <linux/kexec_handover.h>
>  #include <linux/mutex.h>
>  #include <linux/list.h>
>  #include <linux/liveupdate.h>
> @@ -1324,6 +1325,15 @@ static struct kobj_attribute crash_elfcorehdr_size_attr = __ATTR_RO(crash_elfcor
>  #endif /* CONFIG_CRASH_HOTPLUG */
>  #endif /* CONFIG_CRASH_DUMP */
>  
> +#ifdef CONFIG_KEXEC_HANDOVER
> +static ssize_t kho_bootmem_size_show(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%llu\n", (unsigned long long)kho_bootmem_size());
> +}
> +static struct kobj_attribute kho_bootmem_size_attr = __ATTR_RO(kho_bootmem_size);
> +#endif

Keeping it together with the rest of KHO code would be better.

-- 
Pasha


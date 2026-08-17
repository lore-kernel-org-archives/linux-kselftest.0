Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571D3C279B;
	Mon, 17 Aug 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004473; cv=none; b=rHL9QvnWf1UhlgrzDtheaccVVeGtvrxNuTaZb45D9sJlm/tugEFz+wvPo33xpAZbl6h3mv0DRBOd0kUq1syvL8bobXqoOPM9G1w3iZPSglcY6hKPWqiIZolQg1boN/9e2Z1LAptIZx4NAmAQuL2MbVcR9JqoGg79+BT/QbVG9DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004473; c=relaxed/simple;
	bh=l2YUCWLI7OhQk6XpEGFmwp7rK3hYzpHyZpLRdGbdOjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niJsaJ7cguTNQrcxo+ACYFLrhdpZwxBZ7ioWqe/W0XDCJwPMo2tzpG2Bn3zrYByeShtPtmI53/Erc+D/sHxN/vm3nVcHTsUh9pDeVtVCXtTLn9SyaIEpQzGT6grAIdbonZJlntB717o1MyheHJVZuGijxTXu0Jd15vezDdnnbDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgpSn8CY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgpSn8CY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4E51F000E9;
	Mon, 17 Aug 2026 22:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787004472;
	bh=GmmIfh8c/8Lo9aj78fk3ufRovlVowXNbcmbUtWRPK7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgpSn8CYUzY/jaGbrTvIb0JtGh7s3QwiHtz+c4j6WxH7ZWIZj3K6ylFkViMYpKV6D
	 XHw7Ga0i6WWDQyfOgIDuLWDwivBNa0lwUiDEp1B92dT7I6sDVMT2TV2PXjD7UUmopK
	 Tv4JkdWtBoUrYHook6fzy4avdseLFCY9/hbruZylwWTpP+/iIJMXIgA0eUR1b2noUF
	 ow8hbbPPzPm8UvwDi/qz4lXZvStQ2zFERqsCK1LM7fdovzw/FMY/LNdl3bmlEuW761
	 uVfBzrfW9OGaPPABCDQY81gw6K7EkYYofwrZQ5NSFs6GJEIj4AIvB9PCCy4ZS7lxlR
	 26cy3SVZBS6ng==
Date: Mon, 17 Aug 2026 17:07:50 -0500
From: Rob Herring <robh@kernel.org>
To: KobaK <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <20260817220750.GB2274565-robh@kernel.org>
References: <20260817022335.3-1-kobak@nvidia.com>
 <20260817022335.3-2-kobak@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817022335.3-2-kobak@nvidia.com>

On Mon, Aug 17, 2026 at 10:23:33AM +0800, KobaK wrote:
> From: Koba Ko <kobak@nvidia.com>
> 
> Performance characterization on arm64 systems sometimes needs a way to
> inspect and bracket selected implementation-defined prefetch and cache
> controls without exposing raw register contents. Add an RFC-only arm64
> cpumod interface that presents a small set of named, range-checked
> per-CPU sysfs attributes under each CPU device.
> 
> Establish the Kconfig and Makefile plumbing, CPU profile detection for
> Grace and Vera from the target CPU's MIDR, register-field descriptors,
> per-CPU kobject and attribute helpers, locking, and target-CPU read/write
> callbacks. Common attributes are exposed for all supported profiles,
> while Grace- and Vera-specific fields are exposed only for the matching
> profile. Place the option at the end of the top-level Kernel Features
> menu because these implementation controls are not tied to an Arm
> architecture revision.
> 
> Per-CPU cpumod sysfs state follows the CPU lifecycle. Module
> initialization populates subtrees for every online CPU while holding
> cpus_read_lock(), so initial enumeration and CPU hotplug state
> registration are serialized against concurrent topology changes. Offline
> CPUs are intentionally skipped during initial setup because target-CPU
> MIDR detection requires an IPI-capable online CPU; a later online callback
> creates their subtree.
> 
> Profile detection reads MIDR through a synchronous callback on the CPU
> owning the sysfs subtree and returns nonzero only when that dispatch
> fails, so no IPI error can be hidden. After a successful read, retain
> CPUMOD_PROFILE_UNKNOWN as the unsupported-profile sentinel. Subtree
> creation skips that profile during both initial online enumeration and
> later CPUHP online callbacks without blocking module load or CPU hotplug.
> Object and sysfs setup failures remain fatal and are propagated.
> 
> Keep the dynamically allocated kobject state in a private per-CPU pointer
> instead of the CPU device's generic driver-data slot. The online callback
> is idempotent when that pointer already records a subtree. The offline
> callback clears the private pointer before dropping the kobject reference,
> allowing the release callback to retain ownership of the final free.
> 
> Register the dynamic CPUHP state with
> cpuhp_setup_state_nocalls_cpuslocked(). The nocalls form avoids replaying
> startup callbacks for CPUs already initialized by the explicit online
> enumeration. On init failure, release the CPU read lock, destroy all
> subtrees created so far, and return the error. Module exit removes the
> CPUHP state with the matching nocalls helper and tears down all remaining
> per-CPU state across possible CPUs.
> 
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Tushar Dave <tdave@nvidia.com>
> Reviewed-by: Kai-Heng Feng <kaihengf@nvidia.com>
> Signed-off-by: Koba Ko <kobak@nvidia.com>
> ---
>  arch/arm64/Kconfig                      |  17 +
>  arch/arm64/kernel/Makefile              |   1 +
>  arch/arm64/kernel/arm_cpumod.c          | 471 ++++++++++++++++++++++++
>  arch/arm64/kernel/arm_cpumod_internal.h | 113 ++++++
>  4 files changed, 602 insertions(+)
>  create mode 100644 arch/arm64/kernel/arm_cpumod.c
>  create mode 100644 arch/arm64/kernel/arm_cpumod_internal.h
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919b..5e4ada4884b89 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2417,6 +2417,23 @@ config ARM64_CONTPTE
>  	  bit, for any mappings that meet the size and alignment requirements.
>  	  This reduces TLB pressure and improves performance.
>  
> +config ARM64_CPUMOD
> +	tristate "Arm CPU prefetch modulation sysfs controls"
> +	help
> +	  Expose selected CPU implementation control register fields through
> +	  per-CPU sysfs attributes for performance characterization.
> +
> +	  The exposed controls allow hardware prefetch and cache-management
> +	  policy fields to be inspected and adjusted on CPUs where firmware
> +	  permits EL1 access to the relevant implementation control registers.
> +	  Systems where firmware traps or blocks these writes cannot use this
> +	  interface.
> +
> +	  This interface is intended for controlled performance evaluation and
> +	  should not be enabled by default on production systems.
> +
> +	  If unsure, say N.
> +
>  endmenu # "Kernel Features"
>  
>  menu "Boot options"
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index d2690c3ec5288..f180a52284e7d 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
>  obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
>  obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
>  obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
> +obj-$(CONFIG_ARM64_CPUMOD)		+= arm_cpumod.o
>  obj-$(CONFIG_ARM64_MTE)			+= mte.o
>  obj-y					+= vdso-wrap.o
>  obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
> diff --git a/arch/arm64/kernel/arm_cpumod.c b/arch/arm64/kernel/arm_cpumod.c
> new file mode 100644
> index 0000000000000..9e64f2c8e7810
> --- /dev/null
> +++ b/arch/arm64/kernel/arm_cpumod.c
> @@ -0,0 +1,471 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Since the introduction of this...

> +/*
> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.

We stopped putting license text in.

Before you go work on my comments, I'd wait for arm64 maintainers 
comments. I doubt this whole thing will be accepted. In general, we 
don't put in impdef interfaces to userspace.

Rob

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5F3D1A81;
	Tue, 29 Sep 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688589; cv=none; b=KHlcft8WZ0O2YZW0ORHY79yaCksEx1gXDwEHE5qJ2e/d9lttuPO+u3KydKzV9owxzPZN660ftYmKpYNdEovNC6WAceE6ew1KTUZBeqOIiz5BhEMuJ9AELaqT/9DG4MNJLMX0WBYZkVG9lbseWcgNVyB2ExkqPA3d9BX87MuSN4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688589; c=relaxed/simple;
	bh=HZgwz1Y/hFhq9nA+gMPfaBNF/fd6YuO6C1EGtIBtQ5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCExGU8acTsC1r2WI/MKeagjJW44/38KtsFCoJW8zOPq87lzBnhsX2aFgfh9iMyw4WRTwjcBeH7kwH7qLrUigdCT9SZvJ+IiAOmE5GryeC7TBw2ti+3qHtwO20iknr7A9TkecxklhijbYchPdELQJEE+2VWtk82yIpIAHPXSPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fK7JE+5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fK7JE+5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73511F000FF;
	Tue, 29 Sep 2026 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790688587;
	bh=tfN6V/0jpVSKj8us4BMTgHrYZ7PEZU7VE8KWI178lvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fK7JE+5kuq0ZqZon40ZtxqT4EpnKQlLh7t1CJdAzoeIfvZejJE8bwT7vPe/MR554B
	 bIsWpP8icPL5GBYilqRRS1vgu2VljQFBOnK8PTQ7GW8VcPFNgWqZgxjFByhk/8RyPZ
	 PRMjk8+IOw0KSNRXGUMSWyheKevBZccQXCj6XO4jwLs6w2XgzWvXr2DOtmTINuCd7w
	 uqPL7wrNhQgmfV6AyvdfS+wvPsDTW3rRcNcbvYagfR4RlRwXf96XixArGa70mqM8a6
	 4ZtZui5Yhdl8U5AQfZrqI6GkGAiWJYwFLWRDPLbt6rIu462kbvxOPg9FZ5irJ7vTUK
	 Jf832SwU2dFmg==
Date: Tue, 29 Sep 2026 14:29:41 +0100
From: Will Deacon <will@kernel.org>
To: Koba Ko <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com,
	mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <aru9Rf7BzW3-vcm0@willie-the-truck>
References: <20260825181701.3-1-kobak@nvidia.com>
 <20260825181701.3-2-kobak@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825181701.3-2-kobak@nvidia.com>

On Wed, Aug 26, 2026 at 02:16:59AM +0800, Koba Ko wrote:
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
> Register-backed controls are root-only read/write files. Reads
> synchronously execute on the target CPU and return the live register field
> value from that callback. Writes remain range-checked and continue to log
> the target-CPU readback after the register update.
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
>  arch/arm64/kernel/arm_cpumod.c          | 458 ++++++++++++++++++++++++
>  arch/arm64/kernel/arm_cpumod_internal.h |  93 +++++
>  4 files changed, 569 insertions(+)
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

We don't tend to support these sort of implementation-defined features
as:

   - They're generally not something we can virtualise
   - The registers should not be accessible to the kernel in production
   - It's not clear what other bits are exposed in the registers
   - These sort of controls can't always be toggled while the memory system
     is active
   - We can't test them or maintain the zoo of interfaces we'd end up with
     if we started merging them

So exposing the registers directly to userspace doesn't feel like a
particularly good idea to me.

Will

Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14817479873;
	Wed, 19 Aug 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151477; cv=none; b=pSmq16yBPkHVvfap1p5ivFtwtXaUWKwobyHcUK4Dv82lF9Tm7vH6foMy4qAldU/EF7b5br8QsLxGHdEkWCUTRWASdDgZTNR7W3mYgNNzfTU/Iut65HYXTsAt/bjxnIkHVYYh7BFaot4CfqGWJuX3rKBDuM1T5UmnkZUxAHiKl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151477; c=relaxed/simple;
	bh=Du4jOJSatLbjlA9GA6HlpramHmsokxRlIUKixfcF9gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Duv72+1dz324+7b9TgdUpLJ5GUR0qEg8R7ScF8IU00K2UPccpjnbLmu79Xe5je0gONINY6oRxKdyKtUswMygaJ93wM2hpA5ukI+bIaawJHAxwI2s7/UMZxm/Q1o9bA9b2pDc6BUshb5TugfYUixS+j3k1fTzrnvkKA1jb62yv/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=WwpFPVto; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="WwpFPVto"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dEhJftvJQJCTjrtFDW5w8o2vq636XhPrQnmBVoSdDG8=; b=WwpFPVtoi3/FrP852Z+KBYbFfS
	9/xiP6ovuQfbLqkz+VfujWELcMItOyYmXjn9x9njjNS1Rb3aeAgkjiRYOHJMC1KUehzDAuKoLUNWd
	NXIeaRpVcv2vJzhI/jvRgfSAUMHgP6F5vALMRoZ50lILH7aqh0D0lf5Olw6gSECtB2SVfOHsBEyws
	1b5ET+c7xgUf3NohcAiBPTqpZ6RpLwv2QnWXe34W/3f0GFo59KbLAHTyZn02/MvR3VBS09yltU2bn
	9Um7gT9SDDuk+SxTWspbvudVbENVgEJXrqV2xEjl8K6dYc8iB891cWhPGlwkd24x9WBYJWj/KYhDN
	zGvu5EDQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwhjU-009s14-2W;
	Wed, 19 Aug 2026 14:57:37 +0000
Date: Wed, 19 Aug 2026 07:57:31 -0700
From: Breno Leitao <leitao@debian.org>
To: KobaK <kobak@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Fenghua Yu <fenghuay@nvidia.com>, Tushar Dave <tdave@nvidia.com>, 
	Kai-Heng Feng <kaihengf@nvidia.com>, rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <aoXEBXXvTDBimnHi@gmail.com>
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
X-Debian-User: leitao

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

Tested-by: Breno Leitao <leitao@debian.org>


> +static struct cpumod_attr _name##_attr = {				\
> +	.kattr = __ATTR(_name, 0644, cpumod_attr_show, cpumod_attr_store), \
> +	.value_offset = offsetof(struct cpumod_subsys, _field),	\
> +	.reg = _reg,						\
> +	.shift = _shift,					\
> +	.field_mask = _field_mask,				\
> +	.max_value = _max_value,				\
> +	.debug_name = _debug_name,				\
> +	.visible_profiles = _visible_profiles,			\
> +}

0644 makes every one of these world-readable, and cpumod_attr_show()
is not a cheap read: it takes subsys->lock and then does a synchronous
smp_call_function_single() to the target CPU, whose callback executes
an implementation-defined mrs.

So any unprivileged user can pick a CPU and hold it under a steady
stream of IPIs just by reading the file in a loop. On a Grace box
running this series:

  # su -s /bin/sh nobody -c 'cat /sys/devices/system/cpu/cpu0/cpumod/pf_dis'
  0

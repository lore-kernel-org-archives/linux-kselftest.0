Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36630EF9A;
	Tue, 30 Jun 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782809016; cv=none; b=WLiBkLAKywa02Io069ZUz+cEEylvB94oOzChltYB0eAahss9YyDAFlbPg6mlTISNSavBB3XR/1AyRGPmwgpFlLAdakZbrYUXIg0PskIjGkZwCMIAyCHKIIRYxqfEdROolY2A9fyhypOiYv6FBxvIOPjz2K5uPjI7i44JdqGjgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782809016; c=relaxed/simple;
	bh=9sx7l64WGHsPkBboTe8uKvWo6a/EHJ2glwN/ZqCls/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVGVyys/Z3vkwhZcWI2bd4b/dzawbq1cpp7FC6j7sAFbecNBdIvQlquJtftYBJS4nM9un1nxxDaoM/yP+3Afao0p7ueBBpkt+t5fFlk7FreDGKwbtjwbDCa7+3k+7f9z7Akfv3thryINXIM/3tLjJjAAjHFiQ26pBpWKyP/1k+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=GveY/WIM; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="GveY/WIM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/gW6w8U/WCaarQjB+76b8mzfBR2xiHvXJCYHZYl81Qo=; b=GveY/WIMBM8ZWTvFxQvsy/zTA0
	lcj9zY+LDuBKIgTx+xf1B+fKVQVueeKtm94MicTrcwxB0HQxqdn1hUlQBm6Sj4zqDfOsDFByPzmGb
	ypZI2zV7mvNZHVs40RrGlJHkV2BUABJmL5vgYuxShmZlmJnyMZVxJW5fRbYAjOlQ868D6n5iWi24D
	Tn0fdQMaMq1t0ueVkIfpMRCZh1ivTEpY8yc4VoYLsr1uB0B9wCfICVWCHVwWMPpZ01ulJVEADgEBt
	bjqLFfDzbPS+bwdpZbSlYO3HbpAn1TEaoazTfKJ6RSW9iNhCXhXUeQ75wSDFY3rPWzER/0gfKI5SU
	6Da3o0cg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1weU3u-006wWk-0w;
	Tue, 30 Jun 2026 08:43:22 +0000
Date: Tue, 30 Jun 2026 01:43:16 -0700
From: Breno Leitao <leitao@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Liam R. Howlett" <liam@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] mm/kmemleak: dedupe verbose scan output by
 allocation backtrace
Message-ID: <akOAzZkWRzQtIeyI@gmail.com>
References: <20260506-kmemleak_dedup-v3-0-2d36aafc34da@debian.org>
 <20260506-kmemleak_dedup-v3-1-2d36aafc34da@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-kmemleak_dedup-v3-1-2d36aafc34da@debian.org>
X-Debian-User: leitao

On Wed, May 06, 2026 at 05:58:24AM -0700, Breno Leitao wrote:
> Dedupe within each scan using stackdepot's trace_handle as the key: for
> every leaked object with a recorded stack trace, look up the
> representative kmemleak_object in a per-scan xarray keyed by
> trace_handle.

Just to circle back to this patch that now it is upstream and deployed to
production.

I've got this feature enabled in Meta's kernel "debug" tier (which runs with
kmemleak enabled), and this is being very helpful. For instance, this is the
kmemleak reports (instead of 330 similar reports).

         kmemleak: unreferenced object 0xffff0000c3b5ca00 (size 96):
           kmemleak:   comm "swapper/0", pid 1, jiffies 4294748185
           kmemleak:   backtrace (crc 22d8f576):
           kmemleak:     kmemleak_alloc+0x3c/0xc8
           kmemleak:     __kmalloc_node_noprof+0x42c/0x7c0
           kmemleak:     __alloc+0x160/0x3a8
           kmemleak:     alloc_bulk+0x3d8/0x7b0
           kmemleak:     bpf_mem_alloc_init+0x3f8/0xd48
           kmemleak:     cpumask_kfunc_init+0x88/0x158
           kmemleak:     __initstub__kmod_cpumask__654_534_cpumask_kfunc_init7+0x14/0x28
           kmemleak:     do_one_initcall+0xe0/0x9f8
           kmemleak:     do_initcall_level+0x12c/0x1d0
           kmemleak:     do_initcalls+0x60/0x108
           kmemleak:     do_basic_setup+0x80/0x98
           kmemleak:     kernel_init_freeable+0x280/0x400
           kmemleak:     kernel_init+0x24/0x170
           kmemleak:     ret_from_fork+0x10/0x20
           kmemleak:   ... and 1 more object(s) with the same backtrace
           kmemleak: unreferenced object 0xffff0000c3b57080 (size 96):
           kmemleak:   comm "hardirq", pid 0, jiffies 4298468258
           kmemleak:   backtrace (crc 85619951):
           kmemleak:     kmemleak_alloc+0x3c/0xc8
           kmemleak:     __kmalloc_node_noprof+0x42c/0x7c0
           kmemleak:     __alloc+0x160/0x3a8
           kmemleak:     alloc_bulk+0x3d8/0x7b0
           kmemleak:     bpf_mem_refill+0xb4/0x8a0
           kmemleak:     irq_work_single+0x9c/0x178
           kmemleak:     irq_work_run+0x12c/0x208
           kmemleak:     ipi_handler+0x1cc/0x900
           kmemleak:     handle_percpu_devid_irq+0x3bc/0x4f8
           kmemleak:     generic_handle_domain_irq+0xa0/0x100
           kmemleak:     gic_handle_irq+0x364/0x688
           kmemleak:   ... and 331 more object(s) with the same backtrace

I've haven't investigate the leak itself, and that is not the reason of this
email, it is just to share that this is being quite useful at real production
environments.

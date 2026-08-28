Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCA439891E
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787946806; cv=none; b=K7gf1M57UKMUM1cAvjvf7jPpGtlF/gs1rStq8f+dbETQ2YOYkjmHsSXUFDiIfDySRMXbOG3yrOqyhnr9C2c+Db7TV4K0jTeIKqdbFwDEZhVgkQLTk8B1gaVzoC7tkTpWa3KhV3bkpZIWVKI/MyO8py/R/DrQ6MtdLIZxXC/jxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787946806; c=relaxed/simple;
	bh=2DsvoO8trPann3gGlgHfEvV8zzD6F/Yb3aERd3YdNwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+EPZ05Kx0N1eB3ZIuYuu1lE4np58YIpJT3dsdKgnmyFh97oQgLDd8vweClakmq8CYt/LUaEMaKT1EoGJrgtduvo6QL5xvOuFM22eKfhIpEqAkzWybHrFJ+AGidSanOTNfhmzWbzdqPPisrzrVTYug+QIXurPNuXsyVEP3EV2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eVza7e58; arc=none smtp.client-ip=91.218.175.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eVza7e58"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2DsvoO8trPann3gGlgHfEvV8zzD6F/Yb3aERd3YdNwY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787946801; v=1; x=1788551601;
 b=eVza7e58vsCYz6nTeSUGSC0tDD2EiRtk3eLY2ekL7Hmt60HFR7XCaVkd7DBKy64F3qBKqrhF
 dgwRDueTFjDD/CPdw3Vxnbrb4ImP202YwGftcCsRsTjUvIlprG4ccoxR6ft8WapGQatdUPeNZEK
 ImClpGQJEKqZgkyjMvRUrqbY=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da07200143d5a7cf;
	Fri, 28 Aug 2026 19:53:20 +0000
X-Mizu-Trace-ID: da07200143d5a7cf
X-Migadu-Flow: FLOW_OUT
Date: Fri, 28 Aug 2026 12:53:19 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, 
	JP Kobryn <inwardvessel@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, Barry Song <baohua@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Subject: Re: [PATCH bpf-next v5 1/2] mm/bpf: Add bpf_proactive_reclaim kfunc
Message-ID: <apHk86Y8araBlXcq@linux.dev>
References: <cover.1787826402.git.zhuhui@kylinos.cn>
 <5dfdc7800469eac4e9a240f2422ba65d4ef4c4ba.1787826402.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5dfdc7800469eac4e9a240f2422ba65d4ef4c4ba.1787826402.git.zhuhui@kylinos.cn>

On Thu, Aug 27, 2026 at 06:36:29PM +0800, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> Add bpf_proactive_reclaim(), a sleepable kfunc which performs one
> proactive reclaim pass on a given memory cgroup, similar to a write
> to memory.reclaim but without retrying until the target is reached.
> 
> The kfunc refuses to reclaim if the calling task is already in a
> reclaim context, as a nested reclaim would corrupt the outer reclaim
> state.
> 
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> ---
>  mm/bpf_memcontrol.c | 46 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/mm/bpf_memcontrol.c b/mm/bpf_memcontrol.c
> index 716df49d7647..297ff7f05042 100644
> --- a/mm/bpf_memcontrol.c
> +++ b/mm/bpf_memcontrol.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/memcontrol.h>
> +#include <linux/swap.h>
>  #include <linux/bpf.h>
>  
>  __bpf_kfunc_start_defs();
> @@ -159,6 +160,49 @@ __bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
>  	mem_cgroup_flush_stats(memcg);
>  }
>  
> +/*
> + * Reclaim must not recurse: try_to_free_mem_cgroup_pages() overwrites
> + * current->reclaim_state, so a nested call would corrupt the outer
> + * reclaim state. Reclaim windows are marked with PF_MEMALLOC;
> + * reclaim_state is also checked because it is installed slightly
> + * before PF_MEMALLOC.
> + */
> +static bool bpf_in_reclaim_context(void)
> +{
> +	return (current->flags & PF_MEMALLOC) || current->reclaim_state;
> +}
> +
> +/**
> + * bpf_proactive_reclaim - proactively reclaim memory from a memory
> + *                         cgroup
> + * @memcg: the target memory cgroup to reclaim from
> + * @size:  the amount of memory to reclaim, in bytes
> + *
> + * Trigger one proactive reclaim pass on @memcg, similar to a write to
> + * memory.reclaim, but without retrying until @size is reached.
> + * Must not be called with a filesystem lock held: the reclaim path
> + * may deadlock on it via filesystem shrinkers.
> + *
> + * Return: The amount of memory reclaimed, in bytes, or 0 if @size is
> + * smaller than a page or the task is already in a reclaim context.
> + */
> +__bpf_kfunc unsigned long bpf_proactive_reclaim(struct mem_cgroup *memcg,
> +						unsigned long size)
> +{
> +	unsigned long nr_reclaimed;
> +
> +	if (size < PAGE_SIZE || unlikely(bpf_in_reclaim_context()))
> +		return 0;

I have been thinking about this more and more and after looking at the reasoning
behind your check current->reclaim_state and also Sashiko's comment on NOIO/NOFS
contexts, I am more convinced that this kfunc can not be a simple sleepable
function. We need more than that. We need clean process context as well similar
to the userspace poking memory.reclaim. Something like kthread or workqueue.

Kumar & Andrii, is there a way to restrict a kfunc to only be called from
special BPF threads/workqueues? Is there some similar concept in BPF world?



> +
> +	nr_reclaimed = try_to_free_mem_cgroup_pages(memcg, size / PAGE_SIZE,
> +						    GFP_KERNEL,
> +						    MEMCG_RECLAIM_MAY_SWAP |
> +						    MEMCG_RECLAIM_PROACTIVE,
> +						    NULL);
> +
> +	return nr_reclaimed * PAGE_SIZE;
> +}
> +
>  __bpf_kfunc_end_defs();
>  
>  BTF_KFUNCS_START(bpf_memcontrol_kfuncs)
> @@ -172,6 +216,8 @@ BTF_ID_FLAGS(func, bpf_mem_cgroup_usage)
>  BTF_ID_FLAGS(func, bpf_mem_cgroup_page_state)
>  BTF_ID_FLAGS(func, bpf_mem_cgroup_flush_stats, KF_SLEEPABLE)
>  
> +BTF_ID_FLAGS(func, bpf_proactive_reclaim, KF_SLEEPABLE)
> +
>  BTF_KFUNCS_END(bpf_memcontrol_kfuncs)
>  
>  static const struct btf_kfunc_id_set bpf_memcontrol_kfunc_set = {
> -- 
> 2.53.0
> 

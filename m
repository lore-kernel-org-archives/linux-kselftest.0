Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2613C1991;
	Fri, 24 Apr 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032328; cv=none; b=fqGG86Qyt6GjPDrP6mKJQgr/EFJ2lJpD2gjUFKifV7peLYIsCnRqykphMSkPmGGUKBfiEJ/oNWmgqRtkWgjrLQYkNcuf2W0S1LiojzOSRvQMDaDonwoMoZAqNCCsVVVh1/51F4yYxQeRJgduLhI1KaakMOnZcIPW+wUopDSxaxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032328; c=relaxed/simple;
	bh=ZX0Gk8ZXhQfYmfd0QPEkV0r5QjqKFEBtavYYnWGlGwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaFcd/ouxlnz8FQ6ZJxUGhv2x3SdXNYEJLVMqlWzVzNrUs62rMwW5k+uCARKxigJLyrXd6I+SzODomf2ZAlR8aGIcvm2z9mRobBLFpt79rZjEBdZbw1zDOQ+Y228a6ILu9rZmSoV9YSQDJVdkxXra9V6+36Dn2njO5Tw4+Z3K2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iUnghvZg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iUnghvZg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 746F31BA8;
	Fri, 24 Apr 2026 05:05:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 288FF3F641;
	Fri, 24 Apr 2026 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777032325; bh=ZX0Gk8ZXhQfYmfd0QPEkV0r5QjqKFEBtavYYnWGlGwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUnghvZg4F5GF19O8nsZ8aWARvil/vxjb6twmWwcuKOzCZErwJNqshbtD2FCc+QBH
	 F2xOfl3YbiUWeKuqaL/AuAUOHURDX7RlxZMLMyhFQdW077RDxZ57WXfu/6sob5q7ka
	 vJ0UeX/aH+eDu0BIep0FzblGysOW/jjSJudv7b88=
Date: Fri, 24 Apr 2026 13:05:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/kmemleak: dedupe verbose scan output by
 allocation backtrace
Message-ID: <aetcgHhBXfPe6lr1@arm.com>
References: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
 <20260421-kmemleak_dedup-v1-1-65e31c6cdf0c@debian.org>
 <aeostKcaHzmVBFjb@arm.com>
 <aesymSWyh8NRIrDQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aesymSWyh8NRIrDQ@gmail.com>

On Fri, Apr 24, 2026 at 02:26:53AM -0700, Breno Leitao wrote:
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 2eff0d6b622b6..d521cc71ec1ee 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -92,6 +92,7 @@
>  #include <linux/nodemask.h>
>  #include <linux/mm.h>
>  #include <linux/workqueue.h>
> +#include <linux/xarray.h>
>  #include <linux/crc32.h>
>  
>  #include <asm/sections.h>
> @@ -153,6 +154,8 @@ struct kmemleak_object {
>  	/* checksum for detecting modified objects */
>  	u32 checksum;
>  	depot_stack_handle_t trace_handle;
> +	/* per-scan dedup count, valid only while in scan-local dedup xarray */
> +	unsigned int dup_count;

I would add this around the pid_t pid member since both are 32-bit,
better struct compaction. Here we'll get 32-bit padding.

>  	/* memory ranges to be scanned inside an object (empty for all) */
>  	struct hlist_head area_list;
>  	unsigned long jiffies;		/* creation timestamp */
> @@ -360,8 +363,9 @@ static const char *__object_type_str(struct kmemleak_object *object)
>   * Printing of the unreferenced objects information to the seq file. The
>   * print_unreferenced function must be called with the object->lock held.
>   */
> -static void print_unreferenced(struct seq_file *seq,
> -			       struct kmemleak_object *object)
> +static void __print_unreferenced(struct seq_file *seq,
> +				 struct kmemleak_object *object,
> +				 bool no_hex_dump)
>  {
>  	int i;
>  	unsigned long *entries;
> @@ -373,7 +377,8 @@ static void print_unreferenced(struct seq_file *seq,
>  			   object->pointer, object->size);
>  	warn_or_seq_printf(seq, "  comm \"%s\", pid %d, jiffies %lu\n",
>  			   object->comm, object->pid, object->jiffies);
> -	hex_dump_object(seq, object);
> +	if (!no_hex_dump)
> +		hex_dump_object(seq, object);

Nit: just use "hex_dump" and avoid double negation.

>  	warn_or_seq_printf(seq, "  backtrace (crc %x):\n", object->checksum);
>  
>  	for (i = 0; i < nr_entries; i++) {
> @@ -382,6 +387,12 @@ static void print_unreferenced(struct seq_file *seq,
>  	}
>  }
>  
> +static void print_unreferenced(struct seq_file *seq,
> +			       struct kmemleak_object *object)
> +{
> +	__print_unreferenced(seq, object, false);
> +}
> +
>  /*
>   * Print the kmemleak_object information. This function is used mainly for
>   * debugging special cases when kmemleak operations. It must be called with
> @@ -1684,6 +1695,103 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
>  	put_object(object);
>  }
>  
> +/*
> + * Print one leak inline, re-checking OBJECT_ALLOCATED under the lock so
> + * the hex dump does not touch user memory that was freed concurrently.
> + * Used by the dedup_record() fallback paths where we cannot dedup and defer
> + * printing through the xarray.
> + */
> +static void print_leak_locked(struct kmemleak_object *object, bool no_hex_dump)
> +{
> +	raw_spin_lock_irq(&object->lock);
> +	if (object->flags & OBJECT_ALLOCATED)
> +		__print_unreferenced(NULL, object, no_hex_dump);
> +	raw_spin_unlock_irq(&object->lock);

I don't think OBJECT_ALLOCATED should prevent the printing here. If it's
called from dedup_flush() and the first object that kept accumulating
the dup_count is freed, you'd not print anything. I would only use
OBJECT_ALLOCATED to decide whether to do the hex dump if requested.

-- 
Catalin

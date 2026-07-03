Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BA1A6834;
	Fri,  3 Jul 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093425; cv=none; b=G4+e6tRn5wTcgEt7yHL7TSN0TLdrHrjhjzsBj9a0Cvwe/gufnFIHKq/GEQttogv3rLMWNCZ/egWWb7s5TLgVcWPajMD1QsqJcwAHUxfNL5oKM7GS7P84V8/fqSUFWz4jO7i2yf11UenZZSM6u0R2kMLn5nUfKAWaN3wc0VQGJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093425; c=relaxed/simple;
	bh=o6CUkChr105p1EtkJhmeQnN44oM2JayfRcY5WxDmCe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPelWal8zqfklcaIWJTi6fyE8WxXTCgcJk778zxVwSnb3gvJ5IZ6X5WUaKbJsEIc2OOh4MLOcgEoTFt+DqyKhRoKrnH6fVAwuBu93FAIHHrvA4uXhuJi1dfDhz0GD1bb6z2G0uqGV4Ia6jA/AZpCKxl3+YXmFQG5Uo4q09o/Mxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=uX3WhUE3; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="uX3WhUE3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HFC1s3Y4qDS3AnYkAd3JDVm/WCjlowQM1/RdwiUDxyc=; b=uX3WhUE3Ow3FP9kFIOR87QiQff
	NgSGTJGyKb6WcuGZdLvTztT1+H1PsH/lJPYlBJ5yslnw55mk7gxdszLOJzj/oSEUssjrDDnl0TMYF
	l0QQqLbH+dNq2ZDZ1UElkTx1NHEOwUY7uH8Olx5fi7li90Ai2dtJnHllS/Kq9G+rbyeblQMnYTygu
	hj9a2JzEGWRlbV5cqv5XrLTrmKaL1AzSxyA3n5lOO4Dw1LSGUaqzksXc+X15d8I5KofsYj9NBqpyC
	6I/X8yhw50sIyX+zshY5mtluaaEytht6GhdkueAJk6sqFRc7C16rpEaMZENnEJvd1ILMIfokt3v2d
	dsVNAv6w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfg3A-009VB6-1X;
	Fri, 03 Jul 2026 15:43:32 +0000
Date: Fri, 3 Jul 2026 08:43:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] selftests/mm: test kmemleak's N-consecutive-scan
 leak confirmation
Message-ID: <akfYImSNDh3OjIfR@gmail.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>
 <akYkKgWOsYnw6ETE@arm.com>
 <akZ4tzQw70x3RR2D@gmail.com>
 <akeX8mFiizd65pDw@gmail.com>
 <akfNeK7OOpvoZE9z@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akfNeK7OOpvoZE9z@arm.com>
X-Debian-User: leitao

On Fri, Jul 03, 2026 at 03:55:52PM +0100, Catalin Marinas wrote:
> > I understand we want to detect any change in any of these per cpu field and
> > catch it independent of the CPU. I am inclined toward that.
> > 
> > 	--- a/mm/kmemleak.c
> > 	+++ b/mm/kmemleak.c
> > 	@@ -1409,8 +1409,9 @@ static bool update_checksum(struct kmemleak_object *object)
> > 			object->checksum = 0;
> > 			for_each_possible_cpu(cpu) {
> > 				void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);
> > 	+                       u32 seed = object->checksum + cpu;
> > 
> > 	-                       object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
> > 	+                       object->checksum ^= crc32(seed, kasan_reset_tag((void *)ptr), object->size);
> 
> Yeah, the xor wasn't a great idea. What about initialising the checksum
> value on object allocation to ~0 (for the two-scans idea) and for
> per-cpu, just build the crc on top of the previous crc, something like:
> 
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 7c7ba17ce7af..e196f53f9b46 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -687,7 +687,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
>  	atomic_set(&object->use_count, 1);
>  	object->excess_ref = 0;
>  	object->count = 0;			/* white color initially */
> -	object->checksum = 0;
> +	object->checksum = ~0;
>  	object->del_state = 0;
>  
>  	/* task information */
> @@ -981,7 +981,7 @@ static void reset_checksum(unsigned long ptr)
>  	}
>  
>  	raw_spin_lock_irqsave(&object->lock, flags);
> -	object->checksum = 0;
> +	object->checksum = ~0;
>  	raw_spin_unlock_irqrestore(&object->lock, flags);
>  	put_object(object);
>  }
> @@ -1410,7 +1410,8 @@ static bool update_checksum(struct kmemleak_object *object)
>  		for_each_possible_cpu(cpu) {
>  			void *ptr = per_cpu_ptr((void __percpu *)object->pointer, cpu);
>  
> -			object->checksum ^= crc32(0, kasan_reset_tag((void *)ptr), object->size);
> +			object->checksum = crc32(object->checksum,
> +						 kasan_reset_tag((void *)ptr), object->size);
>  		}
>  	} else {
>  		object->checksum = crc32(0, kasan_reset_tag((void *)object->pointer), object->size);

Ack, this seems more robust and easier to follow than my approach,
thanks for your insight here.

I will spin this "fix" separated (CCing stable), and send a v2 for this
selftest with priming enabled.

Thanks for your suggestion,
--breno

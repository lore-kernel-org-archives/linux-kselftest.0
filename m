Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20F35A384;
	Fri, 24 Apr 2026 12:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034600; cv=none; b=MkUBrNZHE4DxzxI5+0Inq2HEM5j6rSAVcJx3Dyw/WaCqjAA0x7gOmlctMXBexLPW6MhFR+oMFqii4JyxkwTMOMEUvoL4ufEzKsoadRADgFd4mSvGR4s30zfFUY17PNK6+Ly+g4UIEDKmg2Qmnpq9QZ7Llv2ZhLLEEP0NjwJMt7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034600; c=relaxed/simple;
	bh=Efu6vGyvKXsieH5X7LAzvFKJ/ri5tvvwKhTrzE9yiyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiYOQvH4obFjOAXyCsIJAGe+1ZqiLxkczsg1ocrHdc+p76TQmy8A9rNbk+WpMvFW8pFv4qCm1YhKXJwF/ub/FxJ91ftj7ZaGcw7tcUAYP9dL3r4+ne4iChpD2UaGgJjtunvEIlbYFD9k/6MemeW8m7d4pbwCzOF/bIPvxfrfSDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qjPWIYXv; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="qjPWIYXv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8TBvaZCHZYDtyO4zWE3xupCtTc6DCxfTmUnxqLkwOIo=; b=qjPWIYXvlg/prrtX7TRA4FpQ7o
	nrli+ltt9JvGCpxeG54RddXewSBe8uhFdpp5FrUe3UyXB/PdzioM+poBsArxNBkmCT2fRRuIutmFT
	0jyPR+AZqPH/uqBRt+rVIKU82sBQo4wDYLs5nvfsSRrGA3vZ9zzzzCqxtenJJ8ZvSAzxZHfBfBl2i
	C6jF6o0seW0r9pfrXJFWHj02Fp3Nabg2jX09h5mBIQzsxYbwEnH+JJ9btRO9jSAtBgJQIxqlG7NNL
	Up6DOanV99Qu8YJh2+J8Lx1GcuSjWs36XGijfmYJDoNhz1YIZynPD3/OTh7YDJCybA8XH6jb+D17O
	XyTxNM3A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGFsD-003Aw4-37;
	Fri, 24 Apr 2026 12:43:10 +0000
Date: Fri, 24 Apr 2026 05:43:04 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/kmemleak: dedupe verbose scan output by
 allocation backtrace
Message-ID: <aetj6NrBDcyG9rQg@gmail.com>
References: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
 <20260421-kmemleak_dedup-v1-1-65e31c6cdf0c@debian.org>
 <aeostKcaHzmVBFjb@arm.com>
 <aesymSWyh8NRIrDQ@gmail.com>
 <aetcgHhBXfPe6lr1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aetcgHhBXfPe6lr1@arm.com>
X-Debian-User: leitao

On Fri, Apr 24, 2026 at 01:05:20PM +0100, Catalin Marinas wrote:

> > @@ -153,6 +154,8 @@ struct kmemleak_object {
> >  	/* checksum for detecting modified objects */
> >  	u32 checksum;
> >  	depot_stack_handle_t trace_handle;
> > +	/* per-scan dedup count, valid only while in scan-local dedup xarray */
> > +	unsigned int dup_count;
> 
> I would add this around the pid_t pid member since both are 32-bit,
> better struct compaction. Here we'll get 32-bit padding.

Ack!

> > -	hex_dump_object(seq, object);
> > +	if (!no_hex_dump)
> > +		hex_dump_object(seq, object);
> 
> Nit: just use "hex_dump" and avoid double negation.

Ack!

> > +static void print_leak_locked(struct kmemleak_object *object, bool no_hex_dump)
> > +{
> > +	raw_spin_lock_irq(&object->lock);
> > +	if (object->flags & OBJECT_ALLOCATED)
> > +		__print_unreferenced(NULL, object, no_hex_dump);
> > +	raw_spin_unlock_irq(&object->lock);
> 
> I don't think OBJECT_ALLOCATED should prevent the printing here. If it's
> called from dedup_flush() and the first object that kept accumulating
> the dup_count is freed, you'd not print anything. I would only use
> OBJECT_ALLOCATED to decide whether to do the hex dump if requested.

That makes sense. I suppose we want something like:

  __print_unreferenced(NULL, object,
                       hex_dump && (object->flags & OBJECT_ALLOCATED));

Thanks for the review so far, I will respin the series,
--breno

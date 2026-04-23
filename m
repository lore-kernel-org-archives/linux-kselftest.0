Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69EA623ED6A;
	Thu, 23 Apr 2026 14:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776954559; cv=none; b=nDkcorQ4sL6c3MN/6c4kngTYyun8wI4s1E+nIZoQRtngEVTOpQzMUZXlNLDWvfIPVahqm8hClD7oFQyeAMQ0He6Sub3eCupkbePQyK46OWjEvWcmKWqdF1lDeLLoeHa91vNv8jZEO2sy4i6JN9U62sPmFMesC35iutmHDpSehY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776954559; c=relaxed/simple;
	bh=1gkahLjaXHUIa8DvHyVWpXrUQMCiYSLHL3RwfePawRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0XY9LIae1SrhQfP28KDySaiyueyGTW0g3s9Qkm2l/NihvfqvtM6MiaDbCFDTItWgJ3NeEy+gLkf8SPG1KcDu1C2VWDty5+xTTCVTwsAB8Ifv/mvClOdsRFMeM/G3G6xciiZGL0r8hFfx5mur88Szm/XNzB9xMsUwsiQ/Va5KJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GjKOBwJ4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GjKOBwJ4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39DEA1C0A;
	Thu, 23 Apr 2026 07:29:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 881CA3F641;
	Thu, 23 Apr 2026 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776954557; bh=1gkahLjaXHUIa8DvHyVWpXrUQMCiYSLHL3RwfePawRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjKOBwJ4fvKcjJAZzuDdKnOsN0TMHub2fIJNKcOUzct1fX07mAYhd/vowncnSNL0m
	 KMoy2Xbotudp6egM6uTzDwdrAZA73XOG00/S5GrmGgOrCu6go8sfieie1kyGYT6mbM
	 b/IPKK6JNmYoMBa1uNq9s8rykokk0HORY0kvctb8=
Date: Thu, 23 Apr 2026 15:29:08 +0100
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
Message-ID: <aeostKcaHzmVBFjb@arm.com>
References: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
 <20260421-kmemleak_dedup-v1-1-65e31c6cdf0c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-kmemleak_dedup-v1-1-65e31c6cdf0c@debian.org>

On Tue, Apr 21, 2026 at 06:45:04AM -0700, Breno Leitao wrote:
> +/*
> + * Record a leaked object in the dedup table. The representative object's
> + * use_count is incremented so it can be safely dereferenced by dedup_flush()
> + * outside the RCU read section; dedup_flush() drops the reference. On
> + * allocation failure (or a concurrent insert) the object is printed
> + * immediately, preserving today's "always log every leak" guarantee.
> + * Caller must not hold object->lock and must hold rcu_read_lock().
> + */
> +static void dedup_record(struct xarray *dedup, struct kmemleak_object *object,
> +			 depot_stack_handle_t trace_handle)
> +{
> +	struct kmemleak_dedup_entry *entry;
> +
> +	entry = xa_load(dedup, trace_handle);
> +	if (entry) {
> +		/* This is a known beast, just increase the counter */
> +		entry->count++;
> +		return;
> +	}
> +
> +	/*
> +	 * A brand new report. Object will have object->use_count increased
> +	 * in here, and released put_object() at dedup_flush
> +	 */
> +	entry = kmalloc(sizeof(*entry), GFP_ATOMIC);

Do we need to allocate a structure here? We could instead add a
dup_count member in the kmemleak_object and just link the object itself
into the xarray. Well, maybe the leak being a rare event is not that
bad.

> +	if (entry && get_object(object)) {
> +		if (xa_insert(dedup, trace_handle, entry, GFP_ATOMIC) == 0) {

I wonder if we need xa_insert() at all. Since it's indexed by
trace_handle, we could follow similar mechanism like stack_depot with a
large hash array, maybe gated by CONFIG_DEBUG_KMEMLEAK_VERBOSE.

> +			entry->object = object;
> +			entry->count = 1;
> +			return;
> +		}
> +		put_object(object);
> +	}
> +	kfree(entry);
> +
> +	/*
> +	 * Fallback for kmalloc/get_object(): Just print it straight away
> +	 */
> +	raw_spin_lock_irq(&object->lock);
> +	print_unreferenced(NULL, object);
> +	raw_spin_unlock_irq(&object->lock);
> +}
> +
> +/*
> + * Drain the dedup table: print one full record per unique backtrace,
> + * followed by a summary line whenever more than one object shared it.
> + * Releases the reference dedup_record() took on each representative object.
> + */
> +static void dedup_flush(struct xarray *dedup)
> +{
> +	struct kmemleak_dedup_entry *entry;
> +	unsigned long idx;
> +
> +	xa_for_each(dedup, idx, entry) {
> +		raw_spin_lock_irq(&entry->object->lock);
> +		print_unreferenced(NULL, entry->object);
> +		raw_spin_unlock_irq(&entry->object->lock);

Sashiko has a good point here - while the kmemleak metadata is still
around due to an earlier get_object(), the object itself may have been
freed and the hex dump in print_unreferenced() could fault (e.g.
vunmap'ed object). Same with the print_unreferenced() above. It's
probably not worth printing the first bytes of the content anyway when
we do coalescing, the content would differ anyway. Also it's possible
that the size differs even if the stack trace is the same but I guess we
can ignore this.

https://sashiko.dev/#/patchset/20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org

-- 
Catalin

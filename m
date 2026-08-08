Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C8936212E;
	Sat,  8 Aug 2026 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180768; cv=none; b=nMIBM0C+yFZOvM/XR5PdJ2MfO8hFMXoV+VAX+qEcwzosT8hq57WhT0ZYfFQ4yWQqoni9k0APCrDsY2g69JjB99+uC7qnFainLFWBqbBWRkyrwdLYqFZoRwUEzDSk8fl4Ya1uikvuA/X7VgEzgcz/P4Ap1cZsB0NLEs3PTYeV8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180768; c=relaxed/simple;
	bh=92rvISZdwsWFrk4jKM4UwEIPmsLJvlYr3JgI6E5hrXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JrZqZYP+5LjpJKmB4MFxfAB9dgvOFclIqrTpPb0h+A5Vg9LdkaCE2Lyt+1aib9caaSjfBg+mLb2u/teC0ErmsR3Vz2WBg+c6jktNrTIcb0aqcWnz1EzoBPMyB08pcZWbM2l+h4QZw/RVJcGNn0gQHC3pydK5+nUp2XfQb2ZIEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtTscqDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtTscqDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876451F000E9;
	Sat,  8 Aug 2026 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786180767;
	bh=kO9KirKAwtmoOH4zC091LZtaUlv4R8nAJeY7AbVUrB8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HtTscqDDdfqhRINHzyW0gJFC9dY2ycopN/m79i8sUewGv688Kg0OGs04zfKb718Go
	 Cm86K8+MSQ5xVG36Dy2JF3YKJ/ZN4MB34DmeNXzf6FI6DER9mWnCdDOThnM/rwy5y0
	 dUnV2qjIvLql5jIaMgJDglVT0XmAVoP0ddYIiEj/ZLhaLCyhfdgolNy8n/ao98YYVc
	 fUD0S4UXHCZzibVDo0dH440T7k8ayJ9RyZfuXg8L6UA72rJMQIzzhbIX5WeD78rmbM
	 XgJHKx7CWplT4B5cX5l94a79XZ+RONAoAqzYnpngjpvx7NI41gE6G77/MXVTmDQd04
	 n8AUxVHA/bL7g==
From: Thomas Gleixner <tglx@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mingo@redhat.com, shuah@kernel.org
Cc: shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 d@ilvokhin.com, kernel-team@meta.com, Usama Arif <usama.arif@linux.dev>
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <20260731192624.140399-1-usama.arif@linux.dev>
References: <20260731192624.140399-1-usama.arif@linux.dev>
Date: Sat, 08 Aug 2026 11:19:23 +0200
Message-ID: <87v79lm0kk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jul 31 2026 at 12:26, Usama Arif wrote:
>  
> +	/*
> +	 * A mismatch here refuses the wait without locating the hash bucket;
> +	 * a match is rechecked under the lock below before queueing.
> +	 *
> +	 * get_futex_key() runs get_user_pages_fast() only for shared futexes,
> +	 * so their page is resident and the non-faulting read suffices, with
> +	 * the locked path recovering if it does not.  A private futex may

That's a fairy tale:

       get_futex_key()
          ...
          // shared
          get_user_pages_fast();        // gets a page reference
          ...
          folio = page_folio(page);
          ...

       out:
          folio_put(folio);	       // drops the page reference
          
Thanks,

        tglx

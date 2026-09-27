Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC65305683;
	Sun, 27 Sep 2026 20:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790539923; cv=none; b=UAaEUqfNApe6uchWbQU9F0epzNxEHya31R/tfbX11bgzwV7OwMBDsoQ44D3J5tmBuTtt4/c83YotQqddoA8au0GnoKoWgh7BA3rps1/tmcoMle2inFr21satSdlIDKuZzJXu+bzn4B425J3AZqs7dWEe6QXM9bSnfzXizJco3uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790539923; c=relaxed/simple;
	bh=zqIKR3F//r3JMt3kkMtU9SZml/sFwQlmFzrsxDh2Nkk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uJr4PcRA1HKHg8zVmz9Cme3v6DCaPnxdA91dyN7ADuQsYP482LGaYghO7Cm3BCTul/ralrJEK6PM83hqExwXZuzZNV7LmA0uZIxZCttpBGKs3TVMk61bakNLMbAmyjwSgCsrdzhs6kbtoIDxBWqQmTyqLYVxbv0fIYzPBp7O/h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dBpbPeGS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dBpbPeGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D145A1F000FF;
	Sun, 27 Sep 2026 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790539922;
	bh=zw6LphimU2j7rCWjyCWC5xM3gVDLoCW+f86+35F4nME=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dBpbPeGSTDE2LuiAUazsZ/tDuOBNiiEpN43Jy1m3MTjNiOKGPVgE71zF+8OPv0BTZ
	 nITFr2+WuzZvnTCyi5MO5ay+FthcZpnR3ha0cVrvtSDBkJvuDBx+sSl7aR8NHYDv6D
	 I3okQEEKN3W3jDjlb2CahR9TUccyAPgnEo53J8Y0=
Date: Sun, 27 Sep 2026 13:12:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org,
 "open list:MEMORY MANAGEMENT - MISC" <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] selftests/mm: cleanup -Wformat issues in hugetlb-mmap
Message-Id: <20260927131201.dfeeade5504b9fb707ad1e54@linux-foundation.org>
In-Reply-To: <20260927162419.820609-1-cmllamas@google.com>
References: <20260927162419.820609-1-cmllamas@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 16:24:18 +0000 Carlos Llamas <cmllamas@google.com> wrote:

> Commit ae571cd6015c ("selftests/mm: hugetlb-mmap: add setup of HugeTLB
> pages") and commit 9c5a65f374f8 ("selftests/mm: merge map_hugetlb into
> hugepage-mmap") added logs of 'hugepage_size' which has a size_t type.
> However, the incorrect format specifier '%lu' was used which triggers
> -Wformat warnings when building for 32-bit:
> 
>   hugetlb-mmap.c:125:55: warning: format specifies type 'unsigned long'
>   but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     125 | ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
>         |                                         ~~~         ^~~~~~~~~~~~~~~~~~~
>         |                                         %zu
> 
>   hugetlb-mmap.c:134:47: warning: format specifies type 'unsigned long'
>   but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     134 | ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
>         |                            ~~~              ^~~~~~~~~~~~~~~~~~~
>         |                            %zu
> 
> Fix this by switching to the expected '%zu' format specifier.

Thanks.

> 
> Note that I intentionally skipped the 'Fixes:' tag as I've been
> previously suggested _not_ to use it for kselftest patches. However, I
> can certainly add one if someone prefers it that way. Thanks!

I added cc:stable.  It's not good and it's worse with -Werror.  mm
selftests don't presently use -Werror, but quite a few other parts of
selftests do this.


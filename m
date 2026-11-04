Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755312;
	b=rKPjd0uyW2fXLnszvS1zjXNd1sV9/tAzlxlmtdlGfxe93bHWVNDe6tMpNuPZHNqiVYrr
	 KH4C1qfAsMTO9mvL9Jr6rGlFR+2hRiujtIHv4OZLs9GUSvePtkUiJIXkMxe0ZCqxzgOVB
	 Gg1XwB/Ao15IDcEg+TI2BXdZzV/bAv0nOLE0803Pm8SxxWY7oxzffKs4QY+MwsZhN3KcA
	 ud2OjdXkc3wydqUj9sdY0ZMRaLkyDsNknlj68Vgp3vE3DK7cIOmWkpcBUT0DYVq+GZWi8
	 4+D4UGthCbB785pXS8OfZCs0+iIQvR8CNKqN4+8WKdgqBuko2rErS/Vs9jlgSOK/GmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755312;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Q5/n+lMO8hXflt+/fw8C33ZJeW4TIpqo/+mXVJXPEc=;
	b=cg2V35Yp1iGJsTknFAuOPgzi96t44Iw5q5fDcFIuu+o/EwcWGPlRiCQmhZ9BgTKQDcFs
	 xub/RIYUnALA2lDSWr3HQC8RwHrJwc+HDND+iyU8mfDSOFNzwjBtqOH2dnh26UNRQBAOD
	 uhvlnEyYoQpHjcTYDMqETBtg0VhHNrW8Xs3aauMTLluOXTbUqJ0JxmC3fNOBBqy8vA5XJ
	 tvhZY6aGsrWghuhrXTsCCxXwmt6h5sb2t0UmW6lsCI0s7KY/1iMqfETGHseDXOgt67aUy
	 3BBW0BxE3HXtGnJppzOQTaDFI6UUG2WqTkkEMf3nmLFfvtrhR7QxuHm6jyFYa/bzSyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UjGpG3oB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E1606A31B;
	Wed,  4 Nov 2026 01:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UjGpG3oB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914531F000C1;
	Wed,  4 Nov 2026 01:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793755311;
	bh=3Q5/n+lMO8hXflt+/fw8C33ZJeW4TIpqo/+mXVJXPEc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UjGpG3oBmG7swsK9ZzyPdqaDfK2bSJXx673GJ32yahnXtcyErEZd5uEkYt1QyYNJb
	 dupMFGFBaex2t7vP8gfvw5utKKJTtTzI3wtIt7K8G9XXC3hsWIWTgSCioRoPJ7PYv8
	 HL95CDgWBQrE0B3pFRJgpmGyFguBp5Pq+B2LuOIo=
Date: Tue, 3 Nov 2026 17:21:50 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, David
 Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan
 <shuah@kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: fix pointer width warnings on 32-bit
 architectures
Message-Id: <20261103172150.3753dfa00f3106b6014e4d2c@linux-foundation.org>
In-Reply-To: <20261103212805.1537354-1-sashal@kernel.org>
References: <20261103212805.1537354-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 16:28:05 -0500 Sasha Levin <sashal@kernel.org> wrote:

> Several mm tests convert between pointers and 64-bit integers with a
> plain cast, which warns on 32-bit architectures, and hugetlb-mremap
> passes 47-bit mmap() hints that don't fit in an unsigned long:
> 
>   uffd-unit-tests.c:344:31: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Add ptr_to_u64() and u64_to_ptr() to vm_util.h, which cast through
> uintptr_t, and use them where pointers meet the 64-bit UAPI fields and
> the 64-bit address arithmetic in mremap_test. The hugetlb-mremap hints
> don't fit in a 32-bit address space, so only pass them when long is 64
> bits.

lgtm, thanks.  I used this as the first test case for my shiny new
kernel testing bunnybot,

Turns out, you accidentally fixed a bug!

: I compiled all six affected C files with GCC 13.3 for i386 and x86-64.
: The patch eliminated all 40 targeted warnings on i386. In a Debian VM,
: both ABIs passed checks for pointer round trips and high-bit addresses.
: All three hugepage mmap hints were NULL on i386 and retained their
: requested values on x86-64.
: 
: There's also a runtime fix worth mentioning in the changelog. In the
: unpatched i386 wp-unpopulated test, UFFDIO_REGISTER successfully
: registered 0xf3f7a000. The test then passed the sign-extended address
: 0xfffffffff3f7a000 to UFFDIO_WRITEPROTECT and got EINVAL. With the
: cast through uintptr_t, wp-unpopulated passed on every run.
: 
: With userfaultfd enabled, hugetlb-mremap and the userfaultfd case in
: mremap_test passed on both ABIs, with and without the patch.
: 
: Separately, mremap_test cases 10-13 failed with EINVAL on i386 both
: before and after the patch. Each tries to move a 2 GiB mapping from a
: 1 GiB-aligned source to a nonoverlapping destination. Only the
: destination alignment varies: 4 KiB, 1 MiB, 2 MiB or 1 GiB. The two
: ranges alone would fill a 32-bit address space. As a follow-up, I'd
: make these four cases report SKIP for 32-bit userspace and keep the
: existing coverage on 64-bit.
: 
: Tested-by: Andrew Morton <akpm@linux-foundation.org>


By my count, we have 15 implementations of ptr_to_u64() splattered all
over the tree. 

> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -59,6 +59,16 @@ static inline unsigned int pshift(void)
>  	return __page_shift;
>  }
>  
> +static inline uint64_t ptr_to_u64(const void *ptr)
> +{
> +	return (uintptr_t)ptr;
> +}

16!



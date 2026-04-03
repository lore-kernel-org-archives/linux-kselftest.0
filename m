Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0492248AF;
	Fri,  3 Apr 2026 18:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775240167; cv=none; b=md75iluIXGUldl3OuTAlb2JMm2ZqyBl5QHiF2Rz5y5IfAtdQw6KzKhIl9io9hk4Q57HqApI308L4Y3XQ36+gSBB0OnAg8hoFbW6zNIgOcP4l41JKD9OzI9kmEUJxVbdEllJubYML5rfhveS3Yfq3TS/kgpRoKD2mpejTgeCJ0Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775240167; c=relaxed/simple;
	bh=PLP02BG5+c9aTRdm58m6RZdsHrEiiual31fU2vIRkAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlJgxgk/Ty+iMXcoFhBoMeO7JCAKDEcTBkn/qSW3k8V54AOeBEcVQxAiySr2Um1rI6Kw7d9JBXmyRdDehofxmhYfJ21hiFM9+JdevumKrLcoeZXLkaWV66urSc6DbXNg9NxlGig3qXdvzskNnD7sTPqGcMJJ9WLLHbrzu9A1WYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3RXEiMg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3RXEiMg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F2CC4CEF7;
	Fri,  3 Apr 2026 18:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775240167;
	bh=PLP02BG5+c9aTRdm58m6RZdsHrEiiual31fU2vIRkAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o3RXEiMgc5eUpDjqetREj6DXQ1IYlHqSlmCAL4gCs52oqS0DDNRDuOGPL2W/RJsh4
	 JULwBjNW0jsdqunEdKsHU4P5KCNYxkfn2YIZY90EeJt+PZZl6+CefVg9xVoDrG5F7V
	 /iSBskLLo7yFWNB963KbJvcujlin3y4msdEWMU8cuetvqxOmdD34I8oFhnAkasl9R6
	 bbLps9jRxXirHDYpsKnQGknufwDL8BwC4NlxQ4hM2zCdlcNDd0ibWbhAZ6ckIBqhqK
	 +oi0Mdf4BhIN2feJh35AHWfwO1FPxud85Dfunvc/PTiRyS/46xWcUD22NftzSWzKCK
	 v9otScNhlyLyg==
Message-ID: <7c040e17-cd08-4f56-87b6-bfd612d87e40@kernel.org>
Date: Fri, 3 Apr 2026 20:16:01 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: fix mmap errno value when MAP_DROPPABLE is not
 supported
Content-Language: en-US
To: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com,
 shuah@kernel.org
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
 <20260402235933.10588-2-anthony.yznaga@oracle.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260402235933.10588-2-anthony.yznaga@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 01:59, Anthony Yznaga wrote:
> On configs where MAP_DROPPABLE is not supported (currently any 32-bit
> config except for PPC32), mmap fails with errno set to ENOTSUPP.
> However, ENOTSUPP is not a standard error value that userspace knows
> about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
> checkpatch.pl has a warning to this effect.
> 
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


> ---
>  mm/mmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 5754d1c36462..2311ae7c2ff4 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -504,7 +504,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>  			break;
>  		case MAP_DROPPABLE:
>  			if (VM_DROPPABLE == VM_NONE)
> -				return -ENOTSUPP;
> +				return -EOPNOTSUPP;
>  			/*
>  			 * A locked or stack area makes no sense to be droppable.
>  			 *


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EC52D949F;
	Mon,  5 Oct 2026 06:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180412; cv=none; b=oBeEHl1PW2fxescD127RhdcgfYT6x+iWcIB3CfQhERUJAJCSbraqdAu1xyDsqJ415fEvsDI+hZpIdGQH14bJS9kC+s1I1TZ6XepTjhM90+iA/DJiOgUxXGVoksYPBCatxCA5IhCSFc5/Fand421WEdDWcAS/IUKoNC9aoZ1Kxu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180412; c=relaxed/simple;
	bh=+ibL2hv4DavomwPoilP9Va1n9KBFliQjjLfaYyl0kVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQ8GAqUgcI/fWsqSeP3BSOIElcOi4LN78ZYp//1HItiBXyp1ozrRPUbQsM0y5jZdd+kBfl3rjWUcTSBejpd9AQ0RrldJ4k0aUfglgdcglzwk2f0UOiQEbmKeP/QqbCu3OXrgTEYWOBujrRxC4hR8nyp1x1RWiOcEO/uj6DHtdog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ayC88pwP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ayC88pwP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B95941595;
	Sun,  4 Oct 2026 23:06:45 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D353F763;
	Sun,  4 Oct 2026 23:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791180409; bh=+ibL2hv4DavomwPoilP9Va1n9KBFliQjjLfaYyl0kVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ayC88pwPMPZBOMPZ1NGqtJAPWDzhrgRcHaCEC0AgzhymaNtGdierZxwtGfOqqnz9M
	 /8xd9FnYNM4GEwZjq7I8N5CsHcp/3jUuJvJ6u1AI7YhCgKtvoBfTBBvaIf86qVjm6A
	 6eJZxoXRJkx8c6zQgOPAG7qQeYGcyt8LOQz+c/9s=
Message-ID: <48012a21-dc2b-4445-a71c-0d517845d998@arm.com>
Date: Mon, 5 Oct 2026 11:36:43 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: hugetlb-read-hwpoison: add setup of HugeTLB
 pages
To: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261004205458.119608-1-jaeyeon.lee.dev@gmail.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261004205458.119608-1-jaeyeon.lee.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/5/26 2:24 AM, Jaeyeon Lee wrote:
> Every test is expected to reserve the HugeTLB pages it needs.
> hugetlb-read-hwpoison was not converted, so on a system without
> pre-reserved huge pages the MAP_POPULATE mmap() fails with ENOMEM and
> every test case is skipped.
> 
> Reserve the pages with hugetlb_setup_default(). Each chunk size runs two
> HWPOISON tests and a poisoned huge page can't be reused, so reserve two
> pages per chunk size. The pool size is restored on exit. The poisoned
> pages remain allocated until reboot.
> 
> With the patch, all 12 cases pass on a system with no huge pages
> reserved (tested on Fedora, x86_64, CONFIG_MEMORY_FAILURE=y).
> 
> Assisted-by: LLM
> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
> ---

Looks good to me. Before the patch, all 12 test cases were skipping with
ENOMEM. After the patch, all test cases passed.

Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

>  tools/testing/selftests/mm/hugetlb-read-hwpoison.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
> index 70b24e3660c4..31748a24448f 100644
> --- a/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
> +++ b/tools/testing/selftests/mm/hugetlb-read-hwpoison.c
> @@ -13,6 +13,7 @@
>  #include <signal.h>
>  
>  #include "kselftest.h"
> +#include "vm_util.h"
>  
>  #define MAX_WRITE_READ_CHUNK_SIZE (getpagesize() * 16)
>  #define MAX(a, b) (((a) > (b)) ? (a) : (b))
> @@ -281,6 +282,13 @@ int main(void)
>  	size_t i;
>  
>  	ksft_print_header();
> +
> +	if (!hugetlb_available())
> +		ksft_exit_skip("HugeTLB is not available\n");
> +
> +	if (!hugetlb_setup_default(ARRAY_SIZE(wr_chunk_sizes) * 2))
> +		ksft_exit_skip("Not enough free huge pages\n");
> +
>  	ksft_set_plan(ARRAY_SIZE(wr_chunk_sizes) * 3);
>  
>  	signal(SIGBUS, sigbus_handler);


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5A23D5673;
	Tue, 25 Aug 2026 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648717; cv=none; b=t32rR7+lwS0Ig6tYkSYbu9yvmR4JqqLnrpNh/wJBplyhgFD6b+518a3Oled1HDtafAIaaUmMiZmM2zNGDt3kkm/UPsUjFu83yArvJPoG+nqYbi/QwD70znUHvOA3ROtXANzEGYjBsxL/Cnyz43hfryz2uDEGNwgLzKkwmwGy/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648717; c=relaxed/simple;
	bh=VVA5b3Sxn3jAB87yPqIx2puxbJ9K3S8Qelt3HRI7aIQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JcG9MIzkMvOgjepRrsdHgTf3Jgz6y39N6HPskW//LJ3tA4kRdu1mGgbx3nhkIdmCLPZNkmIaazabONp0Qh0r7gfZZ0FHwiUrUgpgmBBoXxu+nUhEuSX2FtJEdxaZo9hHTFNfsULM7x1kK4IfhwzJEfx3k1kkDafnJjhv0CIEUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=j4O/fy9I; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="j4O/fy9I"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9C321D13;
	Tue, 25 Aug 2026 02:05:10 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46F1D3F66F;
	Tue, 25 Aug 2026 02:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787648714; bh=VVA5b3Sxn3jAB87yPqIx2puxbJ9K3S8Qelt3HRI7aIQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=j4O/fy9I+ygjtNreY+klv5AoJtgbDvbBWTvWDbq1W3RKg4P7VH3WAlzSHP3c5jEYN
	 d8FrvNpaER9MQETbZk6BDkIIFoNCVlvNex+W4FBxTtEs3aqkAUhF5UHpnA5KGCeACh
	 zF575a7ktuq01hSAcHAz3fpywlSEFxovuUoSkoIo=
Message-ID: <2d81928a-3463-493f-bfa6-71869882489e@arm.com>
Date: Tue, 25 Aug 2026 10:05:09 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH v7 1/6] selftests/mm: make file helpers return errors
To: Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260813181230.483746-1-sarthak.sharma@arm.com>
 <20260813181230.483746-2-sarthak.sharma@arm.com>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260813181230.483746-2-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/08/2026 7:12 pm, Sarthak Sharma wrote:
> Change read_file(), write_file(), read_num(), write_num() and
> write_num_ignore_einval() in vm_util.c to report failures to callers
> instead of exiting from the helper.
> 
> Make read_file() return a negative errno on failure and 0 on success, so
> callers can distinguish a successful read from an I/O error. Also make
> read_num() reject negative and malformed values.
> 
> Keep write_num_ignore_einval() silent for -EINVAL while returning other
> errors to its caller.
> 
> Update callers to print diagnostics and fail wherever required. Also add
> a helper print_file_access_error() in hugepage_settings.c to print
> TAP-compatible errors without a kselftest dependency. This prepares the
> helpers to be moved to tools/lib/mm without a kselftest dependency.
> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>  .../testing/selftests/mm/hugepage_settings.c  |  98 +++++++++++---
>  tools/testing/selftests/mm/khugepaged.c       |  14 +-
>  .../selftests/mm/split_huge_page_test.c       |   5 +-
>  tools/testing/selftests/mm/vm_util.c          | 120 ++++++++++++------
>  tools/testing/selftests/mm/vm_util.h          |   8 +-
>  5 files changed, 178 insertions(+), 67 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index d7917dce3aba..5bcda01ac4f6 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -8,6 +8,7 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <unistd.h>
> +#include <errno.h>
>  
>  #include "vm_util.h"
>  #include "hugepage_settings.h"
> @@ -48,6 +49,11 @@ static const char * const shmem_enabled_strings[] = {
>  	NULL
>  };
>  
> +static void print_file_access_error(const char *path, int ret)
> +{
> +	printf("# %s: %s (%d)\n", path, strerror(-ret), -ret);
ksft_print_msg() is what you want here. It adds # by default.

...

Thanks,
Usama


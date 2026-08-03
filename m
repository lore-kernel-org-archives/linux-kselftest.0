Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69B3D75AD;
	Mon,  3 Aug 2026 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747633; cv=none; b=U6OM7y0e1TH7xl9kbRqqHG/EQb5rXdMPqYR+SxlMfAoiVOsGGnepag2SB9P3xx+7WZh/SDJyURUnl5SvUKDV6UyxZDS/7DJhwjE9szPstpYXvUtVYRRclwjuCPAHzQbL/LcGW2EEkcG6H2mlNBj+T48whIvMHQXqyPsfO+PyXmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747633; c=relaxed/simple;
	bh=crTfF/i3bL3V2aeTOR35EMlqbNOs0ejv4/tViX7eTtQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eaUz/2TDQMbO05c/GcjJ/ylMI3pD1v3nphTL6mmvfufYVyTUmBfKnFQGzxgISdycWUnpo1xbs8N6CX7l6hXhoJksNZvWNxRiIAhicOTJSd2wbDQTI4qFFbYycCZtWfL8TBd6sjdbTQFp3DYVJ00hi7m8bDjdGndAatcd1ynRnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InDa2lOl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InDa2lOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3871F00A3A;
	Mon,  3 Aug 2026 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785747631;
	bh=Z3TNkOT9vMabBF3bjPGTX+nNF4y4J7Wx1dBGZm5w1zk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=InDa2lOlOoCz52KomKj4SnDG9kXgGXUPDQlsbI3zxn3XkgfMeSbSpeppsVlo4Dy5+
	 SXPn/k1Kfg/S8YM7eDUMbEQ+ncSz6d89++WAbrULe0wxhhE6MdxtkA+QtnBDwbQ+h/
	 hA5Gv1ndYvGUwet5mAib1GiFr6bRfPLEGsiNo5sIW9GYKgnFnB5DxazpFK6Akl0Qsw
	 gTXZjJdee2MX/2V0d+sHhW77hPrf+YtgMwfIaJvjlhV/8Wpx0IWNDjRWe3eec41c1s
	 lfv4xFhjpBUaa1QQ2HyBsfkRqI+GV06EXoBspxlOYBMM37oWyEOKlGS4rj5itxrDfE
	 7s5ppJV+H3NKw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 3/6] tools/lib/mm: move hugepage_settings out of
 selftests
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260730140825.238130-4-sarthak.sharma@arm.com>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-4-sarthak.sharma@arm.com>
Date: Mon, 03 Aug 2026 12:00:01 +0300
Message-Id: <178574760162.1561566.5251738533303087247.b4-review@b4>
X-Mailer: b4 0.16-dev

> Move hugepage_settings.[ch] from tools/testing/selftests/mm/ to
> tools/lib/mm/ so the THP and HugeTLB helpers can be shared more easily
> between selftests and other tools.
> 
> Keep the helpers exposed to mm selftests through vm_util.h where possible,
> and use direct <mm/hugepage_settings.h> includes for files that do not
> include vm_util.h. Adjust the selftests/mm build to compile the moved
> implementation from its new location.
> 
> Remove the remaining kselftest dependency from hugepage_settings.c.
> Replace ksft_perror() with a new print_file_error() helper and
> ksft_print_msg() with printf(). Prefix both with a # to keep them
> TAP compatible.
> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/lib/mm/hugepage_settings.c
> similarity index 94%
> rename from tools/testing/selftests/mm/hugepage_settings.c
> rename to tools/lib/mm/hugepage_settings.c
> index db0db8a3df7c..4471f4989dbb 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/lib/mm/hugepage_settings.c
> @@ -10,11 +10,16 @@
>  #include <unistd.h>
>  #include <errno.h>
>  
> -#include "vm_util.h"
> +#include "file_utils.h"
>  #include "hugepage_settings.h"
>  
>  #define THP_SYSFS "/sys/kernel/mm/transparent_hugepage/"
>  #define MAX_SETTINGS_DEPTH 4
> +
> +#ifndef ARRAY_SIZE
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +#endif
> +

We already have ~20 of those in tools, so one more won't hurt :)

But really definition of ARRAY_SIZE() belogs to a header, maybe
something to cleanup later.

>  static struct thp_settings settings_stack[MAX_SETTINGS_DEPTH];
>  static int settings_index;
>  static struct thp_settings saved_settings;
> @@ -49,6 +54,13 @@ static const char * const shmem_enabled_strings[] = {
>  	NULL
>  };
>  
> +static void print_file_error(const char *path, int ret)

Maybe print_file_access_error()?

> +{
> +	int err = -ret;
> +
> +	printf("# %s: %s (%d)\n", path, strerror(err), err);
> +}
> +

You cooud add this at the first patch and avoid errno dance there and
all the changes for printing below.

-- 
Sincerely yours,
Mike.


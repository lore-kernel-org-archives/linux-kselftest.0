Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E653C456D;
	Mon, 29 Jun 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728434; cv=none; b=nZIX42NLhGdTulJHIs2Qx5bkQIWLjPrt0bNxdz1VEZJYnEs9G0WEnVMbFSEE7PPAWQ8T/ADgevmZkGsmIL/86wgpGNJBeGk22Zq4Bs88PuLcXMwVplpPmqa8L1yohxc6UdBJrtN1qZ5m7NYS/4Lkr9BIMJn5MM61FYRqOOj3Qjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728434; c=relaxed/simple;
	bh=cX/lEYrd4XkWUUtxxcYkbRW8f1wmK3umwBxhcHuSF2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKQd2pvu7ugqs8q38D+b1I/5utuyJ5G0XQPozP7zX9hxRA95Km0dI/td17cHsV94/EexQZ+dHCpy4K8oLF3dG71BIwvUnEb1E7AidQLOpumfBm2/dia3vS89j/Au+C1XaR99XWl57DnvtnXGWQ7AQ3H6CU8yFlqJMPXMVyxWhOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MriwyfA1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MriwyfA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435D11F000E9;
	Mon, 29 Jun 2026 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782728433;
	bh=HpGoUDIQQyxm8nXczBO7uDgFlJUnSsbppjIImZsuh64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MriwyfA1WkY6hiHd3yFjQ4ooJ3k5caOhTZ6fELGfsJHjiUBQOmtiRJva60TGrJYbz
	 GTaofAmjQy6vFPTWAgrEeTLgvtQf4Ktg20+JDQSE/ab4SM85mRj2ErV5y56DOeSlYN
	 VmBI0ST/NteiA80irAI67Cu/MISTaDEG9LIAGCivmlxsQ7ZazpcC2ACmwKZRiUBZc7
	 9u4EKhr3tx7qWt6xSEnnOTZovMVkpieLFG52lpdmEYfj9+hBcLccD4SwW2T9tjiU7w
	 T+eQrhTmkHlrFSTl48r2K+dKe4heyGAlxbFcyfZk4LkRfw5kwfkm/bRi0S/5vi+Rwv
	 ymyOaZKRBQlNQ==
Date: Mon, 29 Jun 2026 11:20:24 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, shuah@kernel.org, dev.jain@arm.com
Subject: Re: [PATCH] selftests/mm: hmm-tests: include linux/mman.h to access
 MADV_COLLAPSE
Message-ID: <akJGyxHtbA0lvPNa@lucifer>
References: <20260628143111.36863-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628143111.36863-1-zenghui.yu@linux.dev>

On Sun, Jun 28, 2026 at 10:31:11PM +0800, Zenghui Yu wrote:
> The following compilation error occurs with an old version of glibc due to
> a recent commit adding MADV_COLLAPSE testing:
>
>  [root@localhost mm]# getconf GNU_LIBC_VERSION
>  glibc 2.34
>  [root@localhost mm]# make
>    CC       hmm-tests
>  hmm-tests.c: In function 'hmm_migrate_anon_huge_fault':
>  hmm-tests.c:2355:27: error: 'MADV_COLLAPSE' undeclared (first use in this function); did you mean 'MADV_COLD'?
>   2355 |  ret = madvise(map, size, MADV_COLLAPSE);
>        |                           ^~~~~~~~~~~~~
>        |                           MADV_COLD
>  hmm-tests.c:2355:27: note: each undeclared identifier is reported only once for each function it appears in
>  make: *** [../lib.mk:225: /root/code/linux/tools/testing/selftests/mm/hmm-tests] Error 1
>
> Include linux/mman.h (which provides the definition of MADV_COLLAPSE) to
> fix the build error.
>
> Fixes: e3d8707358ea ("selftests/mm/hmm-tests: test pagemap reads of PMD device-private entries")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/hmm-tests.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index e4c49699f3f7..2f2b9879d100 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -23,6 +23,7 @@
>  #include <time.h>
>  #include <pthread.h>
>  #include <limits.h>
> +#include <linux/mman.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
>  #include <sys/mman.h>
> --
> 2.53.0
>

Cheers, Lorenzo

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDAC34B404;
	Mon, 16 Mar 2026 06:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642921; cv=none; b=MoO9tGHuMi2+GpopZnSKLMPSlCIt1+3qZLXYTiJuXGfV3Pm/BisGZuorhe3L03pZa2m+aVFtobYJMizIsRpf+pTHJ8UbKHZW3t1ruiHpkZAMpWmiCl27SWamDbu1WmkCUXhyQiEHv54UgtZZBURpLMrvTIGltsFqf2VIv7pszkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642921; c=relaxed/simple;
	bh=Y5aXaVuGBaiXS/GWUEXMWG35peqnApOugc3+Qo06CeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cuF3SZVQC3egDYu6byeR8emkqziRuZl33ubw3IWqFR2SeOw/bJ5VN1E4QOS1GMOpU+eA11YWC5skF1eiMupmdiGmVNSzo9uCh0uYJQ3EH6mgOUurlPGrtXjV++HSphryZteq4jQ2fGurcBkiHUm4iIMpU9WDi/JJcVOLQAoM3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCPUFoSJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCPUFoSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FB5C19421;
	Mon, 16 Mar 2026 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773642921;
	bh=Y5aXaVuGBaiXS/GWUEXMWG35peqnApOugc3+Qo06CeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCPUFoSJslWQgmhBOPtiAsslsXjQEv46CWWZzGE0Loz9tRvsYQ16trMBW1AnW/xGZ
	 80IVCeP/f6bx6ZK13+nzfnlPjxM6KlRagI+nkKnuojxe1t3r6ssTYHdElotg//l2Pg
	 Xz3VJYZu7pDO9areQQSsbn7+NzotQ4lwyygaJpG/VkP8uYMckiELS2nlPSD/Ih2Wgl
	 2VPZm8DcUEXJQ2ndAEPjkpDH7F06T6M2QyhPHwaSd17hCvogZKcmK0IRzvS8q+qBFc
	 8AhQi4/VE9iyCvzXDVbzJrfyEabcbrnZiBo7BBAEUbH0oPQxiPjczy8ujT4fa0kdfd
	 sY45z7NSKxSEw==
Date: Mon, 16 Mar 2026 08:35:11 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v2 3/5] selftests/mm: move write_file helper to vm_util
Message-ID: <abekn9aBMw1e1Rw1@kernel.org>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-4-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316044335.1390608-4-chuhu@redhat.com>

On Mon, Mar 16, 2026 at 12:43:33PM +0800, Chunyu Hu wrote:
> thp_settings provides write_file() helper for safely writing to a file and
> exit when write failure happens. It's a very low level helper and many sub
> tests need such a helper, not only thp tests.
> 
> split_huge_page_test also defines a write_file locally. The two have minior
> differences in return type and used exit api. And there would be conflicts
> if split_huge_page_test wanted to include thp_settings.h because of
> different prototype, making it less convenient.
> 
> It's possisble to merge the two, although some tests don't use the
> kselftest infrastrucutre for testing. It would also work when using the
> ksft_exit_msg() to exit in my test, as the counters are all zero. Output
> will be like:
> 
>   TAP version 13
>   1..62
>   Bail out! /proc/sys/vm/drop_caches1 open failed: No such file or directory
>   # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> So here just leave one version of write_file, and move it into the vm_util.
> This make it easy to maitain and user could just include one vm_util.h when
> then don't need thp setting helpers. Keep the prototype of returning the
> written bytes num.
> 
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> ---
> Changes in v2:
>   new patch from v2
> ---
>  .../selftests/mm/split_huge_page_test.c       | 15 ------------
>  tools/testing/selftests/mm/thp_settings.c     | 24 +------------------
>  tools/testing/selftests/mm/thp_settings.h     |  1 -
>  tools/testing/selftests/mm/vm_util.c          | 16 +++++++++++++
>  tools/testing/selftests/mm/vm_util.h          |  2 ++
>  5 files changed, 19 insertions(+), 39 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index e0167111bdd1..93f205327b84 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -255,21 +255,6 @@ static int check_after_split_folio_orders(char *vaddr_start, size_t len,
>  	return status;
>  }
>  
> -static void write_file(const char *path, const char *buf, size_t buflen)
> -{
> -	int fd;
> -	ssize_t numwritten;
> -
> -	fd = open(path, O_WRONLY);
> -	if (fd == -1)
> -		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> -
> -	numwritten = write(fd, buf, buflen - 1);
> -	close(fd);
> -	if (numwritten < 1)
> -		ksft_exit_fail_msg("Write failed\n");
> -}
> -
>  static void write_debugfs(const char *fmt, ...)
>  {
>  	char input[INPUT_MAX];
> diff --git a/tools/testing/selftests/mm/thp_settings.c b/tools/testing/selftests/mm/thp_settings.c
> index 574bd0f8ae48..02de28ecf31a 100644
> --- a/tools/testing/selftests/mm/thp_settings.c
> +++ b/tools/testing/selftests/mm/thp_settings.c
> @@ -6,6 +6,7 @@
>  #include <string.h>
>  #include <unistd.h>
>  
> +#include "vm_util.h"
>  #include "thp_settings.h"
>  
>  #define THP_SYSFS "/sys/kernel/mm/transparent_hugepage/"
> @@ -64,29 +65,6 @@ int read_file(const char *path, char *buf, size_t buflen)
>  	return (unsigned int) numread;
>  }
>  
> -int write_file(const char *path, const char *buf, size_t buflen)
> -{
> -	int fd;
> -	ssize_t numwritten;
> -
> -	fd = open(path, O_WRONLY);
> -	if (fd == -1) {
> -		printf("open(%s)\n", path);
> -		exit(EXIT_FAILURE);
> -		return 0;
> -	}
> -
> -	numwritten = write(fd, buf, buflen - 1);
> -	close(fd);
> -	if (numwritten < 1) {
> -		printf("write(%s)\n", buf);
> -		exit(EXIT_FAILURE);
> -		return 0;
> -	}
> -
> -	return (unsigned int) numwritten;
> -}
> -
>  unsigned long read_num(const char *path)
>  {
>  	char buf[21];
> diff --git a/tools/testing/selftests/mm/thp_settings.h b/tools/testing/selftests/mm/thp_settings.h
> index 76eeb712e5f1..7748a9009191 100644
> --- a/tools/testing/selftests/mm/thp_settings.h
> +++ b/tools/testing/selftests/mm/thp_settings.h
> @@ -63,7 +63,6 @@ struct thp_settings {
>  };
>  
>  int read_file(const char *path, char *buf, size_t buflen);
> -int write_file(const char *path, const char *buf, size_t buflen);
>  unsigned long read_num(const char *path);
>  void write_num(const char *path, unsigned long num);
>  
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index a6d4ff7dfdc0..b4b3b48f8dc9 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -764,3 +764,19 @@ int unpoison_memory(unsigned long pfn)
>  
>  	return ret > 0 ? 0 : -errno;
>  }
> +
> +unsigned int write_file(const char *path, const char *buf, size_t buflen)
> +{
> +	int fd;
> +	ssize_t numwritten;
> +
> +	fd = open(path, O_WRONLY);
> +	if (fd == -1)
> +		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
> +
> +	numwritten = write(fd, buf, buflen - 1);
> +	close(fd);
> +	if (numwritten < 1)
> +		ksft_exit_fail_msg("Write failed\n");
> +	return (unsigned int) numwritten;

If we exit on any failure, the function can be void just like in
split_huge_page_test.c. This will also simplify write_num() and read_num()
in thp_settigns.c

> +}
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index e9c4e24769c1..22c8805e0d7a 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -166,3 +166,5 @@ int unpoison_memory(unsigned long pfn);
>  
>  #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
>  #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
> +
> +unsigned int write_file(const char *path, const char *buf, size_t buflen);
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.

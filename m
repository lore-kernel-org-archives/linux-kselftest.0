Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935739A7EF;
	Mon, 23 Mar 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280945; cv=none; b=WtiC7yiUWcQJWcmsNDQ14uv43KfEV7sXm/MCAtqJhM03EahyT6Fv0uYYgEnygwcNwJr69OK+m80yPsIk9fsrrFkxSnqnmkUF0IYwRNR1iwMeXZtXtuuTNoik4kpa1iyqIwGuc+TiM+eCh8m4TVOKgbrk5jEMaW/N2COabgbZi4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280945; c=relaxed/simple;
	bh=MMLWnE4+owXgbpiWUI1UdF31XC9AUzjDGtFrfk10ct4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HU/cmrBp0QOoZiBkM99+0AOt7NfK1OWqzgvV1+MTfMnYh+vPieDlsFtimgNd1oTKsbK1MKzqoKq6nYtDsX893asu8iYjI3eCD/Fll1Rwd32r9TQGX81joVUVn+azl4r51ByyH+r/TbizGKzfDrra2ykHw1jBufr8YAWqqXOxas8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gyb9cPTF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gyb9cPTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CC2C4CEF7;
	Mon, 23 Mar 2026 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280945;
	bh=MMLWnE4+owXgbpiWUI1UdF31XC9AUzjDGtFrfk10ct4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gyb9cPTF4uDc6h/CEIQTbhZL2XfjiK64YwEU9X2eh9SgOoDYTBlUZJNv+QfpGHd5w
	 3GipXY2MMeqNMnRrX6uI/uOic1dokXzAvVQuUkNZ4mgiMiujxNBo+OZlUjNbFUbfRv
	 G+eUzltAzGsYCa/hpZ4PW4nrQf1QBH93s0BEK3Jt/pENYR8WC/3O3AEx2iScta1mAD
	 jtbf2laiX5ZQOsn31A/97djG05ERFZo1X4bNGBq4cULXYvyBVzakO6UBh7LjF0MkY7
	 MwTWbOaRQB7DoJcH4wqOL3K/m32AaeHOA8xWIIEhS92OE162vFEPv2ydpe9WfdU+Ws
	 TUA+TJH+KSoiA==
Date: Mon, 23 Mar 2026 15:48:58 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev
Subject: Re: [PATCH v5 3/6] selftests/mm: move write_file helper to vm_util
Message-ID: <b992bd2d-f811-407e-835f-30d9c9d707ad@lucifer.local>
References: <20260323151753.2576137-1-chuhu@redhat.com>
 <20260323151753.2576137-4-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323151753.2576137-4-chuhu@redhat.com>

On Mon, Mar 23, 2026 at 11:17:50PM +0800, Chunyu Hu wrote:
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
> So here we just keep the version in split_huge_page_test, and move it into
> the vm_util. This makes it easy to maitain and user could just include one
> vm_util.h when they don't need thp setting helpers. Keep the prototype of
> void return as the function will exit on any error, return value is not
> necessary, and will simply the callers like write_num() and write_string().
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

I already reviewed this :) but easy to accidentally forget to propagate
tags. Anyway, as before:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Cheers, Lorenzo

> ---
> Changes in v5:
>   - updated acked-by and reviewed-by
> Changes in v3:
>   - make the write_file void return
> Changes in v2:
>   new patch from v2
> ---
>  .../selftests/mm/split_huge_page_test.c       | 15 --------
>  tools/testing/selftests/mm/thp_settings.c     | 35 ++-----------------
>  tools/testing/selftests/mm/thp_settings.h     |  1 -
>  tools/testing/selftests/mm/vm_util.c          | 15 ++++++++
>  tools/testing/selftests/mm/vm_util.h          |  2 ++
>  5 files changed, 20 insertions(+), 48 deletions(-)
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
> index 574bd0f8ae48..e748ebfb3d4e 100644
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
> @@ -104,10 +82,7 @@ void write_num(const char *path, unsigned long num)
>  	char buf[21];
>
>  	sprintf(buf, "%ld", num);
> -	if (!write_file(path, buf, strlen(buf) + 1)) {
> -		perror(path);
> -		exit(EXIT_FAILURE);
> -	}
> +	write_file(path, buf, strlen(buf) + 1);
>  }
>
>  int thp_read_string(const char *name, const char * const strings[])
> @@ -165,11 +140,7 @@ void thp_write_string(const char *name, const char *val)
>  		printf("%s: Pathname is too long\n", __func__);
>  		exit(EXIT_FAILURE);
>  	}
> -
> -	if (!write_file(path, val, strlen(val) + 1)) {
> -		perror(path);
> -		exit(EXIT_FAILURE);
> -	}
> +	write_file(path, val, strlen(val) + 1);
>  }
>
>  unsigned long thp_read_num(const char *name)
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
> index a6d4ff7dfdc0..ad96d19d1b85 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -764,3 +764,18 @@ int unpoison_memory(unsigned long pfn)
>
>  	return ret > 0 ? 0 : -errno;
>  }
> +
> +void write_file(const char *path, const char *buf, size_t buflen)
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
> +}
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index e9c4e24769c1..1a07305ceff4 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -166,3 +166,5 @@ int unpoison_memory(unsigned long pfn);
>
>  #define PAGEMAP_PRESENT(ent)	(((ent) & (1ull << 63)) != 0)
>  #define PAGEMAP_PFN(ent)	((ent) & ((1ull << 55) - 1))
> +
> +void write_file(const char *path, const char *buf, size_t buflen);
> --
> 2.53.0
>

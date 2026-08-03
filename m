Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83CF3B8BD1;
	Mon,  3 Aug 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747620; cv=none; b=YRn/suuPN16ovLhtBoOZY0U82hr9zI7lnjiBHE++hb/CbF+4mOe0dFRkGvdzaiwCsyz0AxXw2DRgDsS2DPWVRj1Ujl/flX6MdWDyvaubvqNzB9oXxV43w/6DU7VMj2ruW5ui38wxPiSyRiqgnzKX8uHnG8+TIV4lofKlISmCj6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747620; c=relaxed/simple;
	bh=yIoQzeA3+eNYo9HamvPvNh2wxGpS9MOC87OjQ55/HzM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=lBSHKeLbtgw1bQ0VTY742Npu9aIJtHMOO+Fps97xfMl36HBJn1kg5dGOAqyiNF80eaOA8NkmY3kZwfsLXsYqSOtYNCgVUDOkZABcnEENutQXuoj8Z7NVWEVyHkrX0lQVwIPrK10ytqRaCzh/idpccrnKN+Fjf5i6hwJOfJhS5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObFPZRaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObFPZRaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A021F00A3D;
	Mon,  3 Aug 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785747618;
	bh=CDyGVpKRvsgUiTdt9dQoahAliqSSSEzbSkLgMiPvdig=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ObFPZRaJ8W4laigLCeQcJidIzvhokFrB0G2z7yN0xI07olHXlzOdDKdjWDIFOEbRV
	 BPQZeEBlH+c4s2v4nmga/ia0CuLoINblpoPM+/2Ceumeg5RNSg30tYm4CXrLrEd2/H
	 KjWrrXVoiKWYjbfd/9Dxj2n+03QmKunGk+jeNY/G7gx7UlKh43bQWi4pSJb8GNQOe7
	 UDFQrHmJYBlRTOCD9JyYcCJReR4hSW0qSqEFMRfRZ7PPsdsZdyXcssH8h/6ihx9xfh
	 FkJEYolppxEmm64FbrnnDQCXiPuPPFQkDddlU6aJ3UywnLRkKEo0o2r8XvGdSMN4LM
	 2x9uCp9+yu1Gw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 1/6] selftests/mm: make file helpers return errors
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
In-Reply-To: <20260730140825.238130-2-sarthak.sharma@arm.com>
References: <20260730140825.238130-1-sarthak.sharma@arm.com>
 <20260730140825.238130-2-sarthak.sharma@arm.com>
Date: Mon, 03 Aug 2026 12:00:01 +0300
Message-Id: <178574760161.1561566.9774044559691998578.b4-review@b4>
X-Mailer: b4 0.16-dev

> Change read_file(), write_file(), read_num() and write_num() in vm_util.c
> to report failures to callers instead of exiting from the helper.
> 
> Make read_file() return a negative errno on failure instead of 0, so
> callers can distinguish a successful read from an I/O error. Also make
> read_num() reject negative and malformed values.
> 
> Update callers to print diagnostics and fail wherever required. This
> patch prepares the helpers to be moved to tools/lib/mm without
> kselftest dependency.
> 
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 2eab2110ac6a..db0db8a3df7c 100644
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
> @@ -61,8 +62,10 @@ int thp_read_string(const char *name, const char * const strings[])
>  		exit(EXIT_FAILURE);
>  	}
>  
> -	if (!read_file(path, buf, sizeof(buf))) {
> -		perror(path);
> +	ret = read_file(path, buf, sizeof(buf));
> +	if (ret < 0) {
> +		errno = -ret;
> +		ksft_perror(path);

I'm not a fan of changing errno, why can't we use

	ksft_print_msg("%s: %s\n", path, strerror(ret));

>  		exit(EXIT_FAILURE);
>  	}
>  
> @@ -700,91 +700,139 @@ int unpoison_memory(unsigned long pfn)
>  
>  int read_file(const char *path, char *buf, size_t buflen)
>  {
> -	int fd;
> +	int fd, err;
>  	ssize_t numread;
>  
>  	fd = open(path, O_RDONLY);
>  	if (fd == -1)
> -		return 0;
> +		return -errno;
>  
>  	numread = read(fd, buf, buflen - 1);
>  	if (numread < 1) {
> +		err = numread ? errno : ENODATA;
>  		close(fd);
> -		return 0;
> +		return -err;
>  	}
>  
>  	buf[numread] = '\0';
>  	close(fd);
>  
> -	return (unsigned int) numread;
> +	return (int)numread;

Do we really care about how many bytes we read?
Can't we return 0 for success and -error code for failure?

Will also make checks for read_file() return value neater.

>  }
>  
> -unsigned long read_num(const char *path)
> +int read_num(const char *path, unsigned long *num)
>  {
> +	unsigned long val;
> +	int ret;
>  	char buf[21];
> +	char *end;
>  
> -	if (read_file(path, buf, sizeof(buf)) < 0)
> -		ksft_exit_fail_perror("read_file()");
> +	if (!num)
> +		return -EINVAL;
>  
> -	return strtoul(buf, NULL, 10);
> +	ret = read_file(path, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	errno = 0;
> +	val = strtoul(buf, &end, 10);
> +	if (errno)
> +		return -errno;
> +
> +	if (end == buf || buf[0] == '-')
> +		return -EINVAL;

We can check the sign right after read_file() and skip errno dance
around strtoul().

-- 
Sincerely yours,
Mike.


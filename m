Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7F33B97D
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 17:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051088; cv=none; b=HMF9SzqFW1Bmmy+dp51Gx7dJpApCy885LnX0X7DYTpDP6i0mdZUkmOMW/SwYqUTa7hmcoVIvujRx3Hc2XCrimXltforpVYis4IclkULJumm2Q7Zalpo3xV5tQUToqsyD6qRS/Zc7roUWyI7N99QazrswJLyrcdYze/NiqyRMRkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051088; c=relaxed/simple;
	bh=6ryugi3FtteuwfF3/9dqd80scjLNUIrK0qjfqZSYDCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNUQ86dBn7AFikuvS72vd4jQgi5zZ4KTLbFdjWLFN2GCSF4adp1GXUaIz8RA0/PN8juquQwESVz8HlA8GUqL+4uyRlo6aCQ7xSK/joanuNeUg+fSCC5cYcigeRIOn6nYHPIWV12ywQ7TOPpoOkoXIv2HZ9alkY21iESZyUzwrHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WI9a7Kch; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WI9a7Kch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777051084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJ8saootNnEwiz5oyNfmQuGhXkI29a9gU/iJodI/fbM=;
	b=WI9a7Kch6MnZ3JGMoiqbTfpGb5WX1wluZy9JlDDpRPvzHiimeM7gWi/fTEzQuMeT8M2KPa
	BKixlAQDmQ5NP6C35zprb8unWm/a1pdNxxlHyMEhXBFcohMNy0JjKDnI99d57cD5Qe7vCh
	aWo5gfoTaTXQnxif7NhSzGY9aqpzOrI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-Is-ySd41MjOP2ZhKakyP4g-1; Fri, 24 Apr 2026 13:17:00 -0400
X-MC-Unique: Is-ySd41MjOP2ZhKakyP4g-1
X-Mimecast-MFC-AGG-ID: Is-ySd41MjOP2ZhKakyP4g_1777051019
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-605e5d95cccso6453414137.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 10:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777051019; x=1777655819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJ8saootNnEwiz5oyNfmQuGhXkI29a9gU/iJodI/fbM=;
        b=PXawLB4xRtuko6alg+nG0w2IRqf3nSmeLhhNJVM+pHQSKlSdoLV+rTSJtwUSLQgrdC
         aYPsomG5he6OOyHaWx6GoQoeE6Zs2+LT7HU7APuZmNm63oDmBiJP4q2rU5Fo5QQ2F7/f
         a1OIIdunT+ReXoy4DFUrhTaGzekkamyUuDiBGj9UN/1nWFybmOhxVZOMULTrcPokb4Nn
         zmZ75Rq4mi9gcPf8MHWyRMwSfFIcpzVLBh6pl7eCla7dssHDDqhQ0qYNGmno4nEeRwHw
         I/O9PUu8QizIeBh1D4LhrxxAiLxiYl/xJkBKSmzCbJxBng0j1PqSv+aSHaRMobEqSyKa
         LyWg==
X-Forwarded-Encrypted: i=1; AFNElJ9+4GvjHgF5CoOjsG89jneN6ArtpnO5hVPonJjvoI9VfybejGYWpNnBcE6TxwksW1Q4bmgY6wxn3ayltRqRrWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTLaFPwYnVgtC6d5M+pdM9vz5andNTYJzfTFIqu2idvrBjT7ub
	gp90JbfgIDXns3TLuRK3RJxDX0LS+n3qAEV5mt2pvGHGE6M+ZIzoe1T4dg5LNunstwWzjALgLPo
	0DC2e07RG5tWgWSiJNSG+Vf4YZ7csARk2MSPJpHxV+YItyz7SHd4oqad0J4llL0YZnCa2X0JM9+
	Jitorc
X-Gm-Gg: AeBDieuvrAVFsSIuJX3juKP8fHmnPx+G/nu7k4ZhFh3+gDJS9LydtVNHyRLmlH/rLxN
	rmRQNMsjdkfqMmK3b23u51sua1OaXavZKXHERUsC7c9kLv6eCKqb037Z9mdxEqiySQSsvs6q5ne
	6bvODAHKXey8hFfCjAc8BShDQHcj9HTTWmB+bQohUVookYuBESN6y/juSE5tG6Eq/kh0qRtF2Zz
	PiJFUrewah+0nqhF6DiAA0ttoakSTmINKctkUf3Mn6J83kQSMRchmL2ShyokSIbL7UPC+I/hhV/
	cxAM7ynY+iCi3OE6qpo4xJUoiElUnS6nmUTg6LUKsEIAAku9qBpeeZbP5wjDm5E74Cr79Q8U2Mc
	ZdEqP2wKdOQPmw6q9itXw2mhge7uF2EkiSVBr
X-Received: by 2002:a05:6102:3e1a:b0:610:eb3d:bb2f with SMTP id ada2fe7eead31-616f7a45fc9mr18121369137.28.1777051018947;
        Fri, 24 Apr 2026 10:16:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3e1a:b0:610:eb3d:bb2f with SMTP id ada2fe7eead31-616f7a45fc9mr18121305137.28.1777051018402;
        Fri, 24 Apr 2026 10:16:58 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fc9715610sm61896621cf.10.2026.04.24.10.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 10:16:57 -0700 (PDT)
Message-ID: <5cf27d20-83b9-4690-b14c-b08d34d357eb@redhat.com>
Date: Fri, 24 Apr 2026 13:16:46 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/53] selftests/mm: merge map_hugetlb into
 hugepage-mmap
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-6-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-6-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:54, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Both tests create a hugettlb mapping, fill it with data and verify the
> data, the only difference is that one uses file-backed memory and another
> one uses anonymous memory.
> 
> Merge both tests into a single file.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/Makefile        |   1 -
>   tools/testing/selftests/mm/hugepage-mmap.c | 112 ++++++++++++++++-----
>   tools/testing/selftests/mm/map_hugetlb.c   |  88 ----------------
>   tools/testing/selftests/mm/run_vmtests.sh  |   1 -
>   4 files changed, 85 insertions(+), 117 deletions(-)
>   delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c
> 
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index cd24596cdd27..cbda989f6b6a 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -70,7 +70,6 @@ TEST_GEN_FILES += hugepage-vmemmap
>   TEST_GEN_FILES += khugepaged
>   TEST_GEN_FILES += madv_populate
>   TEST_GEN_FILES += map_fixed_noreplace
> -TEST_GEN_FILES += map_hugetlb
>   TEST_GEN_FILES += map_populate
>   ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64))
>   TEST_GEN_FILES += memfd_secret
> diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
> index d543419de040..f4fcc7c45875 100644
> --- a/tools/testing/selftests/mm/hugepage-mmap.c
> +++ b/tools/testing/selftests/mm/hugepage-mmap.c
> @@ -15,6 +15,7 @@
>   #include <unistd.h>
>   #include <sys/mman.h>
>   #include <fcntl.h>
> +#include "vm_util.h"
>   #include "kselftest.h"
>   
>   #define LENGTH (256UL*1024*1024)
> @@ -25,54 +26,111 @@ static void check_bytes(char *addr)
>   	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
>   }
>   
> -static void write_bytes(char *addr)
> +static void write_bytes(char *addr, size_t length)
>   {
>   	unsigned long i;
>   
> -	for (i = 0; i < LENGTH; i++)
> +	for (i = 0; i < length; i++)
>   		*(addr + i) = (char)i;
>   }
>   
> -static int read_bytes(char *addr)
> +static bool verify_bytes(char *addr, size_t length)
>   {
>   	unsigned long i;
>   
>   	check_bytes(addr);
> -	for (i = 0; i < LENGTH; i++)
> -		if (*(addr + i) != (char)i) {
> -			ksft_print_msg("Error: Mismatch at %lu\n", i);
> -			return 1;
> -		}
> -	return 0;
> +	for (i = 0; i < length; i++)
> +		if (*(addr + i) != (char)i)
> +			return false;

Is there a good reason to drop the ksft_print_msg() call? It looks like
a good debugging information. I'd also add the address to it.

> +
> +	return true;
>   }
>   
> -int main(void)
> +static bool test_mmap(size_t length, int mmap_flags, int fd,
> +		      const char *test_name)
>   {
>   	void *addr;
> -	int fd, ret;
>   
> -	ksft_print_header();
> -	ksft_set_plan(1);
> +	addr = mmap(NULL, length, PROTECTION, mmap_flags, fd, 0);
> +	if (addr == MAP_FAILED)
> +		ksft_exit_fail_perror("mmap");
> +
> +	ksft_print_msg("Returned address is %p\n", addr);
> +	check_bytes(addr);
> +	write_bytes(addr, length);
> +	if (!verify_bytes(addr, length))
> +		ksft_exit_fail_msg("%s\n", test_name);
> +
> +	/* munmap() length of MAP_HUGETLB memory must be hugepage aligned */
> +	if (munmap(addr, length))
> +		ksft_exit_fail_perror("munmap");
> +
> +	return true;
> +}
> +
> +static void test_anon_mmap(size_t length, int shift)
> +{
> +	const char *test_name = "hugetlb anonymous mmap";
> +	int mmap_flags = MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB;
> +	bool passed;
> +
> +	if (shift)
> +		mmap_flags |= (shift & MAP_HUGE_MASK) << MAP_HUGE_SHIFT;
> +
> +	passed = test_mmap(length, mmap_flags, -1, test_name);
> +	ksft_test_result(passed, "%s\n", test_name);
> +}
> +
> +static void test_file_mmap(size_t length, int shift)
> +{
> +	const char *test_name = "hugetlb file mmap";
> +	int mmap_flags = MAP_SHARED;
> +	bool passed;
> +	int fd;
> +
> +	if (shift)
> +		mmap_flags |= (shift & MAP_HUGE_MASK) << MAP_HUGE_SHIFT;
>   
> -	fd = memfd_create("hugepage-mmap", MFD_HUGETLB);
> +	fd = memfd_create("hugetlb-mmap", MFD_HUGETLB);
>   	if (fd < 0)
> -		ksft_exit_fail_msg("memfd_create() failed: %s\n", strerror(errno));
> +		ksft_exit_fail_perror("memfd_create");
> +
> +	passed = test_mmap(length, mmap_flags, fd, test_name);
> +
> +	close(fd);
> +	ksft_test_result(passed, "%s\n", test_name);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	size_t hugepage_size;
> +	size_t length = LENGTH;
> +	int shift = 0;
> +
> +	ksft_print_header();
> +	ksft_set_plan(2);
> +
> +	if (argc > 1)
> +		length = atol(argv[1]) << 20;
> +	if (argc > 2)
> +		shift = atoi(argv[2]);
>   
> -	addr = mmap(NULL, LENGTH, PROTECTION, MAP_SHARED, fd, 0);
> -	if (addr == MAP_FAILED) {
> -		close(fd);
> -		ksft_exit_fail_msg("mmap(): %s\n", strerror(errno));
> +	if (shift) {
> +		hugepage_size = (1 << shift);
> +		ksft_print_msg("%u kB hugepages\n", 1 << (shift - 10));
> +	} else {
> +		hugepage_size = default_huge_page_size();
> +		ksft_print_msg("Default size hugepages (%lu Kb)\n", hugepage_size >> 10);
>   	}
>   
> -	ksft_print_msg("Returned address is %p\n", addr);
> -	check_bytes(addr);
> -	write_bytes(addr);
> -	ret = read_bytes(addr);
> +	/* munmap with fail if the length is not page aligned */
> +	if (hugepage_size > length)
> +		length = hugepage_size;
>   
> -	munmap(addr, LENGTH);
> -	close(fd);
> +	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
>   
> -	ksft_test_result(!ret, "Read same data\n");
> +	test_anon_mmap(length, shift);
> +	test_file_mmap(length, shift);
>   
> -	ksft_exit(!ret);
> +	ksft_finished();
>   }
> diff --git a/tools/testing/selftests/mm/map_hugetlb.c b/tools/testing/selftests/mm/map_hugetlb.c
> deleted file mode 100644
> index aa409107611b..000000000000
> --- a/tools/testing/selftests/mm/map_hugetlb.c
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Example of using hugepage memory in a user application using the mmap
> - * system call with MAP_HUGETLB flag.  Before running this program make
> - * sure the administrator has allocated enough default sized huge pages
> - * to cover the 256 MB allocation.
> - */
> -#include <stdlib.h>
> -#include <stdio.h>
> -#include <unistd.h>
> -#include <sys/mman.h>
> -#include <fcntl.h>
> -#include "vm_util.h"
> -#include "kselftest.h"
> -
> -#define LENGTH (256UL*1024*1024)
> -#define PROTECTION (PROT_READ | PROT_WRITE)
> -
> -static void check_bytes(char *addr)
> -{
> -	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
> -}
> -
> -static void write_bytes(char *addr, size_t length)
> -{
> -	unsigned long i;
> -
> -	for (i = 0; i < length; i++)
> -		*(addr + i) = (char)i;
> -}
> -
> -static void read_bytes(char *addr, size_t length)
> -{
> -	unsigned long i;
> -
> -	check_bytes(addr);
> -	for (i = 0; i < length; i++)
> -		if (*(addr + i) != (char)i)
> -			ksft_exit_fail_msg("Mismatch at %lu\n", i);
> -
> -	ksft_test_result_pass("Read correct data\n");
> -}
> -
> -int main(int argc, char **argv)
> -{
> -	void *addr;
> -	size_t hugepage_size;
> -	size_t length = LENGTH;
> -	int flags = MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB;
> -	int shift = 0;
> -
> -	hugepage_size = default_huge_page_size();
> -	/* munmap with fail if the length is not page aligned */
> -	if (hugepage_size > length)
> -		length = hugepage_size;
> -
> -	ksft_print_header();
> -	ksft_set_plan(1);
> -
> -	if (argc > 1)
> -		length = atol(argv[1]) << 20;
> -	if (argc > 2) {
> -		shift = atoi(argv[2]);
> -		if (shift)
> -			flags |= (shift & MAP_HUGE_MASK) << MAP_HUGE_SHIFT;
> -	}
> -
> -	if (shift)
> -		ksft_print_msg("%u kB hugepages\n", 1 << (shift - 10));
> -	else
> -		ksft_print_msg("Default size hugepages\n");
> -	ksft_print_msg("Mapping %lu Mbytes\n", (unsigned long)length >> 20);
> -
> -	addr = mmap(NULL, length, PROTECTION, flags, -1, 0);
> -	if (addr == MAP_FAILED)
> -		ksft_exit_fail_msg("mmap: %s\n", strerror(errno));
> -
> -	ksft_print_msg("Returned address is %p\n", addr);
> -	check_bytes(addr);
> -	write_bytes(addr, length);
> -	read_bytes(addr, length);
> -
> -	/* munmap() length of MAP_HUGETLB memory must be hugepage aligned */
> -	if (munmap(addr, length))
> -		ksft_exit_fail_msg("munmap: %s\n", strerror(errno));
> -
> -	ksft_finished();
> -}
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index e2dc9ac87bfc..61b450032af8 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -292,7 +292,6 @@ CATEGORY="hugetlb" run_test ./hugepage-shm
>   echo "$shmmax" > /proc/sys/kernel/shmmax
>   echo "$shmall" > /proc/sys/kernel/shmall
>   
> -CATEGORY="hugetlb" run_test ./map_hugetlb
>   CATEGORY="hugetlb" run_test ./hugepage-mremap
>   CATEGORY="hugetlb" run_test ./hugepage-vmemmap
>   CATEGORY="hugetlb" run_test ./hugetlb-madvise


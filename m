Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59992F3C1F
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 15:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562800; cv=none; b=doOv6NmziiMnfKrunyRXbw97j5ITwMBeSne7//MQ452AH+It77fSu+AwziNiFxT5Rfs0sopqVjG4eN1ePkVaxf5Iq0djSahVseJIi2wtw/ynBiQ35LEYZ+PL6TSn8EZPbjSeCdcybQppfPIToM1+J+UhYl+VCD0fawCVA2Bkbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562800; c=relaxed/simple;
	bh=JdFGXLTZgYBSWthfA6Yp3eJLSMbe8rUpbaLVx/8iLjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lxn+gdwvCDZhat6RGVtTfpPiuI0hdSHy57WDNtvKcFfymAOm4hEnN+xQGsfNtiVzx/nqQuBD7Xc/aW2Z2glwq+nL/UJnNWNbp3y8gAdMQuFP+0+t4p7FiZ4mb1N5JzDN2A3POiHFtUFUQq985RxguVNjkPU9ywPI2/6iaTuL4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e94SryTM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e94SryTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777562797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7qIWLPcjMTN4bDDZHUp9qSeDfxtoy9Fn4LiFM5JMGo=;
	b=e94SryTMV9JszuXfS5A5dE5z5/FdaZ2XO223kHTM5buGFRvAEkpSV86S5jcNd9AgNSNJTB
	ZJji3cMRv99loxuIGdXj0gQiy8LkBNq2Gdf/xbeVdKXrXPhscNRevlZXSwRAECbu2YkcUI
	sizZULKbbk+bTtqGoAhK4ZJI21H+dOI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-Ui7su4Q0OTqwvoxTiLurHw-1; Thu, 30 Apr 2026 11:26:35 -0400
X-MC-Unique: Ui7su4Q0OTqwvoxTiLurHw-1
X-Mimecast-MFC-AGG-ID: Ui7su4Q0OTqwvoxTiLurHw_1777562792
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb21daf7ddso206186185a.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 08:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777562792; x=1778167592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7qIWLPcjMTN4bDDZHUp9qSeDfxtoy9Fn4LiFM5JMGo=;
        b=S/XXVT0p2+vXxCE7oNVjdiAsYjOopC66PrrS4QWOJ0mF6JoeX9I3AkaZ6A/MU6mH1Y
         VYdEKmguwF2yOBi/XklabOvgY/XvZn+SLNegRflbsjVJ7GqSrkYq/TMG7SGO210NpRt7
         4dFcCvrPvgR7kCPZcP2YfaDxO4dl4vCrqTyfA9IO7zLfj95GjEY/AMEPQJQtTok+KVoS
         U0jUERdAvCn45Fgjonkb1AiDVdBLht61IxG0jxztgCxVYJ6bweWvn06msBHhPMlrM1Ig
         DrwzoGyalhkg1HGgsXSt5jieHQOLG07wFyAS0wqRbR7V+BPjN8zKQ+0C5EC7AZshZiKT
         8F7A==
X-Forwarded-Encrypted: i=1; AFNElJ/QX/rAs3TuILTNx4uFCQ87BU+D5PqzjPz/eWwWn7GbxtjbskZU2FbD96fz6JUKAvHUSFTnC55+DvU8abOFDxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx281AT3N5YmSKWh/uKWH05rkousmz53cPKFI0d+6FOBRw+Sk6m
	9Tlo1M8QMDYcCMIo5zVGejiTLEiIPnUReZDIPa0GxIltCCJmqPCsgzlTI+ao60McqdrRbmU3XKn
	1EKcAdcrwgGV04bUIHngbxiLddbVLmxPs7jMloBCt5AfdJ24QYejDHnFuwvMSoGR3UByd9w==
X-Gm-Gg: AeBDiet/K2vwjC+AG92xMlIKrKt7uyYMgbTof23r8ksIub7RZhnLwwHnhGGSyP5RPIk
	oex12s82g9+Tsn5yAz5OYFUkRBPzop4M/t86+JlrcY+w1Zwoppvs96PplnbgPSCSpnP44nWkYIK
	ZSWY+lWDH4/ktPDcWhruvJzI31Az1Xz7EUmO+fI0ckjka2q/xfdhGoDqNFzXS4HW8OgszFIeW2B
	U0ERKmHl4OshnkK9U8gB+3OP4kOcAZ4cW4aKh1j5GZbTbTJhX9xLy95Q5rnJ1L+JJWhWYkRLaTP
	lqf0jL1xGsHH2UaQ29+g1EvrEPW07ZCgx+IrP7mcm1kX3zGGp/HC3a2oQO6PDf4ikzuyytSuNk+
	HxGjTZ8hymKozgUFTlpXmTUQKGLjafvsZePoNb8Mwzq8V31t0IqOqzZ+kSBSDQT3+emlo6LvRyJ
	s6vpoEvtWBlAAMHnPyg9Kwkp8=
X-Received: by 2002:a05:620a:2890:b0:8cd:942e:82dc with SMTP id af79cd13be357-8fa89eed0f9mr536080485a.41.1777562792039;
        Thu, 30 Apr 2026 08:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2890:b0:8cd:942e:82dc with SMTP id af79cd13be357-8fa89eed0f9mr536073885a.41.1777562791402;
        Thu, 30 Apr 2026 08:26:31 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fba12659b0sm13129185a.27.2026.04.30.08.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:26:30 -0700 (PDT)
Message-ID: <9df37bb8-c802-48bf-aef9-ef85e94601de@redhat.com>
Date: Thu, 30 Apr 2026 11:26:19 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/54] selftests/mm: merge map_hugetlb into
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
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-7-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-7-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:41, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Both tests create a hugettlb mapping, fill it with data and verify the
> data, the only difference is that one uses file-backed memory and another
> one uses anonymous memory.
> 
> Merge both tests into a single file.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

> ---
>   tools/testing/selftests/mm/Makefile        |   1 -
>   tools/testing/selftests/mm/hugepage-mmap.c | 111 ++++++++++++++++-----
>   tools/testing/selftests/mm/map_hugetlb.c   |  88 ----------------
>   tools/testing/selftests/mm/run_vmtests.sh  |   1 -
>   4 files changed, 86 insertions(+), 115 deletions(-)
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
> index d543419de040..fa886ec148c2 100644
> --- a/tools/testing/selftests/mm/hugepage-mmap.c
> +++ b/tools/testing/selftests/mm/hugepage-mmap.c
> @@ -15,6 +15,8 @@
>   #include <unistd.h>
>   #include <sys/mman.h>
>   #include <fcntl.h>
> +#include <linux/memfd.h>
> +#include "vm_util.h"
>   #include "kselftest.h"
>   
>   #define LENGTH (256UL*1024*1024)
> @@ -25,54 +27,113 @@ static void check_bytes(char *addr)
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
> +	for (i = 0; i < length; i++)
>   		if (*(addr + i) != (char)i) {
> -			ksft_print_msg("Error: Mismatch at %lu\n", i);
> -			return 1;
> +			ksft_print_msg("Error: Mismatch at %lu(%p)\n", i, addr);
> +			return false;
>   		}
> -	return 0;
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
> +	int mfd_flags = MFD_HUGETLB;
> +	bool passed;
> +	int fd;
> +
> +	if (shift)
> +		mfd_flags |= (shift & MFD_HUGE_MASK) << MFD_HUGE_SHIFT;
>   
> -	fd = memfd_create("hugepage-mmap", MFD_HUGETLB);
> +	fd = memfd_create("hugetlb-mmap", mfd_flags);
>   	if (fd < 0)
> -		ksft_exit_fail_msg("memfd_create() failed: %s\n", strerror(errno));
> +		ksft_exit_fail_perror("memfd_create");
> +
> +	passed = test_mmap(length, MAP_SHARED, fd, test_name);
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


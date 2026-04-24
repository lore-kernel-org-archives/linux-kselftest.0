Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CDA3E557E
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777051220; cv=none; b=mQ+qBNsz525ec0zZrLNJg85HmQ/I4+emMQV274fxvA/s7NeACPSqqr/QjcVVjQFznXRMOaIRD6ehRMHipVA1yZC6sIzs4smslBEPlc7p5923TroAH4hAccjwEWBT7eyxaHpYJ8BuKBVHLdQIx0ABPK/AE1w64R2GNphAojvkIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777051220; c=relaxed/simple;
	bh=PovRbSemUueXoYODEXwd3J9HbPCGsHTHWR7LqTeyPQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEikwuG2brrvzjlapHs6DmHJICcw25AEu1/RynhBYQ1hbcfjWkFBQgRg1vUELpeJs99T+vh053Vx5zMOl0TG8uMWplFCi4a/VyWjM23+Aqr9sHvShQaP+crGw8P2UxbJ9rEnsla9nsUDTk8mKXOvEHKpFKft4Pehe35pOSH6bbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AQMHRQMe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AQMHRQMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777051216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXbdvzcx3AGgA9t9mIdiI3dWKSgdhols9baBSfTZi60=;
	b=AQMHRQMeRzFLOMQkY9V4rb4fknxViAguWiQ96sooZyC3EPMdMNQ4YDy6YvcktRmEQT/uiL
	7uKGNu6/yP4XF0zioBTYF2k72+nWD0m8akCnIbnyUPC+pllZ14AQUQkhlGnf8nj3NcuzEE
	7B9FPJB8YLBLbA/rnTvdhpn2IRkWoV4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-BrHJhnxINUCN_iXx5GWxwQ-1; Fri, 24 Apr 2026 13:20:15 -0400
X-MC-Unique: BrHJhnxINUCN_iXx5GWxwQ-1
X-Mimecast-MFC-AGG-ID: BrHJhnxINUCN_iXx5GWxwQ_1777051215
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca29dcd69so199955186d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 10:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777051215; x=1777656015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XXbdvzcx3AGgA9t9mIdiI3dWKSgdhols9baBSfTZi60=;
        b=T09Iryv6TBWIFbU85v081ulujmOJA/Aku2fr6C7dFv5foeTMfJnlRZGUvaDg3Q918R
         magbthQDqQV/7KGeoKERPOPPyOG8PnhS05lLUpfWPQDBa7OsmAa6C2Rzwdb+TZ1l5juQ
         /CQq7gfOAj9fDockbQ67cZwvv1zJlAuVIAI67VYWKr3RYyS8JkOugsdfY7lPTVk94i5/
         Gjpp/Am1mbfsycz8sik3ZkSMxhoUy8sJf7pTdk52hPeiiZhLrzO52HGqtMqR6vyTa6FX
         WQ4p+QohAr901WB5Unxk+0N3qCxiC/MMI5vhLjBPi1IwGrLSl12kluzVsdlZBDaqXAeI
         ACoA==
X-Forwarded-Encrypted: i=1; AFNElJ/3ilh2BWu3jdrB+mcbu38qPool3JEc28/Kos9m6WqcSaz38jjZV4eSBbLlkRw/TVK7KNsufV2XYxJv7u8Z4Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkEZ9MY/x05Fbm1BvE30xShOlFCVUmojr+oF2etCSSuJKgwwi2
	nJsYnHZ0qix2AMOcAgr/ElIvNlbpP+IbFlznJ8Ed2EEwJcPa7H2vwiYoho8HPe2SOChMtNn0XdI
	P8HPoEqKW2wBE9DSWIAsLEyAS75XJd4YtWQG5Sjlgdyd3SRY5m3fz1SwHWNxtjoTbVSByjA==
X-Gm-Gg: AeBDietGedqDx3GfnBr8HJvfP3ENhLkRBLDu7fM8SmyxOWg2qR7jNBoSoACm0RnVRfa
	aadIlggebtL176WU/vM36I5wHgvJ/vDs2VtEJhV3wtGAVPIWLJesgVOGPo/ChyQ60RAjRGZFoze
	PdpEjGZPE5cl9BWp4KVjqTrED5+RsN8BvoEjdTx8shoBEDGILpJIH9yt/X9iqh0AjFQrIkG1Ys+
	1V1bhSnAqp2d54lQSOnl7dK3PYUfCrXSUVhW9WWGWwc8sWCcuEOKbH6n0KljSUD+AsFt3rozHyM
	Xvy8LsgUOoyHcdiffrHzIVt3VKg/8giIHPLnRIXcXRp9e+LIQoJpSTB+NH0AzXvdtyf3ZNV4ZJg
	djKLNmwGZaRUYxGx8VzagOYK9Jk+6/H1cHRCl
X-Received: by 2002:a05:6214:411a:b0:896:f97c:2f83 with SMTP id 6a1803df08f44-8b0281babfbmr509469086d6.33.1777051214573;
        Fri, 24 Apr 2026 10:20:14 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:896:f97c:2f83 with SMTP id 6a1803df08f44-8b0281babfbmr509468356d6.33.1777051214058;
        Fri, 24 Apr 2026 10:20:14 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7834esm185766586d6.18.2026.04.24.10.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 10:20:13 -0700 (PDT)
Message-ID: <4d2fb0ec-91e4-4902-9d7f-68d782ee98c7@redhat.com>
Date: Fri, 24 Apr 2026 13:20:02 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/53] selftests/mm: rename hugepage-* tests to
 hugetlb-*
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
 <20260418105539.1261536-7-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-7-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:54, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> hugepage could mean both THP and HugeTLB these days.
> 
> Rename hugepage-* tests for HugeTLB to hugetlb-* to avoid confusion.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed by: Donet Tom <donettom@linux.ibm.com>
> ---
>   tools/testing/selftests/mm/.gitignore                     | 4 ++++
>   tools/testing/selftests/mm/Makefile                       | 8 ++++----
>   tools/testing/selftests/mm/hugetlb-madvise.c              | 2 +-
>   .../selftests/mm/{hugepage-mmap.c => hugetlb-mmap.c}      | 2 +-
>   .../selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c}  | 2 +-
>   .../selftests/mm/{hugepage-shm.c => hugetlb-shm.c}        | 2 +-
>   .../mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c}          | 0
>   tools/testing/selftests/mm/run_vmtests.sh                 | 8 ++++----
>   8 files changed, 16 insertions(+), 12 deletions(-)
>   rename tools/testing/selftests/mm/{hugepage-mmap.c => hugetlb-mmap.c} (99%)
>   rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (99%)
>   rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (99%)
>   rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (100%)
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index b0c30c5ee9e3..9ccd9e1447e6 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -4,6 +4,10 @@ hugepage-mmap
>   hugepage-mremap
>   hugepage-shm
>   hugepage-vmemmap

Shouldn't we remove these? Also, there's a reference to hugepage-mmap in
Documentation/admin-guide/mm/hugetlbpage.rst.

> +hugetlb-mmap
> +hugetlb-mremap
> +hugetlb-shm
> +hugetlb-vmemmap
>   hugetlb-madvise
>   hugetlb-read-hwpoison
>   hugetlb-soft-offline
> diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> index cbda989f6b6a..a6955660a806 100644
> --- a/tools/testing/selftests/mm/Makefile
> +++ b/tools/testing/selftests/mm/Makefile
> @@ -63,10 +63,10 @@ TEST_GEN_FILES += hmm-tests
>   TEST_GEN_FILES += hugetlb-madvise
>   TEST_GEN_FILES += hugetlb-read-hwpoison
>   TEST_GEN_FILES += hugetlb-soft-offline
> -TEST_GEN_FILES += hugepage-mmap
> -TEST_GEN_FILES += hugepage-mremap
> -TEST_GEN_FILES += hugepage-shm
> -TEST_GEN_FILES += hugepage-vmemmap
> +TEST_GEN_FILES += hugetlb-mremap
> +TEST_GEN_FILES += hugetlb-shm
> +TEST_GEN_FILES += hugetlb-vmemmap
> +TEST_GEN_FILES += hugetlb-mmap
>   TEST_GEN_FILES += khugepaged
>   TEST_GEN_FILES += madv_populate
>   TEST_GEN_FILES += map_fixed_noreplace
> diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
> index 5b12041fa310..898cc90b314f 100644
> --- a/tools/testing/selftests/mm/hugetlb-madvise.c
> +++ b/tools/testing/selftests/mm/hugetlb-madvise.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * hugepage-madvise:
> + * hugetlb-madvise:
>    *
>    * Basic functional testing of madvise MADV_DONTNEED and MADV_REMOVE
>    * on hugetlb mappings.
> diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugetlb-mmap.c
> similarity index 99%
> rename from tools/testing/selftests/mm/hugepage-mmap.c
> rename to tools/testing/selftests/mm/hugetlb-mmap.c
> index f4fcc7c45875..c0d58dd7cbf6 100644
> --- a/tools/testing/selftests/mm/hugepage-mmap.c
> +++ b/tools/testing/selftests/mm/hugetlb-mmap.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * hugepage-mmap:
> + * hugetlb-mmap:
>    *
>    * Example of using huge page memory in a user application using the mmap
>    * system call.  Before running this application, make sure that the
> diff --git a/tools/testing/selftests/mm/hugepage-mremap.c b/tools/testing/selftests/mm/hugetlb-mremap.c
> similarity index 99%
> rename from tools/testing/selftests/mm/hugepage-mremap.c
> rename to tools/testing/selftests/mm/hugetlb-mremap.c
> index b8f7d92e5a35..1c87c39780c5 100644
> --- a/tools/testing/selftests/mm/hugepage-mremap.c
> +++ b/tools/testing/selftests/mm/hugetlb-mremap.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * hugepage-mremap:
> + * hugetlb-mremap:
>    *
>    * Example of remapping huge page memory in a user application using the
>    * mremap system call.  The path to a file in a hugetlbfs filesystem must
> diff --git a/tools/testing/selftests/mm/hugepage-shm.c b/tools/testing/selftests/mm/hugetlb-shm.c
> similarity index 99%
> rename from tools/testing/selftests/mm/hugepage-shm.c
> rename to tools/testing/selftests/mm/hugetlb-shm.c
> index ef06260802b5..de8f5d523084 100644
> --- a/tools/testing/selftests/mm/hugepage-shm.c
> +++ b/tools/testing/selftests/mm/hugetlb-shm.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * hugepage-shm:
> + * hugetlb-shm:
>    *
>    * Example of using huge page memory in a user application using Sys V shared
>    * memory system calls.  In this example the app is requesting 256MB of
> diff --git a/tools/testing/selftests/mm/hugepage-vmemmap.c b/tools/testing/selftests/mm/hugetlb-vmemmap.c
> similarity index 100%
> rename from tools/testing/selftests/mm/hugepage-vmemmap.c
> rename to tools/testing/selftests/mm/hugetlb-vmemmap.c
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 61b450032af8..b9e520194634 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -282,18 +282,18 @@ run_test() {
>   
>   echo "TAP version 13" | tap_output
>   
> -CATEGORY="hugetlb" run_test ./hugepage-mmap
> +CATEGORY="hugetlb" run_test ./hugetlb-mmap
>   
>   shmmax=$(cat /proc/sys/kernel/shmmax)
>   shmall=$(cat /proc/sys/kernel/shmall)
>   echo 268435456 > /proc/sys/kernel/shmmax
>   echo 4194304 > /proc/sys/kernel/shmall
> -CATEGORY="hugetlb" run_test ./hugepage-shm
> +CATEGORY="hugetlb" run_test ./hugetlb-shm
>   echo "$shmmax" > /proc/sys/kernel/shmmax
>   echo "$shmall" > /proc/sys/kernel/shmall
>   
> -CATEGORY="hugetlb" run_test ./hugepage-mremap
> -CATEGORY="hugetlb" run_test ./hugepage-vmemmap
> +CATEGORY="hugetlb" run_test ./hugetlb-mremap
> +CATEGORY="hugetlb" run_test ./hugetlb-vmemmap
>   CATEGORY="hugetlb" run_test ./hugetlb-madvise
>   CATEGORY="hugetlb" run_test ./hugetlb_dio
>   


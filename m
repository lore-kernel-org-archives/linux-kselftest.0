Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660192;
	b=WAOzuJTbZRyKDhYLbxO5x9OFtQmaeBWwZksN/e6JDomZTnTRuqemgE6iAjLO7xq0cXPy
	 xSjeXsvTHeqnYc3v5ilcT/5HkKjD/C7C0mEb37UPEO9uHvFLxygFT1JX+z7Svkm3ZKltB
	 ymVsxgvkwkNUkLUAsoD96ekfH3ilRfB2IwQaVtVkwSikXowPJ838bZUpmFADuX+cNA3kx
	 xemCf01Ei8xf7jH282RLBzVdBhD+DMlHKsnOeaiP/BFSxU2TMeCWHriL1UGUOpPhZ2Ijm
	 GJL/5qt4cm1OYD5naKHu/RIG09C05DOSk6FKMXQQHtzjWrLfTHWSBln5pXU/42uvBGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660192;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nLUYkZP6o3sE/c6t39+tiUT1HGJzvTdIPDTkJDNa1dk=;
	b=IEnvcfTsUI7LbkhyQxBsDjDb2vN4JKffTa7uC9MOG+kLytjSkRBzqbdwlG//DbG0Zb6C
	 lSe0QGo3DfYGST39ay714JSSYZ+mOK9YcOunqxcSRIiHdpkSv5eFGDSdLHEJeVqfC8zKL
	 RDXSTvgzyMGpvIbvhUBWK3NLu4r4u7b3EQrI0AwL2DucTEPjeIojZNEbD5pN+vZdEdAGq
	 6LB4enw8CPe1DK4zQ28VfkxEkY4mjCz29NNm2+/NRfMPteHeLGMbRowcsCPC01Ga68Bml
	 1oeDOraDUVBgInWnpOr4EeQro4Cn42kJ9gTj7pAIjX2NYPSJp5q8rZVBykuDIYmbDRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ii+NLzoq;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22429606A323;
	Sat, 14 Nov 2026 12:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22429606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ii+NLzoq
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F0171516;
	Sat, 14 Nov 2026 04:43:07 -0800 (PST)
Received: from [10.163.159.227] (unknown [10.163.159.227])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 710D83F632;
	Sat, 14 Nov 2026 04:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794660190; bh=UwozEJCLQAVoo0F8fItA/0T+tAX/hvIaLGcjA9Tmh10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ii+NLzoqD8TWzkMaJ2vfWwCsnMLk/rchkW0O6KzWRKMDiXNGOjgpdl7+w/qnG84kO
	 Irl9yb3tWZrzUFOcZ+3zjZeuZWkeaauZrDFVu+J1/en8ohB+gCiZCDOy10ir3R9IpY
	 SRBHhLHb9B1wMIU18DhxaC02Cu28LnoCGTSiweJc=
Message-ID: <acbbc219-0b6a-4ec5-8047-af4b4b695212@arm.com>
Date: Sat, 14 Nov 2026 18:13:00 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] selftests/mm: replace transhuge-stress with a THP
 compaction selftest
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112090250.334344-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261112090250.334344-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/11/26 2:32 pm, Sarthak Sharma wrote:
> transhuge-stress is a stressor tool that repeatedly
> allocates and splits THPs till a specified duration. If the
> duration elapses, the test passes and fails only if a setup or
> system call fails.
> 
> This is not how a test residing in selftests/mm is supposed to
> behave. So remove it and add a new functional test called
> thp-compaction.c, that allocates THPs as much as it can,
> splits those THPs keeping one page retained and discarding
> others, and then retries allocating THPs, which will test
> if THP compaction is working fine. If we are able to recover
> more than half of the initial THPs, the test passes. Otherwise
> it fails.
> 
> This was suggested by David earlier [1].
> 

Isn't compaction_test.c already sort-of doing what you are trying to
do here?


> Patch 1 removes the current transhuge-stress. Patch 2 adds a check to see
> if PFNs are being masked due to no CAP_SYS_ADMIN in the initial user namespace.
> Patch 3 factors out THP split helpers from split_huge_page_test.c to vm_util.c.
> Patch 4 adds the
> new test.
> 
> [1] https://lore.kernel.org/all/94ace42d-8d60-4475-953e-74fb3dc23774@kernel.org/
> 
> Sarthak Sharma (4):
>   selftests/mm: remove transhuge-stress
>   selftests/mm: detect masked PFNs in allocate_transhuge()
>   selftests/mm: factor out THP split helpers
>   selftests/mm: add a THP compaction selftest
> 
>  MAINTAINERS                                   |   2 +-
>  tools/testing/selftests/mm/Makefile           |   2 +-
>  tools/testing/selftests/mm/ksm_tests.c        |  26 ++-
>  tools/testing/selftests/mm/run_vmtests.sh     |   2 +-
>  .../selftests/mm/split_huge_page_test.c       |  45 +---
>  tools/testing/selftests/mm/thp-compaction.c   | 215 ++++++++++++++++++
>  tools/testing/selftests/mm/transhuge-stress.c | 146 ------------
>  tools/testing/selftests/mm/vm_util.c          |  65 ++++++
>  tools/testing/selftests/mm/vm_util.h          |   6 +
>  9 files changed, 313 insertions(+), 196 deletions(-)
>  create mode 100644 tools/testing/selftests/mm/thp-compaction.c
>  delete mode 100644 tools/testing/selftests/mm/transhuge-stress.c
> 


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86835DA55;
	Sat, 25 Apr 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777109357; cv=none; b=Pu8oZoZMcs4TRjurA3hGJ5Ctb8t88hzNg/9jZm6nMHjYpCn0esYBeaVIfZBPIqhRzeKU1dqLoA6RuLHUtfcXbR7y0pwFD1eecoou/RkVXxzuSa5BbUTPj5Uphsf2ApEs/B/RGW7C2rwYje1EnxY5IGwcCzRGjGQ4ob6KOXCDT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777109357; c=relaxed/simple;
	bh=OdxPm+0am8+CCpi6pZkzPwdx+wjcZGCDVFDlykgKLEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmiHytxyb0ytYLwrfwWFWqJvbb9fHT3TuKXjMY/OvDrNwoii/ACxhMRSld/KSv2q1EJld0Hct/oMyRlq0MXBFHuyzWenHg3b0qxfRFiBVKeDjFRUnIvac4DzyArHWQsvekESBTBqteLHcpzvNoLZmKO1yVblweweh7H0OpWMuZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y34dj+a9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y34dj+a9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DB6C2BCB0;
	Sat, 25 Apr 2026 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777109356;
	bh=OdxPm+0am8+CCpi6pZkzPwdx+wjcZGCDVFDlykgKLEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y34dj+a9++HQ4jif+i2oSLTZAg5SCVwF5le+Q6ofsUuv3MXkVU4/SOYjFj3gNQ8TR
	 LziSQKp93gPErh8DkXuEByAWWuXCo3Ltcbvz6gdcCKOP0rBGBkJK3I0QI8DUH7u44B
	 DbKJ9FmJOXYR37ZYagnIMuehwjL04Wz33YmsKS1vtahCXOjP+CJ944QudGFlFleMYK
	 PbJpwY/VipTrJkd3mXjZ4EmODueW6ZM6C41U7G8vWxB08Pu6iTpnYVq6lQkjfDy057
	 UUB67fdD/qLuP0NsXolYGFEXbtW+NjUjYAmp3KuUWvSb6/fcc1QjwlJ+d2vjlWbPXb
	 h48Qc63mXWBkw==
Date: Sat, 25 Apr 2026 11:29:05 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 05/53] selftests/mm: merge map_hugetlb into
 hugepage-mmap
Message-ID: <aeyJYXYJ5pAy7gmB@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-6-rppt@kernel.org>
 <5cf27d20-83b9-4690-b14c-b08d34d357eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf27d20-83b9-4690-b14c-b08d34d357eb@redhat.com>

On Fri, Apr 24, 2026 at 01:16:46PM -0400, Luiz Capitulino wrote:
> On 2026-04-18 06:54, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Both tests create a hugettlb mapping, fill it with data and verify the
> > data, the only difference is that one uses file-backed memory and another
> > one uses anonymous memory.
> > 
> > Merge both tests into a single file.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   tools/testing/selftests/mm/Makefile        |   1 -
> >   tools/testing/selftests/mm/hugepage-mmap.c | 112 ++++++++++++++++-----
> >   tools/testing/selftests/mm/map_hugetlb.c   |  88 ----------------
> >   tools/testing/selftests/mm/run_vmtests.sh  |   1 -
> >   4 files changed, 85 insertions(+), 117 deletions(-)
> >   delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c
> > 
> > diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> > index cd24596cdd27..cbda989f6b6a 100644
> > --- a/tools/testing/selftests/mm/Makefile
> > +++ b/tools/testing/selftests/mm/Makefile
> > @@ -70,7 +70,6 @@ TEST_GEN_FILES += hugepage-vmemmap
> >   TEST_GEN_FILES += khugepaged
> >   TEST_GEN_FILES += madv_populate
> >   TEST_GEN_FILES += map_fixed_noreplace
> > -TEST_GEN_FILES += map_hugetlb
> >   TEST_GEN_FILES += map_populate
> >   ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64 loongarch32 loongarch64))
> >   TEST_GEN_FILES += memfd_secret
> > diff --git a/tools/testing/selftests/mm/hugepage-mmap.c b/tools/testing/selftests/mm/hugepage-mmap.c
> > index d543419de040..f4fcc7c45875 100644
> > --- a/tools/testing/selftests/mm/hugepage-mmap.c
> > +++ b/tools/testing/selftests/mm/hugepage-mmap.c
> > @@ -15,6 +15,7 @@
> >   #include <unistd.h>
> >   #include <sys/mman.h>
> >   #include <fcntl.h>
> > +#include "vm_util.h"
> >   #include "kselftest.h"
> >   #define LENGTH (256UL*1024*1024)
> > @@ -25,54 +26,111 @@ static void check_bytes(char *addr)
> >   	ksft_print_msg("First hex is %x\n", *((unsigned int *)addr));
> >   }
> > -static void write_bytes(char *addr)
> > +static void write_bytes(char *addr, size_t length)
> >   {
> >   	unsigned long i;
> > -	for (i = 0; i < LENGTH; i++)
> > +	for (i = 0; i < length; i++)
> >   		*(addr + i) = (char)i;
> >   }
> > -static int read_bytes(char *addr)
> > +static bool verify_bytes(char *addr, size_t length)
> >   {
> >   	unsigned long i;
> >   	check_bytes(addr);
> > -	for (i = 0; i < LENGTH; i++)
> > -		if (*(addr + i) != (char)i) {
> > -			ksft_print_msg("Error: Mismatch at %lu\n", i);
> > -			return 1;
> > -		}
> > -	return 0;
> > +	for (i = 0; i < length; i++)
> > +		if (*(addr + i) != (char)i)
> > +			return false;
> 
> Is there a good reason to drop the ksft_print_msg() call?

Probably not :)

> It looks like a good debugging information. I'd also add the address to
> it.

Sure.

-- 
Sincerely yours,
Mike.

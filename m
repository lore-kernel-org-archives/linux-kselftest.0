Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52CF49B5DE;
	Fri, 11 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143849; cv=none; b=bdxK18p6LrZlP9uXERSzIytvlrx9Nbc4TFkaF74y409WglrENwLv/KGbZo/tyBQRZEFzl1e5dTnFkaStuTxWl9w0N3HQJw04k02t4cxSqnMs2O0gTosv1JwiNqNrNw19deWGKLXy0Mt4Jzc4yXmx1N/jf6rLkXSqrtuzoOF0WOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143849; c=relaxed/simple;
	bh=OAC/+t+zOxm3qX+0sYXiY/CHafOFrJAYbJ+ZXlb/zvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upd+YxRZPZPfjzTP+0IeogOeZfQXpMPRQswjHtZN4wM7tk09BV6dTIqMH2cjZOGggNmJqFsAVWqBGW5F3HBAvS5lrjyh1PRfbP/9gZkEM4aRvvve33O12j37EYQgjGwOAGK8oBKgzKCz6lD7exvbdiYF6/nex3D5X1R2NVmfmL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OHwxFymQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OHwxFymQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2084316F2;
	Fri, 11 Sep 2026 09:24:03 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E80A73F7B4;
	Fri, 11 Sep 2026 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789143846; bh=OAC/+t+zOxm3qX+0sYXiY/CHafOFrJAYbJ+ZXlb/zvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHwxFymQN1CZmSj6KzKrDt49fRNk5weOzIW7NYzxiKWEgg10ZMDJsC77fZ2boQ10u
	 yF2KB+PjklYu3mro3DMk2Agd+4GakPF2QCvegJmi8MQBWj5Z22jKKEFt5O/AP9/Ikg
	 WRKiBqt3cZEqmWE/qZ4Z+xrYuqMtBKAM1anuaYYk=
Date: Fri, 11 Sep 2026 17:24:02 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH] kselftest: mm: remove exclusion of building soft-dirty
 test in arm64
Message-ID: <aqQrIkcPf6uMlouk@e129823.arm.com>
References: <20260911125028.1268274-1-yeoreum.yun@arm.com>
 <0e419abb-71ce-4b97-b189-da86a4891920@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e419abb-71ce-4b97-b189-da86a4891920@kernel.org>

> On 9/11/26 14:50, Yeoreum Yun wrote:
> > Since commit 0389c305ef56 (“selftests/mm: skip soft-dirty tests when CONFIG_MEM_SOFT_DIRTY is disabled”),
> > the soft-dirty test is skipped when soft-dirty is not supported.
> > 
> > There is therefore no reason to exclude the test from being built on
> > arm64. Remove the arm64-specific exclusion.
> > 
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  tools/testing/selftests/mm/Makefile | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
> > index 2d5366196e30..d3e9bd67904a 100644
> > --- a/tools/testing/selftests/mm/Makefile
> > +++ b/tools/testing/selftests/mm/Makefile
> > @@ -104,10 +104,7 @@ TEST_GEN_FILES += guard-regions
> >  TEST_GEN_FILES += merge
> >  TEST_GEN_FILES += rmap
> >  TEST_GEN_FILES += folio_split_race_test
> > -
> > -ifneq ($(ARCH),arm64)
> >  TEST_GEN_FILES += soft-dirty
> > -endif
> >  
> >  ifeq ($(ARCH),x86_64)
> >  CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh "$(CC)" ../x86/trivial_32bit_program.c -m32)
> 
> Does that mean we can also the following?
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index d09f9f6a384ee..33963535616b2 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -390,10 +390,7 @@ then
>         CATEGORY="pkey" run_test ./protection_keys_64
>  fi
> 
> -if [ -x ./soft-dirty ]
> -then
> -       CATEGORY="soft_dirty" run_test ./soft-dirty
> -fi
> +CATEGORY="soft_dirty" run_test ./soft-dirty
> 
>  CATEGORY="pagemap" run_test ./pagemap_ioctl

Ah right. since all archs have the soft-dirty, we can remove the if
condition.

Thanks!

-- 
Sincerely,
Yeoreum Yun

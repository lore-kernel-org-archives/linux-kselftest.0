Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512D3DA5C3;
	Fri, 13 Mar 2026 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424879; cv=none; b=BOQSpWJXc3oJv0SIWZ9KSBjNEldnpuOLHo4Rgo0wbTK73d5TlExHF8Htq541UydrjjFgvoAQ915Tr5dVY+twEKnBxg1H03/d7j3xy1Cd2wSHEYwF+921R+4XWf9Cud3MH3qg/7B9AimsQb/YKrPCf/Xa46+iugcXHwxTVpct00I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424879; c=relaxed/simple;
	bh=MRzGhrN9hVB2ZGyVFh5yWabHT/MNGX9ojKRdz5/Xkvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLjTAbEIJslpX1U0c6Y23qzl8Uaa63/uyzkA33M77AkCw/o20Tz8nlC91E2hJnoeZ9NIcuVKYs3DTlYzlR5vvSoZTOflmFqN5/Dp0zFIwLnRWv1m+/t6hxeApyPwOGgFumsJEkTMu24KRjbPQQm6/NPKEDqMoZIphtu2LGRwoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTB3aETE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTB3aETE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79BEC19424;
	Fri, 13 Mar 2026 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773424879;
	bh=MRzGhrN9hVB2ZGyVFh5yWabHT/MNGX9ojKRdz5/Xkvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTB3aETEPFbMFd1V2117aVAW9Pg22Xn73fZp3/WCMkLiJnEkurTHr93HA0Zkj+m6h
	 L9khE7FeruWr9tfW/SPZgWtKrrglrpa3x2CT91Mjewrw2EreQ/dr6eB6BedfqfcxQ/
	 kYa3anCs35ma72duwKhUmsH/mPriCCXIFRm2NlLUr1FOYtQrdR66obbCkb0ZGnlv7F
	 +wVSWPAa81bjcPcKLXB5daOLsOTt3srjLSA5EIWqFnB7hHMC9Ea637oKqpWsAhFeNb
	 Sx2sjr5a4nEg3oO+WymUK4S8i4VAiQE9nup7ZpSV//ORiSK4ihRMfMsvmq+op8PTV6
	 6ietsbRCeYc3A==
Date: Fri, 13 Mar 2026 18:01:12 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 4/4] selftests/mm: transhuge_stress: skip the test
 when thp not available
Message-ID: <121d35f0-c46f-4c03-a470-8e8969181fe4@lucifer.local>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-5-chuhu@redhat.com>
 <708647e9-fc49-430c-a12c-f2b44caa273d@kernel.org>
 <abN5z5jpKL2GOWc3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abN5z5jpKL2GOWc3@gmail.com>

On Fri, Mar 13, 2026 at 10:43:27AM +0800, Chunyu Hu wrote:
> On Thu, Mar 12, 2026 at 08:46:23PM +0100, David Hildenbrand (Arm) wrote:
> > On 3/12/26 12:40, Chunyu Hu wrote:
> > > The test requires thp, skip the test when thp is not available to avoid
> > > false positive.
> > >
> > > Tested with thp disabled kernel.
> > > Before the fix:
> > >   # --------------------------------
> > >   # running ./transhuge-stress -d 20
> > >   # --------------------------------
> > >   # TAP version 13
> > >   # 1..1
> > >   # transhuge-stress: allocate 1453 transhuge pages, using 2907 MiB virtual memory and 11 MiB of ram
> > >   # Bail out! MADV_HUGEPAGE# Planned tests != run tests (1 != 0)
> > >   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> > >   # [FAIL]
> > >   not ok 60 transhuge-stress -d 20 # exit=1
> > >
> > > After the fix:
> > >   # --------------------------------
> > >   # running ./transhuge-stress -d 20
> > >   # --------------------------------
> > >   # 1..0 # SKIP Transparent Hugepages not available
> > >   # [SKIP]
> > >   ok 5 transhuge-stress -d 20 # SKIP
> > >
> > > CC: Li Wang <liwang@redhat.com>
> > > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> > > ---
> > >  tools/testing/selftests/mm/transhuge-stress.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
> > > index bcad47c09518..76316696426d 100644
> > > --- a/tools/testing/selftests/mm/transhuge-stress.c
> > > +++ b/tools/testing/selftests/mm/transhuge-stress.c
> > > @@ -17,6 +17,7 @@
> > >  #include <sys/mman.h>
> > >  #include "vm_util.h"
> > >  #include "kselftest.h"
> > > +#include "thp_settings.h"
> > >
> > >  int backing_fd = -1;
> > >  int mmap_flags = MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE;
> > > @@ -35,6 +36,9 @@ int main(int argc, char **argv)
> > >  	int pagemap_fd;
> > >  	int duration = 0;
> > >
> > > +	if (!thp_is_enabled())
> > > +		ksft_exit_skip("Transparent Hugepages not available\n");
> > > +
> > >  	ksft_print_header();
> >
> > Shouldn't that go under the ksft_print_header(), like you did in patch #3?
>
> It will print the TAP version. I'll change in v2 as you suggested. Thanks!

With that done, LGTM and:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

>
> >
> > --
> > Cheers,
> >
> > David
> >
>

Cheers, Lorenzo

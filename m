Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1D326F2B9
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777537; cv=none; b=Q8xoaTWBRnTBT8hPOLpyhCYVCRWRExVfMgQupGOkJEN2g+cBgJtba+w4la4ZS6MA7kP8obHTeWvEt4/kzjSg/8nJf/rsEL4M+6MfX++LSoJuB5Ko2DfC9P2f2gV1vriBSCASDtcETf752qK2b1/ECc+HR7KHo00IxzQzNLeLrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777537; c=relaxed/simple;
	bh=RyWg8ApgUdv3q7aYUcSs6j4QbyMl9kY49yaNmxDDBew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfcvSS9ubZ30sOaFBOC8VxmBQaxTgkqJEBmvTSi7dYZR6SQepWSDyCvVWkOuN0Pa5f8OwyroMSq7QC3K9NJ9gvIlzvFG7225Jj5naynLu25FDSWxdPiIVCeGJRISm4iZiUYu3OU+GjAEO05x2D9y3mELUI/39HoBYqSfTM9EtWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2a1v+Sy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2a1v+Sy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774777535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W32nfJzY59XmW2B9d/SGk3BvnOc25rvI+OCdxu9B65A=;
	b=F2a1v+SyGKeYNArC7PSIuR2Zc7IA8ENWn/6K9Bh6xRQlCOMro8rYGpwPcOyhaT/Qex8AxS
	VwyWuI34iaux/gBOrwZsDkgcSVP1GwFP1xsLrBBaR5FHL7xNB22UBEjYyIGsvH3QcDdmQV
	A5Kmkday+hLdY2x1t1Zc5av/0/9agl4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-wyu0aMiCO9yHo1yryKQgeg-1; Sun,
 29 Mar 2026 05:45:30 -0400
X-MC-Unique: wyu0aMiCO9yHo1yryKQgeg-1
X-Mimecast-MFC-AGG-ID: wyu0aMiCO9yHo1yryKQgeg_1774777528
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD12A180044D;
	Sun, 29 Mar 2026 09:45:27 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.11])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2AB5819560B1;
	Sun, 29 Mar 2026 09:45:17 +0000 (UTC)
Date: Sun, 29 Mar 2026 17:45:13 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v6 1/6] selftests/mm/guard-regions: skip collapse test
 when thp not enabled
Message-ID: <acj0qcCUUmj-x1OQ@gmail.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-2-chuhu@redhat.com>
 <399e238e-ed6a-4d74-b075-ead17fb47d3c@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <399e238e-ed6a-4d74-b075-ead17fb47d3c@lucifer.local>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Mar 27, 2026 at 07:43:14AM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Tue, Mar 24, 2026 at 09:33:11AM +0800, Chunyu Hu wrote:
> > When thp is not available, just skip the collape tests to avoid the false
> > negative.
> >
> > Without the change, run with a thp disabled kernel:
> >   ./run_vmtests.sh -t madv_guard -n 1
> >   <snip/>
> >   #  RUN           guard_regions.anon.collapse ...
> >   # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
> >   # collapse: Test terminated by assertion
> >   #          FAIL  guard_regions.anon.collapse
> >   not ok 2 guard_regions.anon.collapse
> >   <snip/>
> >   #  RUN           guard_regions.shmem.collapse ...
> >   # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
> >   # collapse: Test terminated by assertion
> >   #          FAIL  guard_regions.shmem.collapse
> >   not ok 32 guard_regions.shmem.collapse
> >   <snip/>
> >   #  RUN           guard_regions.file.collapse ...
> >   # guard-regions.c:2217:collapse:Expected madvise(ptr, size, MADV_NOHUGEPAGE) (-1) == 0 (0)
> >   # collapse: Test terminated by assertion
> >   #          FAIL  guard_regions.file.collapse
> >   not ok 62 guard_regions.file.collapse
> >   <snip/>
> >   # FAILED: 87 / 90 tests passed.
> >   # 17 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> >   # Totals: pass:70 fail:3 xfail:0 xpass:0 skip:17 error:0
> >
> > With this change, run with thp disabled kernel:
> >   ./run_vmtests.sh -t madv_guard -n 1
> >   <snip/>
> >   #  RUN           guard_regions.anon.collapse ...
> >   #      SKIP      Transparent Hugepages not available
> >   #            OK  guard_regions.anon.collapse
> >   ok 2 guard_regions.anon.collapse # SKIP Transparent Hugepages not available
> >   <snip/>
> >   #  RUN           guard_regions.file.collapse ...
> >   #      SKIP      Transparent Hugepages not available
> >   #            OK  guard_regions.file.collapse
> >   ok 62 guard_regions.file.collapse # SKIP Transparent Hugepages not available
> >   <snip/>
> >   #  RUN           guard_regions.shmem.collapse ...
> >   #      SKIP      Transparent Hugepages not available
> >   #            OK  guard_regions.shmem.collapse
> >   ok 32 guard_regions.shmem.collapse # SKIP Transparent Hugepages not available
> >   <snip/>
> >   # PASSED: 90 / 90 tests passed.
> >   # 20 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
> >   # Totals: pass:70 fail:0 xfail:0 xpass:0 skip:20 error:0
> >
> > Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > CC: Li Wang <liwang@redhat.com>
> > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> 
> Pretty sure I reviewed this already (but hey I forget to propagate tags myself
> sometimes so meh :P), anyway:
> 
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Thanks for the review. Will add in next version.

> 
> Cheers, Lorenzo
> 
> > ---
> > Changes in v5:
> >   - updated reviewed-by and acked-by
> > Changes in v4:
> >   - use thp_available instead of thp_is_enabled() as when thp is set to
> >     never, madvise(MADV_COLLAPSE) will still succeed by design. So a
> >     failure in madvise(MADV_COLLAPSE) on guard region will verify guard
> >     region denies it. This is suggested from AI.
> >   - removed the 'Reviewed-by' and 'Acked-by' as the code changes. Sorry for
> >     that but it seems the changes is a little huge? (1 out of 2 lines)..
> > Changes in v3:
> >   - commit message: update the log snippet with where the fail happens and
> >     add the '-n1' to the command.
> >   - fix the 'false positive' to 'false negative'
> >   - add reviwed by from Mike
> > Changes in v2:
> >   - add reviewed by from Zi and Lorenzo
> >   - add acked-by from David
> > ---
> >  tools/testing/selftests/mm/guard-regions.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> > index dbd21d66d383..48e8b1539be3 100644
> > --- a/tools/testing/selftests/mm/guard-regions.c
> > +++ b/tools/testing/selftests/mm/guard-regions.c
> > @@ -21,6 +21,7 @@
> >  #include <sys/uio.h>
> >  #include <unistd.h>
> >  #include "vm_util.h"
> > +#include "thp_settings.h"
> >
> >  #include "../pidfd/pidfd.h"
> >
> > @@ -2195,6 +2196,9 @@ TEST_F(guard_regions, collapse)
> >  	char *ptr;
> >  	int i;
> >
> > +	if (!thp_available())
> > +		SKIP(return, "Transparent Hugepages not available\n");
> > +
> >  	/* Need file to be correct size for tests for non-anon. */
> >  	if (variant->backing != ANON_BACKED)
> >  		ASSERT_EQ(ftruncate(self->fd, size), 0);
> > --
> > 2.53.0
> >
> 


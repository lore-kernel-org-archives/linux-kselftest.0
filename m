Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB51337BB0
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369834; cv=none; b=aaWlyfNSUP0Heqe/HOMbTz6zEjv315bTRRzpIwDiZO+h94wY00bEStHZGyu9O/sP7XPSB8mtcdGshHYsdcttf7rt81f0l/uoSLCjXR20aJMGI97vyu+C1O4c8t51EtbpfebhNRrjzi9gXzc1NTv8uwIdkft2jDSbBa1nbhYAE+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369834; c=relaxed/simple;
	bh=o0U5Yxs2RKnDh+aijWFqI29MFfDJUAlasUVXTEPC3uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzT7Y378h1qJnmfz6OWdyl7GPCsTgVHban0ntzvJjDFooaNxja/XXRAiMDidtzMMoGjZXba+hfx13/ZEiQgEZfkv19bdgRbM0F/ENNyIwH2Pyjjk44WG2zs6qlixSEnhSvvSFHj/HrFVYh+Ot5cEGMgg27OsQYXnZ/n6Boiq4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iSFTYHmD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iSFTYHmD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773369832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PeHgzSLyZ7aK5854PlJ8F3nfqrFFnUsJALq71bji/28=;
	b=iSFTYHmDxsshVmM2ckerfsT17HiQ/Zgg9+uCY93XxrCIjc8krNUctBkD9Vg0Q5pDlfWrwr
	EICCp40ERmawO5WWFIHVoED1fWnWbFCXvWzaTVljsVNhm5wvhMaYbzQUa+2SwMXFIbk2lF
	f2AZUyDqserK2/SB4ksIZvre7ODZXXk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-iONvXC-aN0a6dNsF4I1NCQ-1; Thu,
 12 Mar 2026 22:43:50 -0400
X-MC-Unique: iONvXC-aN0a6dNsF4I1NCQ-1
X-Mimecast-MFC-AGG-ID: iONvXC-aN0a6dNsF4I1NCQ_1773369826
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C98C51956088;
	Fri, 13 Mar 2026 02:43:45 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.171])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92CBE19540C2;
	Fri, 13 Mar 2026 02:43:32 +0000 (UTC)
Date: Fri, 13 Mar 2026 10:43:27 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 4/4] selftests/mm: transhuge_stress: skip the test
 when thp not available
Message-ID: <abN5z5jpKL2GOWc3@gmail.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-5-chuhu@redhat.com>
 <708647e9-fc49-430c-a12c-f2b44caa273d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <708647e9-fc49-430c-a12c-f2b44caa273d@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Thu, Mar 12, 2026 at 08:46:23PM +0100, David Hildenbrand (Arm) wrote:
> On 3/12/26 12:40, Chunyu Hu wrote:
> > The test requires thp, skip the test when thp is not available to avoid
> > false positive.
> > 
> > Tested with thp disabled kernel.
> > Before the fix:
> >   # --------------------------------
> >   # running ./transhuge-stress -d 20
> >   # --------------------------------
> >   # TAP version 13
> >   # 1..1
> >   # transhuge-stress: allocate 1453 transhuge pages, using 2907 MiB virtual memory and 11 MiB of ram
> >   # Bail out! MADV_HUGEPAGE# Planned tests != run tests (1 != 0)
> >   # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> >   # [FAIL]
> >   not ok 60 transhuge-stress -d 20 # exit=1
> > 
> > After the fix:
> >   # --------------------------------
> >   # running ./transhuge-stress -d 20
> >   # --------------------------------
> >   # 1..0 # SKIP Transparent Hugepages not available
> >   # [SKIP]
> >   ok 5 transhuge-stress -d 20 # SKIP
> > 
> > CC: Li Wang <liwang@redhat.com>
> > Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> > ---
> >  tools/testing/selftests/mm/transhuge-stress.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
> > index bcad47c09518..76316696426d 100644
> > --- a/tools/testing/selftests/mm/transhuge-stress.c
> > +++ b/tools/testing/selftests/mm/transhuge-stress.c
> > @@ -17,6 +17,7 @@
> >  #include <sys/mman.h>
> >  #include "vm_util.h"
> >  #include "kselftest.h"
> > +#include "thp_settings.h"
> >  
> >  int backing_fd = -1;
> >  int mmap_flags = MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE;
> > @@ -35,6 +36,9 @@ int main(int argc, char **argv)
> >  	int pagemap_fd;
> >  	int duration = 0;
> >  
> > +	if (!thp_is_enabled())
> > +		ksft_exit_skip("Transparent Hugepages not available\n");
> > +
> >  	ksft_print_header();
> 
> Shouldn't that go under the ksft_print_header(), like you did in patch #3?

It will print the TAP version. I'll change in v2 as you suggested. Thanks!

> 
> -- 
> Cheers,
> 
> David
> 


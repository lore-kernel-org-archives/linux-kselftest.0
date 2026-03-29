Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076AA2DA75A
	for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775166; cv=none; b=dWgJ8KX051iGrtcLkswxuwDgEZVulODWz1gFZC9U+HiTulDL9TXmQ342qNJ+O+ThSTwlVDITHBbVuWSHPh5z1bgVKCF1WNo7HPNcdIKiD0Ta9Jlfv9NRbOvBYNwJwtADh5KG+ua54ijQC4Zk2A0AHJPFpv6iIvTGvn68vw6dcZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775166; c=relaxed/simple;
	bh=zhbWVNzCGwK4zrdIuFpmCSyTIu1bGBugMwjB2QxR4VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ckoj3iW64F2ioQlgpRoAnDTHIDrfXT/lRd1MmNStx86/JGEKy03gKAdxG5yOwRUGfueWajAPduYqWDl2c6u/+mnF4LexCZrUmxG3tKsAYlkDMde8HLF1RkSLG6Jd5aYXolopIL0cg5GT5H+ru9QpwpUR8sVg/EN8NmnlXhyvQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XCqQrXFR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XCqQrXFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774775163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gm9WbX3aGbzz+xm7VEIAM/1LK2XfhplZSKMKkWgFnuo=;
	b=XCqQrXFRFeVOtokHU6FIgcn0a6iboc1IBWhmEXSg8oVPLZSl7o8p/sW5T75zXaH+jtP1Rk
	nVl3J+0tm/zmvEti1QY2NbXVIzCmt6PodS9sjbZJDDz+e1XUgd+Qt5f0nIK+zMYVkNAfgK
	jaVD3aV2xmJJBsX/p8YeQC5jVbatbKY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-83-jyU18zvWN16pE1pBORFRkQ-1; Sun,
 29 Mar 2026 05:06:00 -0400
X-MC-Unique: jyU18zvWN16pE1pBORFRkQ-1
X-Mimecast-MFC-AGG-ID: jyU18zvWN16pE1pBORFRkQ_1774775158
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8B011195608E;
	Sun, 29 Mar 2026 09:05:57 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.11])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30ABC19560B1;
	Sun, 29 Mar 2026 09:05:46 +0000 (UTC)
Date: Sun, 29 Mar 2026 17:05:42 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v6 0/6] selftests/mm: skip several tests when thp is not
 available
Message-ID: <acjrZtVxPr1uad8I@gmail.com>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324090927.eeacb7987d22ed8ba13fada2@linux-foundation.org>
 <b28ebf0c-c10e-4e1a-9e8e-30e6925d0da8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28ebf0c-c10e-4e1a-9e8e-30e6925d0da8@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Fri, Mar 27, 2026 at 02:24:58PM +0100, David Hildenbrand (Arm) wrote:
> On 3/24/26 17:09, Andrew Morton wrote:
> > On Tue, 24 Mar 2026 09:33:10 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> > 
> >> There are several tests requires transprarent hugepages, when run on thp
> >> disabled kernel such as realtime kernel, there will be false negative.
> >> Mark those tests as skip when thp is not available.
> > 
> > Thanks, I updated mm.git's mm-unstable branch to this version.
> > 
> >> Chagnes in v6:
> >>   - patch 3 add reviewed-by from Lorenzo
> >>   - patch 4 handle the errno before and after close(), suggested by AI
> > 
> > Here's how v6 altered mm.git:
> > 
> > 
> >  tools/testing/selftests/mm/vm_util.c |   12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > --- a/tools/testing/selftests/mm/vm_util.c~b
> > +++ a/tools/testing/selftests/mm/vm_util.c
> > @@ -785,15 +785,23 @@ int unpoison_memory(unsigned long pfn)
> >  
> >  void write_file(const char *path, const char *buf, size_t buflen)
> >  {
> > -	int fd;
> > +	int fd, saved_errno;
> >  	ssize_t numwritten;
> 
> Empty line? :)

Good catch. I will add one empty line in the next version. Thanks!

> 
> > +	if (buflen < 1)
> > +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
> 
> -- 
> Cheers,
> 
> David
> 


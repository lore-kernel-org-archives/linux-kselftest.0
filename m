Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A62DCC1C
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773760133; cv=none; b=BTVcmdXr3En4swTcuu9SAGJrUcuYplVKdygHgAYcz7WkJ6Tv7tAu7uzIuINrWJ0boU4fi6w0r5BGGui0OYiPSo7FMtcZ894aT4qghK7/Cp3K29eIazXYPH3tXwY+x5iFR9V9nZBskGVLL7fAjBovqSCSYtg/Uqv8x6o65lKidrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773760133; c=relaxed/simple;
	bh=5eVn+u0WGBa86gsK63osrAUvwqhaVhxckFmEWIv/dpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lr3KY0pzPb46bNbXVrUpsjdZajYcfhJnpuIMnCFCwtk9VfjzcM3Piu8y1z2KxibVFtUqKAMl138epyJOmRBJ0nFjQzr4Rg96O29kc/ahrQGhey/S8X6olKaePAstNfWWQS/wdpE6X5eebFmkmmsXc9bn2stIzVRYucnHBhb3Kzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ivJZEhir; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ivJZEhir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773760131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4GR98Iuqt7XunvK/D0lZVC+JOV+h/F1TlWUdvlnrG74=;
	b=ivJZEhir5o6GDTz9cHIAUa1GobMr+qv09ClUDUZe0mP59QcVr687rEhFQutIGdg+HzH5X4
	fS1vsTM9fPzQaFTR9RcVsSY4xR7o6TRjfrLrDV47MkrCIfBrFrwHl70o+8uF6aTv4fNPqc
	7e4iqF4GJ43N9OgeTg0Qd6/B1t9O76U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-jb3R1-qHPtq-hR_gdhRPhA-1; Tue,
 17 Mar 2026 11:08:44 -0400
X-MC-Unique: jb3R1-qHPtq-hR_gdhRPhA-1
X-Mimecast-MFC-AGG-ID: jb3R1-qHPtq-hR_gdhRPhA_1773760123
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B05501956055;
	Tue, 17 Mar 2026 15:08:42 +0000 (UTC)
Received: from fedora (unknown [10.22.80.202])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B2A41800576;
	Tue, 17 Mar 2026 15:08:40 +0000 (UTC)
Date: Tue, 17 Mar 2026 11:08:37 -0400
From: Audra Mitchell <audra@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <abludfGu4upPcyRI@fedora>
References: <20260218184210.206466-1-audra@redhat.com>
 <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Sorry! I missed this email so never responded!

On Tue, Feb 24, 2026 at 05:15:14PM +0100, David Hildenbrand (Arm) wrote:
> On 2/18/26 19:42, Audra Mitchell wrote:
> > On architectures with separate user address space, such as s390 or
> > those without an MMU, the call to __access_ok will return true.
> 
> Where is this __access_ok() you mention here? Somewhere in
> fs/proc/task_mmu.c?
>
> Where in the soft-dirty test is that triggered?
> 
> I'm wondering whether the soft-dirty test should be adjusted, but I did
> not yet understand from where this behavior is triggered.

The problem arises when we are checking to see what features/categories are
supported. The call chain for the soft-dirty program goes:

  main()
    ->test_simple()
      ->pagemap_is_softdirty()
        ->page_entry_is()
          ->pagemap_scan_supported()
            ->__pagemap_scan_get_categories()
              ->ioctl()
  
We enter the kernel with an ioctl, expecting to have an EFAULT returned (see
the comment from pagemap_scan_get_categories():
    
          /* Provide an invalid address in order to trigger EFAULT. */
        ret = __pagemap_scan_get_categories(fd, start, (struct page_region *) ~0UL);

Once we enter the kernel, we will check the arguments passed which includes the
call to access_ok: 

  do_pagemap_cmd()
    ->do_pagemap_scan()
      ->pagemap_scan_get_args()
        ->access_ok()

Here is the path within pagemap_scan_get_args where we expect to fail return
the EFAULT:

        if (arg->vec && !access_ok((void __user *)(long)arg->vec,
                                   size_mul(arg->vec_len, sizeof(struct page_region))))
                return -EFAULT;
                
However, if CONFIG_ALTERNATE_USER_ADDRESS_SPACE is enabled or if CONFIG_MMU is
NOT enabled, then we just return true:

        if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE) ||
            !IS_ENABLED(CONFIG_MMU))
                return true;

The intent appears to be just getting the categories available to us and
verifying that we have the feature available for testing. However, this corner
case means the soft-dirty test will fail with the following:

  # --------------------
  # running ./soft-dirty
  # --------------------
  # TAP version 13
  # 1..15
  # Bail out! PAGEMAP_SCAN succeeded unexpectedly
  # # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
  # [FAIL]
  not ok 1 soft-dirty # exit=1
  # SUMMARY: PASS=0 SKIP=0 FAIL=1
  1..1
  
Since the intent is just to validate that the features are available to us for
testing, I think we can just modify the check so that we don't fail if we
return 0.
  
Let me know what you think, or if you have more questions!

> Do we have a Fixes: tag?

I always hesistate to add a Fixes tag on situations like this since this is a
corner case that was not considered by the original author. If we need a
fixes tag, then it would be:

Fixes: 600bca580579 ("selftests/mm: check that PAGEMAP_SCAN returns correct categories")

Thanks a bunch!
-- Audra Mitchell


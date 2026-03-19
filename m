Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4235DCE3
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946776; cv=none; b=YvwdJs0fwhlgwy65bLqbF/Or/Ui1kAzX6/CDuZPtzWZyEiRCE/YRpRet8KItSSouBzChvS1SQRTS7GTPr9mRXOG6bKCrT+KGhVRjPCL/FXhw6PmwV97Q2a1SEDH5wD2+sOta/4QFlCentqXJu+5BVcL0kcwzARBQmNOuMAyfmn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946776; c=relaxed/simple;
	bh=NA6iGTjkn3OnlFPf0dA1mFf2Q5Ey1rrGCRT0bRzfZfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA3Ev7F+tvPhzNd6H9A7/yIlqNUIf6RWD7f6fhr1/B0FaEiLr7KuOta1TjhtuyAYiPCp4ctrcbZG7BEVWuy3lAt3ZB8EZ0kjoqFs3GrxOgrN7rQP6y1wursKnbKXusJRtARZFI6FPr1DlJBtl/KgldRYQ7oMP+30Vx370djL/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlINErwB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlINErwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773946774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fsfMjIfsjtusJhQnCeKcSJI9AYx2DQ1suMzXsS8unaE=;
	b=RlINErwBqGVeroV9aN6Ld48u1OqJXTRCQJN9bHRg44REBbPlDJoOGx6GXgGBz4fc+gOoae
	VIqxUKLjcqEbwGieErd7XlZnvE9NaCZfyvkOQyeFMBBj1ec8Tb/LVNLe0UxOStSxIDrMCi
	l+bB2kS4PbjBL8aLBsOi1I882y8dxCM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-af_DePgMM2K06eY_rYCjTg-1; Thu,
 19 Mar 2026 14:59:28 -0400
X-MC-Unique: af_DePgMM2K06eY_rYCjTg-1
X-Mimecast-MFC-AGG-ID: af_DePgMM2K06eY_rYCjTg_1773946766
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1802A1956089;
	Thu, 19 Mar 2026 18:59:26 +0000 (UTC)
Received: from fedora (unknown [10.22.80.202])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A57D1800763;
	Thu, 19 Mar 2026 18:59:23 +0000 (UTC)
Date: Thu, 19 Mar 2026 14:59:21 -0400
From: Audra Mitchell <audra@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <abxHibvF8E5dcrUf@fedora>
References: <20260218184210.206466-1-audra@redhat.com>
 <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
 <abludfGu4upPcyRI@fedora>
 <f635585f-7488-4bfe-8566-1c19f493c6a3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f635585f-7488-4bfe-8566-1c19f493c6a3@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

> What about simply testing for success on a test area, wouldn't that be more reliable
> and clearer?

Hey I tested your version of this patch and it works fine on s390 and x86_64.
I have no issue with this version at all!

Would you prefer to push this fix since you wrote it or do you want me to push
a v2 and give you credit?

> > Fixes: 600bca580579 ("selftests/mm: check that PAGEMAP_SCAN returns correct categories")
> 
> Yes, please add that. We nowadays also add proper Fixes tags for tests.

Sure thing!

-- Audra


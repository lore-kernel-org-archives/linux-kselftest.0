Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EF03DBD4C
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932939; cv=none; b=L2wZfqr4OqyAgwAuRG1oVj7hJcDRar4Si7Ayz5XZ4CVQuZIY61f7Q592Zreds0CqTrHVkSX2GPSsVw64VtsW382h5tqAoK+FDrtiwfX49TekoKAwRrhGzRKKyEV+P4YKuLKGznRBZQkrp6JAa3AeJom2G2wceuqW5+IAZsyai4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932939; c=relaxed/simple;
	bh=ks2rRapSAHs0lvVVvpo9l98izhPV2ZzRW4UzwBVqVVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLw8QkKk8W1Z9C4y/ZJuO2SX69lODvswUZsGeSy7nH77g2Mbx5STKEcCKclCTyd1U6L2QorHxjV5IMpOXw2Antup8zQc4vVjQCp23iFPPx5RL5xZtrf/Aj2Ra2pJfyOl7XmYYPVzwWw15stC8JLVVaHvB2wHEGQRo5q9yCohSIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSqdEUfG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSqdEUfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773932937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hA5I3uWJiJoLIUSwkxKTsom+AT5K9zLlcMjsLOJ1zE8=;
	b=MSqdEUfGh2dOd+JgHpN59vCMKY5DslUThuwyikp8LN/z9gD/QYebcDtcCeOPp5KrmkYQ26
	k+527QPytn5lC0loQN4TSoFeNsQthL9UoOiwca8Gzy8479btW3Hb4PF66QJUQzZPSDq5Dg
	JAWFAg+PoLGtC4rNCiI8oIVtw+Uaqro=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-ebZroFiVPN-y7um-DFukHA-1; Thu,
 19 Mar 2026 11:08:53 -0400
X-MC-Unique: ebZroFiVPN-y7um-DFukHA-1
X-Mimecast-MFC-AGG-ID: ebZroFiVPN-y7um-DFukHA_1773932931
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90AEE19560AA;
	Thu, 19 Mar 2026 15:08:50 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 090C0180191D;
	Thu, 19 Mar 2026 15:08:40 +0000 (UTC)
Date: Thu, 19 Mar 2026 23:08:36 +0800
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
Subject: Re: [PATCH v3 0/5] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abwRdOm6orrxWxiw@gmail.com>
References: <20260317094419.1429259-1-chuhu@redhat.com>
 <20260317113730.45d5cef4ba84be4df631677f@linux-foundation.org>
 <abpu4OMsy3Xl5QA0@gmail.com>
 <ee3ca88c-d6ea-44cf-8f75-e996d52c4c92@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee3ca88c-d6ea-44cf-8f75-e996d52c4c92@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Wed, Mar 18, 2026 at 01:07:03PM +0100, David Hildenbrand (Arm) wrote:
> On 3/18/26 10:22, Chunyu Hu wrote:
> > On Tue, Mar 17, 2026 at 11:37:30AM -0700, Andrew Morton wrote:
> >> On Tue, 17 Mar 2026 17:44:14 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> >>
> >>> There are several tests requires transprarent hugepages, when run on thp
> >>> disabled kernel such as realtime kernel, there will be false negative.
> >>> Mark those tests as skip when thp is not available.
> >>
> >> AI review asked some questions:
> >> https://sashiko.dev/#/patchset/20260317094419.1429259-1-chuhu%40redhat.com
> > 
> > Hi Andrew,
> > 
> > Nice tool.
> >  
> > For question one. In guard-region test, collapse tests are for checking
> > collapse is denied when operating on guard region, not for checking
> > madvise(MADV_COLLAPSE) will fail when thp is setup to 'never with sysfs,
> > result is same, but it's a different test. Maybe we don't have strong
> > interest to test when thp is set to 'never' in this collapse test.
> > Do you perfer we let it run when thp is setup with 'never'?
> > 
> > For question two. In soft dirty test. Yes, test_mprotect skip logic has
> > similar issue when open failed. 'Bail out' would be shown. Maybe we
> > do this in other series or you prefer me to fix it in this series?
> 
> IMHO, that's something for another series (if at all).

OK. Then will not touch it here.

> 
> > 
> > For question three. Add buffer length check in write_file() helper and
> > check if written bytes equal expected bytes. It's easy to add a buffer
> > lenghth check and make it robust. It's not easy to do the partial
> > written check as that will make the helper more complex and need one
> > more parameter as expected written bytes. Maybe for such question, we
> > should do with other series, not in this one?
> 
> The AI brings up many things that are irrelevant in practice (in
> particular for tests). So I wouldn't worry about that. You are only
> moving code.

Yes. Then I don't change it here. Thanks.

> 
> -- 
> Cheers,
> 
> David
> 


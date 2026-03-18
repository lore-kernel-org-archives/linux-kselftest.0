Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD793A8FF1
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825782; cv=none; b=qP3Md37gV63YubgxgkjXOFgaf1h3S7gVeCoF+hAQdOkKtkxXzUWjuM4sRAPDMeyM1smH8Vkhn4UEEcz1wYR+MC57N2ZfUO5PaVM8Mlu/fhibHUpI/I4o44LCSImWLY5rGcUtqxQC0OCxuy7B5JBzKOQEo5ArDklRz34QWNrGaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825782; c=relaxed/simple;
	bh=+2HLPrwoZ0p3KPYUIr8TS2Lk27NSSKrKkROA94l7ubs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LugE6busETvvwCVOFH5DRRqrCdYfruarYpwH+1lCLjxvo2LWwjZWdFCJrV4mB3ja85p4x7emt47Bhl9RH9sRb8ykUUTO1w386RSpJ/1WdmQzRQ3RRZfXekQWBxc510ofLI9gySu9pPDpcozt4R98+qVvloylrGWHgyjm/gELf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CeNT9Rhw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CeNT9Rhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773825780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9QrSQffYYLv7Hm1BPK9VpU7To1qXa5RDVgaRDEWFTWU=;
	b=CeNT9RhwlTvWk1jc/bt4FNfTOmQbsfRruNJrlnIxLFqPRT/Id8V79BVnOGqyuPMkcSe2vb
	BPRfEfsPjgr8+KXXeJbJjlmB87nxMnFJa/tYGzBiBR0NzYW5o9C5JG0tPbC8N+O2InISQX
	f5NMhomqAwdYnJKWBwEpZO4DJe0UnqA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-N_kKHe1IMEq-qYSSXpWm6Q-1; Wed,
 18 Mar 2026 05:22:58 -0400
X-MC-Unique: N_kKHe1IMEq-qYSSXpWm6Q-1
X-Mimecast-MFC-AGG-ID: N_kKHe1IMEq-qYSSXpWm6Q_1773825776
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D03A180044D;
	Wed, 18 Mar 2026 09:22:55 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.184])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5F401955F19;
	Wed, 18 Mar 2026 09:22:45 +0000 (UTC)
Date: Wed, 18 Mar 2026 17:22:40 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v3 0/5] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abpu4OMsy3Xl5QA0@gmail.com>
References: <20260317094419.1429259-1-chuhu@redhat.com>
 <20260317113730.45d5cef4ba84be4df631677f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317113730.45d5cef4ba84be4df631677f@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Tue, Mar 17, 2026 at 11:37:30AM -0700, Andrew Morton wrote:
> On Tue, 17 Mar 2026 17:44:14 +0800 Chunyu Hu <chuhu@redhat.com> wrote:
> 
> > There are several tests requires transprarent hugepages, when run on thp
> > disabled kernel such as realtime kernel, there will be false negative.
> > Mark those tests as skip when thp is not available.
> 
> AI review asked some questions:
> https://sashiko.dev/#/patchset/20260317094419.1429259-1-chuhu%40redhat.com

Hi Andrew,

Nice tool.
 
For question one. In guard-region test, collapse tests are for checking
collapse is denied when operating on guard region, not for checking
madvise(MADV_COLLAPSE) will fail when thp is setup to 'never with sysfs,
result is same, but it's a different test. Maybe we don't have strong
interest to test when thp is set to 'never' in this collapse test.
Do you perfer we let it run when thp is setup with 'never'?

For question two. In soft dirty test. Yes, test_mprotect skip logic has
similar issue when open failed. 'Bail out' would be shown. Maybe we
do this in other series or you prefer me to fix it in this series?

For question three. Add buffer length check in write_file() helper and
check if written bytes equal expected bytes. It's easy to add a buffer
lenghth check and make it robust. It's not easy to do the partial
written check as that will make the helper more complex and need one
more parameter as expected written bytes. Maybe for such question, we
should do with other series, not in this one?

Thanks!


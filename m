Received: from mta1.migadu.com (out-35.mta1.migadu.com [95.215.58.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEB37AA9A
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469419; cv=none; b=dohCnXZMNgzm5bVm6sgr3n5j8r4XlYLDHvhC0mtvD5hBiL0uyhz01DIhvVXzjUyPm29lQ4kDHEw+/qEnN4X8dpTxRgFiReRCKmTReuWHH4XxtFu2h1i/qZ74qL1ib2W7La8hjwByZ9Hu9efh9C03/OXxUI1OcSX1Fv1bZqx5Qm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469419; c=relaxed/simple;
	bh=CkwK7lSN43JMJXrHHY9Mep3RaMJmHfCj7Up6o6iDiTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2U9TcmB0ycAfFaM8cxcqsUiByrgCcVo/b4UPH+oxyeEXWlztqinKvegkETr8q7y7vigSgjY8nUDj5oZaXbHwKxBf6ocM0VOnY/fFWyZ5bvfqsKc+YZbhpXaQdi3/0FzYiLBDj00cGXm5dqDimXVVzWiNmwuvcKWy2sT8yXlMAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=st3VYWWY; arc=none smtp.client-ip=95.215.58.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="st3VYWWY"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CkwK7lSN43JMJXrHHY9Mep3RaMJmHfCj7Up6o6iDiTw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791469415; v=1; x=1792074215;
 b=st3VYWWYqkFmcA35F0khfrKTsP3SzeEuB1wnG7nJa6T8xB8lP0J4o2eq00vnqoON0iLbXRUW
 d/QWT0ix8kTVHqh3CPf7Zzvm5Gd+nYl7DVWNmAvuyJMDQJZ6s3KWyZTbvy2yDyp45F9n28pL91p
 YalHwUcej2OAjt1k5Wb8e80M=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b03a295ec336a66a;
	Thu, 08 Oct 2026 14:23:34 +0000
X-Mizu-Trace-ID: b03a295ec336a66a
X-Migadu-Flow: FLOW_OUT
Message-ID: <248431ea-4bbf-4a48-a80e-72287ffbae22@linux.dev>
Date: Thu, 8 Oct 2026 22:23:22 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/19] selftests/mm: add khugepaged race harness
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Usama Arif <usama.arif@linux.dev>,
 "Nico Pache (Red Hat)" <nico.pache@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Hugh Dickins <hughd@google.com>, Lance Yang <lance.yang@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com,
 Kiryl Shutsemau <kirill@shutemov.name>
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-17-kirill@shutemov.name>
 <85b3725a-6dde-4a57-b303-4ae2b53b60a5@linux.dev>
 <6e3c298f-9b93-43b2-840d-65c5ffa3bc36@arm.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <6e3c298f-9b93-43b2-840d-65c5ffa3bc36@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/8/26 4:18 PM, Muhammad Usama Anjum wrote:

> On 08/10/2026 8:30 am, Zenghui Yu wrote:
> > On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> >
> > > +		} else {	/* madvise */
> > > +			while (now_ms() < end_ms && !corrupted) {
> > > +				for (i = 0; i < nr_shared_areas; i++) {
> > > +					madvise(region + i * hpage_pmd_size,
> > > +						hpage_pmd_size, MADV_COLLAPSE);
> >
> > I got the following error when compiling it:
> >
> > khugepaged_race.c: In function ‘main’:
> > khugepaged_race.c:506:23: error: ‘MADV_COLLAPSE’ undeclared (first use in this function); did you mean ‘MADV_COLD’?
> >   506 |       hpage_pmd_size, MADV_COLLAPSE);
> >       |                       ^~~~~~~~~~~~~
> >       |                       MADV_COLD
> > khugepaged_race.c:506:23: note: each undeclared identifier is reported only once for each function it appears in
> > make: *** [../lib.mk:225: /data/code/mm/tools/testing/selftests/mm/khugepaged_race] Error 1
> 
> I've just tested with and without make headers on linux-next
> which has this patch and I've not received such error.
> 
> If your system headers are old, running make headers can help.

I forgot to mention that this can be fixed like fd5295afae91.

Thanks,
Zenghui

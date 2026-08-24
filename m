Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12A34C9A6;
	Mon, 24 Aug 2026 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787595609; cv=none; b=ZiklLW41zj/CaKFgzHF3a9U45oU0g0sZztx3DLRLpndNyG2l3N+TGFIHpefu8dUpiRg4Dt8V6Y/evI+0vXibAkNV0sZ+rugL5jUaxv1zpAf2KGQ5mq1Lsvsfg/0uj8Dnnt0Wn9QiMJ1B77cxkh96Ew7l5GBwJwLcR4o31nKm0IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787595609; c=relaxed/simple;
	bh=63M/tbP6bbcpyl1m/4/5k9VpWqncyIJUULELUyV5BZ4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OVBolJx4h1iDFbNjij0krxB7uzl1ysrhqcUVxdLJRinWR7LyYBUnNXVdgLFdUohSirIgAdypjyrWnMr7o584/Y5SswjVcKWWz25BCrMUqhWx0yfSGpnR4f13jK9Do0Z1SBR01bOwG5zoU3AtfP4FeSHaVvP2VUdFHAwOgTjAL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VVZ64v/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VVZ64v/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4C61F000E9;
	Mon, 24 Aug 2026 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787595607;
	bh=d9vG0Y7mVhQecHl6eJllLIfmCJ9uIwopYVEZSC9phFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VVZ64v/agVHINM1ozDQT0CA1zHGvcVogxWNYlkiMraLmMUQ7cUmdIm+ROAzgabF3b
	 2/KF2/nNv4jM0vrotyW1o3yVBnC6uid7j/kfqRQhOoAA6Bl8o8GHryLslUZ5OtxIW2
	 0jv1Cchrp/nhI+uNkibMC51b/J1Ym+S+O33Ei8yk=
Date: Mon, 24 Aug 2026 11:20:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kyle Meyer <kyle.meyer@hpe.com>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, Liam.Howlett@oracle.com,
 bp@alien8.de, corbet@lwn.net, david@redhat.com, hannes@cmpxchg.org,
 jack@suse.cz, jane.chu@oracle.com, jiaqiyan@google.com,
 joel.granados@kernel.org, laoar.shao@gmail.com, linmiaohe@huawei.com,
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, lorenzo.stoakes@oracle.com, mclapinski@google.com,
 mhocko@suse.com, nao.horiguchi@gmail.com, osalvador@suse.de,
 rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
 shawn.fan@intel.com, shuah@kernel.org, surenb@google.com,
 tony.luck@intel.com, vbabka@suse.cz
Subject: Re: [PATCH v2] mm/memory-failure: Support disabling soft offline
 for HugeTLB pages
Message-Id: <20260824112005.856732bac3094b62a430d17c@linux-foundation.org>
In-Reply-To: <aoyFK92azAlDAPuF@hpe.com>
References: <aMiu_Uku6Y5ZbuhM@hpe.com>
	<0d2fc2ab-333e-42a1-88a1-6bb85538cbb0@linux.alibaba.com>
	<aoyFK92azAlDAPuF@hpe.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 12:53:47 -0500 Kyle Meyer <kyle.meyer@hpe.com> wrote:

> On Thu, Aug 20, 2026 at 11:47:11AM +0800, Shuai Xue wrote:
> > Hi Kyle,
> 
> Hi.
>  
> > Following up on this thread. The v2 patch once landed in akpm's mm
> > tree (9ae6eefa4b6b "mm/memory-failure: support disabling soft
> > offline for HugeTLB pages"), but that commit is now not reachable
> > from any branch, and mainline as of v7.3-rc1 still only has the 0/1
> > switch in /proc/sys/vm/enable_soft_offline.
> 
> Thanks for pointing this out.
> 
> Looks like this patch was added on 2025-09-16 [1] and dropped on 2025-11-11 [2].
> 
> [1] https://lore.kernel.org/all/20250916032512.AE588C4CEEB@smtp.kernel.org
> [2] https://lore.kernel.org/all/20251111231818.52A60C16AAE@smtp.kernel.org
> 
> I must have missed the second email.
> 
> I don't remember discussing a v3. Can someone please remind me what we planned
> to change or whether there was another reason it was dropped?

I interpreted the (lengthy) review discussion to mean that a new
version was to be sent out.

> > The underlying issue discussed here is still unresolved for us:
> > firmware reporting per-rank corrected error thresholds via GHES
> > triggers soft offline of huge pages, which neither addresses the
> > failing rank nor is acceptable for workloads that rely on stable
> > hugetlb physical layouts.
> > 
> > Do you still plan to send a v3, e.g. with the disable-bitmask
> > layout Anshuman suggested upthread?
> 
> I wasn't planning on sending a v3 but I'm happy to revisit if needed.

That would be best at this stage - please review the changelog to see
if additional details should be added to cover the considerations which
were discussed.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082E3C5529;
	Wed, 18 Mar 2026 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833538; cv=none; b=ufJbJwXqUC0erJAol4GWWYRR0iZjsWtlntNzWsyX6OskX0+GAE0/nFTMsxo221I/url0z2vetxzt9ZqxjEraVeRW4JHv6RKpXftztfdkP5T0VRkYou4ceYvaooPuMtkNIRCYdeeoLv9oj6o+s8ekGX2U8+oZW/s5P51dJfu/KGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833538; c=relaxed/simple;
	bh=R//hRNxAoqWyABoXCwcHk7g7S0ZjvnmQaJYFCwkVb3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBC2Gmzeuk/KW/NRgMKYPUMxMYRAvBnWFhtx/rqGHgjLTDgSC5oPTX2wB6c47RPonu0+G9JRygWEcq5nXOB47/V/ug89JAtGcJf6ba08S7iM7sw1IhLLIRRqSm1DNeUTg6stbHxwfFfRfrkb8xEz9JLXJC+w21+0hxBruC+SE8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5jM9K95; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5jM9K95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B008C2BCB4;
	Wed, 18 Mar 2026 11:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773833537;
	bh=R//hRNxAoqWyABoXCwcHk7g7S0ZjvnmQaJYFCwkVb3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5jM9K95/DWUgYu5hZ+3p6ju4Ia4B7o5b9j30H6XgD6UoSIvS/lTsTypNXXToZ6OF
	 wtYxJ1mqPlFEp3qPt6cnv1+m+TaYK80euQ7i7TB1WFDU5L0QUy1WJ96ydPXcCQGdHu
	 AID/65D6nRppq07Vr3DknUSXuGve8NHQK8m47isO5RudZObvJbqfae8VkMVLl4tUTg
	 vyUSYUR/IOjG7gV/uz9je96K2vXsBSGh46x1fBCWakynXRo/DP/dWVRHlwXtYXRNHF
	 BpJFsJafe0rDG/AHvUt2CzARvRGz9EaVQ42yasLMqKV7I0wnPeOhyxO99+QGoQkIEJ
	 RKnBrwEYsXg+w==
Date: Wed, 18 Mar 2026 11:32:10 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH v3 0/5] selftests/mm: skip several tests when thp is not
 available
Message-ID: <893e70b9-1ed2-419b-9079-5b397b2cec54@lucifer.local>
References: <20260317094419.1429259-1-chuhu@redhat.com>
 <20260317113730.45d5cef4ba84be4df631677f@linux-foundation.org>
 <abpu4OMsy3Xl5QA0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abpu4OMsy3Xl5QA0@gmail.com>

On Wed, Mar 18, 2026 at 05:22:40PM +0800, Chunyu Hu wrote:
> For question one. In guard-region test, collapse tests are for checking
> collapse is denied when operating on guard region, not for checking
> madvise(MADV_COLLAPSE) will fail when thp is setup to 'never with sysfs,

No, if thp is set to never, madvise(MADV_COLLAPSE) still succeeds. This is a
source of confusion for many :)

> result is same, but it's a different test. Maybe we don't have strong
> interest to test when thp is set to 'never' in this collapse test.
> Do you perfer we let it run when thp is setup with 'never'?

Yes because it should still function then :)

Cheers, Lorenzo

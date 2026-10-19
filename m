Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971933F4DF3;
	Mon, 19 Oct 2026 05:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386998; cv=none; b=c7vckRcbwTmHubz8rOLwM78fhObjsPJqdkXKX2vhNbnwDKxGnEswcrU5VD/fcvfkImHKEzLAoTYBtEe035zpvDsSC7A3arBLQrEVHVhP3sTsaONd2OU9VPzgAL3mWERVortBkIppmaNIDTumMa/ecd0y9iKJ/ckHTHetm3H+AgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386998; c=relaxed/simple;
	bh=mMlo5yhT+yBq0RqdKFNPHeYCznZMnItKtpCZiqLMqS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atH42wLp9i6+dbgzcfsFnNiwdVqL8CmZ+Il/u856Pnnr3MkejOkNX7feCXIuYMBI9IV3/Eoj4jCKiTHL6ppIYFHGK6YpLjvWCHWgmDXxe03BxT2cnAHc/9SzBNEbD7OTKrJ5qZ2BjqBq9CUx1BwUW+oy1wNgUOGTaZiD0GNYiqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uvenVXd4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uvenVXd4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3EDD1476;
	Sun, 18 Oct 2026 22:16:32 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AB0C3F7B4;
	Sun, 18 Oct 2026 22:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792386995; bh=mMlo5yhT+yBq0RqdKFNPHeYCznZMnItKtpCZiqLMqS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uvenVXd4wUxq5NdWMjKhwYFhTtEUS42roohcPbVmjMYVF4Qxn4wIsXRwOz/kUAyCl
	 LRNTEFDqNlUbymET7J0YUwkJf0uYLJ4ZbTXK1wkoifNz/Vzjndr4CZ1xwEbgQgawn9
	 TyUsVpuKFxNHb6zsIuqeDRs9FRor0982wVA4uke4=
Message-ID: <3eeed828-6abc-4501-bdc9-e16769f52100@arm.com>
Date: Mon, 19 Oct 2026 10:46:28 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT on
 partly advised THPs
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-7-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261014175756.2035176-7-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> Paging out a THP that the advised range fully covers must not corrupt it.
> A THP that the range only partly covers must be split before reclaim, or
> skipped, so that no page outside the range is reclaimed. MADV_COLD takes
> the same split path.
> 
> Check that a whole PMD-mapped THP is swapped intact, that pages outside
> the range stay resident after paging out a base page or half of a PMD- or
> PTE-mapped THP, and that MADV_COLD on half of either THP preserves its
> contents. Tests skip when PMD-sized THPs cannot be allocated, and with
> /proc/kpageflags the PTE-mapped cases also confirm the folio stayed large.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  tools/testing/selftests/mm/madvise.c | 234 +++++++++++++++++++++++++++
>  1 file changed, 234 insertions(+)
> 
Looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

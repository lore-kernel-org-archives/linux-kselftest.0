Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85C33BA24F;
	Fri,  9 Oct 2026 05:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791522680; cv=none; b=M3wMl4SwmQBHFB4nVcvA7BJ8IR9iY/XzyaVPSZD7jzcTuA6X5Lz2hbqlr1GRzQ2l1/CnNFltELPymjSeP6c+1X316R71SaABYF+rJVthU5xrWUI7nsoQ3vQyQcsgvjkzh/5KFv6UuKWrZqvrIvqKbKPI2iwYfD4NHMV+vTi0OeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791522680; c=relaxed/simple;
	bh=lBjaAdFxpfy7crc8RE8VGmgtFxkCYa7iM970O1toESg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ek30TyD/mRRFNzUvCBcVMX6CkUBwnQBcXJdME0LlpnQ0aPzmTX5uM5oqYqk+5SZ5zErGMhIkTQJxR0XdE5Ul1wMyaP39BRNinDlA2o+PL5qXZdU9j3NCw+A1RPi4T2i76V7jUZjo99km/F5af+HgtX4z3MriwfHT+JPyowmudLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=H710X+lM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H710X+lM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56CCA1570;
	Thu,  8 Oct 2026 22:11:13 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74E963F8C6;
	Thu,  8 Oct 2026 22:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791522676; bh=lBjaAdFxpfy7crc8RE8VGmgtFxkCYa7iM970O1toESg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H710X+lMdqIZiMuj3NWGtOeCHDSwUDjMIKLflt5xeio4nbnyKjJvBjo2pgFFtI5g4
	 uzGiWDykHvTVAhVDt3vH2us8pXrJ+Jt8/hywbgd1E/5VzbrZHEzuw/bTBJJPM/OVc1
	 nMPDLnx5D3EwBHs9gv8/0SbaJdlRWGJwLgUezDkI=
Message-ID: <4ff35e20-9bdf-47d3-a96f-8269224cb826@arm.com>
Date: Fri, 9 Oct 2026 10:41:07 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] kselftest: mm: rename read_pmd_pagesize() to
 pmd_psize()
To: Yeoreum Yun <yeoreum.yun@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
 <20261009-fix_hpage_macro-v5-1-54378ae45add@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261009-fix_hpage_macro-v5-1-54378ae45add@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/26 6:57 AM, Yeoreum Yun wrote:
> For consistency with psize(), rename read_pmd_pagesize() to
> pmd_psize(). There is no functional change.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

LGTM.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>


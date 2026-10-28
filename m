Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186574;
	b=cyGJiySNNB4xUlr5LqBsMZBGGEu91B2EcYCEpnDyUi+20FrqimAn8K1HjFNG6amfRnJe
	 vOrmOD+zf0zZ1/dnQKN+ZdOPaPfAWAAHOc5+ANNAJmFdlD2EfIcH12y/CSiGl3EG5/eua
	 +y9nSHbVqQFr09TjzO6f5Fdevx25fDZr63RStdMlLVRcBiEg5928UGI8n1D8gxrgpRS0x
	 sduN5rQy4rVYpnpqcR53mSuLkgfvARfr+4S/n2wNnnof4EcoKXx+epF+y7rKjxoK38jam
	 5LuU0ElEwl0XwEaE0mZJMT90S8cSbszdapbzRAso1t8tACYGR7aC1i9IEj+xoYW3svg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186574;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n5pury5YV9GvH2clnXbdOyRZC5fJ6UftyKNGGJhyG/M=;
	b=RtfXfmaBzg0WHk/JLPKOHhDP1OG8c3YSPHqn4OFMvTfMk7JVzQuBxcpFCscKFRTJVF6J
	 cABnWD/YOCTfcYRUmZYauJrBKeN6RxcLYeK+KiFcMGwIaOfVXwFnvgAtIL+4ox1FU0Zs8
	 G8SXAyugp4GdVdLDF4yTfnhGuqi+Ujf5tofV1Gf8ZEg1isMYUCgu3DpcngA01K5yPnY8T
	 h/o1G/4qK7lBSYArJHh/nPD0P5ku+S+MuubMnf8BXfcHVDD/hJaMQmyzVzBuRhwouCLLv
	 4PWKXHHPaju7HJDaGMHJxedh1LljVKgeNvixdiKXoPXVtDzTLeU9QDk3qHuHdPTUbBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CCm9AuOB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AA6606A31D;
	Wed, 28 Oct 2026 11:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AA6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CCm9AuOB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16D2416A3;
	Wed, 28 Oct 2026 04:22:50 -0700 (PDT)
Received: from [192.168.29.156] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0AA63F673;
	Wed, 28 Oct 2026 04:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793186573; bh=43ADtVMuUF6FIB096peM5yM5+HordZTKhuRDK9S1TAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CCm9AuOBTD2xEHiF6xW5BCJJq46KaABx0gQ/th+q+4PJG5mBgBzJnVLRoB6jueIfJ
	 AAUFydZevToDAZdtOtsMo44LWIYuSAXr82n92foLrER00R5EZlJ12NZo1QsvzOHJWT
	 hpO3X5IKKOFnwXn0BNOZY47Y8nSttk9lCEFNLXwk=
Message-ID: <726ac203-7ee1-41d1-a9f3-7322c7528971@arm.com>
Date: Wed, 28 Oct 2026 16:52:44 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] selftests/mm: add MADV_COLD and MADV_PAGEOUT
 contract tests
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261019171206.3331374-1-gourry@gourry.net>
 <20261019171206.3331374-2-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261019171206.3331374-2-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 10:42 PM, Gregory Price (Meta) wrote:
> MADV_COLD and MADV_PAGEOUT share a page-table walker covering ordinary
> PTEs, PTE-mapped large folios and huge PMDs. Existing selftests use
> MADV_PAGEOUT mostly to swap memory out for other tests, and check only
> special mappings (PFNMAP, guard regions, droppable memory), not the
> walker's range, folio and permission handling.
> 
> Add a kselftest harness test for both hints, starting with the most basic
> behavior userspace relies on: neither hint populates a PTE hole or faults
> a swapped page back in, and neither may be applied to a locked VMA.
> 
> Before running the tests, pin the process to the CPU it starts on,
> so that the LRU batch MADV_COLD and MADV_PAGEOUT drain holds the
> folios a test faulted in.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
> v3: Dropped Sarthak's Reviewed-by from v2 1/8 and 2/8, which are folded
> here, since this patch now adds main() with the CPU pinning and the
> one-time reclaim check, and the swapped-page tests fail rather than skip.
Thanks for changing the name of the selftest. Adding the swap check once
in main() also looks good.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

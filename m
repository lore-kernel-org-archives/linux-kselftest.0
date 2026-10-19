Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EAC39A047;
	Mon, 19 Oct 2026 05:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386170; cv=none; b=USTTVreb0IKFLQ8o0Z0R0o3FPp1SZAzaS6KzV+iDgHarcDnpCiSxKU1/B320CHGFhGbgQdZNMxoBKdcOgebzNxTdrPGnZnKcP1JCz6GtzHHBp8lfZ+Pp/Q7Z/6BNynLPwjSEpRhtWBkmorjPpR7Zbp4rL6mqZspAEjfq8WyNykQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386170; c=relaxed/simple;
	bh=Cj/atyE4UCUgEPfqHW1EGv7amQMnd8KzvEvOkzLcWVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1wPwYcVAPHFuQHSGjUUYVR6TDns67Vocyv5Qqm96tKH9b7P+f+DLPI47syqUzDYOoWPshWwa9Z7K0b3HqS5JwtgOkzSFCUicjVxX0YgufJ3RNh4QHn+pwPIUc66fVJN1LlslLRXvT4M5uEPW94kSEpJJrrbFvsFJSlsCKbOMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F/vu4sl/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F/vu4sl/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB42C1476;
	Sun, 18 Oct 2026 22:02:40 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9B473F673;
	Sun, 18 Oct 2026 22:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792386164; bh=Cj/atyE4UCUgEPfqHW1EGv7amQMnd8KzvEvOkzLcWVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F/vu4sl/jFktMyJt2cKI0Q2G7Vdoa8O1y4xrvofUVi5wxET9PTUe8/yjpk6QDfIiq
	 rhuUParGnSZxzXCjU59/2UQdiqUZgl1dFVpFDhVFskymh8DAllwGS0G8T62gRaYopy
	 Ckj3bT27fkiN1L3gzL4soSU44vj/8bMchO1CsI/k=
Message-ID: <4459b993-84e5-45b8-9cf1-154457facb22@arm.com>
Date: Mon, 19 Oct 2026 10:32:36 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] selftests/mm: check that MADV_COLD and MADV_PAGEOUT
 reject hugetlb
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-5-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261014175756.2035176-5-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> Neither hint may be applied to hugetlb memory, so madvise(2) must fail
> with EINVAL for a hugetlb VMA. Locked VMAs are already checked here and
> PFNMAP VMAs by the pfnmap test.
> 
> Check the hugetlb case for both hints.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  tools/testing/selftests/mm/madvise.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
Looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

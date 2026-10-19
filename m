Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3FE4657C2;
	Mon, 19 Oct 2026 05:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792387175; cv=none; b=i8oeep6PU6nb7ZqNmevSH6JCOy7YBp+pTjIFxpAIZUZQyNPU5f/sOxX1oJWvobRWYc1Dnw4pvfV6l80zlyBDg8nsf/WlHUmsUk5KLd1R1+8V697DcCZloTtrCBcMGQHRJBaGvBYNg0kVnWza60wCwGYhQJ/PV69tu84sC+Bzc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792387175; c=relaxed/simple;
	bh=lBGyACrtjq6WZrbHlbL0znG2pYwXe/nMyJBchdfWqDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAqHveYD4bKjWWwFPhpnW2+lD33SDFMbHbxE060TYrB77vgC6MfJfubSeQf6HnBpfGWwTWqGzpBOFRmFaztjOtBCVur/jfR+b1whvz8WvitEGBfWcX2eJchXeHrp85Db26THZO7CBsFm6q6xxHD9goz7VV/oF3MrQC8GbIYAuuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=D1ArL3e8; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="D1ArL3e8"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A29F81476;
	Sun, 18 Oct 2026 22:19:26 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7458C3F7B4;
	Sun, 18 Oct 2026 22:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792387169; bh=lBGyACrtjq6WZrbHlbL0znG2pYwXe/nMyJBchdfWqDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1ArL3e8cxYaem7De2nzQGn1M8hPLh3X9J9ktY1rCv+i2/MIPVjZzr+5X4IIbHYHk
	 EBBlqGho5lsaouLtwK1El19xeUsWuF9WpN18/+UflzZP+AwB3FXipwefb5fk22JOVz
	 kyiAS0Rnjrr1P1bldxMvhWr4Ammrrp3wjum2zLh0=
Message-ID: <d1563456-a812-494a-a473-9f485d51f693@arm.com>
Date: Mon, 19 Oct 2026 10:49:22 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] selftests/mm: check that unauthorized MADV_PAGEOUT
 skips large file folios
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-9-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261014175756.2035176-9-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> A caller that neither owns nor may write a file may page out the COW pages
> of a private mapping of it, but not its file pages. When the advised range
> only partly covers a large file folio, the folio must be filtered out
> before it is split or reclaimed, on separate paths for PMD- and PTE-mapped
> folios.
> 
> Check that partial MADV_PAGEOUT by such a caller leaves every page of a
> PMD-sized shmem folio resident, both when a PMD maps it and when a mapping
> of half of it maps it with PTEs.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  tools/testing/selftests/mm/madvise.c | 121 +++++++++++++++++++++++++--
>  1 file changed, 115 insertions(+), 6 deletions(-)
LGTM.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

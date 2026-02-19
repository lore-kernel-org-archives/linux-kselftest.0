Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88712148850;
	Thu, 19 Feb 2026 04:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771474133; cv=none; b=rk7gwdo0WMLrLHEJdLOsMioct+I7PbH3IulcoJW+uCb+MmYkwHHxGH2yvqiL+zJenSliCxgOWLlDx6cSfTPi4ehCOOfGJnsoiZiwC+8rdyjhZ2O+UEPWLyzAErTsYAQU86uGzQmjZNpZTuBvNHFe50JcGKFmUbdVKsbYUHXtCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771474133; c=relaxed/simple;
	bh=O8aOnJnB1ghMugVQopZFrCA0mQJmTl97xV1LU2Ye2+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRpbH0cSTzp27i4U+TEwiKiiBjVtAE2HysJJfasppNDYdkLYhacPgwm3pRypgpmf0Wo4doQJYcE0QYpE6rbRB6mSlqXw71CSHUhe9aWzeVMe/HlcCcJxmaHdRYe8xc0smGhC4Zkj0XWFLR8Rbv/1rpPz6faALvGxu+9puoQM1C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26DF8339;
	Wed, 18 Feb 2026 20:08:44 -0800 (PST)
Received: from [10.164.148.42] (unknown [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 272813F62B;
	Wed, 18 Feb 2026 20:08:45 -0800 (PST)
Message-ID: <e7abaef3-be4f-4ad0-9c4d-fbec022ec29d@arm.com>
Date: Thu, 19 Feb 2026 09:38:36 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: skip migration tests if NUMA is unavailable
To: AnishMulay <anishm7030@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, shuah@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218163941.13499-1-anishm7030@gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260218163941.13499-1-anishm7030@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 18/02/26 10:09 pm, AnishMulay wrote:
> Currently, the migration test asserts that numa_available() returns 0.
> On systems where NUMA is not available (returning -1), such as certain
> ARM64 configurations or single-node systems, this assertion fails and
> crashes the test.
>
> Update the test to check the return value of numa_available(). If it
> is less than 0, skip the test gracefully instead of failing.
>
> This aligns the behavior with other MM selftests (like rmap) that
> skip when NUMA support is missing.
>
> Signed-off-by: AnishMulay <anishm7030@gmail.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  tools/testing/selftests/mm/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index ee24b88c2b248..60e78bbfc0e3e 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -36,7 +36,8 @@ FIXTURE_SETUP(migration)
>  {
>  	int n;
>  
> -	ASSERT_EQ(numa_available(), 0);
> +	if (numa_available() < 0)
> +		SKIP(return, "NUMA not available");
>  	self->nthreads = numa_num_task_cpus() - 1;
>  	self->n1 = -1;
>  	self->n2 = -1;

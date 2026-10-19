Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979753E7BA8;
	Mon, 19 Oct 2026 05:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386045; cv=none; b=HrZjwdbPpch9iHCSx40sFE/LqKYZ3mOwOMALBXV8Wwr1PUigP/Q5OZToKpLDv8A7/s5JgdMoF8kpTQn2zxPTqAYY9zMPIlCk49puLd1v/X6nI8InQ23INW5XqxNXxEWb6e8dBcFizbuevQn/fhXwLpCG8Qxuped2Qgq5MZN6CQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386045; c=relaxed/simple;
	bh=MpFXJGreFC947YOltE/B3dvQz4LgDH3h21f59hHEwMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7495l00owT/5oY6yhkYVyw/iszCkPYuQN4WoFxlaI0ZGPSn8U9xiN82xhbIOogArX5H2gKy1FMtbAs/+5jOTvbcZxI3ctWYdYnu2hJeMTm0ht8YG9uJJX7g6NAkQd9DVHTMbysvaIeUq56+0cRv1oK71Bi/1OrUKNGaJR2DQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=a0VF/tta; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a0VF/tta"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 270A91476;
	Sun, 18 Oct 2026 22:00:36 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA5933F673;
	Sun, 18 Oct 2026 22:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792386039; bh=MpFXJGreFC947YOltE/B3dvQz4LgDH3h21f59hHEwMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a0VF/ttahHJY/sgcOLILs9GCKnmV6no4P6mR2TGUNcQXP9b5xmzh7MLKTsWeSjo1t
	 eeR7yREp+doEhnB25y8EnTyBQkFA/vG3+7Zu5Wtde9KgSTRZgFQvhATrGq4da0pRUU
	 pIaBw8jgrCtX4KqP0cBR2zwxRpiuOewhk2JL1OQA=
Message-ID: <964ec917-39f4-4309-8dae-fa41e2df16ed@arm.com>
Date: Mon, 19 Oct 2026 10:30:31 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] selftests/mm: check that MADV_PAGEOUT skips holes and
 swapped pages
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-3-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261014175756.2035176-3-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> The contract tests check that MADV_COLD neither populates a PTE hole nor
> faults a swapped page back in. MADV_PAGEOUT makes the same promises, so
> check them for it too.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  tools/testing/selftests/mm/madvise.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

LGTM.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

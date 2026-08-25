Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3670E3E3C4D
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665290; cv=none; b=JSRO4AV9OgIwDm7j1WrygxTid/y/NR9yFCjG+Gq+SFcdmMebtOxXoYwmFJ7DLZM89Yt/V8+S8LQlueUsPQBFxpi6n56V9R+YoxhAR8mwrjaO8fVCkArKbXIl2gUvokcdJx4DEdIzT3I27QLmpPAHDSIsWRIVBf3pOWZvbtlFaLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665290; c=relaxed/simple;
	bh=NOgJidbiGrJG88x44g1fJromHckoem1NyeL67+A4AJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBPbo2PVnFqpuNR3OwbrCaMS8/+PvggQjZ1pv3nFQWuBM3XNxzF5Wam9vVOsleaNgeDkTpvGS8jLHp/QuZ9R5gh0AKaXyha2KmTXA/4OkAEICMHB754o2k1WUy9RND4WG5RPOHZM7W+Gppqg517sdVESvzq0HKXF7aIo40wFg7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k03XLFk2; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k03XLFk2"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NOgJidbiGrJG88x44g1fJromHckoem1NyeL67+A4AJQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787665286; v=1; x=1788270086;
 b=k03XLFk2Cxunyu6c/2QquZRO5H4voHuR78KDn9veJREeIaNlWCO/SJKcoG+oionnt3ykXK1y
 +lOlPIOpPGjcvpFKo3Q+iIusCAxDYS4aqDtKmv5vcWS6ES/IsM29e/aZP/AgXdtLUMyGtfoBoZS
 L5u3QiZDXYd1TdygkSRb7fes=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [192.168.50.204] (146.199.86.12)
	by smtp.migadu.com with ESMTPS id c020eec8f82fa5ae;
	Tue, 25 Aug 2026 13:41:26 +0000
X-Mizu-Trace-ID: c020eec8f82fa5ae
X-Migadu-Flow: FLOW_OUT
Message-ID: <ba18d382-556c-4f29-bce2-6780810da4fa@linux.dev>
Date: Tue, 25 Aug 2026 14:41:25 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/08/2026 12:20, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
> 
> Nobody after us needs these parts of the argv[0] string anyway.
> 
> This patch is inspired by previous work from Anshuman Tewari [1].
> 
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Usama Arif <usama.arif@linux.dev>


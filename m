Received: from mta0.migadu.com (out-210.mta0.migadu.com [91.218.175.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C04768EA
	for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789260773; cv=none; b=Q70T8ecJ7HJksEsmFz2DHNW1AuoAZZsH1TaManUYJltT2P9HcrEBPZ/dhPRC1gPbWCmA3h3CECbC2LeqnFZT05rfvmd44bxzadlMDavP9V75C1BOCKgs9w0ALv7/bpYzIjISCK++Q8tZiiZOeSGLXVCTdn+IPagUVxGJOqRzMgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789260773; c=relaxed/simple;
	bh=dEqQfU3lTD/bd5QrEcI5VNiNtdR+MT8JPrBJyfy09V4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K85Dd2lJBoiEzEOG+T9WfZHs26yMg7D18Uu3lrcl/bsO4PNm9TmlOYtZZfE8yrmGQczr+a9zpMqcVF2SrMa4ZXqfCEUT2am9zQnPSuI+HzlE/OB6nKot0wLkKRen0JaR8OIXhSyNQzS3fQdHeb098h9hBmXrSDU3FREMYakfb0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bTebRpj8; arc=none smtp.client-ip=91.218.175.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bTebRpj8"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dEqQfU3lTD/bd5QrEcI5VNiNtdR+MT8JPrBJyfy09V4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789260766; v=1; x=1789865566;
 b=bTebRpj8Qgs3LIT+POhy2MZGMmTbTReSxuqKKHeSpY59Jw7czyna8LieX1p/QKFaSMwpWSVY
 mjOA3lUg4MORMplEm9UY7ZO7GyKlR/0mzZWFljLwHC2m/mMENvSV27/krFC0ddtR+Pv6Z9Cv7Zf
 7fH2X/aHV61EkQ35Llf8vBkw=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52314063f20a0e10;
	Sun, 13 Sep 2026 00:52:36 +0000
X-Mizu-Trace-ID: 52314063f20a0e10
X-Migadu-Flow: FLOW_OUT
Message-ID: <be7989d3-648b-44e5-b90e-f4ab8b2066d9@linux.dev>
Date: Sun, 13 Sep 2026 08:52:28 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kselftest: mm: remove exclusion of building soft-dirty
 test in arm64
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org
References: <20260911210611.4001419-1-yeoreum.yun@arm.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260911210611.4001419-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/12/26 5:06 AM, Yeoreum Yun wrote:
> Since commit 0389c305ef56 (“selftests/mm: skip soft-dirty tests when CONFIG_MEM_SOFT_DIRTY is disabled”),
> the soft-dirty test is skipped when soft-dirty is not supported.
> 
> There is therefore no reason to exclude the test from being built on
> arm64. Remove the arm64-specific exclusion.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
> Changes in v2:
>   - remove redundant condition in run_vmtests.sh
>   - add r-b and a-b tag.
>   - Link to v1: https://lore.kernel.org/all/20260911125028.1268274-1-yeoreum.yun@arm.com/
> ---
>  tools/testing/selftests/mm/Makefile       | 3 ---
>  tools/testing/selftests/mm/run_vmtests.sh | 5 +----
>  2 files changed, 1 insertion(+), 7 deletions(-)

Tested-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui

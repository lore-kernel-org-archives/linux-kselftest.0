Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186617;
	b=HbyjD50ZPVmedH2qFCcvIWe9ZDrvpMDf3deBrBzeOWEGTPvDbsUE+VP8/9nZ/ooVy+h4
	 f69UEW2yEz2ZJzTVzIqydxSufMgpN//m+vOVHzn2Kq5kBpVXT8FAB7OkEKCszrd0GcK/e
	 khvsj0fOk4cOYrZBAGtpDxfQgno+k2pVcl6SAcZCQKIWAbbGwypBX1GJbG2U39NZWdb2V
	 XlQ/ppktWE38OKMN4/nV2bVlzAHwfjNZWQgg2XOeduf4xf4NSlYgn46dmGiNuPuuNZObv
	 gC7w3bne9lknyL9n+eG30mHmgBopdD8+Yws913R4hpyoftnn/axzgCOWFxFoEf67C3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186617;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aQOxxt/Ug+nx2I1HVmPFtJN4mCXyVI4Ns2xqozt38Ig=;
	b=aYFcjLbtpjxb18Eys3J31e32Haex1Cbf6ceWHY+juUxzZ2gbeibO35m8Tst1Nq7vw5Sm
	 z7uDJnEEqumtlAz/JMVwRaNCzgp6EHQfUt+2AV1oWB54Hx16qIdPsuflDEkugYGYBoqq5
	 Saq00SROJti00ysq6Q0C0+NkoLv7CE+f6AhpXQUIMd3WNru9pLum8D6z4RsYB/c+S+fzb
	 6es6GfBhTfUugS+BZjlmE3yG4qFKXFMzMGdoD3MHZPjRPdy2IBMgYk0GyR2RhuxPJ7BSx
	 nbJO/xhcHjvEBkk7LURhAVTaN7Si10TxSOFD+cmfFFxuUgxsYreRpTEVAru0EuywpSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XEtZgdWt;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EBC606A31C;
	Wed, 28 Oct 2026 11:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XEtZgdWt
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A87CE16A3;
	Wed, 28 Oct 2026 04:23:32 -0700 (PDT)
Received: from [192.168.29.156] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EB3D3F673;
	Wed, 28 Oct 2026 04:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793186615; bh=QcUSdXL17rFLIa5myQZVDt9x606n6jIroh7Gpamh1uo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEtZgdWtSDEYOXXcJomSuJyQq5Mzz0Mdizj3Lv2dTSyiGdaaGNcVUmebO7fsHQ+fy
	 Q/LXepNn6k46F8WKDfeP/cWjenA7HDPwmfv0vugn5SprzaAl9XP+7SOT30DyY5x2OF
	 5zjREE10nhWot68zfxi612eQqRwRtGEHBfFtM5tg=
Message-ID: <0aaf89da-41a3-444f-88ec-ff8a385f38f6@arm.com>
Date: Wed, 28 Oct 2026 16:53:28 +0530
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
Subject: Re: [PATCH v3 2/7] selftests/mm: check MADV_COLD and MADV_PAGEOUT
 range handling
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261019171206.3331374-1-gourry@gourry.net>
 <20261019171206.3331374-3-gourry@gourry.net>
From: Sarthak Sharma <sarthak.sharma@arm.com>
Content-Language: en-US
In-Reply-To: <20261019171206.3331374-3-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 10:42 PM, Gregory Price (Meta) wrote:
> madvise(2) accepts a zero-length range, rejects an unaligned start, and
> reports an unmapped gap in the range with ENOMEM while still applying the
> advice to the mapped pages on either side.
> 
> Check each of these for both hints. Around the gap, only MADV_PAGEOUT has
> an effect the test can observe, so only MADV_PAGEOUT is checked for
> paging out both neighbors, and only if MADV_PAGEOUT can swap at all.
> Both hints' ENOMEM is checked first, so it is covered without swap.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
Looks good to me.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

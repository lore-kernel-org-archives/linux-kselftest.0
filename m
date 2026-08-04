Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56F443AB1
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833533; cv=none; b=gBAIws20ztPn9ltHQCKV2wazEryzumCPBnzEpSWh6QhLJD4EMjoey7ZMzuOvqJ6xX1wAw7dKcexaNbFCZQqxh/KKDudrm+blEGV81Uk9uFgBvvrGv+LsYEe8h3aAkSxl5sJ4HZv71dw4H0swFRAznHDinlMpJyMj0651Pb+j8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833533; c=relaxed/simple;
	bh=j+Qi92SOrXItSdsGcpYY6ILDj3O4TxXGkuBi6dwrEn0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BjA9JF0K/M9mtU5mEuYxaey6bEPkd/ocR/vtRTw7kmiW+E8a2z2iBzr74TSKk1H+s/hqkSMjIUpNHkJAFDKdPk+TDLmSTxxzseNb/tNbTmGuAD61fJ/tC8nJazmUZX7e7CSJyFwsu0H5Bb2YdJMAT4xzQuEY5zMmMlK8Xk4NGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qkg6g11h; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qkg6g11h"
Message-ID: <0794432c-15a2-46e3-a24f-7e5e9f4d24bf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785833528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YI3cibW409jK7k3BzSRC0UNByRJ76mOps5UXq0vox0s=;
	b=Qkg6g11hT3FEkA57So9FCapesnDyodscqkIKVBYlmuvPAHD7eV9+LSVccIfSPHFdjeADvQ
	+AxM2hvk2WaeRmpYUa71xw1jhsdLJujxv966Lc+xE+yDJQadaoD3Rd812rsIvc2P/Kr9J5
	BaKdLndukR+oMQ3+J6iKC6DLIZwGDTc=
Date: Tue, 4 Aug 2026 16:51:57 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: hongfu.li@linux.dev, akpm@linux-foundation.org, david@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>, Pedro Falcato <pfalcato@suse.de>,
 Hongfu Li <hongfu.li@linux.dev>
Subject: Re: [PATCH] selftests/mm: Drop duplicate
 test_seal_mprotect_two_vma_with_gap() call
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
References: <20260804062440.58666-1-hongfu.li@linux.dev>
 <anGgp9cKiDKDhCpi@lucifer> <anGhWZPDaTP6M_FH@lucifer>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <anGhWZPDaTP6M_FH@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 8/4/26 4:24 PM, Lorenzo Stoakes (ARM) wrote:
> On Tue, Aug 04, 2026 at 09:20:37AM +0100, Lorenzo Stoakes (ARM) wrote:
>> On Tue, Aug 04, 2026 at 02:24:40PM +0800, Hongfu Li wrote:
>>> From: Hongfu Li <lihongfu@kylinos.cn>
>>>
>>> mseal_test main() invokes test_seal_mprotect_two_vma_with_gap() twice.
>>> The second run repeats all assertions with no benefit. Drop the
>>> duplicate call.
>>>
>>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
>> :))
>>
>> LGTM so
>>
>> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Sorry Pedro mentioned off-list that you need to update the number of tests
> specified, e.g.:
>
> -	ksft_set_plan(88);
> +	ksft_set_plan(87);
>
> In main().
>
> Update that and send a respin and you can attach my tag to it.
Thanks a lot for your review. I will adjust ksft_set_plan() from 88 to 
87 in main() and
send a respin carrying your Reviewed-by.

-- 
Best regards,
Hongfu


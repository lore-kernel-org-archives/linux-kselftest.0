Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEDB29D265;
	Mon,  6 Jul 2026 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345625; cv=none; b=guNZGb/gqRwQXVLKftsNW/0s/0ihjwfWOD+esRtNzcZs8r2RQibFXxRZfa0eP+a0SMpSPRTefDwhu+vPH0+d2nYldDsLuY06McJT53L55aywk8x3cUI9ufW7s1zVPIi340uaVsL8OgPbSKYvJmTpHo5+cGseK2v0in/S4Z5WyOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345625; c=relaxed/simple;
	bh=UtgI4lw8E3NTxivL06a9jwYXMukKscbxytHaXl3Yd1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QpCXfKxQ7lSy6NxVnsevEis3g4gm35bCaKm6LDpYDG/EqAcz3DGF/FFmeYZv6pqV/PaItms9jVGXlC8T+aRMnP9It1bhqeLJsrQTKta2jMq9hfohe8JjZbeLg6BfFLfEPeedFfs5zIqhS+XKq/itzpyINUZ6ILyxWy7HA/P5fuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEXCbBS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEXCbBS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5483B1F00ADF;
	Mon,  6 Jul 2026 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783345623;
	bh=bE75Uesevd0qFjsHhZ00uNBsyFy5Mf+YUOmZN/u63ZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mEXCbBS1hGkkaViwffeIdfYIe5kFScAv78jQ6xrbIsLwo7aYx/WLhz7L9yw2UHucL
	 rIDkx0WF4bI/LYiY6J5m9G5LzXJQDEQr8S4dXIjfZOOV69X+wYBg0EOTykMX8hKz+U
	 v8dchSGhziyCz8IuNne1tZi83FFi/cscqxm7iongQMyE+tFNe8Db+DEuUQ2FOd79bq
	 OVbBNzxcmuKW81iSJn2eKQQKbuiW8Fm0pcsWfSl/rZChQBjl4ICJ5ufNNpbGidPYqt
	 rNBJsEvmYj1WHWU1/EJFJU1Nx7s6B7uVR4Q2Dqp+e2gWKc9oGZdPTJyxhkBWTd5uVM
	 LJybkhEu+Oe+A==
Message-ID: <4913bf32-3695-4983-9ad7-ea0638807453@kernel.org>
Date: Mon, 6 Jul 2026 15:46:55 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] selftests/mm: move pkey selftest helpers to
 pkey_util.c
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, hongfu.li@linux.dev, jhubbard@nvidia.com,
 joey.gouly@arm.com, keith.lucas@oracle.com, kevin.brodsky@arm.com,
 liam@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 mhocko@suse.com, rppt@kernel.org, shuah@kernel.org, surenb@google.com,
 usama.anjum@collabora.com, vbabka@kernel.org, yury.khrustalev@arm.com,
 zwisler@google.com
References: <436863f8-5840-4c3f-82ec-c55b46fb9969@kernel.org>
 <20260706103143.3638104-1-lihongfu@kylinos.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260706103143.3638104-1-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/6/26 12:31, Hongfu Li wrote:
> Hi,
> 
>>> diff --git a/tools/testing/selftests/mm/pkey_util.c b/tools/testing/selftests/mm/pkey_util.c
>>> index 255b332f7a08..fbef3cd45447 100644
>>> --- a/tools/testing/selftests/mm/pkey_util.c
>>> +++ b/tools/testing/selftests/mm/pkey_util.c
>>> @@ -2,9 +2,99 @@
>>>  #define __SANE_USERSPACE_TYPES__
>>>  #include <sys/syscall.h>
>>>  #include <unistd.h>
>>> +#include <fcntl.h>
>>> +#include <stdio.h>
>>> +#include <string.h>
>>>  
>>>  #include "pkey-helpers.h"
>>>  
>>> +int iteration_nr = 1;
>>> +int test_nr;
>>> +int dprint_in_signal;
>>> +
>>> +#if CONTROL_TRACING > 0
>>
>> Who sets that CONTROL_TRACING? And if it's nobody, why are we dragging this along?
> 
> Thanks a lot for your comment.
> 
> CONTROL_TRACING is disabled by default. It can be enabled at build time
> with -DCONTROL_TRACING=1 to capture extra debug info via ftrace for pkey
> failure debugging. This patch just moves the tracing and abort-hook code
> to the shared pkey_util.c, fully retaining the original opt-in debug logic.
> This is based on my understanding of the existing code design, are
> there any corner cases I overlooked?

This is not documented anywhere, so it's rather odd. I wonder if there is a
single person on earth that uses this :)

-- 
Cheers,

David

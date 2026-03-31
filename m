Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C10738CFE7
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984080; cv=none; b=LyPKkiXg0En8rRYAtwOSMZnr5gM9+d3zvVd/A6mTGPzp04VexpK3Y2thGPU9m9Y/b+ib3+YBXspQVzQ8K731FOCOOoi+lagz6V9gSgG9AOr1FRNIxuBccfwaSjcLopVq8UCpwCAJpv6/1jBSN2Szz6sAWwtFXPPOk9LdzpyepEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984080; c=relaxed/simple;
	bh=WOKISH0jd1mavO/MJ3aV6hRO/EoHDJltYPyElxXPjz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROobsezBXm+OhCzNoApSFGngFxZVh8Dc0vGzBsRpxd1yx5U149T09yYP6fUzMXT2gmLCZTk4E8QIRNY9jYYmWovhcrlD5VlOTeb1Uhq2oNVvvHRL/7iR+xEeUfXD0GYvfAKs8ourLUg1W8OcKRkNM7AOWxmuS3ifwO7BU7O0Z0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ee5Dm7tm; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ee5Dm7tm"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-46704177543so4049806b6e.2
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 12:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774984078; x=1775588878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZLgJZJAn2n7Hu2UZgX8MJsTEDcLU3dkSL94lyL1JSU=;
        b=ee5Dm7tmwBMOzIrYjYpgGtRu9rIy9Cq/SZe5rysgHSvQLp0rzuV97ByxEt/h+FUehG
         AjxRI0DvJpT8Sm07aF4lEzOMeigkxZWUUVb4wsTcyCqzStcpbnI49JSXGxAAoZMsjV7H
         4KaYXJ5t1eJ+M2HUAo0XtiV3XG9sJfBS31j50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984078; x=1775588878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZLgJZJAn2n7Hu2UZgX8MJsTEDcLU3dkSL94lyL1JSU=;
        b=d2V2AK2Ic5yUWLIkoD33b3C1RjrfXtM3ikKhSwVdEjylGRLJRUbjBir/mbeLwjLR2A
         oVJd3YgubpfGIYuhBSCOYzJTCfxC0qc8utaP0xfMSpz6AOwGB12w2y4Nn/lqqzuEjVeG
         VDMxP0GtUYRch94bl+7aTvGyDNUEbfNfUazoeIvlZtBTsT5KT78RefPu1/wi9k2ADSMk
         8cbG66TDm0101ZBsHM70RZpm+QDTb2mew8aKQqh9KfpZ/wR9yRvR6/DQcp5PA7xkAiba
         6vuegrRgv7ry+Xshs84P/qNRLVpji239w1eT9BvTyxlFOpFFBTwbAbjj9d1IJQxaX8Wq
         FBug==
X-Forwarded-Encrypted: i=1; AJvYcCV79rmbFaGQIG03ZfalVZ4e9LaENbpCn8v+UX8jdpVDXaTkw2PosRcKrgY/vtCax2eMAzRpuED1/tyefKpkwBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBnnwbob7BBoW3cYV63HKvx7t7w6aDTow3ncmfyaryhHhitMFg
	l7QTYABsZcf9hsoGDLVEut1R0C6DvSODSRvivAHx1pZt0lvj79OTU0X+fGGwU99HmHs=
X-Gm-Gg: ATEYQzwzHaB7ofC5/8d0oo1XPC/O4Yht4/Skw4elEmhyTBaeXlztHhk7ZZNVSLnOax1
	Gn/Mh0uRYDy4Ep1JZv5tPZO18JDNjuyGnJ7Hh1UWxj39E888KE9LzPMUlxbI9IRJKr0YEWwtSG7
	mCMpmOTXIF5XBj6cGtSNcIKg5nDptxMD9Lrwr7cAj/mqxLy5rZrBCRuv8tibqm/Z3v7qWG+HTgb
	iu+nlV3RaCGgPsXe5u31cIRshfWkBdib83TYgycRlqFgwL0uZHP8OBADdghsjD38tAuDSz88+wK
	cmPzzmmjAKrsiyurHRl92EI9pIUAuldi2SQe06PUcmDW2HgGGjoQLiNJqwL8D4sKjfPRSzgpHTZ
	nqwDtefrIUp5Czj7KF0Hr4gAFaQ+rK4MXSpORzqpT5RTKzeQ8tmoTdWSV/aLQGhqUxM33ohJ1lx
	l9WbTRVLWczPQ6t4shcr6Jm5RtsJ8DAk98ZkE=
X-Received: by 2002:a05:6808:15aa:b0:466:f25d:327c with SMTP id 5614622812f47-46ae013eb8bmr366610b6e.25.1774984078528;
        Tue, 31 Mar 2026 12:07:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a9fe97980sm7265599b6e.1.2026.03.31.12.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 12:07:58 -0700 (PDT)
Message-ID: <0a9c540f-5ee7-4ad9-a533-a86f31c15add@linuxfoundation.org>
Date: Tue, 31 Mar 2026 13:07:57 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests/tracing: Fix to make --logdir option work
 again
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>,
 Gabriele Monaco <gmonaco@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <177071725191.2369897.14781037901532893911.stgit@mhiramat.tok.corp.google.com>
 <20260304110425.3858532b6ba092d84a31595a@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260304110425.3858532b6ba092d84a31595a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/3/26 19:04, Masami Hiramatsu (Google) wrote:
> Hi Shuah,
> 
> Could you pick these 2 patches to the selftests tree or should I pick it?
> 
> Thanks,
> 
> On Tue, 10 Feb 2026 18:54:12 +0900
> "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> 
>> From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>>
>
Done. Sorry for the delay on this. I applied it to my next to send
it for Linux 7.1

thanks,
-- Shuah

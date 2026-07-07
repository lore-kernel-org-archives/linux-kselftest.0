Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4833F390
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 19:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451643; cv=none; b=m0Lds967uizyQgIK/nrcOMY23fX8MkNEY4+lSV2yH3wvqDr8NfCNDl6RzHhFv9IMjk11uUSXjWR5u5YISKWc5a9Imdy1wEkqaUxdE3g0Odxy49IFNq4GRFo6hqg71JgsMYpqxncncAxFGc0cf9P1ONKPffTSWOc93JgKGlXN7jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451643; c=relaxed/simple;
	bh=Q0yebGwL8eWx1vNOrVrrq1jpOqA3B/QDaiR5qfl5as8=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=CsFbgv8eVh8LJU+KL1Fk0DpFOI6OygIZpUrVIy2bmcB6kzR+d0bKpWSksUUkHr74iQExJFTA0qghJ3vkFQVnNK/fbxUMwyBap57GpSzOJohZUG4iZ6bpxGCBjm4xcfH3iM8fs7Eueqgf9H2nWinxvoDoz9OFwkh9olvx9FAqdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GRmR70lc; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GRmR70lc"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e622cc874so2783085a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 12:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1783451640; x=1784056440; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGfDZeEdLGeen0qW0nrFDO6a/FMS/fYRJh5VUHrysIk=;
        b=GRmR70lczsMV8NilnhewKXlOJqrtkmcEsfcu7rEYi/zAiio08xkrPeUoHb+AtS3hBj
         nRqAIsGV6+YyHkJdFC3WSFGvSUSaVLzkxykuPo48EOiGPQchnS4bHoZAWl5vtFQOyt7b
         65IHe3/lIwhc2Q4acrnQNwGT9uoaN03byQY+zthYe92pvfuzZXTzOPDhKrofQy2kMd6L
         RmQ1p3NCvrEJgPQmvqmSKCr4148hqTcMIHI7vn0fW2QdHoKkzN1UCFj2r6hGSECBzTvj
         qI9n/CGjHFKLFjc/j6Y3KvEjoZF33Cvkf1RA0x7iDW5ezyuaIZ5rpXbJ4cgP8WVpO3Az
         bwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783451640; x=1784056440;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGfDZeEdLGeen0qW0nrFDO6a/FMS/fYRJh5VUHrysIk=;
        b=Pjep7FtcoqAtE0gnTS8gE5u43SeePCgJg/38CYstY6YIbddAFghUg2UixlCti9uc6d
         V+7dEtpGKkkE7OQl+N0zCN1W8A/UgCO6Ld951KMffmtDQD/hUkraIMRPHTq0oZeinlMB
         fZMb+GL5OTDv6zUaFSlTjVa0DrFaqO0GWzrYSO5zxR2ClYFXPGg4MdzRb6bTCJS6Lgds
         IdlE3ARFyutmdzT6A97I30+59C9zQMjcXfhFftTMFtRu8E37tqjOdvnL/q4bAKBXGnJ4
         UDv7OkS086E3jmoRtheQxBMBFp2ULdS4iji7avSC+kYjDveO9GWxe95+pi6K/jSHQ52K
         cXNg==
X-Forwarded-Encrypted: i=1; AHgh+Rry8NA/t0Dz0Dov2VgnoMbczu6942JM7oYecENczi5X17H7Nm/es6tJ9tTdDhwLjFvS/ebeUXKCv6OWRaKnYKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhTjz17hQyLNannNsZLt6w/rFi6AJZGRtTAaphjnQiNo9P9VYI
	EpYcG36JV7sWfol2iHKWDATFMJGnIrZx4fozgrhIx0sS5bUsgDpGOmK66OL26Q/+Ag==
X-Gm-Gg: AfdE7clyc7lUIqw24/X8B2QPR/ohsiq1dOJJrc8TOF0PvLne7JlPNyS1CpRmC7IunRO
	Lg01nyAYlsY3plVIu5fSH+7LKYERPlg6GqmvEAQ0zVUFp58siUQx3KWyPDiLRVtQPOgg3je/vWi
	pMVf0upNt7Qw24A/Hdj7dIq8vD/CzbyvoqbXOtagx2Ip5tZdjK2k/7qdDZrcayk/ZQAgQYfdwq3
	KHVIjK2L9LEFcYjLyOZaVBEN85knsTn2H1PChOV7GOL4ebYrWyn9o+vHnWfEdxs9U3mWp4tcCO/
	L7Y7eAH4wQMsQxX3esl3PuOniMzX7GYF1kjqnUbiHeJPG5FNyVUGj2Ad+qcS0/NccOLWFvUJFMi
	8TXF05Uf3JR03SR79n+g/E3riMOVbWxW+r64FuCIB7ralxwIpwQ35Moyb00521r/zlSWL6/O6Cv
	1fNStipZUwa2pwwDZseLjUOkMEIpeH2sI2NNIi5OOxNmmMyDkYTBeXR6cCaA==
X-Received: by 2002:a05:620a:4515:b0:915:7fe4:cac5 with SMTP id af79cd13be357-92ebb57dfcbmr743131685a.49.1783451640236;
        Tue, 07 Jul 2026 12:14:00 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ba4209sm1318251385a.12.2026.07.07.12.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:13:58 -0700 (PDT)
Date: Tue, 07 Jul 2026 15:13:58 -0400
Message-ID: <14023e3368d98072f369e6fe1607c7d5@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260707_1504/pstg-lib:20260707_1258/pstg-pwork:20260707_1504
From: Paul Moore <paul@paul-moore.com>
To: Wang Yan <wangyan01@kylinos.cn>, bill.c.roberts@gmail.com
Cc: casey@schaufler-ca.com, jmorris@namei.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, mic@digikod.net, serge@hallyn.com, shuah@kernel.org, wangyan01@kylinos.cn
Subject: Re: [PATCH v2] selftests/lsm: Fix memory leak in attr_lsm_count
References: <20260703120951.1622491-1-wangyan01@kylinos.cn>
In-Reply-To: <20260703120951.1622491-1-wangyan01@kylinos.cn>

On Jul  3, 2026 Wang Yan <wangyan01@kylinos.cn> wrote:
> 
> The calloc-allocated buffer in attr_lsm_count() is never released on
> any exit path, including both the normal return path and the early
> return when read_sysfs_lsms fails, resulting in a heap memory leak.
> 
> Add free() for the buffer on all return branches to fix the leak.
> 
> Fixes: d3d929a8b0cd ("LSM: selftests for Linux Security Module syscalls")
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> Reviewed-by: William Roberts <bill.c.roberts@gmail.com>
> Tested-by: William Roberts <bill.c.roberts@gmail.com>
> ---
>  tools/testing/selftests/lsm/common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Merged into lsm/dev, thanks!

--
paul-moore.com

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793274912;
	b=zKXduov9ZWuVrMk/iLUgkj1ibkyLOe7up+uwhUXmxeSycTZ/B42cEdWpSJV4a19WDQ6m
	 Lqp8oFhD97yRL8UyiDOvs6wQciQ3TOAoV/GPHrBhiCA2O+Vwv9e2lnHR6VQ2VyNWMbcyl
	 CRLWwjnsb/3MElkHCzIkM6kRNkFEUsqoEinAf4E5XbKzkX50LnS5a5kjM2kmAkq8wlhwL
	 Wy1/DzPI3myStPsiR1uIkCjfYVAkd5kh5eBXLv/pvTzVZIHQpxMNRV7ZV9cQWEMtWwR/E
	 186oW4z3N96b4YUM+eryj4ps3yTDYEe1Owj9mqeuzWykFEuCp1GiZfG6ciG+v2wE8+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Original-From:References:In-Reply-To:From:Mime-Version:
	 User-Agent:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
	b=tRYsh9hl8+D61x0HggdE6PFjS0diY4Ja5ugLjrvguIaCBtyMsrmssueYv+Gs0XmSUO6Z
	 rQl4A/5ASNKbQnWROeYueOcTOtDDXzwXKSGZIQeiq2vx5yXbeDDDc74qB4otTKBYhHiAG
	 l8f+GUWsNMGT1suly7KsaYM19w9ExEzjR87sh9XSK41tik7zBDAQGFZmgdIQIvcy1Df90
	 ZKq2L1qFCIjXu/h5KVEZUNxkSn4heGMbxzPJOyNao5G9GME8OzPA43Tj6yqSBteK7bsPq
	 chVkcmhf8J7WZ964H+oPPlCTq170ox11zT0Mkfr+sREBMEJttOS0CRwFLH5CiW2t1Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CuuMj9g2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92919606A322
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92919606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CuuMj9g2
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1866571e87.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 04:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793274910; cv=none;
        d=google.com; s=arc-20260327;
        b=hH2/VUsd+hG1u5PUZNbVmSXFO4aYkKHvY/PMwWGUx96pk5x9Oqufwbfgg0D9VE6s/p
         2RVhRDqUcNWHYzLZHTAlzfaRvhgiYcHqymkcDMzr3ABOgcrzW0RbLREahMFkDLZNqXA+
         B0WUJq3uqdmEBKNGqA6VSRn7M9n9hUcmfuIoEJrrItEtis4waDlLMY+0BvIuQzmkvNT+
         3R7Kk5e5Uw3w4huvcBO2ZhKSnw9kkBVLQOQTC6CINT3uMOL0ePd1Cemzpnzn5gi6c9GV
         2xawJZ3sU2mX+yIw2y9Ef/Ibt86/xFpLjVpEKlGLYZUh8KtOMr2ywRxhlkedgaaVa4kG
         if8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:mime-version:from
         :in-reply-to:references:dkim-signature;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        fh=5kiARUD9CQGmT3xDOTTKE9ucvB8GRfiDWMqEHVsM9/o=;
        b=kTTgkBV31ChxSDeEI7oDWHm5JarHLlpAtYh2dO4SYAfvrMwLF4fyDvKP0qTbg16aMQ
         XBPbSu3IK2Ixoj6KrjgM3XTo3mSxhyak8GrvoV1Da2XLNhAw0bRYIAy2mPGTwRPrhQv1
         kDc69hSHiHr0KrRiVOg1ygASxxx2oxLGRwUBp+tnOmJRl+c7sl1OFhs/LaBLbFw54MoZ
         xpeDYBx9ai/AGv/7f6JDhYXbBFGIGaPZeg+SOYU4cZgAOQmLDtlfk3zAF8EmY+pl1wjp
         6mAQhEW56iexA1scruA+dwcioOQbZDwPb/AHyNHuwuVBL4O44BPmqhFKYqFesVHldN2O
         QvQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274910; x=1793879710; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=CuuMj9g2Ph+v1MKWI7x/Ma1dHL0Yr4KokjmTvuzJuVaafCQww2WgpuyLSHPlgWCcD/
         +Gk+X8VA79TI3jaY6nC6/lgeOAgqapOhP0c8xZPuPpkSYomeOdNEBwQni95Grcwd84fk
         0zgQpy67pQE35kAeiaEWruBgLx52yWqsp3rGJqwcEiJRwTDz4zDYRzRbxk9SEsvxX5lS
         7m8CGcZU0pOzrhooYnyOmP3atBJQ+M78Uk59VVZtrrTUdGOndQtrAHVOH2KcLXppmQaf
         8uTqekRKs9XNH/7t1+8VISE0bfe3CZPTREigA+N8q68VSTgdF5IN3ggNxT9g9ztZTP0H
         pojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274910; x=1793879710;
        h=content-type:cc:to:subject:message-id:date:user-agent:mime-version
         :from:in-reply-to:references:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3VY7aUW6rjKEecWzoHgMRcesnfYCNorLy5OBPK7xTbg=;
        b=J6G02DF0/kEaKiC7630bM+b4btE+YlABke5DtgAKh2A7cTWxy0vLtE/XEkRoR7LSkO
         Mx0TD76NSXjw/BQck0AK/epjUSvCyiBfYYaDQSnbyKiwyR1BszLEN1UD/P5nKKmaC/DL
         QyBqm6t6UmawTDneJ4F94Io6ncFgOZz962jkTcF2v1UleH8N02uPsEVGoFVvoiBVZrPN
         f9aF6zwG55gAaTiwNnBOI2A8F22TD8onVB5Xk/w7RTDg13Vlq2yfjEw2pNRd9U8RFJ6j
         yHlBjzs6X2wqm/cnuvTGNzh3mhWYoeq8iMwWEr1NpkWQXQ7spJQQNSj8Dyg4bYWsnw1m
         7K8A==
X-Forwarded-Encrypted: i=1; AKwUvBzUuR2ThxB3O9Ds79V0evHCZ7lMscvziYczJwuAQstcT0YqFMFpjue09qxE7A/Fw47/EdIpyPaerc6aiwr7Gu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpmNQwAI/h76QoFlcWuiCIebqDH/KiUXf4qQ+fCTAYPbX5YKiW
	8E7BzvUmFS2TzzKydA3QfJQSykT0zM/lmLu0jCM3ztazrcwNtd3X5bsnT3AnBXVbsdKzlhc60XT
	WD1wdf8gGdJlufzZ/SvSHdL1Mn9ZUyYlpvbzMS9CjYw==
X-Gm-Gg: AYBFou2n+pjCpek4JpTK8z73sUvXh7z4MrsmiLRXbmXzT+dehtOP76FPWeqs6TKIbwi
	UOYSa/DTeZtsrLdr2HypTLCKqAVoStlcF3KcYQU4K/DOwu7wTHc6WqDWSicqFV2KGYToEPPuBah
	ziINwRSYnTaG1qGPBfnv1+wHKJE8uCMRFKD+O505l8qclEqnzr/Qc9NGGfcG02WBI3Ln0tN9PEB
	jd/D3G85vrA9RZoc1huxgyDn7S7MIXjZ7DLe3tCGkPbJbSwCLRy8wnDtuB8N3XpJYqK6pp4y/Bc
	o7gcr9vabwjd3OGwzWST2bqYzu1r+wg0Ht0ciWjc+TobmdcYAimqG6iCmPgTT9fjZXpZPZ8G/HZ
	tqKLa/UXKgGVuMuiSb1aBnVs7Lspes2JbLiGzqQ==
X-Received: by 2002:a05:6512:1592:b0:5bf:a209:f81f with SMTP id
 2adb3069b0e04-5bfcad27d03mr1811204e87.37.1793274909843; Thu, 29 Oct 2026
 04:55:09 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 06:55:08 -0500
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com> <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
In-Reply-To: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Date: Thu, 29 Oct 2026 06:55:08 -0500
X-Gm-Features: AclHuK9_AGd24eF3VOAo28szXNgJA0RFlLmIywua3jpx-rZ6jgflVyqTuZQeovM
Message-ID: <CACnXVncN5yT7Dmqom6m1SaFO0_MjXeoScTRfGUZ4RVdZKhAnHw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 00/11] riscv: add SBI Supervisor
 Software Events support
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Himanshu,

On 10/29/26 7:38 PM, Himanshu Chauhan wrote:
> Hi Zhanpeng,
>
>> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
>
> I See only 8 patches out of 11.
Oops, I ran into a Gmail smtp system error. I've resent the last 3 patches.

Thanks,
Zhanpeng

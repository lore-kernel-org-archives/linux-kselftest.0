Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A12A2BE05A
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948336; cv=pass; b=XHsSinxRIDhmfzN6xJEGzultNzvg6uVHhhZam8JmHwAJsmZZAtC/cCEsM1t4c1hBa8k5z82wr95+8/zApjcZ1cWkCM+yyNrf8vukV4yXXg8Rh3BDrHXODCi485mM6ft8IY/0NYdb8gUnspu7BYEKvEk6Y6xFlLxjQyIUmLD/jeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948336; c=relaxed/simple;
	bh=Qs6MOo0ipbx7jwU40KRVH3VbId5c+se0y+w18KEpP08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyV4hWY/Vb8Z66frz7x7FQgy/XNYb4M3JRlf7HJ0+aISDknUbiNmEm3GZNTAGdTrqbs96QHavmHZNkSXnsqli1exT5gvZCaHb564PL1bmDei6VFhl43bMLSausUkGk0yzHyElgn14LpLY/YdeXJOCs9v+LJNDejh1CHH0ONElC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=Fyh67PfP; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="Fyh67PfP"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86927f9ba4dso208108b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 03:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788948334; cv=none;
        d=google.com; s=arc-20260327;
        b=Q3s9n89C4ZJJn545HFhHjvxDyxSQp8wf+qfCrl2k1kTR906SLZhYqfb0UyzvAoPjB8
         Otj4DvVfIEa3bj2xsYVLBekzoFJof0vfDixrdpWe2N/QGzSANqMGlw8xJwEzETFrlqzN
         CSjRPjDfzKptbJV4CMRzstWAclPDLGZhzDKf5lGpy5ZYmOlKwPnmK9crF2fCM2Qw/e3y
         32yMhLRridwySEILSues8b2P+cc4f2dBNaWudV+Cj1/W1YzqhTL+4wnE1Jn/xVM1dh9V
         ck5Y8aUEUNyKOEEvNRdcz4BH3GkvrI/ExRF3F7gpzl48W/8Y0UzaBIgUExlOsKTUm4qu
         xDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H4NnU3M9b/3b6iNVJB4nDxkla8ekZHTTUWyoEboJwMQ=;
        fh=pG8EScw24v5xtWxVMQo/7k2xt1q0PywdW/zyJRgr4aI=;
        b=M6I0uUKkPpEm4jYjTdSQDlVjj3Ndpypec5ILUUEZetiTPeJfXZkZZ6YHImu6DjtxHg
         XSrBl7YPT+/11VTES0EVjqssO/BjKUkYdXBCoTzOBjHa5CSmGLR1ADQ36S6BKu2wzvP+
         +7S0dPM5QzV+Rbua9p6AuY36LMKB7fYnWFvVWJKO3pgeni4BsWFaIT5tckb4Zk9cwojO
         9n0DXbMyo4jytoxaj11Z6SEklVCFCu+zTTAU5ohvHU6Wiq4xBO49NLpkvO3k2MLkKee2
         LUFi9A6YWFR0YeX3XXaEkkKvidChHzB7tlpm4eg/MO7Iq32yQd7m9V0IEFSgtM+O63pt
         ph7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788948334; x=1789553134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H4NnU3M9b/3b6iNVJB4nDxkla8ekZHTTUWyoEboJwMQ=;
        b=Fyh67PfPES0WDZ9cuGkdzPUfAb/BXY2KURx51u1wdu8e5Tl6ZZNBpFh+EqcZZx7lTA
         8NPTp8/HzX1M90Nwc08bVnAk1tGvzBHlu7BXLvpNxKzVK+fQGfwoqyF6PX3ls5Augf2I
         7PrJancQuLGvRwcbf9QigiGfTuZb/EANssCYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788948334; x=1789553134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4NnU3M9b/3b6iNVJB4nDxkla8ekZHTTUWyoEboJwMQ=;
        b=OtIuiXwudlVr7a77sErENOzlGxyBYHG+cPGRLHjOBF0C8EH8bh0rqa9EXPT0SS7h6r
         7+s8UsMWZ2OV8wMl6lImA8ztgB32EG9uC+gibfbXGggbRKN5pv00MzM9fCulBN23Ykxv
         zIOFo09fe1tlAXb7kNFenhxNU9VieCkmjM9MrlmcXAVYdpz5U55nzWXk3yijvZwkhQlx
         +70+7IFOI88PTMzHT5k1MPX9MrnGf7jgHrfyl6XBfFLZDn9dPrDaHwX51kaSR/1hXIrQ
         p6n7ogjgSB2zLuFOnCC72mKN4U0o9XZ7aJAFT2Vy82besrKo7pzsUujTtDZOR+lQQyTd
         i9qQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4GYV+H8NNcbflPQtQLn3OT+Q50WK4jjQ0UnnWqQ0bSBGgMro2ABRrP7v6iUdUpdc86503jdnauK5QbcirXF4=@vger.kernel.org
X-Gm-Message-State: AFuF++n2SFJr26kvvj2M1HtKYWAs6FrMiIwKNWbvic7wahBp6p1YIaeU
	izC9o0offaffVQDH2m4+7dwblQCegOr8ZGpPBFyAn5n7CMmOuOrwmaVUOlm+wBFzT5iQeXvrwi3
	h2LVBCPgWxhiTJAA911TJe9fUsELjMiphmiiASL8j
X-Gm-Gg: AYBFou3fMOuZqM2EEHKuMMiyg6GDnA4adnRM3TddxUVfgCJxK5cpXuQJI9RSafdfbTX
	VcVOWXyhEzYUb7Akdl5fhhnSxld7DKtHxdtogQU4oJmsskaUh1qVzuYRyEOghIdmVspyToKq8fx
	qi8ipLkNc2l54JdG1eUFJVizE0tTVx4o9O8quJ9A7glOszDcO2c5+/oxUM0PJ8LdXz8HSz9cW3n
	mXc5c4/0oHIjoUYBymC5QU21EuBTXBiuSZ9YudnQaqgjfcf8ftRHphkM0l8WTjDKhgfrei8elGA
	Qobl3k/CYH/S95F9u0VBIurLyoLiE2u8ySZX1EUPBXMvi+6yUvwphBw7gCAyhVzi4rP61f+wrDA
	mdA7fE3MpojoVJInnGN1RwDdoz4k7vPv4vlLPmkt8S0Yn
X-Received: by 2002:a05:6a00:4298:b0:84a:646f:193 with SMTP id
 d2e1a72fcca58-861633ca7b1mr48778621b3a.0.1788948333754; Wed, 09 Sep 2026
 03:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
In-Reply-To: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 9 Sep 2026 06:05:21 -0400
X-Gm-Features: AcwNN1XRsCSsVSIJECxCc-1JgLAJouQ3Cyvq8feC7J8tsCQrA7yQNPwNFlVqu04
Message-ID: <CAM0EoMnZ6AwTX45hHAkqe_tvY0jpeMhzz=c9jhduzzau2Qn84w@mail.gmail.com>
Subject: Re: [PATCH net v1 0/2] net/sched: fix action batch failure cleanup
To: Xuanqiang Luo <xuanqiang.luo@linux.dev>
Cc: netdev@vger.kernel.org, jiri@resnulli.us, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:04=E2=80=AFAM Xuanqiang Luo <xuanqiang.luo@linux.d=
ev> wrote:
>
> From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>
>
> Failed batched RTM_NEWACTION requests can leak action references and
> reserved IDR indices when cleanup encounters a filter-bound action.
>
> Patch 1 fixes the failure cleanup.
>
> Patch 2 adds tc-testing regression coverage.
>
> Failure reproduction (key output excerpts):
>
>   python3 tdc.py -f tc-tests/actions/gact-rollback.json
>
> not ok 1 e3b1 - Failed action batch releases a bound action reference
>         Could not match regex pattern. Verify command output:
> [...]
>          index 1 ref 3 bind 1
>
> not ok 2 e3b2 - Failed action batch releases entries after a bound action
>         Command exited with 255, expected 0
> RTNETLINK answers: Resource temporarily unavailable
> We have an error talking to the kernel
>
> not ok 3 e3b3 - Failed action batch releases repeated references to a bou=
nd action
>         Could not match regex pattern. Verify command output:
> [...]
>          index 1 ref 4 bind 1
>

Thank you for providing a reproducer.
For the series:
Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal
> Xuanqiang Luo (2):
>   net/sched: act_api: release all action references on NEWACTION failure
>   selftests: tc-testing: test action batch failure cleanup
>
>  net/sched/act_api.c                           |  9 +--
>  .../tc-tests/actions/gact-rollback.json       | 78 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 7 deletions(-)
>  create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/g=
act-rollback.json
>
>
> base-commit: a401a9d547c50ef34db1088cc1fb9a201a7af657
> --
> 2.43.0
>

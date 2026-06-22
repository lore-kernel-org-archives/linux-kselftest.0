Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F2328611
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140860; cv=none; b=nPWuzE7k3UeUvr/Of0cCiT88avKMU7msBQeKRpS2VUtgtROPA1+DtOP4bTQUaoxeMB+opiQLvZ+9ny/ZTlPXqIBhZPbRMRkw1zI3/wcWPyvOR9xOB+FtYKwXtu5+8QBuRWB9sDcbVbKi7HYmaE1D8pjK5A4ftE/ClD3mJRLGwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140860; c=relaxed/simple;
	bh=xBXWI7ywNhWEpCObmngyMiWIQm/IBOBcx+drCgO7+g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7J6ZrySn0PrLfW+tdsT9FiixgcgZiSvbDU6s+4Vj5+acK0Rmntgu/7dZUglVSn1yOAN4oPVWeloqQ2XiR8EkBZP0Gh6kQ7ifqYZ0dXYNB3J8CYyM3zox5YwMzsz1tofiKvVWQCvpvn8V+I7QzpJ6M/a8j4XQUdHNViPlIP/Od0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO7wFCby; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO7wFCby"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ac357c55so49334875e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 08:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140858; x=1782745658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXCzYZZClXitYFiBiTM+zWeQu80jhLX2xwVlQc+hlfk=;
        b=JO7wFCbyjrPTjCOj8nuNOUoPOyaMkzJeeV4+YbNlyxZ1Dt2rkK9sX1RfI49dpmWVbf
         N45CSmYzTStJOVhR+t+1x5BmHAqVQmgrvbHGqH8mFhtDgpoYbT0sKCWa8gYvFl+vL/KT
         LfAHqmTU3auFMr65A8d+eEXw+fdO5OW05UKbbN3EYgbEQcEtX4TCdeXnALqUjCf/04DK
         9C5YuCIrA/rKDLxnGkucYZfa2qZrX0UmOkD4Hizpfb++reC2pFooGdfwfN6rjYIdRSRT
         cs0pUE27aVGY9SR2yiqGppKmxcqCbGM7UmwOhkZdvmIZXrxUqmnlFFr4cCghgctBOdl9
         JTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140858; x=1782745658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXCzYZZClXitYFiBiTM+zWeQu80jhLX2xwVlQc+hlfk=;
        b=GI+pIfqJAmf97iM/xJRhI7HenKv6tYqboyoZFcxxDnoFrkI7OTin//r99dWsfDj/9G
         wCMMwdbQTHKMOkYxiT0G/n+fOQ8ZwAM0+65LxFcr0qvbNtLz34yh9g9Pl16OEgxU3HD7
         N4evOEwwUUykMJSRYwxwKhTkN/yADaRDvZZcXslJ8gBQDi0l0Rh2/v8Xd0dafoz8wdqz
         BqwVihQgSGBODIlWdBR7EliNKmcmENq8hDe9YTJwAIla6O0lFJfs8zGxQXH7dnLqGHHP
         irnLtlbm0OYeOioLGMN5YiuMopJkasn99P8jtY0P+GJGRFwd5+0kAOzIa8A/V5ZXMkDj
         GdwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W/VIsnh2qKSLDXDIQq80IX+AZ7hCeGyBZeSuuP8HBV0kjcRXrIKH2K4pUn9kSdPckjSRlXYNO74ovLAcqzNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNZs9zU2gIcFrq3oZkh1offBZSFGM/fvPeu37hMHWaS2YkjMvm
	k7MKy8goz4PXDR3OIp2UHa38n0/hu2IsQoUvRGYbO4xn5b7e7jkZ7kzD
X-Gm-Gg: AfdE7ckOaiSWb+J3u3wW/MgneDXB2RY9VnQC45paN/th+x8JUAz/aqQaKghZTVf/2Gj
	s+yQ+KtxygXjkb4t4c4LHZQGERBO/JyKti8uzG48LV0orMOAtyBELoPHsSY3FO+PpIIILL/h67g
	HYbILnYtn1Ld0jNs1/wG2VtZZKLrq4h8m1/qAC21nPW9zN5DuoSWo0EbOZj3rVHDOsyjoKwvvvd
	99AyRrxJYG5Dicl2K2T9HvfT0Lgy2G3+sFRx7fGwlHznupG+HFQhmfb2YZBPMd3sgPuOe6AIBza
	KM5pn0ZA7Viiw79DZI0c+t0nHK0J6+mRFLiEB/AVGAxcAOOINytY86YnlFMDs2ffsfI8GpKomnV
	/ZDOUJNDURuY5UMh2m5NoxcCtM76xgdoZ8V25uoPynA0xRI1+psPqOicYFmg9TOGWKJU6/G/T17
	29dfwKD9mS71jLNgtg6dPRWw==
X-Received: by 2002:a05:600c:c058:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-49240e5af38mr228625665e9.17.1782140857394;
        Mon, 22 Jun 2026 08:07:37 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466667881bfsm28515120f8f.22.2026.06.22.08.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:07:36 -0700 (PDT)
Date: Mon, 22 Jun 2026 15:17:34 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Enforce gotox targets against
 subprog bounds
Message-ID: <ajlSDq+bBo0I34ZK@mail.gmail.com>
References: <20260609-f01-02-gotox-bpf-next-v1-0-b441d63a1559@mails.tsinghua.edu.cn>
 <20260613-f01-02-gotox-bpf-next-v2-send-v2-0-ff980bc5a329@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613-f01-02-gotox-bpf-next-v2-send-v2-0-ff980bc5a329@mails.tsinghua.edu.cn>

On 26/06/13 05:33PM, Nuoqi Gui wrote:
> For gotox, CFG construction models the indirect-jump target set in
> insn_aux_data->jt, but do_check() later follows targets from the runtime
> PTR_TO_INSN register's own INSN_ARRAY map. If the same gotox can be
> reached with PTR_TO_INSN values from different maps, do_check() can accept
> a target outside the subprog that CFG allowed for the gotox instruction.
> 
> On x86, that can transfer control into another subprog without a matching
> BPF call frame and crash when the program is run.

Why only on x86?

> Fix this by rejecting gotox map targets outside the current gotox subprog.
> Add a regression test covering the two-map cross-subprog case.
> 
> Validation:
> 
>   unpatched bpf-next 7bfb93e3475b with the new selftest:
>     bpf_gotox/check-cross-subprog-gotox-target: FAIL
>     cross_subprog_gotox_prog_load: actual 23 != expected -22
>     __TEST_PROGS_RC__=1
> 
>   patched bpf-next 7bfb93e3475b + this series:
>     bpf_gotox/check-cross-subprog-gotox-target: OK
>     ./test_progs -t bpf_gotox/check-cross-subprog-gotox-target
>     Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
>     __TEST_PROGS_RC__=0

Why the second part mentions the call to ./test_progs, and the first doesn't?
Why the test result goes before the test run? Is this "Validation" section even required?

> v1 -> v2:
>   - Validate gotox runtime targets against the current subprog bounds instead
>     of scanning the CFG jump table.
>   - Fix the selftest expected error from -EACCES to -EINVAL.
> 
> v1:
>   https://lore.kernel.org/bpf/20260609-f01-02-gotox-bpf-next-v1-0-b441d63a1559@mails.tsinghua.edu.cn/
> 
> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> ---
> Nuoqi Gui (2):
>       bpf: Enforce gotox targets against subprog bounds
>       selftests/bpf: Add cross-subprog gotox target coverage
> 
>  kernel/bpf/verifier.c                              | 21 +++++++
>  tools/testing/selftests/bpf/prog_tests/bpf_gotox.c | 73 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
> ---
> base-commit: 7bfb93e3475be9de894f1cecd3a727d3e1649b03
> change-id: 20260613-f01-02-gotox-bpf-next-v2-send-8c48c9357dde
> 
> Best regards,
> --  
> Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
> 

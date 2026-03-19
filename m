Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A91126BF7
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 00:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773879314; cv=pass; b=iaBb2dghnKdvw0GMHzhom08OD7RGIbkLnUPgT3PA5wjnH1tR0uFc3f9Ii7P+R+5qI8EFeRJKwIlWO6hLZxEbsOJO3Vr1eevlvrYxMaoU+nzvbg+f1nxIa2KVV9nM9Pl9iOz5Xe1t643rokFrhc22G4PldXk5+yZEr15+c+w2J2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773879314; c=relaxed/simple;
	bh=epYQYqmeoxnhnwHsy24c76hvYzkY8TlUlbKYfVRPK/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA/RjIe9FhDBGK4XCY6PmK3hVUatRW6lFJsdaQq+AVXZVJSkAlzigfXlyP0EnemJIvKtprPtW69mP9D5VtLn3vCFElTeKh8rBhie6zg60wKWmX0BvhrGTEFmTnzt4lOcS2biyRljStcAZMAZxWjxqHwaKTksldGYR2JdE4uqVWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGAO19Lm; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGAO19Lm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b4121c40aso218649f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 17:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773879311; cv=none;
        d=google.com; s=arc-20240605;
        b=JGB6j5/Bjblxh1WzRAwRiey5E4KQKexvfNcZ+5SvrUqiVjb8wWYzgAnNogRSryEdE9
         TpFxNN385mJSCLInHm8w29kVFn1j67eOqFs7cqVs8WxR8s4o3brqOsZPd2LpcZLiVKf5
         kEH9snArvOCdhKFYryupcYc9IZ3CVoxuxwxZ+rfPB2v2CaQu9nJxiNH3+RWO27Swv5Ut
         Kg+tNwqkDZwlSccSucuSg0rc6dD9UahiGSKuoqQkd9GE89kSAXDtsh5vNPcEZMsLIWzn
         ptWuCzBsCS2tjUNUx+h0N68nByBLBimZJJhJB2YbwQipU1+oul0tCPCvhxIhghBTRGcC
         kGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fNm3pnF8KBRqftmVyJUTYbKuGaX4295I9FrzXBtq16o=;
        fh=A+OiLE5aB7yn63mOm0/Sz/DUot5SfCncsKlU36PRPCg=;
        b=FEBWiEtuR3c2Hfa56VPrHvL9xSetfn0GhRp5Quhnezcwnt1RbtaT/c6qIjnanGTj4b
         8DqNYeZvASMuVJ2Kg1GbCNS+o+II0+hOUm8fxK0QqieDF4Xx3uorFMT59OhM2BHG/9tS
         HF61POBshcQ4LQUxAA/cc5UhTrAxs5ihTThofKFqYINO6YBvojBeTGxFo258c9r8xUCM
         zuAvF1zgiOQzWN6Fppr0ve/Ps/vm2+jgZYX/8f0mC/6+/rYgfaXriRyskgDAQXiI5Gd8
         7wRzhEMqDjlFJ41bI92BVz2Ie6XceBZCcOWgrwRkkbVmh+zdc6MmOlRNiwA0/k3vXoUx
         wbwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773879311; x=1774484111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNm3pnF8KBRqftmVyJUTYbKuGaX4295I9FrzXBtq16o=;
        b=AGAO19LmCF/7aGXPG4tQesf0ArmFcLADinZIqretbvI5erEL2FHVwCTfZq2qQRLx41
         xOXR7iRf73ojAn6g+XcXL53uTFTc8VVsw3DBkgyMt2JyHvOwRQ6jxTFW+dsdbFJL0zK8
         K/PM0kYIUP8BoKCaZ8nT15GLl+QJnLGkUpdndW9tIQS4RjPca+99UKU1yzOZL9kWA0QR
         Hh0jIRQUfthxOxVzySkc5NaMvnSuzcx5JUkpeFxD44yGIT+iKEAo4PbKqeG1f22IcuQz
         T1BiZ2cf01QNz7q5Tu7IRBRgXvLcyFYlnXJhqyd2bU+c+6Xgm58lmP+NNWZfG1Ru40QN
         y7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773879311; x=1774484111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNm3pnF8KBRqftmVyJUTYbKuGaX4295I9FrzXBtq16o=;
        b=PvJFq2rvPGbMxMZ2B/DNLxauaA9o0riXN5wpKpWcVhF+uUYXPbBdDHQiLQMz6+ZKgU
         QJfRXoHjKV2oBgv4UhLkJ9lft1yYHRoyexLzqstHxtk5PTetQnuupAEjT7xQUSBwymx+
         2Zuc75+578Fr8p/gg/hsM151v4wcMvnuXmWHT5MMJ9hLvBuCFjf1/illZjeBEH+dYuIh
         +MfJMqTw/oN89JluV+BJX+UV8i0tFRtVlbLs3h2+auuZg7XMpAwnCnsAb/B3kx1bdxwu
         ORJlK+JvuuHYeSAjV6lLmr/5lwmV99ZLQPf7f10YC0440jp6Wfs26xzQEaHfKSMCpjyw
         kG8A==
X-Forwarded-Encrypted: i=1; AJvYcCVrKvOXV4W3KDG9SyGuoHQ8rW2EK7GHhMbt5s5OGhocUeWRRPaVbUk1tPlpTI3ebt/96IUyzjq3vZa2SRYIJ7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqrIiyoxa4K01HN1vNt/1SBf6V5xnayiQOwHPqSPet6BWruBhE
	PC2Z4aP0Qh12Qj9P9qNm7WsQnznBSZPeHrksrTfv1Vea62PxYpR/Ljr2s8kFYl6F9yA3sQdZAzY
	8ZisasByYlDlgcqnePjq2nx5Txk5Z3xY=
X-Gm-Gg: ATEYQzx2/dwM1usgkrrIPAwYZK/xxCIwFZsDGXHdNqAIWM8e3j9e74paRTilCJuIU5c
	xlBxrR2Bw4jSFFPho7qJCaoevZgzZZcUhOi3lPxq+OlvZ7yVkrbbI29AqnkRnoi2OU8j3r+cgkc
	76FruIlUPIvACzw4SemB/8LwbZVB1V/qsRBUnD9q3prtWvIhwvWr09DaLbrrx6mlxgf9gurR096
	o7sdEUE9xKDARsqlGtQipjryLe3WyUCQhrvsrR/6NogIYnLhOYOGKIZXSff3TO5Hza2P2N5tcLX
	vyKjUmmgxfuZzTaA/3HXk49roYr7oRz52PdanezNiWIEbu5X7y+O8lO0BcHwLTCINnJIqD+AHvg
	Ksp65f8jqcX8EZimOkCEqyZA5JITJDmiztTCS
X-Received: by 2002:a05:6000:40dd:b0:439:c510:f97a with SMTP id
 ffacd0b85a97d-43b527cc57fmr9256013f8f.48.1773879311405; Wed, 18 Mar 2026
 17:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260315054227.118344-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260315054227.118344-1-sun.jian.kdev@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Mar 2026 17:14:59 -0700
X-Gm-Features: AaiRm53LivEh_n___lgFy1oE-qeJGpxxOazJpETBsIzh61TvvbR0AF2zOXtjtSs
Message-ID: <CAADnVQ+j3BWFoTaQHDXxkp3ORTc0biQLf06uOYEX7tyhpc+tbA@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: trampoline_count: use dedicated target function
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 10:42=E2=80=AFPM Sun Jian <sun.jian.kdev@gmail.com>=
 wrote:
>
> trampoline_count fills all trampoline attachment slots for a single
> target function and verifies that one extra attach fails with -E2BIG.
>
> It currently targets bpf_modify_return_test, which is also used by
> modify_return and get_func_ip_test. When those tests run in parallel,
> they can contend for the same per-function trampoline quota and
> cause unexpected attach failures. This issue is currently masked by
> harness serialization.
>
> Add a dedicated bpf_trampoline_count_test target and switch
> trampoline_count to use it. This keeps the test semantics unchanged
> while isolating it from other modify_return-based selftests, so it no
> longer needs to run in serial mode. Remove the TODO comment as
> well.
>
> Tested:
>   ./test_progs -t trampoline_count -vv
>   ./test_progs -t modify_return -vv
>   ./test_progs -t get_func_ip_test -vv
>   ./test_progs -j$(nproc) -t trampoline_count -vv
>   ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test -vv
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  net/bpf/test_run.c                                        | 7 +++++++
>  tools/testing/selftests/bpf/prog_tests/trampoline_count.c | 3 +--
>  tools/testing/selftests/bpf/progs/test_trampoline_count.c | 6 +++---
>  3 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index 178c4738e63b..b41147a29f16 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -580,6 +580,12 @@ __bpf_kfunc int bpf_modify_return_test2(int a, int *=
b, short c, int d,
>         return a + *b + c + d + (long)e + f + g;
>  }
>
> +__bpf_kfunc int bpf_trampoline_count_test(int a, int *b)
> +{
> +       *b +=3D 1;
> +       return a + *b;
> +}

No. We're not adding test code to the kernel anymore.
That's what test_kmod is for.

pw-bot: cr

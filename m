Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3029475
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567909; cv=none; b=HqaUlicQe2RxOb1zl94r//0CoHEbkyY57Xh8n4qwZ8U7NDRkMPmDJ6HyKupX0YaqJen18aFpCNzxtY+6QrcFJfkfULeLq8szMaedyRwIBBMHb5Y6dF8X8DuYrVe3wQwjtD1QeeX9a5pdwbOK+Ah4W393qxx5Tv+0Z9icmhJhW9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567909; c=relaxed/simple;
	bh=J/9mAzxq/x64a9MmvZNMoVxvXmCzPr6XZTrSZChSmvA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YOnDQQOEDKb20k4T+6bmat5HRMhjURU8shUMAlMKPwBFuZGuOWCHj2qLPpAQ7zPMT8LnxIoJC1Kk6ntCYRvuHktIfMC3tpvND+cN+uA5R3mCBsqO3kmLqTRqGKb+kry44kAihw/DZ1iwzElkOKe25c9wqIasleOaWkqBvgkMazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vmz3mMmY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vmz3mMmY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38511175ad3so8517811a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784567905; x=1785172705; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Utao4Hvq5bT+gyJsbMuAG0Oh4DBF5Bnual8IlLo6Qic=;
        b=Vmz3mMmYcsmA8MCKGG8TOxCCbu+B6N20rDggKC1rG4XDj+m/soKKkJcXQfCov5CjpU
         dtnRocRbkV9gh7ASoBvXseEw8aRNFk6dxnLexOWONSTfJzPxixiHJvFj4nYxeDos9VCZ
         aFn0eOFb0uf5uXPnUf315uhqUahNg3NDk7Dz9+xVXle935ZstukrnTzrrIBY+4aBQatM
         cQCYmSm+CE6G0dEk79R4fGGyGA3iUFFJse4EusOGM6+1ld7JpmQ1rGxDlb1FBcl2jOvY
         EPAoO4UlT++FXjpX1X78jmT2FHr3obv+lY1l2lZCcMRV20dZuT366ZBn8qC6jxlDGmzy
         kkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567905; x=1785172705;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Utao4Hvq5bT+gyJsbMuAG0Oh4DBF5Bnual8IlLo6Qic=;
        b=izP/X2U2UYBIiOQ9QqOGpZhrcdXeD5dtxTpGJ9MutxDxrPgZtzJVhVwyV8+Ngz/CJX
         Xj49pt8QDlobvIlGMD7EKtvQiU4eCzW3zabyk8o3O/lcbP2UiyeIssj/SBtUAwR5L5Le
         wb5WAXOhJbHDDkF+fV4NbjS7mnjysL7Q0cjjGCqNdOFRssj9jNhfy0+RCrEbS24dhcZN
         61li1LWzyTo4qlnRlUxFNlq7JuHEKxcCvuzIMXhqPH+ZQXf/XQSoIuNSlQe2C0VOpKaI
         sVFyNsmLHNpYE7km4s4malUQmk11vsDAiiajT/vyUp1dwoHYWBYSwok0gaIlXSd+qX3/
         aO0g==
X-Forwarded-Encrypted: i=1; AHgh+RqLpraX8FRxfse88odBrT47qbWICvxvPygY47GhP4FrAbOjJXKh2HWGXJ3Y+YPI5L71UW8ZCWkTzK20UQEv0NI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZX9ddzqwX6g0IIiPyGOuGC01ZGwKvVJ68v7/qRYyc/JpALmjR
	HdDrxPI9BxmxX2PTA7FnK/1I7qT6mJOXfl/us4tZRmFx168pk2UhnmgN
X-Gm-Gg: AR+sD120Fx/yQZQO62nIJ4bj5WOKD36TpwIDrrAfnEDRRk8FaO1EQfGQHPdL1qSGMaC
	Ak8nuo7r9OjlDhc/LdfEQOGhEjCsPp8nEFX9n2Y1CpTCDOGQaW/eOLr2ydCdBHuPlnBP27DI5ka
	JPcpz9gRrM5rkYgqT8+doAW17UxRzahSjdxRP03V6mgiBMOKFoasEUs4z+76+0xEFAI/xaTtJ6t
	orcu+YBIc3VDiAcMdmQ8bmDYs3wVL4tE9J8hyvVHNp69mAam/PMUzh+xKufOoB/UP/TnmbNuTId
	rAxW1dqrNGhlubFZY/w6k6r3RdxRd8OPc5kTSaWVquE3JTnsJpPMoVh2QT2yPh+xwEG4J4HGf3B
	Y43u0Vqn3JhvkMZs+kbwxiu4GqDtozRjqK7rWq8jvIzpM6Ju/p/AREwahlMEBx4pZNmGAu533+T
	UihsOMLl9EoY3zqOg4gsPRFPnQeVT9HaULsETyR816
X-Received: by 2002:a17:90b:1f8d:b0:38d:c0f9:30be with SMTP id 98e67ed59e1d1-38e4b578797mr15140965a91.38.1784567904969;
        Mon, 20 Jul 2026 10:18:24 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92169cebsm98875a91.11.2026.07.20.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:18:24 -0700 (PDT)
Message-ID: <69deb2a02562e0ee9380adc0154888c03193fe30.camel@gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Cover stack frame number
 after scalar plus fp
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>,
 bpf@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Jul 2026 10:18:19 -0700
In-Reply-To: <f081c0dc908da30006f5c72f0654a723c171d0ca.1784563939.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1784563939.git.chenyy23@mails.tsinghua.edu.cn>
	 <f081c0dc908da30006f5c72f0654a723c171d0ca.1784563939.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-20 at 16:37 +0000, Yiyang Chen wrote:

...

> +++ b/tools/testing/selftests/bpf/prog_tests/verifier_basic_stack.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <test_progs.h>
> +
> +#include "cap_helpers.h"
> +#include "verifier_basic_stack.skel.h"
> +
> +void test_verifier_basic_stack(void)
> +{
> +	struct test_loader tester =3D {};
> +	__u64 old_caps;
> +	int err;
> +
> +	/* test_verifier tests are executed w/o CAP_SYS_ADMIN, do the same here=
 */
> +	err =3D cap_disable_effective(1ULL << CAP_SYS_ADMIN, &old_caps);
> +	if (err) {
> +		PRINT_FAIL("failed to drop CAP_SYS_ADMIN: %i, %s\n", err, strerror(-er=
r));

Why is this necessary? It should be possible to prepare a test case
demonstrating the bug w/o this change.

> +		return;
> +	}
> +
> +	test_loader__run_subtests(&tester, "verifier_basic_stack",
> +				=C2=A0 verifier_basic_stack__elf_bytes);
> +	test_loader_fini(&tester);
> +
> +	err =3D cap_enable_effective(old_caps, NULL);
> +	if (err)
> +		PRINT_FAIL("failed to restore CAP_SYS_ADMIN: %i, %s\n", err, strerror(=
-err));
> +}

...

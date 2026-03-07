Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0655E2882B6
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 00:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772844999; cv=pass; b=Y8y93NEMcyZz94yFLKp0yRcH4LlSXOxlGHDb8HZA8pUIYDvscO7X0aWNhsQQnwS6bYjWwAXCKIvdD04ZW2cbpItn5vL5fsW6xU+DTK+CM9vD2ea3PkbGRXwI5v5QPeWDpABLmN/x++iwNJ2fe7pywjkkbo4P9C8opy+kZ/aY1sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772844999; c=relaxed/simple;
	bh=+8GRz2caGy548arIAyzhC11nVwUrHyX0e2MeopJ2r7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrBdDgQO0wUGJTMbZrYqkIq+8O+h12sVh1CapScOjUYAOS47lFDR3mF4mUyjb4Tu+hYXFfocBX8Br430wOkTw4s57Q6npAD2/Lw7PaZvpKX4A0xuazNIGB7HqsWLiYL/usZsnc5zUfKoHj3Enlf3B4gz4N+ph+2VLVurCVPeNlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCYE6epZ; arc=pass smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCYE6epZ"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48375f10628so64655125e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 16:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772844996; cv=none;
        d=google.com; s=arc-20240605;
        b=fYMbMQHSXJnfZeXWkULa9ACo1iQz01Cpqc1QDqOwHbiXtWHHwp0RINnxQFeCTo8W0o
         5dzceWCHrLyVT5dW3lkUEB4cEg0wo4d2kDzCGs6djgshs2ElZ6hoFu47KgkXVXwbV1WX
         LwfZo4YFvz/6hB2622wqyWamw0Vuk32lKZugx7zVUTmk3tOSVkru9f0TLCOqf9A7l+UZ
         lDVxdQQch6BDH6Tq59y6I3j1T61to6bnmZhs1zU/XgBUGpbeAdKX0xbVrLSSQkd7jOty
         zQv8n2A4je55gWlUMFM21btPX+LR76wB/eH2/94WqC7E7C2kafwiSJg97U84LdDbr8lD
         iy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A/0/2al2xO9sbeA/Xr4TJ0UiGgGkfc9xsAxGMQTLP5U=;
        fh=vhrgprm6yT8/3/A8RKV5dWqrG3DqFFyRvLxufNNizqM=;
        b=hrOOuuFLYqodfbZBCyRGbAFHURzDuXnfFZ+E1qgeXZg+NdG7x2LCgnirjlJWChfTfm
         GVaktN0VDQOshmZmJ5d8HmeVhT0C08w5ycoAYpdgimdTf4vIzI/+vYndI4i3KCijKg8P
         FISPyL1qCRbRbXj46gj+IUGi3ElP2HFOC3HZmvjmmkc2YmjTWemg/uGcFyuQLIh7EZZt
         L+cfy9Ht1Lq5G4u1XSZfReFzceUMiVPU2ynRido+K8uodOP6njRZKJB2XyGtU0ehbYLD
         /+LqmsRsIEk9Vjiqxnar4DYnxEAyrHHbRjAszK4yIU/uBrJFYerRUToj5FCa3jPiYalK
         l+xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772844996; x=1773449796; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A/0/2al2xO9sbeA/Xr4TJ0UiGgGkfc9xsAxGMQTLP5U=;
        b=TCYE6epZt006TsJ7NGWGhgbUdfLup+rJ+gCbHfwBBENOpY0/AXdV65UU8VJUyRyBPg
         e8MrOt+Z8T9+X5sclmosigEfLX0YInQw4r1+0pLPx1RgyItyBPjqzvJNpgzbEiuUg63k
         /5yOPAb2URTOt/jmV0brTKHsArl70nBsClU2oXGgWSl4t7Pn3Xhh0XHCcejgn5csBhAB
         nWdTtEj8jaWbjyucPu2iRbKa9yaAPbqIjsCeMSugLIEw3Co6G1cGKR1i8H2nllqal9WX
         FzbMBJZ+5AaPlaw4XxZ8/g070VWNTxcmYYHexhLjJieIa5D7oE8Y4UlbO0yRLGYAJPr5
         bwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772844996; x=1773449796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/0/2al2xO9sbeA/Xr4TJ0UiGgGkfc9xsAxGMQTLP5U=;
        b=D2zPtmJZ9YkBBzlBLRTOHOIOFFXHw7+/0cidFQaEVvHVYvY+8z2Q8MehpR9Y/xubip
         tB0jSGQwHMCgIaxNqL69T1gXUs1312epBMgChDGx1dXVaCBzWdK6Z3WJqie+63fDpJDT
         VcgwLzUmDiqJN4zuIp5M0n4cnS37O6JY6MX9a5abHBJaC3HorOmKk9MRGEpSv8XZXfWJ
         rOZVcezVmmT8s2h9/8rMnNmTwDtWBSlCV+E8KIw1Blh4aTRhL+/xQJTi6Pci5YItVWHG
         B5BQ7VsxpwJVjxxm893hONT2uv/wAyK35Y9bi1DUDOOZCZOPibzMYAXQ+n5jtIZq5Rhj
         vjxg==
X-Forwarded-Encrypted: i=1; AJvYcCUUekLuHE47sNgnBSZNadtjx6nqEJcqeZ/9eCrbN3NO5PC2TonPX/KXTPW0OlQslMZK4ix0ibgOarzNqBcJyfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmslF8VbGsSr2usvhQmzm80yb1dGOQm9jcdAug9eOaeLuHTFA1
	az1orucBPBFoztYOsJH3krbe/wEqRWsyRyxEe2z8+SFF2MMso82DnC7JgP/1Tcl9uXOjYniGkhB
	mrBWHFYojelfGAo6rxiU20eERGmRaLIvnrCXA2lY=
X-Gm-Gg: ATEYQzw2ptnbG+KtB+LzToSTiBiiV+2epV56I63mzIyZDZPbofjDdGqm9cU9LkLTBR+
	zgPwiGpcuCIq9fD4Se8FzeERGBC2vzBr1jDuNKTtoo8zSolwZixVO0d66J43X3X4xALm07wtd0q
	1Y7aKODVFukBWcOEETrjdKrkqUjzbK5oXfpi4dH/2XQLhlO9tyn/MiONWjGWUp5SdFP/PDFoq/s
	XdnRcukXgS2dn4pZZDTWYzbybyyIH820bRkCH0n7aeXteHz5HXjf7gzIK3evKSDwU+USwaxsSOr
	sAPPcxycJkcCbBV2YTrJYQ05/jcw8OZGBKidg1+0ipCvf/m9tK8uwFH/qAI=
X-Received: by 2002:a05:600c:8b5b:b0:480:4ae2:def1 with SMTP id
 5b1f17b1804b1-485269305e5mr64022815e9.13.1772844996325; Fri, 06 Mar 2026
 16:56:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305084306.283983-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260305084306.283983-1-sun.jian.kdev@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 7 Mar 2026 01:55:59 +0100
X-Gm-Features: AaiRm51cFu-TADM5c_-toVdzeKsQa6GWl6bmDW6GmP601PRDzOkWubzzwpXTou4
Message-ID: <CAP01T74HhFM0NY+DR+d2+CoSZHDCOytubgFqutxNPAxh3+aTJg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: perf_link: avoid failures in
 concurrent mode
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Mar 2026 at 09:45, Sun Jian <sun.jian.kdev@gmail.com> wrote:
>
> perf_link creates a system-wide perf event pinned to CPU 0 (pid=-1, cpu=0)
> and also pins the test thread to CPU 0. Under concurrent selftests this
> can lead to cross-test interference and CPU 0 contention, making the test
> flaky.
>
> Create a per-task perf event instead (pid=0, cpu=-1) and drop CPU pinning
> from burn_cpu(). Use barrier() to prevent the burn loop from being
> optimized away. Drop the serial_ prefix so the test can run in parallel.
> Also remove the stale TODO comment.
>
> Tested:
>   ./test_progs -t perf_link -vv
>   ./test_progs -j$(nproc) -t perf_link -vv
>   for i in $(seq 1 50); do ./test_progs -j$(nproc) -t perf_link; done
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---

I tried reproducing the flakiness when removing serial_ prefix without
this patch for a while, but wasn't successful.
That said, the logic makes sense to me, the bit about burn_cpu() being
optimized away can be true, and I think it is an improvement.

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>  [...]

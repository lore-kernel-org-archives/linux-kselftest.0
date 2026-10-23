Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792789592;
	b=bceJKJ05q7ZuY2n98pLIxQdGGySj0Ru8CEzGE4X/QqhID+/6/d8hpFHVHn1MlSuoI+1s
	 o5ZQB3E6rYcGzhqmrkY851tClklMPva6jUpOSNweNrk5/ONVqLi1iOdp1ovvDFrhu/JH0
	 wHQP+KxhXuHV9e+ahnUUIC4nxIi/2hMVsycYinM9dav8v3TgDj3fUU30m2yeEVS1JyUy0
	 SeJk3ZWWXn0iKLjNc8EMayO4tKIbxPI/sxsltaX0ZjMzlt7BTzLslglOD62TwiD7Qs60H
	 /bKMrrd2wyt5OTrhvecCvXIOPJrbe//3IeR5qbtdct2t5n9sSQZi1xSgn9E/VVpmkLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792789592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
	b=myrCNm0vZ4eyAH/Dak+nPHqzvtjaJXTXIF+tKpaHQiYYf3eELHVzp+DiMET+GswlMm8N
	 mm38ASWya1N+Vf+9/Zm0ud/KMfmTyOZSKfwepBld3wgp8PeLMJP7ZrKQchodfRUX4cRBh
	 Zh/cD4j3fcHbt/LIacKt21BVn97QHvrkHWoEL7FS9uhMoxXJtBptf+GkV/mUBZ6nPVnqv
	 OmNsCTIs3bdN1NJ2rsftxmyBSgsKxCPpYXS9K9vLPqb2GK/vELFQD7cLMZgXqHV7N1u+S
	 p8qHO/3tAbWw4scoot+7DfXJFdb1ImnFohGElS6FW7Exs6M5IWAlinzaQxY9YsBjqWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LbTEuS7U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28422606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 21:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28422606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LbTEuS7U
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4b28d7c729fso764775b6e.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 14:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792789590; cv=none;
        d=google.com; s=arc-20260327;
        b=NIrW5uf5gowKeJM+OgosWpt4IEuoaGiVyNG7ltqd/ZF7B5x85x+yQ8FLv2BkVSVnV5
         LB6Ov401f5tZz7vIH0BFDhycDazgoj57TYGRhpaVRgAksxKM2SwfkkOQxkzAiPxXT27Q
         wRkIsrShd2H8JhnTLIsB2q0/b/auolfALQspyFti3E/19AAcMHbXYdB8nxnul4UpTe3h
         1Wxgy/JrnfcxvuLebbAk8HGnhgsBeby/W1JUEKsjhH7mxebEED5+nJpDa019jYmQgiqO
         8wvw83qR4AtId4LBTs37PKW5dIrS8EVf+DjK5KFI96oAk0tPBLc0z0GkvECJvxE0F9h2
         QY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
        fh=EbsrqL7T7ko1i9U3/4/wNvj+VSPecjLOux/yRxMQd7Q=;
        b=GG8gcvuKdLur4U2euzkgv3l21RLrVa1vnkBnZiPYZKr1h/aJcaPLYiF2SwlUZGn3ML
         Uxk332x0YKZJNPNUBaVX4EqPLnwk1KRi90/QVP78heQuN28bjcghW4smV0Ml3i01Xhwk
         2fI0POt8ds7WwHBjvzfL4Qno7/UmQb1m1Nb1hv4OogeYZ1xzEI7XNj/Vxp1+Tkwl06Ye
         yxL03mbdcLapbvzCrZrvd/z58j0aWA/uTC5vynPSOSCU7mny5ucIY2U0sTDdN9IihcAa
         WjciqGSRsnIYJZzru6+4nHMbZq2uSH08bxqIjrGm9avqeeZYN8MbLdn8Oh9Yj2eDs1pH
         Js4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792789590; x=1793394390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
        b=LbTEuS7Ux8e0j573K7MhU2vm79E8Zc5Vd0Oh3AE4CaPKJdlNISyhaBIfBt/OEA0rxK
         yKXIdkZQTz8Jhq9pOzh7yG2EIdEursa1+d+FQo9ycmAl6fS8s8djVJXQnrexZr/pJ8I9
         dPqPg9/sL2VjO45HMToYFi1qNIPCl9VqhlmoXSw/tEd9COrXiOk2svE66Gn+BAMAfoqM
         j9L0dmGksi7n1cNKSLka5bXT2ReWBxYBSwz5sdgNRP+6SXun4xlPuXLm7XIxsYBKmLq6
         ar4JVFIZNGHiK81sMw6ieF+Z/xI1PzWjbsxGoVsumIbd81i6ZIsQzag4d8M47mjJNtX7
         BUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792789590; x=1793394390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B81JhG5oBLgzvk4unoyO/Obs8jvRI83INB837bEDY/g=;
        b=1VpgMuqms+ay3kwelj5FdzDL9SK4CW4sCxjaxFQq8h5TwjVjKc61H6qQTeIKmgZos4
         wud+zgLV6ap8ggtxx0Ii2Pl7MPPtBtKd+qSfrfYVRQcrvRL5aR5UCznxbrcK4c9y4DPY
         R3jWKEaDk9Wpl1PSnvPqFQ93HCWE1GOzpteGXVqb98N25Tl3TnSOeOa0oNRB7/3MzVir
         dk2DtUeNgSkgGPfJvxJ9jlU4M6EleceMd5w/laG4flG+pIpRg0585cTSFrWV2owh2eZC
         Z8LGQNhbFFAWZovOnkHbs40usLf/LwoxJCSqFqUeirBVPzPAQkqdexylu5hpBfp30Lvd
         EDjg==
X-Forwarded-Encrypted: i=1; AKwUvBywMqpoRr0+w1WW2pSQh3evPWqYXiRx3lFn+Wj4UpF6DA54VicHS5AS3OL24bI3v8AN8rL29kbRiGgBhrCIuPc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmZzhYDDqLixTqR4m7kyC7enaqR8D+o146qVOEpvWSkSnM39+l
	n59l0olcp83cDlL/5s3bPuda1tn3xJ+90lwanXstJ8jjhv4DKJiKIjaRk1lnNRlC59STEjVAzwL
	LnaqNxYRKhahpCBM9awZs18TT84Lsnrs=
X-Gm-Gg: AYBFou0gpRu7zJxklrBgKs/vuvQaDNjC6nN0lJKI7cPlSXAFXVQU6yK876TMB6BQJis
	F0g3qUOqPKdU1k1pbcQaxC30s2NUKOvFLwL10uIgYd1IYjswn4op9JZ20SXAAhrc7axd6XJqjx9
	fg/ClBAiEDXeKQRAOnfZdupJ/GDNQN1MiaqFglxR4crihUm9A7vEEwT9S5nNu1QjPAKs8SmKaTj
	uiLLbwym9bRm/ffNthsjSPrGEBn3gKRNFPlLzOpJmPSAlz/c5JpalHLHw7U/CmJjM/8pSgWg++w
	rEYydrynf14uqWNqPZ0QrVLLXe6UTvq5uDe7v1VC4wmeg3Jhw3YsSMGXSwGV61wGDeeP2GMWadu
	yM/USpbgf/hpl8CE+vR31S9b153CwighR0caq
X-Received: by 2002:a05:6808:11d0:b0:4f2:6f1a:a34a with SMTP id
 5614622812f47-55c00261ddcmr323202b6e.12.1792789590065; Fri, 23 Oct 2026
 14:06:30 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
In-Reply-To: <20261022-selftests-bpf-struct-ops-assoc-timer-v6-0-2c0f18e82582@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 23 Oct 2026 14:06:17 -0700
X-Gm-Features: AclHuK9TRgslO5apNkTHDd2WGpGoCt37hFcjtmqCOM6wGIxqCzpcyynr5JgcoDw
Message-ID: <CAMB2axOYfDT4HiaWvjJwcBvsXsUL944scQNZjMAPAgJchG26ew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 0/4] bpf: Fix a struct_ops use-after-free
 behind a flaky assoc_in_timer test
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 1:48=E2=80=AFAM Qiliang Yuan <odys.yuan@gmail.com> =
wrote:
>
> st_ops_assoc_in_timer_no_uref drops every reference to a struct_ops map
> and expects a timer callback of its prog, 500ms later, to find no
> struct_ops associated anymore. It fails now and then while test_progs
> runs other tests in parallel.
>
> Since commit 5db69b0fbdc8 ("bpf: Make struct_ops tasks_rcu grace period
> optional"), a struct_ops map clears the association only after the RCU
> grace period of bpf_map_put(), so nothing waits for a prog that reads
> the association in between. A timer callback can then return into a
> freed trampoline, and the kernel hits an int3 Oops.
>
> Patch 1 lets the association be cleared in any context, and patch 2
> clears it in map_free_pre_rcu(), so that the grace period bpf_map_put()
> already waits for follows it. Patch 3 adds a test that catches a map
> freed under a running .test_1. Patch 4 has the timer callback of
> st_ops_assoc_in_timer_no_uref retry until the association is gone.
>
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> V5 -> V6:
> - Rebase onto current bpf-next
>
> V4 -> V5:
> - Drop the free_after_rcu_gp of struct_ops maps, which is dead now, and
>   update the comment of free_after_mult_rcu_gp in struct bpf_struct_ops
>   (Alexei)
> - Also stop the tests when associating syscall_prog fails (Sashiko)
>
> V3 -> V4:
> - Clear the association in map_free_pre_rcu() instead of deferring the
>   free of the map (Amery Hung)
> - Add patch 1, replacing st_ops_assoc_mutex with a spinlock, since
>   map_free_pre_rcu() may run in softirq
> - Stop st_ops_assoc_in_timer_free and _no_uref when running syscall_prog
>   fails, instead of waiting for the timer forever (Sashiko)
> - Point Fixes of patch 4 at 0e841d19263ab, which added the test, as the
>   delay left after patch 2 comes from freeing syscall_prog
>
> V2 -> V3:
> - Wait for an RCU tasks trace grace period in patch 1 for every map, so
>   that progs reading the association under RCU tasks trace, e.g. from a
>   bpf_wq callback, are waited for too (CI bot)
>
> V1 -> V2:
> - Add patch 1, fixing the use-after-free behind the flaky test (CI bot)
> - Add patch 2, a test for the use-after-free
> - Point Fixes of patch 3 at 5db69b0fbdc8 (CI bot)
> - Move the restarting of the timer into patch 2, which needs it too,
>   so patch 3 only turns it on for st_ops_assoc_in_timer_no_uref
> - Rebase onto current bpf-next
>
> v5: https://lore.kernel.org/r/20261019-selftests-bpf-struct-ops-assoc-tim=
er-v5-0-77b2e181e5cc@gmail.com
> v4: https://lore.kernel.org/r/20261016-selftests-bpf-struct-ops-assoc-tim=
er-v4-0-9ad31c21220c@gmail.com
> v3: https://lore.kernel.org/r/20261015-selftests-bpf-struct-ops-assoc-tim=
er-v3-0-efe643d4b2a3@gmail.com
> v2: https://lore.kernel.org/r/20261010-selftests-bpf-struct-ops-assoc-tim=
er-v2-0-d7a43896dbf1@gmail.com
> v1: https://lore.kernel.org/r/20261009-selftests-bpf-struct-ops-assoc-tim=
er-v1-1-9a97a9b3d1db@gmail.com
>
> ---
> Qiliang Yuan (4):
>       bpf: Protect the struct_ops association with a spinlock
>       bpf: Dissociate struct_ops progs before the grace period of the map
>       selftests/bpf: Test freeing a struct_ops map under a running prog
>       selftests/bpf: Wait for the struct_ops map to be freed in assoc_in_=
timer
>

For the set

Reviewed-by: Amery Hung <ameryhung@gmail.com>

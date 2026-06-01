Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D511815FA81
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 00:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780273405; cv=pass; b=hMrFSdnOjTH2Z/uaHY2fj24jGyt/tddsYEXlILm4/WKd2xrHIqD1IIDrAaXa3gOPMRuFAJpQKbr3++c9KbBgi0RiQ7q6mTYDgbMBrf6dq1t4NP/Zt92ZPV7krTHu8GN+b1brtfLdEVHRyFST6YQhI2vDe7oIcBn2XWD9bNtsScw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780273405; c=relaxed/simple;
	bh=sYJGqCY2z1jRki5HVPZjaFUE77i6R5Gi79ziWhZkJBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=er/3JYTWJxJz6agsTMPO518BoaqLvn31pylWzCZ8hIYN6VcJVPjcoQa199TBw9S+biJhe8B6DJZqrSR+07pF7AOHk4woFLVItlPb6blPGtD3zAz4QGVJzp5NX5hS1nq7DUnLLalSHf/u+Rs8agBVBvNDV71yJSYhvUIn8rxkAy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APyijzTl; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APyijzTl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac357c55so595955e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 17:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780273402; cv=none;
        d=google.com; s=arc-20240605;
        b=j1FTqz977FWiJLnCFt0UPblKxLhcU8kMeq4lwl2QkOYQRgcBYPsA0pt4YMq21aFB/X
         L6UmMRxzikPNZW87N/M/Y07QFKaZOI8ukpI66fRIBc2cuSbB7WKmDpLPzjUu7+WgItG7
         AYVUq/UHcXz0mOzSeQvdfIK4xkM4nbGgvvxNtP3A2x1aFTpGtjePT/xdq2GJcBlywRam
         vyPiuxS8U6RqDMAV8485dTmXxiFVwgh/G5//xmEX4IUQdvrm1D6xqrE5ozzCwqbx37X1
         6naImGMs/vylYDHGykSTRuY3Nk6/TJ6U4ggpvvXzBLtaZErB/hnEJ+lELW3MorV6PIQw
         bfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ra7a2d/i+ASGSsCMx5Le91H48egY+9qIP5vS7Kj0AVE=;
        fh=V1MxQJ/5jNBIcYU/lxLxyJoYbKpWiOcsaa6rgOXsgaU=;
        b=cRXdK1OjeSiV2UYLtI4BrBpT0fRvN4d/oM/3qSo8Spml1SCsaAl2Reua3gYtaRBxYO
         VpXMPMmzur+k07pQNlfTt1avpj3r206FCnA0/dQECW+nC/INHC8VowspJipFYqXzoz9X
         pe5P8h4uBJTcyzzCzKF9Z9T4totn1o0/8BSzLhEXomSyu9KCeeIB2MrrRMAGk8Op8sc0
         9jXbvC6Sjn1egGjawzqC7I+BM641vUG2EbELoyjCG7a0WbTo7oVTZqaH7UjJC701TL9f
         MSwWICBvniCqg48Us6iOnvQpoLeRQKbahBCmyYLDSwB27j0hsiC8oZRM/yfhWm2RvlEX
         ZaMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780273402; x=1780878202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra7a2d/i+ASGSsCMx5Le91H48egY+9qIP5vS7Kj0AVE=;
        b=APyijzTlVNnwJfygRtElglo7BpSPfEQcJEpcDyKgbUF5b2QwUeBtPk119YyrDZwRU3
         pSzW5uMG+Ut5Yhn2Ki//Uoy6NpQbVqIv5+dDGkFS130HOMFqT23UAHHjPWu+fbXifnyb
         coSLbqKCHI8PWhknWgcyNQHK8kWjRE8NPBmJgdQUPpktv3ja02ypZ7qIIrNnxPhv1jNZ
         N2jZfHSFZdTCPNuw4sWyG5H/oxJK3e393wTMExpNnHVlZ/qQwYylaOXjwRVptjsUM5wW
         vVOrFdKEBT7M7Eq5FNXTfEKdA7ztw1bsxna741VlAE6Bf18hO1kn9Inr4KmBeg4zKXMM
         mu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780273402; x=1780878202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ra7a2d/i+ASGSsCMx5Le91H48egY+9qIP5vS7Kj0AVE=;
        b=IhWt4kDbHTp/BgNqIpgPLmaPMs5i+c1qf2V1SKH2bMCTj+kHIyg6DSWn1Ix4xnyutg
         TDjGt8uUi3YBwDnH5686ANyg0Lw/9FFsfiwnQtrK4BlOgftjyLcNVxY6RWsQdguthf6u
         8Y40XrO3eoF4cAIXW4XRKLqJcXzCEp5I7npXdd9Xrj9a/YneNpVVO0kmkfSh6asX9aC5
         z8YRIZWOgyDQUWg9kDrN99fSBUZaQhLWxHJkWACv4clRgGIWwktDu98LjJbplKJDxmTz
         qHQDApSCgb5R2An9voUdyO/24bWCsnbIA0fr0huyGm2X+lVB4jW4CISXvfzhO3UDHEZH
         p15A==
X-Forwarded-Encrypted: i=1; AFNElJ+/V67Pp+b2owAt9uL44ZPjQnyNX1tIPtosC7l/g2Zwpu6K0iSZGIYQr88y3Wvbg0narY5lRy+7xKl44ECZFaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6a3uc+od/Re2wL3yJeFBBDclUDJbrcfNZkFPljV0BQlcAc5LS
	RbvPu+s0/f0YgBE+wj4s2H9ukWM48mDOqkjEH4/D8Zm+OfKQCkTBVqFi37JpU+u/7hQIMjFazoD
	Fhngy+fRULCVix35729hgeDNCAZKzjWU=
X-Gm-Gg: Acq92OGbBuAZV1AZ9vSnDhk0KxpIHVk4QiIZg6z9hfHLxfuTdwwHjyho5sqmpY3qAvO
	V6S+f8GzdmYennO1Yi/AcgqN4EDNj7NrhaTObJDFKHShUXBvTWUmjULgg+GWEwXqgv0026fRe3O
	e48jj0wV9/tHHhFZ3ISEbRtUbqTBOoFmKKBAksFr/bE10alxitTaNA8fuEW4nN7f+Zrzfn10K95
	BNL14GsytTuIaYVrTlqf9ZfIQELC806CFeF17MzMcCHhiT3X9xDIglXD+ypyi7oVZ35CK8Flo+0
	7WhU5HgsJe+en27XXzeAKGcctwbOWmpZ30Jz65VFJk6U1cH8sRwv+fplpVClzVvJEFBZp8S6+h0
	Qy4va
X-Received: by 2002:a05:600c:6286:b0:490:5cd8:d21c with SMTP id
 5b1f17b1804b1-490a3186815mr132223235e9.14.1780273401788; Sun, 31 May 2026
 17:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531135234.233421-1-random6.xyz@gmail.com>
In-Reply-To: <20260531135234.233421-1-random6.xyz@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 31 May 2026 17:23:10 -0700
X-Gm-Features: AVHnY4Kyklf5qbLcFshD1W6G12xBUd3hYYa8SPL6RtYRoqeGVhCgM4waSIbWQM4
Message-ID: <CAADnVQ+1QNO3rGJi4LbbURXw1HfxXh-Z_d6bejvKFHauQa2COw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Add arena invalid node id test
To: Woojin Ji <random6.xyz@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Puranjay Mohan <puranjay@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 6:52=E2=80=AFAM Woojin Ji <random6.xyz@gmail.com> w=
rote:
>
> Commit 2845989f2eba ("bpf: Validate node_id in arena_alloc_pages()")
> added validation for invalid or offline NUMA node ids in
> arena_alloc_pages(), but there is no selftest covering invalid node id
> allocation failure.
>
> Add a verifier_arena test that calls bpf_arena_alloc_pages() with an
> invalid node id and checks that allocation fails.
>
> Tested with:
>   ./test_progs -t verifier_arena/alloc_pages_invalid_node
>
> Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
> ---
>  .../testing/selftests/bpf/progs/verifier_arena.c  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/verifier_arena.c b/tools/t=
esting/selftests/bpf/progs/verifier_arena.c
> index 62e282f4448a..91aa0941ded2 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_arena.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_arena.c
> @@ -11,6 +11,7 @@
>  #include "bpf_arena_common.h"
>
>  #define private(name) SEC(".bss." #name) __hidden __attribute__((aligned=
(8)))
> +#define INVALID_NODE_ID 0x7fffffff
>
>  struct {
>         __uint(type, BPF_MAP_TYPE_ARENA);
> @@ -199,6 +200,20 @@ int basic_alloc3(void *ctx)
>         return 0;
>  }
>
> +SEC("syscall")
> +__success __retval(0)
> +int alloc_pages_invalid_node(void *ctx)
> +{
> +#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
> +       void __arena *page;
> +
> +       page =3D bpf_arena_alloc_pages(&arena, NULL, 1, INVALID_NODE_ID, =
0);
> +       if (page)
> +               return 1;
> +#endif
> +       return 0;

I don't think we need a selftest for every little fix.
This will take more CI time for things that are unlikely to break.

pw-bot: cr

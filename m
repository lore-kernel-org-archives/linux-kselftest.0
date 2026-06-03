Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669F3D5668
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501653; cv=none; b=YjPJXKuQ5h40CRpaj8QmD6Wx1IzOg4YHHbOyjR9mZVX4l17N9GZAUdNiTV28UWY01apKHC1UBXTbG8McbQ3VE+f6DawYTGoETvVexlIQ3cKtcK8aHJ6OTi0dfPz+xmjnJJNNMUfiJxGVF5lzC0C0JYyuap8lNffd090yiXtk1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501653; c=relaxed/simple;
	bh=IcpSSUCKBGQUSdE+H5gN8j3wYQNF9Y2ULFOr0fIfha8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rtk32h4vC5BFq9f6NcDRpNvx6Yqf14w+7V63AeevS2bmTUK3GlAGR1nXj3JLUH9qWZZRCdP+bcAH+G3aHh7RpdiRFwWhN7KzsVHH+t1rnG/gf+5ZzpfAoh0lGnNP4/UAhcHPG6oPSKZOeX2jhojYK+8RI2uUWQZ9AKx3Y5cNAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=yIvvwYP2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="yIvvwYP2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so4974705ad.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780501649; x=1781106449; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3a2aniZHfh0TzPY/t367ZwwfKRhGahNfob+QbDNifc=;
        b=yIvvwYP2Z66ImHERprbpDesD1oTMBkHMd7H/16XWSG4cXtr84LH+fErGI4Fw0SBnX+
         QxSxZvkn0XpOblgd64VbsiL8+sDcKJNHVhfzkRjyxkBF7DNlT7Lkg4mbmANsUCy4syVG
         nGHaMCaSI2KZkpDy1xfKFOCRZ6UbSEydjFPhiEcDVYcmzi3VO6InFVUp8yT0UteHvxXD
         mqIfi45CqCBXMjIynLLOUqxpr1LzUpnfN8DqKwllzFU1c9KVbf41w1KDw67z7HAy0qAd
         NXHmX19/RH5ebNNxMY/EZfYiZELCai8mY1V4kGfQ1oI1zmpkgvz0bjwlmNFWweoKYhlo
         tgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501649; x=1781106449;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3a2aniZHfh0TzPY/t367ZwwfKRhGahNfob+QbDNifc=;
        b=gXZCZT5fG0NqVbDOkFVmOA8R/uMQ6Ej0mTMU9QHMiNJu2CrSw+Ilb093dlH2uclMNu
         Wqn4Ue7AEq4YAkr9Wl/DBhHuhtioPGxy3cmwJsA/tPuNWRsbSl32lPuqQeYL3vBV/ZJt
         rz2ieBZE9dlBhY9PQJ4eavYaIl0Mmv3BcxAun4wxI8wWQ+5Mtp6N08IoVYFIw01GcpRq
         wGm+ym9//BefOFBI6+N7EPyF2Gt9Utv/bByKejx3fBOWMf5dG9RKn4zxr+GZHY5AwC1V
         kZ56I8v1+eSAqhbdWyGhypdW6QMrzL8Pu64VYIUa5j8I7rgaHdI8TZfHzqOE4E/CKD5I
         +d5w==
X-Forwarded-Encrypted: i=1; AFNElJ9sM0h1hx6taVHfs2EWr41W9J3A7cxvJm7dCKuc5Q+SZsMDf6P9cdXzRy0ax+X4U3utFS9GwoIVRgwtycUt0LI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1e+7IkiRzrB/71xjORrnyBu1HOSLeGBBfNsu8ExiK2/yBQNkw
	oE88a/+J3+WEizzYj58JkK5zURJHZVMth7rKDa7v1X5wgGphYga0Rn8Bo6xqCd+JmSE=
X-Gm-Gg: Acq92OEwkDnj54V8IS5EHdwNy95QSsv5wgZtmMEbDlH74j2xESoGBrnlOrczhtk7jVU
	GUZEt5hC4nKAxXazSlt5tToT0fedxYs2EZiduafqm49ySf370Fc/hAqnCcO8d7IZm7P6AlcniFe
	KFGhbIEyBoGHEre+3jVtJEf9s37dsgtz6yQ0Q7rGlnFUxsbQ602W+S6a1/GYsOA26tF6rNPQaIl
	tTd1ARczNZyE/47VIzE2c3qrYMWty8Jl8btQLOHHYhCuJtEBCf4gdwjduFdUivzFlaIW6cQ5td7
	u8qrBkmvEDzX2KcYs7g4w50CXAqh9sgHD7EXk33+cQiXXKVo0DAT7891S/8qkR0MpHmQz8ojv9b
	Von/DvswMQUNp/ASjmSNn5YMfJd5qcv2+ePev00qYBtr569OInW4q0kDzkrRxa8/+BghRXNpmyf
	xzoXCPXDsx+i7OcmlAaDCPYqhrnvFoLcFCgVM=
X-Received: by 2002:a17:903:37ce:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1646eaeacmr32703955ad.10.1780501649327;
        Wed, 03 Jun 2026 08:47:29 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f84335sm29666995ad.19.2026.06.03.08.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 08:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 11:47:27 -0400
Message-Id: <DIZJ5P33U6YT.14OWBKG3T9LVD@etsalapatis.com>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Add arena direct-value
 one-past-end reject test
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Woojin Ji" <random6.xyz@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Alexei
 Starovoitov" <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-arena-direct-value-v1-v1-1-7b31cc0a8cac@gmail.com>
In-Reply-To: <20260603-arena-direct-value-v1-v1-1-7b31cc0a8cac@gmail.com>

On Wed Jun 3, 2026 at 8:09 AM EDT, Woojin Ji wrote:
> BPF_MAP_TYPE_ARENA supports direct-value pseudo loads, but unlike array
> maps its map value_size is zero and the valid direct-value range is the
> arena mmap size, max_entries * PAGE_SIZE.
>
> Commit 3ac1a467e376 ("bpf: Fix off-by-one boundary validation in arena
> direct-value access") fixed arena_map_direct_value_addr() to reject an
> offset exactly at the end of the arena mapping. Add a regression test
> that loads a BPF_PSEUDO_MAP_VALUE with off =3D=3D arena_size and verifies
> that the verifier rejects it with the expected offset in the log.
>
> Unlike __arena global relocation, where insn[1].imm depends on
> compiler/layout, this raw instruction directly drives
> map_direct_value_addr(map, &addr, off) with off =3D=3D arena_size, so the
> boundary check is exercised directly.
>
> Assisted-by: ChatGPT:gpt-5.5
> Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
> ---

Makes sense to add this, but I don't see why this isn't a single test
program in verifier_arena.c and requires a whole new userspace test.

> Tested with a reduced test_progs runner because the local source/output
> combination has unrelated build failures in progs/bpf_cubic.c and
> test_kmods/bpf_testmod.ko, so the stock full test_progs binary is not
> produced.
>
> Before fix, on host Arch kernel 7.0.10-arch1-1:
>   arena_direct_value/one_past_end: FAIL, prog_load returned fd 5
>
> After fix, on QEMU guest 7.1.0-rc6-00063-gba3e43a9e601:
>   #1/1     arena_direct_value/one_past_end:OK
>   #1       arena_direct_value:OK
>   Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
> ---
>  .../selftests/bpf/prog_tests/arena_direct_value.c  | 73 ++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c =
b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
> new file mode 100644
> index 000000000000..b7760b021670
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <test_progs.h>
> +#include <bpf/bpf.h>
> +#include <errno.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +#define ARENA_PAGES 32
> +
> +static void test_arena_direct_value_one_past_end(void)
> +{
> +	char log_buf[16384] =3D {}, expected[128];
> +	__u32 arena_sz =3D ARENA_PAGES * getpagesize();
> +	struct bpf_insn insns[] =3D {
> +		BPF_LD_IMM64_RAW(BPF_REG_1, BPF_PSEUDO_MAP_VALUE, 0),
> +		BPF_MOV64_IMM(BPF_REG_0, 0),
> +		BPF_EXIT_INSN(),
> +	};
> +	LIBBPF_OPTS(bpf_map_create_opts, map_opts);
> +	LIBBPF_OPTS(bpf_prog_load_opts, prog_opts);
> +	void *arena =3D MAP_FAILED;
> +	int map_fd, prog_fd;
> +
> +	map_opts.map_flags =3D BPF_F_MMAPABLE;
> +	prog_opts.log_buf =3D log_buf;
> +	prog_opts.log_size =3D sizeof(log_buf);
> +	prog_opts.log_level =3D 1;
> +
> +	map_fd =3D bpf_map_create(BPF_MAP_TYPE_ARENA, "arena_direct_value",
> +				0, 0, ARENA_PAGES, &map_opts);
> +	if (map_fd < 0) {
> +		if (errno =3D=3D EOPNOTSUPP || errno =3D=3D EINVAL) {
> +			test__skip();
> +			return;
> +		}
> +		ASSERT_GE(map_fd, 0, "bpf_map_create");
> +		return;
> +	}
> +
> +	arena =3D mmap(NULL, arena_sz, PROT_READ | PROT_WRITE, MAP_SHARED, map_=
fd, 0);
> +	if (!ASSERT_NEQ(arena, MAP_FAILED, "arena_mmap"))
> +		goto cleanup;
> +
> +	insns[0].imm =3D map_fd;
> +	insns[1].imm =3D arena_sz;
> +
> +	prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT,
> +				"arena_direct_value", "GPL", insns,
> +				ARRAY_SIZE(insns), &prog_opts);
> +	if (!ASSERT_LT(prog_fd, 0, "prog_load")) {
> +		if (prog_fd >=3D 0)
> +			close(prog_fd);
> +		prog_fd =3D -1;
> +		goto cleanup;
> +	}
> +
> +	snprintf(expected, sizeof(expected),
> +		 "invalid access to map value pointer, value_size=3D0 off=3D%u",
> +		 arena_sz);
> +	ASSERT_HAS_SUBSTR(log_buf, expected, "verifier_log");
> +
> +cleanup:
> +	if (arena !=3D MAP_FAILED)
> +		munmap(arena, arena_sz);
> +	close(map_fd);
> +}
> +
> +void test_arena_direct_value(void)
> +{
> +	if (test__start_subtest("one_past_end"))
> +		test_arena_direct_value_one_past_end();
> +}
>
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-arena-direct-value-v1-ef4df857b98b
>
> Best regards,
> -- =20
> Woojin Ji <random6.xyz@gmail.com>


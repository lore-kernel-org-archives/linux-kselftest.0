Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61009372B37
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772216303; cv=pass; b=LU9/KYUsUC+evaNrVbsjf34SUvMJhQAVXxeDunTLZNBGLKLy2dfdPMDhE8HrUfRd+tyxx6bSW8jvkQzfM4IMQtY/98USiLIHG6JdDpGbwGGhMzOWmqOPJ/6OG++trPYhzlsCggVk8uqyVv2mfMxyQ2IH6MFCvO/WM1iaDPDoT28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772216303; c=relaxed/simple;
	bh=go9pLsoIXwHeWsSg2SF7qlsw3Et1NlKlu6WwpsdWHTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLOuA3WUpnh/ASshmX7mdYtvyuy42m5d4WZy0prjWAhgDBDsSQtUzVZFBx3VWsGlEWSg7vVfjY/3A4VSk7WCeBfHHgAOl96XnUhEi8NZI/BvT/Sy/CRDr2gEIAmGZlFVpmzHw2bxDAD9NAZ1Tungt7VhTIRiN5ULQgWRpvmOQGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbU1E1A2; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbU1E1A2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43638a33157so2129200f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Feb 2026 10:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772216301; cv=none;
        d=google.com; s=arc-20240605;
        b=YzGnVOYYxGD7c2OWZWApdRwIeew/RenFw6iXB4gmacx1mKc0PVMAcVpR2AoXeZjs9D
         BJDDXQwEA/ggw3ikF9cOvaI81UYzMzGVLMYjcoYc7Hm7G5azbwMsGCVqc487tkomHBHn
         Iw4AGmZX41iuSZxVmvFnFtIgm4N5d24DcQ/wLSmD3DNRc/4OoPCyaJrqkSc6SKe1bIqg
         bW8eI8lxcLT349G8qc0pPch9J2FfC5EqyRh640UVCipaGlHuauBMd4SLSAJ0Vo3y5mm9
         0DJJ9BkN17/4mFHKoEBU2yRiBC0R07QhyRppxNLIDeZGtmMwlkpe1ZfcKisTM0l/Wn/k
         a5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMNuhM7y4Z7hySCCP9bwoDUIKI63MvNsZrVoSU50SCE=;
        fh=PpM+TpND34yXz1pK/CqLG3i2RUd+nIotuKt1Xn7NMsM=;
        b=T6MripPcMqF98kVMj4m71BkURpNutDMLtsP8mymbEBufZkL1IByY9H7qn0kQgxzJRE
         /blyM/S5ovQLRd5zDXzffu80AWY04vu26+6phX4vKVzWfHJ5S2f8Gi11+SxDUs+V3/qV
         t2GajH7JJEvSeM19ErvFLCivp3UHpb1THcYj+s0IdTJz8t0vkH9wKuvljiELlnnI1LF6
         OmxiCbIf9cNcipOBgCSnKs0RayPOCy212Lhe3auWQzIBro3br+z2SimYHBUlPhGaQ4PQ
         1SAPW6GcJn2wx378hP21yqLGtcOV9FvlbFWyrumrUQJ/iX4cfyKCb3wDhBZeP4QP6srD
         weXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772216301; x=1772821101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMNuhM7y4Z7hySCCP9bwoDUIKI63MvNsZrVoSU50SCE=;
        b=bbU1E1A23P/oST1tC/htWbZ4WoQ+mus/9Gk8oyyXehy5IZm3ouYVjeMM6J7bkZ5xqF
         nrZvddteNx1LlNmd/sNGBaCf/H4cXtLKsXJKCE6kWxphmaYRQxkMreFJYcLlR0PEGFIM
         xfwWzTZDkts1OdCjFT04/OCJUcF5wZJthcsEY11KA/NR+1fdjucAOlwUiNtz64xdOqAj
         KQ6gwatR4fOVwz7IeOPUf81sVVwSuGOg9ZtPSLzFX/bAFkZ+HO6nFbT83A8VgJjbho9o
         n1zfWllg7EqzoE2zngHTn9vp6vBzbSBVx+L111TJl0zgmiPehJqRhkT3IrN9oKfQS6dX
         cIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772216301; x=1772821101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMNuhM7y4Z7hySCCP9bwoDUIKI63MvNsZrVoSU50SCE=;
        b=lhmvlB1GA7V5oJFtlj7PsHacH5QakBCrKsWf2p/dTNNExg2XqqHXf3MF8TxOrj9j6L
         y3abqi4FL5x55OPU9iInhcUOp76EAg2Es6wMEoUYzOObuCQfcBAHFQgDBeHO1fReseQL
         Mb+N7t0AjBD8mL5yObMB8zy/K9B2VKV0sMbNbu9LKOUzbNBARqhKx1FGOb25pcS+aMlI
         lAa7rfKDrQ1TbibYhx3gS4bWtSm9dI34CkVYgS9zgURa5d+Qu0htKAjSG4aFnetJrNPP
         xtSv2syjIgMbuSs3yuKrzUGPWDGy/mXtyHx2Wi90ifQR63k7aRAvRSV92kPBnSMS6L7x
         kJgg==
X-Forwarded-Encrypted: i=1; AJvYcCV0/6on/2Hbk3EPaJRTaeC6AEMMn5d82foMDr3salVmlmdvW3mf/f91ZQNXsEQcfTRwSHuc5Iv0ahqkZ2iUqWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqzOaVfmpn38dJdH6TYvre/oX+EUUbW93P5AV5CD7xkf0xU47r
	MUa+TTd+uryaSge4uly4yHpVvUBYx8qxgX5G5oIYbumFgWhqdM73YlolOZWvTZqmCRmVbi3zsAV
	OgzK+BtzK8LJqv4iUr22y1TW2k2wYA7M=
X-Gm-Gg: ATEYQzwX2d8Kuc+5NFtDNQwdqWgeFw9+5HfW2dGilh988Samfg/2C8xN7064Q+sYGs2
	60b4X4irhxPs28DexAnQgNBAPg3OCL9GfQAsXzFa58ky0h0g3dB1+IscgAwck2Pp6wRNt00EUlI
	65tLXL1EUg4dGiteEkqECW8peBIYVYGRtOsBu91dbEym2iHnIHlf21wbIMQ5vhPofwNQWjCzXvp
	6nPoLNeqXuuaa1h2O7vhKqYCSCsaCz5CQDTCmsd1hUmLIw445uQh998Fkb1bN71F1Gu3LSzVRyr
	ZVwCviSt9Lv62mn7BoNQN7b7dWPxPVGVIYm9Lo62gGnmMg2Di4oDY04Jt78aP7HEJlW47uEKkKj
	3TqIwRRIyHFG/nF+FZGOybUoI4A==
X-Received: by 2002:a5d:584f:0:b0:437:7268:8e1e with SMTP id
 ffacd0b85a97d-4399de2cba3mr6429787f8f.51.1772216300720; Fri, 27 Feb 2026
 10:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227164037.84110-1-sun.jian.kdev@gmail.com> <20260227164037.84110-2-sun.jian.kdev@gmail.com>
In-Reply-To: <20260227164037.84110-2-sun.jian.kdev@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Feb 2026 10:18:09 -0800
X-Gm-Features: AaiRm52de5u7x-J2odVvUITF-GfaCVyn22iVXIPZ6Isfcnmemi_EZqJdoVNJLME
Message-ID: <CAADnVQLT8nEetXYDB1rFOqwgyBvowbafUzuz=7EBWUyVQw5G6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/bpf: bpf_cookie: skip kprobe_multi tests
 without bpf_testmod
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 8:40=E2=80=AFAM Sun Jian <sun.jian.kdev@gmail.com> =
wrote:
>
> The kprobe_multi subtests rely on bpf_testmod fentry ksyms.
>
> When bpf_testmod isn't available, libbpf fails to resolve
> bpf_testmod_fentry_test* and skeleton load fails with -ESRCH, causing
> false failures.
>
> Skip these subtests when env.has_testmod is false.
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/=
testing/selftests/bpf/prog_tests/bpf_cookie.c
> index 75f4dff7d042..50f5e11e6e65 100644
> --- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> +++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
> @@ -105,6 +105,11 @@ static void kprobe_multi_link_api_subtest(void)
>         unsigned long long addrs[8];
>         __u64 cookies[8];
>
> +       if (!env.has_testmod) {
> +               test__skip();
> +               return;
> +       }
> +
>         if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
>                 goto cleanup;
>
> @@ -192,6 +197,11 @@ static void kprobe_multi_attach_api_subtest(void)
>         };
>         __u64 cookies[8];
>
> +       if (!env.has_testmod) {
> +               test__skip();
> +               return;
> +       }
> +
>         skel =3D kprobe_multi__open_and_load();
>         if (!ASSERT_OK_PTR(skel, "fentry_raw_skel_load"))
>                 goto cleanup;
> @@ -451,7 +461,7 @@ static void pe_subtest(struct test_bpf_cookie *skel)
>         attr.type =3D PERF_TYPE_SOFTWARE;
>         attr.config =3D PERF_COUNT_SW_CPU_CLOCK;
>         attr.sample_period =3D 100000;
> -       pfd =3D syscall(__NR_perf_event_open, &attr, -1, 0, -1, PERF_FLAG=
_FD_CLOEXEC);
> +       pfd =3D syscall(__NR_perf_event_open, &attr, 0, -1, -1, PERF_FLAG=
_FD_CLOEXEC);

This part is not explained in the commit log.

pw-bot: cr

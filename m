Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D70138A705
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 04:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772081816; cv=pass; b=jnD9RGyqbrJ1khfQYc5ddimQkrJ+yj28BwHihDjKzVfWyKrQPRMhh/pyDh9Ma4lN8rymoqvR4v1T9YbhV9dEet/UnnpgokCAMmfnG0lB0qrjjEgs7knyGTRczeRBb81jZ5FPQv/Y9kCapz9q+s8JXjAQYsya4FJuJVYK+kVHB/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772081816; c=relaxed/simple;
	bh=2hChll5BBbjw96pDP2XpQQyvGH1G+zGwcL7JOkIAw0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecSqnrYHJS8GwsRMmUZPe9YyZAqVx+C+AfRVBgRJ/TYL+vk+ozTsDOxEXG+7zPrQ3TYhSCdkdt7+w2ZL+W/q5pOPWNBxAGtqM9Pg4j63QvSzAUOQJhC5PtuV6dhMf6sCJd891qRHltD+4FHCKKXuoiPvNOAf4slFvWCOTAVdWN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNR0W7fu; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNR0W7fu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4398ebdf520so982962f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 20:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772081814; cv=none;
        d=google.com; s=arc-20240605;
        b=CGvncGvBLzcTioN5gmbXe3BUjLYDR1T/kX9zMwSpgiijYJonH+b61VXsiWF+4hH5v/
         tmMPn8XShTtbSebnwaUrWPQaatcs3f2V8TFwm/C97NE56xWADtrs8DoibAYFIHc1ED0/
         KPyMM2V1DYUkB0YTodQ0dJYWKhnfEfpr3LdXS3yguVJDsxlJZi6PoxUBni5mWvHcA3lL
         dB755TzYU1+U4JTgBEzGA2RlI9bTJuiO6KvaTl4dSfms/sbYaKhq0SCCvcP1y4nPCh4G
         UcdRwkKZjvFQUf6JlCpd6p4aS2p2vKsgpD0RaFjAbTx1ki84es5iUNfLe0LH0BP0x7i+
         C/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NfqGd/7ulX9YuIORD7ArL3Me7S3E+4NOv4DsCTEK+iI=;
        fh=aGCO1eaxCGr8NHUrxmz3xNk0Bg0OFLrz6HvdE1cy40g=;
        b=WRPq+phanAWmq0xFRrng3hBSsVLX07mOY3+BjG0gg6fBRZTyzUlT+g7PNvl0XuyxM8
         t6XlmyzXqumHUPDRdRcuw/fH/65jl4V0VpUggbb5gHUmHSZusjLQ94TCXEXo1sNGroho
         lwJptgeoWSIQYi4/b67siDmE8Yg9w7YwJqi6XblcOPHXKdDHz+0BLTx1gNw0Fk+P9MVe
         v6+AYlIbIrxwu/YBoZ8pmRWwbCeBxnKrA7n1psoiICohGI0F1J+EIbofrr8tn9QHnXry
         w4ooynPl8A7Tc7TLG7jKtgVgEt8eHoDgLRb7fdvkKuC2PuLUwilTuzWpqkJk0AQ5NH3j
         axqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772081814; x=1772686614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfqGd/7ulX9YuIORD7ArL3Me7S3E+4NOv4DsCTEK+iI=;
        b=KNR0W7fuuJIS5LNvKv2nvTrrMKaqmwgbPyEo3o+GMrHnS/tqaiGxs/ZMG0vxeNKEfI
         s455rWgu21eWeFWL+8lPoxPT1L+vaJtgLCE97BUa0E/GxxdXRZtrxCDGxqOaDngisnta
         XMI1mwokTEUFHBQfJ5bsmzcyjlKUSXPzk4+CUeS8J6DLt07ZQadtNq88M0QFvJGUbuWG
         4Sb5QBlXTBCwiji3t/ZdCbxv2nSyViD1yawktK+zwOA5hK6IUgD4gvtCmUurfgm+mssB
         b+N5zwDXVAnZz+xzfcN40PxkLrCZs2R3r4g6cvITeQlzCtTry5VE6toCz876LO7K6znY
         +g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772081814; x=1772686614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NfqGd/7ulX9YuIORD7ArL3Me7S3E+4NOv4DsCTEK+iI=;
        b=Vi33jArWTrPZH+BCIZDZGABWoVT1ePG5+6aTGvo+DPGRSt6gChJDxkuKo4i3LRQxhj
         jhg7knlvtI1dikZYf9RlvjZje9/xixqWW7Mnd8wDNxr+8MnsXtR3oXAMeyXTHvdBJR9V
         DuBPPUokGTclojEo4ynpxPOIZG18bYm/UKnRqPkJOBISs0ieHuywz3LUKYrehJ9OITfy
         rIIo8ZK1jUa9XE78jsJmKRuL6iUBajeDJTFFRaUu4sGDft9aGOd+pj6+OvMETQERtDi6
         BtulhsghJZBy+SIU6PQ2rC2aVdbBIZQIAweeaSfsILG+PaO9ZBG7rLHy/e0OBz/bHGcA
         M7nw==
X-Forwarded-Encrypted: i=1; AJvYcCVjuv1Ny+dryQ+ANwjScCeuxm7kQxfsX99w5xl8YpCHtJjgXmiJ8FWaqYrVQSQPndo8dcEiqFvoSdVGzSvhph0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuLE8SvevLEBzEGgxEhOVLXHAclUVgVrU/m7aHCyEF6eWxDdsn
	oGaSohzVwqx2zzcBmfMkGd3oHddn7Xc30dwB7bQz6TktevbXwp5aCO+NHDEGbIa8dQYvrLA/r1Z
	5g1z3bhJspTOoXSUKwJLwtulNRyjz/x1sdg==
X-Gm-Gg: ATEYQzwt9lCyrV8YnWhgvxwMBaSppiJh77Sk4EXs92HOMvazCBRqhW1VOe+KIwGGnJb
	BPA6MTFjWInuKNPuTeXYxGR9FpF3Jy89CGObF0YQ2PS2D/57zB3rUf8ZBqoKI+Q6KLL7Er9iI+/
	753EyIJBM5lzWPBJNGbiHRZAW4zItiQG9v1XzHrb8FqFla/xu7UZwBMrj3pUi1WLiYyQJMLq98J
	czVWsN8jMDBOvUW+JLGl1iIcpbpDs3NcI1sKHswwupl2cCFyvPLDDEPdRrLO0nwXVTOkxydPnKe
	OT1T8ZqOQAQxYRfXJ6+hZRPAmXVtXvj/An2W7rOCN4UdDeqe06s+OvzwjwLbQJbpr5R5BIba02r
	MUYIaDWnuHfgUvZIuhoxIp/BFuwqw/R1x9syY
X-Received: by 2002:a05:6000:402a:b0:435:8dd5:ad4f with SMTP id
 ffacd0b85a97d-439971ae913mr2213638f8f.9.1772081813615; Wed, 25 Feb 2026
 20:56:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772079741.git.sun.jian.kdev@gmail.com> <2697993e938a2f87084cfe92a4117525d700ac9b.1772079741.git.sun.jian.kdev@gmail.com>
In-Reply-To: <2697993e938a2f87084cfe92a4117525d700ac9b.1772079741.git.sun.jian.kdev@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 25 Feb 2026 20:56:42 -0800
X-Gm-Features: AaiRm53eVXo79GEkdqm5L5n5J2hX7hgUMoyYtx-wS3h5uGMWHfRUdmqm1LG9STw
Message-ID: <CAADnVQKq40Sok-PUnyCLhukq0Q0KFptNWo=VQn8ybBWTpjk1KA@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/bpf: probe_user: filter by pid to avoid
 cross-test interference
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 8:31=E2=80=AFPM Sun Jian <sun.jian.kdev@gmail.com> =
wrote:
>
> The test installs a kprobe on __sys_connect and checks that
> bpf_probe_write_user() can modify the syscall argument. However, any
> concurrent thread in any other test that calls connect() will also
> trigger the kprobe and have its sockaddr silently overwritten, causing
> flaky failures in unrelated tests.
>
> Fix this by introducing a pid_map (BPF_MAP_TYPE_ARRAY) that stores the
> test process's PID. The kprobe handler returns early if the current PID
> does not match, confining the hook to the test process only.
>
> Also remove the TODO comment that tracked this issue.
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  .../selftests/bpf/prog_tests/probe_user.c     | 13 ++++++++++-
>  .../selftests/bpf/progs/test_probe_user.c     | 22 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/probe_user.c b/tools/=
testing/selftests/bpf/prog_tests/probe_user.c
> index 8721671321de..f50ee4066759 100644
> --- a/tools/testing/selftests/bpf/prog_tests/probe_user.c
> +++ b/tools/testing/selftests/bpf/prog_tests/probe_user.c
> @@ -13,13 +13,15 @@ void serial_test_probe_user(void)
>         enum { prog_count =3D ARRAY_SIZE(prog_names) };
>         const char *obj_file =3D "./test_probe_user.bpf.o";
>         DECLARE_LIBBPF_OPTS(bpf_object_open_opts, opts, );
> -       int err, results_map_fd, sock_fd, duration =3D 0;
> +       int err, results_map_fd, pid_map_fd, sock_fd, duration =3D 0;
>         struct sockaddr curr, orig, tmp;
>         struct sockaddr_in *in =3D (struct sockaddr_in *)&curr;
>         struct bpf_link *kprobe_links[prog_count] =3D {};
>         struct bpf_program *kprobe_progs[prog_count];
>         struct bpf_object *obj;
>         static const int zero =3D 0;
> +       __u32 key =3D 0;
> +       __u32 pid;
>         size_t i;
>
>         obj =3D bpf_object__open_file(obj_file, &opts);
> @@ -38,6 +40,15 @@ void serial_test_probe_user(void)
>         if (CHECK(err, "obj_load", "err %d\n", err))
>                 goto cleanup;
>
> +       pid_map_fd =3D bpf_find_map(__func__, obj, "pid_map");
> +       if (CHECK(pid_map_fd < 0, "find_pid_map", "err %d\n", pid_map_fd)=
)
> +               goto cleanup;
> +
> +       pid =3D getpid();
> +       err =3D bpf_map_update_elem(pid_map_fd, &key, &pid, BPF_ANY);
> +       if (CHECK(err, "update_pid_map", "err %d\n", err))
> +               goto cleanup;
> +
>         results_map_fd =3D bpf_find_map(__func__, obj, "test_pro.bss");
>         if (CHECK(results_map_fd < 0, "find_bss_map",
>                   "err %d\n", results_map_fd))
> diff --git a/tools/testing/selftests/bpf/progs/test_probe_user.c b/tools/=
testing/selftests/bpf/progs/test_probe_user.c
> index a8e501af9604..20a13b984fb0 100644
> --- a/tools/testing/selftests/bpf/progs/test_probe_user.c
> +++ b/tools/testing/selftests/bpf/progs/test_probe_user.c
> @@ -5,6 +5,24 @@
>  #include <bpf/bpf_core_read.h>
>  #include "bpf_misc.h"
>
> +struct {
> +       __uint(type, BPF_MAP_TYPE_ARRAY);
> +       __uint(max_entries, 1);
> +       __type(key, __u32);
> +       __type(value, __u32);
> +} pid_map SEC(".maps");
> +
> +static __always_inline int pid_ok(void)
> +{
> +       __u32 key =3D 0, *expected_pid;
> +
> +       expected_pid =3D  bpf_map_lookup_elem(&pid_map, &key);
> +       if (!expected_pid ||
> +           *expected_pid !=3D (bpf_get_current_pid_tgid() >> 32))
> +               return 0;

Good idea, but there are much simpler ways to do it
via global variables.
See other selftests.

pw-bot: cr

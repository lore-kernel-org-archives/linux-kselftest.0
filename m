Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612B36DA10
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253313; cv=pass; b=T+nfIM5c1LdKjEnKHTtNrMqEyW+MJQHOXcDS1HBnj6x5ll0X0Gmu3nUscZC26dzXvTMztsFnXA00qj1rU7sPYFZ0W1KX6Ci221Hs+NOiXNO28CNc8tHgBHZ9HBMvSkzD01cEWMCJj5PTLqBNdRj3JZLnzWf6tEeL6T4TxKMiEmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253313; c=relaxed/simple;
	bh=GUFtaxAw8M8F9zmMRYpac2RCtb+oR7+8BionIa+Cflw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=np7r1l1dUOKKt10cFNIlSzrmgTnYdMyqO9T7/bFFzyNMYYJXFDbzfPT/SD4LbPMViXS/7RlI6Y8Rt0ehEWstH5xos9G1OXwtdR9sLYlyikJ9ZcynRWHrIB0JKn4xPPBNaHztwY6aAaTIclJtXFneteCQ8PE9KKZiBTZRFeE1Yz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbgasgUQ; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbgasgUQ"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79ab50ee951so5465867b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 01:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774253310; cv=none;
        d=google.com; s=arc-20240605;
        b=JV0GcXHnlvPi2cFxbq0yUP6Z2mVSoRUOvatLbTTNV6wEISgE7gARYmC88s02fwLMZd
         MGLLyfUbK0NbfVbieS0FmqH5/lXyDhtlwYLKFWXhLFtX5vruYgR3f4IivmxgmZaTk4tX
         2aKRYdnot9ARpaK92JV7ELkQ0wqPslRrpwf6AGLBOEC7gSn0Vl/HMGpYhMrj3FeR49ow
         rRiLHMvd8k2ou/DLnCU3svkzelEgqMRAPncNlefnXVcZFzAuUep1lXN330Ka6b9v2DVq
         +EtGrFY3GuIpS6IEQgfd+D53jlX6eDLfmm7kQxIHbqOSlSxOaV9CzxgyIxfxG07u3TAX
         0QrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uKOsqFldeivWVY99I9doXJDS2mjmgWeAt9GGNke0S7A=;
        fh=IVlbZCMa/9/qrjKBmlymuwnUnzedYIGSKqlr24NXRKc=;
        b=AmH2XkU4JRF1u0wbG3TAOn/nlZOFIqJ6voQwTIPKcLu6cHufP96PIEinWVBOkJlXjI
         6OAUjkFbY/7mfxCL6ZFe30qWxB1UWeY/Rx0f1uXa/iYuqeQxWmknVx0MOUEVsrthfbMb
         BW2aCoaeiLonIOhrDaeNDbbnH0uP5bglD+uTlTL29X7fUq2aTcD2Vew3R9teCo16kJI8
         3XKtJ+yEyW25AN+R4aVbe9vxSmoYvzZ7eYec/VWd3dhPy+2ni6TjXWP3XNLDaAm46Ili
         6iqQpQsi7hKEn7uidJIWTq6esqS5LIe5MTE32Fc5QyGqlVZppFSsjyB9lB27feZOFpLe
         CvLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253310; x=1774858110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKOsqFldeivWVY99I9doXJDS2mjmgWeAt9GGNke0S7A=;
        b=KbgasgUQo/bQJQINtaSCal5n9Tlcwda8n+RPShwZ9XkMb7WU2AGAiuUwpdqMdrWmUg
         ZHbe51DV4ZDWV2szgYvmYjQ9AoZSHJu/vcD6iP7WMfsGbu6uIKMohIicFzCZ+OySyv3r
         YnuQP/xVD4b4ksbJn0jdXxQE17V474b7txdf8qTDCL9CPSqESGsR6LkpVxeVi3x6/6pm
         oYnbe/FG8a9p57ITzW4zg3d3Z21y7LVTwdvtKkH5e2ImunMtwBovepbE1Q2PRxWfFspC
         rksXLKtOtiepjnf+6v9fWuzrA4F+z7sgRcVjY+GNUgB0SnOjUhaT0iuonWbN/zTAH6Wr
         WCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253310; x=1774858110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKOsqFldeivWVY99I9doXJDS2mjmgWeAt9GGNke0S7A=;
        b=jDbkSlZWAqZd9gkLHnYymSkBRVe4KoITaiqSSRlxIH5AnN6X/VXmKbCTTu47J5ZAlm
         j09tAY6yheCQ42pxHJ/EWBXs2oJBSz9+VltKH0bCFJuCqz+Jno7txEos6MNyHXzUK6Uu
         eZg3rfHSFViFj1biUEW8HpDKHENxDuY0dJU7O3A3seGBVC8G4jZ8oTyE4L9bnXr4Nqva
         uYjR/Cie4CVs01dAj+toCHEi8Py7gELDR0NrRyJJBwjTPSuIdULWQVQs0i0vtnmk9Dir
         tK+fS7NzYyr060+c/4JHeglfAUHmOm9VWwXOVpOX2fXchiOnztZAOSfhLE8VNjIEaifl
         tITg==
X-Forwarded-Encrypted: i=1; AJvYcCUfd/uv/xA6UZc283hX1uinGy54SZIhkxN2yDZ7l+mFKn33n9GP3g96sRkm6zMilBgWvuTLEauF1kiBVaGNhZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJABPfLFdFqzDMMMBLjCYvuQY6+AHawPTb0j8meJpf7cDoiOx7
	hUmkZIEGAIQ+C+0YMfwQM1BZC9Z0APQtRzt4f5LJltQCdmojExuBKHyyWSfOblpWnh/zDti7cau
	8EVV9TVDXi0wboXalw67FBKwZGooMD/jUutNKpi/mAQ==
X-Gm-Gg: ATEYQzzQiFmzaRpdb5zxKZHcwTi/jnjv2CED5xErOhTwmOAr3YQyqH2878b9PT0CcvG
	N/h3QxP/AZZRMcCmRCrYJndwJBru7S23tBj1YMuxNIVmvFRnriYK9K9G+QidgvUvHVtbW5GgA+N
	lau9vnkSqfnqcffShRMAA+oJApfj/CtJEGwR1UeSIYQeDIc7uIcg2SWqUSWVAQbkDX1/xCZrFsP
	kWj2ezw38DBcXuGdChvC4b/vuZn2/PWZGpXr+oqidY5ISUxIQlch9F2aZ4mVJyvoxtBB8u2zVvC
	FRIGGiSsGzuXIOWA6xfgoZbRm0iJYa+gLP4UzoiVLWuRuyqQEk5hRNQNKEs=
X-Received: by 2002:a0d:dc07:0:b0:798:5b22:ecb0 with SMTP id
 00721157ae682-79a90b09f20mr82630987b3.22.1774253309891; Mon, 23 Mar 2026
 01:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320074150.628094-1-sun.jian.kdev@gmail.com> <87zf42k3b8.fsf@gmail.com>
In-Reply-To: <87zf42k3b8.fsf@gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 23 Mar 2026 16:08:18 +0800
X-Gm-Features: AQROBzA6OOX7Inx6uQ1FL5BimIdPhKIiBQego0N7c8ug70xfbWSZE9b50Lo2xHI
Message-ID: <CABFUUZEW5ecbRJGstkCNsG_B-RA4DNj4-RMGrHtyiTNXp5n-ug@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/bpf: move trampoline_count to dedicated
 bpf_testmod target
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, shuah@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, 
	paul.chaignon@gmail.com, jolsa@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 10:01=E2=80=AFPM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> Sun Jian <sun.jian.kdev@gmail.com> writes:
>
> > trampoline_count fills all trampoline attachment slots for a single
> > target function and verifies that one extra attach fails with -E2BIG.
> >
> > It currently targets bpf_modify_return_test, which is also used by
> > other selftests such as modify_return, get_func_ip_test, and
> > get_func_args_test. When such tests run in parallel, they can contend
> > for the same per-function trampoline quota and cause unexpected attach
> > failures. This issue is currently masked by harness serialization.
> >
> > Move trampoline_count to a dedicated bpf_testmod target and register it
> > for fmod_ret attachment. Also route the final trigger through
> > trigger_module_test_read, so the execution path exercises the  same
> > dedicated target.
> >
> > This keeps the test semantics unchanged while isolating it from other
> > selftests, so it no longer needs to run in serial mode. Remove the
> > TODO comment as well.
> Is it really worth it just for ditching serial mode, does it improve
> test_progs speed? Either way it's worth adding a comment for
> bpf_testmod_trampoline_count_test() explaining that no other test should
> attempt attaching to it.
The main point here is not to speed up test_progs. The trampoline
count limit is a
 per-func, system-wide quota. The purpose of this change is to avoid
contention with
other selftests attaching to the same target function. Allowing this
test to run in parallel
is just a consequence, not the goal, as the TODO comment already indicated.
Adding a short comment is not a bad idea, but
bpf_testmod_trampoline_count_test()
is already fairly self-descriptive.
> >
> > Tested:
> >   ./test_progs -t trampoline_count -vv
> >   ./test_progs -t modify_return -vv
> >   ./test_progs -t get_func_ip_test -vv
> >   ./test_progs -t get_func_args_test -vv
> >   ./test_progs -j$(nproc) -t trampoline_count -vv
> >   ./test_progs -j$(nproc) -t
> >     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,=
\
> > kprobe_multi_test -vv
> >   20 runs of:
> >     ./test_progs -j$(nproc) -t
> >     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,=
\
> > kprobe_multi_test
> >
> > Suggested-by: Jiri Olsa <jolsa@kernel.org>
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> > Link:https://lore.kernel.org/bpf/abicUI4YQ5KkQ_Ro@mail.gmail.com/T/#m62=
53b7fe96fe1a4df65b274c95aac786598a9857
> >
> > v3:
> > - route the final trigger through trigger_module_test_read() and make
> >   bpf_testmod_test_read() call the dedicated trampoline_count target,
> >   as suggested by Jiri
> >
> > v2:
> > - rewrite the subject to describe the change
> > - resend with the correct patch content
> >
> >  .../bpf/prog_tests/trampoline_count.c         | 17 ++++----------
> >  .../bpf/progs/test_trampoline_count.c         |  6 ++---
> >  .../selftests/bpf/test_kmods/bpf_testmod.c    | 23 +++++++++++++++++++
> >  3 files changed, 30 insertions(+), 16 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c =
b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
> > index 6cd7349d4a2b..dd2e5c84a4b5 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/trampoline_count.c
> > @@ -30,16 +30,14 @@ static struct bpf_program *load_prog(char *file, ch=
ar *name, struct inst *inst)
> >       return prog;
> >  }
> >
> > -/* TODO: use different target function to run in concurrent mode */
> > -void serial_test_trampoline_count(void)
> > +void test_trampoline_count(void)
> >  {
> >       char *file =3D "test_trampoline_count.bpf.o";
> >       char *const progs[] =3D { "fentry_test", "fmod_ret_test", "fexit_=
test" };
> > -     int bpf_max_tramp_links, err, i, prog_fd;
> > +     int bpf_max_tramp_links, i;
> >       struct bpf_program *prog;
> >       struct bpf_link *link;
> >       struct inst *inst;
> > -     LIBBPF_OPTS(bpf_test_run_opts, opts);
> >
> >       bpf_max_tramp_links =3D get_bpf_max_tramp_links();
> >       if (!ASSERT_GE(bpf_max_tramp_links, 1, "bpf_max_tramp_links"))
> > @@ -80,17 +78,10 @@ void serial_test_trampoline_count(void)
> >               goto cleanup;
> >
> >       /* and finally execute the probe */
> > -     prog_fd =3D bpf_program__fd(prog);
> > -     if (!ASSERT_GE(prog_fd, 0, "bpf_program__fd"))
> > +     if (!ASSERT_OK(trigger_module_test_read(256),
> > +                    "trigger_module_test_read"))
> >               goto cleanup;
> >
> > -     err =3D bpf_prog_test_run_opts(prog_fd, &opts);
> > -     if (!ASSERT_OK(err, "bpf_prog_test_run_opts"))
> > -             goto cleanup;
> > -
> > -     ASSERT_EQ(opts.retval & 0xffff, 33, "bpf_modify_return_test.resul=
t");
> > -     ASSERT_EQ(opts.retval >> 16, 2, "bpf_modify_return_test.side_effe=
ct");
> > -
> >  cleanup:
> >       for (; i >=3D 0; i--) {
> >               bpf_link__destroy(inst[i].link);
> > diff --git a/tools/testing/selftests/bpf/progs/test_trampoline_count.c =
b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
> > index 7765720da7d5..14ad2f53cf33 100644
> > --- a/tools/testing/selftests/bpf/progs/test_trampoline_count.c
> > +++ b/tools/testing/selftests/bpf/progs/test_trampoline_count.c
> > @@ -3,19 +3,19 @@
> >  #include <bpf/bpf_helpers.h>
> >  #include <bpf/bpf_tracing.h>
> >
> > -SEC("fentry/bpf_modify_return_test")
> > +SEC("fentry/bpf_testmod_trampoline_count_test")
> >  int BPF_PROG(fentry_test, int a, int *b)
> >  {
> >       return 0;
> >  }
> >
> > -SEC("fmod_ret/bpf_modify_return_test")
> > +SEC("fmod_ret/bpf_testmod_trampoline_count_test")
> >  int BPF_PROG(fmod_ret_test, int a, int *b, int ret)
> >  {
> >       return 0;
> >  }
> >
> > -SEC("fexit/bpf_modify_return_test")
> > +SEC("fexit/bpf_testmod_trampoline_count_test")
> >  int BPF_PROG(fexit_test, int a, int *b, int ret)
> >  {
> >       return 0;
> > diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/too=
ls/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > index e62c6b78657f..47583577e021 100644
> > --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> > @@ -470,6 +470,8 @@ noinline void bpf_testmod_stacktrace_test_1(void)
> >
> >  int bpf_testmod_fentry_ok;
> >
> > +noinline int bpf_testmod_trampoline_count_test(int a, int *b);
> > +
> >  noinline ssize_t
> >  bpf_testmod_test_read(struct file *file, struct kobject *kobj,
> >                     const struct bin_attribute *bin_attr,
> > @@ -548,6 +550,10 @@ bpf_testmod_test_read(struct file *file, struct ko=
bject *kobj,
> >                       21, 22, 23, 24, 25, 26) !=3D 231)
> >               goto out;
> >
> > +     i =3D 2;
> > +     if (bpf_testmod_trampoline_count_test(1, &i) !=3D 4 || i !=3D 3)
> > +             goto out;
> > +
> Do we need to add this test for the bpf_testmod_trampoline_count_test(),
> if it's supposed to be used only for the trampoline count test, which
> probably does not care what function actually does internally.
This part was only added to keep the execution path conceptually aligned
with the dedicated target change. As for this and the above comment suggest=
ion,
 I'm fine leaving both to maintainer preference.

Sun Jian
> >       bpf_testmod_stacktrace_test_1();
> >
> >       bpf_testmod_fentry_ok =3D 1;
> > @@ -581,6 +587,12 @@ noinline int bpf_fentry_shadow_test(int a)
> >  }
> >  EXPORT_SYMBOL_GPL(bpf_fentry_shadow_test);
> >
> > +noinline int bpf_testmod_trampoline_count_test(int a, int *b)
> > +{
> > +     *b +=3D 1;
> > +     return a + *b;
> > +}
> > +
> >  __bpf_hook_end();
> >
> >  static struct bin_attribute bin_attr_bpf_testmod_file __ro_after_init =
=3D {
> > @@ -1843,6 +1855,16 @@ struct bpf_struct_ops testmod_multi_st_ops =3D {
> >
> >  extern int bpf_fentry_test1(int a);
> >
> > +BTF_KFUNCS_START(bpf_testmod_trampoline_count_ids)
> > +BTF_ID_FLAGS(func, bpf_testmod_trampoline_count_test)
> > +BTF_KFUNCS_END(bpf_testmod_trampoline_count_ids)
> > +
> > +static const struct
> > +btf_kfunc_id_set bpf_testmod_trampoline_count_fmodret_set =3D {
> > +     .owner =3D THIS_MODULE,
> > +     .set =3D &bpf_testmod_trampoline_count_ids,
> > +};
> > +
> >  static int bpf_testmod_init(void)
> >  {
> >       const struct btf_id_dtor_kfunc bpf_testmod_dtors[] =3D {
> > @@ -1859,6 +1881,7 @@ static int bpf_testmod_init(void)
> >       ret =3D ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING, &=
bpf_testmod_kfunc_set);
> >       ret =3D ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &=
bpf_testmod_kfunc_set);
> >       ret =3D ret ?: register_btf_kfunc_id_set(BPF_PROG_TYPE_STRUCT_OPS=
, &bpf_testmod_kfunc_set);
> > +     ret =3D ret ?: register_btf_fmodret_id_set(&bpf_testmod_trampolin=
e_count_fmodret_set);
> >       ret =3D ret ?: register_bpf_struct_ops(&bpf_bpf_testmod_ops, bpf_=
testmod_ops);
> >       ret =3D ret ?: register_bpf_struct_ops(&bpf_testmod_ops2, bpf_tes=
tmod_ops2);
> >       ret =3D ret ?: register_bpf_struct_ops(&bpf_testmod_ops3, bpf_tes=
tmod_ops3);
> >
> > base-commit: 8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
> > --
> > 2.43.0

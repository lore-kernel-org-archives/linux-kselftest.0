Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0AA416869
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 14:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765602; cv=pass; b=CaROlyb8wd0wEMHTznFHDM3gawEaOQVF+4pwpTcFN3vSRS3Z54T7lwuYEdSbXbD7MALVnncb2KJMxPtiZ1oopOuIt8eJKGWNUQCSJNwmis36caNdSxpW9UwfujiviR4llrZSyyrxLqcOISJvo/MgE/cRefRKsiXCBPAhRLri448=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765602; c=relaxed/simple;
	bh=X0y1TLhr/j0qdMaypaUfWICfrJeG5V0CGZCBLtCpESU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWKuEQsHp6LVcd6YiOUrnnvJtKl7TrWASmHY+DCI5hjcuSFwkUZbbbxSNg1x/nDZqxLVjJD4ruqF0rueTscf5wiOAwERmisurD3L5B63H4jHayGIWSmwfUbrETlEQGMKklTc4lLgocj6qNWA/ZGl4Ec72L+2PmovNWg7P4n9TRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ds59Xe7g; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ds59Xe7g"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81ed2a06b9eso28381167b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 07:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785765600; cv=none;
        d=google.com; s=arc-20260327;
        b=e4k6EGekl9ekk2EZ2MNz3jeW0C9FdBpXqzszZ2JiI4yv4mst9B1EWiH06pv0A7UtUw
         YpOtyQgponmGteuwyXK7U7cOX7xMU2SxFJM9uJHEjfoMT1TxZypv42533o1qpUzsfChJ
         Jxf0p3cEwy/2PGqWkbvpKMGRIcO5xjWMTO4qF0FFaAiX0LCR38HpkU5/cdCNa/liyVQd
         cHf9s9TPaAX9cx6G0VwAfa3bZQpPcgHzv8hO+GYIqP7mFUlDithela8viMBhWQFTEKXD
         2e9W3/HifBAwd3epN7xBHgAy1+3oY2oad4FxtIXZ9F7Ex0PXabQyOzrfGmE48iVv80GZ
         +sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUq4hAvkY7mGfyPrlyY6j5pEllMlyFJ5P2MJBLcff1I=;
        fh=CbqpZcv8ssedIaUCLOmsi6Bmesnwvz2k4LAybPlFbxM=;
        b=KXH1xCrLLJkKiKYfljprTGqyI+W7KHGAmOrskiNmqdoJelBmr/J0EfEesSVCNaOi8j
         HhAQ9YzzFCpymR0nOkbBE1qcu+jtSo8+zR4omOrcUMJWxvkpLuJ1SdC7+Qa61AKU9bGi
         /Qk/91FCSFRfh3CGzA769jyb6yzcsqZBmqpEiUvvNHVoEWx+Nq+4Tf6Xj9cbAuS/0M+c
         VG+rXLbnMmVTYvZRttqNIgxUr+qMU5dwGjZdCcMMUhS7a36rP35zUaMM5VmB0bIB452Q
         +s+aNaT4CftzDFiTFQrUNO9fxVNLyv6KD/vWSvRjn1t4uKSq33M0MBWTWheL2CL6L5HB
         l/vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785765600; x=1786370400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUq4hAvkY7mGfyPrlyY6j5pEllMlyFJ5P2MJBLcff1I=;
        b=ds59Xe7g0qRNC7xCjsmTq7KIKgbXve2ACoy4ipF6BAIgSc/zH3VdCrrytTVrBuGOYG
         0uuGwEPt9nwBgV3fEFOre+o4r2KvigGtoP9B7g0+CVe7CtSIRz1sQJ3y+IzBSGZ/u17w
         shQElGgXK+jBSmyVwonIl7durCkLN5wJ4w7f64PfwAdD4Ol4Rt1d/1fkrnV4X4BtebGX
         OtQHlN1o72Yn2V1mA8+Cd3dezveT4SlpzWo8HMbGuoWMC50JueF1Q/4p6sjGvy4jFwe4
         gVvgqRXecPxpXP43Fgo1xLDbS94Vh0JpBLr7vNJuhk+dTyqU6/c4IhbJZvT4+1Ji3BWm
         n+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765600; x=1786370400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUq4hAvkY7mGfyPrlyY6j5pEllMlyFJ5P2MJBLcff1I=;
        b=HFK4qa4XW2zzXJv5WCdQI2hd/s9Z8xPBU4QzkOBfWq6WrMgAeUtr+nyV6KWrG9IjL+
         GJnisUf1PPFyWSge/oARSJFOg6M0qUMTwRLgUiOnx/QbP+XoJ03epcmFTqKlqsFRUk8M
         Sc+mNglMGlFUETwKxjIDU7PN1U/FQEj5XfukATo8qWZGfSAGO6Mrdi91IgSndcV/cqHP
         rNhm2I3f2Baz62PPAeeyw13woObqU3LgpnTop50KGg/1AiFUkOeLsnq4Z+OeBQJe0dx2
         eTJ9uW1qE/S4n5cGK4HMfMWo2al4PQSHfRbgpZ/mpGaYWs99vhDNm4MlcoYFgvDbMIga
         Bghw==
X-Forwarded-Encrypted: i=1; AHgh+RqaB1H42nl7k2A4bLvDg6ZJJ7gT0Q6qz/Qu0WFe/TybUP1Uslvh+fO0Qldy4N2wKNpl0Q31PZ4P5sAYffITvBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBNCv+Q8hbOZ7ODfyyRqufcC8Er4Mw3AnLF62KxkpzlATl03t
	DejEKdMLmw1HgL0xQJq73dpGKz3WY01IBXfu01hyoJqUsecXixgojD12l4isnJqQTc7dsFszhPo
	dV+mBj6sM7VCT5gH0fAIpb1ZQA6VhqnU=
X-Gm-Gg: AR+sD11CTCpgSBYO55s+lLLVHU5qFvxXACxZlnoyXYO++i9vyi6p1Ykf2eTx9gqd311
	bBEbbiohQGmEFDdowQ4cdCZrmyt/2qY9vDyLIxMjCyFZWP03mLnO23I0HL3nbk5TWvwWpVsC9/t
	FpLM1sNTUPWVIhM+PI3q1aS8l/P+dqihTwLfSbaDuxquEuWjHWQsey2iyY24sPI94KaSrFl5gOZ
	W7puDl/HOMfbFy9Ly90RQeGtszJ7deLWVR/eqxhMBmXUC3GXi4sFD7pjm8UzECC9XuPhWDfHYD/
	6P/h941VdmQ+wr14bc/ik04jPUFiwkmW+gH5XXSvrUzv
X-Received: by 2002:a05:690c:7209:b0:814:6ca5:ef99 with SMTP id
 00721157ae682-81fd4a67b41mr136378587b3.16.1785765599869; Mon, 03 Aug 2026
 06:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803112218.3361213-1-dingning04@gmail.com> <20260803112218.3361213-3-dingning04@gmail.com>
In-Reply-To: <20260803112218.3361213-3-dingning04@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 3 Aug 2026 06:59:49 -0700
X-Gm-Features: AUfX_mxlqtspB2RkWNcxQCkwiZOzCX-A6ToBkQFOjsEMiss5yExg6HctyB_AzRA
Message-ID: <CAMB2axOMcg8ZKPR8GOmeOuKUyDKZ9WVvAgJvRU5kuTm+_tOcvA@mail.gmail.com>
Subject: Re: [PATCH bpf v3 2/4] selftests/bpf: Test refcount_acquire return nullability
To: Ning Ding <dingning04@gmail.com>
Cc: bpf@vger.kernel.org, memxor@gmail.com, greg@kroah.com, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
	Viktor Malik <vmalik@redhat.com>, Justin Suess <utilityemal77@gmail.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Kaitao Cheng <chengkaitao@kylinos.cn>, 
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 4:26=E2=80=AFAM Ning Ding <dingning04@gmail.com> wro=
te:
>
> The verifier could accept an unchecked bpf_refcount_acquire() result for =
a
> borrowed RCU-loaded map kptr. If the call returns NULL, passing the resul=
t
> to bpf_obj_drop() can crash the kernel.
>
> Add tests showing that an owned input remains non-NULL, a checked borrowe=
d
> result is accepted, and an unchecked borrowed result is rejected.
>
> Assisted-by: Codex:gpt-5.5
> Assisted-by: ChatGPT:GPT-5.6-Thinking
> Signed-off-by: Ning Ding <dingning04@gmail.com>
> ---
>  .../selftests/bpf/progs/refcounted_kptr.c     | 61 +++++++++++++++++++
>  .../bpf/progs/refcounted_kptr_fail.c          | 47 ++++++++++++++
>  2 files changed, 108 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/=
testing/selftests/bpf/progs/refcounted_kptr.c
> index 61906f48025cc..fd35093285c0d 100644
> --- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> +++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> @@ -23,6 +23,15 @@ struct map_value {
>         struct node_data __kptr *node;
>  };
>
> +struct node_refcount_only {
> +       long key;
> +       struct bpf_refcount refcount;
> +};
> +
> +struct map_value_refcount_only {
> +       struct node_refcount_only __kptr *node;
> +};
> +
>  struct {
>         __uint(type, BPF_MAP_TYPE_ARRAY);
>         __type(key, int);
> @@ -30,6 +39,13 @@ struct {
>         __uint(max_entries, 2);
>  } stashed_nodes SEC(".maps");
>
> +struct {
> +       __uint(type, BPF_MAP_TYPE_ARRAY);
> +       __type(key, int);
> +       __type(value, struct map_value_refcount_only);
> +       __uint(max_entries, 1);
> +} stashed_refcount_only SEC(".maps");
> +
>  struct node_acquire {
>         long key;
>         long data;
> @@ -832,6 +848,51 @@ long rbtree_refcounted_node_ref_escapes_owning_input=
(void *ctx)
>         return 0;
>  }
>
> +SEC("tc")
> +__success
> +long refcount_acquire_owning_input_no_null_check(void *ctx)
> +{
> +       struct node_refcount_only *n, *m;
> +
> +       n =3D bpf_obj_new(typeof(*n));
> +       if (!n)
> +               return 1;
> +
> +       m =3D bpf_refcount_acquire(n);
> +       bpf_obj_drop(m);
> +       bpf_obj_drop(n);
> +
> +       return 0;
> +}
> +
> +SEC("tc")
> +__success
> +long refcount_acquire_rcu_map_kptr_null_checked(void *ctx)
> +{
> +       struct map_value_refcount_only *mapval;
> +       struct node_refcount_only *n, *m;
> +       int idx =3D 0;
> +
> +       mapval =3D bpf_map_lookup_elem(&stashed_refcount_only, &idx);
> +       if (!mapval)
> +               return 1;
> +
> +       bpf_rcu_read_lock();
> +       n =3D mapval->node;
> +       if (!n) {
> +               bpf_rcu_read_unlock();
> +               return 2;
> +       }
> +       m =3D bpf_refcount_acquire(n);
> +       bpf_rcu_read_unlock();
> +
> +       if (!m)
> +               return 3;
> +       bpf_obj_drop(m);
> +
> +       return 0;
> +}
> +
>  static long __stash_map_empty_xchg(struct node_data *n, int idx)
>  {
>         struct map_value *mapval =3D bpf_map_lookup_elem(&stashed_nodes, =
&idx);
> diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c b/t=
ools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
> index 024ef2aae2008..acd3e81a39168 100644
> --- a/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
> +++ b/tools/testing/selftests/bpf/progs/refcounted_kptr_fail.c
> @@ -19,6 +19,15 @@ struct node_refcounted {
>         struct bpf_refcount refcount;
>  };
>
> +struct node_refcount_only {
> +       long key;
> +       struct bpf_refcount refcount;
> +};
> +
> +struct map_value_refcount_only {
> +       struct node_refcount_only __kptr *node;
> +};
> +
>  extern void bpf_rcu_read_lock(void) __ksym;
>  extern void bpf_rcu_read_unlock(void) __ksym;
>
> @@ -28,6 +37,13 @@ private(A) struct bpf_rb_root groot __contains(node_ac=
quire, node);
>  private(B) struct bpf_spin_lock lock;
>  private(B) struct bpf_list_head head __contains(node_refcounted, list);
>
> +struct {
> +       __uint(type, BPF_MAP_TYPE_ARRAY);
> +       __type(key, int);
> +       __type(value, struct map_value_refcount_only);
> +       __uint(max_entries, 1);
> +} stashed_refcount_only SEC(".maps");
> +
>  static bool less(struct bpf_rb_node *a, const struct bpf_rb_node *b)
>  {
>         struct node_acquire *node_a;
> @@ -80,6 +96,37 @@ long refcount_acquire_maybe_null(void *ctx)
>         return 0;
>  }
>
> +SEC("?tc")
> +__failure __msg("Possibly NULL pointer passed to trusted R1")
> +long refcount_acquire_rcu_map_kptr_unchecked_drop(void *ctx)
> +{
> +       struct map_value_refcount_only *mapval;
> +       struct node_refcount_only *tmp, *n, *m;
> +       int idx =3D 0;
> +
> +       tmp =3D bpf_obj_new(typeof(*tmp));
> +       if (!tmp)
> +               return 3;
> +       bpf_obj_drop(tmp);

Could you explain the purpose of this chunk?

Otherwise, it looks good to me.

Reviewed-by: Amery Hung <ameryhung@gmail.com>

> +
> +       mapval =3D bpf_map_lookup_elem(&stashed_refcount_only, &idx);
> +       if (!mapval)
> +               return 1;
> +
> +       bpf_rcu_read_lock();
> +       n =3D mapval->node;
> +       if (!n) {
> +               bpf_rcu_read_unlock();
> +               return 2;
> +       }
> +       m =3D bpf_refcount_acquire(n);
> +       bpf_rcu_read_unlock();
> +
> +       bpf_obj_drop(m);
> +
> +       return 0;
> +}
> +
>  SEC("?tc")
>  __failure __msg("Unreleased reference id=3D3 alloc_insn=3D{{[0-9]+}}")
>  long rbtree_refcounted_node_ref_escapes_owning_input(void *ctx)
> --
> 2.43.0
>
>

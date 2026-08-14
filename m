Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8BB3D4121
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737442; cv=pass; b=p16r3WnD2sy+78xpKZKWK7rt6mQOtJEuPCZwueiCYzhTtNFgeFMcAq5hWHRV2kTSsPpOQrRZAyZImgFsbqFvA+S3la2RrGLGlXQX+XJx43jUUrxUZu778quG0ylLTE7+18IaA7ofuFo1e9c5pt1hHaFJy1HspJ66zjoPjTdWhqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737442; c=relaxed/simple;
	bh=D+PEs+ex4x+ZqgrHZ/mCR23C7ip1taoZmxaeLJJ0ixg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBV8VifiviUXpc++x67iw1W18ujgS6z4fYtOutRhAmFFcOqB6OGHaLe7UKzuNqpOtSfubqj/rkxuJ5hBruzyRbfqKL2sLzJVFawCirwYPEMzygnRU/4biZRfTLOOah7/W1ZMKOH+lH1KHPhCtXmOmcrHCsZNr/VFq+zJWYwdz+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd6R/e1G; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd6R/e1G"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so886542a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 12:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786737439; cv=none;
        d=google.com; s=arc-20260327;
        b=g9ibogo/IoM4LEfJk+mN1bXw53N1r0ovUZH9YxgS4YMq7pwvZSd8Keu11enWrK7k77
         PR61XEv9vZZwnH1bMhoFmd5Ciw04UcRk5gGHFqxfwpmvkL4eFX1xOvivGA+DW85ftnAn
         R349XEaB3M7Lei4jWxLPeVQ2iEk8V0jbYA8cAx3LeXxvWspdiciDnu2sOEfL5MWKNb2z
         QlbSu8LUTvzxJtJ3JlgYN0JUyoX71zTOgBWwntGmmn85e7yF2LAA0u4rnUbUxDHdLLBr
         PJy5QGr4HAtKlWcyZ5CmkGbZAabm1xfRCS66xpootBxkSiGKFVpZXlE6cY0yRQHisyRd
         Yi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GxRThMWsYWSqLjREEJH/Rk7+2XCwWI2hjqPniCOaR0g=;
        fh=8jVt79mc7LC+OqOGQuGs1bSsBrJkopK7mylLhHRqsjw=;
        b=hbUVerxEuGr2VNOFpTw1l+I9VJbde+c43nG/byTz5Cyiuddbgs0Vc7tFgGCKjqIqFx
         LEODKybQqQ0QJHPbGathxA/KQr2fVE+7xJ5MfvzCxkxoROOJdpHmlTO3XGwaQJb5Sxqq
         moBgbBXVUO4SzrxKvMrVGkL3DKDjAahzE55dMn7oKRM8sM7za15Tt8NmLbDRpUSC5mN2
         VTgwktLigoq9+JNarJYTrPSOF1rLufH/TZysMVqG6J9zVsNRsUoSLRfuDgLV5BZNG73u
         Zx1CcD4kldD2YbyNsvhLkdbx0mBbyVMjqTLQCPCFWtd+mZyy46iPE9en94XAD+RB00nt
         HEcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786737439; x=1787342239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GxRThMWsYWSqLjREEJH/Rk7+2XCwWI2hjqPniCOaR0g=;
        b=gd6R/e1Gf5a3da2JvJtVnYyAnNhxsOwpM+qK6Nltsz6+XqeM+prxZVesZOpsXI6rn1
         kWmzkWLcCmyDll339qVEan4nqXO+I1m4974FTe+lxhaV3O8cxLzxAn4BkH49DKm7LDrG
         gCSw38xFtWJ6YVgYDRYf7572Ul2Ede+ArQrk/NHksUEECQPaUfZpnHJxSJrp87fSJd0E
         EeFHIrhE8E+3aS8ZawReAUcDtSmAPc5T5HfptZC0hKsNCfp0iR2y//95UCAjBeI2AQVO
         CSxoqXMJgVLY6lIEQ9oJXTu/xfIZ3QKqQQ+0jPl8LIiNhbihoLzQsqI4s5Q89UimkJ0I
         dQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786737439; x=1787342239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GxRThMWsYWSqLjREEJH/Rk7+2XCwWI2hjqPniCOaR0g=;
        b=TknTrIBi+Wn/P484x4eZ4Ve+Nve8zfK57aBKk5rxR9i/n6avRJ+kvJUUmAt45eMAJJ
         jzNVOzssPExqJoJCAqrdOAcmt70I/Bi+sJ0iF2QEPTf1uKCvIG2LMmVZcqW8CAxmIhsy
         VT2u+SpmiIRgX9pK51qPuSKxOClYE6jtlyztMahIx39+UchHXHTaoGccCjKy73s/jGAQ
         fJK1NLEyUUg4yV/mqZukLX28ANvOiHQoNvL8U+oPM8VEvTXTIo6iY6Tfy+yxvq+u5O0N
         LkJDSHZYG+XMtQfjHms6aUngP+pP5sUtGnDCV7nsg56A2q73ucDAYgHnhcY3NQro7EWf
         hDHQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/xAIWcqnpgrmB/Cs4Y47+37VoAtChRmKmArsDj1nG6Z8Q2/NCRljYHRBdnsygUft/hZTOpsJh/iK5MOtY2jY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ZjTV82AwZnU3FX9QN2+AV5bSTMeoPc6Z85OI1X6sQ9BraDDJ
	NpzYngtfX7EHD4yxQUL7TO9nkRPG1+COmn17hHDtbvVZP+1KagDUDJXiU82WlI6rWZgObhhOAFM
	dBwQ1cHar6gVr2vlYThYZriD9a1V7xsU=
X-Gm-Gg: AR+sD11O5GJuHmLokBEI+sk7GTYLwnmzGZmC/FxW4bZg2xG9i3cVL+3OxDrGsqqVBrM
	E+y0WI/lT6PtGxELmA7RmIcW7vVT54+Vuo9W+V2QUXO88GB0EXPT/wN5pZyExTzMtE2YoRQiBkg
	VhTu9VP/A9/RHFSdS+NfUjiUKshNbTnlYhHG+KszeDddAdvF1N9RTUNCwOQbc4nrjtHVj77ySt+
	HhCKCKP+vugEJCGU/9Rvhed0aZavHvKdvc4tL1UqxlXRfmG+TxSMRs1PAkBPKNp0x00OyMCT74A
	b+nHNDQDyF+lee7Q2L0eYMmlw91tFiIVvwn64+NsBJchhxApaqhkuJU2kOpbuAxDMDS1hPFIGEj
	gqCzGZu8CSsvYIOd6GxBdpC0x3uROF+c8+RfE
X-Received: by 2002:a05:6a20:2446:b0:3b4:8880:2089 with SMTP id
 adf61e73a8af0-3cc71b16592mr9552678637.16.1786737438869; Fri, 14 Aug 2026
 12:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813032613.2755-1-zhaofuyu@vivo.com> <20260813032613.2755-2-zhaofuyu@vivo.com>
In-Reply-To: <20260813032613.2755-2-zhaofuyu@vivo.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 14 Aug 2026 12:57:06 -0700
X-Gm-Features: AUfX_mx5SZiJQYudo19PjEAX5yEv1Zoi1DZrDotx-9qc_B7k_-zVxtlfdVXTGn0
Message-ID: <CAEf4Bza54yCwkOte77jkwCM3W+Oo2eH4bL0xqHmvYg5kZnXbxw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 1/2] libbpf: support selective kernel
 module BTF loading via .kmod_btfs section
To: Fuyu Zhao <zhaofuyu@vivo.com>
Cc: bpf@vger.kernel.org, andrii@kernel.org, alan.maguire@oracle.com, 
	ast@kernel.org, daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	shuah@kernel.org, yatsenko@meta.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 8:26=E2=80=AFPM Fuyu Zhao <zhaofuyu@vivo.com> wrote=
:
>
> Add support for a new ELF section ".kmod_btfs" that allows BPF programs
> to declare which kernel modules need BTF loading. This avoids loading
> all module BTFs and speeds up program load when only a subset of modules
> is needed.
>
> Specifically, this patch introduces two internal functions:
>   - bpf_object__collect_kmod_btf_names(): parses the ".kmod_btfs"
>     section and collects the declared module names.
>   - is_kmod_btf_needed(): determines whether a given module's BTF
>     should be loaded, allowing libbpf to skip unneeded modules.
>
> Signed-off-by: Fuyu Zhao <zhaofuyu@vivo.com>
> ---
>  tools/lib/bpf/bpf_helpers.h |  14 +++++
>  tools/lib/bpf/libbpf.c      | 106 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
>
> diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> index 9d160b5b9c0e..171ea055cd32 100644
> --- a/tools/lib/bpf/bpf_helpers.h
> +++ b/tools/lib/bpf/bpf_helpers.h
> @@ -188,6 +188,20 @@ enum libbpf_tristate {
>         TRI_MODULE =3D 2,
>  };
>
> +/* Helper typedef for declaring kernel module names that need BTF loadin=
g.
> + *
> + * Usage: define an array in the ".kmod_btfs" ELF section to specify
> + * which modules need BTF loading:
> + *
> + *   DEFINE_KMOD_BTFS(_needed_kmods)=3D { "module1", "module2", ... };
> + *
> + * This avoids unnecessary BTF loading and speeds up the BPF program
> + * load process.
> + */
> +#define KMOD_NAME_LEN 64
> +#define DEFINE_KMOD_BTFS(name) \
> +       SEC(".kmod_btfs") char name[][KMOD_NAME_LEN]
> +

I don't really like another special ELF section just to provide a
custom list of modules.

If we have to do a customization of BTF searching behavior of libbpf,
let's do this through bpf_object_open_opts struct and pass NULL or a
empty/non-empty list of kernel modules, or whatever other appropriate
way to specify this.

But in any case, extending ELF format for BPF object file for this
seems like an overkill and overcomplication.

pw-bot: cr

>  #define __kconfig __attribute__((section(".kconfig")))
>  #define __ksym __attribute__((section(".ksyms")))
>  #define __kptr_untrusted __attribute__((btf_type_tag("kptr_untrusted")))
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index 514e4e9daa82..9fe8a653e8b6 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -548,6 +548,7 @@ struct bpf_struct_ops {
>  #define STRUCT_OPS_SEC ".struct_ops"
>  #define STRUCT_OPS_LINK_SEC ".struct_ops.link"
>  #define ARENA_SEC ".addr_space.1"
> +#define KMODS_BTFS_SEC ".kmod_btfs"
>
>  enum libbpf_map_type {
>         LIBBPF_MAP_UNSPEC,
> @@ -703,6 +704,9 @@ enum bpf_object_state {
>         OBJ_LOADED,
>  };
>
> +/* Should match the definition in bpf_helpers.h */
> +#define KMOD_NAME_LEN 64
> +
>  struct bpf_object {
>         char name[BPF_OBJ_NAME_LEN];
>         char license[64];
> @@ -779,6 +783,14 @@ struct bpf_object {
>         char *token_path;
>         int token_fd;
>
> +       /* kernel module BTFs to load, declared in ".kmod_btfs" ELF secti=
on */
> +       struct {
> +               char (*data)[KMOD_NAME_LEN];
> +               size_t nr_names;
> +               size_t nr_loaded;
> +               struct hashmap *hashmap;
> +       } *kmod_btfs;
> +
>         char path[];
>  };
>
> @@ -901,6 +913,75 @@ bpf_object__init_prog(struct bpf_object *obj, struct=
 bpf_program *prog,
>         return -ENOMEM;
>  }
>
> +static size_t mod_name_hash_fn(long key, void *ctx)
> +{
> +       return str_hash((char *)key);
> +}
> +
> +static bool mod_name_equal_fn(long key1, long key2, void *ctx)
> +{
> +       return strcmp((char *)key1, (char *)key2) =3D=3D 0;
> +}
> +
> +static int
> +bpf_object__collect_kmod_btf_names(struct bpf_object *obj, Elf_Data *sec=
_data,
> +                                  const char *sec_name)
> +{
> +       int module_cnt, i, err =3D 0;
> +
> +       if (obj->kmod_btfs) {
> +               pr_warn("sec '%s': duplicate sections detected\n", sec_na=
me);
> +               return -EEXIST;
> +       }
> +
> +       if (sec_data->d_size % KMOD_NAME_LEN !=3D 0) {
> +               pr_warn("sec '%s': size %zu should be multiple of %d\n",
> +                       sec_name, sec_data->d_size, KMOD_NAME_LEN);
> +               return -EINVAL;
> +       }
> +
> +       module_cnt =3D sec_data->d_size / KMOD_NAME_LEN;
> +       obj->kmod_btfs =3D calloc(1, sizeof(*obj->kmod_btfs));
> +       if (!obj->kmod_btfs)
> +               return -ENOMEM;
> +
> +       obj->kmod_btfs->data =3D calloc(module_cnt, KMOD_NAME_LEN);
> +       if (!obj->kmod_btfs->data) {
> +               err =3D -ENOMEM;
> +               goto err_out;
> +       }
> +       memcpy(obj->kmod_btfs->data, sec_data->d_buf, sec_data->d_size);
> +
> +       obj->kmod_btfs->hashmap =3D hashmap__new(mod_name_hash_fn,
> +                                              mod_name_equal_fn, NULL);
> +       if (IS_ERR(obj->kmod_btfs->hashmap)) {
> +               err =3D PTR_ERR(obj->kmod_btfs->hashmap);
> +               goto err_out;
> +       }
> +
> +       for (i =3D 0; i < module_cnt; i++) {
> +               obj->kmod_btfs->data[i][KMOD_NAME_LEN - 1] =3D '\0';
> +               if (hashmap__find(obj->kmod_btfs->hashmap,
> +                                 obj->kmod_btfs->data[i], NULL)) {
> +                       pr_warn("sec '%s': ignored duplicate module '%s'\=
n",
> +                               sec_name, obj->kmod_btfs->data[i]);
> +                       continue;
> +               }
> +               err =3D hashmap__set(obj->kmod_btfs->hashmap, obj->kmod_b=
tfs->data[i],
> +                                  0, NULL, NULL);
> +               if (err)
> +                       goto err_out;
> +               obj->kmod_btfs->nr_names++;
> +       }
> +       return 0;
> +
> +err_out:
> +       hashmap__free(obj->kmod_btfs->hashmap);
> +       zfree(&obj->kmod_btfs->data);
> +       zfree(&obj->kmod_btfs);
> +       return err;
> +}
> +
>  static int
>  bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
>                          const char *sec_name, int sec_idx)
> @@ -4034,6 +4115,10 @@ static int bpf_object__elf_collect(struct bpf_obje=
ct *obj)
>                                 memcpy(obj->jumptables_data, data->d_buf,=
 data->d_size);
>                                 obj->jumptables_data_sz =3D data->d_size;
>                                 obj->efile.jumptables_data_shndx =3D idx;
> +                       } else if (strcmp(name, KMODS_BTFS_SEC) =3D=3D 0)=
 {
> +                               err =3D bpf_object__collect_kmod_btf_name=
s(obj, data, name);
> +                               if (err)
> +                                       return err;
>                         } else {
>                                 pr_info("elf: skipping unrecognized data =
section(%d) %s\n",
>                                         idx, name);
> @@ -5803,6 +5888,11 @@ int bpf_core_add_cands(struct bpf_core_cand *local=
_cand,
>         return 0;
>  }
>
> +static bool is_kmod_btf_needed(struct bpf_object *obj, const char *name)
> +{
> +       return hashmap_find(obj->kmod_btfs->hashmap, (long)name, NULL);
> +}
> +
>  static int load_module_btfs(struct bpf_object *obj)
>  {
>         struct bpf_btf_info info;
> @@ -5867,6 +5957,12 @@ static int load_module_btfs(struct bpf_object *obj=
)
>                         continue;
>                 }
>
> +               if (obj->kmod_btfs && obj->kmod_btfs->hashmap &&
> +                   !is_kmod_btf_needed(obj, name)) {
> +                       close(fd);
> +                       continue;
> +               }
> +
>                 btf =3D btf_get_from_fd(fd, obj->btf_vmlinux);
>                 err =3D libbpf_get_error(btf);
>                 if (err) {
> @@ -5891,6 +5987,10 @@ static int load_module_btfs(struct bpf_object *obj=
)
>                         break;
>                 }
>                 obj->btf_module_cnt++;
> +
> +               if (obj->kmod_btfs &&
> +                   obj->kmod_btfs->nr_names =3D=3D obj->kmod_btfs->nr_lo=
aded)
> +                       break;
>         }
>
>         if (err) {
> @@ -9030,6 +9130,12 @@ static void bpf_object_cleanup_btf(struct bpf_obje=
ct *obj)
>         /* clean up vmlinux BTF */
>         btf__free(obj->btf_vmlinux);
>         obj->btf_vmlinux =3D NULL;
> +
> +       if (obj->kmod_btfs) {
> +               hashmap__free(obj->kmod_btfs->hashmap);
> +               zfree(&obj->kmod_btfs->data);
> +               zfree(&obj->kmod_btfs);
> +       }
>  }
>
>  static void bpf_object_post_load_cleanup(struct bpf_object *obj)
> --
> 2.34.1
>

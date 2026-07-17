Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0622641EE
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784324394; cv=none; b=m09b/EV1o7vraqaMuil+u74N+O3ySOVQedYOD7/DBl5isJfmLASyUGlwcx+ejj4QPcCIfuZRwnxLmvBmqLRs25kXXyr82KpNDnb3hEb+cIbLUg/xHTGh6qxhzXRVW3a9X3pgUsBPiho4dWHQyLgkl707us53+N9DIkUtjvr/3do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784324394; c=relaxed/simple;
	bh=E4wdm/JHilOfTkch4NAnjBcb34Klj3P9RyhUqviGVZw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f5tTEqh8GqV7f6B+mxUxAOt5dY2S4wHBlNiBAKqPI0rvzJ64777ZG1oE+oD8kvk97MpGS3waxg/J3qN37dmnhUtba6au2M0CVEtsDLrkaVItrniIJfBBvzGDrDyIn0nTAEHA5zBugXMcvDfSNTdKS/G9GieTMeTSQgLfEwMh1Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=SO6/LlRf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="SO6/LlRf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e7391839cso4471233a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 14:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784324392; x=1784929192; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0fmiqHEMdfZMYTGboSk0RrmkywWGnqg/2XcWYW1aXhQ=;
        b=SO6/LlRfwXl0YorjJskUi2t5kc/hgueqIso64NBDk7Ts4zEZuwQCt/sQlO3QE8jxgD
         Tt+R/vM08O59DpaKqGA9bRpVL7nwKAveyZqMrfUsi0XYNAVuoV0TynVfxRawxNp4UDXO
         zwGjulKhC7nI4rFihB8kqIpUxBPb+Aa6Zovn8Dd9OuW67QH6PgDSy6+4a9kTHjMW2Ikj
         9qDA6popbeiarv67w5+1fL2cqG7mIPQAM8GfMQ2AZMb6wg12DiTPj60IpGBnPGXtIYyP
         kfbbAejBEet41eQ7MHmtNvp6+eLNDug4thyXkANUGQmQRRzLTNpG2NuDhZIpp5ZS7jCh
         RzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784324392; x=1784929192;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fmiqHEMdfZMYTGboSk0RrmkywWGnqg/2XcWYW1aXhQ=;
        b=CUUs6uKHSGEDbafCv5S8ijpsodAnSxiktCMsRE5BeAWu7LLoEt2l0boQmwJvbLYsuO
         +YTrm2Nn3kXiCsrHPssstOhhyoTD7oN1jArPOB76o5JMf9FYssKPGX8NpGbXWxfpoCYV
         evG9+gBjvq8QTuQFYUjsVYLl56h1JYo6Z+cIyJR5BrRdlFwOgTNGwD7abu2gGmxtZH4Q
         n0hROI1b5VUGKUMuF5mQI+umzF8+3LiLu4f9FCAwvImUPuIyEZ1lDYpknh8/uWJ/G8wU
         7K9SxUPGwWjYxFn4GKbowd9YGWwyDWXqSfVhwBvvwwDcJZSoF9APLMzLgEQCMco9M1q2
         YdXA==
X-Forwarded-Encrypted: i=1; AHgh+RpsDmZcZoW9Ry6RimoFeKdT4Q2ExZ5bdDEM8onV19OBx8/5ahwCbWZTR7yRflGFLEaejCFsrEZTwU5Q4rx3VL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT14V7nzDo1tDCvTLTNqn8j0I7MhhO6z2+39DL+Kax7OZ3f8Fa
	4hX7vOMJR8V4axWuqq1Rs/m9wLa8k2r9a7VVB/64DFah3OkYj4p1fO8/C7lTFbb33CU=
X-Gm-Gg: AfdE7clGoGjYw3D12+CfR85cPntTcNfVS3HXO85fAAjhx0tfBWfvS18UqjB/74RU6Rk
	9XzWmwIGJhVlfQdxggTNJYFaoWXRzU5NeW9yoHPKXaSQMoQNwEesP3Grolv6EoZIVJT9OenGOI0
	rLryuEKrvp65ZNEFkwVdtQTxj8x8EIVF5zIkN/jC+WZIMbUa3YI3Dl2DIXkP4F1JhYRrg9W/WZV
	v2Ww5nmge6bOyaD++QnXCMFCBKZrILA71TABeIzlC8kOZ9BUiXd1SUkwrHQYUwXn00ydURrviWE
	RT4NOAa+OlzDHVO9jZK21udgN19YKv67cZG8WP1tf8wrqi/sTYVkQbbiq+H4mVoQF/AomoQ106w
	rFnXNZZpIIUC/fGZrqOTwyIv3mZhxqcpNlh+PjD9bwVBlqvlDDhxP/jKQutE=
X-Received: by 2002:a05:6a20:6a25:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3c3ad8eca10mr5252266637.40.1784324392341;
        Fri, 17 Jul 2026 14:39:52 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::f5f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm10480177eec.31.2026.07.17.14.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 14:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 17:39:49 -0400
Message-Id: <DK167GCPUAJE.3GGIPEE5MIX3G@etsalapatis.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Quentin Monnet"
 <qmo@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>
Subject: Re: [PATCH bpf-next v10 4/9] libbpf: Add support for global percpu
 data
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-5-leon.hwang@linux.dev>
In-Reply-To: <20260715153254.92010-5-leon.hwang@linux.dev>

On Wed Jul 15, 2026 at 11:32 AM EDT, Leon Hwang wrote:
> Add support for global percpu data in libbpf by adding a new ".percpu"
> section, similar to ".data". It enables efficient handling of percpu
> global variables in bpf programs.
>
> When generating loader for lightweight skeleton, update the percpu_array
> map used for global percpu data using BPF_F_ALL_CPUS, in order to update
> values across all CPUs using one value slot.
>
> Unlike global data, the mmaped data for global percpu data will be marked
> as read-only after populating the percpu_array map. Thereafter, users can
> read those initialized percpu data after loading prog. If they want to
> update the percpu data after loading prog, they have to update the
> percpu_array map using key=3D0 instead.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  tools/lib/bpf/bpf_gen_internal.h |  3 +-
>  tools/lib/bpf/gen_loader.c       |  3 +-
>  tools/lib/bpf/libbpf.c           | 72 +++++++++++++++++++++++++++-----
>  3 files changed, 65 insertions(+), 13 deletions(-)
>
> diff --git a/tools/lib/bpf/bpf_gen_internal.h b/tools/lib/bpf/bpf_gen_int=
ernal.h
> index 042569187752..6c5ad6c55e8a 100644
> --- a/tools/lib/bpf/bpf_gen_internal.h
> +++ b/tools/lib/bpf/bpf_gen_internal.h
> @@ -65,7 +65,8 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
>  			enum bpf_prog_type prog_type, const char *prog_name,
>  			const char *license, struct bpf_insn *insns, size_t insn_cnt,
>  			struct bpf_prog_load_opts *load_attr, int prog_idx);
> -void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *va=
lue, __u32 value_size);
> +void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *va=
lue, __u32 value_size,
> +			      __u64 flags);
>  void bpf_gen__map_freeze(struct bpf_gen *gen, int map_idx);
>  void bpf_gen__record_attach_target(struct bpf_gen *gen, const char *name=
, enum bpf_attach_type type);
>  void bpf_gen__record_extern(struct bpf_gen *gen, const char *name, bool =
is_weak,
> diff --git a/tools/lib/bpf/gen_loader.c b/tools/lib/bpf/gen_loader.c
> index 6e3dd5242761..af3a04f161ac 100644
> --- a/tools/lib/bpf/gen_loader.c
> +++ b/tools/lib/bpf/gen_loader.c
> @@ -1128,7 +1128,7 @@ void bpf_gen__prog_load(struct bpf_gen *gen,
>  }
> =20
>  void bpf_gen__map_update_elem(struct bpf_gen *gen, int map_idx, void *pv=
alue,
> -			      __u32 value_size)
> +			      __u32 value_size, __u64 flags)
>  {
>  	int attr_size =3D offsetofend(union bpf_attr, flags);
>  	int map_update_attr, value, key;
> @@ -1136,6 +1136,7 @@ void bpf_gen__map_update_elem(struct bpf_gen *gen, =
int map_idx, void *pvalue,
>  	int zero =3D 0;
> =20
>  	memset(&attr, 0, attr_size);
> +	attr.flags =3D tgt_endian(flags);
> =20
>  	value =3D add_data(gen, pvalue, value_size);
>  	key =3D add_data(gen, &zero, sizeof(zero));
> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> index f88b7c8de304..e4104d18521b 100644
> --- a/tools/lib/bpf/libbpf.c
> +++ b/tools/lib/bpf/libbpf.c
> @@ -541,6 +541,7 @@ struct bpf_struct_ops {
>  };
> =20
>  #define DATA_SEC ".data"
> +#define PERCPU_SEC ".percpu"
>  #define BSS_SEC ".bss"
>  #define RODATA_SEC ".rodata"
>  #define KCONFIG_SEC ".kconfig"
> @@ -555,6 +556,7 @@ enum libbpf_map_type {
>  	LIBBPF_MAP_BSS,
>  	LIBBPF_MAP_RODATA,
>  	LIBBPF_MAP_KCONFIG,
> +	LIBBPF_MAP_PERCPU,
>  };
> =20
>  struct bpf_map_def {
> @@ -666,6 +668,7 @@ enum sec_type {
>  	SEC_DATA,
>  	SEC_RODATA,
>  	SEC_ST_OPS,
> +	SEC_PERCPU,
>  };
> =20
>  struct elf_sec_desc {
> @@ -1839,6 +1842,8 @@ static size_t bpf_map_mmap_sz(const struct bpf_map =
*map)
>  	switch (map->def.type) {
>  	case BPF_MAP_TYPE_ARRAY:
>  		return array_map_mmap_sz(map->def.value_size, map->def.max_entries);
> +	case BPF_MAP_TYPE_PERCPU_ARRAY:
> +		return map->def.value_size;
>  	case BPF_MAP_TYPE_ARENA:
>  		return page_sz * map->def.max_entries;
>  	default:
> @@ -1866,7 +1871,8 @@ static int bpf_map_mmap_resize(struct bpf_map *map,=
 size_t old_sz, size_t new_sz
>  	return 0;
>  }
> =20
> -static char *internal_map_name(struct bpf_object *obj, const char *real_=
name)
> +static char *internal_map_name(struct bpf_object *obj, const char *real_=
name,
> +			       enum libbpf_map_type type)

We can avoid passing the type here by testing against ".percpu" since
that's how we are deriving the map type in the first place. But more
importantly:

>  {
>  	char map_name[BPF_OBJ_NAME_LEN], *p;
>  	int pfx_len, sfx_len =3D max((size_t)7, strlen(real_name));
> @@ -1907,8 +1913,11 @@ static char *internal_map_name(struct bpf_object *=
obj, const char *real_name)
>  	if (sfx_len >=3D BPF_OBJ_NAME_LEN)
>  		sfx_len =3D BPF_OBJ_NAME_LEN - 1;
> =20
> -	/* if there are two or more dots in map name, it's a custom dot map */
> -	if (strchr(real_name + 1, '.') !=3D NULL)
> +	/*
> +	 * Don't prefix the bpf_object name if this is a custom dot map
> +	 * (containing two or more dots) or a percpu data map.
> +	 */
> +	if (strchr(real_name + 1, '.') !=3D NULL || type =3D=3D LIBBPF_MAP_PERC=
PU)

Is there a reason we don't use the exact same logic as the other
internal maps here? I understand that a lot of the conventions around
the naming are there for legacy reasons, but it seems like we're
singling out the .percpu section for highly nonbvious reasons. Imo we
should consider doing the same prefixing for a bare ".percpu" section
that we do for the other internal ones. At the very least, there needs
to be some explanation as to why .percpu gets special treatment.

@Andrii Wdyt?=20

>  		pfx_len =3D 0;
>  	else
>  		pfx_len =3D min((size_t)BPF_OBJ_NAME_LEN - sfx_len - 1, strlen(obj->na=
me));
> @@ -1938,7 +1947,7 @@ static bool map_is_mmapable(struct bpf_object *obj,=
 struct bpf_map *map)
>  	struct btf_var_secinfo *vsi;
>  	int i, n;
> =20
> -	if (!map->btf_value_type_id)
> +	if (!map->btf_value_type_id || map->libbpf_type =3D=3D LIBBPF_MAP_PERCP=
U)
>  		return false;

Nit: These are two separate checks rolled into one, and each one checks
a different thing. THe type check against MAP_PERCPU merits a comment as
well: It's the only internal section that is not really mappable because
there's no way to represent it as userspace state.

> =20
>  	t =3D btf__type_by_id(obj->btf, map->btf_value_type_id);
> @@ -1962,6 +1971,7 @@ static int
>  bpf_object__init_internal_map(struct bpf_object *obj, enum libbpf_map_ty=
pe type,
>  			      const char *real_name, int sec_idx, void *data, size_t data_sz)
>  {
> +	bool is_percpu =3D type =3D=3D LIBBPF_MAP_PERCPU;
>  	struct bpf_map_def *def;
>  	struct bpf_map *map;
>  	size_t mmap_sz;
> @@ -1975,7 +1985,7 @@ bpf_object__init_internal_map(struct bpf_object *ob=
j, enum libbpf_map_type type,
>  	map->sec_idx =3D sec_idx;
>  	map->sec_offset =3D 0;
>  	map->real_name =3D strdup(real_name);
> -	map->name =3D internal_map_name(obj, real_name);
> +	map->name =3D internal_map_name(obj, real_name, type);
>  	if (!map->real_name || !map->name) {
>  		zfree(&map->real_name);
>  		zfree(&map->name);
> @@ -1983,7 +1993,7 @@ bpf_object__init_internal_map(struct bpf_object *ob=
j, enum libbpf_map_type type,
>  	}
> =20
>  	def =3D &map->def;
> -	def->type =3D BPF_MAP_TYPE_ARRAY;
> +	def->type =3D is_percpu ? BPF_MAP_TYPE_PERCPU_ARRAY : BPF_MAP_TYPE_ARRA=
Y;
>  	def->key_size =3D sizeof(int);
>  	def->value_size =3D data_sz;
>  	def->max_entries =3D 1;
> @@ -1996,8 +2006,9 @@ bpf_object__init_internal_map(struct bpf_object *ob=
j, enum libbpf_map_type type,
>  	if (map_is_mmapable(obj, map))
>  		def->map_flags |=3D BPF_F_MMAPABLE;
> =20
> -	pr_debug("map '%s' (global data): at sec_idx %d, offset %zu, flags %x.\=
n",
> -		 map->name, map->sec_idx, map->sec_offset, def->map_flags);
> +	pr_debug("map '%s' (global %sdata): at sec_idx %d, offset %zu, flags %x=
.\n",
> +		 map->name, is_percpu ? "percpu " : "", map->sec_idx,
> +		 map->sec_offset, def->map_flags);
> =20
>  	mmap_sz =3D bpf_map_mmap_sz(map);
>  	map->mmaped =3D mmap(NULL, mmap_sz, PROT_READ | PROT_WRITE,
> @@ -2057,6 +2068,13 @@ static int bpf_object__init_global_data_maps(struc=
t bpf_object *obj)
>  							    NULL,
>  							    sec_desc->data->d_size);
>  			break;
> +		case SEC_PERCPU:
> +			sec_name =3D elf_sec_name(obj, elf_sec_by_idx(obj, sec_idx));
> +			err =3D bpf_object__init_internal_map(obj, LIBBPF_MAP_PERCPU,
> +							    sec_name, sec_idx,
> +							    sec_desc->data->d_buf,
> +							    sec_desc->data->d_size);
> +			break;
>  		default:
>  			/* skip */
>  			break;
> @@ -4016,6 +4034,11 @@ static int bpf_object__elf_collect(struct bpf_obje=
ct *obj)
>  				sec_desc->sec_type =3D SEC_RODATA;
>  				sec_desc->shdr =3D sh;
>  				sec_desc->data =3D data;
> +			} else if (strcmp(name, PERCPU_SEC) =3D=3D 0 ||
> +				   str_has_pfx(name, PERCPU_SEC ".")) {
> +				sec_desc->sec_type =3D SEC_PERCPU;
> +				sec_desc->shdr =3D sh;
> +				sec_desc->data =3D data;
>  			} else if (strcmp(name, STRUCT_OPS_SEC) =3D=3D 0 ||
>  				   strcmp(name, STRUCT_OPS_LINK_SEC) =3D=3D 0 ||
>  				   strcmp(name, "?" STRUCT_OPS_SEC) =3D=3D 0 ||
> @@ -4544,6 +4567,7 @@ static bool bpf_object__shndx_is_data(const struct =
bpf_object *obj,
>  	case SEC_BSS:
>  	case SEC_DATA:
>  	case SEC_RODATA:
> +	case SEC_PERCPU:
>  		return true;
>  	default:
>  		return false;
> @@ -4569,6 +4593,8 @@ bpf_object__section_to_libbpf_map_type(const struct=
 bpf_object *obj, int shndx)
>  		return LIBBPF_MAP_DATA;
>  	case SEC_RODATA:
>  		return LIBBPF_MAP_RODATA;
> +	case SEC_PERCPU:
> +		return LIBBPF_MAP_PERCPU;
>  	default:
>  		return LIBBPF_MAP_UNSPEC;
>  	}
> @@ -4944,7 +4970,7 @@ static int map_fill_btf_type_info(struct bpf_object=
 *obj, struct bpf_map *map)
> =20
>  	/*
>  	 * LLVM annotates global data differently in BTF, that is,
> -	 * only as '.data', '.bss' or '.rodata'.
> +	 * only as '.data', '.bss', '.percpu' or '.rodata'.
>  	 */
>  	if (!bpf_map__is_internal(map))
>  		return -ENOENT;
> @@ -5293,18 +5319,30 @@ static int
>  bpf_object__populate_internal_map(struct bpf_object *obj, struct bpf_map=
 *map)
>  {
>  	enum libbpf_map_type map_type =3D map->libbpf_type;
> +	bool is_percpu =3D map_type =3D=3D LIBBPF_MAP_PERCPU;

Nit: If we do=20
	__u64 update_flags =3D is_percpu ? BPF_F_ALL_CPUS : 0;

we can declare the variable as const and ...

> +	__u64 update_flags =3D 0;
>  	int err, zero =3D 0;
>  	size_t mmap_sz;
> =20
> +	if (is_percpu) {
> +		if (!obj->gen_loader && !kernel_supports(obj, FEAT_PERCPU_DATA)) {
> +			pr_warn("map '%s': kernel does not support percpu data.\n",
> +				bpf_map__name(map));
> +			return -EOPNOTSUPP;
> +		}
> +
> +		update_flags =3D BPF_F_ALL_CPUS;
> +	}

... we can collapse the above into a single nested level:

	if (is_percpu && !obj->gen_loader && !kernel_supports(obj, FEAT_PERCPU_DAT=
A)) {
		...
	}

> +
>  	if (obj->gen_loader) {
>  		bpf_gen__map_update_elem(obj->gen_loader, map - obj->maps,
> -					 map->mmaped, map->def.value_size);
> +					 map->mmaped, map->def.value_size, update_flags);
>  		if (map_type =3D=3D LIBBPF_MAP_RODATA || map_type =3D=3D LIBBPF_MAP_KC=
ONFIG)
>  			bpf_gen__map_freeze(obj->gen_loader, map - obj->maps);
>  		return 0;
>  	}
> =20
> -	err =3D bpf_map_update_elem(map->fd, &zero, map->mmaped, 0);
> +	err =3D bpf_map_update_elem(map->fd, &zero, map->mmaped, update_flags);
>  	if (err) {
>  		err =3D -errno;
>  		pr_warn("map '%s': failed to set initial contents: %s\n",
> @@ -5349,6 +5387,13 @@ bpf_object__populate_internal_map(struct bpf_objec=
t *obj, struct bpf_map *map)
>  			return err;
>  		}
>  		map->mmaped =3D mmaped;
> +	} else if (is_percpu) {
> +		if (mprotect(map->mmaped, mmap_sz, PROT_READ)) {
> +			err =3D -errno;
> +			pr_warn("map '%s': failed to mprotect() contents: %s\n",
> +				bpf_map__name(map), errstr(err));
> +			return err;
> +		}
>  	} else if (map->mmaped) {
>  		munmap(map->mmaped, mmap_sz);
>  		map->mmaped =3D NULL;
> @@ -10807,11 +10852,16 @@ static bool map_uses_real_name(const struct bpf=
_map *map)
>  	 * such map's corresponding ELF section name as a map name.
>  	 * This check distinguishes .data/.rodata from .data.* and .rodata.*
>  	 * maps to know which name has to be returned to the user.
> +	 * Map name of the custom .percpu.* maps might be truncated to
> +	 * BPF_OBJ_NAME_LEN-1 chars in internal_map_name(). Hence, percpu data
> +	 * maps must use real name for their user-visible name.
>  	 */
>  	if (map->libbpf_type =3D=3D LIBBPF_MAP_DATA && strcmp(map->real_name, D=
ATA_SEC) !=3D 0)
>  		return true;
>  	if (map->libbpf_type =3D=3D LIBBPF_MAP_RODATA && strcmp(map->real_name,=
 RODATA_SEC) !=3D 0)
>  		return true;
> +	if (map->libbpf_type =3D=3D LIBBPF_MAP_PERCPU)
> +		return true;

Same comment as above here wrt uniformity. This is the part that
requires us to check agianst the map type in __init_internal_map().

>  	return false;
>  }
> =20


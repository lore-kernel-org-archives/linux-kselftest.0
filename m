Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1434A0EF6
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014313; cv=none; b=ELUvvdVRRVW1raSxU7FamBRn/Ou9aIMKMGSL9M4WmfMIMeT8B701O0pn9GW8nSwiDgBbRf7iSYOZ4FEoZRY6QNmxLQupdJLuhRMLrZja2ux/vuhdQ5ai9nha5Mx4GGIL/ld9rv7YrK/fnZu5YolOwbd8m40O0Uz9NUDRY3nZ6yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014313; c=relaxed/simple;
	bh=0ZTSOvLPpcGRwqyN5BDZjWGpfTwuRbDfqUoQiVm6QnM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4pgMSlyHjpFAATNfpg6p/NitjljChhKP0JREs3o7XNv6TzwF82Cx9rhB275b/+HgpGPnQBA66lM3wfe3W0m2eZIfp6kstEAP0O8tvIlBrtbXoSlgezE2LZqoCswOzSTSqFNfjn0o30/DPGFbna5dXz07UT7Hp1ZEkxI7aAqOcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8e8L0hB; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8e8L0hB"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c6f764f82so436498f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792014310; x=1792619110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYwmofQDCDn8korfzzaOGpjDzGREvYtvvSRPaGLYBs4=;
        b=m8e8L0hBlfEHnHvgXcPV1GkVMzjSyVPjEtxx6TFqKwbY5VDtgk8+iWpTVp4WxYKwaV
         vN46WE69yXf4FXxSyCU+KmpNms37zDVcHKJuNNVUpTfCHvvTunyg5w5iuOPMwLyY+0bo
         wVGwkjYNeAqt8eBGfwLliW5i2HEy91xXcB7HX+BjtWbYJ7aEt9UKm46is0HhCEu5LdMp
         MIGulu0aVMtLlkEI9pr/v/wlhBOAr+3XPejxKuXPLzVLlCv0Wl/WAt6Uh+pET9jH2LQ+
         PmymPGJop0y2VzOfWb0bkrSqXe9Gsu6M7Ro4JfzZZoIBANHz1KcLAXItQRXxgsK/8yio
         dsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014310; x=1792619110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYwmofQDCDn8korfzzaOGpjDzGREvYtvvSRPaGLYBs4=;
        b=kzlqXfnyD4YT2dNc+yu0v9QiF5/6fKBsO1TXWorFmdP/VjYuGlPKFsp/hTNbEqEmF7
         lS5mI1JehSKXf6qif9xqkAh9qUzlirJoVlqNRULAKVV8oyAriiOFOCshPNxD+jwoFfyb
         RoHV9rSJuwC/M/LaQjgfNgt6XB7NX7H4LiJ6po3zMBaF9mZRlf8skD9shG6BkhyC31DO
         QuZbYfgffXACUcTOogSp7jrwFtJoOZiK6zP9ztw2/5lxdzXkbxmxFJI2tIptOXxvA093
         6RFSZ9V9ZuAT4EbwWdGZfLnjWlGN6zDhavvXyOoy1N/HpDi/GtmknGZ6NwAaosZabbfw
         Z3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJJkSLpnp/hPdwDK1iOkRKTtDcVvmPtmxCpQ8i9DOhE2yBi5aNNN7hlIh/Y1DX0xDxdzneD4x3bHjy4ALD0OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYKTQwNDLBBS6npn0UtdyffJrEptyv1gsxgUDlkt8Sf9wV4XvG
	9RuamcjMn3FWVxZBm2sfYxUMWxSQHWhlcRlvxgHhd3QY7us6adhyRN4I
X-Gm-Gg: AYBFou1Ybsxwc1zAqYI3f4nCTmT0zJx9JtkN0u/EI/FI1sA8BALAYy0U9ykTZHo9/Yp
	P5hnIPv2ZmdUMI8DXXz5UVtFcdFwls8iM+bdzV/51CLLKB+iAE+I9fT0sUT+lY9JEb2fGF+D3Xz
	KHLOdka6mRsrvPqXQ9CuENN4giFEBWS6Fg2XEDjof9RJdaMZAlP4l/5bG1LtoEJ//qxZQcHWOf9
	ieHGy88vU7n3OLvQzsOCFiPYDOAlcqJik7EF5q/W25gPA0reCjXWJ657k9CgODUhnGSrkAeyxOX
	lZzYVSWdjeisOp2nK/LemRUPk3PdoqNmppIBGTe8fo5/4DT+9f4DiTzd19s2JlhxujZQTDZp/SP
	9TNdkrBl3/H3Iu2tOWBHAZaHUkcdXdUkxwkuxmd2xYz/c34olB1muBTV1sQj1FZPQxDB+Lddgni
	ieUVSS+xqGi3dW/PXPjaCHAfaAIl6l/7O8AtkNmTncTCLKkU8bbVPuhafJVg==
X-Received: by 2002:adf:f549:0:b0:487:489:7af0 with SMTP id ffacd0b85a97d-48dbaadde34mr25680625f8f.17.1792014309866;
        Wed, 14 Oct 2026 14:45:09 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0514ab1sm18967193f8f.0.2026.10.14.14.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:45:09 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Oct 2026 23:45:07 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mykyta Yatsenko <yatsenko@meta.com>,
	Avinash Duduskar <avinash.duduskar@gmail.com>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Amery Hung <ameryhung@gmail.com>, Jordan Rife <jordan@jrife.io>,
	Rong Tao <rongtao@cestc.cn>, Eyal Birger <eyal.birger@gmail.com>,
	Pu Lehui <pulehui@huawei.com>, Jingguo Tan <tanjingguo@huawei.com>,
	Lin Ma <malin89@huawei.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 11/21] bpf: Add tracing_multi link support
 for bpf progs
Message-ID: <as_349cckxgUQM2U@krava>
References: <20261012154024.29423-1-leon.hwang@linux.dev>
 <20261012154024.29423-12-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012154024.29423-12-leon.hwang@linux.dev>

On Mon, Oct 12, 2026 at 11:40:13PM +0800, Leon Hwang wrote:

SNIP

> @@ -3787,64 +3796,129 @@ static const struct bpf_link_ops bpf_tracing_multi_link_lops = {
>  #endif
>  };
>  
> -static int ids_cmp_r(const void *pa, const void *pb, const void *priv __maybe_unused)
> +struct tracing_multi_sort_data {
> +	u64 *keys;
> +	struct bpf_prog **progs;
> +	u32 *ids;
> +	u64 *cookies;
> +};
> +
> +static int keys_cmp_r(const void *pa, const void *pb, const void *priv __maybe_unused)
>  {
> -	u32 a = *(u32 *) pa;
> -	u32 b = *(u32 *) pb;

I think you could just s/32/64/ and keep the rest in here and have simpler diff

> +	const u64 *key_a = pa, *key_b = pb;
>  
> -	return (a > b) - (a < b);
> +	return (*key_a > *key_b) - (*key_a < *key_b);
>  }
>  
> -static void ids_swap_r(void *a, void *b, int size __maybe_unused,
> -		       const void *priv __maybe_unused)
> +static void keys_swap_r(void *a, void *b, int size __maybe_unused,
> +			const void *priv __maybe_unused)
>  {
> +	const struct tracing_multi_sort_data *data = priv;
> +	struct bpf_prog **prog_a, **prog_b;
>  	u64 *cookie_a, *cookie_b, *cookies;
> -	u32 *id_a = a, *id_b = b, *ids;
> -	void **data = (void **) priv;
> +	u64 *key_a = a, *key_b = b, *keys;
> +	u32 *id_a, *id_b, *ids;
> +
> +	keys    = data->keys;
> +	ids     = data->ids;
> +	cookies = data->cookies;
> +	id_a    = ids + (key_a - keys);
> +	id_b    = ids + (key_b - keys);
>  
> -	ids     = data[0];
> -	cookies = data[1];
> +	if (data->progs) {

nit, let's unify with the rest of the code and have progs variable for data->progs ?

SNIP

> -	err = check_dup_ids(ids, cookies, cnt);
> +	keys = kvmalloc_objs(*keys, cnt);
> +	if (!keys) {
> +		err = -ENOMEM;
> +		goto error;
> +	}
> +
> +	for (int i = 0; i < cnt; i++)
> +		keys[i] = bpf_trampoline_compute_key(progs ? progs[i] : NULL, btf, ids[i]);
> +
> +	err = check_dup_keys(keys, progs, ids, cookies, cnt);
>  	if (err)
>  		goto error;
>  
> @@ -3908,19 +4022,32 @@ int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
>  	link->nodes_cnt = cnt;
>  	link->cookies = cookies;
>  	link->fexits = fexits;
> +	link->tgt_progs = progs;
> +	link->pokes = pokes;
>  
> -	err = bpf_trampoline_multi_attach(prog, ids, link);
> +	if (progs)
> +		err = bpf_trampoline_multi_prog_attach(prog, ids, keys, link);

you need keys computed ahead for dups check, so let's the above
bpf_trampoline_compute_key calls be the single place we compute keys
and pass keys to bpf_trampoline_multi_attach below as well?

> +	else
> +		err = bpf_trampoline_multi_attach(prog, ids, link);

nit, let's add empty line in here?

>  	kvfree(ids);
> +	kvfree(keys);
> +	kvfree(fds);
>  	if (err) {
> +		bpf_put_progs(progs, cnt);
>  		bpf_link_cleanup(&link_primer);
>  		return err;
>  	}
>  	return bpf_link_settle(&link_primer);

thanks,
jirka

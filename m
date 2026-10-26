Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006905;
	b=uYHSnH9qFEGNxR68x1jGwcghkkleMPOmZpKO839VYr7tTBbquTx0Yex9IcQ/2Ub4kaJt
	 7vRk5cJ2+k0ELZRFAJ9A7bl2lajoTNi3zqm/LVhLro3Mab5AtZCQqp6T+KAvJsOvsS5HP
	 Uf2rg80Ldher5IUktbIjVDz3Bghlf2FF923u0xAXgjzjn9/zwXn/TdcogRPduJ7vqdMlr
	 l738k0GRPpzcr7NLSGpmCweYRLXZQQAgfRCIBREvrYoV1Ny4nCVGVkGY4oOnPf2ZNmeZx
	 hT0uhf8ZYBgtUARKKu+kflVgpK2ZWxBq24crvpJl6vNk/W+auM37XdEmnGjqf+am6ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
	b=uoJ5/45Kii2oSFIaGKQsPGUbnz0w6aKnRglBPSAazWfcFv538nVXNTjz2BWmrn3exlTn
	 ETWeoAGNwByN6tAYomhLIA7w2K2M4TYUKqNKDzM2cFrElEeaDYWopTEblLDvToo8dlqx3
	 oSdhySyhHUDMnXeq9W9HF9DRxQQUpRL/ZEdGso/h/IJ+gZRx6IF6E5GXQt/bGv317mg96
	 SZstWnSbtPHYvq11729FHFzbzeWdu72dXsp3PP/lgLo1sscVRuN984pTjreM0YrbSSEFR
	 +xN2jk8WoJj2k51TG1xgYZpIRxc0J2xcb6cfe1T7kbE+Y0Luqu1PPUxGf+nO5clTbLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CZ4B9P7w;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C76F60A2627
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 09:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C76F60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CZ4B9P7w
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so19318835e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006903; x=1793611703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=CZ4B9P7wQDiCoHwSght5HMF1Reu0ZpEa5W9PxymJM4iRKAeArJA9+p8mAQXrRP0Y5A
         533t1AnsPiaCD41CbQs4XdyVl85RGWOO2pjj95r+rqneOJOXEwburRPd+pn4RRpCkkjO
         9BynAhJWvsvPV8cU6J/Kj7PEUdurJMpgy/N0wkHcDKZPOtPNtlEZVJBt6agC7TcorWLo
         ZcoVuCinwHjIjKyFJwHBsfK3FTyHH8JKDImrVugE1Q0JThuEUCMT7WXn+R+Fgm8Zv8Vz
         F2ab9z3r5ovxvhgO8V5SRxUTac/RZ8vyZAKQD9TaKGf3RXpiJdWrhWVCK1SInHdQ/Qyx
         98JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006903; x=1793611703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Q5jKmXgzoo+WiVGo4LfNDJTiePFUGEuuUfFv2a/kxQ=;
        b=wZIQScFvDUC2soDnQdQdpoZ+4oN56ZYp0E5d5MuRQWLLaRt6jVa++q81dLvaquV3GL
         cLd/zznf7Ryo5xuaeNs/YE0jB09J7pj/cP7IK/F6bmvPyDlUKNCiIaSYk8hpp7my0jBN
         P+7Kw64rIOrmdmDRnXGwvzunkNa3M8bVlL5onSnhqOZR8/+FSlLNho/Y37yv34v7l/C0
         Vnxhl8/eoqUPj2uQOkfU1sCVb/typVe5FZHUhijW/A4dbneEMW9brE+Cf55xzja3NRGA
         HDbgP5WCZJtuGHq8ARYk/vW5I2wQ1HNK58OUmtk+Tbo33L7jd7AOQIkGTmCdJ2O6JyYj
         H+Gw==
X-Forwarded-Encrypted: i=1; AKwUvBz6d4diOb+KzQGSb7bfIXQEv+GWutrHHGFROBWgaat67lwRlUr9sH/kHPQco9gUmQ52eO+aEav8SIkpClx4GDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt/9ADKxjbH0IK9TQi27WkRLKmK/FxoCtAycIuDptm3Ap8HfcS
	mPBHrSbn4iOanjvDAwzE3E+Y4jfLxe5ZCDQ1fv+sbVEzV7o5kWSh0Xam
X-Gm-Gg: AYBFou3s2bE26PHc2t99dYDu2AXxoF3ILQqQEUrM0K2jd/R3lXPMJnoP0C2jH9fIvd8
	gtntelQU36JvvGDu8OOz8s2sxYLWKvoyArqsaNV/f1z2PRfoEIxmHshoPS8QuzK0xfwnga3WOjg
	SqTcOkBriLCRU54ipCoLE1qF7SIujO9PawjdJ4I68RhwqcK+Vdd6GCave3qBizFu1xmAOVftk1T
	NuzDjtbH0ghulTj5sGSuNI6GxWxn3LaT2qSg+FoiIRwFv+ee8VwDLs5ksz2sVw8ZMzL8TMNKMM+
	g8eNcCvnJkRIacF5Gsa+8kq7VcAuQ2ALoqmrSakEF3zW7I+oHO84zlmRRNDEdLgg1FXQvnqnFRu
	LQpnL7brBxTJVsjL98OtavJ1wx/qhTn46vKaTajAFYQKh2UwM8nnrYoHFPAD99zI2r8OeEAz3Up
	JA+JuWtu6ArPGFm/n5BSKwLp1BkX+ucRttJcQLsHzoDWngxFloiFeqHgiY2+FhAGFmPvckgZQkh
	+3CXj4GQ94Oc0G1T8pVBu6FkRdh
X-Received: by 2002:a05:600c:3553:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a35aead203mr116295105e9.16.1793006903112;
        Mon, 26 Oct 2026 02:28:23 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::25dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm215058535e9.1.2026.10.26.02.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:28:22 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 26 Oct 2026 10:28:20 +0100
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
Message-ID: <at8dNNb4vwovNZcZ@krava>
References: <20261023001603.560210-8-wusamuel@google.com>
 <20261023001603.560210-12-wusamuel@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023001603.560210-12-wusamuel@google.com>

On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:

SNIP

> +static int bpf_object__query_ksyms(struct bpf_object *obj)
> +{
> +	struct kallsyms_query q;
> +	struct extern_desc *ext;
> +	int err = 0;
> +	int fd;
> +	int i;
> +
> +	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -errno;
> +
> +	for (i = 0; i < obj->nr_extern; i++) {
> +		ext = &obj->externs[i];
> +		if (ext->type != EXT_KSYM || ext->ksym.type_id)
> +			continue;
> +
> +		q = (struct kallsyms_query){
> +			.size = sizeof(q),
> +			.query_flags = KALLSYMS_QUERY_BY_SYMBOL,
> +			.sym_name_addr = ptr_to_u64(ext->name),
> +		};
> +
> +			err = -errno;
> +			if (err == -ENOENT) {
> +				err = 0;
> +				continue;
> +			}
> +			if (err == -EADDRNOTAVAIL)
> +				pr_warn("extern (ksym) '%s': resolution is ambiguous\n",
> +					ext->name);
> +			break;
> +		}
> +		ext->is_set = true;
> +		ext->ksym.addr = q.sym_addr;
> +		pr_debug("extern (ksym) '%s': resolved in kernel to 0x%llx\n",
> +			 ext->name, ext->ksym.addr);
> +	}
> +	close(fd);
> +	return err;
> +}
> +
> +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
>  {
> +	int err;
> +
> +	err = bpf_object__query_ksyms(obj);

hi,
we could also add similar support for libbpf_available_kallsyms_parse and
probably in some other places like bpf_get_ksyms.. which makes me think it
could be useful to have KALLSYMS_QUERY support for multiple symbols

thanks,
jirka


> +	/*
> +	 * Fall back to parsing /proc/kallsyms only if the ioctl is not
> +	 * accessible: not present (-ENOTTY on older kernels) or kallsyms
> +	 * addresses hidden from this opener (-EPERM, e.g. kptr_restrict).
> +	 */
> +	if (err != -ENOTTY && err != -EPERM)
> +		return err;
> +
> +	pr_debug("KALLSYMS_QUERY unavailable (%s), falling back to /proc/kallsyms\n",
> +		 errstr(err));
>  	return libbpf_kallsyms_parse(kallsyms_cb, obj);
>  }
>  
> @@ -9922,7 +9996,7 @@ static int bpf_object__resolve_externs(struct bpf_object *obj,
>  			return -EINVAL;
>  	}
>  	if (need_kallsyms) {
> -		err = bpf_object__read_kallsyms_file(obj);
> +		err = bpf_object__resolve_typeless_ksyms(obj);
>  		if (err)
>  			return -EINVAL;
>  	}
> -- 
> 2.56.0.257.gf7497c7d27-goog
> 

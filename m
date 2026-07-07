Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DF03B8BB6
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407169; cv=none; b=e+Tku7E3I0QL13GdOVClOf7P/Uf4F+PbS0iO8Nj2BpyhDHgHvBu4mOL67VYVFpIxeae/hVSSJuDZqT7FtEvz4fKNRY6rdt7wtO0DncYyR4YIylGNDwkr7TtgyO8nVEhMIKP5lRAvaHJjE/eUkgjEXcmeSabglt35+J90r32Wb/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407169; c=relaxed/simple;
	bh=mhdDcd6URVxpfo91I5Qyv3Eb0UvP2jLGecqvmCd3mrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgG9KEmspdA86bpIRp8RYJ8aauUM1+vwV8VkRG3892lB6JcClB/M1QXMj+k1jmFw6PSafy+MnTl6W2gdu+FhBt/eLGzVqdZRTEQy+JO3Q/uGHOhG/LW1IQQrsufZpC+pr1+b3qNAx9g52dZ9V9B8tPArA260oxCEd6OOOWVFB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dgJ02Vs/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dgJ02Vs/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bab44440so1577845e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 23:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783407159; x=1784011959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WfzRI5F82+Jj3jQo8VQaqjjU0jNv4SWrjulOFBbp/Nk=;
        b=dgJ02Vs/aRyieeeK5ePOM2d98uTWuFifBd+sPhhc8pihWuf+7J0agaZSMnoceFoNBo
         /7tV5CCHriCFZHuGMNeITuOuu+uAfAQYDRExfkSpQOIGhHfvRrIMsG+kZOIg3PV3QW/e
         mEc/TaVgEbmTnJBbUtGeynCpV2OedgqMKkhXmRiG8TgG3JQ4Xk23R4YlbSvJtVQGfTlS
         U37GazADHuElg3+f9HaCWIIkglJ2F1yvARnBMEaqjB4o9u6R8rzsbUvs4hRwcVPHoFFI
         a2a522l+yr+zCnUJCUWvpwkYgGyKSldIZdPMaJ8jPyeyxGaMvfPOIRvQuHSHQgk/VqZz
         jJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407159; x=1784011959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfzRI5F82+Jj3jQo8VQaqjjU0jNv4SWrjulOFBbp/Nk=;
        b=ejIGcNL5Fk38RfWd4CgN1Xk0a6n6LDncNSp9zo+b6jKjEBJitAWk5CsK+/1hDgEqmG
         0Hy1yjrdWhSHD0mTNJPMBVmvDhRd7KY2j35WYpT8DZf9NNOeP545nBpgOTFxnfe9BWFO
         PQYxu+nofh76+jcNuxbpBP1vwbKnjswJ98sNhRzcmpqK7VbBxv5RXaswW6vLlUMx6Qxi
         L+CgbR01yi6p6jExPGarkoMARM37v6/7uBeNsI9q5qrVEjLtVxroS5kebLuUvY/0mTKH
         TdHA7GUBe20tiXv/uB8xw4A9HFBr6dGyNJNs9M6eZwsOF3HvWAbQfGYiBYSk7ognqy17
         wWzA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2NIMKHH/n5EATFpW1yFIhmGuVAL2cygJrN4ECTANdZNhanOmOo9gGaXN8MziKHtaIZYcAopR3zG9OUgJwGVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYeUP+JAXokQdfXuu/ZjK5AHyedm75a9V+SRRUY/ZCIn6pDdFn
	aN3iXrKNoDfPAjRxiAZwV1ksIeAJx1mYPx9+IEdMNpb9i2jBQ6XpDzAroPnRo5csSGA=
X-Gm-Gg: AfdE7ckXdUOVk9wHMXv9j5fq4bFWyF/rN5V8Glw7O1c3rLKD/9PGdWRZ+GeNFKzoLS/
	KRsqXuOFok7uFEdq9zOTqK6sC8KHmIQHR5WxGuvXTIa4zlPgPMyBjVndkIyVwYL1N4iLLErQ1L8
	VJkOEL8auLGJcIDD0gtVaEX/Y5NcJKafCh2X3rKPtG2qk1C+RmL+M0UIvnuQfgFJ+NmWSyTTUsk
	hXkgMllIicsrWTn6IG4OnrD0QK2sMsUijNkW1XcVg1lYBC9xhfQwCHYF0aG95YbpXnEdK8KaEE2
	H/SDTCUFDv9HrLbJV2esy66jLiNwtQdMd6W7wUKTv4T1A16rrlUV9sLgCS+at5G6Qz72GPY+/E4
	Vt3XT6pwr/bSedjAiqtWuIYN2B7snwt2twNx+WcicWxgfkEd72/LBDUGGaVXiWiGHTnBavwrmZi
	QYatteO4MwkqTzmhounFAJAG8R3OjzdEtGOOhOjGGKInw/tg==
X-Received: by 2002:a05:600c:2284:b0:493:ca5d:b9b3 with SMTP id 5b1f17b1804b1-493e1029736mr8337345e9.12.1783407159009;
        Mon, 06 Jul 2026 23:52:39 -0700 (PDT)
Received: from u94a (27-53-112-249.adsl.fetnet.net. [27.53.112.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e279sm6305125ad.45.2026.07.06.23.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:52:37 -0700 (PDT)
Date: Tue, 7 Jul 2026 14:52:24 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: Reject negative const offsets for buffer
 pointers
Message-ID: <akxwvAuGFIp76TFB@u94a>
References: <20260703035137.109608-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703035137.109608-1-sun.jian.kdev@gmail.com>

On Thu, Jul 02, 2026 at 08:51:37PM -0700, Sun Jian wrote:
[...]
> @@ -5344,6 +5348,29 @@ static int __check_buffer_access(struct bpf_verifier_env *env,
>  		return -EACCES;
>  	}
>  
> +	var_off = (s64)reg->var_off.value;
> +	if (check_add_overflow(var_off, (s64)off, &start)) {
> +		verbose(env,
> +			"%s invalid %s buffer access: off=%d, var_off=%lld\n",
> +			reg_arg_name(env, argno), buf_info, off, var_off);
> +		return -EACCES;
> +	}

Other pointer offset checks (check_mem_region_access and
adjust_ptr_min_max_vals) seem to check var_off against BPF_MAX_VAR_OFF,
and that `off` being >= 0. It would be great if the convention can be
kept for consistency, albeit being more conservative.

From a blind guess I would guess that compiler does not product a
pattern where `off` encoded in the instruction is negative but the net
overall offset is positive for PTR_TO_TP_BUFFER/PTR_TO_BUF, and
rejecting such pattern is fine.

  r6 = *(u64 *)(r1 + 0);
  r6 += 16;
  r0 = *(u64 *)(r6 - 8);

One more comment below.

> +
> +	if (start < 0) {
> +		verbose(env,
> +			"%s invalid negative %s buffer offset: off=%d, var_off=%lld\n",
> +			reg_arg_name(env, argno), buf_info, off, var_off);
> +		return -EACCES;
> +	}
> +
> +	if (start > U32_MAX || size < 0 ||
> +	    check_add_overflow((u32)start, (u32)size, access_end)) {
> +		verbose(env,
> +			"%s invalid %s buffer access: off=%lld, size=%d\n",
> +			reg_arg_name(env, argno), buf_info, start, size);
> +		return -EACCES;
> +	}

If we check that var_off is within BPF_MAX_VAR_OFF and that `off` is not
negative, then `var_off + off + size` should be guaranteed to not
overflow max_tp_access, since the maximum of `off` is S16_MAX and the
maximum of `size` is 8.

> +
>  	return 0;
>  }
[...]

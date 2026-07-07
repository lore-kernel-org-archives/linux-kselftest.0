Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5AC3AFCF8
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408656; cv=none; b=ZIppYZd3kKXrG+aagG2n5L7g1ElTi/WqVoX9NlCnjH5BbGnLqID1lPcXAVHJjuZ/JnLUWeTj3NV1urXE4frkXCmYUxJYgddPHy+w3Qpnm18CPh2R8QvN1637ZY//db4bLmSEOTT8G9cMFoqjqors1KNsauu7IptlluzmCBm7Y9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408656; c=relaxed/simple;
	bh=Ej8NqPpY8Y2tM5iaL7Pfew4r5IbWYX63UJqTgnJNTMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuiiHYP8BmkcMEK84dPwWTSXOq41kCyToa63/2f1yJ55ehVdEbGJ/n4zuag4BnTaXJthn3Fwa6LlLAG3snJ1uPXjypOKbecjkHnZgOksTZOkCrLgCYgO0pH0lBm4aemEWVLSTMujCuY6qD3yIiA0cmzUHObcYjjMtDMdchY2R3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SdaKDsbe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SdaKDsbe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b691cb44so27473005e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 00:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783408649; x=1784013449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l02n0V7uxUW1ka2kHMZJ3uiSZxCig+R49GpTVh1FrvI=;
        b=SdaKDsbePCNLu3pALbshc74sY9wTXoIKsDAGmAUyTmdZ31BfNU4oie/LpIJ3HQUf62
         5JEsQOhuKy2wIzgmEIit37eHuesoJGCWnOdl7wh/FJ3grEB2UQgMbEydiMqumGfr6I2G
         7E/WhEq2CP4/bM6E2bhQtishLMjg68ltxlNniYy6a4qZ7SFG/EEz9yP77GoIkIpiDeK8
         Jp0rZNQ6w+j2C7lPj4ZQWktfcnODktzJ4g0rCTrlaHCS5j7SV9qzre1DjlNhALfdBmJZ
         NpooLELMwen2/eN9leOHd/yRqj79IxQpEepY/Ab2q9uEegB6NI4WeLbCpRwwKW602WJ0
         tyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408649; x=1784013449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l02n0V7uxUW1ka2kHMZJ3uiSZxCig+R49GpTVh1FrvI=;
        b=IlsZRHGSTKogEm2RFY0l4dTTM7Jsbln0Bmt6GhrLqnRVPdug4ItJTlTUwJcUv6xWLq
         FaBoy/4H6Z69ztTvqgq5eyzq+8JKwnR20tX/FJNTNwFXZLlpa9L603W0lE1Y9xHbPQS5
         n/MKZIZnuxRNdRC7OMV6bauRIlsK7mdjxWHHiNd/YNrjdQZU88Ox2hQ5SPWJpaTaNAE6
         Iuo/rJb2C8tLhE9Pis+QZk57AqXtAuGJK+2ez6ityVhlON6rqzPx90YSLcL6Bt4XbDC/
         kGkWb39+WMl5rEGpEjqqh/ibgSDPFlji1WcmM6X2bT7j/P+MbhYr2ng8iDBjfyJyGvrZ
         7BFA==
X-Forwarded-Encrypted: i=1; AHgh+Roy/JqKGLON9pNXsDoOSaNkCmzAus7zCZjeF5c+EFxLzb4S00K0huiIN507BxdJwdHxIe/kFamp98cGi2c1rfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU45w9EmAy7tiuEn7bSRNZPGl9Pn49aHjNCH3i6dsC3G5baobc
	pZiH7PUPZWxDZhUr8XXou1CABnUT7qoQfJZwsHX8FGBmVfWtTxdjgeToy5TKJrrbd3o=
X-Gm-Gg: AfdE7cnAl41KsporHQ5ENYilNka2olzeUQ/iDp6QEzTPCS49tZ6t/LXZfNrDhuPl7H9
	13o/JSNZajcHbfTdL9qkJKpUFvxX5QjJCJu8KvBxquwm4Fi5hIMx2l193WhRHeYB+H1qVIsWLhP
	ymL2DW5Iyspg+rzuLq/IpYbqz96gFQe+/xmm4kj64xvOFxBPtS4O4F6LTRmCSbRVuYmtDE85+Kl
	BWg0XGC/y5siVSm6NcacLDvfTnyoIi+XwRQtCqJoauheFmt1+nxe+T8cfooRXvt4WuZmqBTsXwp
	4EUE05PvmqnaJNYHms1pJaiYlizcI0U8EVxsLoJ4U6UEjEKF8VREuJIjRvaDmfFT5yPTS5dtDUu
	aUJEwNe6/bl6GBCT+JLGmOHTpGsdAKBa5cMJBgkmQjpkFpZtrFWyZl4HWUmOZx7nDz1sGL2/56q
	jBb1DTiOKRyiM4tHydyChueCjl27ig2hm2h7FavblT5BoRNQ==
X-Received: by 2002:a05:600c:5288:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-493df09608emr41741795e9.30.1783408648684;
        Tue, 07 Jul 2026 00:17:28 -0700 (PDT)
Received: from u94a (27-53-112-249.adsl.fetnet.net. [27.53.112.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7e9sm6828225ad.10.2026.07.07.00.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:17:26 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:17:16 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, shuah@kernel.org, mmullins@fb.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf: Reject negative const offsets for buffer
 pointers
Message-ID: <akynPc5YJKD12963@u94a>
References: <20260707060804.93561-1-sun.jian.kdev@gmail.com>
 <20260707060804.93561-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707060804.93561-2-sun.jian.kdev@gmail.com>

Sorry I missed that there was a v2 already. Reposting the comments I
sent to v1 below.

On Mon, Jul 06, 2026 at 11:08:03PM -0700, Sun Jian wrote:
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
>  
[...]

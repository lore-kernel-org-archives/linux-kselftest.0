Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4F7481AA0
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 08:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710006; cv=none; b=APBDFTTDSZmpIoQmOn5RBRsTUx/Mx2cOcubRAMxsWLc3DRNkxoAE5eTDfXXBfHc6MTm1N2VyPsJ0Zq7peCx3ccBKZsgxvRlJd5VvrHoZpz3cxrQjai+1cxtnzs9GHrayJb1Oqbwz5qqQJca64px8vxHzRmpUH0RLnrysG/1ZewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710006; c=relaxed/simple;
	bh=Gi8PdX/xJefeuMRnuMFLwGXlOOxXOnK+PMGm+0kb+q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trfRCfyauGH7mNSJuiQfrT30Gj6Glksw9sjz4m3KwdKw6KCMshS1lmLdWSqW/sumqA5Cabaoutvk7yp61/mVmeaZAumJ5g+3UzbF7F3Q70nc0vXcSI8r/aPvtdIsFNp2cqIJ3f2Orh8+PizpVahgd//7tg7BVD+bjCOOkIeeciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WeAFf94H; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WeAFf94H"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1740c36c5cso708972366b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784710002; x=1785314802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/eGY5z0oJYZbmuykBUwttVGRAF86RZolhsRiuz0vNo4=;
        b=WeAFf94HrbFRJmEkkCOazlhlNvfMscdqyty7/0/XkT9Y77MXaeoHDe6eUJhByZc3+s
         G1hHZmfKOve28eBJOFjc1FUOEafmadBTjqBkAqyt+DOhGWXeteKe2RzLU8fr2YegnNxh
         xT9EIZ7cYgc2pgUGcc9JJJEroiHpx4gwQpoeY8cvxMXdXa31yZ/y3fqlCohEVHLMO+Sz
         pdLfooiHRXhsXrFCWDz8h1EetzUM7Yh0xnVYXEoZTIXyodpcK113B4QsnaLpK0vyRWnM
         OgpovIb5eJ8e+UQeyXMY2zrV/09xNjTTHXH0WfM9E9+XSJKDqG7JPWv5eZpT9D1vsZIf
         ZTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710002; x=1785314802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eGY5z0oJYZbmuykBUwttVGRAF86RZolhsRiuz0vNo4=;
        b=hGFvBRSy68VxRVhF5UjjOBJrBKIR6FaGiU0Qx+Q/BOFwIN02/POxVE/LtIA6mw0xwI
         iHlJFSXd6ORRr+Ls9NXJfGa52tYIzzyB1KIYTdSvJJym5VrrJjb70IfJAX8Ec/vF94uy
         vkAFmgmso0q5L9k6J//Id1sGEac/gO8oB26UxVuhC4q6QKonyuzCIRDtg9ipUsq8r6ks
         1tXSXTXLtSEcnF0iBVFoOSqgg9UuntYKBI+2nAtPSAKrJW7BYZ3IDV2jZKwJvhMaO8yN
         6himGO9VOlrf/THFJwTs59/cvVGjh7M2e3uHy8OlsFRPrOMFX9EsVXE6qYu8UKvcpzH+
         yZKw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5w9+aIXFms49pFN/kMyHkXu/pwmOp3z40CI36NOd271FJKlmX+/8uD9XNBoEJdPl7B/B7zr2oB9W3Fpwzpvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4Odo07zKdyfs52OfskefQyUKuwC9jlMykXIMdgcm8d7tTi+F
	0dAjK38rjsCK3WAtm5XmI/I2Nt401bXsYWkux1g8jXKhCqC4rjTFU7Fyg/OVWIjbZVw=
X-Gm-Gg: AR+sD112uun28Yzj4uI7TDVH8sTthkjRHn9EDcHrf2qrFJOUOQU4DNZ6pdSvtMuS5dA
	BRraW6Y+QsHdO0044mcOJeq77GzwkBbk8LT/GLKfk9pcGN/eH+/BZIwV4gyH+ClRSJPlEog1mC9
	JTUi7CsgkzsrOQHmAdEUQrf5odooxvJKOxw7pwzSwsabUl6yw48Gln7512scc2qPkQkZWanaNNk
	RV/LIEg5pv7FlM6e0rnRrhmPIbGjZraJL3J0IuE+n6dapeEQhznL+6a0NcA2E+Cj/pYccNBaP4q
	frCIubKap/ocb4EZRnkCuq0ON2kNvf7zy/h5JNEQXf4oX4uf8EmFUHx3JQeHKR9TQ/FIoQA8ZvJ
	0a8BBYA+iYg2i069h8Ou8sPsz180e5DL8g1G/8hPL+9D+U7vPEM8+d1JQDbSj+r0eJWhBE4P640
	FUJwroTYVg8odLZ5IPN9l45N7l
X-Received: by 2002:a17:906:eec8:b0:c16:1031:e729 with SMTP id a640c23a62f3a-c16b46caaabmr1001085766b.11.1784710002296;
        Wed, 22 Jul 2026 01:46:42 -0700 (PDT)
Received: from u94a (27-53-137-220.adsl.fetnet.net. [27.53.137.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f386c68sm10765705ad.74.2026.07.22.01.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:46:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:46:30 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bpf: Preserve stack frame number for commuted
 arithmetic
Message-ID: <amB_My3Pg2hIxRG7@u94a>
References: <cover.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
 <a092a059781aad37b8d8ce3bb927052de5f73431.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
 <976ae2fbf6f2ead76622e39813bfda6a6981d382.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <976ae2fbf6f2ead76622e39813bfda6a6981d382.camel@gmail.com>

On Tue, Jul 21, 2026 at 05:12:14PM -0700, Eduard Zingerman wrote:
> On Tue, 2026-07-21 at 09:39 +0000, Yiyang Chen wrote:
> > When scalar += pointer is handled in adjust_ptr_min_max_vals(), the
> > destination register has to inherit the pointer register state from the
> > source pointer. Copying only selected fields is fragile because pointer
> > provenance is tracked by several bpf_reg_state fields.
> > 
> > For the commuted form, pass a temporary scalar offset register to the
> > common pointer arithmetic helper and copy the full pointer state before
> > applying pointer arithmetic. This preserves the frame number for
> > PTR_TO_STACK registers and keeps parent identity fields consistent.
> > 
> > Fixes: f1174f77b50c ("bpf/verifier: rework value tracking")

This doesn't look right. Without bpf2bpf there is just one frame, hence
there isn't a bug at this point. I think the commit f4d7e40a5b71 ("bpf:
introduce function calls (verification)") the you mentioned in v1 should
be used here instead.

Ideally there should be a second tag for the missed parent_id
preservation issue for invalidating dynptr mentioned by Sashiko, too.
But it wasn't that obvious where that issue was introduced to me, and
f4d7e40a5b71 pre-dates dynptr anyway.

> > Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> > ---
> >  kernel/bpf/verifier.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 52be0a118cce0..3c0af83db4672 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -13796,11 +13796,12 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
> >  		return -EACCES;
> >  	}
> >  
> > -	/* In case of 'scalar += pointer', dst_reg inherits pointer type and id.
> > -	 * The id may be overwritten later if we create a new variable offset.
> > +	/* For 'scalar += pointer', dst_reg inherits the complete pointer
> > +	 * register state. Individual fields may be adjusted later by pointer
> > +	 * arithmetic.
> >  	 */
> > -	dst_reg->type = ptr_reg->type;
> > -	dst_reg->id = ptr_reg->id;
> > +	if (ptr_reg != dst_reg)
> > +		*dst_reg = *ptr_reg;
> 
> Lot's of tests are failing on the CI, please investigate.

I think one reason is that this overwrites r64 and var_off, hence in the
scalar += pointer case, we're adding the existing offset in ptr_reg to
itself, equivalent to:

    dst_reg->r64 = cnum64_add(ptr_reg->r64, ptr_reg->r64);
    dst_reg->var_off = tnum_add(ptr_reg->var_off, ptr_reg->var_off);

[...]

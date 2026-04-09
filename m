Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38653D3339
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 13:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740617; cv=none; b=jIXsuyX0WhB+GCVOg/JFvEcKBDSkRidb4F9iZDxZE+7sUF0FYqdcuazh5D+/pkpRES7UNT4xFfDa+lo33R9Wmreis8PtdOb/IlD81jh+Iyk7qxwQe4AXVTJWxpuSGMF7hI2FvVJvkNoIpBeCcCuV6nGH+Rdd06TrbOXPqWuOkzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740617; c=relaxed/simple;
	bh=FJ/D4q23EFv6mDXNXcni7J38bIM5TIPQlv22/kkJCWc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROQycnpr8xw9A8o8blaWOwKMtpf5LGZuUpXcCvZO+lwB2M4/HDMnnUxf3yAZU+ZNK9pm2YTDsViODdr4sjg2QIpQTlrxoFAtL6STz079KY5pVbSYz2egi8DrR7cpZPpbqhZOnPmryg7pEhk3jUX4tFcNjwgzj+kX1PGpRgedsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHHUYkLw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHHUYkLw"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d5e87a507so542753f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 06:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775740613; x=1776345413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEfIeWMKEQinR24XF9uKTH7B8WIhwrpXr7IybuBO0ac=;
        b=aHHUYkLwVOd69YrQ76wrp6NCP/4uRzYaRgPUhfEZtpdDB8pkt8Y3P2yzG/iSy3h09z
         l+celceRc4YhZM4QriRzvQyaTcl0RcolPX7lApz6YvZKu1K2kx+oev8PGQvA3UYFHR6r
         v8Hxo5hq228XQgQ/57ujjgKL0HAU8Rnefz/8vnW2p8Cs2pijlrFq73hZh+L0nR/IKVBJ
         JEFRZcspYD6cWWaYD2cSYj2pHnk83kbXrfaIQUPz5wK/BzH0FGwGOKdXqyO5mBK3jnAs
         7zz+oo7BX3pj6b7fC0fFbnEKOCKwQ8xgN+vBPrrSvcFD8PRKv8jmwkzHZZg7C2c/L+pH
         RRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740613; x=1776345413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEfIeWMKEQinR24XF9uKTH7B8WIhwrpXr7IybuBO0ac=;
        b=fWjj7mtQEBEIP5hhrP3fYKDX+cT1TttRYMp0cLRFdXKEJ2WTKbIUtnIe7G5SAOqJPx
         L27WA5rXNa31CQrGcEOpqvTv2MJ3KpEpPUoDP2fzuoxsMw90x0Su8Gd3cV2DfM5+hPPu
         OeAKqBeefkTrNmZb45aIehbGzVHUvSXvqA55tn5TuiyXDKfBj37bB/6dkiJUizG3iHcH
         TKi48rh2UnPEFhc1wdpkKpMr9scBi0ZXg+BftQll4WXDT7UwfFR4YLsokRp7YYXn7+jz
         A1sxgTKqszGeoE2I8/KU4K0bz5pJ4Gw+5f+oyJc/kEw87hq2Xt5ROqii5+JjHFYpHKAB
         sY6A==
X-Forwarded-Encrypted: i=1; AJvYcCXNKtJAFtUOFQCivs3ARrSPzTcvQzHBq4uX17ik8yCdb5JDbijhW9HRLKYNUcMh8gECFk46xKU4iepuH1XfvN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP15hI+E3YTMt/wihHyxuGoXaXkVXIeUBS7ymkwSYj0EIP4+Wz
	8h7fWR9YPR1LJ4u78kN97Oyo09tohTHBYKKzOvQqTTTJ+d/aB8X//QNVp+fJAO4B
X-Gm-Gg: AeBDies2dx6Kc4oqFsxcNwBSOoDBfZYe3sgWay6WdzMT3X8FtBbxrsBER134e6xoFSV
	WQDyxm438IUZB3mW5nrJB/jy5Hq0DKlJB9ycf+tkaekQeyjHMFuH0qT8E6DA+c0csvtg1TveEpt
	MSZ3kOjhKx86Thqe40y0MqygGaOgjje89knZMAmhKn/+NpEG8HHizZ7rehvIC9wLI7yqu3MpYF3
	Plj4vmmtEpuhVYV4zRyxeHoSGuIb+ePB25dN+Jz1Tv9gWkUNlctcf/QlY6FB1QeFQw7tdTokF00
	0u0VvFfEIXlOwIRTKKFSWcDeOIQ0PMmz1aiVmo9TfDYzK9YVuaMUoXVoUWH7hwUtG7CJrmr7cKq
	eUjqBKNM6NsGMpZL56xnvPmB5MWHE8s9zJeHSHXvfjxe4HaJrhwSrBxKVGwtRVaWwkhLNrBU9tQ
	U5CPQ3IaH0qrf0KaM=
X-Received: by 2002:a05:6000:1acf:b0:43d:20e9:b0e1 with SMTP id ffacd0b85a97d-43d29280e6dmr35116020f8f.7.1775740612569;
        Thu, 09 Apr 2026 06:16:52 -0700 (PDT)
Received: from krava ([2a00:102a:403a:e361:61e0:606e:5b16:ccaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d282esm67310305f8f.18.2026.04.09.06.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:16:52 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 9 Apr 2026 15:16:46 +0200
To: Menglong Dong <menglong.dong@linux.dev>
Cc: Menglong Dong <menglong8.dong@gmail.com>,
	Jiri Olsa <olsajiri@gmail.com>, ast@kernel.org,
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, shuah@kernel.org,
	emil@etsalapatis.com, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/3] bpf: add missing fsession to the
 verifier log
Message-ID: <ademvg2HQT3AZRh1@krava>
References: <20260408062109.386083-1-dongml2@chinatelecom.cn>
 <20260408062109.386083-2-dongml2@chinatelecom.cn>
 <adZWStMinOeunjSH@krava>
 <5090408.31r3eYUQgx@7940hx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5090408.31r3eYUQgx@7940hx>

On Thu, Apr 09, 2026 at 07:28:55PM +0800, Menglong Dong wrote:
> On 2026/4/8 21:21 Jiri Olsa <olsajiri@gmail.com> write:
> > On Wed, Apr 08, 2026 at 02:21:07PM +0800, Menglong Dong wrote:
> > > The fsession attach type is missed in the verifier log in
> > > check_get_func_ip(), bpf_check_attach_target() and check_attach_btf_id().
> > > Update them to make the verifier log proper. Meanwhile, update the
> > > corresponding selftests.
> > > 
> > > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > > Acked-by: Leon Hwang <leon.hwang@linux.dev>
> > > ---
> > > v2:
> > > - add a missing FSESSION in bpf_check_attach_target()
> > > ---
> > >  kernel/bpf/verifier.c                               | 10 +++++-----
> > >  tools/testing/selftests/bpf/prog_tests/exceptions.c |  8 ++++----
> > >  tools/testing/selftests/bpf/verifier/sleepable.c    |  2 +-
> > >  3 files changed, 10 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > index 594260c1f382..beb660b4c3ec 100644
> > > --- a/kernel/bpf/verifier.c
> > > +++ b/kernel/bpf/verifier.c
> > > @@ -11757,7 +11757,7 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
> > >  
> > >  	if (type == BPF_PROG_TYPE_TRACING) {
> > >  		if (!bpf_prog_has_trampoline(env->prog)) {
> > > -			verbose(env, "func %s#%d supported only for fentry/fexit/fmod_ret programs\n",
> > > +			verbose(env, "func %s#%d supported only for fentry/fexit/fsession/fmod_ret programs\n",
> > >  				func_id_name(func_id), func_id);
> > >  			return -ENOTSUPP;
> > >  		}
> > > @@ -25561,7 +25561,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
> > >  	btf = tgt_prog ? tgt_prog->aux->btf : prog->aux->attach_btf;
> > >  	if (!btf) {
> > >  		bpf_log(log,
> > > -			"FENTRY/FEXIT program can only be attached to another program annotated with BTF\n");
> > > +			"FENTRY/FEXIT/FSESSION program can only be attached to another program annotated with BTF\n");
> > 
> > I wonder this should say 'Tracing program...' instead,
> > we have other tracing types not covered in this error
> > 
> > jirka
> > 
> > >  		return -EINVAL;
> > >  	}
> > >  	t = btf_type_by_id(btf, btf_id);
> > > @@ -25597,7 +25597,7 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
> > >  		if (aux->func && aux->func[subprog]->aux->exception_cb) {
> > >  			bpf_log(log,
> > >  				"%s programs cannot attach to exception callback\n",
> > > -				prog_extension ? "Extension" : "FENTRY/FEXIT");
> > > +				prog_extension ? "Extension" : "FENTRY/FEXIT/FSESSION");
> 
> I guess that we'd better use "Tracing" instead of "FENTRY/FEXIT/FSESSION"
> here too?

ah right lgtm

jirka

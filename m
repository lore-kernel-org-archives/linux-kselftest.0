Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3050372B2F
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 03:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784862333; cv=none; b=mMWpUUPfnHUYy4A5aYb8YXJ3t/jrg/XldH5SjTOMOTmGAGyrn7a/E9WQHqURWtefCXkhLtMpo2PIDCq/onq8pzI9fW8sSoZt5wKVnxVdgWC+GprXbiOIhgOWVrTwsBcjGTGVTeSPhRi2GSRQ5XOc5oZQdQv4WjZArfmU0HDlq+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784862333; c=relaxed/simple;
	bh=cRMYG/X4KbTYbEkrDkF5vJoRcZP3moe02DkXb+7WLrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDOI6wBP6W5Qki5TLjnYoWlmdfDoxV9c9j2sUfbOAX+VXaiKMaZh3CTUCofGwCahxkA6cubknFjO1wXvvRr5f71t8sReYIdkjbZ3PbV+EGFwehAv9Q76+4B4XIhROt/vEN2ruAgezxDX+5mesFcvKaPgmwOpY+mjKlTgXwmugDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Zt/zGpoz; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zt/zGpoz"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15f020a223so177751266b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784862330; x=1785467130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkgPqMzAP2ofbMJqGwKnF617Gb9fXhy5NfbpimZP8p0=;
        b=Zt/zGpozCJ810tz+dqs8wujvG3xOrDortXUplZ3rnjfqWPWCJaPHdgYzw9384oErbi
         nN0/Sq3RFmtn0OisZGpgk1lXa8pQU+HU2sTJn19qE/CAYxhEl3fITNUS4rstucwjny98
         ifuDVjAAHxQ0NCBbBdjvJXe9GxHznMMqi29Kivx3dAlN7lxLv2XJjRzYNBGXTaDynPxg
         2G8JDTK1bK/B3X79ZwwVv+WVSjLg9CHyGXLTLrTBBjKJZgrZ9/71G7NoWlI4NHj/fwd+
         gcfbaSx3unyX1/by51CY9yCVReI6VAc5UnOCMvJyrrKl6rd2K2GBlEzYQtvfmD6wFLlV
         61lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784862330; x=1785467130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkgPqMzAP2ofbMJqGwKnF617Gb9fXhy5NfbpimZP8p0=;
        b=maS9OXNzM8CzimKJW5vEwKExnjdxO56SSVpy+3li/b/KxwzPUMr2Fj6xRozYqE+xE5
         7o4taRbx9+7ElSfLL61yuUQMnIZdCcset+7EEpGGBAnibgtNKw/IAT0SntEJX2hyZCkk
         C8XO3MpyeqGQkzkEKbvngFFfwqJ8n1QAWH6FUdOQSTW0r/DzNrXsXWMyFWuRZGV8XRy/
         qTAZt2CIfQRbtYzhAcK8N8umpMJ6t5FkRZ/lNtq6hc110I0YhjcMpBkb9/4Yji+G+ENd
         yd0WSyKJOvdh+elhDmUY8jUsRYSC1UQx+P0AWjB5JhQ/LDgckVlPUtK7/GAtN7o4LaEf
         8WnA==
X-Forwarded-Encrypted: i=1; AHgh+Ronji7hXbFhIdCv665SzhnfiXjkOx59u1f/+jDHzteZJSIdINSo10VpF8zncqQglroOz3eYuTQk+0nSF0ivF28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmLn8zAyoG+mvOmoMfZaffqmYgWWzqJbai8aTgYQjK3XuRyVR
	aEdD6NHmFQ+JcHkOngJdkHYS4HpBw5Flz8KxF6/8y0+jdMthzJ43z8tusPfyl0thqjo=
X-Gm-Gg: AR+sD11V3kCtUjaEexoxzzCflFc6g5f6DD+CRy7Mcdc2uaZzbA/YJlskJHp77fwPWHC
	xjDE9Rd8UVvzKcm0jVCN13JhX61738Fs/PZPLHUNI67QDJ/uAUuJqhJ+23OkPuh/NXmYsD1/jiE
	CzyYXvp93vwbYHPxNn7PgFkxrrn1H7OhJNfMQ50DcU8/QOeD78mnNnbBYQjX7oOOgBGucqbv2dJ
	3W5mwhtAND2x59Kjg4lRDIYIw9j6dYlvoPRMelBmeWJpqeTGErzMWdh9IGMUKydujSfWRrEXP0y
	98AkVLhGU3nxIeNarU2jJCgJTjjYycfq9b2Rf8rK5d4iVPdvjG9nwufP0ImiCyglCvSkSG1G+ZM
	/d2SUr8khj7TR6tO9XQJhq1UPoxUNRLMir8dLS4c+9CBvLHxDsHThyZ3fO2Z7GJ2xwx7VmEGzNJ
	pJZi5kj1s0Zo8zl6aaq+GqU2npYIIxd7r4GRs=
X-Received: by 2002:a17:906:9f84:b0:c08:59dd:3fea with SMTP id a640c23a62f3a-c1c50bee0b9mr277617166b.27.1784862330234;
        Thu, 23 Jul 2026 20:05:30 -0700 (PDT)
Received: from u94a (27-53-160-227.adsl.fetnet.net. [27.53.160.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31f14csm42880555ad.63.2026.07.23.20.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 20:05:28 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:05:18 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Eduard Zingerman <eddyz87@gmail.com>, 
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, John Fastabend <john.fastabend@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Preserve pointer state for commuted
 arithmetic
Message-ID: <amLScROuY5oleavT@u94a>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
 <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
 <04c2eab092885ed738fc87f2db344bca1319a90b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04c2eab092885ed738fc87f2db344bca1319a90b.camel@gmail.com>

On Thu, Jul 23, 2026 at 02:07:20PM -0700, Eduard Zingerman wrote:
> On Wed, 2026-07-22 at 05:27 +0000, Yiyang Chen wrote:
> > When scalar += pointer is handled in adjust_ptr_min_max_vals(), the
> > destination register inherits the pointer state from the source pointer.
> > Copying only selected fields is fragile because pointer provenance is
> > tracked by several bpf_reg_state fields.
> > 
> > Use verifier-env scratch storage to preserve the scalar operand while
> > replacing the destination with the full pointer state. This preserves the
> > frame number for PTR_TO_STACK registers and keeps parent identity fields
> > consistent.
> > 
> > Fixes: f1174f77b50c ("bpf/verifier: rework value tracking")
> > Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> > ---
> >
> >  kernel/bpf/verifier.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> > 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 52be0a118cce0..085cbd5222737 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -13726,11 +13726,14 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
> 
> Yiyang,
> 
> I noticed there there is a temporary 'off' reg allocated on stack by
> the caller of this function. So, let's reuse it, ...

'off_reg' perhaps?

+1

> and also adjust the
> sanitize_err signature to minimize changes.
>
> Could you please re-spin using the attached patches?
> 
> Shung-Hsi, wdyt?

Refactoring LGTM. Feels like the alias check 'dst_reg != ptr_reg' would
still bite us later, but perhaps that something for another time.

...

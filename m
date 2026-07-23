Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07039EF39
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784829482; cv=none; b=VAnaUh7a4JAHX160X+hfqYUZBBQPNX0EW/O59NnC5ooOjr4Z3PYEeGWcOxQ/6EQf9O8MJTiSVSemssmNPNNb/5RHuB0KZiw4pSmzvT+EOaGTneP/fPq6l7xYcTRlSG/RVYrkBISZ0A20kZxa+VH5BEDxdDOCSVSVvwMkng1v0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784829482; c=relaxed/simple;
	bh=uhSaHoLoNEt+88qNE9tlgwbWDNke6X5OxSpVGKX1ccs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBK/ZCUwcjKXzJytiTvhRuUPh24D9O0trwfJe+MfAjfA6z/PZEXSWxZQdvgvZnoJb9keNbfYM/4IEALhlK/jtFWPxzIbBBQQCezKO1ENPeLwuwUtO+Pssj3xOjw2q/MLlLvGrc1uu6c8r7pYNbaOiw7TL9XZRV9gHQDvILdDyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQfHPoeU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQfHPoeU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dcbade417so999311a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784829480; x=1785434280; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RyhZL1WSIhCm6HgTN87jBbUJ2Vt3tknSGNAZ68PW66g=;
        b=JQfHPoeUYOt2CFt7bVfp7u1IggAurZ4l0B5QdoN61uPUGCnc4FAb/KFPx7bbDqwiJt
         6Ed/Pbx8okaIRMcjXiC6/Ue5YP2G1v8uM/BZo+dIilYK51ZTeT3NR8oxuIholwMpkpCs
         K/yHbpfJCWyHEm4Je21dlHT1zu1pImOK7vPv0F2Npr3q8jfHNljiZN2FC1gTa5/KIfk/
         1VCv8srYyfn5iI7momEDUq26Khqma6tmuPMb7NetH+vWxvSOFG1L5G8Ik2DI3Zw3xxMZ
         Eco9XsFtckkR1qt0e8CHnKknBejtsT4+VfI8RC7+X9oYOp3l0sMSvEfMaj3/dhW2odIy
         DZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784829480; x=1785434280;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyhZL1WSIhCm6HgTN87jBbUJ2Vt3tknSGNAZ68PW66g=;
        b=I8wVAttlxJcso400GV3QVAT8bzKVSI5NX+GVqpPHMEgFU0X4XRpbDtmW+IbQl3usLd
         TK2amh0GV0HZVVLCKU8lsGJ52QOUYGlpzKaEvMoL1OIIk+pJd3U+si/+P+sxxpIMHRxf
         tTh7RCpWebTnpVB1sMQuh3IP6a9Ba/fug69mNOd1i1Ada0qT4WFsM5uvNOR6WZH4ornL
         7vv8g2I0yDfgHl2wMfVQxtxD7esa/AkJ7PCtsmqy0HGEw/IRr3kTtwUySZglfJ4ASf4p
         X7m4LGpP6dhywrYdw/mdRCVbL7ctlGJ4JwbHBy+I98Q48dtsEqBorf0S3AIs4w9T2l5x
         FocQ==
X-Forwarded-Encrypted: i=1; AHgh+RrupV8LCzwA5jQ1EJVTicCO3bphai+P7uwVjBoQ1WHhMMyLE3F3kTSH0ku/vmFaZbs3vP4Asq/I913OY/F5bP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0n6I/yJaPCtYat3Q/1FYj+2d+p4ChJOO6oP21+negFtER8uO
	aYNYLk8OknxvtdVS7JxdIQb+u14P+9H7/kNGklgWNdhCUK/B8lZS9x50
X-Gm-Gg: AR+sD13Yo7/XX6446/AxM9geMCHWomBi8qlZnIVvIZdBEBQhhSeuMTDYyg5WLj5EkpB
	frBmUkk1nmAaO1vHAu9leJzZmcoPIk0FRcvJIguwj3Oevk4ZtCkllUiJAU9j7xDzATp8TqQmM6z
	e3lrfronBQtdnjIUnJevcv5/Or03KF2yffell2DktBUuW9u8krM/ICCw1R3etRZdJ1EUxQXovZr
	QC9IEDj03iWKTnS8HH+vwyRNaxDmkm6nsgKe5FlNZ5WxSQ9V9G+9Piu0SH0fW4eUEa2+8jClPNE
	lncqUQEi36y8Y3jycgqn+xJsU/SLEKrICNrwWr1gd444WK256nZpTTiLzK+iOzR4p+i3GdNIlcP
	oJbM4RHMAc3uOnPHzleVvpIltchEoIuxhmtmnlhnk32NiLGvzRIV2sciFoJqYv3KMEwwpIdVUgi
	B2tJYBHlS6wAYW6dYk3SjzdJT+fj/xtYIhDaeB2eibreYpIONNxqB+Vt962ik=
X-Received: by 2002:a17:90a:c890:b0:38e:dc4:3fbb with SMTP id 98e67ed59e1d1-38ec68982femr3801803a91.43.1784829480429;
        Thu, 23 Jul 2026 10:58:00 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c221:d012:6e37:77f9? ([2620:10d:c090:500::2:8dac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13014d27sm18568791c88.4.2026.07.23.10.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:57:59 -0700 (PDT)
Message-ID: <22df73ce6c09065672d3a9406ae59c2cb264f96c.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] bpf: Preserve pointer state for
 commuted arithmetic
From: Eduard Zingerman <eddyz87@gmail.com>
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>, Yiyang Chen
	 <chenyy23@mails.tsinghua.edu.cn>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, John Fastabend	
 <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu	 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa	
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 10:57:56 -0700
In-Reply-To: <c5c2dba26e217763c73c237daa6d8639043f5207.camel@gmail.com>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
		 <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
		 <amGUjFu1MN__jM4c@u94a>
	 <c5c2dba26e217763c73c237daa6d8639043f5207.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-07-23 at 10:35 -0700, Eduard Zingerman wrote:
> On Thu, 2026-07-23 at 12:25 +0800, Shung-Hsi Yu wrote:
>=20
> ...
>=20
> > The sole purpose of having orig_off_reg seem to be for satisfying the
> > 'off_reg =3D=3D dst_reg' conditional in sanitize_err(). If that's the c=
ase,
> > maybe it is better to change sanitize_err to accept an ptr_is_dst_reg
> > argument too.
> >=20
> > And given now that we are starting to make more use of scratch register
> > states, it seems better to get rid the likes of 'off_reg =3D=3D dst_reg=
' all
> > together, and simply have ptr_is_dst_reg passed down by
> > adjust_scalar_min_max_vals().
> >=20
> >=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 52be0a118cce..72d49f2a57a3 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -13505,13 +13505,13 @@ static int sanitize_ptr_alu(struct bpf_verifi=
er_env *env,
> >  			    const struct bpf_reg_state *off_reg,
> >  			    struct bpf_reg_state *dst_reg,
> >  			    struct bpf_sanitize_info *info,
> > -			    const bool commit_window)
> > +			    const bool commit_window,
> > +			    const bool ptr_is_dst_reg)
>=20
> That's a bit invasive. I think the simplest thing to do is to drop
> off_reg and dst_reg parameters from sanitize_err() and re-derive the
> information about which one is a pointer.

Scratch that, dst type is gone when sanitize_err() called.

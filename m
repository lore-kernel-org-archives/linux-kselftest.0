Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318613515C8
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 05:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784869665; cv=none; b=nyqZnr85ro0D0/avOY9xnL9W7OyzF2DZCWT3M00kQtKS6ZSZflZdcIJ9T6ofedCGpWgQ0K3jBr9/XAGIpVzIDLwbZn18rwRgVzgo+C8xsZ0htgQVREFzxA6yWh0eqbqCJaXj7CnnJ/Pf1AU4lAs7Pz+GeGIDJ4+jh1Cz9UJKXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784869665; c=relaxed/simple;
	bh=AoXftTuUYB3G91VVyCKghvlnD01941ldzKFRurvlS10=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mn99gz9bPZp8Ta40ByFKWm3UarPYDkyd7vKOlFLZnBRiWOG7sV3P+BFmcbPY9a9hoqi7KmHnEgz5CBdsrtD8Fe5CAO3fXwxw9HFlcpfNO98QdG918ITj2pv533Y5b4eRz803RVopux+Ac0gR9xAI+UprErihC9Ooov1jhIm/8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjwcTSY6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjwcTSY6"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceed7018c8so335815ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784869663; x=1785474463; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AoXftTuUYB3G91VVyCKghvlnD01941ldzKFRurvlS10=;
        b=AjwcTSY6SJvigubVorwQIIPZEG/n5Z/fB6hDeCXW5RNLVR+k7M0XwBo3OXSTqU3PzL
         hg7L/DQULMuxY7drF3Rragdj/yaA2JNLVVzDjMwqJS3OYGq6Bi+o30NzsbDemvh+pMQY
         2QQPNgGVlyVzv1GIK8ToiVApioqIiN+Vo/NeO4GzuiUlWydz8l+1Am8y902ZbD817vki
         y9D9qxER4MJ3SZ2fQ330VLOyixt6NN4rO/06WdEDPs+PuENBui8S0+RsRkhdapQrW2QM
         zACkxH+JMgYFYXvsp40I3MAbN137LzbNtifXSOt7YsvvnzUBycNb8ZCqQVncPpC5GIy9
         Q4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784869663; x=1785474463;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoXftTuUYB3G91VVyCKghvlnD01941ldzKFRurvlS10=;
        b=BC1ZrQaoXAcDPeLXor0ZQvTs7qINTN3KUpVefd/sYuB+3QpiJty+ApokkuXavENQal
         C7Ru2jDYcWKBp72PeVxEP99tkJwV11tRKnRqOsuiMPtH4sj+O18V8KUn0KyMQwsMANwE
         uHAo+M/DpqHfOqkkNtpouTmGFohbpGqAygHY5NPTSqr2G40DbTHuyDb0tcXH0S4xGekk
         tWvJA2Lt/k/csiUrNRHoZCh+FhXMnq7oVLJwEC4C4Re0xEUerR2Jp8PBZyccUypGORYF
         u+o6rcXvSQzcuAHMrRCigRUozm+SmWyeb0fPkZHGsk6J1jH0snBoHFgcPcLQiavvfbIb
         Ngew==
X-Forwarded-Encrypted: i=1; AHgh+RqmnX/f5DBXvU7pBwtM19ZLkgTLEZkhwJTmvLlNIMYtal+Lk2ftg75sEKv4BhbJjDJ8MBakKbAmuMF0am+xNJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4r/selOecMGPalLnMwSLir42YBn27Zm61zX4kMRoxoPv6Ou0
	UjuzPkfEJ+xgpYDaC/XXH2Edc3H5nNb9zso8N7xSBASeFc2Y6GIqzU4M
X-Gm-Gg: AR+sD11f/9dYDok5N+trShBQs4Mo8ZWybchxcbahhXSFHlA7k5SGg3S6B/E7qlIGTzR
	rX9XnwcRa8ShCA5/FzN+4E3e7JtlnmyrGqT30kdhv8pWpFiqMJNC9xc+SBOmqjgTEJ2YAdwZvZc
	0jCnIX3Q03U7Beh67if/Rp4HetqUBDkCde2Lj60WKpzJZY2zKppYqM2J1AvzZmRCGIGymv3Tp3L
	s93rPuc8si5jYcJPxPRsqbYyuYm1uAEMBKjh9/axtHKV6X+jq3tDlwsUN9qRewBJPpOqX+cy4k5
	jSnVx6K9pfeJHxhJFd74CHYk6eSglGclJo3rpogoJ/dl6UgBpYPyJqF4oMegL7IA+dZgT8+A+Sg
	h9u3JKTT1S21Nux2mUQfKkOgYh2PiD07m7ptw/dMzZl8anK8kRlA1PJDu2VaUOlUqFWdkXEdwy2
	zNlWbYJimO8G3Qv6Y6YrsWQaXAQgUyrA==
X-Received: by 2002:a17:903:b8e:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cfa6f871d0mr72210835ad.44.1784869663343;
        Thu, 23 Jul 2026 22:07:43 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd76cfsm45371835ad.20.2026.07.23.22.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 22:07:43 -0700 (PDT)
Message-ID: <1e230474ed0de36cc9a9d29fd36eabba628afeb1.camel@gmail.com>
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
Date: Thu, 23 Jul 2026 22:07:39 -0700
In-Reply-To: <amLScROuY5oleavT@u94a>
References: <cover.1784696371.git.chenyy23@mails.tsinghua.edu.cn>
	 <004a83de52a36e9f3acd6c3fa2d0dfd0a013460d.1784696372.git.chenyy23@mails.tsinghua.edu.cn>
	 <04c2eab092885ed738fc87f2db344bca1319a90b.camel@gmail.com>
	 <amLScROuY5oleavT@u94a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-07-24 at 11:05 +0800, Shung-Hsi Yu wrote:
> On Thu, Jul 23, 2026 at 02:07:20PM -0700, Eduard Zingerman wrote:
> > On Wed, 2026-07-22 at 05:27 +0000, Yiyang Chen wrote:
> > > When scalar +=3D pointer is handled in adjust_ptr_min_max_vals(), the
> > > destination register inherits the pointer state from the source point=
er.
> > > Copying only selected fields is fragile because pointer provenance is
> > > tracked by several bpf_reg_state fields.
> > >=20
> > > Use verifier-env scratch storage to preserve the scalar operand while
> > > replacing the destination with the full pointer state. This preserves=
 the
> > > frame number for PTR_TO_STACK registers and keeps parent identity fie=
lds
> > > consistent.
> > >=20
> > > Fixes: f1174f77b50c ("bpf/verifier: rework value tracking")
> > > Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> > > ---
> > >=20
> > > =C2=A0kernel/bpf/verifier.c | 21 ++++++++++++++-------
> > > =C2=A01 file changed, 14 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > > index 52be0a118cce0..085cbd5222737 100644
> > > --- a/kernel/bpf/verifier.c
> > > +++ b/kernel/bpf/verifier.c
> > > @@ -13726,11 +13726,14 @@ static int adjust_ptr_min_max_vals(struct b=
pf_verifier_env *env,
> >=20
> > Yiyang,
> >=20
> > I noticed there there is a temporary 'off' reg allocated on stack by
> > the caller of this function. So, let's reuse it, ...
>=20
> 'off_reg' perhaps?
>=20
> +1
>=20
> > and also adjust the
> > sanitize_err signature to minimize changes.
> >=20
> > Could you please re-spin using the attached patches?
> >=20
> > Shung-Hsi, wdyt?
>=20
> Refactoring LGTM. Feels like the alias check 'dst_reg !=3D ptr_reg' would
> still bite us later, but perhaps that something for another time.

Might be the case, we can extract it as a boolean at the top of the
function, same way Yiyang had it, or just pass as a boolean to
adjust_ptr_min_max_vals().

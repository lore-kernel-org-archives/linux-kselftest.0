Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24145FFD4
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523334; cv=pass; b=hl1uUQtxA7MnJ94bvnbb/Q4EDmUh8qh/5Y4L9wozBhu0uufAtuXmIurtdS9M03jbBFScf2z0IVa2jp5SrZJQzrxgSb/F6oS1oMgUT0egWoJicUhK/TUnxmQKV5T1nRnR03yx9iCsFDUEisIydKzelDoF9GNC4QRzsLS0CkSWGD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523334; c=relaxed/simple;
	bh=4Wxcziuaq5iqoUJMOxQXO3dIz9aa5Vn96onhFBf6rhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNKyI78DcQn7ZgBLsOCmiJ9gpHXydX6a1sx0QQL6XifTofD6iOMwX6T0w8lZfWmjJrKZ+q+N1Z5JCCgXg/KOnDbt6ezmAGpFhVNZK+fiuD/JRIyIqK0nlfiLuAj9AfpEP8LJoCXwijgv4H7N+DrafcIzys1BHailyB8+RfSpmOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RnJTn1gs; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RnJTn1gs"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so1156455a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 11:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785523332; cv=none;
        d=google.com; s=arc-20260327;
        b=ph8NCjsPkh/eesBY70h7dKe858h9wGInQU0h8Uy2RN3nyu1RJuixXEljfa81iLzRNX
         LSa0wPc+JCkeWc0RJ9uhAvgcdTrzNfLLA/mtrM5wjmveU5feN1BuX0YSP4M8F1o9spvD
         5I5s3ky/0CSe+J128KopcC5UvndAsngO8k7z/fTDAkZy8o3VN1HyYHweVn9CWJoRTHN5
         Kik/Oi/0lzduHtdSDzhJx7P91Z4roLoyxZGyPSXA866tTE0WagNhmLaxCl/bk7dXW8m8
         pVYWgkrcRVMkBslFFy4NWO46DAQDLkcwjCWyKbEEcsGJmDhKUSD8gohFsDh83PJxbGdn
         C+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Wxcziuaq5iqoUJMOxQXO3dIz9aa5Vn96onhFBf6rhY=;
        fh=QugS4iOvDB7os1C+Li/sAEuwg0C7xoTjh7L+QQ0ssMM=;
        b=O0nNzOT5CpfJNNGIRn7q24um8pnF7TBPqVOs1BP6mdxwAG2ZU+Chyxqp+EmifTiIIf
         7zM1Tv9/t3czYddm462pMfNB1oreb05mU++E9uoNInvjGsnexEUF9eu8CD2Wf9I/lIz+
         CUVNPj+mpGWC8skBlPOf9OLik1LzjJjsFDMTTvY7dx369qsfMo4ntWO3tiVnrYvLX1yj
         lZ8Gsvca8vV9V+Wx7o/pza0jJBsOZlHPpGBOhH3mjrctrJcjZOw2lbZ42Rb/Ed4lfavI
         FmFz+hBmfTJ0jKf99JuGJWi1SdKjJ9Pw76TQvIgwZa3a5jsJG12w/HS2YrY46S3Eb/lR
         Cq5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1785523332; x=1786128132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Wxcziuaq5iqoUJMOxQXO3dIz9aa5Vn96onhFBf6rhY=;
        b=RnJTn1gsg8Uvh+FH/JN6RNrus99YZFL8IUWO8gsTbGhi7g5TdULCt76g6yFSun3eam
         /fzTn46vxP0Z0X2fnq7JigzVRr/xdX/XHA70QC1cy6h1utGmvhKCDLCFoQ/RNBGOckvg
         97y1yBejqtJ65K2/0EWVzZaebgnnON2raioNwo1ai9KoWhm+MWWt5xCgxgPjfqBM7qFe
         QNakghMFv/aMxbH4adDhNvmjTErcD+whz8nvTCoYiABhrlNcPPUHkFIIUASoypBphT6V
         5dD86q/GjkETaPz+Oh4RXhVxtcD3gzD/ealPGd28IbQNTXDVihOUC/6CdXG8SsU4bL+x
         ODBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523332; x=1786128132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Wxcziuaq5iqoUJMOxQXO3dIz9aa5Vn96onhFBf6rhY=;
        b=dmUXka0HM8qELu3gigpI1YuyJnMEedCX4iZGAIOg5gO/SAQSva7E+PRm2Cmj2tlG/y
         sgloO3SxdziyqCvyLZ6XFBKnjeKkSBMzHJZWsbC1FqnKv1Co+bXabE0lpNj+R57WWzdi
         WXsKhcHONi9owMo3gPqCl31wjrhJ1tDAuzsehKqWM6sFE6NqkQDEcS5ek2IaqSzm7ONa
         9JHIV5t3++9XVG9KGE3p7UojByMvfboIWJfUrSAaLoq0bzoa3Qo1P2KRZhsvnSTyF5UM
         8EBp/PnFV14CwCN32EidjlLev6DbdrgTzORWQnkoOwClNTegxVi8u7Hs/hSncxFGmBuQ
         25Xw==
X-Forwarded-Encrypted: i=1; AHgh+RoDvOhyMn1AB/FpFixr+80BNY0rpf2mS6HRc9K8Eh7mQvzJLx4dy4w9eAj1VR4o+Y5SEM/a9js8FWP1iLuspNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88AtFbXhEk8yTLxd+hM8JCnODFyBx3wqwJGSifD6nhk5anp1j
	3JspaZSwhP3VEcvbhkdSEESLqxuiR1qoxBE46ZMKPjZ82LLlNBT12o4Ph7tsPVfFSRsMXDIN4h3
	+SF+h9/iNVEwDzWEM3THNVGpkL04Xo0oE+e69GzEX
X-Gm-Gg: AR+sD12kdmGLdc47P01m6GxVl779MgYn8OVv6H83BtCJipmpuE6tifmZsmNdWPMsN7Y
	CWJ4lqxfhzLTyIJl8MaVT4ARw179hF0OXPeJZs+VJ9PPQQq5/e9235CGIUUZfBmHDRrzGCOZ8nc
	Xnk6ZRrYqxkn9ZKxQPeZdDvwLrXC2EnKDFWpYN3lHhSMJOhvvtW1cLjuD35b6mVTEnU37uVC0Ch
	ZAYpRGSAg79wCLHHSZsYgxwsQxytnV168oZJtHQomNly/ZAX6tY2lqQ+buXOyXWCZdPaMDR1UHR
	G4wARo265MAntwHFA/RuKKm11PdklqDkpTG6RflO5H8BgkpDJ48TwIQ=
X-Received: by 2002:a05:6300:2208:b0:3c3:ab31:3d1e with SMTP id
 adf61e73a8af0-3c92a8d3125mr777248637.56.1785523332205; Fri, 31 Jul 2026
 11:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
 <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
 <CAHC9VhTS7rSnBqg00ZxNkcZyh_=EeJmn_4z3CTCCxreEEDtTtg@mail.gmail.com>
 <CAEXv5_iHLmzPT3Jj+qZsdt1Nk_5OD4Up3GGV0S9G7KyQshFhDA@mail.gmail.com>
 <DKCVF3KRQSOJ.1WKITMP369I0R@gmail.com> <CAHC9VhR5yfw+sMfrYpy8Qm2uNoxqsTweh=KhDRZsU1CioHRDDQ@mail.gmail.com>
 <DKCWFKAD79IU.TMCNT9RUAJAU@gmail.com> <CAHC9VhRQWRKHi-hdtvSnYPD_dqgP7Q8RB_X4PEDLwPUe6EegYA@mail.gmail.com>
 <DKCYOLBUWJBZ.1N8JAXJ3QJYCE@gmail.com>
In-Reply-To: <DKCYOLBUWJBZ.1N8JAXJ3QJYCE@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 31 Jul 2026 14:42:00 -0400
X-Gm-Features: AUfX_mxuliCX4ORjmGWbiior9WDlNPKrwS-oHeLLni0oyboDwl_jDraty6suaKI
Message-ID: <CAHC9VhRK38bVU5+rYxwLsvVt0oBBSWs4xKsjexbvc3TuA9LVNQ@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: David Windsor <dwindsor@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Matt Bobrowski <mattbobrowski@google.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 2:18=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
> On Fri Jul 31, 2026 at 6:59 PM CEST, Paul Moore wrote:
> > On Fri, Jul 31, 2026 at 12:32=E2=80=AFPM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> >> On Fri Jul 31, 2026 at 6:02 PM CEST, Paul Moore wrote:
> >> > On Fri, Jul 31, 2026 at 11:44=E2=80=AFAM Kumar Kartikeya Dwivedi
> >> > <memxor@gmail.com> wrote:
> >> >> On Fri Jul 31, 2026 at 5:30 PM CEST, David Windsor wrote:
> >> >> > On Fri, Jul 31, 2026 at 11:17=E2=80=AFAM Paul Moore <paul@paul-mo=
ore.com> wrote:

...

> Yes, I understand you feel it should be placed under security/. You are e=
ntitled
> to your opinion.
>
> No, I do not think the newly added kfunc is a big enough layering violati=
on such
> that we need to do it ASAP, disregarding everything else outlined above. =
I am
> sure you see that too. There are several other instances of similar kfunc=
s.
>
> Therefore, please attempt to meet me halfway here.

I'm happy to work with you, and/or anyone else, who wants to work on
finding a way to test kfuncs that live in security/bpf_lsm_kfuncs.c.

--=20
paul-moore.com

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654191;
	b=d+UZyr9zJmdeU+CeL6+tClQelqHplosNscA1+CZ3aroS9lF4dsTjRm1mOBNsq5P7OAke
	 vBHv/Om+GVY0c2YFoNRpkc9/NbN4aEd/sIGtWyK2VO3Y583u87E0eIvzS+HcXDlFWo1OY
	 r3K6ZYU2oZ8Ctep0amiRZjjmIXLcnn2ED2zghouyzJ4V9byVFxcCk5zZTmfQD2vc199wA
	 58EKab97PdcURI3RWe5Rg8rM5G5bJXeMt95cr40ihkij6AyZjo6L7gIzPLUbo5EYvageD
	 ifwP5T/LYUJkN6yhHOXgjx0VLpDSbGOGzzjj6k9l+0MdKncJjcKs3OqMa4ORZvsHcIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
	b=0hHJG0seJOIHz46tMwXMpd2Ad7MyNii4sc83va+DJYQ0WBGpYMvATvdBxyFOKufxVh68
	 rfKTnnQvzduMJ/9haq5isRY9TYKkQ31syF3oBWa6dkiXQ1GNkg8+cBgmV+Oog4UUWkenk
	 KSGa17Hz1seQ0B/v3Mb0tCyXa547GjelO22Z1HOY9t9kJSXd26v2YnYzeIzN8jkreFx/9
	 0UXsxv7khOPmuGlO3/x1JYgOnQIlPIMxu1p2PD6AGC8KWzORrc4Ds0spDpZmiyXKK5Vh6
	 Ix6mvMd2F0g7v59CRpsLT+qcYA6o5mo1TnmPhQJBMsdC8IxgPiUQ+veoEz1sR31JHFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TD3ha0rn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B95C606A32A
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B95C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TD3ha0rn
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so110004466b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654190; cv=none;
        d=google.com; s=arc-20260327;
        b=PDaoBBfwY+3bWtMAMCPrUIzialnCzrzSmjPcjZgMKkpsWgHE8tShdVYRYsSjfUQoUB
         pDhX3tAHV2JotMKnqU3lb5FONKG7AE33ieifaoOtOUp0nB6gs0x+inwffydY0/umXs6O
         GuEw84CWhjt49MkEO+ir/d8t79vmxFToh0VA7yVGpZRgikfZfm3lccfNOOqq7ly8S+aD
         juk+b9CeqBlsAg9v8aikULq2H0BGjobfW61eLq+yaOVcGzL8liwfo6amRSE9mU0nu0Zk
         E5G43oMr3BnhCpJtcfn3hcW2yt1HowGYTF6BKOwQLuFRUGQG5WWGDSfiWoGLK+mfEGlp
         fOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        fh=IZaiAUFaIgpTC6SV6K5nBWCx2wmDrOZUkRaf9EaLEV0=;
        b=HfFM8eiPBby+rRD6ey78H0ABFQ3mOarvuuchHQLVykaiF1zQks6tnuxOV9jrWutLCr
         us53NEuDUj5A3E1vahZJQRB/4vRv4eOqGiHXuLjkjVLUNVpdEOLXwcTliiEvVPXDVh1J
         rj0FfyiFth+ePkR9LEOjd64xPpGUBotbs0kitIM7fvwTE1zEaI731Kdg+S+i5Iki/vhP
         q/FAGoytW52SsXvmoSPu/5kiRQawgDAVY3/CPhBSe2JyaB5GGCNq9fIgzqYo47KDaWms
         lsEtbUBAUz7TfN5LB10jEuiDyahzDDnNm8eB44xYt9/vpO2gnviRrJxZgpoNGO6CNaQY
         EbdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654190; x=1796258990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=TD3ha0rnSCMzB6EDdCanCIo2aztnTVsAWrsh8HrG5Y/aRrFlN2ndLBXw880f1YHLZ/
         QSfxPbJeIna1/g4lWyiIQwpwJD12i4G3TGAPhErD+7VvOdvbXoNFUGW/sZDUdcKc+k/U
         fLW/extCpKtDduL/D3vHzyoVyDpb/98nn+tR+abZco9jsGFWEFngZqgt6TnMkhRshp4B
         KnHYS7XEZFGjKsHdNaQA1fEyq68/xePBost3IMRVEVegEsUL5tFkIeCHeASNeG2SkZb3
         JP9uGCT2U7VP0g68JLBP9wLuAWo5qxzvzbWaRKXYpp5AAo+d01ZiPGTRjL3TT/PoWk+S
         RpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654190; x=1796258990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=CC4fasA37xoXFA6bHCaMh7fN98SxMxCbq0Ro7jYZNjjkNwwGoEIPPt7cllmhBwR28b
         EPeV/M+YrqOdhzSNIAp4zNNcm4Nyi4qm8/b6mUio9bmjpa9PWAo5i/yonh2LQy0F7TR/
         j+uhPKZQExGePvEIuB2Wh7Q2v+GU/ndHp1+07RcPk+DO5znsCBGg1TUxRU+z3fWwavrr
         7s47BDr+HuCEcvOo6Jr5J2EO4sMvvQj4YYTkGQOOWhAExdq21GNRd9pX+Fc7WeN3RdG0
         mrL5onfr1W9LcE/BRJ1UbSCz6dpP06QHJN3y83uHXTkFJ0Wzo5SxYSqDyKX2iaoBUiTc
         Qh8Q==
X-Forwarded-Encrypted: i=1; AL+hErHPOem2/NWUBgFrfG0vEf5007tvBYzR5RTugBWYxHYQjz8DI9OMK7rs2vA2Xk3vmZHABW78UhbtpkPgNJBkQ18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bEzZw9hpnpE4NhfuDhGiAg5J37UTKSnCBLVV5SF+g5pNxXXBS
	cfVFp0UHtr99fhcxk/hH0wHR+0QxgmFrOFxB+FcEE3ccEOKypxmz6/BAbYEzjl9dNaUhSUX6c5t
	97qa6LRbpYr6WK+mcf7Ys23B5Ez1Bid+yQ/8dLSpr
X-Gm-Gg: AZFdTZfvAyASac75ekNeDxXOqJ0zoKNeywrcL5F76yg2CIIyk/AQrgk9SdF7Mc2t8ug
	Shm2Yc0xmVBkqiRWHz5X9e0KREBbrttnKU17JpJO01xcVEH53fv90ozv1QosJe5c7nvmUru6D9F
	LKUkqOeQK/8p7OkN+ysP9rQQumiqnI+IEJY9OlYCkAItlau287hIoGRhaAojs3WdyYvqmJ2T5+N
	2JuYKA2hxCzrRWY1uLoFUjfptZ19mTOQujQwYlDkGWE6oojUkskPffGXhmPd+eSIG02y/Ln9BVY
	3mK0SmcGmT/oAEx02sUgbMxE/WjyLOjzR4ASftkhWYJjyTTwl3f73tJHs5HM/xJBCGASpTXq9Or
	+yqQBa526zI0D9/KJ9YSBt4axvK0RoFQqsRgGdJvRbzuv2TFehWJXsuTWMHRCNpKDKG4=
X-Received: by 2002:a17:907:e11a:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c513aac21bemr1112327466b.18.1795654189395; Wed, 25 Nov 2026
 16:49:49 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-15-wusamuel@google.com> <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
In-Reply-To: <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:49:38 -0800
X-Gm-Features: Aa3M54ol7ULgIQ7PyJ4MZUA4jeAQllgic7NBQxD7ZgZ6wx9FC8B6-VKox80ApLQ
Message-ID: <CAG2Kctr9Bg+4uz+cKWw79S6qFRPtW_PRDt0rFY73F6WpauXG9g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > +/*
> > + * Find the /proc/kallsyms entry that covers query_addr, or return -ENOENT.
> > + * ftrace trampolines and kprobe pages are not resolved yet.
> > + */
> > +struct kallsyms_query_by_addr {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_addr) */
> > +       __u64 query_flags;      /* in - must be 0 */
> > +       __u64 query_addr;       /* in - kernel address */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> nit: same as in previous patch, I'd keep "sym_size". But hey,
> "sym_len" is even better and follow same naming as with sym's
> name/module, no?

Ack
[...]

> > +       return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, &ksym,
> > +                                        &m);
>
> nit: if it fits under 100 characters, please try to keep code in
> single-line form as much as possible

Ack
[...]

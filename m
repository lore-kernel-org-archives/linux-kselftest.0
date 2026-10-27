Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793136817;
	b=JXl1EutM7w7HOf1A470WS0nXa4erw3xqyoKm08xq/JU77t3WvtIG2cSIjvTrwlJ8tsRY
	 2bU2g8T6caOsnkOaCom+K/mWJSe8AkGK+6+P394Ay3aOKf+hnGKitavXeXUygE8nZ0n0d
	 HLqU74rcoMi3CRt0NdvHX5iiBaJS6j5P09x6cl2lc59/JtaCTwUG/XFrQQTYuICvUuN9B
	 cRcQZs5r1OTChLwaABHHQFysluUZlMyCkWE40sEXlq695eppeHJPBJ//BqC+BsVD+F4rW
	 RBvQ/UXToyrGe/1Z50vIhxDCqVpYBFRYtlid/UcIATrDtifBYP8UOsXJlnedURGn25w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
	b=Xpen8yYLE0a3Y/m8Wuw2tNgp/rbPY88k2diq1hdujSRx2PhwWjOxVFkRC41qlabfGaaP
	 j+3Y/R+zYtZgUHZ5UjStQFeVI0wtrc0c7NMVySvFQtxvw5zi1d6Ot5aFK/QpEDqfKZp6L
	 svgHJGd5UuKVbC+c5GSxdzBUU4rCL5Jq1h25O0y+mXln59gyfkbG3bbBHFrT8tprKxDkG
	 e5/WLFOIHRGpSYUlCMp9BCd5j4XvOQIcrawNlPbk0KJmabAn8Gp1guWkU4QGuJ+pMrB7U
	 TCzek3OEXmeuizAg5l4CeRemDBcRYyuz7a5VlAfV+8RZxwm35TYkWUd3ZagZpqMjKZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7sJnt3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28728606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28728606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7sJnt3w
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so45393166b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 14:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136816; cv=none;
        d=google.com; s=arc-20260327;
        b=BlEp11Eked+77v4TPtWex9wU7hKDYLqTzBGuhSZxJfPLjcnIrtZYLYWRba7y1pDQdT
         EMR2EFlIlXvGHmloIPPc0gCYqrtpqqNnZNL/pzBl/wmANiuBuAkVcRh5c7O/CwJkdVeM
         uAbJ0Y5F115Rnel4j+gIPEj36/bnXTCd3IlpyLO2qwkejYDh7DH13tb9MJw6K1eL5TTV
         OxTj+NvDlDUjEed5Jq1yL+N57ZDtgcgOiSty129lr5HzaJkNj5ZtI3Pn2eRrShVcIBhk
         3Thi+IMMVAKoGN3ILJ/46wMi+kAtcv/ACnxHDMfN29V84XT+e6dVuNKEO2E3I9+IeNqI
         YLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        fh=jzVb6mR2dDh51nkFzNtOA1D0YQg8r/lFWVKYwfy4ENw=;
        b=VI9LsICFEJIOAMdEgPdIXA+Kxs23D31lTw+oJvhu8/uTHaN7D+nNI+lATivGzudpKJ
         GSlnDblVGKh6o6F6CaxMdOmr//knX58ERu2AffBX6YsJ3qYvAya30SFpscLkr3ZKGr2f
         UTHUtsDQ9YmJmiTyfw5TSR4MSqfZ4/mhZSKuvI2wrprrhWH/fUwGL1xT844vBZynjFwx
         MBU0kpVG8TA+8AhW87znDUIkgi6QYYkM+X6Rk/x6kYjwkf9hsudyhcDAKw/hxPCYcO0k
         LCbZtGOaaS+lclRAAUejr9HRyotwuSR3QYA1xjSKVblTkFnFT7SyJuYJ//7gTixYi0VG
         Xe6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136815; x=1793741615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=g7sJnt3wPEA2XZ1mAxKwQvnescy/AmvEeggYBV/bXD3MuIPFGWm+VsYptXHbKr61hf
         4FARY3QXaMPrBKchcQp6zZCpKuI/KiCtA21MlAlJWGy2Kd9S3keQy0aRcUWfbZq0cN6O
         t+ZUnNAzQq8AqLVI+7wo+FVX0HtqrVKwSFypfrpl5HPN5xyi3yim1BdvxmiRypr4LfqY
         icHq1yhYo+CH2xebKoxORy5HUyL1KoPxjFvTXCArpeID1YiAuC25SDJHunNWK9AmqdIU
         Y4R0H7+oxgo+7Mw4vZpkb/AlAZHlVFwc006lV1hywQyMv9pBorAhHkU4CzX47qiQSyVs
         5QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136815; x=1793741615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=PWLnkQXaf1Zww6LfA8vOybqZ52sQgX97OrFM/OXbhl68aNddLCTWrl+nfUmJRLcLTY
         snutmGLorGcAFXiljDmVrSeeheUTI5Nl18+B2/RrUe9De9EZoT7V8jBMRtfEOsQz7fqR
         fGq1hjvV08DUGUeuPZmYT1LrJ6XJVadSoeqwxM0gG30tzVyEU9wGWfF9CJWj9MjCgItb
         7+/2ENvQKHJDFbWptjAP1dFFn6UtKY3JKZ0ijS37yKiffbaw/Ef6rr+Fo/KGVhj/Z7KQ
         ns4ZM6pS7t+4xFwKba3r23frmVIJ60lmO9trstTNVccswe7klckzvaYsbGmLnoX1NKh2
         U/XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjphoODmOMcTZxxI+Er5mbTWNW+1yK+t7DwIRc5vlwFiZIuSDoId91/HGREbxFRQzddQJIGXj0U5Tg+mTP3s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqmoFurcerVzr9r4YMykgZ8W0O+PFzaMqEx9lLlCrqwecxGj9x
	8LS2ITBNs6G/m2VkfGhdWmHpieiMbKa5uECuLfj9pQlU/xOSv1ixBtvBcG17B9/V2NCwz5l+QdK
	j0YweOt07Yhn1v4bqlKU/9i++IZIoDnXRW4CAzMRT
X-Gm-Gg: AYBFou1jxJSIHjGgHLWr2a6kj1NQ5+zhogv25VUr7OBuXHCfsw7rtabpk6p7pah6Oz3
	bm/jhw7E3tAEc4Mn5SH11dCGhfIs9gFRJj22mungUoe3O4gHKPxr7oTwSeC1NDwkqs9mBZSKkOV
	plhrQgPSLW91Q5b9rQ1G4KwMr8R3IwXivg0KrTcYwK6HSZkGxs2tJanwjYgApU8dc8/1s9+IjE8
	D7TPHmihfrDIiXp1d4xUjWi7Wlq/cLA+i1kdRL1kE+1I5+VMYqL4FizA1gPCXwFbNufY8BTdBTM
	ymgbbfiPkjj1kflpCGmDbUCLc62v4RFvXD90GZu2OkwAz3jiFM5SydTbC9BkGai3qEKS8NUt+R0
	eC+8RTaU2ryTvBAssYkfhY0SlhuroP5HocDVwmIhPb/dtNK4Ftl98veKObpv1Ucu2iug=
X-Received: by 2002:a17:907:6e8f:b0:c41:4c20:5a80 with SMTP id
 a640c23a62f3a-c49be03be8amr44212466b.44.1793136815046; Tue, 27 Oct 2026
 14:33:35 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
In-Reply-To: <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:33:23 -0700
X-Gm-Features: AclHuK_RVByZe0xeoKYD7y86VR2bYrI5dalonw-UmAvCLqjMUtZYQFJax9TZsKU
Message-ID: <CAG2KctpaX3Hgbnw4iXqrddYPJoqtVBFq2QO7tvEzhHDjgU_KAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 4:29=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/22/26 5:16 PM, Samuel Wu wrote:
>
> ...
> > ---
> >  include/uapi/linux/fs.h |  41 +++++++++++++
> >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 173 insertions(+)
> >
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index 34c6f219462a..b43f227dad0e 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -674,6 +674,47 @@ struct procmap_query {
> >       __u64 build_id_addr;            /* in */
> >  };
> >
> > +/* /proc/kallsyms ioctl */
> > +#define KALLSYMS_QUERY       _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kall=
syms_query)
> ...
>
>
> Documentation/userspace/ioctl/ioctl-number.rst doesn't seem to know
> about PROCFS_IOCTL_MAGIC and what range of @nr values that it uses.
>
> Please update it.
>

Thanks for the catch Randy! In v3, I'll add a 'f' 10-12 entry for
PROCFS_IOCTL_MAGIC (PAGEMAP_SCAN, PROCMAP_QUERY, KALSYMS_QUERY) to
Documentation/userspace/ioctl/ioctl-number.rst.

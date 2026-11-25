Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638305;
	b=m9GQvf+8SYg4CwlZbDhlI5TfiXPHQ5AK5qBDopqlrPJ1Oxhl2S+sM1dN5JJuQswD4iEj
	 I2rE89eLuacz5iPLhg3UiEFHvADrUF+a3HjxuzIOKyVjo3PauKC7WIZ7YL5q6cS2eN+JW
	 CVRCVTohRDFRzrnk/LlC07UjsjXNZjJjYbhHFyOnzs2Bs81UILUV1UraModPjjDm67ahy
	 KggJCBQfSELPPvTQU3IYDdOF65hilusKi50I/WcIy/3y9jxMguEZl8GjozfLhThqKU39I
	 KELNXq20gL0fZCY/rtoq9VoN0Y1IEPI7hdz9ed43cIf2ZcLNb8Xqh6pkTQqqIDAIQjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
	b=Q5wDDOKIQQOq+b7/EhF29LAvwFELcLRbeEc6CoYQnxUR6y2aiFjLzhnrsZPLhAmZKuW4
	 Bmjb1fxJrPTP6QYnQMgZifCtiT1GzMb+NlMtalnOoNlDgdauP+b3APm9iKBMrX97bslNY
	 xGQDJy5jHHZM/k1Jwzbi2TaSWnDvGyoz/TvizAfbfQffGZC9J2O6RvTpIAyawVnAEceq/
	 joUB196yeBfnvIX7eS8Olw0mHOYOteLXVJSzy50AtM30tW+M8CFZFzjzAQA4/iQOkb/1c
	 5kLb1TLkMJpkMED5PFsutDH1CcfwNbCPE59Bvk0dsHDEFKrbFxC9o0QXUdrYtbkNZIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxpVsnDh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845E2606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 20:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845E2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qxpVsnDh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so50493415e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 12:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638303; cv=none;
        d=google.com; s=arc-20260327;
        b=kpVPS2c8fbXca/cabvA+TEQbdgLD55aVKTrMeX4RxMXrwfiiNqGsn+/X1OmLwYLGmZ
         HAgpCT+ABvEBBGn93i1vP7QyKhX6qFyt1Uezm/qaSN4BAvNBtTvcbMd9cKlym/jTyb0t
         powfOdp7mX9QiqVl2p8xcwl7jTWam7wTI84iEsJDFSOmvxBQo7/QjeHOmeMRiMHjZr1m
         aE8iTTeYh+VYaDqJ2VBgSrhSzrKe03BHq0VA8nG5KvpMN2Md2w2q1VHUcw+9SFM8cydC
         zlgixexguOyRPGEDZjEH63X7fytIYwC1MnFTjHx30jIOu60IVkz9eViI2EhzEYRrPzG5
         TW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        fh=iCglxEVfPB3BF7ovRBtLnnJTY/zaZ17/75HlZJeLyHI=;
        b=iiTdis5XHWf4Z/6QpJh00RBq/pLgsu0VZdXutU65Q1nTov7+3guvlRUmVarj9V6Np/
         X+sF16SFtoYb+LsJOgHWXRblq4vysT5vFTflNXB5Xa47JwqmlK8C6iXReftyPNDy50Sg
         x44WaRvf+CzR5ZOi1Zfj56mfemYKGlJPSkTsBbm6yC6EJdiyu2vtVtvSV+V8/fx9cUXm
         osjd8KNQwdp/Odb3cNjHs/W3TZjKqQmKtbNiyBjoMX3Kr5Hv/ZNCsWjFgCYaUHioUMAT
         qt0xxZiu8GblOQLcAgISXucqJu0t0EACjrgB6z9GyenwhceS/vBg1DyxUVOrC/xmgvVm
         82ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638303; x=1796243103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=qxpVsnDhKpASGf9nC11h7i3rrzbhgE1Ei3PO9P37aCNXYSI78K7dE3d/HkpdwHszrk
         LY2ewZzhpWyuiXGJ9Y/kVXRgwoqcZjc+AjjGTm6sKWOe26uegothRZycWdOMEmeKaehQ
         rcee0VmCBD9LHFqBMRGKRgu5+yxn/QVPc8+S1f0ZhA8k/QuPVe7lO4kH9kZ7PLYaSPsZ
         UOhEiycW2Hi29WbdqTe9JB7fMqfgVwt5DLrziudwFU1jlESg26yCSYwEh1zt9b/mn3Al
         7ZA2LJwSY/mdKqaAvIEdHaHjwDhtcY5fLQiXuVbUxvNBi+V1wIvq+poIXwdOZVw4io/Q
         3/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638303; x=1796243103;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WX1/mD88zGp/ZEzi3ka3HzLWQtdQebUwdPjAokn9YIU=;
        b=rpN111FGHh9LgvuIP4pTphVtHOsbtkIxTDMFSD/D5UhtQunYFCAlGY88Z+6HoqgwjO
         /oeWKhk+o8X9rCYjnp6oQPq4a1V7El6bZgyv794fmzjmhqddbPjjHAU7eEoib7oHw7TO
         YZs0crtKUTm/7JoThFbPMVXrM2fC12kTVq7ZH33Dd6hCJBX+SoNZ8CJYRYDVo00lz931
         0cIZjwShePtO1LGcXLyYRlzFqKSoU1Nl0mZzvWlTCeWIMvHlbPaZU7nOsFSdE0dlX44n
         B4oQ449gJgbDZEVwIKpRt1gEGLCilTE78fxzmEDEJ5YNEt5mh89XLRhgjlcsIUP1ZyES
         BYuA==
X-Forwarded-Encrypted: i=1; AL+hErHWADWswJ6N8AFNhmQ6Fj3jR1+m2rwnQPhw6Psvy4xXbsWGvWzqe5DE+aSryyL+O1hOZpOfocj9z0AaFV0zsXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZWbP7n/fNozixUsC9AtNENQwTToOICad0qt1or61VOXOzNzv6
	4H058NT2moL28ojMe0njmcq9IdIRmL+oBYuLAaau45UJuQlTrnEn6CbuclarhQe7smDvHebXuZa
	anQLBpBxDSGZx/7coX6WGKIJ24Rjj0CU=
X-Gm-Gg: AZFdTZctahsCNMhxxBB2hQOM6qO8OVE4viVrOArBMobXRhqWUeFX2CD7uzsbO8BLnkm
	ts+ba0N2PIlhgKcv1jDr+H2LhHxLpbJG76X2FJ17e1QrAG6yAAx1wMZjz1+8trjWO82gDz8GSP4
	WkBPbAPmfNb/40bSiNEGrQu7qeUoPdua2LeXJfmi3O9FI21kwNWtaUpth+zsCeKVBSfMs5W8u6A
	yZ1a4VLGkipqS6VQB5N0lNVPYxSgigR8x3E+utwcXpmSj6mthvKhbklABkvFNNsPu8NHStSHUIU
	QNGq/rP1S3iUNBaNDBTRE24A18YPmL5nZiL5xIV9eALEWqxBOQKxUrAt5J16RihWCs8huNysV5i
	C13zYM+OPC1roDJ09Iu3PWONHdF6JCL0fVfnldQbT6fmAcbpNHzGJc0SzPRtt6MqB5tO9Bp5xzt
	qCf4jqQu6B3D5FVTwNxg==
X-Received: by 2002:a05:600c:4ec9:b0:4bb:6a5a:782d with SMTP id
 5b1f17b1804b1-4bb88925fcdmr394635895e9.17.1795638302754; Wed, 25 Nov 2026
 12:25:02 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-13-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-13-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:24:51 -0800
X-Gm-Features: Aa3M54paGFwRi6x8xvkBaed95VaPlmoDIEKWnad49yMfBgn6GjtOde1UijdiQkw
Message-ID: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> KALLSYMS_QUERY_BY_NAME, added later in this series, needs to find a
> symbol name or prefix across module symbols in one pass.
> module_get_kallsym() walks the module list from the head and runs an
> export bsearch() for every symbol index.
>
> Add module_kallsyms_find_name(), and put the shared query struct in
> linux/kallsyms.h, so we have a more efficient linear walk.
>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  include/linux/kallsyms.h |  7 +++++
>  include/linux/module.h   | 13 +++++++++
>  kernel/module/kallsyms.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+)
>
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index d5dd54c53ace..d31f2f436159 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -24,6 +24,13 @@
>  struct cred;
>  struct module;
>
> +/* Exact or prefix name query, optionally in one module. */
> +struct kallsyms_name_query {
> +       const char *name;
> +       size_t cmp_len;         /* bytes to compare; includes NUL if exac=
t */
> +       const char *modname;    /* NULL matches any module */

will "vmlinux" match just vmlinux? or how can one express "I only need
symbols from vmlinux image" with this?

> +};
> +
>  static inline int is_kernel_text(unsigned long addr)
>  {
>         if (__is_kernel_text(addr))

[...]

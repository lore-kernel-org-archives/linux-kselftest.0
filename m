Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653871;
	b=tqXIDCUVLQEgT6z/E3J0p9OAuh6AgCGrF9N57QpmRE3dyTKIR21oN7n84GMdkvJwrmxq
	 L9EtuYleQT0BEiNknfEQvPx0lG1cf9tcpNm5N3YxDlD4/yLzpxbtuzZP3NT5A+dByi/D8
	 N7BWh7U3TLIVihAjPJdhg8aZOg0Tj0QPuw+lBJQJaRT2V1Mg54MaWATVVx+x0EgACD1oU
	 w/wrt/6h0mssHTvcrmchRjm33iESjkDmHkP76zOgoOIlXtMUFjt7z/84chP6179sA2GkM
	 RhzgZZR/shxlw5hgPpVyDUcmeIJVWRzSu1X7nFgTgDmBHO/kemctpEYSUOjecWv8HPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
	b=GJtBQgtLtINAJGO9pG3qPX5knRQRx5NHRqn2gkbWwWH7kFLIg7ygnSXsMuMDKpUi3saL
	 fCs/1VgA38vFixebbs4pEEdTT1I6n2mEO42RXlYayADL2RE0CIeuaS7ADFdhGg5wHVvLJ
	 hteykG79qgNXqqcy1TILbhD3eOYfPZTR9DCL2CjctLSn6nDbP2RvXQiePUSOLe49VFuCh
	 FwelbPIZnz79Ww45RQmcfCypTjUhkh7Z8NHqMfQKkqVzm0cNNK4x69jxnP/yvwMhLWseH
	 zTiKotVw64eWfDo9kyQYDAKxxvK1/1HPvhulxKKEhu2bvYk25P4jt7zCOIljxZAoyOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TFVWM1nN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855FD606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 00:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 855FD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TFVWM1nN
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50aaad19fbso710160566b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795653869; cv=none;
        d=google.com; s=arc-20260327;
        b=LeRBtQl3ZsF4+UiqZGBkDepr33CLwTkRFYo0VBf2rruLsXdRSZ/iSUL7za070Mc28Y
         vkFATkiQBUspye8q4HbI2K02wymu1GjoK/gOkH7Vr27T3H3I5BfcAUKpdz2/tx7vs9BR
         dZlJe+YVP9sl0Bii5HypyifDrR5ko+LFuzM+j1uKmEdbWko98Dcmk5OQ0thw2OoeaS89
         VRlsXQgLm2r4LbrpDZ8wS8zN+u0AMUmEmzEzSbi+TCTHJOoxiAGmHt8rTgQtiG4i5mjH
         U1d8LrCdH3/ysBL6Z6VrESotsfNCvXO2o7ue/Uk+QqhsC6qE6lhgaTvC/xpEHqhpM+l9
         WD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        fh=qPIGyJLJ9f2CzZ0NyY5TEhYNoWbnTStyudq2hdz0c3w=;
        b=RMGQzESIxm92cFuWQuL0PtHx6htOaHIiD0ukt8PN7cnNKYeHGecrt5hdrFo6NC338G
         f6BioJG1K35iWt+dN6bIYsQuyttGwxA0OYD1NJpCS008PrSYpm+tIf/3eG/GdLm4zJGY
         /tUuCCSGIPdovAHDZDNslY3eHhYq+a4RkEnVjtqLQMs338T8+ex/vC3vncL/zCITJGyo
         P+lULIoXPNcdOafyob8biJrBDGNEpQ/9QCrjqskQ28bww/TPcnIJtytbtLNLo/mlz3jF
         1duRpYyFt92D4uas3KUWZILvTsyfLUE8IyER34VV6rPoC8epnQtkQC4wnP3zJ+3M/hB0
         XYqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653869; x=1796258669; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=TFVWM1nNu5gApS+aRUNGAO2b47beOviKXKAUtZcibEAeTqBUzqYaxbl/Ez5VQvaHiJ
         TXrTwu8x0jRe4t5Qky6cuxp9+qXTOVpIHPYaRTuFvweUNvzRuyVro3GhlyImE69z5l6h
         8+10BUgXaVnSQdQJL56ogVd0eoghwHYtJzCo3zCbsQwT+vD3SGCXtB3FiXNUreuGXelJ
         f7VR1BO5S+hnTUr9vyAHKXMc2Z8rg1qIpqzDfb7vnBqg8zVirP17bCZUWs0HZkfhTJwL
         aGZZfKvpUl1Z4/v5oLfuk517qMaRDnLShKckyF1bvlHNxOJLhAHLt0pu9I70jGnqlzcF
         ZJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653869; x=1796258669;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iVFnQD3imnTlv+9jxnHkNU96izoDIFXplUev078ijIQ=;
        b=Px2MHTIsZWZEu4R/23wz1ZjnJfUwdRDG7UajKIHGr7lqbX0LPs13q4ZU7SBc1u3CvM
         iu+6BvwD1urlIvSWgf3klqiGwZWPfKYPWpYtJx5woC/HVz/4zGEAsb1PzdcfF0JW+aXK
         E6okJj73d4iPTEfWW/9nKLS0uvpK1vwDAhlcNDGoF4Setx/p2IUH3nsauA+etwKaI7Eb
         oXSgAD/NrDaBOf9h3hUYUOpZQN5ObKyXo2jbCj3K3f8YWXdN/GdBSsIphABh+xOrlf9W
         hBxMVos7Z9wWhfq2eAfUf2rgWTcF663kKTDkTbMylnCBmI1qJPUCtsOpY9woccNSbhz8
         79tQ==
X-Forwarded-Encrypted: i=1; AL+hErFbqxdeD+suwPJVKf4WgLysfMTIseF9vg3iztZtD3th1u8YEm4pN3lo6ZU2QYbYms2zQeTn7cxEJdrxx5kB3Aw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5q/adsB+9PSfgjmpHIWvd9LrDngaG3IhUgUkQ/walBEeNB+uC
	R9Qo880p9dwQTgTMpZBA3YDUx7MT0iRlRJtXIO/fgUdBBkvRBsnGVXS/Flc3NTVI59i7gS3endd
	4DK2M6n6r7xYgtPhVgm2XrEoHZIi0TWDFVyeKlN8H
X-Gm-Gg: AZFdTZccsgHIFVpWFl/2N4rQYdJwgOWWGrSHCe3K9QihMqxXa4raF+I6cR4qJmhCE44
	+48jOITTY9M1fTYWbRi6F+1IExeKFFUkDNk5wXcn8Zfqgd90MnUV5difpR3Lv2Q12iB2KgjLK6Z
	1bZbYmNihOQ+NOApaNLxKZ8u4YiNVvE+XT6TPPFx5+1aRw81FGzXcYuUo/B97Rap5wuZZzlYR3D
	XaC2sWB+iseecPd2TSP1C9i+tKZEcPRHiCyfUiokmHacbfrGECa0lX/In2XU8MXCn+y+dZvWzwt
	Z6K8kr7668S4nKWn7sQTfmg+oSgTVnfjp+uSNOdyDaVPrSB2FDisCY4VXcefn3PjSP5h134VYGm
	IrPpPeotbIcRTWYXxltkRDYwKkMgAA7v7zTL8x5CXhuAKGItXy1KOIkxlBuY1vomul4I=
X-Received: by 2002:a17:906:6412:b0:c51:24eb:e5ed with SMTP id
 a640c23a62f3a-c513aabb094mr1147878466b.42.1795653868573; Wed, 25 Nov 2026
 16:44:28 -0800 (PST)
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
 <20261113221248.3535369-13-wusamuel@google.com> <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
In-Reply-To: <CAEf4Bzb6LQmHHkvB8WBezU6YRtggycRvvA3L03mQHDr3WQM6mA@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:44:16 -0800
X-Gm-Features: Aa3M54p3EatRpTsPAm_mcmxJ6hPDpQs1114Xl7F84nCmfTvZhGsQScuZoJFkxmI
Message-ID: <CAG2Kctr+6-EESkYn+Dspg0FxTOMFRoj8269UZaNNDFNf3d+bHw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/9] module: Add module_kallsyms_find_name()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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

[...]

> > --- a/include/linux/kallsyms.h
> > +++ b/include/linux/kallsyms.h
> > @@ -24,6 +24,13 @@
> >  struct cred;
> >  struct module;
> >
> > +/* Exact or prefix name query, optionally in one module. */
> > +struct kallsyms_name_query {
> > +       const char *name;
> > +       size_t cmp_len;         /* bytes to compare; includes NUL if exact */
> > +       const char *modname;    /* NULL matches any module */
>
> will "vmlinux" match just vmlinux? or how can one express "I only need
> symbols from vmlinux image" with this?

At the ioctl layer (patch 3/9), passing "vmlinux" in query_module
restricts the search to vmlinux without calling
module_kallsyms_query_name(). I will clarify the comments in both
patches in v4.

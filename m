Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CEA30C620
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108351; cv=pass; b=Vah0YJw/T88CCHSNLBkOvtIQAMMM8uyoZTeOnq19y6R6UXxofFI9TRnawIKHzrACgABqANLG4pCaN/dWgergWUJrFeWiOTlAByqOHBZVQ/53G+NdsQxRJ1bBoyJ1Cj5CBNJQRLg05weoo2Dt2ryRubAduA8tpFg6DlKGgVls1xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108351; c=relaxed/simple;
	bh=k20f8t1EOV/HEyg7uqeU/OGvcbfXWsNUgp/Vg457HkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsebSQTrk/ZQAEG1qrut/xjLVJxT0mWWrp0X30X0cvPOtcX43OYAMirKKbtmNW4qpXhGhoRfsjZcYcsPzw6mI8+yxu+dHU6Q/69l6EJKjYZPRSmQ1vse+GpodhK/B8UdkSCqT65zWz/daVwiy7ISUjO8lCVz6e+Qtp4HyNR6ny4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku1WSM5Z; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku1WSM5Z"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b2965d4bso7175368f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 19:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773108349; cv=none;
        d=google.com; s=arc-20240605;
        b=fAnQO2ptSTq09Tqd823XG+WrmAmYti1+qWGTV0WuMwoVwJvPKbSVSm3J6KJx5P8lmJ
         cGYRaeJ9aNbDaeRHTmN+abMkKZEPr+vx9WehTeO8azFJWrfu1EnZNpJLMb+EXZ+Erhjj
         ffJNXaLiEpwI244JpYTRMq6B/9nyijdzPTTM4VJdA/UD1MfMO+BxGAqJulnxLthgyoHE
         qDWVu8y05Z0WPNogJrMN9T2LWF/sgxvkk8t7CcxUCD6/vPYOBrBf3/JHSC6t/ZJxeN12
         v0hY+Qdc+sfOeYaW9uGTGjCt1CB90vEGgI7CxxVyaE27y2GwgFI50RJpISAmv/VRCnp7
         hv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xnHQw4FSCYovPcBM7FdZ3WfrebkEeQSNBMs5Gxas3Ic=;
        fh=Ms5WGiS8D0fqDz/mvfq6S8suBzL1wTuYyWaI72WnUx4=;
        b=lSLUMag2iWZo/2+JA5MXjXqXkod+ioQfeqe1RFq7DMuGJ9DjogEJBxbiZ85dPl28sn
         UXIXUp+kO1p2YNR5BSVtlyJZFbYuIE/sC5VvYI4FpgUGIV3Vzn3L7shBHJKHeo2FZaEp
         Vz8Hf5cEFKvOfKuQF2r79yZRjAN+8j36qbHkMdC+YJV65OcY6KKOn4iiBUBWPyDXZAk0
         ABNUjFCvJXcT3HujOq24LHZqUcPyiNb2tsnJr738urSrdZPUs7uqCRGHdRD3a5VdB80g
         cqj78uQio+QulicxpXgDy4thCPU7ZbiGMuHuY/O4hQ57hmLGDHSFxlG42lCm7+6VFyJs
         wbFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773108349; x=1773713149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnHQw4FSCYovPcBM7FdZ3WfrebkEeQSNBMs5Gxas3Ic=;
        b=ku1WSM5Z9CA/HHlyScKafmWYbY9m+1kz0iEmj01TWtjN8oJwlJGbpc8OuKjqYkzFl/
         bMaj2VaaoFApYVdFrS5BYjdmGuGgdJrdDIP4gGYp5xFa7n66TD6Mf+P4ZEKmQEfEw9Cd
         yHTTft0NiYjU4Cgwm1VzMlCv4EDMSwua1mWGfvjT04c1sD9jeyNpndL7sWyvpKYvumBk
         kjvGPWeByC+Un3ga9Vam0wVvzdpzqBKjRLHVK2utKRxCac7ovTOso/eTg6Kh+Uwp+O7O
         t2wBVZpJ8VRZW8xdIEx0dX1P4hsGJs+aUJWc1sZkIkkytZ28l5G7yzp0XQWBTyfPguOM
         HuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773108349; x=1773713149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnHQw4FSCYovPcBM7FdZ3WfrebkEeQSNBMs5Gxas3Ic=;
        b=nD3asUhIfU9dqQEwcu1amHqxIt+PegzucIqGxmOiv5+YiSR3LkZRrkU+ZN2WSxoe1O
         +fmPW/BEDZOY4Kt8YK2cGaSvI2kZPh/x372Pkmxjv9aHdlF9TfPWTAeM0ucsLMBmxqIm
         /rfggFPtYWbmam7ZPb+rJa1vPQiCN82aGtTrUOz/Nmp7rjbM6vILIxy66sP/2enSAdIG
         +yyg1R/+MsrcTaNIccGuLaCrLCiZsKoLfsAJ970bhTtCD/a3GQ9VH8mqjWmsmxMK7Jus
         VQhWlkyI9kjZmJ3rGC80uh+oLgJyLVY+hAUJZURVrVdceGz3FegJ3wZkDNsbYpyr7rDc
         ZBrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGmIromj9Rx/IZrraSC9pKMmnlLDmH4bbLBATq/8B38T4wm95rO4/37BmNjVQI789Fg59ahGNm3cwDyK72ld8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDyo0F7PuBvcT+tiYQPOtFt9bySSraNtoMvTHnQAkrDjWrKQl
	6yfdlaFhmuLZLI/HLcxxlRcQcxIMRHcSCKVoFbxznOl16pdSEjWUiOm/C5FMvy5J069ABBSEGzZ
	fKfe26hzTHxz93Op+eiESsMTT8cB8VP4=
X-Gm-Gg: ATEYQzx9pD5ELU2zbbe7OLs46dMqBfDhdRinG2vdOWCCPCaekF/jaCIzV1WoW61GKYn
	rNzQyFi00W2YcDE4z66YPPxFeQHGPioIH4XgxJ+xkBwjaOtYXFHkRl71wOAbHAWvC3kky/CKiya
	GN8YsXaKZdt4Hw1qWTWgOuXgQ7IGyhOE/LKUOXjF60WUIDXD7O26QEvSAtvTPiIbr+4Ca6DTXVr
	i0WlhPKDeVWmu/WRKICy4SuxKO9Yv4UfrlrzfCQ4ZJV9oY5u5oONoSZkNEUbuQSeS5Fa8/+ntVI
	NwKUmQBRbyEMX/YYIrcOsCvnAXtFr5DMpB3paHPIri3ywfhijGLfRSsoYyxbTD9jOcS6atVMDpM
	txjZR8Ei1Q+Hts5HmLUAib3XVvg==
X-Received: by 2002:a05:6000:184a:b0:439:b81f:ada0 with SMTP id
 ffacd0b85a97d-439da86f76bmr24055151f8f.57.1773108348613; Mon, 09 Mar 2026
 19:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308134614.29711-1-pilgrimtao@gmail.com> <20260308134614.29711-5-pilgrimtao@gmail.com>
 <4f40d120-41d1-4723-a410-63d095d2b31d@linux.dev>
In-Reply-To: <4f40d120-41d1-4723-a410-63d095d2b31d@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Mar 2026 19:05:37 -0700
X-Gm-Features: AaiRm50pGcnLkggy7DiI7dJTNRGaKrpS8VH9Vhnq0M5rsIFc9PhWMcBV-OUE32M
Message-ID: <CAADnVQLC7c+Spmk0VoatWsjA=ok-ofEOxp11L-C1DR+=GVCcTw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 4/5] selftests/bpf: Add test cases for bpf_list_del/add/is_first/is_last/empty
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Chengkaitao <pilgrimtao@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Chengkaitao <chengkaitao@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 11:44=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> > +long list_add_del_and_check(void *ctx)
> > +{
> > +     long err =3D 0;
> > +     struct bpf_rb_node *rb;
> > +     struct bpf_list_node *l_node, *l_node_ref;
> > +     struct node_data *n_rb, *n_new, *n_new_ref;
> > +
>
> Prefer inverted Christmas tree style.

Just to clarify.

This is not a requirement, but "nice to have" in a new code
if it doesn't interfere with logical declaration of variables.

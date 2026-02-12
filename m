Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAB62AD22
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Feb 2026 01:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770861387; cv=pass; b=EMwQYFElmD/LztMtg7qqGiLEAWbbhqwAR4vGZINRzEf3D3Wi+RaexJeH/AbOhWmb/ZmUF5KamxvrWQiDdul7Y0qFO+oOd4luf0MutvHFA1d9NJIlMBg9uzIPWnngDZdjonyHHd4CUORIbfF7edV+b0Bz10D0HVbNJ1iBTk1KsH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770861387; c=relaxed/simple;
	bh=frWKgDH5s6+x8xNUS5+okrMlTZrWCJFmfSis+/4QHEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUhKTH9bJazlsBaYv2D339yLsH5Xf+1gwbR0vFccOWs0W1nszsiRpPZSuam1LR7FrQCrxRW7XkT+96jRrdYDCtXQvBMeW4sY8ioZ7Cw8/HoOtgjB5oX48wLKsvYg0U9qC0CeviGL9yGKe3yi7EFh/wi3IZpSAXGyA0hRjsDXwi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkSpx6jQ; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkSpx6jQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a316d89so2236967f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 17:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770861384; cv=none;
        d=google.com; s=arc-20240605;
        b=DRZzjXlWZdkfVLTT2SF27k4PrzxOjMBJrageKfqI1CJ+K5knGisRuvRsVmtZurCWQ+
         YCpoQ1okBt0pReUOvBwMtbis8X7FWLslnFWF3JUrBGSVVaAJB2TajCxtJeV4Myx8qQmz
         PYFLcaUslbvpIaGW0VgxTOkRWedjXBUClATUpJHNk0dqdYiFSXpXafUKSJojavXPOUGZ
         1gHn74VyXa2FA0GC/hVWEBC+Jb/TAj6zAxmZUGqP7QUQhSmGAO8fLK+MYnD9GGxrf2FL
         3TDfZXU7SoEL+763RnSntkixU5jx1/Ivb/rBodPgz23mvfZl49porlHJn8k+7E+Py7J/
         uekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTq0b2jT5IC669GVrEU+cppahygOALNim8bS9Ug7FH0=;
        fh=r/FNPyNijEhDJQiq0ab5mCQCp6Z2eOIX5elXbHPmoOk=;
        b=WVI+3cBVffGVVoVutOmafMEG12fGer4XK1Ow8wOQyGxAJfalqqnBPHIOhTxigJLvoq
         bij70aW4bUMPfFwFiinEC8RiLCyAiWND0ZhYyO1vnWU3cglMh9ubb3bIUREP6YL8AnXG
         PcdR3MwnauwKDv6SI6S+OxP+J7LWZkhJsNTvJs1T/2a7rS8FBdjiyNdnO/1oomt7daIL
         GTneCc55/tgTeNRyfuL7b1xpWRGehD9e5a2bNj3BdNxEa2+nJYPy9Zujx1QjmzINMRM4
         uQsW0jtw1fIUtKLMdxh0QB1o5koSJ2dNf/EgaSN8l5XG2Wp6je8vjGUThmdZpx/5MzI4
         hCKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770861384; x=1771466184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTq0b2jT5IC669GVrEU+cppahygOALNim8bS9Ug7FH0=;
        b=nkSpx6jQ0ouv6NzI5gSTrani1DdBkD/wFQ3JpPMAIOimG7QP8X66BeHpQJHbgI6uKY
         EhLyXpkuWiTOnE29k1xcBhp2Q6bs5IpIsceRVh9TiU4snwodRD6lHtQECQFHAd+T6EtG
         9GKQgexheHU8I9LdgNYKQknsGXZZIsq/Q7vAjONevjb6cfkWwQwJHuOgGf6+DvTRDI5a
         /fjK/tiq72VEyw8D8tyXkhF+PjreS22+wyKJOdb7QZ/UeLjGAZi56fltdyH5ze1qRMFZ
         7i1upNsg2UxatO9QcQyXrJCoeLSJcKF2vkDLMMh0KepO1Nlv3yWKni+xzEVW2cVVCvLh
         yNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770861384; x=1771466184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hTq0b2jT5IC669GVrEU+cppahygOALNim8bS9Ug7FH0=;
        b=YZ5keoSZZqB3F+9wJ09vjvqcQSYlDuag7OaPzoeCIMByT2vbaRsaVhRa+giETOAWi8
         cdmp4xJC0RuHUnLG1kHuKCy6TYsO/WXTLa7+1++ZFQgwnkMNtFk7J7QrsN9is6r0HxZV
         gJTzrfrBD0UB8ibvt094C9s59Z/9BC8Rg2M1TjcgHa5igNMVw2L+FPTvJTiIx80wgnwu
         v8LMc98xMd4YzTCqdS97yrveqes4qR77jLcngpnrfRyFL82nMsse1bXrpx4se48fdWLQ
         ow+QvQMTKYcK68hyaIPWOXnAMumnBz8vtBD1YqECgBkTTAul6pj4zUBM8p7lnf+RlMio
         4kGA==
X-Forwarded-Encrypted: i=1; AJvYcCWxwYw5henwlwM8eI1Ae/IbsE1a5fIxAeDsF2n9bkH0vkDG+kJtv8esM3ZY3pCQVZW/AaQys35UO8xaJzb4uEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGefnBcGqPg3a3EU+jtRTcKxnWiIZo/ff91pQP+/VOSKWSWpzs
	qdoR06diDNq6uztFAEbK0YU3n2sRLHSnMdmRMQHF6I8zgK9FUXASqyboKlMWDNWvnGeQzjCWtw1
	altsSaTN7fg6/zaYtZr+l2D5ZOJVKyKM=
X-Gm-Gg: AZuq6aLCBBOxrQXvLJNV8fS0IJm8WxHScJmsDmlrqXbmrliq86WkfDezXPYKQYjDHt7
	+4J+mn7Qhw08uOWF/U1DjNL5iBuNkcs9vzfwcMe9WIu/34KoKDHs8sDhKdnxg/Gp/iAk9iMfV9m
	FmQ4tYHYQ4FDwc3tIJRJYh34H9ncBtNggZMmyHpelLBAqI36Ky8ZPXyc57AiNv6s+0DJfLKy6Lw
	dU+YN81Lp5J71rU6UGWGGHSUeReUi82DxDipmYwTFpdETycuaNyLceXMxifVebOz97WM15d7ZqY
	mD3kV42Y7YWoh9In3Zga5OuS3canzmp/1ZGmXSyyppa/O6XjLpkDSk56PrCw7Zd7WKCcUSX55rv
	Cbs1OtQc25GfXRtew5GRl4iaJF32fGSrAB6Jp
X-Received: by 2002:a5d:5848:0:b0:436:32e9:993f with SMTP id
 ffacd0b85a97d-4378f1287bbmr799251f8f.3.1770861383994; Wed, 11 Feb 2026
 17:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209025250.55750-1-pilgrimtao@gmail.com> <20260209025250.55750-2-pilgrimtao@gmail.com>
In-Reply-To: <20260209025250.55750-2-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 11 Feb 2026 17:56:13 -0800
X-Gm-Features: AZwV_QgbUPOCqax4vo6tL1O5Dezv89cLftb45HLIstLVEAqCtVnRNwq9HWpLVsw
Message-ID: <CAADnVQKjBdfL17d0H6eHdiHYbXOr0Xz6BC=AbwMctQ6860-P5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] bpf: Introduce the bpf_list_del kfunc.
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Chengkaitao <chengkaitao@kylinos.cn>, 
	Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 8, 2026 at 6:53=E2=80=AFPM Chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> If a user holds ownership of a node in the middle of a list, they
> can directly remove it from the list without strictly adhering to
> deletion rules from the head or tail.
>
> This is typically paired with bpf_refcount. After calling
> bpf_list_del, it is generally necessary to drop the reference to
> the list node twice to prevent reference count leaks.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/helpers.c  | 19 +++++++++++++++++++
>  kernel/bpf/verifier.c |  6 +++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index db72b96f9c8c..44d9b9ea8d40 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2388,6 +2388,24 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_bac=
k(struct bpf_list_head *head)
>         return __bpf_list_del(head, true);
>  }
>
> +__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *hea=
d,
> +                                              struct bpf_list_node *node=
)
> +{
> +       struct bpf_list_node_kern *knode =3D (struct bpf_list_node_kern *=
)node;
> +       struct list_head *h =3D (void *)head;
> +
> +       if (unlikely(!knode))
> +               return NULL;
> +
> +       if (WARN_ON_ONCE(READ_ONCE(knode->owner) !=3D h))
> +               return NULL;

Existing __bpf_list_del() is actually using 'head',
but here... passing 'head' just to warn on it ?
Seems overkill.
Pass 'node' only. Then it will be more list-like.

Any other apis are missing?

pw-bot: cr

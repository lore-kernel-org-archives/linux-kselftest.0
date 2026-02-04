Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03283A7F6E
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770236099; cv=pass; b=dQiYa8woA3kJ1ZQYzjLDo27ynrHSbnJRPuV4tKx2mIShcLMiPQs0znSzli0zQClreQKzGckGu2sl3mfuQW37/pXMofYpm+Bd4833r9EorpAm1SLS3L2e2DkI5z30TcS2Y6emFeSSUeEvvDiEWIE6qw0yRIGLDuHl3SiIZnNrPFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770236099; c=relaxed/simple;
	bh=3XOUAy3XIIn08AGjDN/QS6JH3XCKP3Voe4vAPQObQ5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0A0hUw3zUKhpUXJXbi8yFpZQsrTDJkDAYoksfLFFllnnrwGPvADepW9zebkF9FyBQyMc4iO3LEhoFqq3lSdhX7NqTS68DXit6pZoui+wLa+dqq2ouMgAJVDu6rGnJB4lZliRHuZs8FqaqggugSufHUe/IYCGJyxdNF+A+S2j7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqs+z+n5; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqs+z+n5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so172767f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 12:14:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770236098; cv=none;
        d=google.com; s=arc-20240605;
        b=IEekQVEZPqUwFpGEGEBKd33aVOq63SBPkf0l3UbDsahl8KubZVmpbP/C3pn5AWYUhx
         IT8Ic3MO7pPgOjz43lzZIqm5TMD5u6eYuvlvRpt8P7p2DLGMh9SNXYnt+cZLXLSKiKF+
         3da8VUo/Hq4m0Gc1+SphKeSuKSPhqxZbBvw6Y3bLWeBeKEAG9WJCufzTIcTVd5+ad6Hg
         tmoTUSWWwb/QXt9J66dRZouiuGhdWFbQujqtTDqSAxK4fGyLXjDJYY9xZsyrLfPJl5bL
         EX6tA0/N5nYETfVENFVVeMmhi4OOFT8zxga0flu84AONmneQdKwah5mOSPX71yYCsgIs
         3mEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mkiN7mFgrITdHV9O50DWF0sIOrkOU+OBcsroscUTkI0=;
        fh=JMWfVmRyZR+1Y4+ZtBrJ8XZ9nZ0HGMmxQaEbrVMknew=;
        b=ZccmZdQVZFm+PQDPE5XkzX8O7+XJ820aE9IbZI7Nvi6mI3EalbWFLPaSexwfw70iG7
         K3Uo/EERC7QqDm/hYS/MVfEb5cGOyeeDNkY/uit0eOICktQUjBPumGpd2eBsexNObKVR
         nEAdoPWLTVgrH8jDGOMV0EWkhI/R/sdN4EPd64ySxegmhnIzon6eFGe2S2PggzIyah3Q
         CTLn5HYw0oRSWJkiDiP/lxDiYBrYj29YVYO6VRmhEoNeyQLB9ntfBdoWTH19mD3/Qq8K
         QNDHpDLdBV8faYzoIdcTEos1w/Q0cYANBNCxhd5Sg/ONOntp0ft/7mirlgB8sp2CMpQc
         +RHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770236098; x=1770840898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkiN7mFgrITdHV9O50DWF0sIOrkOU+OBcsroscUTkI0=;
        b=Mqs+z+n5WxBiO7kMqf1V6wR2WYuYti6pChwKSKEIYJB8cb6dSpRXg0lPgGsj6b519z
         27iO4sSJfZat4DWYDVRneTTbCo0w/ZkfQZ8jGZnrzpVwD4C2e1K2VSVM0fj92KbtdvLw
         YV71YM6cWLMyI5QUTSGtP5K+M1Atrz6TZlyBFmOsC2jB2+Da/c+Qgnj29PPytFUVJkih
         Wp4CXgnIH6hA6d3p8/i4VAP4nZKHblZ6rK4ScxSmfRrxm3OZdlHSEYEWpzXovSUNEeOx
         p40y8b5OBjAoC4EJPz3PrNImtf7NI8j87+KpeGYRsVmdIPGewi4BKtGk6A+f1ubqjXgb
         B2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770236098; x=1770840898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkiN7mFgrITdHV9O50DWF0sIOrkOU+OBcsroscUTkI0=;
        b=F5STg/KmO6LogtWL9dppoGDfu9MGv0LbWMLwVuRepAOCK88wKjCxnQK5aQ2++sxBKo
         QMNKanh4zQH84kU59x/999SI2dpbykhqQE4dDITXswKTeERbvEwirf84X07lxLiePvVq
         /JVNSvr8Zpe2kCzOzuvL59TmB6kkeLGDgmZlb9Y49eeZhUzDJxX3ttqr84mBzDY/TBFC
         xz+4S9RjjPvS2FycBj+uxehsxvQa9Ql0a857UVLrMSZw2uigt85IJ988Q0EHCtf8Yue9
         7ob/CnFrEJl0pgqp5602i5CEZE7LzUJkXCrYatIyrAKUggITm6/mN5ZmooL9CNg7BQoy
         AVoA==
X-Forwarded-Encrypted: i=1; AJvYcCWjG05qI29eh88N2nk8hsUdHU60MMPk3ksrJimXn+lMGu6fB5p6h22jrdvBHnj8JdHUnWRN5Tehuw/mRUYqBHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZXlmbgv6KTyTypk3olFyDtukCUoD3NPy7IV8ILy6U2PMcPRs
	pX9uyaoJfGJ/5CAQLoqV3ymdaCxZ+nBwxfMBNNcyiPkRB52TFo5bjl0MwzkLBE8aR4aYMl0uyk+
	31VvmGVdo6wV24MvWgHyLz9uReEunmVo=
X-Gm-Gg: AZuq6aK6PczeeTgibPJkpLi0NSpWN/EvUOlOFLPMBwPAQKoW6r/1wTvyLELIyWbl9GK
	sT/EgDOgUmSgMwU5TQkgfpoy++MEsV/OMX8OE0v5GqpMD230K1h/64ts8qMap9d3riV6IjzXKr5
	asMKG/xKYZuYIYfS/lcRpkTADAA+sN84KFJsymqwIDeyo+SU+iyf27qFazQNqN6XiPhDbwKceOm
	Sch53Bnf9fFHUTujGMhyNkuL1nxK1H0J9D/6sV83Brhr6WqXkN6tBS+IxmyxIxMmwzqDpjMr5br
	ZlPJ8kE/mwScaYlDV00WE89RCzm9qp+7tB+4S6n3ErQgL3LCiGq9w+ETK5wyfZsTSYv/uwrqEPS
	h3JSl79q4hlRwzg==
X-Received: by 2002:a5d:64c7:0:b0:431:488:b9bc with SMTP id
 ffacd0b85a97d-43617e351camr6268378f8f.10.1770236097724; Wed, 04 Feb 2026
 12:14:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202144046.30651-1-leon.hwang@linux.dev> <20260202144046.30651-10-leon.hwang@linux.dev>
In-Reply-To: <20260202144046.30651-10-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 4 Feb 2026 12:14:46 -0800
X-Gm-Features: AZwV_Qj_M0j2QuFHcqb1uasQT0CwO6eJFnjOQYZ1YB11d59OLhbMlJUDF0EXYlY
Message-ID: <CAADnVQLXWQ8Miq2WBoXRDsEVP1QPwk=a5=Rj_uPN+9qKHZZmZw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v9 9/9] selftests/bpf: Add tests to verify map
 create failure log
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, LKML <linux-kernel@vger.kernel.org>, 
	Linux API <linux-api@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 2, 2026 at 6:43=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
> +
> +#define BPF_LOG_FIXED  8
> +
> +static void test_map_create(enum bpf_map_type map_type, const char *map_=
name,
> +                           struct bpf_map_create_opts *opts, const char =
*exp_msg)
> +{
> +       const int key_size =3D 4, value_size =3D 4, max_entries =3D 1;
> +       char log_buf[128];
> +       int fd;
> +       LIBBPF_OPTS(bpf_log_opts, log_opts);
> +
> +       log_buf[0] =3D '\0';
> +       log_opts.log_buf =3D log_buf;
> +       log_opts.log_size =3D sizeof(log_buf);
> +       log_opts.log_level =3D BPF_LOG_FIXED;

Why? Which part of the test needs the log with this flag?

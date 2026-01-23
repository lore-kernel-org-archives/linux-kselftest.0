Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D497338A2AC
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 04:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769141583; cv=pass; b=h75TWlBObcZmB9cIt50UT1/1UCAT3IQP8cqe2/w7Zrnu1ydw1w85fPUqzOyn6n+39hEqprQay/isa0FuFgW/ZPp/Ycm/70Hc1glbTGbxrTNyycFZvjkttR9cl1jiXaKgSt7fos/eshvBwTk0o0NGK4G5sjdo4GWSXTrm5kJvNVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769141583; c=relaxed/simple;
	bh=F1TX6MY+wTluL5db6qCSz1RHUc0piPNRg5C3FLD1mS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PF+L8jes1+EVxve1KRDxBLmFYRtwekVx0m6USD2nb/Ou9jVUe5zbwCco4QsVsRykEP3H0YkY/xCNtVfkw/MAp0f5Yps076cCqnS+ZD3TEA7ankpTQ3uTcvAJDmLXPI+ezNd0k2pfTGq0pnBf8Y4BM4VL4xji6VUK/1+WWb6Ku5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0Ptf89i; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0Ptf89i"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d28870ddso955576f8f.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 20:12:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769141573; cv=none;
        d=google.com; s=arc-20240605;
        b=MnhEEmlpdb2mMUiW5Jz65rrb8WNK0bryzMeVdz6KxnlJ3DJXn4e5KTU5r8NYzmwrEq
         7wE47i2FZT6Zpa3CiddTEnfddtH2KonVtuzmbZABNX/XHCocUMTvFtwvN+eBWlQEhVV7
         HNNdEBWT0swZ8e3r/9MHhTCr6xkagorql+4P9ZUboSQSB9JvUdkXyjqKYSyrYdD0cNkZ
         FBbWFawDmUuPsoksZfnRBkxmx75PQArrA61AKp6UZsv21KV1mZgJAy6qhD+LiyhWHqZj
         q5qzVgiCVa6C9Rjk4zaAz7gVdyFJNzbWfLYmO32J7J5+LryH6G1ZIL9diPaz6UtnU48q
         qKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xoYwGgOSNtj/sexTnahA2UTTs50xESh2s02cVnq6nI4=;
        fh=ktppMSuOS5lPuUKvZida8O4FKKC+OTHRuNDpXkAEpK4=;
        b=PJS09qA2RzYRVzIuohSxYC04zxCDkB8SDF2I49fFJ2jqVplTVnuqkXqHxn1JdvC8om
         jZiu6yZ+cQS32gwvDJVJPjt89SB2YIAV2X10ubV1j6QBXaf7WcfieY8VDQKUj/k1TAnR
         24ASbWxC6JyeHgK9tFW48+3SeAg5Hgyah7CVkpysl6zBkvMS/pQ0en7pJ8t18ufHZ8D2
         zU7KjVVgCgE5U47Sw/GpcIpkDQ5pGTG9yuzgW8U6gywwTO/pyBV5Hoa7vjYRcUJT4syJ
         dLDWOlBnCM76s4sueGo5csgTXzGSffvHldtUh+uyGDye6soJ65X1Jx8VP3GLR1mXaFXq
         eAdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769141573; x=1769746373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoYwGgOSNtj/sexTnahA2UTTs50xESh2s02cVnq6nI4=;
        b=g0Ptf89ih8EdRKHS2frx3Thnt7GrkTjC/G81050h5xOoLuwZ/vSpsGaBW7bz6Hw/C0
         AtqBI48SXcG/GF582vfXjMBTq+W0bnnW+3ynP3dDPhfTYr5Yw7KUtWlwZMW8j91dHGxT
         dCvCA7BFd2UMOePhVHlXTfjbblYs/AtdPPE+5CaIbYj4Xv2q9FFsKCmonulGsUtcJd0H
         UA/OYH0zIHBR5egjTIqWszj5VRWXw7YfQu1JQlflw7Va84tnp/I8wObwXzIRuECAg0It
         nrjeoW+hb9EDi8yqXyZkxmexPkYobt0LI6t/JFuoXYLG1FfYlxU97Y30E850IhiG1AH1
         IpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769141573; x=1769746373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xoYwGgOSNtj/sexTnahA2UTTs50xESh2s02cVnq6nI4=;
        b=SFNc+MtwDsKAn2juzCcy0RcXjjy9K/AV3a6cEQW9hrQcvItaUTsMgXeP3z8teA1OW+
         7Pz35M/K3qne3Op+wrZxsFGMqdw9EZZT1RQPmW3HjUFmBOCmRL+HlBmXX8NKoQ9vbe44
         uE8FdlW2YwJ6Z6gY5hcixsioiUQQKjUoL2X54rFxzlteKOeC4NGkHC6xWZlOUwpRNnXV
         MoB1GeGEUkwYhZzUg6dXWuF3ne1uNOismkyjAqZGRChkS4IB115Sv9XmOXEomQBMy97o
         xQa845Wsdhi+4/pxOMPaioZUnfbKyEtIanPwhQIqF6Cwj8ZS5/Go91u5Ye+JdM1rUdHc
         UXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHM8VvLUkCC6FuoVRnUqjLXNHXm3Ocs6ryGrrY4RDvk5KRpW1QGbxoQpQxT/O+lxzaOJ2hfF/nX0EWi9ExKmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMGLh2+pZrbzl+QHtX8QWFErwA15fWdMy5dAKNC9SQxKJhEz2
	uEs69s3e/FB0yptdCI9tr7mmtXcanhB/cSQYO7/VnBuYGl4hjZVXMvpiqs8mbKKijgpPTjaAJbe
	43ShkIxpTJNe8jFoyWB/+gJ3n0HIIdhk=
X-Gm-Gg: AZuq6aKqYo+02bEkpjeVBE/T6NX+9HjQDMO1n56+gsdD6p6mNUJFhtonvbuUSeH3YXS
	K1fg79IE4a9gSDr3B012sTeHTW0JWKvqNinTjr6GktNuRematnz/hoRcUCRKYGNQS4H4d8VcTYw
	+KphUWedoK7XfcUfTI635PKmWG5LX0r/Bf5D486IvS7BzJSOwMvrC4KbRfrzl3P06sOPPEF+kGV
	7D093cipQp/QrtoEBy++bqT2k9tvansrqnfZvfFi0UEsx3ojA7E3RDbMKQ2FfJojvgF0RQfAwAo
	YlYkatVPGbtkPgqOn636HaWAqLvMQT82n4wWLOIXJJGRIdiOtNLpv5o3x6OPIMzMHLzJEaBArSt
	uYKQaLMJxTVeyew==
X-Received: by 2002:a05:6000:2905:b0:435:8d02:b9cd with SMTP id
 ffacd0b85a97d-435b1593f87mr2908255f8f.26.1769141573302; Thu, 22 Jan 2026
 20:12:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123032445.125259-1-leon.hwang@linux.dev> <20260123032445.125259-3-leon.hwang@linux.dev>
 <CAADnVQJLz+nMHCZXUgy2MOxwFczEHNbG8ZUgfZeUY4yXFUKcNw@mail.gmail.com> <a0ce1dab-7d7e-4b04-a033-4f0611090d34@linux.dev>
In-Reply-To: <a0ce1dab-7d7e-4b04-a033-4f0611090d34@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 22 Jan 2026 20:12:42 -0800
X-Gm-Features: AZwV_QiycYEsEgz0rnExs9Y8sYcjMwRBUzV5iEDcMfCB8mlQerPKQopRDo1b7WM
Message-ID: <CAADnVQ+HJkOikzE3KPhOkd1KNugs7=1dZKY1mfog-ez8noyrDA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 2/9] libbpf: Add support for extended bpf syscall
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

On Thu, Jan 22, 2026 at 8:07=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 23/1/26 11:55, Alexei Starovoitov wrote:
> > On Thu, Jan 22, 2026 at 7:25=E2=80=AFPM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >>
> >> +static int probe_bpf_syscall_common_attrs(int token_fd)
> >> +{
> >> +       int ret;
> >> +
> >> +       ret =3D probe_sys_bpf_ext();
> >> +       return ret > 0;
> >> +}
> >
> > When you look at the above, what thoughts come to mind?
> >
> > ... and please don't use ai for answers.
>
> My initial thought was whether probe_fd() is needed here to handle and
> close a returned fd, since the return value of probe_sys_bpf_ext() isn=E2=
=80=99t
> obvious from the call site.

Fair enough, but then collapse it into one helper if FD is a concern.
My question was about stylistic/taste preferences.

Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE6D26B2CE
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 04:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771992343; cv=pass; b=d+j6mwol8Q4Nbkf9Fr/KOJZI4RwEJNsn8frLAXNULVuCxErvwQgvjaDi5CxmmuWNycF23w9fl5im+uaI1BtYP+N2MDRYKc7lz4MUia/AClTFQFpx9R7Ucu3Zg0MTjguDtTq1SRL136FU0ivkO+vxIhtyGyoGeehUbb/8YM3LQx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771992343; c=relaxed/simple;
	bh=O29QH1nqEi06EwceJfS+6Rm8Yz3WXybENc7Pz9CHxE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXoBtnq6ulBWLslnLJC+RK7Jv4Efpyk6CW9YoCTc2b82fS8kaHAtf2lRfRNeRZRy03mARv2ldkW8P8b2UrUzlnz0XHpguqGDI6qX1zjEcaCHi9kL1x0+RjeZfdcoxWDvp+bMYPAnNOM9D9F7KEXCA1b4aC57/hYTotknxSjAfUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCJmSIWe; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCJmSIWe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-482f454be5bso3975175e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 20:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771992340; cv=none;
        d=google.com; s=arc-20240605;
        b=WPIratkX7Cetn161bY6kmQYmalHEkFHGPgBzdMB49+P34qJkWF4f4+kpnwJXscNGcf
         gG/RnLj1FURnuP6Hv0QsJu6UzGxcbzUFJeGB1+xtzsyiGS58pSIc/wuyhG8TDFfsoet2
         jk7JrPzi9s0DGqkV197QuibR7GjhPCAnW6zBBSBANaoOSkyG4edeFOmh+58idTQAA8mY
         zxWcV7x0V39B7mOGYgX39fEW+C8PfM0x441nS12yNCM8X7IwC4zO8I8K4EHD8j5Xfluu
         kWdZBOHiC8e6R65Y3C2rWePHHGV6qxxkjaQSwnFMi7/oDGpr7hpYpChGR2KrVjebO+a5
         VKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vVj+eO1lEYzx1IPTvNrukfWxr4EtHXMYmANg24lti9I=;
        fh=jFXZ+n6rMFLgfeCs5TH9ePJPIZ7Z8IbTUpATqPqTzCo=;
        b=UDkyRK40grvpG0ccnYZZNwggAforHcU2hehvCTOtftF2AtH6OLbaEgURrCdvpAJQq+
         yTVLuFuuY+WAVdikUw/qAfhMhA0xUe0Uf/dSEmWqeKfjs6zcrMSgfixfATdABHrLqadq
         SgQ9AsDLA9XHNYZwef65GhVa6lYULxlQfNvtc3K/HDXBPyXbc1+A9xj8vJU9xzWhXdJO
         leLlxVZjbVJOqk8OtsxqiVcDU7SHhQVifsrl4xx5IYu1DqtwS6amVutpEIPTOhmSfRAd
         n+PCjJrM6qR95emiaGAB5rtaoQJ6RhTmjDzpjgCr3/I9xJpvSpZLBsohV6UVtyzm8WU8
         X1JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771992340; x=1772597140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVj+eO1lEYzx1IPTvNrukfWxr4EtHXMYmANg24lti9I=;
        b=KCJmSIWe7WCpKKdqLko5ApgRwIaaWMpUVehXaYYOorsjdpUkoBXdRemWnu7R1Ioejc
         B4Sh2rQlOG5fsfg7bmZm/TXSUYYJMhwokV4HwUZWNshuUJADhRYB0orU2FA/OubgRqcP
         vPCQJRHnS1howdqxz8FFpY/731h2iajO3zxA8fSBiHDdJqRQXceGDM2ep/h4b8JCxHA0
         avj1keuN6Lp3iCYjiN+v31Fkw2Uj729vQbPE2ldejANVyTcWA+bsai+6ixvzjQ2+HdEC
         Ce5Hs+1jE+/zWgPQu62KGBmHlBxLrBb07aIaXviIQXgQAeI8voAbeMf0LvNqKrlg9Gl8
         HXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771992340; x=1772597140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVj+eO1lEYzx1IPTvNrukfWxr4EtHXMYmANg24lti9I=;
        b=qCRc67M57qf8rtNkyyn9GNrv2KZOD4brnBNFumZTG5f1SQFhzf/OE1iPCOO3i8gkJO
         HWftpyT1rLc/QNqjFwCnWshEcT9BOAe5uZkATxdcFj1axxSmfgq9c42VvjUoTzLCGogG
         N8kjueyEMXUFsyeS6cp5AtUMOVpwXZjdwdHu8dr6Wmsp98A9dumpUkNZGLv1xb9WLwyr
         tpqNV8edh2AUHjniUSbqVLR15CoiJghpA/Vbw2PNhbx4UfI3G4VL91wx3VdGtJltpenT
         UU9LKXz5cKBxioGURdSjs65PJsrDFLc1SQ9t0Z2TJWuUyZ+f/60zPp08OQe6k7FXZUfa
         rvsA==
X-Forwarded-Encrypted: i=1; AJvYcCV0CeWTg1LWDvmMzfkX07BI02E9dh9LsWDuNU03NYaVN3Srb7popxTeDE1im3REMUP03NiGjvzU/+Tc175DhwE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/RH/Lu2ilnmVchoGPUpHZeRUpOBG1nz+MHqwMQGMhji3buEQ4
	rYxI6utfofR9pV05eJl04922q+gBk1z2fqjYXg8plRET5b9VbrSoST0Zasw3OWC8ZDCpNGXwGNZ
	gTbZhwiBJ9udpcb38gV1ItJN3HoFmzVg=
X-Gm-Gg: ATEYQzxPZe0rSRLVUMEjyi//r8YtDO9Em33pZP4LtiSJNCSX0CZGSxepsY8I29QjGqA
	DdvBFm7Qo13OHxqnJXBM8xPG+ER/BRjVbVhtkO/bQV0psRkudJMLUR8ObvQnzDL+Fo8S5DDmBoA
	yQQ7I7xMlB3MVUo9k80pRPWOT0RUxdC9bYy6wHw44oLF7PlXf7iuOTyYkKlTHsJpVr+J2p5UjdU
	3GewqCI2PVHxMjpfiFtAWAJLtgHF1ejZjfnEl0hMvMDDA09Iq0B8jStNbSb/+msSMQFkJ4yIyWO
	iFGuEtenLXBTnP98iYz/mLHqIXVGTgLRVa2k8A4YoY58QlOQQyZ8So2EYPJ/9Zft4vihcr2sRrE
	/hlcfpakrxZ9OsfW1kNOzBN2p2z5g4NnO5Xuu
X-Received: by 2002:a05:6000:230d:b0:439:84ac:56e4 with SMTP id
 ffacd0b85a97d-4398d82ae57mr4494934f8f.2.1771992340075; Tue, 24 Feb 2026
 20:05:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218092002.147306-1-mahdifrmz@gmail.com>
In-Reply-To: <20260218092002.147306-1-mahdifrmz@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Feb 2026 20:05:29 -0800
X-Gm-Features: AaiRm50hIgWAVdyuR2Vku851sxqq7il1PWJsM35jT1Q6WLt9SSiWvlaXKFRgpIU
Message-ID: <CAADnVQJdQ5PpHRvYahuSk0=cYBXnf5Z9tkdBLs1tcnasigrntQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: fix selftest/xsk single test selection
To: Mahdi Faramarzpour <mahdifrmx@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 1:20=E2=80=AFAM Mahdi Faramarzpour <mahdifrmx@gmail=
.com> wrote:
>
> From: Mahdi Faramarzpour <mahdifrmx@gmail.com>
>
> This commit fixes the integer parsing of -t option. The cli parser
> only relies on errno to detect parsing errors. The manpage for
> strtol (https://man7.org/linux/man-pages/man3/strtol.3.html)
> states that the said function "MAY" set errno to EINVAL in case the
> conversion fails. Currently on some systems, this leads to a silent
> failure with return value not being exactly documented in the
> manpages (probably zero). The reliable way to validate the input is
> to check whether the endptr has been bumped all the way to the end
> of the string or not.
>
> Fixes: 146e30554a53 ("selftests/xsk: add option to run single test")
> Signed-off-by: Mahdi Faramarzpour <mahdifrmx@gmail.com>
> ---
> v2:
>   - fix style issues
> v1: https://lore.kernel.org/all/20260217080326.50564-1-mahdifrmz@gmail.co=
m/
> ---
>  tools/testing/selftests/bpf/xskxceiver.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/xskxceiver.c b/tools/testing/sel=
ftests/bpf/xskxceiver.c
> index 05b3cebc5..5e4095fd1 100644
> --- a/tools/testing/selftests/bpf/xskxceiver.c
> +++ b/tools/testing/selftests/bpf/xskxceiver.c
> @@ -200,6 +200,7 @@ static void parse_command_line(struct ifobject *ifobj=
_tx, struct ifobject *ifobj
>         struct ifobject *ifobj;
>         u32 interface_nb =3D 0;
>         int option_index, c;
> +       char *eptr;
>
>         opterr =3D 0;
>
> @@ -248,8 +249,8 @@ static void parse_command_line(struct ifobject *ifobj=
_tx, struct ifobject *ifobj
>                         break;
>                 case 't':
>                         errno =3D 0;
> -                       opt_run_test =3D strtol(optarg, NULL, 0);
> -                       if (errno)
> +                       opt_run_test =3D strtol(optarg, &eptr, 0);
> +                       if (errno || *eptr)

This is unnecessary. It was required we would have hit segfaults by now.

pw-bot: cr

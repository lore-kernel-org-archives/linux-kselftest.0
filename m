Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1452E7199
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317717; cv=pass; b=T2QzQZnbFrfZF9SZoYWRXSi7X0nXR6Z7AmaVvMlVWgJyCw9beztj4PH48ECKap96mnjccQt5OLNBpDBEusxjF5IOBzZ98EwMcW0v7hPAsZ9ZprlP/5s+gdRzYEd/sRtksngE9H1f0eA2AEK9Wx+0MglWBuR1fi1pWSXdkFFjN9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317717; c=relaxed/simple;
	bh=sr6l2sn/cCWgbkqXNE2elTu4FxZydQ8A6+cup3YppOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+y5MKNVXIztrSch+OiXKnLbQ4jVkCtgZcFCyNf1/ssz5aJxWNEi2Y+fdK1Tpjieys40omR4xzrqQq5QHMB6aif3JJbHzfB2/DnQPc1nmPgC/k5EiywUzfUq9SeGIR5M/HHzG3YJl5yiVac+uUmXBxVaq2IJPxD3F6sVu8RDMak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbICgqJV; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbICgqJV"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797afd2e872so22327517b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 00:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771317715; cv=none;
        d=google.com; s=arc-20240605;
        b=d2ZKz4bbOK8C0wanP5I8NKxovLhzr6hi3ges35vrx6aJSi6W6fr4XmvxWxtL0z6bPH
         aQHB2ARqFiezAIvje8M6V5yux4Bl8TQWwrgMecIFflEazWxKGX6iUbhP+4+HxIjXRkF1
         zBQztq2fB62pXJKLLbIxavwYQZlix1jlVhtkm6goVgIB2/wsi32WGDnMUbyYn3RmfG9h
         seyRPffqP8mBBJ48HhvL2aZo9pBCAbA1Hjq/EQY1AvCfdzUNRN1G4lVoM5MT36zISmul
         3hQ6NVNj6+Q1lnApQJFz2YOSUaCtEIq+VuGXZ/6vjc2CvyNJ/OtPthRMyK4ig7RSIbNb
         nT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y89n+th7tnE5Z/5/sRNue21/CtYhyjB+0dCF1kUQxSE=;
        fh=LLgq2PwbVofT5YHGMdvjOajsvaWVlfTzCaN85DXdWlY=;
        b=GE9PbTzqhZOSfdFfLAxjLHlLqa8zTESU+d/nNj3ddrSlABt7SRdWyPoM9is5anyp/e
         6fRf1srXaAuAZYOGJj7cvgO9wVnyPqc0g9i81PLscB0nK1Q/rtho89Xj4Hw5gj1olR3S
         lqqUtcL2GDnCJQnOXFEuFeE9LxYo7G9vvm/gTKTRn2TALJ+iqteP166IVdURGrkiT4hH
         I1g9u000B0UADbbTySwbhr/zfCqffsdAysZXBTsgUbkn8StI/dAJXt6NXSCZs7/mNcX0
         ORY0ynCYmAupB9WdgInMtyx2mGMbofBeYMfv0ohzDtQmdVe3SUAB4NXAtHFmhtiBl4MV
         Qy2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771317715; x=1771922515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y89n+th7tnE5Z/5/sRNue21/CtYhyjB+0dCF1kUQxSE=;
        b=QbICgqJVypGY+rE67iWwxINZ9VPBt6f7FQ3OmgVdFSz5foc9erpL3CchYRCIsyjWZB
         5hKrrFtx46yVrPP/Uzn4r0/+Xilh+LPmzL1y+Or6Ly+Vljz5zqtfn72HUH4j+QCelgU4
         IBC6749skHgl4LsUM/FhBfGg3jxEvBVoqvySyYEva2JLRB4eaPXNL7oG4gowbGzpN9jp
         Xm04tYkVdD1INQ2+Rp/v+nlL8IQ+vZNBxOU3addtGLCsKYwvgtrnt6D8c/TVMeEKZPLD
         SR2gRioHWVCDT+BV3oC5cne56hsiwl/Udoj+ITps5vjB7Z10VrEhOEU7gphw+H9TAhDk
         e7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771317715; x=1771922515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y89n+th7tnE5Z/5/sRNue21/CtYhyjB+0dCF1kUQxSE=;
        b=ZKi5zUGoNnscSqBP3goIKoEqhfmkK6AQV9K6NaZm8qdX4MUI41zuWgjgV8uP9PfMwJ
         oj2dWhsVn6SLvYIiIgO1OvstiX0adKUAf3WzGKr3BsS0jOxFTBmuGyHSL0E4z10EBUA2
         V99/8md2Ryj6+FqRz8AJd6acHnJalg1x3by6rTGkLEKRFnm9KjI+xcD+nn3rtBcAyKkm
         EWpK3QkMvMmqADoDs4jrqDfp9aRnQh+uH2pvfjNwf4oJZwiorRGTZORmhDxgsssM/T/I
         ZAG7uPuvpZmZB5aSPcrKzYA25lUqPubY126OVDSHwtbsG92REDwcaSqXmMKhlv4I6gny
         7OUw==
X-Forwarded-Encrypted: i=1; AJvYcCVVVvZAQ50++xaPOb/2Bmde5LL2NO7imt2unGTFJkDagn3JTJsxnISlBNlFWX3brIEb+bdy9+MgaBE9FCPG0U4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Ox3ytFIvUDEiRXQcmhf1OpCkVyAnO5Ky0VMpf55tbdbAbSU1
	iTNkc1M1TUhThVDlxleNYZBhqCsjD/teW0j7VaHR8slMfZuAPaTXtJWXRNPv23yKVPZfngQ7Kkj
	7HGgG1BqwffVRHd29BjvrJJonin0LJ1k=
X-Gm-Gg: AZuq6aL/omZe1ZNcGyIhqx82QjHvGdtv4gnYIP1tfKe9vHBwBD/eUOTIDmvIosZS0xk
	TvAHrDgQNnTXhn578RyJAzdEiWBBvdweF6SNfoXpWgC9Ou7wdrs7OLBtzeHHu/4JaRAMNN7blkd
	SVpR+fjN0hc4SP1C/gehXSKDFJaR+OmqLZwO1h0g7fcjTiIpL7q70P6hkG/wllwt001ErPGMgo7
	psGy9VvgF6swEiKHXYLZOlQRgtJSQti6oBsiTRIalGI/Ed+QX7gWfikSXMpGfSpswsQFrAtAccg
	YrxzoZ3rE0+Q7/8lEw==
X-Received: by 2002:a05:690c:dd4:b0:796:3515:3aa8 with SMTP id
 00721157ae682-797ac5d49d8mr84544127b3.43.1771317715438; Tue, 17 Feb 2026
 00:41:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217080326.50564-1-mahdifrmz@gmail.com>
In-Reply-To: <20260217080326.50564-1-mahdifrmz@gmail.com>
From: Mahdi Faramarzpour <mahdifrmx@gmail.com>
Date: Tue, 17 Feb 2026 12:11:44 +0330
X-Gm-Features: AaiRm52mTXMPcaWU90JcdTY1oxO4TzgH5nR25AXCXIXhZJzJg66k_Z4176XU8dE
Message-ID: <CA+KdSGPY3YibWEOEDd6vj+=uQkigUMQDuvBbQZXWWVmnAyV3yg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: fix selftest/xsk single test selection
To: bpf@vger.kernel.org
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 11:34=E2=80=AFAM Mahdi Faramarzpour <mahdifrmx@gmai=
l.com> wrote:
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
> Signd-off-by: Mahdi Faramarzpour <mahdifrmx@gmail.com>
> Fixes: 146e30554a53 ("selftests/xsk: add option to run single test")
> ---
>  tools/testing/selftests/bpf/xskxceiver.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/xskxceiver.c b/tools/testing/sel=
ftests/bpf/xskxceiver.c
> index 05b3cebc5..f2d5c4dd2 100644
> --- a/tools/testing/selftests/bpf/xskxceiver.c
> +++ b/tools/testing/selftests/bpf/xskxceiver.c
> @@ -247,9 +247,10 @@ static void parse_command_line(struct ifobject *ifob=
j_tx, struct ifobject *ifobj
>                         opt_print_tests =3D true;
>                         break;
>                 case 't':
> +                       char *eptr;
>                         errno =3D 0;
> -                       opt_run_test =3D strtol(optarg, NULL, 0);
> -                       if (errno)
> +                       opt_run_test =3D strtol(optarg, &eptr, 0);
> +                       if (errno || *eptr)
>                                 print_usage(argv);
>                         break;
>                 case 'h':
> --
> 2.34.1
>
Some style issues and typos, will send the follow up tomorrow.

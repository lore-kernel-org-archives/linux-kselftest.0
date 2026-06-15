Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055A305680
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545951; cv=pass; b=sLU5BzIBMGyHxzfNpbjmkA+EH5q/RgcWpdQesJx9YWp0YY3LqgoCu5bCbSUXPoGU326v5Ip/O3+ijazf2Tj00vlTFoc/M6XTQLoqloWBSis/UW3yHrzdpyXE/xICvHFhre0Sfhc2Xf6Sgqk+AW9g7IX3+4WLl3L2SqiXevuYy1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545951; c=relaxed/simple;
	bh=F/xumjagaO7uiqFHe3JFaFUs9Sdofx73Q//yAlceRdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNVPWxAyngbqAMDNw4lDI1HwA+AYlhpWLzjqEirD2QZf0nEPdPCKji2vwufzT1gJdtH05BnTx+f7aVM7IxaGLS9Wl0B7xuvX6H7VppQThZH+TmF4nzJLfzd026OsZByLe2nDFB7M/Oz0yVpXTrNO106L6kCalr2o4Zgr5G592cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZ2PW/GI; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZ2PW/GI"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7e86d46b02dso39391097b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 10:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781545949; cv=none;
        d=google.com; s=arc-20240605;
        b=R9nbm2eGo5L2sjQUbgAfvk/HoHVuJ2drgnB4SpGXnGnzHSiWzXHAhIRYAhGEaKc7Yq
         4HmKLunsbMQHV/PJ8nOOTvVJmYzwBdB4SeFUfpdud/QgbrMq2ribtoNIscHasqYBebHa
         t0/SPYBFdj64yoJn4Z6jIPusjswsG9SVULfs9m052twG2JNzTvbcPuuBq1jRb40CfFWT
         E64SsVTUexopbHLP08tJI6TlY3YJWKHswrhYoBgFJCRibsQDGdtkxwolcDkUvKnyy1Qb
         uK9L7psE5EXSVocXJd/NPyYpC1CElETDa4yq7LwoyH9xJiSrG8vHwOsTNxUsAlHoKSrk
         9RDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F/xumjagaO7uiqFHe3JFaFUs9Sdofx73Q//yAlceRdw=;
        fh=iHBV2AgO6Q3QWjyjTQQlo+ZXFvdI7NK5Al4PJJmMQIg=;
        b=c0FtvEZL5gm2+5oaOUaIOOV/L7f2OC35qZ/PLzFT4f3Ro4NCOQ6djIN45mHFc1ftPE
         VkRJ+9FDmSQiKatNIE6Zy50Zq3FT/xp/7cCNS8Y/Y+DZOraeecpn6J+ue2tUEMoXzdGu
         PpjLCuYBSTV0Z9Iio3wH3uhZJdVKWG/XAJg9YjOd3z9gdO5D/FQRVXbtxhHhcz1KrC11
         zcfVKrAoYI8ehNBV995puoO8u9ljJFRGC1EuVyfW2O1mRoL413BX8QR618mLvnIzIvCA
         EWHwl3+2O6DeOB+uGDnrNUyk0nuINGxZLQ+0W7Ci8toxTlRfU3Z3ZPAeTaTqbZmgMYTA
         txjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545949; x=1782150749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/xumjagaO7uiqFHe3JFaFUs9Sdofx73Q//yAlceRdw=;
        b=rZ2PW/GI1wpOhbojeizmHOynhwPomxWsvdvzBHZlHLHzSZx6Oo/svub6KT2FXfVOlv
         D4KFOUU2IjgL/l4YF3Ghyz+b2LaT8+jxMCM38SUU1WGBWd+lcFX5sDnCkINw66AN70Sr
         mfUqTzUiaphYZYhlgXmT/75cu+j/Ke2StSIecEIiiT5PmIUCGUhK8S8Eos2rqfVssVaX
         ocHeuec4slM4FIMTfdVHvvkq/RAQK410VneRvYkmpt1koxOs0mPdk+SSIcJjvEc0k+dH
         c0qJeGSnJN+3URYnbT3LhMQLZkK4ZLTFVMY3nh9pYs/u82Ocwm2YICI6OcL16n9R7s+5
         BKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545949; x=1782150749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/xumjagaO7uiqFHe3JFaFUs9Sdofx73Q//yAlceRdw=;
        b=jV+6poHFUda2DaCQMGsGxpsbWNK2yWbLjt910RW/fP/q1Lz7P+g/8qg2c2+ltrpiOx
         0ES0MvNRca1RpJ/l6CQ40MDQAYglcAjrVG2VXGbr0P39PNcMSWMFCiJiWBjQQPGSve9P
         /iTSHXUYfA4Onxxf/S9454vYRbligBJ/k2RpY03EVJXf9/bk+qWr/0rXaE8HgoOAf78L
         nL/a+ujKinJB7zy5lJFa5CB6fL4hDGTKHgVud+fVe2Ef7K4f0OAxYRmQfyio7My/Q3YW
         9y7BD0w7cN3v/BepS8Et/AmOasbmgojSH9tYlEIgcK58dhT8mJJnXzycFqsZ4tf6Ueez
         K5jg==
X-Forwarded-Encrypted: i=1; AFNElJ/ySa1Sogmn6bWTAs4/WhHa9otwJ6bKIBWqay2MezGJ8WwCyXUnVaGHKIQJuzRObM2CqikPaPO2mHYvcjoEgWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2VbthRgr+xTOr4toplQIR3bIBpKLLPWg4qokSwDaQFGVHn8o
	GkbMePrQY83/+wYkSJDohShbm3NBCpr50x6/ct++sez2OJkQ+LiM7mKBf0l0en9pgK3TRw/db3c
	JFkvHXijNCk1EzjzMxufaYO8br3vVOOs=
X-Gm-Gg: Acq92OGgiO8j70oAPBgv8zLpFpYW9zRsnruxUWfgXU5LjpP6uUF8Dg1YRFQe/rXNsXg
	0H5X40lF7wejLEvWtCFOmBztOijCC8tkuVq4Jyj5wSMELPlfZ6qgLx0C2CaWV7VM6uBVUU08PNZ
	ge6j0TqAkZaDzN7seoBIyEfObspFyxH1r6RS/Io7i875ZljMn1kpDyBJ1SZ4DMbDZ518widuwSD
	hHz+YCZkN9yZCrK4lck7e5oofMbWhvrfxb/moEyZ3CCIRElklg7X9qzJaD9jmJ4kEp94pipskwB
	+NZ8KBOIKr0Qz+LK06T9t0uhGMXmhzc5YBmJPwoHyPCIfpd/sKChS2wT0D6HcCmPR+E7jAfeMUk
	Apz4ftQNsU0V5ko4quBVc65PXDGWWKzCImPs=
X-Received: by 2002:a05:690c:4902:b0:7bf:55b:8f9e with SMTP id
 00721157ae682-7f8c37d34d2mr109748887b3.28.1781545948658; Mon, 15 Jun 2026
 10:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781535194.git.chenyy23@mails.tsinghua.edu.cn>
 <cover.1781539813.git.chenyy23@mails.tsinghua.edu.cn> <fe46367f8e2c2ae81e626e71d200dbfc3e7d644f.1781539814.git.chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <fe46367f8e2c2ae81e626e71d200dbfc3e7d644f.1781539814.git.chenyy23@mails.tsinghua.edu.cn>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Jun 2026 10:52:15 -0700
X-Gm-Features: AVVi8CcE68diEL16uraQ78pM0AjOCxoVdQa4JF0hQhCDysKpd0zBs9sA1Nf7WiM
Message-ID: <CAADnVQKivwK1aBW-EH_-x83Z1L8HC0ceUau3_SLNLyzYr7Dszw@mail.gmail.com>
Subject: Re: [PATCH bpf v5 1/2] bpf: Fix packet pointer invalidation for skb
 dynptr writes
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend <john.fastabend@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 10:49=E2=80=AFAM Yiyang Chen
<chenyy23@mails.tsinghua.edu.cn> wrote:
>
> skb-backed dynptr writers can mutate packet data, but not all verifier
> paths invalidate checked direct packet pointers after those writes.
>
> bpf_dynptr_write() handles skb and skb-meta dynptrs in the normal helper
> path, but global subprogram dynptr arguments are verified as
> unspecialized local dynptr pointers. Treat such arguments as possibly
> packet-backed for packet pointer invalidation.
>
> Carry that possibly-packet-backed state through dynptr clones and dynptr
> slices. Otherwise a global subprogram can clone its dynptr argument and
> write through the stack clone, or obtain a LOCAL-typed dynptr slice and
> write through the original dynptr, without invalidating packet pointers
> or slice pointers that may refer to reallocated skb data.
>
> Global subprogram summaries are computed during CFG analysis before
> register states exist. Add conservative static CFG predicates for
> bpf_dynptr_write() and skb dynptr writer kfuncs so caller-side packet
> pointers are invalidated after global calls that may write packet data.
>
> Keep the normal verifier invalidation precise: helpers and kfuncs still
> use the checked dynptr argument and only invalidate when the written
> dynptr is, or may be, skb-backed. Source-only dynptr arguments remain
> unchanged.

Nack.
Nothing to fix.

pw-bot: cr

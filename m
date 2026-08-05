Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84639BFFA
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895750; cv=pass; b=EQiL36mIBW2srYA3cz32cvju0I9KCvDdJebdkU16BDlNtz79NMo64K12V/xrrH2gqlEBL0OUuqe2jHDnWKWyulFNhNBnQzhX5QUlSwR+h+5+JJr/m6ZgTpLCBAvGN61JXDWY8Fo6HPVWwlJ92q3AV9Uj6EO2fspZSXNFg/zBMeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895750; c=relaxed/simple;
	bh=jeBHuE4WTkVQtqC84gsWAKgNbBisvSXKUun/omE4U5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Riy5tV1aCUINI/p8Rj0yOk0NwXtBcLL8gputmv8zzSqyeXZ6Pn0QVu0eKfEcz9ka47zx5OTL7VGDTk8JStJdO5SOM8EAA+FywkAoobuVM62e8S8so+pufpQtdQw0I8YGqbvgzbG4GyS36sm4Lr/qyi7mE+fJUedOMk0/A9wBX38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTiD9yFj; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTiD9yFj"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-44cf70de986so186654fac.0
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 19:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785895748; cv=none;
        d=google.com; s=arc-20260327;
        b=LswJ9ZCMiyp4n/gEaU8VCkU5T7Pr5mUgYwJ9LN4myWXxCivcIQ47UXxGqgJ/nHWkFs
         naV4cTxy6bIO3yu2L7si+KrdJX3v7+sQdBGRWFBdd1pZybCDnfjgt+hZ2d1PkC3Kfu0u
         TVXE7sNf1GGpymY7k72RU2r7NGkAkHe+oqGL85mg+ta8zIQzLLe2ZHvSC4QJS5MaPFY9
         T9RlCZUWgOfLtHCz8m6L/51fsmL13Ru6FL7vr5vcsVFdU3cOKO+yoIFNUXQt3jcBI2mP
         +pllfxXXCvWtmvwbk1OYYG1ak8dQlPCsL9alPaH64kvIfmQTF+PFRKxwPXgeyDya6aPv
         KXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fTvjx+YN7BLrrvexWtp3Sl4BEGcFqm2fPZo8y/D+ts4=;
        fh=dyd0mboFy9mpqzZ9L2gATDNcDhJOobawKipe06Bsvrc=;
        b=QLokuDZ+2Twtrpwd8bPIqBwnIKPkG8KpaL2K0rTpF8V1d/1gamPucooxThe8SY9wU4
         3S3TiQQ6osTGQAhbOq01XUlcQA240yzlFjTxzNGfmb9EX/i9okDzwqsc9Jp8nxbMBgEw
         EuOHS+Qu3UbQRoJUrxL24mHPcqEU1u1pT8METDb2qYhGVZboCdgxpl8Cml2C8N22d8dS
         xdzllZl5diGy1M4lKeMT3rxbCWrMQOfVO/dzzCUdhlsYpon1V3/xlvkiv19MTOV3AErX
         IeRWbpXTuzlhwvj+RkiITK2RCkUOHKdcxbkh3GK+HPPkOLE11Nma3NH/KS9SzeDnKPsR
         jz5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785895748; x=1786500548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTvjx+YN7BLrrvexWtp3Sl4BEGcFqm2fPZo8y/D+ts4=;
        b=TTiD9yFjHLWUGKOTv9FOkSGohOKqKFRxTZQn5BkJKivu6BKDbXaDvrmn+ErZmMDZ8n
         Srj24c1etsMNIBP3spuD7sTHP5hQ1OiSajMqMnxFUuZ3Lp32G4gyhThkQMW9mXwPiGKn
         D81p7sd59MEzPelgnUtrEEwdfLCACUNu/n4RqbdT27krcbG/BXHA9Dv15QFcyLUfEvHu
         17XsrSvBjiQFwBiX7NNzRqhfpVLQd6pZFVh3nOeaQWMvN1AGZ+nhuuEHK0oFHMOozd0W
         gzkRPUvcFQtoebpZWkoug/DaSgDfNsnE8SK12XnsrL2liHJbqtL+q6Rlytd/Mhy1Yf7P
         iZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785895748; x=1786500548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTvjx+YN7BLrrvexWtp3Sl4BEGcFqm2fPZo8y/D+ts4=;
        b=NhIrEDUUqVzBQ4zAtsMItLySqgPfztOyUJwWYJ+RqQskRsTcJcb/hCG2PILgVvN9BM
         LA01jL6qInFHdMzyfxtCQeiKRTsBIAXPibJYI+ugVkVZCWOn7lQk8vgReEdNKFrNrVqT
         ZF9JPiPDMXVGsKzwaTh+koXuAeQIz1BDEAJzj078ASlZXMF28DkDZT+WAQJ3Alkg0Lry
         5abdP9q4c4fHTsXyFsxcKQ6dmnYckXziJ7NBdNkv3QmhJvOw/KqyFJMynuknzDuHiiHO
         wsTIBODc8g/nxazN948YQI6oHK6F+K7VHWExa6Siu4YAP9dVu8PDKPlB1FiOqDw6HyFk
         VATw==
X-Forwarded-Encrypted: i=1; AHgh+RrAkY50/6/O+Pe2b+bXfeB2kUTo1TbkE9NFD+5nPJXB0hQC1glZa7Yr+jj4nurBcbTGOL8NSuEa80DSQBrmgA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KlQGwu8UOyUWoEKrBTOQrmD1coByPj/CRK5NJeL6EMB/BDhD
	7fvG8jyLYoLGv6oOW6ncOt/euHgcs/KOP1+7HEbmB3qL6NKT+53hnBsN6at6aXo0vmAxHlTqtJ0
	m3QJNNMJxt5dNoNPmAWkHTQu2SC3rv8A=
X-Gm-Gg: AR+sD10X9z7bzUPLpLR2N32HBEbLl9bNrf5eziFvS87xvnoTQ6Di3niVAxUakMcZubM
	atzfNSXWYc095qtWso569oIY7LWPfVjD2RanxHidpshTApLHAXRVuGhY5JLGNTD8NcVOTHDdKUB
	6PIvchMXjF6OwrAh5hBDaFWvYrtfMNaGoyKidUmzYnkQnE8Xfoi5Qb8z5kxT25rxxjRfu53W376
	+hauuqYTlq3zHwIDyhRdgWoaonEL8Yjpnw18yzvn2gytrIXSw/+PD+xSXHPwgIOubQcKY15KMHt
	XldtMXaFR560SzeyEqHg/mrL/TYx2k/+5MVz5EroZWVkOzDPervvGLEP
X-Received: by 2002:a05:6871:341f:b0:456:dbed:6b60 with SMTP id
 586e51a60fabf-4599ebe029cmr2013136fac.1.1785895747749; Tue, 04 Aug 2026
 19:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729022837.355549-1-chenguang.zhao@linux.dev> <20260729022837.355549-4-chenguang.zhao@linux.dev>
In-Reply-To: <20260729022837.355549-4-chenguang.zhao@linux.dev>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Wed, 5 Aug 2026 10:08:55 +0800
X-Gm-Features: AUfX_mwdkTCwcDmta6unYyTYXaaR1C-RM5YP9h5aDlMI8atqWS_kk4zD0pF-MNw
Message-ID: <CAEyhmHQbSGCdkjvncjZ7kCWpmBYJasViNtTQdsVi4eb+O1h0QA@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] selftests/bpf: Enable kptr_xchg_inline test on LoongArch
To: Chenguang Zhao <chenguang.zhao@linux.dev>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, yangtiezhu@loongson.cn, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, shuah@kernel.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Chenguang Zhao <zhaochenguang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 10:30=E2=80=AFAM Chenguang Zhao
<chenguang.zhao@linux.dev> wrote:
>
> From: Chenguang Zhao <zhaochenguang@kylinos.cn>
>
> Run the kptr_xchg_inline functional test on LoongArch64 now that the bpf
> JIT can inline bpf_kptr_xchg() with correct memory ordering.
>

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> ---
>  tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c b/=
tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c
> index 7def158da9eb..1215d6edd590 100644
> --- a/tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c
> +++ b/tools/testing/selftests/bpf/prog_tests/kptr_xchg_inline.c
> @@ -14,7 +14,8 @@ void test_kptr_xchg_inline(void)
>         int err;
>
>  #if !(defined(__x86_64__) || defined(__aarch64__) || \
> -      (defined(__riscv) && __riscv_xlen =3D=3D 64))
> +       (defined(__riscv) && __riscv_xlen =3D=3D 64) || \
> +       (defined(__loongarch__) && __loongarch_grlen =3D=3D 64))
>         test__skip();
>         return;
>  #endif
> --
> 2.25.1
>

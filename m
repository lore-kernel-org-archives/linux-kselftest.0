Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D2548CFC
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 00:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396051; cv=pass; b=M8KhjsZ3C92xI2aAcv3OiC8wFik3h6YcN8ZZZL5iClg0Cmt9J5c5Lj9UE0XFYdogOrc0375WkJ4sDOwgSdPDz8lrF1bqYy38NvfhbpIcOHojvuGi+MqSCXejlSraN7e6T8BwC2qgINUZ3FKAobGijQ3ljckEASZ6Ng6UY0jPQwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396051; c=relaxed/simple;
	bh=ummikDaVeCHW0JPhyX90qry89JcKzSQE2CkFya5vVbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg5LfAZStJPxjZ9pq4X7NrpCn9mObeQ97o/Cqr4xZnq7L5zTquv0tO2AUuGShqZWfSzeMUg+I8GNF9ZysLJmbjQ2ZoMvwZbsaetPrpLq1F4mt4jSB1fpXK0Flx13soI2JzbCl/4mfjst0ZvX/T4fGrj+TZrpqkJmkV/aVRLurhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n25efLp7; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n25efLp7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso1893755b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 17:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788396048; cv=none;
        d=google.com; s=arc-20260327;
        b=P5TLYdGP773b0R/vYcuHazA0udhdcxKrRrbOImMqNkl+ieKMPQhxY8ktvZPZPNP3QS
         m5b6I1dL6BwamtvuRSy1qFX9xmmbfnlo5WflqknjTYCuykfMiFxkH4p+JctzAHnfRJCK
         0krMpRhwBB4hFw0sTCJn6w5FQzxNIzPjAI2IqkYGBg1VyGTase2YzhiueX1jJd6LVOOH
         0F95AkvHlh/81hA1ClPpEBAiY32gtFdD7zyzNiRWYSCt/5eJ/8Mq5j/A885IHoUIaA9q
         KNXNve63O0hRahJV41ceJ7HYXwDoVjA77Mrb+63BZxtN3+MuM/3HgeJ3LC4RNMhHnlwX
         ycew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ll3GLAxigapk8vQrhDFtbMqJYnX3ubAR8duvzc6SrcI=;
        fh=aHMja1cmwXU6i2LOCReWkhsOe/dggKt7OhazuTqDw+E=;
        b=OK0RwbhWTjdqiWunIq4G9pM6MxD7LHrqF89qjzR+6nI86w3SpaWM2ug4hXPiVUo0K2
         LyFrmm2oFRmcHX/jQnlIrK/lVpkIqklO4ZeJT3FnzOgJa9kSgI3ixhEcly9YBGnuJ2hP
         SFnwLKElUbtBiw1OmvQseeJ+955sufebGkcErycIL8qreo8Uuckt6LSe6+lKXIZ40+D4
         zN4TNNybUl4RF7Mdny4YHVSydEuRl7qaM1y0MPWi6Vwd6Ku7lKv/pwxX7xFrCBhZ4Xj5
         I2ouS8ArD/+2iWBO6hxK2oXl0KWg7+4Qyb45DX16Mv9kqIOd/nvHyebaSlAV5rMoKNfz
         M3cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788396048; x=1789000848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ll3GLAxigapk8vQrhDFtbMqJYnX3ubAR8duvzc6SrcI=;
        b=n25efLp7McjhmpeTM9eoOznGkE3xN616qRCctvLLI9vfZdqDs68OH5cz2/cLw1pkJL
         bMEfgpqd6yHfBsS5/yOVMCWLuQMfP/pgkAekGxV1YkzWfZlnysGHNbQSCbu2F0T7pCZG
         AmUKtm9dBgUvIf7xvwFtFQ0tNKVp3hg7jOalHEQMoMDzRKNok8zImOtOe9ltAlcU5Gcy
         qPax6nzyVRt8TY5Wq0/XeyIgdTHEGCd7IsHWrCPuPo8jmwib5KqUW/gXT/DT+B2usUXg
         IoYgepQqh1BC236bVe1udBzOicguI7DkpnWxsTwyvs82Qyg8UdIODZEtBoeqKC9hcdhK
         tQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788396048; x=1789000848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ll3GLAxigapk8vQrhDFtbMqJYnX3ubAR8duvzc6SrcI=;
        b=IcXIhBz16m/TeSTpiWxqb2NOJlhK+cXRTbYsU8bhCDen8Lq+6ENQ55V8OpaH8PQO/p
         h4AMKzyKPhadcvcFoWVjAvMiOTJvYIB2G6XoSasH3OjB8fqTJbzujaO2wfY/H/rwuDXc
         ACqxkpPE9OrDNLo7aZnqnqTlhwj/jsFN5vGHhub2ak+R5WPUUasz8VngylOk3sDUEs0n
         yCGFJV8gkoCdU3mjLrliYCEr+gkGHN+Ql9n3vAhPZka4Oe2h3mctKDUxSQhGMW2+p7vi
         uq1Ra1vNlJ2969iFu+vl5thgQ2r0kI6vylS8TlvxdYkMb6mpN+Rq3gCR1sHgg7PWZfSL
         mK7Q==
X-Forwarded-Encrypted: i=1; AKwUvBw60PPRYv5Ut7ETUl9ECN5B27g9962Gvq1rsKTot2T33uDIQPdK91rkdpPOFZJ6Zp/sE0lu3Q8Nt+ODkP+L7Pw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWanWgQmiweMIvNSP70ry41EqcO0lnzgGrQYJuZrUZBz+BwFrN
	kpjfNT0V7Y1NvRcOWfAccYPrt+OQaHwCcy0bQt8ofSQ/mGTKWz/sUiGCmmPYfJx/i5MbBwUhbLT
	iyykKNFIg76eNRx0WjKpPXxouc+gqi9U=
X-Gm-Gg: AYBFou1dszjh8WYPAq1LlUWkDJuLjOCqtmD4hcXgiVdTsjnvjBr5+nChE66c7lIgmh8
	jPWyYpQ3fbQCaFj7y2nKAv2BOEeNV0xb3PVJPTmcPaQ/bSbSWDER+uFOU9urxYQgKhv2HVFgmwk
	E1RULxqFivZ48DoT8UFx7hyx9z0+TQS1k7Q8LxPHcQf2N6/OP89irRfX4nksnx+tWg8BVysrAbW
	Oju0sNeMytz5Kz/7pcMaeY8elOBkz5IrUO/P+2Ql/ysOUgafZas7KfL/FkCL121YMdBzjBFMVf/
	ai4xLgreD2tUxFx5Kdve2JP2V+zTa4y15BWjzgaTV/dRWGIQM4LgidusEK62j9W3CHyao7mnatS
	PT1pqX0GTz5DRNz//b6PPUrwa2g==
X-Received: by 2002:a05:6a00:4c86:b0:847:9015:e68c with SMTP id
 d2e1a72fcca58-85ed3f70278mr13510128b3a.17.1788396047600; Wed, 02 Sep 2026
 17:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902091126.59281-1-markdamirkan@gmail.com>
In-Reply-To: <20260902091126.59281-1-markdamirkan@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 2 Sep 2026 17:40:34 -0700
X-Gm-Features: AcwNN1WhcKJO8-PyXPVycu3bHFJ0XG2h_wkDwdZhBHP-rTVF3QHwBAawos6jWAk
Message-ID: <CAEf4BzbATmY=yzdKsQwAV5hXwZsahxcYVqtT0+7GoG+N2eFTLg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Reject oversized unknown BTF type records
To: Mark Amirkan <markdamirkan@gmail.com>
Cc: bpf@vger.kernel.org, andrii@kernel.org, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:11=E2=80=AFAM Mark Amirkan <markdamirkan@gmail.com=
> wrote:
>
> btf_type_size_unknown() returns an int, but calculates the type record
> size using unsigned operands.  With a 24-bit vlen, an unknown kind whose
> vlen is 0xffffff and whose info and element sizes are both 252 has a
> record size of 0xfc00000c.  Converting this value to int produces
> -67108852.
>
> btf_parse_type_sec() returns the negative value, and btf_new() encodes it
> with ERR_PTR().  Since the value is outside the error-pointer range,
> libbpf_ptr() does not recognize it as an error.  On a 64-bit system, a
> 129-byte raw BTF input makes btf__new() return 0xfffffffffc00000c while
> libbpf_get_error() returns zero and errno remains zero.  Calling
> btf__type_cnt() or btf__free() on the result crashes.  The same input
> makes bpftool's "btf dump file" command terminate with SIGSEGV.
>
> Calculate the record size as size_t and reject values above INT_MAX
> before converting it to int.  Add a regression test for the maximum-vlen
> unknown kind.
>
> Fixes: cacd6729c092 ("libbpf: Adjust btf_vlen() to return a __u32")
> Assisted-by: Symbolic
> Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>
> ---
> Testing:
> - normal builds of libbpf and bpftool, plus an ASan/UBSan libbpf build;
> - the reproducer through btf__new() and bpftool;
> - the added btf_kind test and the existing encoding/decoding subtests;
> - identical bpftool output before and after the fix for all 60 BTF blobs
>   under /sys/kernel/btf on the test system.
>
> The complete BPF selftest suite was not run locally because clang was not
> available.

that's ok, I hope AI wasn't too stressed about this unfortunate state
of things...

we are not going to harden libbpf against any possible malicious
corruption of BTF contents. If you don't trust the source of data,
don't pass it to libbpf (or do it in a VM or some such).

pw-bot: cr

>
> This fixes code present in Linux v7.2; please consider it for stable.
>

Do you use libbpf in practice? and where do you get its source code from, i=
f so?

>  tools/lib/bpf/btf.c                           | 11 +++++-
>  .../selftests/bpf/prog_tests/btf_kind.c       | 39 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>

[...]

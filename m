Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF63037A83B
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 11:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941108; cv=pass; b=C1eoZsj+RBtk5Mr+CtSbsq923r0FFiRylKz+N7aGNwNCWro8DNFyyg4xntXE7Ox5PKBGHUWUdtfQRYF3HYhU/ie76QRNcetyh+I8n+Gj61YdPtbHJ4C4go+gfPnJMxPNbGgGTbE/mIzLl5L68GY0cWB7clNzSjV9MozBkGyWpVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941108; c=relaxed/simple;
	bh=reE3ZIiA8bR6q5vWMypk5waJeiVnZpjysUAdSkXjsNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5HRnEpn0TlWDAH9sSzEl05SXtoROahdvqRPGlT5h8bPM4krQSpfub5LBOKt70eeWDdbgPIUp1ZXjJsHRpmPcmnaF3wTR0TEaD3rXU8cDz+3V71deVxuzzYhkqGg9ln/MeRX5A0jPNtAUB7x1SuBSZYk+ht0qrE/BI1rMhQbsLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYZD8Ipk; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYZD8Ipk"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81e9d8f3289so5513767b3.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 04:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783941106; cv=none;
        d=google.com; s=arc-20260327;
        b=eKkMsI8CZNtPdh6wFzrJ+QsdGh4PR4P2ciQyPODWcNG6dx/nqI5yupHDG0EbT4Bm6u
         Zh/2OD9+1VaQEvry/4ATQImv1Es7vJIu9vz1DxdmpkclmcM0ORkzQpGfZ2PyJiqcsKLc
         rrqXNjfBccKZukd5xNNI4ssAgTtJ4gyC8EVxQQx6evOK8m3j5G5h0a9CDs3/opXnQrBD
         N2Qn8JXHBT9cjwF9RXIaJSMvf5+xPQsELynuatMRvNo+BLqnysU2uzrpg5Mi93cWBiB8
         lN0U259+xBa926pKcF01Pto3LqJPhvfyMOQhC3qkms5oIb3KgeDIBzt6urV8h8BPQM3Q
         bsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4NrvnEAuHaG+ihZe9SM0nCZuvqTV6eJwGbpjBAxoUPw=;
        fh=s4NnfkJAQj7PkCN/awo7/GGlLieQ1kUvtDBWtAca4+c=;
        b=UNn9v3wc0AktpOlZjDuSx64aJPHN57VI+r69v7Y/TV/jMR5jfDok9SPNczyZYNOHp4
         Bwbzp9jDXFN10ZGWU+1Ql/1b8vS8sK0a7X+r4U5x0j8ue4MjvpNsCo6hsHaDVspiKjrg
         oLL5FcblMGRbGAYj8xZb7fBo3cg3B3aCmUAg67zEnPNNOnktQ4XHpve9D1zdyYTEm4uI
         kL8EGs0LmMPweSXAJY1kemrTk0PS4Wo7fAD+v5COGgVOOhZ46V1mFv6W3sB71XX89yQq
         KYt15eWYA2PB3PjpGV+RaFhK6cBmnEIR8HEk4cUvL9Uc2gR1kEIJOA60eZV1f6K9lgEy
         q1eQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783941106; x=1784545906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4NrvnEAuHaG+ihZe9SM0nCZuvqTV6eJwGbpjBAxoUPw=;
        b=pYZD8IpkIku5UfEhVJQng/Q1qEXvvtb2iK8nw37pweh8Ltf+ZZxc68k8hxEYUYF0pi
         RizImnTmB1kQGK9fBAOyttojIzSK/d7qyqFG6GXvoCxTXBpyYWSSsE9B0X7yDqs2VyUP
         dGaJ9lkLm4jMCgH7Kd/qiffWZOkkchzMS9n3z4MFUpFkV/qfqjh6pyBJvOyap6fK2ERF
         fnqmVy9Tej7SftkJYfpqwtkDPD+kSK/gf6LELkEY1tylKpFT5p6kMZboOdwqOmnUkPRQ
         r7OV40yvkusjO4nLOiTHz7vOS9NV5Fu8w458bYOSy3Vl4kTd05FbA34Zq8sLam9flMkz
         JcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941106; x=1784545906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NrvnEAuHaG+ihZe9SM0nCZuvqTV6eJwGbpjBAxoUPw=;
        b=qIpduSOgkYVM10Bse4Guzi7tsYAFRu/Tmp61F3VbbkEEg6ISn7d6xwot6QaKS40Hjw
         sxzqd4htwJV8XoUOKop7YOHLLZ7pa2M0to/CdsiawEbg+KJO1a+yzTgwME6bWx5SHCUK
         wl2yr6hmHGTQcvX4qrfiESJ1ZIvWmIxebm57zRk8wimhm5tZvJDsILAAKojH+6UWUIjw
         kQxGQrJiDs8DegRb0mO4hOL9qGZraZ5nEruhvi57+kAj3Te7PGFxFU3yd0Ejc8LZHCKd
         FCZsKzatITb8sItVGMFFo2Z/C8U5sjEg1FvSSXzqcrDniRWPc6xgG/1KrKH0+CVZe+2B
         Ud3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpGIdWnY+6+2+9VEaIfbXUTAKGQK2C/JFHHaenmdRZLO29E/eUHxkhzfWJf+/+EoLyWySG01DHp880g5nRDijI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPL/9VcGNcGke5mlq46aHfPvrMqQTA/napwzEI7XCbUmS69Q2+
	5LOj5dP37FX6HuxAZAsecZpnbqUwunpopAjD60q4MqAQswnvn8ZqzCgeoffpROEv8DHFjELovxi
	XCThi9c6j6aCr7Wx+2QRjhhqqRvwiZJk=
X-Gm-Gg: AfdE7cmQ5w6vxpdlIzm+s2XnR8OeukCH4YKqfZQzKxa057xoj/sCydQa7/f4bEMQiEt
	qLsj0Z2ia2stNIzA0DEWpdQ7slPmcWRGnBQJZgrQffYYoCcQDYkgkE5SulpxdZCypS7B4VpK020
	1sI6so+8pSGL4EkoozAAiL3SQdFCPrVsnOSRlh1iM9xcBPXgyZc/ehjF4bPQFWkagiiUbJp0/of
	wmOzeAPIKTn1jCQzR7iXs2QA4JGMhQmx5uFtBa2Uh1aExKd1+AmXSH/aGf/d74FZOG7DHWbakod
	PmMVfF4QfVybAE5iddhL9qgjKnePJ0eypmdJbbOY
X-Received: by 2002:a05:690c:620b:b0:80c:85c6:898e with SMTP id
 00721157ae682-81e901ac70amr62178667b3.61.1783941105949; Mon, 13 Jul 2026
 04:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713063513.215781-1-shung-hsi.yu@suse.com>
In-Reply-To: <20260713063513.215781-1-shung-hsi.yu@suse.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 13 Jul 2026 19:11:34 +0800
X-Gm-Features: AUfX_mwt6y9dWHTw1akM5JZlx25bW7epDzcN33A1C37dw0beEB9vA4ospeyhCn8
Message-ID: <CABFUUZG5++CQ+CoVaVgXGEPn0CwAz5JciBwk+xcRQh01frC3GQ@mail.gmail.com>
Subject: Re: [PATCH bpf 1/1] selftests/bpf: Enable BLK_DEV_NBD for raw_tp_writable_reject_nbd_invalid
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matt Mullins <mmullins@mmlx.us>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 2:35=E2=80=AFPM Shung-Hsi Yu <shung-hsi.yu@suse.com=
> wrote:
>
>
> The raw_tp_writable_reject_nbd_invalid test relies on availability of the
> nbd_send_request tracepoint, which is only present if the selftest kernel=
 is
> built with CONFIG_BLK_DEV_NBD=3Dy and the kernel built from current BPF s=
elftests
> config lacks.
>
> Without it, the bpf_raw_tracepoint_open() call always returns with -2, le=
aving
> raw_tp_writable_reject_nbd_invalid test always passing without exercising=
 the
> checks bpf_probe_register().
>
> Cc: <stable@vger.kernel.org> # 5.2.0
> Link: https://lore.kernel.org/bpf/alRtilWhKw4zzMkI@u94a
> Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> ---
> Not sure if fixes tag is the right thing to use here, so use the cc
> stable tag instead to get this config change propogated to other stable
> branches to make stable BPF CI's job easier.
> ---
>  tools/testing/selftests/bpf/config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests=
/bpf/config
> index adb25146e88c..e1797bd87904 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -1,4 +1,5 @@
>  CONFIG_BLK_DEV_LOOP=3Dy
> +CONFIG_BLK_DEV_NBD=3Dy
>  CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
>  CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3D1
>  CONFIG_BPF=3Dy
> --
> 2.54.0
>

I tested this on bpf/master at 7cbd0c4cebe4. With the patch
applied, CONFIG_BLK_DEV_NBD=3Dy and the nbd_send_request
tracepoint was present. raw_tp_writable_reject_nbd_invalid
passed, and strace showed BPF_RAW_TRACEPOINT_OPEN failing
with EINVAL rather than ENOENT.

Tested-by: Sun Jian <sun.jian.kdev@gmail.com>

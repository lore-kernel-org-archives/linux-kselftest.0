Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793919288;
	b=SdF0vuy6AjIg+x1oy7t+B3f5FrUjK7S/EDfPB/Lrl3bbZYuvBxWFj+JD3Bs6a5+NCeZB
	 rpEdgoBGiGJmlv6kHxzVs/+9ODEWzuC/Ejs7RPHQn0uhOZZjaTMplutBeZbr6iR3TFyHg
	 uPqKX96BdI5OwnOrZJ+6CPJXyxQ1FRwthdukogdj7fAKA01J4zReeMkT3NUEvimrg++vu
	 O1r0p/98RfsUfGNuoGQpMdx/XexIIQ03ecupILZ8EIdgQWR6yfrt4p2nl75z+JcJy1rtw
	 xSqTwnFjEYU1KHpBrGc7e+FQJB63qo1ZxWP/H/OAGV46WD6+6y35K8JRIMo1Q4kKKgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=53u7WY1TsnwmHunThsglDcDwR3ZhmgG0Jw62kG2eqzQ=;
	b=HrR3q0LeBshBZKu4MazOFBfn2Cnr7Qms9IARXY6huUxWyMEEUlgOe/MIks5qzJqD5Pkw
	 pitmSMudq2lhVww3c2oQ7scARu5ooXF6tusA9EL6oMm1fWTWf70MJv5GH/Ha/iOMzVrxx
	 s0+XCG5pMZtCE9bp/RcwPQv/c959E4QUwzLpDfV71TWB63ldOOiN8QR91fOmLbplk2tCt
	 6gW+9tXDOejBS7jkhXz/1nGuZriBteNjyG5sERsS7xGv0jfA+xXQA0v9pC0AG8Gxj12KG
	 f6KH/APvsJss2E6cwDxl0cduN4RmkF4ycsj8Mm0BfVGP/kCcjWpwB4MnLVeRg6vvnFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jv5Nue57;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E4E606A329
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 22:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72E4E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jv5Nue57
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed08b07213so75435ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 14:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793919288; cv=none;
        d=google.com; s=arc-20260327;
        b=ji3sKUnkiBOZTnPIYGw9A9/M6LZFDUx6kH51pX4UmbR6YsUgbq4++89aaJ+WtkcZdx
         0ogRcjwTqZCmSq2t6RCI7LDA0Pt9rAI6CWq5q2s36Mk1Q/xjd1egLOZchPWqyShqC5xX
         MqOV1C537Ilj+WpTriSaW2PPnvwsREV7gkRfB+8NOguX3MeOD5DzqF/DypVlEAOZlv54
         RxNkEIVYe2e7DXPuHWLRZ1Ef9ZVps//fHPjPiP276gjYHlLy7yG1m3Q3AWmMmFzwJPJB
         +RTDiLnoeHCWZrbTJsipz2oWF+9G6Df/sbBSQyX7fwulbJjrHl4LLN2Ni1lzis/pDYt0
         8V+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=53u7WY1TsnwmHunThsglDcDwR3ZhmgG0Jw62kG2eqzQ=;
        fh=2Gw3rTB0ja/eZsAmhdz7LDpz6lB6FrVre+GDAtoQAb0=;
        b=Ii2fH568ZJzRTfmJatky3BM1xRzL86ZbEHUqg5VBPq4ULtMLTOm8hk6FSSSzfdIOHh
         bxxblT+Pm2ejq8zxodcqrZbw/dxxcMH26Bncf7JjMljB007rxI0F/DrTW65OZmwd33xU
         Mx+C6notZsrMPlE/v7LCuWyH8s9WHfWPqrk6V1mkSokUmVANrgP19mBxpxESm2SLmDdC
         uM91qEz+6zjFCHd5jIHs8eH0Gtuw3k+ngJIxuecMLz1AcBLpmKt5mwZo6ixGkIcpFSMB
         rGN+xPBDIAhfPCY09R6ta5zGq4uBWlcFPdjbNDIfCJ0dRLyBWo06GdRGzkVtdfLktx2b
         edyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919288; x=1794524088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=53u7WY1TsnwmHunThsglDcDwR3ZhmgG0Jw62kG2eqzQ=;
        b=Jv5Nue57QjLkhMOEGuHs72frjV/ATniu1inojeuyfPkxMSjJgzY8tebX3s5VEt8P2M
         5zk79Uevpau03DtEKgmydD39Tj+kq1mm8pJ3xYPkFc3lo63wbGviTt7xGz2nkQjTWgme
         XZosPj/bHU4nk/vkXbgbH1DqTm2RdwSeIX2H3aB3tXuPraNBn0/VZGHwBP8W+HvX6wpN
         cQGsBUj+EezVKnGRxvepwdJN5B9CD+NqeIcjKdhFZgQHf6FtucQaQmKlT/r3Gt24fCRj
         uz6NppJAdxkzJP2Oo7zejufT3sR4pe3Kn6HPckZhMX9zdTnVv/XXjr20+UyoaaPwNtCV
         tJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919288; x=1794524088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53u7WY1TsnwmHunThsglDcDwR3ZhmgG0Jw62kG2eqzQ=;
        b=C1Tx5Yc8VI4+oruWbsFbmcbiyEDxMm5K32fYN2OkZwTIH8bjSDBTaxzoYtgJQoTsTN
         36LZ9o5zX54SxrfFqK7OBDVBBZ0MFZbv9RojpWqhTHeFc1HdP+M3Jp4z6YwQ0H9TAVMm
         oriKEkf5VcxgiWWTkJlBskik103mOYmvymKZ1TeNRgKZneoD65L/p+JYvDtpFXt7R4t1
         fEke+9zGwzZfnaiunenZG9ewRCucehSjSj03vMBlV5fbreEN5eSFAl+dKeYSyjgvKmLn
         PlCHAuwc4VMI1bXpeCq6YWS5sLYdRM2/O91/qF7xwVmZSK6F5IqV8ETKLTmhgC7d3eSv
         vK1A==
X-Forwarded-Encrypted: i=1; AKwUvByAiAC1VuMjbUbDTeRNOnDl6Y/NddQx5cdRH8vyXrIPQps/BvHXfXzhC3GzHNnBDgc1GLD7/JS37XVfQO6AJmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WzXIgp2aKkZm3ZPcvrpXmplsUvZzn2ev9iVwutxnDGoZpB3j2
	rZoktRfbAFW6Gtx++VUJIyed3zKiQMFPY8oWbTg59Lj1xEz0zPU0+j1qRtdpOEvHTe5zwC9rI/n
	Z4ICkhqV/MOkORrBr9327wui3AH95LFM=
X-Gm-Gg: AYBFou3XLMl2D0XEgTUl4uAv3FuH/wQa3botfOuRlwS2UaSZ2/zEmp+ap37UMlaAZo+
	c3FdDYXj6N4XZSdzpnI0LC7Wf5Yf+IUSHZTDrva5Yw5oMbPiokuqFyySWtbXyTpJjGLrLGb/SGp
	f2wXEfx5wRdaF9HPNQFuTi7SCAiV0yzkUxhESoBOPAWfB+z+N6duRBi1cghUdo57QgBMqxSAVag
	LOv6Pw5hW8k40A41DsykzY8x2ZNNp7fTBmtTwWhV5dxygV22+TNjbdYBRj3CdzrbXZMomMKWebj
	w7JZ6Q8NNm9eERVbbwqQAlBgeJWUwVV1mXcZb3l50wYAMwoMpXN2GufX1DMfYlCFlBUwUL4/vq6
	qwrQmRfYe0hsOTbK+srzs6KOAwSAoWflAU4UfKrHdlMonBsaYM49TZ8i1I78f6TRTlbnkEzO/sz
	NucPoe6I0euHtOKILRDRUCT6DppGql0cKO5g==
X-Received: by 2002:a17:903:f8b:b0:2dd:ad73:5b6d with SMTP id
 d9443c01a7336-2ed40ad432cmr11270975ad.29.1793919287795; Thu, 05 Nov 2026
 14:54:47 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105093212.826479-1-yangfeng59949@163.com> <20261105093212.826479-2-yangfeng59949@163.com>
In-Reply-To: <20261105093212.826479-2-yangfeng59949@163.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:54:35 -0800
X-Gm-Features: AclHuK-DzSYkqcsqv4sSPpyPME2cg_aHhMiCicQL_nOHKzRgCizS-_dThi2hBRo
Message-ID: <CAEf4Bzaq7y9q-M94X-z7sBquXuB8yUOjFC+TAZ0C1+VxriLd8Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] selftests/bpf: Test faulting build IDs
 from a sleepable raw tracepoint
To: Feng Yang <yangfeng59949@163.com>
Cc: song@kernel.org, jolsa@kernel.org, ihor.solodrai@linux.dev, 
	kpsingh@kernel.org, matt@bobrowski.net, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, 
	yonghong.song@linux.dev, emil@etsalapatis.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:33=E2=80=AFAM Feng Yang <yangfeng59949@163.com> wr=
ote:
>
> From: Feng Yang <yangfeng@kylinos.cn>
>
> Extend the build_id test with a sleepable raw tracepoint on sys_enter.
> A helper process pages out the build ID page and issues a getpid()
> syscall; the BPF program filters on the target tgid and syscall id,
> records only the first hit, and captures the user stack with
> BPF_F_USER_BUILD_ID.  The test asserts that one of the frames carries
> uprobe_multi's build ID.
>
> Frame 0 is libc's syscall wrapper, so reaching uprobe_multi needs user
> stack unwinding; build uprobe_multi with -mbackchain on s390, where the
> unwinder follows backchains.  The non-sleepable control requires at least
> one BPF_STACK_BUILD_ID_IP frame, so it cannot pass just because the walk
> never reached uprobe_multi.
>
> Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
> ---
>  tools/testing/selftests/bpf/Makefile          |   4 +-
>  .../selftests/bpf/prog_tests/build_id.c       | 134 ++++++++++++++++++
>  .../selftests/bpf/progs/test_build_id.c       |  46 ++++++
>  tools/testing/selftests/bpf/uprobe_multi.c    |  37 ++++-
>  4 files changed, 216 insertions(+), 5 deletions(-)

this looks like an overkill, existing uprobe-based tests seem more
straightforward, is there a problem following the same pattern?

for instance, why did we not need run_uprobe_multi_syscall() before?

pw-bot: cr

>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 77682bf28c6e..367166383246 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -650,7 +650,9 @@ $(OUTPUT)/veristat: $(OUTPUT)/veristat.o
>         $(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o =
$@
>

[...]

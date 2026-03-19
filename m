Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA12314B62
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900892; cv=pass; b=AFyQe5250mWasPq1GI8bSpCRkACdgoqtT8kN4GAOi/uqWtAhn8LiRYjBAeNrcsXs74XMDc7m41+uQ5OyIBRhJ8d+vkpMBN28hRLpSV+KM9tZMcDiTTWotmVf4S4I+KXH5ZwwSHB1gP92p+DD9e6x/BtKn3rLXJYGda4ALR8Mgyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900892; c=relaxed/simple;
	bh=ahj5e8v5Ei0e7fMom0NKavN5sfGycf2Srrr3iKT0Cc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eg3e+AuAK2WuDKDqAK73j3iFOvJ11PJuLEo950VcQIRMadD9YLFUViUW7rju1TeIlc48NBdh41PL8VLMMeBYicmFh36hVxbUuxqoG13GLmfKkQDqFgOsisWKlLCeZt0WBSe0vXlFfSdyBY9WQTN6np09AQUYRtyXCeN84ptvX0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW5aviW/; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW5aviW/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso5499105e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 23:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773900888; cv=none;
        d=google.com; s=arc-20240605;
        b=EvPZOItF3ZvN2LW4nN4CCI2JR43BO3Lx7YMKW8JNgMZrRLOtkMWnbMPGJRVLBiu/5Z
         7FxwxegqRg0A0xI4vr2azrIcejyL/hHDiLr8D0F5uxyuY628aiCPpnb1Gfdrbr4hXkdI
         55ZgeBaOZMa9T2YdrWZwAjiLTkYoGrHZgD9EzhxUfByq8NR4B7HOf9I07dWR1eJnuX1V
         mOjG+IqHoSFX6AydKDsPib95Jq/3sn+44Y2yVPJ+6LEOO3BnM6lZ+DyJ7/S25iaLrIjJ
         R5qy0PslqnXsDDWC7tqap8U+ix0S32pvl7aVQUKUcsB67wxYbY3A3B+gZFw7rZOF4Iv8
         3IlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYmV+yVLZmo+hPcweb4z07eI5e4Eab7WRQcbmZBHF40=;
        fh=CFiuiS/rkp5RhGJoorRfzKmAfbTe3tJfg9hJBbJH8nc=;
        b=jvAjrKOSfz+XBbp/tArGT0wbPIt3lCVFVEehHwqL1VJ3+U/jvHRmffG1ZoV4SICkuV
         KNrKlF+R0x6ZBCWpRMakf/iAyDbc/nwdQMJ0ib0kFgagd6xIoLIBtdcjy5OQvWQ+e8cy
         J/Z5GQhM+1M+nmAPiUb0h0YJppsiWpqApeXLryTwciYL+jpo4IxynFAcbHeKnMKZhesf
         bYbWHXnF1CnzjxME5FO/4q7jf8yuhdOdNt2FKUwbO2CsKDtacgBBM3RKOk3EfeBWCF0G
         wENalRuhJ2LrXmMXnz1UCbBfVsENs+xmmLb7az+X5J6krjt5hq3T0lLPw/7EKt8dLEEs
         aLmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773900888; x=1774505688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYmV+yVLZmo+hPcweb4z07eI5e4Eab7WRQcbmZBHF40=;
        b=kW5aviW/rZaCpdigsX9LlfgsSZV1fPuaKKfTwEO9aaw/d99RSW39+HaS9I2Yfo4y1y
         7JlYaVMo560R/ReN8m2BDG2xkAE8wKBHVh9IKLB2dDGGdtXSoXEB61PeeKm2SYQM0+qP
         qI50irdATv2W++pIPSNkMlN0SO6W5jw0fOKUQmZtpC1YTcJ7lQRp+nkygCH6T8pRH2Qo
         9SLCER9z49p5Bgr960WOWB/zGdb8y6sRTdKgM1N8A/3wr12aF3EBPI4CiLxrlYjtHkqH
         bJCibAgUDWsHolW2YV0w3pOkLwcolFK4K8R+k9diowkvpAvY1s4sqjIkxeuPeaDisrTz
         PCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900888; x=1774505688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYmV+yVLZmo+hPcweb4z07eI5e4Eab7WRQcbmZBHF40=;
        b=FF4CWjldKls0ocCUQdglpK+lh4/4ut5OjiXM4H6IeOAkGjh8Ech5cS/KMq7bBIcN9A
         KMHzLNkyOLfdLll2Emsx4w0NJas92KH80sS2S7wpOIdLmRckn5zAIrFdhXtSzX+L2D2A
         0zZdpRkmLGod3VPWED63w9ISYeRC1Enum+MrJ1OsMGmocMy60JcxhlrPvee4qqfz4u3U
         mjcgk63QHeFVKqpWmzu20ECNufnyNF3M7Z+ESqAwcpJ5ZlRg/5M4z0smgB/B/7hFFhJN
         vzPWozce8GHGElDmuORhn4b7HSJjS7xR43jXP5bSqyaUoEvca5nbKu/WLYet3gxjx8wa
         Od+A==
X-Forwarded-Encrypted: i=1; AJvYcCXqb98Wd63+0izAo83DearxRx1O8PFDqX3y4rwmFL+6mTtdetvbZG//To5mFOTswji9Q7h1ojNnu1UBTfbyPvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/99OU3vPg9IT9mJ51CKmRXy/4oWpYFMP88rsxD2pH/DpIsXub
	S/J4JoT4oGMke8pQOVo/35N9tpCDLYGKFDjuZt1aP9xEjTd1OZotrlhke3IhXEB6jHxPHFrYSwl
	Cg8+f4fVEJjmRgz1Ca5RHoVPTZ58J5xg=
X-Gm-Gg: ATEYQzy75pL4xx9dnXu1gw5P8krvoQR9By4HTAWUJyLZvkKDRw7mVLamqQGp7Sr9/6T
	wg7TgqwSh4Zm9wvjaZHTQFUQn/JdAJKQBorm9VC6z9+FKF/IDVHuRAy+8DzPvdiiy9zzXg/ih8E
	Ho/sIeyAPmlpyGGcWgzzxp6r1KsJYMYF6mMFU3lUnXOlzRRFUJxR84BRYkd923nvGaiBmH/6Cqx
	/nqqKDEZCNxlSmNjVmKziWRvNmDlBh0/A2xgMV3CqKhL0lGWKeH45JzRgFW3Ttgzpm8LcuXcA6s
	Sl6C7KLX95BgxuNhdsOtY44MZNbQXrEWtel3WZUT6wXwfhcpm6qN81t8aOQGDo18y6jShDycXJb
	nxK2ESkW16/6FgaGs1mU4eNMZNQ==
X-Received: by 2002:a05:600c:8706:b0:485:39b2:a47c with SMTP id
 5b1f17b1804b1-486f445fac2mr90958645e9.25.1773900888388; Wed, 18 Mar 2026
 23:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com> <20260319040337.366375-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260319040337.366375-1-sun.jian.kdev@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Mar 2026 23:14:37 -0700
X-Gm-Features: AaiRm52DskLo1ZppEqz-30QTaNt_fpupNrXKzogunioIvSEXOJSrNHANtDzQT_A
Message-ID: <CAADnVQJAg1hYmsbVaHcR0jYZY2v3A4iNOiPaMAWRVGpf0qPN_w@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/bpf: move trampoline_count to dedicated
 bpf_testmod target
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Paul Chaignon <paul.chaignon@gmail.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 9:04=E2=80=AFPM Sun Jian <sun.jian.kdev@gmail.com> =
wrote:
>
> trampoline_count fills all trampoline attachment slots for a single
> target function and verifies that one extra attach fails with -E2BIG.
>
> It currently targets bpf_modify_return_test, which is also used by
> other selftests such as modify_return, get_func_ip_test, and
> get_func_args_test. When such tests run in parallel, they can contend
> for the same per-function trampoline quota and cause unexpected attach
> failures. This issue is currently masked by harness serialization.
>
> Move trampoline_count to a dedicated bpf_testmod target and register it
> for fmod_ret attachment. This keeps the test semantics unchanged while
> isolating it from other selftests, so it no longer needs to run in
> serial mode. Remove the TODO comment as well.
>
> Tested:
>   ./test_progs -t trampoline_count -vv
>   ./test_progs -t modify_return -vv
>   ./test_progs -t get_func_ip_test -vv
>   ./test_progs -t get_func_args_test -vv
>   ./test_progs -j$(nproc) -t trampoline_count -vv
>   ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
> kprobe_multi_test -vv
>   20 runs of:
>     ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
> kprobe_multi_test
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

if you want to land these patches please participate in code reviews:
https://lore.kernel.org/bpf/CAADnVQ+TKKptnNB25V3=3Dbcdybh5G6c2DyW2sYtXvyRaV=
nPN8MA@mail.gmail.com/

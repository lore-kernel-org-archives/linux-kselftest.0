Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795668789;
	b=hqfE6pS4va8HYuXN/lKyb3d9g+3kQ7oBrz1ih74P8CcNfpCfpDpoYhHr6Ge3fxriO5ge
	 SgRlpw3jRJxDHBJepoc08pViTbiYLlnBc+WlF5vh6NVfPrCTihQTau/JLKaJC/cguvLiz
	 4sgTpMqWhp39lTcU554G+wyRUP6pgSm2uusfFmpCmCNzQO0L2KtzfrOg5317BMMl3eoLE
	 +fam2UeNoLXCvQ7OfiI8XwBqNgC+hIj5Z5ta7564ROd660fzfGZJU/QdNfq7ziSr+QeKB
	 JU+opoXXcAW4iX17IEU77d6JeOmIRgEzdPqhKxz92A0xdcQzN30eMAMdmakBr2MvofA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795668789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
	b=iMnrRsoFNp24QvdExXf2NovqPPUnrmUX6lpbdSgGVQUXKvU4PV9fcufC3Aiaqd1/Wosk
	 lfQY36JYNdduDXqqiQIVXkr/ktnO9RIX31Bg3Ik8xrrS45uaVhurLDsMHqfguvxZaCtxM
	 ePjqFpY2RrgZ59QjEV1v+V88p7ZCHXNCN0CDPXF5qW6Aa5b5sdNpgm/XxVjzRLI9HXL64
	 or7ILMw1EJZCp2OeFRld+lrGohk2U6KOjY6Jfau15UOZzWS7FsWcrWM03gOAuLOONmkKR
	 ci+U5hcVsiD4YiHy6WYXOsWRa3wPa4CZUyLb+zuFMPLRJEnsV7ib7B2C3pLwbiYUEYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Wt/H8uEX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A239606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 04:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A239606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wt/H8uEX
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-54492d8a988so1599691cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=VJ0NWKeDw56EGHMd+wvhZOEoaLYaPiBrJlyYY6QggvXJSp2JzpEotf11+5JBvVbVA1
         mVxl2gkBVANoN0wvF4oc2d7RIyeRz1zYqKK1Rqth3H5ISFDKWc6VXlGZXBJ9jucztg+R
         iZBPoN1q8/RTpOD7qsenH1UfvIOVl4I1kKrKWZ0yojyruf4zVyV8e8EltlUnFp//EugK
         NJP/iD064NnBoCl4EDypdmAAfPZ6sb85wDQsI6yuP0m9YGcPaRjov7idNSFjPDTj2VG0
         1MXrXtdCd9hJaOwXGrhsCAzc+thRWUa8r6rce+yrUKO5yGnBrJKSg6PBIygKxPPVfCkx
         wNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=S5CTyYrRgiTDc88jgg03NEqDm14AF7wHgKkmmQ3f9N4=;
        b=HWCNk8fQAQEg0yOz6jLiWox3MCB7iid6uWOluqAhe7FVtIu7HiGSpsscnyM3sMh8HT
         6hYb0yAtHo/1jci8FnxpRu6NeKuNfaBlc99ovV1acOYR55UnV7NWnPwoDZNMSBhvlAMV
         cz1OUbLHjWnnXML1jfg1zGUNTsXHNVkGYVrSTtrD4XwTqwmlrEBqzdDi3uk0kIHEvRvJ
         QA0B/EVyti8iBsKZd1KHMJmcZZ9WBKgOCh7eGnWmRd7IGRcp/Tg9557/zabHHLWj5d0B
         TLIAISD50E98neGuGJx1t9XHlJTPEQEGz5e3bLPmA4ZrFnA1dk5d12rWYCOd4MC+Kanf
         Vvqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=Wt/H8uEXeygfnRJXsnha4ogYR4WFdKKtucv0h74Hl9SvZ7ZVOZ8pyveIu/m+bbBuqU
         7pLEkyr5FS02oSIkkEdcPGP7aMYZHs2eR8ZbSslwbXiv4nig66Yw9zXIl5pT+EHlNoMU
         cQHBNyntCt6+GiY4hESZ00/HEKXKxMOneQnWVqwJdquEVsZ01fF3oKFb+IYLDHDd97P1
         5iwuBre8QUjJjwbIhiuIlmYLUamd902f2vsDR98ELoNLHrtAN91EmUr8k1YyhoPYh3J/
         v+aNlL3NNgtJeSDZE4JVJM46ZiSMrhfEMHEAp3euRyiB3I6N1f0aZKatBbawmZwgSrYV
         rmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=DPp8n/+EXEn8gjE1jh6I0MQb3TFG+tW1FoF5Fhl57WCl+tIyHU9OsrM+fB80u04XbW
         5Mx5HaSg28EFj8o2qh9jnrcf/xpNKSZX7Zo1YltjzOGeRmH6e0Dj4gvhcbpykEY1XAvJ
         M8hO+0+bnbSyV1LnjUk49Jtccu6Y8g4Jq6gmKYPaDlww87EZUro3vD+y5Dwp0oozDH+s
         4NV9iMh8x3METkVwmjPOfZZnwu69RPdLs1KDEtJzL+2YgZb5AEWkypXZtYCwe/3YUA/R
         NjVYT/MN4/IKD7iLsX6tY5nSLBpAzEbRcCJ723HCfH6RwKRDhMRkXNlRRWQq7wSfEWpX
         unDw==
X-Forwarded-Encrypted: i=1; AL+hErEyF/FR4GwoY/MXc4Xy366ayFMd+jlNQiWN3QxpM9p9Umv+Tp6hs7E0G2UxmjJetTEfCvdifLHQUSIA5OsEUJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wt6wsr3BMwIc+CSlCrvYUjtS+0v9gkzBFmLd6TE89J/lh2rmf
	qSQZTs60M+KnEZhp+U7DnDA98YLuDper2rPtJXPxogQk1enQlz39+EOj8j56TA5xFIVwHqRFPfk
	2hB0//NBLyAnGg+XcPqJbRbViZV7EWkeEPhoMMXmv
X-Gm-Gg: AZFdTZcmGJp8kHobTot2P+pmb6R3Lz+Jdb66rCAv7VVG4qEA+bcrJlSE/hUUMy3v8FX
	7bhLxztq8kuhjzO3Sifb+mYvZDTLuG7nZAKvoqPn9qkI6k6w7WnPO6MXu6/LpHUTI08lo0b9q02
	b18Vx7cnG9cpMWxXmRgo/fyjSsiEpkNQoaAscs8eyexmuyblthTbQCq8o62utS6uRuD+rUfjwBV
	VCyyWn7I/Wa2kRKVLUbNuaxyj5i5g0UsEdwVpGaa3u9j+xwmnoEFPI6Q6VEEHWQj50YYLwdC53D
	DdbwNfgTKj9iFiW3mpekBoIQuCZen7UUK+93znbzoo7SWDgdzvzX754HDagHwjgWkXhjRACDsUK
	EzKdXfXTtrf27Nz2UOGU3zVJS/GwzMPqzlFIp4ZCl6CE57zyG151gZ2uhUg==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 10:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Wed, 25 Nov 2026 16:28:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
> > A quick question: how do you plan to get this working on 32-bit ARM whi=
ch has
> > its own EHABI?
>
> Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least no=
t
> adding new features.

There has been recent work on both MIPS and Alpha for perf events, so
supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
(according to https://endoflife.date/raspberry-pi ). It is
out-of-scope here, but extending the kernel and verification
infrastructure shouldn't be hard.

Thanks,
Ian

> -- Steve

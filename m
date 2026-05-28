Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606513F4DE6
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975230; cv=none; b=pPJepIYBqKk17kvfUKeyzYJ2jLuyxndKFS612nWUErjiTgtSKB476MTyMH8WboxlqjSrZXMLBzAP9zJv/GA2fswDpzcIAeKhuRMfLOzcN5Xt3fa2DA6Josud0AULFQsLBn87OWYieNvi0kSMelJSVKfZ5yltGDAUosLiEStIyHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975230; c=relaxed/simple;
	bh=e6IS64LlvzH31ZmTnvUmp+zTDi1i4OKg3KMzKx5frzQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KJ6yTZ9vII0UTbweP99dpwNdNfzhn/klaxyjZlWEyr/kpEhUMWE+MQzmqdFYAagrivD43+p4pFD5m8EMNRIV4RI3CyAcrMg/mmuAYrgyH7gERq+8fRYq884GDuMf25wFNgKBYhimppPkiUTOgP3uC0hYQaxTmlJcDTrWM31DOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L+ObAeqE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L+ObAeqE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49039a8851fso72672035e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779975227; x=1780580027; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e6IS64LlvzH31ZmTnvUmp+zTDi1i4OKg3KMzKx5frzQ=;
        b=L+ObAeqE6S+PJZ0hpS24yC4i/tNYh7TOSRa297QaPqsf/6Vbokqjq25Igmo/Xe6kq5
         cMV1tRqVBaRsCxRyRx6QW76NijsTCbBEIbNJPKVBqtEGuCOwSOut7DVNMn5b8sevFaZG
         m0TZbIPSDlh/HsYBXXwmaDAIIWjPsm6Uxc5Or5kYDtZFPs/IhGpT/fcU5pTOAKEMLHi4
         ktqK/DyCx8f2T67r1lIF/jgq2z44e4HcFvkHHN40urqMKmrBBPIRw1NOnPX/gk06/Svs
         GoW3lXNH/U0n+58VZgoUBdR2Avo6Z2unTZDPRfdgVP/42pW3+o42btIAToC54bNZfqwh
         WjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975227; x=1780580027;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6IS64LlvzH31ZmTnvUmp+zTDi1i4OKg3KMzKx5frzQ=;
        b=ribibWh1HnCnM+mcgcUEzBFR9Pxr0/Ko1OA1EzCH2NvYeI+b9DM9KO6cbI8psNwisd
         56SHPhTYCa7wCEna4570q54+ZqXACDtiSlvc3fp3jHP7mZrvZRxiWEzTYW0C3DPydAyX
         4FxbQKIR0fCT9cN2oztVvLYyz2keKv3RWIrb2wPNeZOgwuy3x2JVwfM+WQCLvvRMaRcV
         NrsHqEozuTgXKtOK11vFQpVYBRSM1xEH/DJXwPbu0/WrOp1zrTr9WNbuBpWX78YCMLjo
         h4L0y0H14wpYQ2dZ8yTrS5nMx7eSqQhkAve4OpHPUDW9eiWS3zM6EKgkRiW1sYVhryCu
         wpIw==
X-Forwarded-Encrypted: i=1; AFNElJ8YfdPGMcwyulPZqh20b9LrfvuyT1Ee6A2+uDWBImoKTAXfSi8TJrhq9ifDE5O8+RTf/7vcCMWLNbTBCZRqle8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqJcq99588muLMOt/to5FcJ85Cqj/wrAVjFEVi67lEBu89WxF
	t2EE0j27iofyUOHMR+L/A6gZYHrVecpgiHwyC8ApE9JP3wvaFDFliJmOjeUEzY8UGzw=
X-Gm-Gg: Acq92OHcot0H8pZeJW/gvFry6xvuvEhxeFwJGOAvgAgZ17NggWsUCu/CMCvKfO2LrHQ
	C2ui0D/gxJcKj7PVjWgb58S10vXb/RdYMIGwwS71no34fWYIybWewZWoy/Wz5Qh7VmHPOPPEIOE
	tgq2YmVeTKIvhwxE1D0q+gNFNRUEKk43QizhBhY5dW3AV9ExE/5BU0CVoplAKLCQZtD6zgCBqPm
	tG/rikhcCHu/l56v9/Y20pL45aXl8AdQ3gc5wvRXAaxTfLPaTsw3bsgOxbZNGSa7NtOXe9EJbE2
	sWAyxDRRtvY7/WlwLwwzoioDc/V7nVvS5WQd3jVjz75hdR0B0sDSwp/5sH0VNCMPiT5zK50Zh3D
	DbnSJLg1xAn18+x9rib4cTppAil/nT3iu9LqZRm0xPsiDUIOd3og/qWvGuYjHjCS5hsxD62/FiW
	ehWezKdAmz9uu8VAaPLj2dUfcjP+7ouDv62djvpcyzKNEeLvbFIgaBPut2i4UY9ymat4LShVX9a
	4xXkg==
X-Received: by 2002:a05:600c:c3cd:20b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-490428c97a1mr317936895e9.16.1779975226585;
        Thu, 28 May 2026 06:33:46 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a817d3sm48318915e9.10.2026.05.28.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:33:46 -0700 (PDT)
Message-ID: <5df8ff7bcf1f85a21eea3d4f74451fe6b57c118d.camel@suse.com>
Subject: Re: [PATCH v2 8/8] selftests/livepatch: Add RISC-V syscall wrapper
 prefix
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexandre Ghiti <alex@ghiti.fr>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,  Chen
 Pei <cp0613@linux.alibaba.com>, Andy Chiu <andybnac@gmail.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=	 <bjorn@rivosinc.com>, Deepak Gupta
 <debug@rivosinc.com>, Puranjay Mohan	 <puranjay@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,  Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan
 <shuah@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,  Namhyung
 Kim <namhyung@kernel.org>, oliver.yang@linux.alibaba.com,
 xueshuai@linux.alibaba.com, 	zhuo.song@linux.alibaba.com,
 jkchen@linux.alibaba.com, 	linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-trace-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, 	linux-kselftest@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Date: Thu, 28 May 2026 10:33:34 -0300
In-Reply-To: <20260528082310.1994388-9-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
	 <20260528082310.1994388-9-wanghan@linux.alibaba.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-05-28 at 16:23 +0800, Wang Han wrote:
> The syscall livepatch selftest resolves and patches a syscall wrapper
> symbol. To use that test for RISC-V livepatch validation, add the
> RISC-V FN_PREFIX definition for ARCH_HAS_SYSCALL_WRAPPER.
>=20
> Without this macro, the syscall livepatch selftest cannot resolve the
> RISC-V target symbol, and the syscall-related livepatch test fails on
> RISC-V.
>=20
> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>

Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>

> ---
> =C2=A0.../testing/selftests/livepatch/test_modules/test_klp_syscall.c | 2
> ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git
> a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> index dd802783ea84..275e4b10cf59 100644
> ---
> a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> +++
> b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
> @@ -18,6 +18,8 @@
> =C2=A0#define FN_PREFIX __s390x_
> =C2=A0#elif defined(__aarch64__)
> =C2=A0#define FN_PREFIX __arm64_
> +#elif defined(__riscv)
> +#define FN_PREFIX __riscv_
> =C2=A0#else
> =C2=A0/* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
> =C2=A0#define FN_PREFIX

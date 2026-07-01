Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B01531E8
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 05:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782885048; cv=none; b=Tsl1SerPH1Ije9EpFOzoFsCM9t3rnJBTjSY/c6YiLbuAMgSUR7lFPx5RSQOoO3oNqXAj890ITYPOuqAV5vcUhhyHuB03uUaUxelflWSNinbmmDpgAX0nVJAAeDHTXmCmk0g4Ud0W7YCH4m1Akdvttek6BIYQsM46XENvZDam2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782885048; c=relaxed/simple;
	bh=mmSPShkq+yvykn3QSSoYndfepKyvD4UBvw09Q5s8Op8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Jw4X9TCYncJh6pKt1puQ9Af6NME7wMKMWlk3F0oz6hT/21lDHbVVnR6Xs7/17pIp6PshCNrGTpV3V1LFOZJZNPgA+/u7EHnUDFiEMihvA75DlD900IbyQF6Plz3r/N6F36F5x7qIENY5IUq8wo7ynpLDeFKfU70NT/LkkUnGaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AadCTgFi; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AadCTgFi"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-488b3fd8d0dso125419b6e.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 22:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782885046; x=1783489846; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmSPShkq+yvykn3QSSoYndfepKyvD4UBvw09Q5s8Op8=;
        b=AadCTgFit7sT/VtgVFpehM+5mgXLJAKMhgCOoUKG/KIu2NymltMY+pJ755FfriEydr
         vnTHdzDzmRuiEgImtBZkytaXNREfCaezA7ebWsR9zRbi7w7bL7YVC5D8yfvbvZ/n70TO
         kKuQfAPHK6bcdIrDf8i6Dxum3Kn7w/fU14/TQ/WmhPzwef40TeihhVAi8nvw5E6EgqJK
         k5Yojg3gheZJctU2KkaGeZLhuM61KMEslVyGRhswr8agm+R8vyrVM7pbUyOKPZcY0OIA
         542mj1EIIfiqG8jHRIYsVWjllMVIONL5FCnodoMZ/LF49repMXsqomkfNCIL8KuEHLrY
         XiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885046; x=1783489846;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmSPShkq+yvykn3QSSoYndfepKyvD4UBvw09Q5s8Op8=;
        b=VOAoerCLSM2PGksTkUOgk2JeXxAlNxxiLHU49tchrmN8H2h+IWnrRH01bVMU9Rh7R2
         9RjhAGdzdbvkAuEAwbO/rXQkLD494BZMpp/uhV6GWlfP2+2YqE1l39eppYNJHSslcs3G
         76Z1XqwNeaI6mWNzjsEPxDRTzpIEQuwvOVMxwfNLpNMdylsHrS4UolhUZ1H8dh9xR3YM
         HeyK1aggiuOjwFE/P/2+TNFtcdBDuEKhXYwIGoEnw8LsofZCF2sGSBOr/NvEZgL10rrG
         adgKAHQMc6OPkWW+llTHec9cNDKKKlTaURUtayAbaA7kQ7h1z3Fk/HNGgb5pRPwZNq7H
         qB4A==
X-Forwarded-Encrypted: i=1; AFNElJ/RTn0Kna9FGHs//RqX19P1B5uMcH9XUAsYOvvYrFY+mP+lgMi5aU1mDkM41U7udzPIdI0xR9c7Gq1IjJTWknI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQiDVkBDpC/M+zc9SWpw5sIogWOoEStxzaT7LLcWolSUsXe8m1
	vKkyfXc6FDDCPA9xVudYju1UkcrEPb3Iqzl5RNNdedw+fq1yT650T5MW
X-Gm-Gg: AfdE7clEyEi6KIdj5OHPU2ptV0FLBRIcq2djx8TFbZZZJQdhYQiRYrCQDLYDQamH/wB
	TNV2pjQitp8KHBu74yPjk6JqT7CJBClh7aqIW54m5wwuZuWE9JSoTfZ1cyqyIvLFQJwj0SRQLoi
	jVWeUmcHEcI4MS7n0HT79c1k1UmyznqIaO78Tp86yAJujDzpfuWey8FxFbZ5tJtVfByEDnROPCa
	pAZcblyb9UFsktv7w+ZjStlVudHmXnE9qhxcV31em9POZGe9t7VVViGpcA3X0g396QATut4SJ0P
	Ozy8EYI0HgP9bY1OoFuPAZRTSE9lvPPXq4Ym+SiGlkjn2E6Y2kgc/a1ezVBYhqWtRuF5ef+3ykP
	fR0ObeJ+XpAuXtSii54bqLtnYXdt4wwfUS+xS585/B4T+DBEutsOFRVrzdBUvMhe3dUfuiaBOwM
	KMJe2CvmL4NV+X5wGooXtU1QPF/RN+DzDlTSNjLSrw+4jXF/bky1Ngb3GKSsmMYIkFObpKLQs00
	yUoKA==
X-Received: by 2002:a05:6808:198e:b0:495:e16d:5d03 with SMTP id 5614622812f47-4960efea9ddmr138876b6e.21.1782885046122;
        Tue, 30 Jun 2026 22:50:46 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49606b18bc9sm705829b6e.15.2026.06.30.22.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 22:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 22:50:43 -0700
Message-Id: <DJN001X0S57Y.18CKUS4NDDQT1@gmail.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "John Fastabend" <john.fastabend@gmail.com>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Shuah Khan" <shuah@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Anton Protopopov"
 <a.s.protopopov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH bpf 0/6] bpf: Disallow interpreter fallback for
 interpreter-unsupported insns
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260626154330.33619-1-leon.hwang@linux.dev>
 <DJMRIZ5PDWP4.12OOZ8H881H6O@gmail.com>
 <18678d0c-f878-4d7b-bf7e-ffca4967dec5@linux.dev>
In-Reply-To: <18678d0c-f878-4d7b-bf7e-ffca4967dec5@linux.dev>

On Tue Jun 30, 2026 at 7:59 PM PDT, Leon Hwang wrote:
> On 1/7/26 07:12, Alexei Starovoitov wrote:
>> On Fri Jun 26, 2026 at 8:43 AM PDT, Leon Hwang wrote:
> [...]
>>=20
>> I don't think we need such fallback in patch [3].
>
> Do you mean we can add the internal BPF_ADDR_PERCPU insn support to the
> interpreter?

No. See why CONFIG_BPF_JIT_ALWAYS_ON was introduced.
The interpreter is a security hole.
It has to be _compiled out_ of the kernel.
Hence all patches that improve fallback to interpreter are misguided.
The interpreter has to be removed completely... sooner or later.

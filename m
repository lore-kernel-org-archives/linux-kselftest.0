Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC413659E5
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003582; cv=pass; b=jClPYxgvkQimuUASYzYQR2gmYcMHsM4+78QbIL9geBqwKBZUs7Cshlua33+utNgDK9tOvEYkDBHoWhKhqftvpbMRgjmMENzrYHfwAMeKIgP7vKEQmHBDCfLw+ZtLnWS5cI8Wwyy1JrjCDPMd6p+WffBMX4TYWcP/PrDayDfAG9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003582; c=relaxed/simple;
	bh=lotuNP4Zp6z3E2kR3WiC1e7RIDgdXKIyIrB9y7DGQAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdohYX6P8C30jy7JViawTGDIpFOM8u3m036XP/NndsUVFBtTcrtKJdQcQyFIpYHlvtDPJ+ydnrTYzr4wtlBSJSx8RmZnnvcs+0PGczKerkOmOW97UdNULwlh5WDQzyiwWFJhzdgTOgpERXqiHeRb3V8s2bFYSRXBrX+kbP11clw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v0TVK4pY; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v0TVK4pY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f9568e074so168260766b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 09:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771003580; cv=none;
        d=google.com; s=arc-20240605;
        b=JOYZB17AVtJROJioUnNMIfMloaCcw7dax+Xvq9iHWEDf7zjfPrXYJ+aiW5tKXhl+cH
         l98dWOGNaMojNQPNUMV0INomN8OaMIzxlZBG9CH4gXvix+BnJ0kU2+4dZpId8UB4Rpog
         fyp26ySXDwyKQh+ng7PcYNcvEW3FHa000SYocCa+ISjJDjaBFAFRv7NlENT77/0darvz
         EE80XHyEVlsWZWFnqVYq0ecHjvJJ7rcWG5gXKq3h7wIJYDSLGfAqcFkIgWk+rViGOAup
         z+wmfIhw1ZK+pvzlWVQj8YFaOr+qBL212juk8GJg8cBCkQ+/r7n2LMSjzFQ1jTJKwLOq
         deJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nCWKs0sHfcbW+waTdh3px5mUD3gaIP2YRS9eeoAxtLg=;
        fh=3A7gyeMWVeVyw+bLeQAOPOxeqSw8QufTuxelXf4Pha8=;
        b=JGjh85ay3rlr/ihFQJmX+wWhewBRl/7odY572ASI5g1nWbOhvBs6lsNmmRyRHT+229
         bAE06lFI5i7PcoXnDDsNn3Ts5V+IlPy51fr1gH3787Dk3DntDYn72JKJp+btDh6jBjhl
         kh47CwsD+YeFUNyr7daHaK6MFAUfKXbBxfajsbTO/FuX4pWHYEBQMO53P94H8P6w4p+l
         BS6Nt6mFD1QUeMtBYlGI5evKFHZcS26ONJqEnweolK3HQFNULo+2xxQ0TzrENmxAv896
         AJ5K8fYNBWaB6IVd5OrtLmV3o76bLKELekIa+H8QRouE7NW1YDUQ/WHjpefmuh84xJdM
         FmZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771003580; x=1771608380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCWKs0sHfcbW+waTdh3px5mUD3gaIP2YRS9eeoAxtLg=;
        b=v0TVK4pYA8sF4bfr4wu+SSNuC26GPPv3yfhGQ6nbI6yz2PBVO+hdF7MDN5wE1DpyCK
         1IBTvYec0honbXQkV9kHf0slyyjTRSaG0JxQ942QFgXHZmLT8sBAHHMWcfrhtm4VpIjI
         q5GwpeAeOx5NlZRnNxKpfp1WO51FRmGnFV2qrqeOdLwHlOCVjH1DTzbace6KDZcOjLyv
         AcWi1enuWm19mqLYK3Vzj2OToNY6j3QnYKF3Fzr0kVLNuz/HSY+BFGWUfx41l1hEuefM
         debQz7PUs+idZMkRhsngKLQFb/uAw0SaPfVOef67djx2FPQclpEH4+W+1aJao+kUkLAS
         WIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003580; x=1771608380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCWKs0sHfcbW+waTdh3px5mUD3gaIP2YRS9eeoAxtLg=;
        b=QtDb2LCWY+CWStJoAdZgvDr3nYJK7ZH5KQglIo8D0RG8KBjqsvB65KslswNOKbc9IG
         oz+SwxAB4jaa5trotC8ps4qLDHOcT6aCBJQD4VAQXd4L2aTmHSg3aWM46FJu4LzQmBBb
         qci0WbHD7LXPvn5yNhH/xwL62leR7fwaMhXCM85Ilf9wBF2uj0FfzTH/T1ScOBqgXjZc
         NgZMZ8lf4Yn51GwjENZwuZy+1XYJka5fktuC9+gMqBJAl7VG7sR8WlrNNzgfBG4hJ4U7
         zaf3BHdPnypXWuSWVkGXmnHGBZ3n7UDY9YKl5M0+zh0vSnCJUE7vxG4qlGAz9YADGPg/
         wQAw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Q4s8J6ZXbHfsS0SG2Kq3Ce6yINIb1SXD7qUC/3OmwLUqszL9bUhYJ0KBTmGfaYbex3h5jLScAKsYDTepN5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuN2dzpwawqRzlgm+65spqjDX8I6ZFwk6D2SbRkNeZfWzsPt/g
	PxL+OQPb1YUWIAYq1O2y83m3ExVvMBtqc0ZG2+nGTp5JYvUlkUchNDKiLU+k+hwi1k5KN3yV/yx
	SFlJ9f/HFens3vso+H0dextHWET6drlUHW7k8TqmY
X-Gm-Gg: AZuq6aLvKnu/3Iv0EnaUjIedxBEoe2SmJ9yD2qfNjHMrkRxNBRHRX8Vr4x9lpaiA63s
	rnl5iaccvhtfsMNNbROx4G8PWsORBieH/W+xZU3XsfGZZJORVQehbwmQAB+iV3FABKWf6oYjlEx
	B3CQu91WYtQgcKb0e2zNI4n7HsBDKkd8gOZrcj+gvYILnlSuUYqRhZMFv8cBV2rh523OWyxaZvc
	jZQ2Ok4Xo5OSRo78W+pKMbLw5wD8y3qk73CyM6f5j5SSLt+CDuXCfPxMhKn5We9a1U+5Bvl0ood
	Y/xPczENoM9LxELt8HVf25hkWRm8mdHsXqv1MQ==
X-Received: by 2002:a17:907:d649:b0:b88:4efd:6cbf with SMTP id
 a640c23a62f3a-b8fc38f1919mr10934966b.12.1771003579086; Fri, 13 Feb 2026
 09:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217135932.3153847-1-srosek@google.com> <20251217135932.3153847-2-srosek@google.com>
 <20260123165411.GBaXOns6lupfE0pxX-@fat_crate.local> <3e36b3d2-ab20-482e-b35d-0540f950eb72@zytor.com>
In-Reply-To: <3e36b3d2-ab20-482e-b35d-0540f950eb72@zytor.com>
From: =?UTF-8?Q?S=C5=82awomir_Rosek?= <srosek@google.com>
Date: Fri, 13 Feb 2026 18:26:07 +0100
X-Gm-Features: AZwV_QiEZUU0VWNYgbcpy-cNZpH5g_hJ7osyI5atKXXaO-kt-GC7pEpgF06HfRQ
Message-ID: <CAF3aWvGu1WZf4Q71DvsuoK=kDdLUVTy1zXg8yRd-bmse_SQPZA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] selftests/x86/ldt_gdt: Skip int80 if not supported
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Shuah Khan <shuah@kernel.org>, 
	Betty Zhou <bettyzhou@google.com>, Wake Liu <wakel@google.com>, 
	Kazuhiro Inaba <kinaba@google.com>, Jeff Xu <jeffxu@google.com>, 
	Alistair Delva <adelva@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 2:02=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 2026-01-23 08:54, Borislav Petkov wrote:
> >
> > Hmmm, so, my gut feeling tells me that we need a proper ia32 emu suppor=
t
> > detection in the running kernel. I can't find one after a short grep, m=
aybe it
> > should be in /proc/cpuinfo, maybe it should be a syscall which fails wh=
en
> > IA32_EMULATION is off or maybe ptrace(2) says somewhere in the depths o=
f its
> > countless ops that it does support IA32 emulation.
> >
> > And then you could put that in that helper and then put that helper in
> > a header and not copy it in every test...
> >
>
> You can probe for it by trapping SIGSEGV and calling int $0x80. Not exact=
ly
> pretty, but...
>
> Making it a sysfs entry would allow dynamically control it, too...
>
>         -hpa
>

Yeah, it was actually a really quick fix, and now that I think about it,
I agree that grepping like that doesn't look good. Sorry for the rushed
patches, and thanks for all the comments.

Regards,
Slawek

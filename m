Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB6944A3E0
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024697; cv=none; b=eUjpQ6PDx9yxw5KYIh/4Njv1i8sHVvwzwNMOIwd1v1lajWy0jQUzlQDDkPKcae6/ze6eONQl6/BiA6pdv2Ifjd/5yL744KIm6b631EpgicIB8d+ooJhSl9VnA5liK1JOKb1neOZJ494oegKDHfIgnox+54j81ZwzUfCaVcd7RaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024697; c=relaxed/simple;
	bh=TCU5uKqftm6pV8ySX7thVj6H867cmVD/gp11mWSo7sQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U3wcDNGRrfp9mEu6T9ZBXI/5eoIT2RTpT/0mI+S8EScAxF/WFKqhV+IZxuux80pIJLh84iFbM+4VwjYjlVho8uf1sAiCQmEpACv8EzIZRnbr1WUUkttBKjhiXk77YD8nQL7Jkz0V8/IuLOVeIGPDrS4+UGQh0enbMGj5Y43BHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iknVkfMn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iknVkfMn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so42053475ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 21 Sep 2026 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790024695; x=1790629495; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TCU5uKqftm6pV8ySX7thVj6H867cmVD/gp11mWSo7sQ=;
        b=iknVkfMnxUBLQ3gdy8HebjX+bt4CiPsD77qBlM2Tvsnod1RNAsi0kvF+gyF1UPMK4S
         MEAo5Cm6y53FCrH7cX1cyT1u8XQUcrO5FsjTsiVl/+QatfZyTMZ+d/m8mfhf3MdjbnkE
         0AyMvaRr66EtvaGe+pSMLWq9oseUzDfjI8o8q84Bvkgrb3nReTq6WuUbTDjA2xE2CJOA
         IeqDFuCJJRfKq7eUKgf27X7oH+fLUWbXaWqgF1s9t7cW2qlTmQe1wTQS4pqlUShh0wxH
         u8IatgVEyIAMxlgD8Nw0Lw29bwmklOgHaDG0bfz6wTOK65Pg6E0qhV7UFCeiXrkIh/a3
         /fJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024695; x=1790629495;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCU5uKqftm6pV8ySX7thVj6H867cmVD/gp11mWSo7sQ=;
        b=0/LjjWCDZCYLDyY3ELQUwPa4gBjk1o9jDX/+xf+bQekSMUXeDJOz5ovxLPJtgSbBSW
         F1Ord+NkjdsvTgCwiQ2PoflWJEbkQJKVSEAS4F+dLppXBFTS/iROBPmw6zBgxUQC5VWc
         cvB8FkU3DtHGgKoUm57ORjK+aHhAkKJGpRj4Y7F0VTeraxkMrgQc9RTwJgvpHWD4LX1W
         +dwvSOO4QIyX0gZvScw6jWL8a91freZiAcHSSU3d9g79vzUzHaeGSarrWkZH4hofOR+P
         l2aqoZQUm7CqBcE1N0TijaaRDhg17v03PWBwgtL0xr+erjc3QQS2WunDhU+nzmiqvzEt
         B+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBznyzcXF3KLdZmwJ6wELRRKOFhLZ2y+MkzPM8qHVdi6u8Z1SsKSceImT5ztIqL/55UMubQBDC5V7nrXPmOD0vE=@vger.kernel.org
X-Gm-Message-State: AFuF++k4h4WWnbwWw/3jlYQXxnUeeKwjYeyMGjevrxVfCYglo/vyxxHK
	z8IjpMJOAbi7uufHHEAaF3IOSEn7Di4PvKtFja9DkCNPiLAbvSCDkqP7
X-Gm-Gg: AYBFou2JGGlY/IvHRjjnH1xkfMBrr0aGI+tZMfuABmOjAd3JPuLbu66yib5D2bPYiCa
	8+xHdhKHV2kzjFr86ptniPOdtKWNWRkP89iK94a9HEdVptGNC3mZRzglR6ZwO0Li4CcX8jbhAXG
	Wy5UeD+VvrXdTHC1z15cyELHds9iNW1HqsvajR5pGsDi6X74ehyA/uMOI7aHYrV5/UE3Kp7xj7c
	gyUAlqnLX48xW1Eh/njphTUhnY7oNQlA9RNHom3XrRVAcRut/CFA56k9IJDqklTTqKoOnmBB+0V
	aVuDbxgStd7AjD82IrmWzrTgKUmAZVLvDz5nSFZXlbbNjhxbcrZWe1VCui1d3Xy/gEU7kS+XskC
	WMOjwDFcsoGWHHKFGwyhfwTWvelEtbXP0i8jcghCpJDigFVc+PnX6ZDXsanSCkpQJv2gq7MY2St
	iNppOmoFeXqRjEDSReabHJOZaW9I6+HnGWY+gR/i9MD7UlaAsIRgjFIHRibV0zuvX1Jz8qsi8d8
	Duuep+5klPDQ/GxgBwWfX4IMHaxHsNIPsJlPB4RjqIsMoUM4XD4+5JE4g==
X-Received: by 2002:a17:90b:5585:b0:3a0:4146:2955 with SMTP id 98e67ed59e1d1-3a041462df3mr5954509a91.61.1790024695006;
        Mon, 21 Sep 2026 14:04:55 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:9de9:26b9:a969:69d7? ([2620:10d:c090:500::5:f95e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebc659dsm649340eec.11.2026.09.21.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:04:54 -0700 (PDT)
Message-ID: <d3a251acf5131bea732e23bbd135a5fdebec9ad6.camel@gmail.com>
Subject: Re: [PATCH 0/3] selftests/bpf: Fixes for out-of-tree builds
From: Eduard Zingerman <eddyz87@gmail.com>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>, "Ricardo B."
 =?ISO-8859-1?Q?Marli=E8re?= "(SUSE)"	 <ricardo@marliere.net>,
 ihor.solodrai@linux.dev, nickolay.lysenko@gmail.com
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, Emil Tsalapatis
	 <emil@etsalapatis.com>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song
	 <yonghong.song@linux.dev>, Song Liu <song@kernel.org>, Andrii Nakryiko
	 <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
	 <martin.lau@linux.dev>
Date: Mon, 21 Sep 2026 14:04:52 -0700
In-Reply-To: <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
References: <20260728-selftests-bpf_oot-v1-0-05feb15d94db@marliere.net>
	 <6f95ec90-194a-4304-9673-c7bb50065223@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-09-21 at 14:40 -0600, Nico Pache (Red Hat) wrote:

...

> Given your series was defferred, and there is a "rewrite" coming, what wo=
uld
> be the best approach to working together (between us three) to get these
> fixes in that series too.=20

The, "rewrite", as you call it, had landed today.
So the series in question can be re-spun.
Regarding your patch on top of it, it appears you can just post is separate=
ly.
However, I am inclined to be confrontational towards changes like this one.
The purpose of the selftests makefile is to run selftests as appropriate
for current tip of the kernel tree using a very specific kernel configurati=
on.
Main users of this makefile are BPF developers and BPF CI.
Support for distros customizing the makefile is a non-goal.
The "PERMISSIVE" change done enough damage already.

...

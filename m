Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86653909A6
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490048; cv=none; b=pAXyEu1aS98dtZFv/hxEEyLToQigmQLSmDIrIOFU7aUfJRHPh5xVL1fYOxMcF6zNjILpcxxkpv58/JAGYe+kxDa/iOPpFwMlt6XMog+dm9JLz624lXuwc6r35dR90S5Tj+h217tqdA0L3GG6C16Ll3jtCAKReu0ypI2bnCpTJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490048; c=relaxed/simple;
	bh=ELqE3d9/ijZ3NRkh8Tmqrfbq/PuG8/brzORU//KMIZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aYOhvf14HusRArOy1d/4qX2Y+AveQgWTVi/UlasIsD/VXaHmh8u4arb6zcm/8PBjkIWPwsJL5V1hS0q3DMuRboT3YcggzQgAvvUkwv2AHKp7fLZ1fyp4HdOPPffHYHiX0Yfh6/LDrnzDMi9GcOmvLRq1DUZMotLFp+Rx+3jdt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pgE8ViCF; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pgE8ViCF"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2be232ef3d3so67054eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 14:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772490047; x=1773094847; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5AFiFXZXtC1y0sH5xj9p2pt2KSm8pmrA6Rl7Jb2isOw=;
        b=pgE8ViCFIieZ2EWgPkBXaSISDkIlxO/et9B8l+cCVwkg154Tv7/b+1ykaiPBT8jxU4
         WFFghFW11vvc2C+buxCGjKflFvH0MqRKnnmemQ0+//7JyKrVwF9f+oBuz+v9EAJJjHJv
         rz5QfZU/9c06izysxFCnPnuW9nedYRh3EPI7055ErUm4GsKksF2eBOXcIZLpTnvhfzVD
         ZFXAvNnmNhOYiTR9TKekN2MVKAtOfkCxiD+2LdTNMPzDVOQa27c5/P1JbXB2u9RWekML
         5p0Bys26SF6zeTegi398pTRq18j8RUjjtsZ7A0jddZYEoJCaXoRaymW0quTL5ByddCAg
         2xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772490047; x=1773094847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AFiFXZXtC1y0sH5xj9p2pt2KSm8pmrA6Rl7Jb2isOw=;
        b=wtUynsvGcTm8HlNgJKrRkViOhwftJyN0x/zAnvC+8eh5wuZ/5/DhmF63ld3aLjUK3l
         fwISlfjQyr+ZBRaPF10ZSsR4qpCS5lPXXrvtef2plh4/KwjkSRh/e2hdexlxjoCobvWh
         gmjYFISQmxMG2tzjmqgHSZC3Ov3bicKMBgZ53ifzXnmkxe3zLW5fYCqqJ6anVfg/vvIN
         +3m5+SPjwSe0FIsBEPQMuBHDu7qNpLaAnT2OM+46uL2AaTfH9JVC8IcXe7u3cDjuQwF5
         xr80ujUKUnCbQg6EU3HVKR488AlZEkMo59u7tFPWjfEMaEC6peyK9U/pJTBAG39Lh7uZ
         bygA==
X-Forwarded-Encrypted: i=1; AJvYcCVbj3jgq5qWDqC9tVuLcososDMz1hWCtfrzzdIgZJuth2NrKDQgPtlwsZtfvlpwwBJ7/IdjVx5pFuj4NYTu1YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylUEzSp5y2wK3QR3HMRKisuM48G9l7Z6Vfnp7hlVd6ooXiA0Kh
	UWr1cePOorFm8GFufaJ+Of1x8e3ziyMiNenZ2dYqCvFKEi7mamb/ur/7wALlmz2hOxPx5WuZL8S
	H+lj9yJ9NT7MJ+5wkkNNgnnaZsgz6bBj7qz3rzw==
X-Received: from dybcr37.prod.google.com ([2002:a05:7300:aca5:b0:2ba:6ffb:dc6e])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:72d0:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2bde1b574e2mr5884765eec.13.1772490046646;
 Mon, 02 Mar 2026 14:20:46 -0800 (PST)
Date: Mon,  2 Mar 2026 22:20:43 +0000
In-Reply-To: <ebf0c9fd-9c45-4aa2-8cd7-fe8d5956ce52@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ebf0c9fd-9c45-4aa2-8cd7-fe8d5956ce52@t-8ch.de>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260302222043.2432413-1-jordanrichards@google.com>
Subject: Re: [PATCH v2 1/2] tools/nolibc: add ftruncate()
From: Jordan Richards <jordanrichards@google.com>
To: linux@weissschuh.net
Cc: dmatlack@google.com, jasonmiu@google.com, jordanrichards@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	rppt@kernel.org, shuah@kernel.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

> (please Cc nolibc maintainers on nolibc changes, I only saw this by
> chance)

Will do, sorry about that.

> off_t is now always 64bit on nolibc. On 32-bit architectures however
> __NR_ftruncate only takes a 32bit value, leading to the wrong kind of
> truncation. Use __NR_ftruncate64 instead where available.

Good call. On some archs (arm, mips, ppc) register pairs need to start
in an even register. I assume adding a flag like:

  #define ARCH_ALIGN_REGISTER_PAIR 1

in "nolibc/arch-xxx.h" is appropriate?

> Please also add a simple test to
> tools/testing/selftests/nolibc/nolibc-test.c

Will include in the next version.

Thanks for the review,
Jordan

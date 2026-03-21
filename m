Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486540DFC7;
	Sat, 21 Mar 2026 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774052662; cv=none; b=IluscUOb0eIFapsJXc6ewRcTQnYYWpNj83qcMMaqGxJ3ORvGj2ZXwJEEf+FLW5jiAZb1hzEcsiUKxeyj625hYs6DoYmAJxefJ8eETADjbWvgroX9rSuyABQ/WJSE6k7zwZa+T+eQanRS162TTUfwZBnEbmeiGjhpkpvmUqWHaeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774052662; c=relaxed/simple;
	bh=+ytOqRXt+LbBlJF9wqh9K/wdcZWmrgyt8sOs0F1yBd8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Mp1MB/9hiawFrhWFuoxtGoo0VnQ/EpJA/7nrkakBiD7bgL4CCEnhOKoHDzl9VRx3P0pJqtx4Y0j+BF6h/PYwKNEl/H/nbKNC/gUzJ7B6MqGvU1Sf5YFYBceZrn45S0JG+zjj16ICJsBjOjUcUiiB8PnjR0y2j0qlevzvWoFLTJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+ibVv9M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+ibVv9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177B1C4CEF7;
	Sat, 21 Mar 2026 00:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774052662;
	bh=+ytOqRXt+LbBlJF9wqh9K/wdcZWmrgyt8sOs0F1yBd8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r+ibVv9MRn8M/2/VPmilVKgMfwqRBUig6VNnI+HcUqUMCp68dfEinlw1gpekw3V/S
	 OfHrpvdBkIfPARc6HtCxxOUYcZxSN8aeDrLCARWbNgj6Kg+6doQzUUgQWMGGU4SQhJ
	 NeSW6Wu6P+w73J1kvIRS0+N7vG25Mutsk5HFTmaWqmUafR1J+4qYvep0wKyr2axiaU
	 zQetrXR666po/oWtJC1eSLx53aRunZjevMdjHf6yVYfTYmiaqZsRdyGk9unul4Tmlx
	 /HA07ZXKpQxE/qJ+WFARbsvekJy70rO3gZYVeEDHsoluDouUyH9dj5IMua59CYADJH
	 FHSplLrgBLzgw==
Date: Fri, 20 Mar 2026 18:24:17 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
In-Reply-To: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
Message-ID: <d79b23d2-f8e8-b92e-cad4-5cbdf7690f12@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-940750529-1774052661=:243157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-940750529-1774052661=:243157
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> EXPECT_EQ() expands to multiple lines, breaking up one-line if
> statements. This issue was not present in the patch on the mailing list
> but was instead introduced by the maintainer when attempting to fix up
> checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> even though checkpatch suggests them to be removed:
> 
> validate_v_ptrace.c:626:17: error: ‘else’ without a previous ‘if’

That's annoying.  Can't the macro body be wrapped in do { ... } while (0); 
instead, rather than adding these permanent checkpatch warnings?


- Paul
--8323329-940750529-1774052661=:243157--

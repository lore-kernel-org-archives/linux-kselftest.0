Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAFA3F411D;
	Wed, 13 May 2026 23:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713286; cv=none; b=sl5ZCBxJ9NUBNW0sijduO+m0ApSMi3GZkK1t/VcV3UfXCF0EbX1PjHmJQnrrWqgTKquYLCLTfPAqfQE6nd88Evbw3HWaS47Hb8Neif6KhfHQOe/8de9sk7+IcoyrEpLj/mlqB1/CMwMZZJxvf8egOsIzplZp8e+0NYiTREEqvXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713286; c=relaxed/simple;
	bh=11u+GMiB7NpvoAsHw52zWd5zJPglYXFSlspfoZSudaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hY3JErwKGyr4ygQaynheqFN202a2WGQMVvdkrnx7LDm6KbND0gazQ3QMN9oy0bjTyVb3tTsuF0kfDIING4uSbrlgXuuuaQwmCUDHrcVaOm1VhUAurYp62wJ+2YDO3hVaFU9a+O/ze8ghjfCLTu4qO21TLB7whYCGGjHZgxdtw/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggtWO78v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggtWO78v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0A1C19425;
	Wed, 13 May 2026 23:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713286;
	bh=11u+GMiB7NpvoAsHw52zWd5zJPglYXFSlspfoZSudaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ggtWO78vIy56LeccuBY8CQq7FHGfJ7Y+WiajO04PG9tx633Uv9kQU11uWr4sDzmlb
	 oTaSzWviE6eUc0I+qv5PQENZhPmNo4TwW5djUvkK4eW7PiL2HuhTfLMWBQ/fDgNcsf
	 gqI1jd7qrSRrhv50JLGBFkw7v8BSt1Dr18drsBwrEKlqfgxzhLi0LWy+UZhYqo2ETn
	 875pIYfjIUpYmMGFHV9+3525oL0t+iE+vmSx0pHHuBEaViPzV8H22JPLhgTS2qbxOO
	 Xhgrnx/VcNSM7yyMzmmI2eTaA+s47cW3wV3Fr1GeL00Yml3FOzvL2rGJUnu5D9c5iA
	 EoTEGw48URKeA==
Date: Wed, 13 May 2026 17:01:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zong Li <zong.li@sifive.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    shuah@kernel.org, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/riscv: fix compiler output flag spacing in
 all Makefiles
In-Reply-To: <20260511032917.3542802-1-zong.li@sifive.com>
Message-ID: <a407bc11-efcc-2254-01ca-607c3c62feed@kernel.org>
References: <20260511032917.3542802-1-zong.li@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 10 May 2026, Zong Li wrote:

> Standardize the compiler output flag format across all RISC-V
> selftests by adding a space between '-o' and '$@'.
> 
> Although '-o$@' is perfectly valid for GCC/Clang to parse, But
> changing it to '-o $@' with a space could align with the GNU
> official documentation conventions, improves readability by
> visually separating the flag from the target variable, and
> ensures consistency with other architectures
> 
> Currently, RISC-V selftests use '-o$@' (without space) in 13
> instances across 6 Makefiles, while all other architectures
> consistently use '-o $@' (with space). This inconsistency makes
> RISC-V an outlier in the kernel's selftest infrastructure.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks, queued for v7.2.


- Paul

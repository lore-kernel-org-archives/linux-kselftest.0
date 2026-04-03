Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C523BE145;
	Fri,  3 Apr 2026 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775230948; cv=none; b=eGpo64+sH1Sb9Ho9moUNTjUln511fC5zDNMdDx4sWtsoM5nakuSXaGHHBt+z6Pn09kXklW47tZUbgrRcx81PeZiWsGvETWCX7zH9dLEoJeba59Ot/u6fa/c0stsmou/7jJwpvA5bH4Y+dEiSzxnct8juupwpH3lPyRCe1HM1d1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775230948; c=relaxed/simple;
	bh=RabZu3zWB2SMxEHwWU0gm2y+3fn0+UBVPpLY7nLHYXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YWik4PjP7nuAXEkN808uX18YXGigZm6Vat+6d3CT1tnweDJyPpm6oDTfog+sDNx8LJ4Gn0EbqlfveaLJa0A2ynhHrWQ8u0HOHjeRHu1OB09Ce7jXa0BdF5hcDvczjfDkUbs2XwqgDslPXs0PrfHJ5KgyYfQK+jIhtzQgx3auLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckH8ce7Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckH8ce7Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4A3C4CEF7;
	Fri,  3 Apr 2026 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775230947;
	bh=RabZu3zWB2SMxEHwWU0gm2y+3fn0+UBVPpLY7nLHYXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckH8ce7YbPaV2ILPMNjSjIQ4hiRGdbHLO6YByH/FSLcsO7Mqei83oGYmmc7Wp7NJa
	 DRuS0qm46sxHjnBZP7iVYRB3Gw/+K+HF4vt2WoCZaqEA2J5OuZLR52zFWCgR4i64QN
	 sPiH4LJgGYwfQ9/02nyCBIV8MCS2m0rCO02//zLpq2uPoRPrcHvOzZNdtvo7+dNr7V
	 j3xywXghh6OK6vCzxDx4Y5+3Dcs/uaHBc/fOqtrNAbnPLSbeO9GZDmkB416Fjy4Whs
	 v+7hRSpnbdj4BWsmgV42+uFC2zcpyIO5kN3P9bHW62cgLTkXxX2vmMbI+ZOVLXDhjr
	 wwqpAR0T/V98g==
From: Kees Cook <kees@kernel.org>
To: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] selftests/seccomp: Add hard-coded __NR_uprobe for x86_64
Date: Fri,  3 Apr 2026 08:42:26 -0700
Message-Id: <177523094576.3168977.11732506529595475211.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ac_BAMSggw-_ABPE@redhat.com>
References: <ac_BAMSggw-_ABPE@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 03 Apr 2026 15:30:40 +0200, Oleg Nesterov wrote:
> This complements the commit 18f7686a1ce6 ("selftests/seccomp:
> Add hard-coded __NR_uretprobe for x86_64").
> 
> 

Applied to for-next/seccomp, thanks!

[1/1] selftests/seccomp: Add hard-coded __NR_uprobe for x86_64
      https://git.kernel.org/kees/c/41fa04327384

Take care,

-- 
Kees Cook


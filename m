Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804782;
	b=VX6/g5bRRVBqdSo9bmW6BjjKxwGsHvLhD/FPkJZqnEneTgeiQb4YL1TLcvGMrsdFWUXf
	 n/CTzu/BjfwacuYLrrucOQYNTGJJy9Twr1EL8hhEfReSGblQn7IsPKxhz15zi6S5QbRBv
	 t4ICpREXw7HFj9MFLotb18kwuMRmGcSAakQ5Ot9An20FpI445cEem1rCZskTTJtly9imO
	 PCDJlaXjNM5fICXQ5hS/bcZYajFNmN3frrnoki51yvw/p4BwzCpAfdEDv2QO7fXNpq7wy
	 v2fLkIaA6B4i8tALeE0O6ZApIciAXj9NoX94odyvw7334eNchYoznoQFj0ievM7igCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804782;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=enwqfl+4wuR8Y9y1nhqYyOCu6F3YAaMqLXfuufw2+xA=;
	b=BpS7UH+tiU4e/j3Un2i+f03tA+tLGzgGdL2UxJqQs3YWsyHIPRPYsPqYxLCXIj9/3JRG
	 LG34JjOPGNWkRARJ4t4OExv6hYpgNrbIDKeuZUxvONa/8gsgfuIcfDHLQTkrJEQBUaPm0
	 M91fIgfd0LEcVahqNhoMQfj7hGc15X3nazWW+1Cy6c09ozR/TLM3uBUMxPnL1/WY2Hii5
	 1wRmwE6CLGkv/lceJdQMPuOz50tX10/wIVNcZ+s1jZVAOjFyW6iPeVI1u5dcV6jKTZ5m1
	 fAn+dPLecTnddjxZEdLQM/UIrFqevogqzuxEa43CE4eosiJGde7UgcDjcJMUu+PmDJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqZwLFpW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494A3606A33E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HqZwLFpW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3853F1F0089B;
	Fri, 27 Nov 2026 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804781;
	bh=enwqfl+4wuR8Y9y1nhqYyOCu6F3YAaMqLXfuufw2+xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HqZwLFpWeO26pfdnY5/zZYRdP1dl9tCgeeqG8/OagVRyDzZ/oLLoyKv4BRqD17R5u
	 B7yTjiLOgpUhmMAfX0CtCD66C1m7PfnEOuoLG4+hjI95a7in6bAkkfsiJ/NyZFMZyi
	 GasFAczc0+AsKlDBt0KkuuAyOR90Qsda/GKtLIg9mCi58O990CJ2o+PS9yY1XeANuy
	 YVC2mcd3MCfpl7KfB/EkjsLayWpc80wJ5yIjkCWid6sNkW9a78HpbRZ9exqtHC/PTx
	 XJ0hi8tyK21RTL1fKGbiZN/O55jJJBmUUbEJ6DQ4Yr4yj2TnyGUt3hNBNOA+LaJvxZ
	 DWM8io67sR40Q==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Dmitry Antipov <dmantipov@yandex.ru>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest: arm64: fix README typo
Date: Fri, 27 Nov 2026 18:39:13 +0000
Message-ID: <179579974710.1442780.5884936987110829758.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020085316.1880320-1-dmantipov@yandex.ru>
References: <20261020085316.1880320-1-dmantipov@yandex.ru>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 11:53:16 +0300, Dmitry Antipov wrote:
> Fix trivial KFST -> KSFT typo.
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest: arm64: fix README typo
      https://git.kernel.org/arm64/c/efded46f0a94

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

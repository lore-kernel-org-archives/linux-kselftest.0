Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790836;
	b=aoYJklVCIj5uodDd1/HE8gt56kY1BXjmrCCuKEg1MDHY7yI3CPrC+8Nn4+9tyUYyk5cd
	 yHM3990GfSo9XUx1EnCMyORG5TBJ41Z7GKxaGeNJEvpDPErjgZq2OU9Y5dEIaFasoSHmk
	 GN7+skgvtRhA2gtIrqCLumIGyrest0EP23S5Ec4Uehz7s45dNeAJ9aG8BF2RF2yt1Ofmg
	 4xDqOrh06zvv9VTWKw+EWaELXK50NSPehB4ahLW2ehC1ZxVw+6FK3NW3yvNeFryAytwAK
	 GabXA/QthvajQrMZypxfG3aCoXX0KERjMO6spWyG6wXwQtSS9lbmY+sVfVA1vm5wCYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790836;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Debian-User;
	bh=Z2fd3yCWE5NjRrJ3E/mTxNth4sTO8qe4Sm8InOrVucA=;
	b=rYNsT8MyShzquKatWxs+hm8TFUTNBhulKwia6IzZyBjEyhkhx9m/sLyv14QfP1Q4l2+H
	 U2AK35N9KZHe/CoydJK3Ul2aC2zGFi/Pc6X6pLpkQEzwswEAEXDWjTGzZVxQDgAWHKyQj
	 dImujdO2DAYtdSPemvweCKV38ZdfgIYlqvc22W/fLeyZ5osjFEAAJtmUevAbVGFGGEuzQ
	 coW4PP0APUKBzEZn5n/xfF4336m27s3YV8z3YHYi5SXXrOYhpOxtibMPugcTi7TYdcrYC
	 z9Ca8mAycirrFVZ84VnN0+dfZaF/GWYIvFqgRAht18lbtzhL4J78C947bxYcOIr/9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=biGoTRgz;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8F606A32D;
	Wed,  4 Nov 2026 11:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF8F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=biGoTRgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=Z2fd3yCWE5NjRrJ3E/mTxNth4sTO8qe4Sm8InOrVucA=; b=biGoTRgzDFBZ/7GCDmHn+BY1uC
	Lf7k9t6F3FZAEhe6vMblDVFQZu58lJh7i9HAhHQW3rvzxzFVwu5MRV1ZA2oNjs7Efc5/akA6fKf39
	FgpoNtScc+KNW+iDhyYugbA0xAavnL/gBixL6raH0T/nhhBOlTjVDNPr9HBqEoUhJFNlM5mB0KaeN
	T+avEkyxMmgz2DmmxQ7n/luGhbvA/T3YjL1mwcoE8/7BeL+Afnxk6VKpETPKYvJH58QzYoKjy2JyO
	pyPJYIK7kWx1y0ExqXZGkIoZ8MFUi2oJHYFlrMslheWwH99gUBMw7/B5ICXF3BFqlb02rcPGvN+Qi
	SDfgHPuA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOYw8-007fdO-0i;
	Wed, 04 Nov 2026 11:13:48 +0000
From: Breno Leitao <leitao@debian.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/configfs: fix the build on 32-bit architectures
Date: Wed,  4 Nov 2026 03:13:32 -0800
Message-ID: <179379077532.375408.2958124518264084361.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103141627.30838-1-sashal@kernel.org>
References: <20261103141627.30838-1-sashal@kernel.org>
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
X-Debian-User: leitao


On Tue, 03 Nov 2026 09:16:27 -0500, Sasha Levin wrote:
> The fixture setup checks the result of mkdtemp() with ASSERT_NE(), which
> hands the pointer to the harness. The harness casts both operands to
> intmax_t to print them, and on 32-bit architectures gcc warns about the
> cast from a pointer to an integer of a different size. The configfs
> test builds with -Werror, so it fails to build there:
> 
>   kselftest_harness.h:797:49: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> 
> [...]

Applied, thanks!

[1/1] selftests/configfs: fix the build on 32-bit architectures
      https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git/commit/?id=57d94d26ed42

Best regards,
-- 
Breno Leitao <leitao@debian.org>

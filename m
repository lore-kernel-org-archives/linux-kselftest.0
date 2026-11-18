Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990959;
	b=gqZe1yKaJUEh1iXR8IrkJ6SgCv/n3k2EZvhnhixn+6d8p8plLrUQU+M4LI8vVvkywu7M
	 dZWcOuSR1t2yIAaVCmR2ymqJ66SwBEFFUwQvnzTWC+EmjwgheBGMiaBrBGEBJHGe5dmZa
	 WO4Vj1mv8P7rufK7o6bY1NR7A2SloiAy8I9gU2wdU2jg6gX6PpB+NIkm/rdzRa1iHlCVy
	 2XJb9Qph+QHuD5Y3EeB36vWySAKRNTjQCl6YtuF2FV2tSJCgclJZ85LFPvJHbISTYv0vm
	 88WM1xfO3EXSQz3Q3U/YboKknH/v5Y2hWPQWIUSWE7hquP0s8FBn256PT6ISLRm0J3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990959;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WiV8RQeTQLi8FT+Ybjz88me8tn/Q/C7tZZgy0clkafc=;
	b=By+AH8Gw+mfUNhdoHdz0yPWLdNwwXKTFn57ijg+Cy9Tm77SAuz87/BNQpFshnOy9HnyZ
	 Cs3QY56BUA29NWuuJK2QKCxbkU6z3zWuvu+kcDZEH4jbOe75P1tJsv0FoLHRucs5ecHPE
	 AS99HDseInjgDgRoUwSbGxrsu6b0R5WNe3j1SC33NUXdb77NjvzPTENrH4c+AZPIQew60
	 JXhuJ6dnbram3BO7NZQqchRniHyVpkYY4CGO/DH36ib+GYZSMEuQrMVxeH5wRTJVwQeTC
	 aM7a3ZySq5q0IXtZKnlEgrzGkEF6A7MMPJo9N6aeVapWNuxqjvOv5cDZIjZUT33Fj6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EfSU+eb0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id BB971606A31C;
	Wed, 18 Nov 2026 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EfSU+eb0
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 726DF1F000C5;
	Wed, 18 Nov 2026 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990959;
	bh=WiV8RQeTQLi8FT+Ybjz88me8tn/Q/C7tZZgy0clkafc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EfSU+eb0j6T/P1B9G+m+icNWYbktJFPhzQhgOFdeUphGKD8HsEuROAA9bikz/gn0W
	 k+UZO1OFHKkt9jV3G0Lc1CSMwBZQZBeOhO4yWI6m7qE2Nt7f0B3PPQDe/RacFYNKkg
	 NWvPOx3s7rgo/WmatQSKTPg9XsKNv6wcZhjA6Rj2JQLy8UJ8K4OeFlmPRwg6cWt0jx
	 0G4sxMAuBLtu8ysp12eqBmdEPZPzF9S9pZj5rH/40rAXZdnC7snVFZCOLGQRvj6PRC
	 aSivDGi4jhB+1NOtvIjnr/gS4AzN02O7jvpOttWy2R+u8RrELJ1RzakAQfrCHpq75G
	 1HeKKUDCcvLYw==
Date: Wed, 18 Nov 2026 09:35:51 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: brendan.higgins@linux.dev, david@davidgow.net, raemoar63@gmail.com, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	13667453960@163.com
Subject: Re: [PATCH] kunit: remove unused free_string_stream() declaration
Message-ID: <lejggfdxkn47y4gdxtnezuzx6kka2bsq7cyioj3ql2wiasfaxa@a4ao4ghyayr5>
References: <20261118010945.46404-1-yijiangshan@kylinos.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118010945.46404-1-yijiangshan@kylinos.cn>

On Wed, Nov 18, 2026 at 09:09:45AM +0800, Jiangshan Yi wrote:
> free_string_stream() has never been implemented or called since its
> declaration was added; the free counterpart of alloc_string_stream()
> is string_stream_destroy(). Remove the dead declaration.
> 
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

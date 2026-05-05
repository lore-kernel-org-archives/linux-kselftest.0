Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3474D40DFA7;
	Tue,  5 May 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973693; cv=none; b=Cx21wpr1R3G9Y0zjss0D6Zrb60TNL2RnVGf2TvQjog8ILJyEftmm8jny7mMobzQErNpg65gFlvPFc/8M+RKHmZkZLJgPecakfD6b0ikSsqOLR6XQHrwdYsgNHP/xI+514mOytBSL5BaxzIO6wngWFMl2i5+038HkDRlZkHf7Ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973693; c=relaxed/simple;
	bh=n/qxDvkG2vkc1gOFrFlJwX1Zjz72itXV5m0YGqL9gLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTjbO4q2VluULJxGoK+nnp7FyJV9PDG7WghPe30OSJKKkYN8jfsa+v4ZszuzPjt61+Sj3SQpxhP8aG/QWNsImeDf50WRb1eMtlM5+5MXwvlJedLXzUpjp46Am4nIISD81hlY9UWLNM0jIeueqMSvEdmZ1lcOP9SlR4izHkKAgLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzlZ+xBK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzlZ+xBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BD9C2BCB4;
	Tue,  5 May 2026 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973693;
	bh=n/qxDvkG2vkc1gOFrFlJwX1Zjz72itXV5m0YGqL9gLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzlZ+xBKVsfK6+TmSv91sVWuiQN2p+bpjK9NjglCAbuEMjvFEBlYSF+f3EV8Ta3mm
	 7SzrhhBOBfHT7WQl0JIEquZ62cLOzQz+aSf6ScymudKlZoQzlPiNBO0+3INDDoDiBG
	 V+8Ha3PjDc0KPQ02c1fpuO7lxoD16jlgychTMm1Vsh8Hr+vuCO0BMOS5LBwRTfPc4x
	 2bAKEvM03QaKAeSmPfiNc4+g46jFsvINbLoNF7GkaXqfV22dNNEajPF7VeUj/BB8Ya
	 gNe4SHhyAgEsKm5oBO3sRpJiEZ5dXWZ3dJAe18k2ltkxtPvESliRjsNaV8w2+Qb90+
	 rRmQRFTBx52ow==
Date: Tue, 5 May 2026 10:34:44 +0100
From: Simon Horman <horms@kernel.org>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Wen Gu <guwen@linux.alibaba.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	David Woodhouse <dwmw@amazon.com>,
	Yonatan Sarna <ysarna@amazon.com>,
	Zorik Machulsky <zorik@amazon.com>,
	Alexander Matushevsky <matua@amazon.com>,
	Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>,
	Anthony Liguori <aliguori@amazon.com>,
	Nafea Bshara <nafea@amazon.com>,
	Evgeny Schmeilin <evgenys@amazon.com>,
	Netanel Belgazal <netanel@amazon.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Benjamin Herrenschmidt <benh@amazon.com>,
	Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>,
	Evgeny Ostrovsky <evostrov@amazon.com>,
	Ofir Tabachnik <ofirt@amazon.com>,
	Amit Bernstein <amitbern@amazon.com>,
	linux-kselftest@vger.kernel.org, shuah@kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v2 net-next 0/8] ptp: Add PHC timestamp quality attributes
Message-ID: <20260505093444.GQ15617@horms.kernel.org>
References: <20260430032507.11586-1-akiyano@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430032507.11586-1-akiyano@amazon.com>

On Thu, Apr 30, 2026 at 03:24:57AM +0000, Arthur Kiyanovski wrote:
> This series adds quality attributes to PTP Hardware Clock (PHC)
> timestamps, allowing userspace to obtain error bound, clock status,
> timescale, and raw counter values alongside timestamps in a single
> call.

Hi Arthur,

There is an extensive AI generated review of this patchset available
on sashiko.dev. I would appreciate it if you could look over that as
it does seem to me that many of the issues raised are relevant
to the progress of this patchset.

...

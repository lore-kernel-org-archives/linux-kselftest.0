Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A430E0F5;
	Tue,  5 May 2026 01:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944515; cv=none; b=lYgUWByD9fpaSUWmNGUJhIVPB6LpwqflRvsH698Jhd/dIe1GjyTFiUoe6fYqdXuQ8J9cWUkk7s8ZKdijuSHpezSCXvoY+4q+L2qsQUGtnYECigYLK2oHE1CZgHWSOkUqimOsPj0/qqxg2IYhEiLRBU+NWVpzvrTcdCIpmQhBL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944515; c=relaxed/simple;
	bh=89YF7EKjGJsQMjC/2yaJzFSea+JRgi0l4JGOryvAaMM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wv+WVpfPXP/zsqMQrgUipjIY0b1Bnl1fmshqYZbgtDA+YHgdRipAKDND/4F3KGVV2OP8Hqa4DwbV2BdN9SjDpEU5R4XEzpOguJbiyi4NLU+ygtT7idbH1Iru4pcXhxls1eF2BQwAR0gd6w+nYp02UJ4rIZT2YGdt1PPRaQtht9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFa6mfaV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFa6mfaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E4BC2BCB8;
	Tue,  5 May 2026 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777944514;
	bh=89YF7EKjGJsQMjC/2yaJzFSea+JRgi0l4JGOryvAaMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tFa6mfaV81wu1J9RlCZ7qTyGoDDYilHBvaXDQNr3CcWBiCK0jdgqc/S2Wu8BBzWcu
	 tP0KWOiJ4zYEcNIJx7Xf8sU9XLjcmwEm02VQsvxOZq2YdlUL2OmEL+KozKKASlsls8
	 mly1xE3MNZTLC/JW8cejNbtTpBbuSG/HEqfJXl0QhD8MUAn/lmhzdFTvxXScmjVz5F
	 PJRgf7YMt1Gn5SY/I0dPWLXFIXNGzX6krzd7L1qZufJ7zA/1HIEE8RFiHVowHESe8Q
	 Lrw1rdV64rEC1q1onGJmdkybRMK+sn5DP3rOLa6JtYm1WcKxPplvXK1WsFLIh8NRCF
	 nudCA+tz+EQRg==
Date: Mon, 4 May 2026 18:28:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan
 <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Justin Iurman <justin.iurman@gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433)
 behaviors
Message-ID: <20260504182833.344d7b33@kernel.org>
In-Reply-To: <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
	<20260504163915.4a8b028e@kernel.org>
	<CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 5 May 2026 10:22:58 +0900 Yuya Kusakabe wrote:
> Just to confirm the workflow you'd prefer: should I repost the
> current series immediately as [PATCH RFC net-next v3 ...], or wait
> for technical review on v2 to land and fold it into a v3 RFC?

Let's wait for reviews (adding Justin to CC as well FWIW)

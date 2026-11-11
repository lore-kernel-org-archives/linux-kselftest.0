Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360143;
	b=OWn2ZprMjTBN1gsASaHPS2rcb95mdRWr0ZqpaaJ0McQ438n8BxiVDLsjByEKZ2XQ71em
	 kkdqMK97yPAiBkseIo4L3QmjndgowByG07mU33K3T+h+P+VjOR7Z5I4jF/zEGiZHsQht2
	 lBUv4bxyIZE2Gmyvx6/FtRkM5zff5ofoDJtwg7js5O2cOzoV/1SPP87/LwiNwh/lNV9AO
	 UhgQ3k+xwIX4WvnOvXI7Hn8CIr+kbY4fQU0dTaJ15VPNoHVwxQl9Jd8Bjpx35xEyJBGQK
	 s14It0FMPTDXrMUGEdBkdCyKvP4JBfrOYRzDQKm6cssNO6da6P+BwTq55jflNh57h5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360143;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lo1Y/eriwUwwDPw3+rls7wGgAmgpKPYbEeueCJk2UMM=;
	b=H6YEULzuK5yTmpSiOkSaPs6+hCWdVKu3r9QlI+F4ZcoVl1X3K85+MCfgCC3j2vNcmpZC
	 CG3/sua1GPiffzWlkUsfJLMW+3HfIDmk4oew2ymG7rVFQhkhVDtXuSghZyYEVQTzvk7qA
	 c6yJnccWAVybzwr4jRuiiuTP215Sv3BiKYipEEJCfsLgbOtrBg9/x5QwoMfJ6YWVapw9K
	 VG6xSGxmsimxYY8G/Txgg2wURNh/GoYVyIJqzSHYJ/PcWQfQT7PqDHFfxMDBJj/dzahUN
	 8Hky6rLEMBy7DdRyaR0e9xuQf82dxzZnpvhZtHzz+G8P9NDtyYBLA844Lkda3ib3ZUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2WXy0Qj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802A606A31C;
	Wed, 11 Nov 2026 01:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i2WXy0Qj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AE41F0089F;
	Wed, 11 Nov 2026 01:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794360142;
	bh=lo1Y/eriwUwwDPw3+rls7wGgAmgpKPYbEeueCJk2UMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i2WXy0QjIFqDhXOeusz99tfCJYusJr0oz1ArY+C51SKg+X75cmiHI7N+IXrP8QBet
	 cqsWbVsmTJY8h6RV7tOfVKR5xV1/SnO6AekYukegNQlkcpHisfQYeZRo2/kNhI9UsB
	 poEy/XvRb452HUAN+z2ZQfXFjEPIhl4fBEUPU3QT18634ay/ufylHLEnbo9Vq7ZkLl
	 j9ZvytWMyvZw8O7GBf1sH12BY9UV/nFHIC/1P1nZ5Hq0+O8zoPBMSD91tSSe9c2yfW
	 xXHyZND6Z5OBrfmavz7xHdsQF6mjOMy4f+9SKbHRiUontVUsHYD+Cp9/h4Q2k5KlNU
	 07j6PMDxoc3aw==
Date: Tue, 10 Nov 2026 17:22:21 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Bilal =?UTF-8?B?WWF6xLFjxLFvxJ9sdQ==?= <ahmetbilalyazicioglu@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Mohsin Bashir
 <hmohsin@meta.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] selftests: drv-net: ring_reconfig: handle
 devices without channel config
Message-ID: <20261110172221.49db2576@kernel.org>
In-Reply-To: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
References: <20261110161423.77910-1-ahmetbilalyazicioglu@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Nov 2026 19:14:21 +0300 Bilal Yaz=C4=B1c=C4=B1o=C4=9Flu wrote:
> ring_reconfig.py assumes that a device which supports ring parameters
> also supports changing its channels. Drivers without a get_channels op,
> such as e1000e, return -EOPNOTSUPP for the channel query, and drivers
> with get_channels but no set_channels, such as vmxnet3 and r8169,
> return it for every channel change. The resulting NlError makes the
> tests fail instead of skipping them.

The test is fine, please don't waste our time.

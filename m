Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D627280A;
	Thu,  8 Oct 2026 02:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425314; cv=none; b=b0NEsEgIHddSprJ/OeZEaBE4Y4weN5ySgZgWuHVshHuoToHXDgtS32WUPY4r29EwOnxt+wDcimBsKfZcMDLjaJgEHJfMhz/At+UBLimegvw0WFvyb1qoH+lhMZmj3toDlvjc3dq8ZjWHYcxUbJm0vQ/JIy0v+YagaUPM30BX0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425314; c=relaxed/simple;
	bh=0MTXQdowrouSe1XkbYCxSyTZX0x32qtPfYRfHf4hu3o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1+bfHAU+ZsXH2SZwVp8bhObqMgncvMsfHUi29DOyvIPlpORfkhQefUQ+CDrwAayF/tDp0HeO/V/vWKYDMK0PNfg8shBA1zTowYhc34yN+jRZiKE2i1QOGSQT/nalfyFtQkFtvg7DTkzH6mrlCHf7NufRlyjWmGgH9ukQiOUUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHfw7VQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHfw7VQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC29E1F000FF;
	Thu,  8 Oct 2026 02:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791425313;
	bh=4+zuUDMG6VOBF1vAcG/3DXB+gTNoW6ZRVbOZtqlPJYY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eHfw7VQSAaUacoOVx3TC5FsChiTAxZYafhwGJRy3tCmGM+A7TlbLTpX+Tt/cl1hl6
	 IY1LGvlQtaAnbcb1Y6Ww6iai5IO/zSnoK7YbBjfZpu7Vum2QVol+nJldRi7+YbnkGG
	 wQIP1iQ9YjoQd2yVdPHAoF8BYWUh+5z5BuYo2zecNSkfv3ihgs5ylWSJuqyrNVr0LJ
	 EPTANwGT+78xE+WXzZ5pB9DWRqecQsH9fO+XEZyPPG0gD9AkmE8SUvrAxbwut/pU0Z
	 9pEbJs6zPkHSk6uTMfV7zXg+o11vHZsVyIJvnxkoBICZN6lzgogYpDFA6QXS502uZn
	 l+M3CHuH1OeKA==
Date: Wed, 7 Oct 2026 19:08:32 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Omar Ramadan <omar@blockcast.net>
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/2] selftests: net: add an amt test for
 UDP_SEGMENT through the relay
Message-ID: <20261007190832.51d8e16a@kernel.org>
In-Reply-To: <20261004161200.27196-3-omar@blockcast.net>
References: <20261004161200.27196-1-omar@blockcast.net>
	<20261004161200.27196-3-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  4 Oct 2026 19:12:00 +0300 Omar Ramadan wrote:
>  tools/testing/selftests/net/.gitignore |   1 +
>  tools/testing/selftests/net/Makefile   |   2 +
>  tools/testing/selftests/net/amt_gso.c  | 462 +++++++++++++++++++++++++
>  tools/testing/selftests/net/amt_gso.sh | 282 +++++++++++++++
>  tools/testing/selftests/net/config     |   1 +

This looks overdone, pass.

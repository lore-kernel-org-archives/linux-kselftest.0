Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769F31AAA8;
	Fri,  6 Mar 2026 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767330; cv=none; b=iLNyyaVq2749dJm0XQx/SmFPjOq9xx8ulZWe44pVYqIY71FMWOkUtiV05E59rUmY+oFnKuR5nuCnOY2ZOe5vUSqBdKMYISuPspJLHXOnW3/uHxLInqiiqjBld7b2AS4RNmTeHX40Nb2P7W3zpt3twaCDMB1xglcjojO1cZ0MrpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767330; c=relaxed/simple;
	bh=4csOvE5cu/Ecp0YXFWVdxpLyFvLyMtENwzlRG6zUO44=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L/pQWg9+YJIUqHjwAcTgaMUvibZ4ND+dq+wKicffM83Pz6r7l3jesSEq67wk9rfe+y8bH7YzDPemUY3+v2dD8vlBHMd+YuQ20W7PHYVRxhnB6wQao7nluLq8Ch+DSUlXjW+CL4+Aw9bJfNzxMxt+U1E3jW4uzgbCTuX1UcfpDdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYWejkpZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYWejkpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C84C116C6;
	Fri,  6 Mar 2026 03:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772767329;
	bh=4csOvE5cu/Ecp0YXFWVdxpLyFvLyMtENwzlRG6zUO44=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iYWejkpZhKLYItYF8mElEISUOt4b8IdhvmkeVc3okqGtO2QnLaFDTAO8/3GrixjH2
	 4DII/So0Bw5ZN8+gjkv1G3LZi2PAMaXo623jt1kiWYETzdQcJtTddH0jEhiaUKnltp
	 7nL44nd+BF6VtFJ5elx7NuwmHicNSzjE5huP3+m2HwCwbDvb8kpIPZGcZGKSUyXTC8
	 3h5MqV7beJJHTvp91iwybjy2Og9zuKlzjVwb8XUiw2whF4NYsL8I2SHsYBfjlIfwx5
	 Nl9yN+kuVqdcbQl+EBDp2B52GeDpJAoDZ9OY9IE5gb8gAITa94Ev53XwLuiaOQP0b+
	 BTjg4QObBAVnw==
Date: Thu, 5 Mar 2026 19:22:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>, Sabrina Dubroca
 <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, horms@kernel.org
Subject: Re: [PATCH net-next 8/9] selftests: ovpn: add test for the FW mark
 feature
Message-ID: <20260305192208.0a963165@kernel.org>
In-Reply-To: <20260304230643.1014-9-antonio@openvpn.net>
References: <20260304230643.1014-1-antonio@openvpn.net>
	<20260304230643.1014-9-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Mar 2026 00:06:26 +0100 Antonio Quartulli wrote:
> Add a selftest to verify that the FW mark socket option is correctly
> supported and its value propagated by ovpn.
> 
> The test adds and removes nftables DROP rules based on the mark value,
> and checks that the rule counter aligns with the number of lost ping
> packets.

This test does not work for us:

TAP version 13
1..1
# overriding timeout to 240
# selftests: net/ovpn: test-mark.sh
# Creating interface tun0 with mode 1
# Creating interface tun1 with mode 0
# Creating interface tun2 with mode 0
# Creating interface tun3 with mode 0
# cannot open file: any
# Cannot execute command: Operation not permitted (-1)
not ok 1 selftests: net/ovpn: test-mark.sh # exit=255

kernel config file: 
https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-extra-dbg/results/545921/config

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033629;
	b=z2rj7g1cwaP0k5mVFSAs3DDMZKlnjuzLwnCbZ5KB+SM4xkFngcFOAMoXDU+p5/vxGq5Z
	 t3M1AI4UI9HOr/+VsuTDRnzNTIW+cEE4UEEsRx7TOilwBL/Ljdlj+4rdi3IAyEeQsnbTZ
	 tpSJQyQQ1KPf9wAg9JSug3G0Y9O9iT9dtYknHN1H+zuaEVRjROtpJxAuhipHXcgtSENUX
	 4zgFgcd+n3LPXGmnvp9dCSduvANitEapSPiz/GprTtwOY2OenMpCLVOzTj8TFmo6/rZ2t
	 g798cXzBOScCXE1Fuuc0GpnH94n8GKPjc5WhmpKC/7/KfLBTAZ0bUFk+7OXabmRHVCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033629;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eJgiamc/PB4nOvEdna/9ww9zH5/FmpDd5GGoCZJYw5Q=;
	b=I0SlD4BUuWmQNWWkxg4EgEPHw3AHZWODBexe6hbiVhLErnYUJn3SWmq1Tyk+OIHysE0G
	 ydDsdbtjtwH6ZEBfJW1o+xwOyfxIkTPj9jtByKZtV/JbqFfIUNxCbfUBK5gRV4NGb5pnL
	 0MYjLJaShtL/SuUOoFK5CM2MOIP7O7LoFiIwJcYTe/oH4A8auz/cBoFcsxLrhjIGOe037
	 elXv8ymuAE2vTnIyA8GLfhCiDs0pkamnDIrIDGnhe2KLcqMtfT4PNZoU6yEG/Kr9TcaUS
	 olqsWkbQ1Dv3Y3BTtQow2wHs7SroAPQ7WKPazPwple5ZEEW7pJn2kfZoHtDv8rnOOWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTyS1YJZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ABE606A31A;
	Mon, 26 Oct 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nTyS1YJZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5801F01825;
	Mon, 26 Oct 2026 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793033628;
	bh=eJgiamc/PB4nOvEdna/9ww9zH5/FmpDd5GGoCZJYw5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nTyS1YJZC8tPsfzJpHnlpmsGNvVNwxPNKLO6gAgKCM5ekDsnWCEfA1MzqSZqh4s05
	 d97xAoKKkF4+a5yyR0BcgofogrjFOUUhkgG8k6gsfiiLfAGkeHLKJ7e0VksqU9lPBH
	 toGwsXbM3ue2zDHRwbO8pKi3dGC7N5G/O1IpnetfQ6mE/S7vzZMDewfvobsLCpku63
	 n1BLkyRBhGGkhfbNQ4CYIixFnN+c2NUP1Et3SyKSmxNOKikq+b0abh0QDGPClVNtmp
	 oKNnZJ8d9h0L3YqGWFBBPeSv9k1a2FQjMM2ifzy2SUycuP/9dlvgu9H46A4eqgyxbS
	 54caNohlAxNvg==
Date: Mon, 26 Oct 2026 16:53:44 +0000
From: Simon Horman <horms@kernel.org>
To: Alexandre Cassen <acassen@corp.free.fr>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ido Schimmel <idosch@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: tc-testing: test offload flags of
 reused matchall actions
Message-ID: <20261026165344.GE257209@horms.kernel.org>
References: <20261021193222.1318333-1-acassen@corp.free.fr>
 <20261021193222.1318333-3-acassen@corp.free.fr>
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
In-Reply-To: <20261021193222.1318333-3-acassen@corp.free.fr>

On Wed, Oct 21, 2026 at 09:32:19PM +0200, Alexandre Cassen wrote:
> Check that a skip_hw filter leaves the flags of an action it reuses
> unchanged, even when the filter add fails on a later action. Also check
> that a filter without skip_hw still cannot reuse a skip_hw action. The
> dummy device has no tc offload, so skip_hw stands in for skip_sw.
> 
> Signed-off-by: Alexandre Cassen <acassen@corp.free.fr>

Reviewed-by: Simon Horman <horms@kernel.org>


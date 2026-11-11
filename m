Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362328;
	b=iw/tCIMxQh16WIo6oPoC2rmrPc66g6zu/QDuhxHEU2B+AprWSnevpB2N+MuL6tn7jnLX
	 /5iF664pjkfs6PVc+NNmwPqqgFw1HMsrR2CEi2OSuNiOHpklt4Recr4mOnGIu6ScCAVte
	 BpD+lHCSL/6sBDaaRGgyKXq6VYKHYNgRzwpPwmLlTbPShM29Exvi1lcdgo3Vn2q6CS3/1
	 ZQwBVJinQqkNIQoqb30OEdxaeLZmyblREC6236bnQgECUs0Kr9z9F1ogL8UphpO8QzR1P
	 rP8lPtn7s0CEOj2y5g9uornss/zYs+Bhhha09noRcYxckdwDsYn/6NPkLvpeXQUfbbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362328;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qklwpoi6qq8nTgE1PW1qeUUVEPXIPv2nahyGGJhDRsw=;
	b=3Ib8sRw4Jrlcl6SXZYf0TS/f1Uc+5dRpbI8z1G+RfS6jXQk1vu6u3mhFxvNr1R5MrqR2
	 buzFl6HMRSHwOedN3dPAabMPIlGCHQMETDB+Xw3V9a5x3yla6bsYNjsRiS4T12x/cvOh6
	 bxOJ7kVoMgjcsPGWuv5B0TDFWOXjtdTOzg3hBpeXczNQOltsLA0JPXs/7C8t25/laNobx
	 V+cR6BTXXV+3D4Iu+wXEJdAdXGWeTEsotC3jCvv5kAJIYKV3/vBy5S25nI522eetooDpa
	 d0+h9P4rhAE3S6pBbzP1cZ7gIGXT9kvQuWRvjS/tp6iwLZuGlYuXKjrQ6VVcxoLLWrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UTTBV+EI;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF3F606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 01:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF3F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UTTBV+EI
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kn3s5jPUjfCWATljI2U5Ha05zn+bxfjQnlH9S4hueak=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794362324; v=1; x=1794967124;
 b=UTTBV+EIoTyq6szgGRQsYYKgNK9FTPxsWWKuqE1liETgQIf0h7nR4tcV+jiXm477q4sEfpP+
 7AcnZZ5qRT5xbvaxPz8K+mByDAwKJFjXiE3nC6wBfmO4Vzj96zpMu5ZVJ5dwcyE8Qx1iCULWzka
 4uzTSxt1ifYFJ8BvMRjGc9Ck=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 31c899d3efa8a9fc;
	Wed, 11 Nov 2026 01:58:44 +0000
X-Mizu-Trace-ID: 31c899d3efa8a9fc
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 09:58:32 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Breno Leitao <leitao@debian.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net] selftests: netconsole: enable the targets created by
 the torture test
Message-ID: <avPLyMTFkhCRqRAS@fedora>
References: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>
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
In-Reply-To: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>

Hi Breno,
On Tue, Nov 10, 2026 at 04:32:25AM -0800, Breno Leitao wrote:
> create_and_delete_random_target() is meant to create, enable and remove
> targets while messages are sent, but it only creates and removes them.
> The helper it calls, _create_dynamic_target(), stopped enabling the
> target when the bonding test moved that step into
> create_dynamic_target().
> 
> Enable the targets again, so they come up while messages flow and are
> disabled before being removed. Like toggle_netcons_target(), ignore a
> failed enable, which would otherwise end the function and leave the
> targets behind. With a console per target, this also registers and
> unregisters their consoles under load.
> 
> Fixes: 236682db3b6f ("selftest: netcons: add test for netconsole over bonded interfaces")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> index 33a44adb6f8f3a..3dfab0bf1b0756 100755
> --- a/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> +++ b/tools/testing/selftests/drivers/net/netconsole/netcons_torture.sh
> @@ -46,6 +46,7 @@ create_and_delete_random_target() {
>  
>  		# Basic population so the target can come up
>  		_create_dynamic_target "${FORMAT}" "${RND_TARGET_PATH}"
> +		echo 1 > "${RND_TARGET_PATH}"/enabled 2> /dev/null || true
>  	done
>  
>  	echo "netconsole selftest: ${COUNT} additional targets were created" > /dev/kmsg
> 
> ---
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
> change-id: 20261110-netcons_selftest_fix-4cbf633295ef
> 
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
> 

Ignore the failed enable makes sense to me, as we enabled `set -e`
and use random target. Do we need sleep 1s like create_dynamic_target()
to make sure the configuration loaded?

Thanks
Hangbin

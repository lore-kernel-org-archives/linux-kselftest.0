Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583DE2F7F1F
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512347; cv=none; b=akh/l1q5ovY8gZPW0rG7V3g4VvOcl84GVnVA22cgnwRFEdcU/OgzoHII2wxLY9Tv9WfvalDrPafzP7af8RAARLRc3/n3BjNbJdSQ3qc7nig6CaigId4r4Egd+GCm+ouDH/edZC5w5BCmOi+7qklKeANkIMhhpFRF8kA/7hjynLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512347; c=relaxed/simple;
	bh=AXIi5l9EgmU9TpFEGlZP7Wof8wFRLyDVW5am2ssOVqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmT7+GepD4aKE7Zjn3mjonaiAIpuowpKQDA81LTO+ZsR6DWe3Zc02Ztki4/HnTbXO+6bSfCqe0+RB+qlZl0GRFqK0tLtpjlSt2QlaFLQ1jE4xz9uuwpztbOKzcKGowByKQVBR5ls61YjbZPAqJL5fwIvaRDs5FYFBJua8iEWTqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FtLFzIbm; arc=none smtp.client-ip=91.218.175.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FtLFzIbm"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AXIi5l9EgmU9TpFEGlZP7Wof8wFRLyDVW5am2ssOVqk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791512341; v=1; x=1792117141;
 b=FtLFzIbm88y9d80nYvmcduWjs2s7kX+xky2BUaefrMnZ+Sp0+hpYc8uFF3p6U7DsDch5snPw
 QLOUcPnWXG3lm0406GiE8NLC4W9/w/K0WR5OCIlCo+aNWUDVt7Pt6j2hD+Xcf+rpqA75fnGhBXe
 mFcCYVdf8Y6CaDVAKg71R6so=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b3c6c0365d398abd;
	Fri, 09 Oct 2026 02:19:01 +0000
X-Mizu-Trace-ID: b3c6c0365d398abd
X-Migadu-Flow: FLOW_OUT
Date: Fri, 9 Oct 2026 10:18:50 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: =?iso-8859-1?Q?Dar=EDo?= Hueso Gisbert <darihueso21@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: rtnetlink: skip ifalias test if
 uuidgen is missing
Message-ID: <ashPChZWM1ZMRMjL@fedora>
References: <20261008183742.678-1-darihueso21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261008183742.678-1-darihueso21@gmail.com>

Hi Darío,
On Thu, Oct 08, 2026 at 08:37:41PM +0200, Darío Hueso Gisbert wrote:
> kci_test_ifalias() uses uuidgen to generate the alias names, but
> uuidgen is not always installed on minimal systems. When it is
> missing, the test fails with "uuidgen: command not found" instead of
> being reported as skipped.
> 
> Check for uuidgen before running the test and return SKIP when it is
> not available, as kci_test_promote_secondaries() already does for
> ifconfig.
> 
> Assisted-by: LLM
> Signed-off-by: Darío Hueso Gisbert <darihueso21@gmail.com>
> ---
> The commit message and the added check were drafted with the help of
> an LLM (Claude). I reviewed both and tested the script on a kernel
> built from mainline, with uuidgen installed (unchanged behaviour) and
> with it removed (the ifalias test now reports SKIP instead of FAIL).
> 
> On that kernel the unrelated ipsec_offload test fails with and without
> this change.
> 
>  tools/testing/selftests/net/rtnetlink.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/rtnetlink.sh b/tools/testing/selftests/net/rtnetlink.sh
> index 4843d474538f..c758efb734da 100755
> --- a/tools/testing/selftests/net/rtnetlink.sh
> +++ b/tools/testing/selftests/net/rtnetlink.sh
> @@ -412,6 +412,13 @@ kci_test_addrlabel()
>  kci_test_ifalias()
>  {
>  	local ret=0
> +
> +	run_cmd uuidgen
> +	if [ $ret -ne 0 ]; then
> +		end_test "SKIP: uuidgen not installed"
> +		return $ksft_skip
> +	fi

You can use check_command, which will log test and return correctly.

Thanks
Hangbin
> +
>  	namewant=$(uuidgen)
>  	syspathname="/sys/class/net/$devdummy/ifalias"
>  	run_cmd ip link set dev "$devdummy" alias "$namewant"
> -- 
> 2.53.0
> 

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97A3D6CC7;
	Sat, 10 Oct 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627666; cv=none; b=fyqhMlponfTGe4Z9ZN9NGUbE9QK5zXaOUBOvdWZaPdiYXepP/LizIkTc5Gmr7yBoA0XELDaT1pJzTy/C2vtOlz2GRnQBln29kirHe3YN7T/Io3xWarRZoV32RVKNC2UwLjygH1wa/KVSvzIjhByugowv617UKoWLNedstU00VQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627666; c=relaxed/simple;
	bh=VeCMiUvtZF5Q0KCpJBE3wyWICx2Ujway08d1WqO4pW4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ueJRB31Zkx6hwCOYsN85vPIYFswRdfApf+lbev1ZzSwXosgQG6JwOvVoiv1lKIhFWEGwkFlvNmiRd+u8tIjClQ2r9PJiezOXlQnJVS+x26jTfiU0Gk3vsfhQyv45Vxc4Ex8ZPC1/d58dc5RunVcRN/FvJKZ58t4fUgHTrqiUbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MP6F5k+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MP6F5k+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765A11F00893;
	Sat, 10 Oct 2026 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791627665;
	bh=52YoM82sMokrWYZXuPjmMi8K9eT6gENt942cCwl6dEs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MP6F5k+ifvL8HRmPHwTeyAVEh1DoXt6PzMK4/2pORAWSDdzB9v8oo+IHb7A2Rl6Io
	 OIzIwMonHZsbv/sVw3ILUNlIe31ivBOqnzgZD5uVnhFwz4N4AFbY/EE/86cgEdeT5N
	 sytpu4qRlx+PZ/d8NOzzUa9ppJYEmRwLGlktc/88gTORTtE2XjhFrta3GjQZnh9EpF
	 p/okv7/Qy1rFpzaAMK+BxDYL6J+o16jgP04YhPPGkYORUDnlkB45o6uRIA3hft7lLz
	 GN1aYefjYG/7XUz97WA8pQrZHj2SbDEn1S8qUl2NaH7b7YTfSIu+1+obTaujCCpmGx
	 VeNGNOVkPwK8Q==
Subject: Re: [PATCH net-next v2 3/5] selftests: seg6: move SRv6 End PSP setup
 into its own helper
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Sat, 10 Oct 2026 10:21:03 +0000
Message-ID: <179162766399.434549.2048681726157385482@kernel.org>
In-Reply-To: <20261009-srv6_flavors_endx-v2-3-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-3-56ac7f838f41@kylinos.cn>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The comment in cleanup()
  (tools/testing/selftests/net/srv6_end_flavors_test.sh, lines 328-330)…

--

selftests: seg6: move SRv6 End PSP setup into its own helper

This commit moves the End PSP policy setup out of setup() and into a new
helper, setup_end_flv_psp(). host_srv6_end_flv_psp_tests() now calls that
helper with set -e and SETUP_ERR wrapped around it. cleanup() also changes
so that a setup error only gives SKIP when ret is not already ksft_fail.

> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 30a939392eea4..5ebd6a0344d69 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -328,7 +328,7 @@ cleanup()
>  	# check whether the setup phase was completed successfully or not. In
>  	# case of an error during the setup phase of the testing environment,
>  	# the selftest is considered as "skipped".
> -	if [ "${SETUP_ERR}" -ne 0 ]; then
> +	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then

[Severity: Low]
This isn't a bug, but the comment above this condition in cleanup() still
says that any setup error makes the selftest "skipped". Should it be
updated to match the new condition?

With this patch, host_srv6_end_flv_psp_tests() starts a second setup
phase after router_tests and host2gateway_tests have already run.

Suppose one of those earlier tests sets ret to ksft_fail, and then
setup_end_flv_psp() fails. cleanup() then runs with SETUP_ERR=1 and ret=1.
The SKIP branch is not taken, and the script exits 1 instead of
ksft_skip.

I couldn't find a later patch in the series that updates this comment.

>  		echo "SKIP: Setting up the testing environment failed"
>  		exit "${ksft_skip}"
>  	fi

[ ... ]

> @@ -741,7 +744,13 @@ host2gateway_tests()
>  
>  host_srv6_end_flv_psp_tests()
>  {
> -	log_section "SRv6 connectivity test hosts (h1 <-> h2, PSP flavor)"
> +	set -e
> +	SETUP_ERR=1
> +	setup_end_flv_psp
> +	SETUP_ERR=0
> +	set +e

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-srv6_flavors_endx-v2-0-56ac7f838f41%40kylinos.cn

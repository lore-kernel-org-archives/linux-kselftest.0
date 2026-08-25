Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1238A706
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647200; cv=none; b=sRGqlq+B3zK9iJh9jVd4OpxbK4SuLShXe0u1fSCy/947ws/V4magDMzUK64u9r6VAv8uHSZTTc8zO384wxmwBXDunYW6Q0WqbsRAcc5+9sJGxImgDFc8qWISKh27cuZye10SjM2bwnBLy0D3qW7wJG3ACSOEbsLHNo5AlHGEVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647200; c=relaxed/simple;
	bh=5Wq6Ff2T+nZB+feHfV1yQnIq4ghTOiRXYozpyKiBArI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlaH4ufowa5m1IQiifl5XcvXvPJytK43zz0L4SN1RsOhXDHS6WIepjhQlSFqM4iQk7MVfIMGXFYWNhd/9Ah6CQmyNswXivQJApUc7orMminKUI8Gjc0eiaDvoQttcbqRZ7nKn1d7PUVbWzJ5jAoMuiuAxdW0EOO/Z1isXm0pUQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ilPuwrUi; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ilPuwrUi"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5Wq6Ff2T+nZB+feHfV1yQnIq4ghTOiRXYozpyKiBArI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787647195; v=1; x=1788251995;
 b=ilPuwrUiA987vsfg+whUlbDvnuGwHZIEXNejuQFm+UGsLdTy0e43heVCxrQEHscZQTUot6if
 0RsaJR/W7+pleeQ8YQy9wu0cRwDHJa+3j+D6t2Edcy74CIzeCoT7FYe5GqqmspH/yf6+ntgxowy
 7gZp/Hr65XZnDJxa4dS6rBLQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from fedora (216.236.36.151)
	by smtp.migadu.com with ESMTPS id 5a5521dc59c7272f;
	Tue, 25 Aug 2026 08:39:55 +0000
X-Mizu-Trace-ID: 5a5521dc59c7272f
X-Migadu-Flow: FLOW_OUT
Date: Tue, 25 Aug 2026 16:39:42 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh if
 iproute2 too old
Message-ID: <ao1Uzk6nLcQfkqff@fedora>
References: <20260824091537.2305107-1-alessio.faina@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824091537.2305107-1-alessio.faina@canonical.com>

On Mon, Aug 24, 2026 at 11:15:37AM +0200, Alessio Faina wrote:
> In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> the End.DT4/DT6/DX4/DX6 support are not available and the tests
> contained in the following 4 test files
>  - srv6_end_dt4_l3vpn_test.sh
>  - srv6_end_dt6_l3vpn_test.sh
>  - srv6_end_dx4_netfilter_test.sh
>  - srv6_end_dx6_netfilter_test.sh
> are failing in some kernel backports.
> This is the result of one those tests in an unsupported environment:
> 
> \################################################################################
> \TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> \################################################################################
> \
> \    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
> \
> \    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
> \
> \    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
> \
> \    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
> \
> 
> To amend this, check the current running iproute2 supports the required
> feature and, if not, just skip the entire test to avoid a failure.
> 
> This is similar to what have been done for srv6_end_dt46_l3vpn_test.sh in
> https://patchwork.kernel.org/project/netdevbpf/patch/20260715122859.36177-1-alessio.faina@canonical.com/
> 
> Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> ---
>  tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh      | 10 ++++++++++
>  tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh      | 10 ++++++++++
>  tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh  | 10 ++++++++++
>  tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh  | 10 ++++++++++
>  4 files changed, 40 insertions(+)
> 
> diff --git a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
> index a649dba3cb77..50e8c733cf9f 100755
> --- a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
> @@ -459,6 +459,14 @@ host_vpn_isolation_tests()
>  	done
>  }
>  
> +test_iproute2_supp_or_ksft_skip()
> +{
> +	if ! ip route help 2>&1 | grep -qo "End.DT4"; then
> +		echo "SKIP: Missing SRv6 End.DT4 support in iproute2"
> +		exit "${ksft_skip}"
> +	fi
> +}
> +
>  if [ "$(id -u)" -ne 0 ];then
>  	echo "SKIP: Need root privileges"
>  	exit $ksft_skip
> @@ -469,6 +477,8 @@ if [ ! -x "$(command -v ip)" ]; then
>  	exit $ksft_skip
>  fi
>  
> +test_iproute2_supp_or_ksft_skip
> +
>  modprobe vrf &>/dev/null
>  if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
>          echo "SKIP: vrf sysctl does not exist"
> diff --git a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
> index e408406d8489..9ed985559c6b 100755
> --- a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
> @@ -469,6 +469,14 @@ host_vpn_isolation_tests()
>  	done
>  }
>  
> +test_iproute2_supp_or_ksft_skip()
> +{
> +	if ! ip route help 2>&1 | grep -qo "End.DT6"; then
> +		echo "SKIP: Missing SRv6 End.DT6 support in iproute2"
> +		exit "${ksft_skip}"
> +	fi
> +}
> +
>  if [ "$(id -u)" -ne 0 ];then
>  	echo "SKIP: Need root privileges"
>  	exit $ksft_skip
> @@ -479,6 +487,8 @@ if [ ! -x "$(command -v ip)" ]; then
>  	exit $ksft_skip
>  fi
>  
> +test_iproute2_supp_or_ksft_skip
> +
>  modprobe vrf &>/dev/null
>  if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
>          echo "SKIP: vrf sysctl does not exist"
> diff --git a/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh b/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
> index e23210aa547f..b0bc85db8353 100755
> --- a/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
> @@ -311,6 +311,14 @@ router_netfilter_tests()
>  	check_and_log_hs_connectivity 2 1 100
>  }
>  
> +test_iproute2_supp_or_ksft_skip()
> +{
> +	if ! ip route help 2>&1 | grep -qo "End.DX4"; then
> +		echo "SKIP: Missing SRv6 End.DX4 support in iproute2"
> +		exit "${ksft_skip}"
> +	fi
> +}
> +
>  if [ "$(id -u)" -ne 0 ];then
>  	echo "SKIP: Need root privileges"
>  	exit $ksft_skip
> @@ -321,6 +329,8 @@ if [ ! -x "$(command -v ip)" ]; then
>  	exit $ksft_skip
>  fi
>  
> +test_iproute2_supp_or_ksft_skip
> +
>  cleanup &>/dev/null
>  
>  setup
> diff --git a/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh b/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
> index 9e69a2ed5bc3..9bfbc5bbbdeb 100755
> --- a/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
> @@ -316,6 +316,14 @@ router_netfilter_tests()
>  	check_and_log_hs_connectivity 2 1 100
>  }
>  
> +test_iproute2_supp_or_ksft_skip()
> +{
> +	if ! ip route help 2>&1 | grep -qo "End.DX6"; then
> +		echo "SKIP: Missing SRv6 End.DX6 support in iproute2"
> +		exit "${ksft_skip}"
> +	fi
> +}
> +
>  if [ "$(id -u)" -ne 0 ];then
>  	echo "SKIP: Need root privileges"
>  	exit $ksft_skip
> @@ -326,6 +334,8 @@ if [ ! -x "$(command -v ip)" ]; then
>  	exit $ksft_skip
>  fi
>  
> +test_iproute2_supp_or_ksft_skip
> +
>  cleanup &>/dev/null
>  
>  setup
> -- 
> 2.43.0
> 

LGTM

Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>

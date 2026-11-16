Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.80.4.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794803272;
	b=hdnrjRKNBffOXUibkVxQ1oovMn3kXWFsawndCLpk9n/FuS4AzXVmCiVtPeD4XWpBd7DC
	 rY4Tfux6YX2yvSov9uJTmW26qHGE4XG3Np0Wy+pgUKBI+CRD3ceKl/lfO2NmbeebjF4yL
	 /oTvF0hFOLYGkTPQkpnqd3/jYhe9Tgcg8l7zhbDmXIddGnjt0l+fWnfHwJw6m8Cb9ktT1
	 t46rToHcY58nDrrli0XdJBQH/cJgKfIONdf3jRGm5PRgExiTj5ODfTwBGe4CCsoXUwG3D
	 Mj9nng9tn+ulnWZcfGxegMg0tir1tjNSzWVECCttVSHQyQDHWUpawpZNXomAu6mPHuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794803272;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-Id:In-Reply-To:References:X-Mailer:
	 Mime-Version:Content-Type:Content-Transfer-Encoding:X-Virus-Scanned:
	 X-Virus-Status;
	bh=eNtVYaFSoYJYpJd8ZF+kTOqpl3wUXqv0VIPKi7kdcO0=;
	b=p40rcEMNpC3IE0Y3tIIbHaBVz/G8/wpOWAzoRbQXKExETHX9CoNMebK7noINCb9WdTko
	 Yo3xySYUmKdzfGXnAje8x/DQCUa7mKwiMMXmo7kGqdrgWflEhB6Y2cqsH/rWgpIIiMqoz
	 EHYljjKJrzb5yQit2RWgF2JXCEOeQl4P2y5A1zYNMw1v1yLdWZIuyOUv6ILlIMnzH1JTA
	 ogeQz8vJvowgLwASnHgN+CEfZqJg7UFIlO72pIpEKEEVOFUViuX3bNlJYEhPxMUlLDT/o
	 RxLZQsF7jTmzNhA3QCEV/+NYA9N0YkwWVTPu1v3TFSQ9WtUQM9e396nxUYCvijJxYjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniroma2.it;
	spf=pass smtp.mailfrom=uniroma2.it;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=ydpnlOAO;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=W38B0z3a;
	arc=none smtp.remote-ip=160.80.4.39
Received: from smtp.uniroma2.it (smtp-2015.uniroma2.it [160.80.4.39])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C623606A31C;
	Mon, 16 Nov 2026 04:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C623606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniroma2.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=uniroma2.it header.i=@uniroma2.it header.a=ed25519-sha256 header.s=ed201904 header.b=ydpnlOAO;
	dkim=pass (2048-bit key, unprotected) header.d=uniroma2.it header.i=@uniroma2.it header.a=rsa-sha256 header.s=rsa201904 header.b=W38B0z3a
Received: from smtpauth-2019-1.uniroma2.it (smtpauth.uniroma2.it [160.80.5.46])
	by smtp-2015.uniroma2.it (8.14.4/8.14.4/Debian-8) with ESMTP id 6AG4R4F6029746;
	Mon, 16 Nov 2026 05:27:09 +0100
Received: from lubuntu-18.04 (unknown [160.80.103.126])
	by smtpauth-2019-1.uniroma2.it (Postfix) with ESMTPSA id EF21E120755;
	Mon, 16 Nov 2026 05:26:59 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=uniroma2.it;
	s=ed201904; t=1794803220; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNtVYaFSoYJYpJd8ZF+kTOqpl3wUXqv0VIPKi7kdcO0=;
	b=ydpnlOAOtxb/e9yNfed9MY5lOi0Y/iO4uPfGZ6i+nbQUxgfr7iz2s1AGELvWpNIRpDi/3p
	QMsP9bd/C+7j8iAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniroma2.it; s=rsa201904;
	t=1794803220; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNtVYaFSoYJYpJd8ZF+kTOqpl3wUXqv0VIPKi7kdcO0=;
	b=W38B0z3a7AJPGA6RtB9Dt3UY9w6Y9DyuDNEWYTfF5fgGLdsW9LLCMgS6tcv0//uLGEh+u6
	bD9nHBn4Uvwg6wiIBP4YaKs8CZRXRjm1Na4lb3pjOvyUhXegPA4vCKCXMgZk1yAyNBtnHV
	gnE2gZdWF7+07jJZnzZ0Cxry0swGuE3Sj7AXte47MtUe5jEFwZF6Gy02ZLHEBnI3GL9DEE
	SCEMRSLu1VfAit89zH3PV2rrqfCWZ+37Lat3Tb+Xnw8TcCaVJidmXldZclqtUUiphNbDyM
	I2j9KjW5UU3TfAci591PT/9K/YCmahrAJO6nhDSvqVWeOSS7BdywY0MikfWA/w==
Date: Mon, 16 Nov 2026 05:26:59 +0100
From: Andrea Mayer <andrea.mayer@uniroma2.it>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan
 <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Hangbin Liu <liuhangbin@kylinos.cn>,
        Stefano Salsano <stefano.salsano@uniroma2.it>,
        Andrea Mayer
 <andrea.mayer@uniroma2.it>,
        Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 3/5] selftests: seg6: move SRv6 End PSP
 setup into its own helper
Message-Id: <20261116052659.e8843a373807242737faeef0@uniroma2.it>
In-Reply-To: <20261112-srv6_flavors_endx-v3-3-c9177bbbd965@kylinos.cn>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-3-c9177bbbd965@kylinos.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.0 at smtp-2015
X-Virus-Status: Clean

On Thu, 12 Nov 2026 17:27:58 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> setup() installs both the base topology and the End PSP policies. That
> couples general test setup with one specific flavor scenario and makes
> it hard to add further flavor cases cleanly.
>
> Extract the End PSP policy setup into setup_end_flv_psp() so flavor
> tests can set up and later tear down independently (the matching
> cleanup arrives in a following patch).
>
> Run the block under set -e so a setup failure is treated as an error
> instead of falling through into the connectivity checks. When deciding
> to report the run as skipped, keep any failure already recorded by a
> test, so a real failure is not converted into a skip.

Hi Hangbin,
thanks for the v3.

>
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> [snip]
> diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> index 157baa8ecb0b..0ed5bfe99029 100755
> --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> @@ -488,8 +488,9 @@ cleanup()
>  
>  	# check whether the setup phase was completed successfully or not. In
>  	# case of an error during the setup phase of the testing environment,
> -	# the selftest is considered as "skipped".
> -	if [ "${SETUP_ERR}" -ne 0 ]; then
> +	# the selftest is considered as "skipped", unless a test has already
> +	# recorded a failure.
> +	if [ "${SETUP_ERR}" -ne 0 ] && [ "$ret" -ne "$ksft_fail" ]; then
>  		echo "SKIP: Setting up the testing environment failed"
>  		exit "${ksft_skip}"
>  	fi

When a test has already failed and the setup then fails, the script
exits with 1 and does not say that the setup failed. For example, with
hs-2 -> gw failing and then an error in setup_end_flv_psp(), the last
TEST lines in the log are:

    TEST: IPv6 Hosts connectivity: hs-1 -> gw                           [ OK ]
    TEST: IPv6 Hosts connectivity: hs-2 -> gw                           [FAIL]

The End PSP tests did not run. Before this patch, the setup ran before
any test, and cleanup() printed "Setting up the testing environment
failed" on every setup error. Could cleanup() print it also in this
case, keeping the exit code 1? Something like:

	if [ "${SETUP_ERR}" -ne 0 ]; then
		if [ "${ret}" -ne "${ksft_fail}" ]; then
			echo "SKIP: Setting up the testing environment failed"
			exit "${ksft_skip}"
		fi

		echo "FAIL: Setting up the testing environment failed"
	fi

	exit "${ret}"

> @@ -785,6 +786,27 @@ setup_rt_endpoints()
>  	done
>  }
>  
> +# setup proxy on route entries for hosts
> +# args:
> +#  $1 - ingress router that enforces the SRv6 Policy
> +#  $2 - destination host whose addresses are proxied
> +#  $3 - suffix of the address on the loopback of the destination host
> +#       (i.e. cafe::<host>:<suffix>)
> +setup_rt_host_proxy()
> +{
> +	local rt=$1
> +	local hs=$2
> +	local func=$3
> +
> +	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
> +		proxy "${IPv6_HS_NETWORK}::${hs}" \
> +		dev "${RT2HS_DEVNAME}"
> +
> +	ip -netns "$(get_rtname "${rt}")" -6 neigh add \
> +		proxy "${IPv6_HS_NETWORK}::${hs}:${func}" \
> +		dev "${RT2HS_DEVNAME}"
> +}
> +
>  # This helper function builds and installs the SID List (i.e. SRv6 Policy)
>  # to be applied on incoming packets at the ingress node. Moreover, it
>  # configures the SRv6 nodes specified in the SID List to process the traffic
> @@ -860,10 +882,6 @@ __setup_rt_policy()
>  		add "${IPv6_HS_NETWORK}::${dst}" \
>  		encap seg6 mode inline segs "${policy}" \
>  		dev "${DUMMY_DEVNAME}"
> -
> -	ip -netns "${in_nsname}" -6 neigh \
> -		add proxy "${IPv6_HS_NETWORK}::${dst}" \
> -		dev "${RT2HS_DEVNAME}"
>  }
>  
>  # see __setup_rt_policy
> @@ -962,17 +980,29 @@ setup()
>  	setup_hs 1 1
>  	setup_hs 2 2
>  
> -	# set up the loopback addresses of the hosts used by the Policies (i.c)
> -	# and (i.d).
> -	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
> -	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
> -
>  	# set up default SRv6 Endpoints (i.e. SRv6 End behavior)
>  	setup_rt_local_sids 1 "2 3 4"
>  	setup_rt_local_sids 2 "1 3 4"
>  	setup_rt_local_sids 3 "1 2 4"
>  	setup_rt_local_sids 4 "1 2 3"
>  
> +	# testing environment was set up successfully
> +	SETUP_ERR=0
> +}
> +
> +setup_end_flv_psp()
> +{
> +	SETUP_ERR=1
> +
> +	# set up the loopback addresses of the hosts used by the Policies (i.c)
> +	# and (i.d).
> +	setup_hs_lo_addr 1 1 "${END_CSID_PSP_FUNC}"
> +	setup_hs_lo_addr 2 2 "${END_CSID_PSP_FUNC}"
> +
> +	# setup proxy on route entries for hosts
> +	setup_rt_host_proxy 1 2 "${END_CSID_PSP_FUNC}"
> +	setup_rt_host_proxy 2 1 "${END_CSID_PSP_FUNC}"
> +
>  	# set up SRv6 policies
>  	# create a connection between hosts hs-1 and hs-2.
>  	# The path between hs-1 and hs-2 traverses SRv6 aware routers.

Before this patch, __setup_rt_policy() added the proxy entry together
with the route of each Policy. With this patch, each scenario calls
setup_rt_host_proxy() instead.

In this v3, 4/5 deletes the proxies when the scenario ends, like the
routes of the Policies. So I think the proxy entry can stay in
__setup_rt_policy(), and in 4/5 its defer can go next to the defer of
the route. What do you think?

> [snip]

Thanks,
Andrea

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870666;
	b=wvrseJnIi/XM7QLQF3PYEFuT9TF38LABiBIFQrEHFDOh/DH0kiCCejgT1HMtvVBa05zn
	 Dy7XRFUxm1tuHmO8d0AwqX0L5uhqwfIuvRtAPxLKsMn3BpTdrdWpSPtcwi4z+6/xXt8o2
	 UzJbq8fyrPJiiMPzPsBfErNeZNSp7Y8NROvIGcODrxJL3NDKguhmRjIdOpIzaNBkPYxjx
	 vm6LWWiJ22nDT+DXIqkeQ6/L43SZIpseuNfjvNYssF5rke7GteYiO+cwWzs+s+4xwMtpU
	 YbQAESW4wWb45Xqpc6OluRpuKnHVrXrLgIc10RGDQajuiHg+/BcL0l/fjahjxGf4UKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870666;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=47z7brSo33mlypnLaxbaxwk/bykGGQ/mpDgwuXRnuwQ=;
	b=Ci+riLgKAkKgyQdjM9jBXtG1iR9j4CbNHNO96FQhGzrehYon6cad7Oae93CpO0NDpdZz
	 QXDOvgLbb/bKZ7wz5avM0RwpKx8fhudqJo57FXX5rJEmCYPS6Tt8B9VmVI8eklS8pRp1X
	 EEsBp+MbbATzboEnERBvLRM35pBNt3E6fbC2zlu5VrnOqXpKWSBEFqv1/1zwDMexRF7sZ
	 a/7z48l3M33LAxC9HuFiC4GaCSsOc9WMqB5emk9huxgipME1WmotSX2HG8rozTSiGUkDS
	 XMgjUwZFf7gCmCQe9S9afR7rvQ/p4kkMw1sxErykGBTje4CSd4YPR8gj/FIlAqaY2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="fGwM2W/j";
	arc=none smtp.remote-ip=91.218.175.128
Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572C9606A326
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 09:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fGwM2W/j
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7RHOYddhHtUsTVy8AhY3X82ztUTMixuxCKf0uz2Jqk4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793870663; v=1; x=1794475463;
 b=fGwM2W/j9kP0lpvLeqQs+swxCGFHVVeLE2G6FhV+GAI6Lseae1T/pmTo/Oc/KAmho42/Zlv0
 RPDTUxeD/zC27iq3iI8IFMqrlH5dscMSA6Hd/NRVZ6cioTfE3D4b4jy6QsaONeDyEhxGm79VMEO
 5QIzAVHzsTTdadsYzO8OOPo4=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 19424a7b2f638b1c;
	Thu, 05 Nov 2026 09:24:23 +0000
X-Mizu-Trace-ID: 19424a7b2f638b1c
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 17:24:10 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Justin Iurman <justin.iurman@gmail.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Ahmed Abdelsalam <ahabdels@cisco.com>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	andrea@common-net.org
Subject: Re: [PATCH net-next v2 5/5] selftests: seg6: add tests for PSP with
 a consumed SRH
Message-ID: <auxLOoW97AQ55QdH@fedora>
References: <20261105015715.57-1-andrea.mayer@uniroma2.it>
 <20261105015715.57-6-andrea.mayer@uniroma2.it>
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
In-Reply-To: <20261105015715.57-6-andrea.mayer@uniroma2.it>

Hi Andrea,
On Thu, Nov 05, 2026 at 02:57:15AM +0100, Andrea Mayer wrote:
> Extend srv6_end_flavors_test.sh with tests for the SRv6 End behavior
> with the PSP flavor, alone and together with NEXT-C-SID, on packets that
> carry a consumed SRH in front of the SRH to process.
> 
> Each test sends a ping along an existing SRv6 Policy, and a router on
> the path inserts an extra SRH in front of the Policy's SRH. An End
> behavior on another router consumes the extra SRH, and the router
> connected to the host must then remove only the Policy's SRH.
> 
> These tests set seg6_enabled to 1 on the hosts, which must accept the
> extra SRH, and set it back to 0 at the end. With seg6_enabled set to 1,
> a host also accepts the packet when the Policy's SRH is not removed, or
> when the extra SRH is removed in its place. For this reason, the
> receiving host accepts the echo request only when its first SRH is the
> extra SRH, with Segments Left 0 and followed by the ICMPv6 header. Any
> other echo request is dropped, including one without any SRH. The extra
> SRH is recognized by its last segment, which is the SID that triggered
> its insertion.
> 
> The check on the receiving host uses the ip6tables srh match. Without
> it, these tests are skipped. A test fails if the route that inserts the
> extra SRH, or the rules on the receiving host, cannot be added.
> 
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> ---
>  tools/testing/selftests/net/config            |   1 +
>  .../selftests/net/srv6_end_flavors_test.sh    | 280 +++++++++++++++++-
>  2 files changed, 279 insertions(+), 2 deletions(-)
> 

[...]

> +
> +# Test a Policy with a consumed SRH: a router inserts the extra SRH on the
> +# packets towards a SID, and another router consumes it. The destination host
> +# accepts only the echo requests that carry the extra SRH alone.
> +# args:
> +#  $1 - router that inserts the extra SRH
> +#  $2 - SID that triggers the insertion
> +#  $3 - router with the SRv6 End behavior that consumes the extra SRH
> +#  $4 - source host
> +#  $5 - destination host
> +#  $6 - suffix of the address on the loopback of the destination host
> +#       (i.e. cafe::<host>:<suffix>), if any
> +check_and_log_consumed_srh()
> +{
> +	local rt="$1"
> +	local sid="$2"
> +	local end_rt="$3"
> +	local hssrc="$4"
> +	local hsdst="$5"
> +	local suffix="$6"
> +	local msg
> +
> +	if ! ${HAS_SRH_MATCH}; then
> +		msg="IPv6 Hosts connectivity: hs-${hssrc} -> hs-${hsdst}"
> +		if [ -n "${suffix}" ]; then
> +			msg="${msg} (${IPv6_HS_NETWORK}::${hsdst}:${suffix})"
> +		fi
> +		log_test_skipped "${msg}"
> +		return
> +	fi
> +
> +	if ! setup_rt_consumed_srh "${rt}" "${sid}" "${end_rt}"; then
> +		log_test 1 0 "Extra SRH on rt-${rt} for ${sid}"
> +		return
> +	fi
> +
> +	if ! setup_hs_srh_check "${hsdst}" "${sid}"; then
> +		log_test 1 0 "SRH check on hs-${hsdst} for ${sid}"
> +	elif [ -n "${suffix}" ]; then
> +		check_and_log_hs_lo_addr_connectivity "${hssrc}" "${hsdst}" \
> +			"${suffix}"
> +	else
> +		check_and_log_hs_connectivity "${hssrc}" "${hsdst}"
> +	fi
> +
> +	cleanup_hs_srh_check "${hsdst}"
> +	cleanup_rt_consumed_srh "${rt}" "${sid}"
> +}
> +
> +host_srv6_end_flv_consumed_srh_tests()
> +{
> +	local sid
> +
> +	log_section \
> +		"SRv6 connectivity test hosts (h1 <-> h2, PSP with a consumed SRH)"
> +
> +	if ! ${HAS_SRH_MATCH}; then
> +		echo "SKIP: ip6tables srh match not available"
> +	fi

Ah, forgot to say. We can return directly here if srh match not available.
There is no need to check $HAS_SRH_MATCH again in each
check_and_log_consumed_srh() testing.

Not need to update for another version if you don't plan to change other
stuff.

Thanks
Hangbin

> +
> +	set_hs_seg6_enabled 1
> +
> +	# Policy (i.a): rt-4 inserts the extra SRH consumed by rt-3
> +	sid="${LOCATOR_SERVICE}:2::${END_PSP_FUNC}"
> +	check_and_log_consumed_srh 4 "${sid}" 3 1 2
> +
> +	# Policy (i.b): rt-2 inserts the extra SRH consumed by rt-3
> +	sid="${LOCATOR_SERVICE}:1::${END_PSP_FUNC}"
> +	check_and_log_consumed_srh 2 "${sid}" 3 2 1
> +
> +	# Policy (i.c): rt-4 inserts the extra SRH consumed by rt-3
> +	sid="$(build_csid_container 2 "${END_CSID_PSP_FUNC}")"
> +	check_and_log_consumed_srh 4 "${sid}" 3 1 2 "${END_CSID_PSP_FUNC}"
> +
> +	# Policy (i.d): rt-3 inserts the extra SRH consumed by rt-4
> +	sid="$(build_csid_container 1 "${END_CSID_PSP_FUNC}")"
> +	check_and_log_consumed_srh 3 "${sid}" 4 2 1 "${END_CSID_PSP_FUNC}"
> +
> +	set_hs_seg6_enabled 0
> +}

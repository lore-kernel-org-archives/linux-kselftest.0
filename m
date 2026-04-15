Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4037C109;
	Wed, 15 Apr 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776253673; cv=none; b=uEUWRngUmTB4F+UEk8AkJ1Iydfi14jaSyrQ1vaPpp6jA444us7+ZyYsjj4ipZKSZphfaIiy9TzJExdQFdtGk+1Stj3TVTRgBLd+IYrZnzzMxUjpAoBd51Cvk5K8eVrBdFc13VXS5hSjzePdNtJx9GLbBHmsNZ8pHX19XRg2jXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776253673; c=relaxed/simple;
	bh=q8gdIFRHw9b6qHvL4UVQ6yYfHSXSpKcc0o7RNbjBEKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DC1IDOLZlLWqYG1d303ASCp7KYoWnXbybzUDFcDsTB90Vkg4dGS1OVIB2Y+YdRDUMrBNauHnGh8pXB8gITuF85qtDv971o2rMYrNOgtuI83FZ4qLnG/z7M/xlKMiZ/2jmmQ5RHD2kM0i0sc+kmJWeW5DMd+8E46nzG0dFjC71Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=E7Oeb5TO; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="E7Oeb5TO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=7CzQdUJLKpEdZgoINTLE9k4PoV6SGrsb0F7JzrvZZR4=; b=E7Oeb5TOrGR7L3I86FgglcWIvb
	kGptU61QvYqLvs+U0ADiUB+8/8BZGWkMi416H4omPa6cyrZiLjKBuiZ4pacV8J8Z8IX19h/IeoE9j
	KUni3CWbre2pg8SZ1op2PEnpBp11pEpEbf4Jm5JCx2qEVj4n35j0jboMvCd5vT+1FYo1v7B/a1FIt
	TqNQsWC/HPM1BKmrErOvSzpq8EtwNSLYl+RNTtQyT18ysw1QLm0SiLD7tTpuQEFFRepy+6aY7kWMo
	6to9g59nyRXhzwBAPXWOnBBhYiMnr3KStRQMpmJ/lIbbqXfypVrNNX/QE/TLNAxz3Ngx+N0M3AEAQ
	P9nLmBxg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCyih-00DoUe-1J;
	Wed, 15 Apr 2026 11:47:47 +0000
Date: Wed, 15 Apr 2026 04:47:41 -0700
From: Breno Leitao <leitao@debian.org>
To: hawk@kernel.org
Cc: netdev@vger.kernel.org, kernel-team@cloudflare.com, 
	Jonas =?utf-8?B?S8O2cHBlbGVy?= <j.koeppeler@tu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/5] selftests: net: add veth BQL stress test
Message-ID: <ad96exRhN_hLt0ar@gmail.com>
References: <20260413094442.1376022-1-hawk@kernel.org>
 <20260413094442.1376022-6-hawk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413094442.1376022-6-hawk@kernel.org>
X-Debian-User: leitao

On Mon, Apr 13, 2026 at 11:44:38AM +0200, hawk@kernel.org wrote:
> From: Jesper Dangaard Brouer <hawk@kernel.org>
> 
> Add a selftest that exercises veth's BQL (Byte Queue Limits) code path
> under sustained UDP load. The test creates a veth pair with GRO enabled
> (activating the NAPI path and BQL), attaches a qdisc, optionally loads
> iptables rules in the consumer namespace to slow NAPI processing, and
> floods UDP packets for a configurable duration.
> 
> The test serves two purposes: benchmarking BQL's latency impact under
> configurable load (iptables rules, qdisc type and parameters), and
> detecting kernel BUG/Oops from DQL accounting mismatches. It monitors
> dmesg throughout the run and reports PASS/FAIL via kselftest (lib.sh).
> 
> Diagnostic output is printed every 5 seconds:
>   - BQL sysfs inflight/limit and watchdog tx_timeout counter
>   - qdisc stats: packets, drops, requeues, backlog, qlen, overlimits
>   - consumer PPS and NAPI-64 cycle time (shows fq_codel target impact)
>   - sink PPS (per-period delta), latency min/avg/max (stddev at exit)
>   - ping RTT to measure latency under load
> 
> Generating enough traffic to fill the 256-entry ptr_ring requires care:
> the UDP sendto() path charges each SKB to sk_wmem_alloc, and the SKB
> stays charged (via sock_wfree destructor) until the consumer NAPI thread
> finishes processing it -- including any iptables rules in the receive
> path. With the default sk_sndbuf (~208KB from wmem_default), only ~93
> packets can be in-flight before sendto(MSG_DONTWAIT) returns EAGAIN.
> Since 93 < 256 ring entries, the ring never fills and no backpressure
> occurs. The test raises wmem_max via sysctl and sets SO_SNDBUF=1MB on
> the flood socket to remove this bottleneck. An earlier multi-namespace
> routing approach avoided this limit because ip_forward creates new SKBs
> detached from the sender's socket.
> 
> The --bql-disable option (sets limit_min=1GB) enables A/B comparison.
> Typical results with --nrules 6000 --qdisc-opts 'target 2ms interval 20ms':
> 
>   fq_codel + BQL disabled:  ping RTT ~10.8ms, 15% loss, 400KB in ptr_ring
>   fq_codel + BQL enabled:   ping RTT ~0.6ms,   0% loss, 4KB in ptr_ring
> 
> Both cases show identical consumer speed (~20Kpps) and fq_codel drops
> (~255K), proving the improvement comes purely from where packets buffer.
> 
> BQL moves buffering from the ptr_ring into the qdisc, where AQM
> (fq_codel/CAKE) can act on it -- eliminating the "dark buffer" that
> hides congestion from the scheduler.
> 
> The --qdisc-replace mode cycles through sfq/pfifo/fq_codel/noqueue
> under active traffic to verify that stale BQL state (STACK_XOFF) is
> properly handled during live qdisc transitions.
> 
> A companion wrapper (veth_bql_test_virtme.sh) launches the test inside
> a virtme-ng VM, with .config validation to prevent silent stalls.
> 
> Usage:
>   sudo ./veth_bql_test.sh [--duration 300] [--nrules 100]
>                           [--qdisc sfq] [--qdisc-opts '...']
>                           [--bql-disable] [--normal-napi]
>                           [--qdisc-replace]
> 
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
> Tested-by: Jonas Köppeler <j.koeppeler@tu-berlin.de>

Tested-by: Breno Leitao <leitao@debian.org>

> diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
> index 2a390cae41bf..7b1f41421145 100644
> --- a/tools/testing/selftests/net/config
> +++ b/tools/testing/selftests/net/config
> @@ -97,6 +97,7 @@ CONFIG_NET_PKTGEN=m
>  CONFIG_NET_SCH_ETF=m
>  CONFIG_NET_SCH_FQ=m
>  CONFIG_NET_SCH_FQ_CODEL=m
> +CONFIG_NET_SCH_SFQ=m

nit: This breaks the alphabetical ordering of the config file.

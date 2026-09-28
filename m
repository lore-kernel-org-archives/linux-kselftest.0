Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C963909AE
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578297; cv=none; b=Q3GexIfMO3UyWCSqldH7Lr2lPqKMDuvuIoOcxWe4a0KdCLXC/0yJLJBu7JeiyVm+dsY7cBNOZZwvbiEQ2kxwA5ARCNjiDoO4/oQceRDfii59nQXabNwUTG39RQwDafumr9oAAbzzjppndAlzCF8OMyuI8eGU0SQgWppxveXxPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578297; c=relaxed/simple;
	bh=S65Su3u6l3QjEEjqlT1UaR7HWq+bwOyoeYIpkTcHUUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKIgHnp+TwhX1ZvoBPV7vd4P1I/tuAt08Q1SYWL3XQpDWw5SC/9avD1nYU8Zw+TLKWU26FqSX6yb7gAYC43/jtBql6THSwS4vfInx8wHL+YIysckjLg/ql5RbeI0WBKYaph8ki8GuiWHIj/EF/XpU9C47Mb8lYVozr6vCeG9lFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xDVvP07g; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xDVvP07g"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S65Su3u6l3QjEEjqlT1UaR7HWq+bwOyoeYIpkTcHUUM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790578292; v=1; x=1791183092;
 b=xDVvP07gNn6/KBANVOoN54dJAHWMkY+FFkIw296SJI4pdFGpMpgsjQpkBjiRBkLpELPQvao8
 NhrnifP03WvU89KCAH4edARDSqkRu49Nf3qG7bTqhxDTJh/D3HDW7BcWlFCYdNHKPTanbWui2mb
 ltUdaa0Ov+1XZrjs3zBfwpIU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id b44e6e57b2fd478e;
	Mon, 28 Sep 2026 06:51:32 +0000
X-Mizu-Trace-ID: b44e6e57b2fd478e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 14:51:26 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next 4/5] selftest: seg6: add explicit cleanup for
 SRv6 End PSP test
Message-ID: <aroOXOzCzYjEQKCV@fedora>
References: <20260922-srv6_flavors_endx-v1-4-4d01c05c47b7@kylinos.cn>
 <179025107951.2160803.7004145160447009717@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179025107951.2160803.7004145160447009717@kernel.org>

On Thu, Sep 24, 2026 at 11:57:59AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 � High: 0 � Medium: 1 � Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] Asymmetric teardown: `cleanup_rt_policy_ipv6()` deletes
>   localsid routes it never created.

Ack, I will not remove the End localsid routes.

Thanks
Hangbin
> 
> --
> 
> selftest: seg6: add explicit cleanup for SRv6 End PSP test
> 
> This adds cleanup_rt_policy_ipv6() and cleanup_end_flv_psp(), called at the
> end of host_srv6_end_flv_psp_tests(), to tear down the policy and localsid
> state installed for the PSP test.  It also moves the host neighbour proxy
> entries from __setup_rt_policy() into the common setup().
> 
> > diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > index 56a1c5f865a77..52731983b4cc9 100755
> > --- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
> 
> [ ... ]
> 
> > @@ -576,6 +572,56 @@ setup_rt_policy_ipv6()
> >  	__setup_rt_policy "$1" "$2" "$3"
> >  }
> >  
> > +cleanup_rt_policy_ipv6()
> > +{
> [ ... ]
> > +	for n in ${policy_rts}; do
> > +		node="$(__get_srv6_rtcfg_id "${n}")"
> > +		op_type="$(__get_srv6_rtcfg_op "${n}")"
> > +		rt_nsname="$(get_rtname "${node}")"
> > +
> > +		case "${op_type}" in
> > +		"noflv")
> > +			function="${END_FUNC}"
> > +			;;
> 
> [Severity: Medium]
> Does the "noflv" case here delete a SID that the policy helper never
> created?
> 
> On the add side, __setup_rt_policy() only installs the SID if it is not
> already present:
> 
> 	fullsid="${LOCATOR_SERVICE}:${node}::${function}"
> 
> 	# add SRv6 Endpoint behavior to the selected router
> 	if ! ip -netns "${rt_nsname}" -6 route get "${fullsid}" \
> 		&>/dev/null; then
> 		ip -netns "${rt_nsname}" -6 route \
> 			add "${fullsid}" \
> 	...
> 
> For "noflv" that guard is always taken, because setup_rt_local_sids()
> already installed fcff:<rt>::${END_FUNC} for every router during the
> common setup():
> 
> 	# Local End behavior (note that "dev" is a dummy interface chosen for
> 	# the sake of simplicity).
> 	ip -netns "${nsname}" -6 route \
> 		add "${LOCATOR_SERVICE}:${rt}::${END_FUNC}" \
> 		table "${LOCALSID_TABLE_ID}" \
> 		encap seg6local action End dev "${DUMMY_DEVNAME}"
> 
> > +
> > +		fullsid="${LOCATOR_SERVICE}:${node}::${function}"
> > +
> > +		# Remove SRv6 Endpoint behavior for the selected router
> > +		if ip -netns "${rt_nsname}" -6 route get "${fullsid}" &>/dev/null; then
> > +			ip -netns "${rt_nsname}" -6 route \
> > +				del "${fullsid}" \
> > +				table "${LOCALSID_TABLE_ID}" \
> > +				dev "${DUMMY_DEVNAME}"
> > +		fi
> > +	done
> 
> Since the delete is gated on the route existing rather than on whether
> this helper created it, the condition succeeds precisely for the
> setup()-owned End SID, and it is removed.
> 
> [ ... ]
> 
> > @@ -669,6 +723,12 @@ setup_end_flv_psp()
> >  	setup_rt_policy_ipv6 1 2 "1:psp"
> >  }
> >  
> > +cleanup_end_flv_psp()
> > +{
> > +	cleanup_rt_policy_ipv6 2 1 "3:noflv 4:psp 2:psp"
> > +	cleanup_rt_policy_ipv6 1 2 "1:psp"
> > +}
> > +
> 
> With the "3:noflv" entry above, every normal run ends with
> fcff:3::${END_FUNC} deleted from rt-3's localsid table, so the
> environment no longer matches what setup() built.  After the deletion a
> lookup of fcff:3::000e in rt-3 falls through the
> 
> 	to fcff::/16 lookup localsid
> 
> rule down to the "unreachable default" route that setup_rt_local_sids()
> installed.  Should the teardown mirror the guarded add and only remove
> the flavor SIDs plus the encap route it actually created?
> 
> This matters for exactly the case the commit message mentions, "when
> later tests are added to the same script": a later test that depends on
> the default End SIDs would fail or take a different path unless it
> happens to call __setup_rt_policy() with a noflv entry, which silently
> re-creates the SID.  In this series the End.X PSP test added later does
> re-add fcff:3::000e via setup_endx_flv_psp(), so the asymmetry is
> currently masked and the behaviour becomes order dependent.  The
> cleanup_rt_policy_ipv6() and cleanup_end_flv_psp() helpers are unchanged
> at the end of the series, still passing "3:noflv".
> 
> The commit message describes the change as tearing down flavor-specific
> state the PSP test installed:
> 
>   "The PSP test installs policy and route state, but relies on global
>    cleanup to tear it down. That can leave flavor-specific state around
>    when later tests are added to the same script."
> 
> Could it also mention that shared state created by setup() is removed?
> 
> >  check_rt_connectivity()
> >  {
> >  	local rtsrc="$1"
> > @@ -771,6 +831,8 @@ host_srv6_end_flv_psp_tests()
> >  
> >  	check_and_log_hs_connectivity 1 2
> >  	check_and_log_hs_connectivity 2 1
> > +
> > +	cleanup_end_flv_psp
> >  }
> 
> One more question on the call site: host_srv6_end_flv_psp_tests() runs
> after "set +e", so a failing or over-reaching "ip route del" in
> cleanup_end_flv_psp() produces no test failure.  Would it be worth
> checking the return values here so teardown errors are visible?
> 
> -- 
> Sashiko AI review � https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7%40kylinos.cn

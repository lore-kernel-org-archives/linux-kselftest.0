Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B71D5519B5;
	Thu, 10 Sep 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789060937; cv=none; b=F63TMmq1UI9SoNU2ryCVCsO7M+ieV9E2S0Vgyy0WHj0QZqMzd/1/523eoqhqUeXwtkiL12oeKB+iFtpoE9SSOnBGP7atZh8As+qnCarT5yRgDi3+dv6IM77itpZlm4+PB2yOsUx1vnmSl38RrZ9HFJcOcVzZpje+/QzIqtqnwus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789060937; c=relaxed/simple;
	bh=Z/EL8m3p40t6YBx9JR1JY7QZlZsnE/tkk5ba04yluv0=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dm/US217SipoyhvIonrbsz5rlprLQ9vIwCAnUigqd2heKYqReqwnLPCRcIoAGjF5YkEB8k++XOcQzqW9m2n+qB8UZ+tISbVu9jqPF31U+toU1lgtR7XOA5o6fPFYA3BrKS+a+yDfyE9zYISdGfhFFG5y3I5/oWQKjq9m0G9Ft/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXQSQ4FS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXQSQ4FS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6601F000FF;
	Thu, 10 Sep 2026 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789060924;
	bh=DoOf4vEHAPkHPeRNND2X8/TC0DAaXzcTo3VB54k9NJM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QXQSQ4FSE2QmqhHRjj9IT+737dbwYrYTha/LbkmxoNtiffJM5sJHttusSLUaUZI6B
	 7HkKsHnLnNTBS77s8KVWf6CP9OT65MyaUX1ZhNrKitK0efjYQdw9uakYsSrFwqjJis
	 6dNlVoNQMnSs3BtCU1igc7j3LXeneO5VMV1UXyElAuSpSr336Ob7mMIpAzvO9ijD1P
	 EggSbRW9++mHWWhWicHA6iGXkIttLXA5YagAOKAw30EDucDPb1jgtAwk/Zc1Qrgly7
	 iaQuFrnHgHZgGN1zIzAX/iD/I6W9J0MShlACDl/gpPrv40lPX6SKwnYEBdqa/3rAFu
	 Q3syHjMKohZXg==
Subject: Re: [PATCH net-next v3 3/4] selftests: openvswitch: add missing
 docstrings in ovs-dpctl.py
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 17:22:02 +0000
Message-ID: <178906092280.219967.16432524038911632507@kernel.org>
In-Reply-To: <20260908171859.1967327-4-houminxi@gmail.com>
References: <20260908171859.1967327-4-houminxi@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] The docstring added to print_ovsdp_full()
  (tools/testing/selftests/net/openvswitch/ovs-dpctl.py line 2940)…

--

selftests: openvswitch: add missing docstrings in ovs-dpctl.py

This adds one-line docstrings to the module, classes and methods in the
openvswitch selftest helper ovs-dpctl.py to silence pylint C0114, C0115
and C0116. No code behaviour is changed.

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 502e6eb4c4b4..dc88cb1b20c1 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py

[ ... ]

> @@ -2887,6 +2973,7 @@ class PsampleEvent(EventSocket):
>  
>  
>  def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=NDB(), vpl=OvsVport()):
> +    """Print full datapath state: stats, vports, and flows."""
>  	  dp_name = dp_lookup_rep.get_attr("OVS_DP_ATTR_NAME")
>  	  base_stats = dp_lookup_rep.get_attr("OVS_DP_ATTR_STATS")
>  	  megaflow_stats = dp_lookup_rep.get_attr("OVS_DP_ATTR_MEGAFLOW_STATS")

[Severity: Low]
Does print_ovsdp_full() actually print flows?  The body only emits the
datapath name, the values from OVS_DP_ATTR_STATS,
OVS_DP_ATTR_MEGAFLOW_STATS, OVS_DP_ATTR_MASKS_CACHE_SIZE and
OVS_DP_ATTR_USER_FEATURES, then one line per vport:

    print(f"  flows:{int(base_stats['flows'])}")
    ...
    # port print out
    for iface in ndb.interfaces:
        rep = vpl.info(iface.ifname, ifindex)
        if rep is not None:
            print(
                f"  port {int(rep.get_attr('OVS_VPORT_ATTR_PORT_NO'))}: "
                ...

The only flow-related output is the flows:<n> counter that comes from
OVS_DP_ATTR_STATS, which is already covered by "stats".

Flow enumeration lives in OvsFlow.dump(), and main() calls that only for
the dump subcommand, not on the show path that reaches
print_ovsdp_full().

Would something like "Print datapath statistics and attached vports." be
a more accurate one-liner here?

The commit message says "Each docstring describes the command or
attribute group the code actually implements", so this one looks like it
overstates the output.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908171859.1967327-1-houminxi%40gmail.com

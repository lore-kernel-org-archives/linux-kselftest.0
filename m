Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139480;
	b=tFrb7Pw7lepZhcN+Z2T/ijx7OAahK+JJg38OqhshSA2iJikXl+6FuAx5Hnfa7ClKSNra
	 MaPD54/tbiAsDkW2Ya1jghu49LaNpNoyF4Js8phQ90XRIlbt/MfQrmovaHdfJcv8cqSFc
	 1JPn6bolwQEHkKzihqqCpUtXnBGSZ7lJ4d6P7DpvwicqMmSDDjkKp0r7c2XckIGc1TnqB
	 BF1si4CD5GgtzTx5YSxDLIRpI69tC97SB40pa9mxYzSUoYKEFYuILH1GyF4IrVdEkT/6u
	 cdTzZqWDgg60Itw9rJ+M1mg3uijtpnTsJOyehZhKDOa8NZaVNPvxazYJr6w7hP0OyOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139480;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=T2Q43N/EmQfqSH6+WvASCF147eufwEc9GCOSIJRTPYc=;
	b=JaEa2qlYnSiFOQo2vgnGhLYTJdvafE+ilatorRXeauRJvXyTNgTR+fMNqIpoUXUeZsGD
	 WemgaZY0sondyPCi9o1Dx1FxmHyghF9qImZaBEII/PW66Gk8kzruBm0np3Mi53QNoQ/ly
	 MFQz20J+3sfrqfvBt3vAsjhtqu2jGR8mvvUWlvgnIj1iNJmXxFV69SWxGbe5Wuy8dzXac
	 AiMrqcTAqJEnUr+IqjfZv8LlumzOmQyYHNTcwlwJ4ft5DEvtPBlTcaQ6UTXNnYgRzAY9A
	 3Jvfi1ikfBKNxG7Rr6LrOUGXmNO/krvLZj+SjRIdo4S85KgLQq1TTOUfxSuWxF6CUBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V77POt1m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDD1606A322;
	Sun,  8 Nov 2026 12:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V77POt1m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012C51F008A1;
	Sun,  8 Nov 2026 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794139479;
	bh=T2Q43N/EmQfqSH6+WvASCF147eufwEc9GCOSIJRTPYc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=V77POt1mVoiWIGIeikZgyvrVsE8Zc8BPG+MpgPq6lulXuwY9PVhmDcDGWL51rSxOG
	 f4pKsNIaJOHv4a9dNuzQIiqVXUEBiFKqnxEcSRK0rRgERbZjGg6JYeKz98In2wTnd7
	 szDageKou6cBRR/2fCOlAakSlbruyauOe/wy39NEUAMexgPHlfuElB+8awxiDgn9e/
	 8Ie5F4G05VZRMzUvhS84AjTjDbwN048zwsLCoASSKNMVePcDh1QYCbJD5eKsJJsARC
	 XpMcSQiEwKZtL285X8ae3m4FCPwd7tspYYpWKDuiIoEZl0+LbxldYu6qiKFRuMvGdi
	 adjWB3GDahvew==
Subject: Re: [PATCH net v1 2/2] selftests/net/openvswitch: check that a failed
 set keeps the features
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, jhs@mojatatu.com,
 paulb@nvidia.com, dev@openvswitch.org, linux-kselftest@vger.kernel.org
Date: Sun, 08 Nov 2026 12:04:38 +0000
Message-ID: <179413947858.994134.617046081353196823@kernel.org>
In-Reply-To: <20261107113403.797779-3-houminxi@gmail.com>
References: <20261107113403.797779-3-houminxi@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The recirc-sharing round of the new test_dp_features()
  selftest (tools/testing/selftests/net/openvswitch/openvswitch.sh) can…
- [Low] The new `set-dp` subcommand in ovs-dpctl.py makes `--features`
  optional (default None), and OvsDatapath.set() only appends…

--

selftests/net/openvswitch: check that a failed set keeps the features

This patch adds a set-dp subcommand to ovs-dpctl.py that issues
OVS_DP_CMD_SET. It also adds a test_dp_features selftest. The test checks
that a rejected set request leaves the datapath user features unchanged,
first for the dispatch bit and then for the recirc sharing bit.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 21444657a0404..f26c01a17b498 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -1409,6 +1410,69 @@ test_netlink_checks () {
>  	return 0
>  }
>  
> +test_dp_features() {

[ ... ]

> +	# 4 is OVS_DP_F_TC_RECIRC_SHARING, which only exists when the tc skb
> +	# extension is compiled in. A rejected set that drops the bit must
> +	# leave the key alone, so the features have to stay as they were.
> +	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 4 \
> +	    &> /dev/null
> +	if [ $? -eq 0 ]; then
> +		info "a rejected set does not drop the recirc bit"

[ ... ]

> +	else
> +		info "tc skb extension is not available, skipping recirc"
> +	fi
> +
> +	return 0
> +}

[Severity: Medium]
Does this probe skip the recirc round on any failure, and not only when
CONFIG_NET_TC_SKB_EXT is missing?

ovs_dp_change() reports the missing option with -EOPNOTSUPP:

#if !IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
		if (user_features & OVS_DP_F_TC_RECIRC_SHARING)
			return -EOPNOTSUPP;
#endif

In that case set-dp exits with 95. Other failures also reach the else
branch, for example a Python exception, a missing datapath (both exit 1)
or a different errno.

In the else branch, info only writes to debug.log unless -v is given. The
function then returns 0, so run_test reports PASS rather than SKIP.

Could the probe check for 95 explicitly and return $ksft_skip, or at least
make the skip visible?

Also, tools/testing/selftests/net/openvswitch/config has neither
CONFIG_NET_CLS_ACT nor CONFIG_NET_TC_SKB_EXT. NET_TC_SKB_EXT is a bool
with no default, and openvswitch does not select it. Kernels built from
this fragment would therefore always skip this round.

This is the only round that touches OVS_DP_F_TC_RECIRC_SHARING and the
tc_skb_ext static key. The first round only toggles
OVS_DP_F_DISPATCH_UPCALL_PER_CPU, which never touches the key.

Should CONFIG_NET_CLS_ACT=y and CONFIG_NET_TC_SKB_EXT=y be added to the
config fragment? Without them, the statement "Both rounds fail without
the fix in the previous patch" in the commit message would not hold for
CI runs.

> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 1615843c225e4..be41ec72faf2a 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> @@ -2301,6 +2301,24 @@ class OvsDatapath(GenericNetlinkSocket):
>  
>          return reply
>  
> +    def set(self, dpname, ifindex=0, features=None, per_cpu_pids=None):
> +        msg = OvsDatapath.dp_cmd_msg()
> +        msg["cmd"] = OVS_DP_CMD_SET
> +        msg["version"] = OVS_DATAPATH_VERSION
> +        msg["reserved"] = 0
> +        msg["dpifindex"] = ifindex
> +        msg["attrs"].append(["OVS_DP_ATTR_NAME", dpname])
> +        if features is not None:
> +            msg["attrs"].append(["OVS_DP_ATTR_USER_FEATURES", features])
> +        if per_cpu_pids is not None:
> +            msg["attrs"].append(["OVS_DP_ATTR_PER_CPU_PIDS", per_cpu_pids])

[Severity: Low]
When --features is left out, OVS_DP_ATTR_USER_FEATURES is not sent.
ovs_dp_change() starts with user_features at 0 and stores it on every
successful set:

	u32 user_features = 0, old_features = dp->user_features;
	...
	dp->user_features = user_features;

Does that mean "ovs-dpctl.py set-dp <dp>" with no --features clears every
feature bit on the datapath?

Running "set-dp <dp> --per-cpu-pids 1,2" without "--features 8" also
looks surprising. The pid handling only runs under this check:

	if (user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU &&
	    a[OVS_DP_ATTR_PER_CPU_PIDS]) {

So the pid list is ignored and the features are cleared, but the tool
still prints "DP '...' updated" and exits 0.

The set-dp handler in main() already calls ovsdp.info(args.setdp, 0).
Could args.features default to the current OVS_DP_ATTR_USER_FEATURES from
that reply? Alternatively, the "Datapath user features" help text could
say that leaving out --features clears the features.

The new test always passes --features, so the test itself is not
affected.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261107113403.797779-1-houminxi%40gmail.com

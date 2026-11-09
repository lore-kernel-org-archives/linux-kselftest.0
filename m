Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230581;
	b=SXkMCBEJywHeG5Ijet1yC1zeecsxWDLFr8ikHyirbwqawIKe8+ygg5myXWfMtAoJjZAY
	 kMSwXnf4WTEGxLFwb+g9tsH4uZZJik23hJuMXzfGOY9hSaHbGcq2wXvNRES8CofVm/fkU
	 nry2KSMdqekaS/pyX2y09tMjBKBoNDXdzhmGghyL9bjXrBMkxbrx0UQsFzLmtXyr4/f0t
	 ZVpS/HqJ/6Hdu/foKXJn8+4mEEkdhUyJ2bLOo4tQx97AYwUh2gcQ11RezSZGT7mDI9/iX
	 Sa/GScc0+6GFtBpUAT1kdsg6afvPwJRZOwJR90jwd4mkhPgjkBx9ylp9wEx3oCRDX9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230581;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fhisNBn0BzaXUq5B1/963SsszL0EuOShr+ENAKfQrwc=;
	b=v/AG7Gx0Ii3ykicCFr0CcpZDNn/I9vij3CSdpmVRqgwyw2pNnpEqpGT7VVzbHyeKr+UA
	 wnd5PdJ1+WjYDuWVJYk9cekMoVEws6Zr6ToBLFFZUHGaaw1lvBIKsHS74g63YPT5FBaN/
	 Wum7tuw+hOFt83hrSRUSASr3+QzQtp5/lB4UxYjAcT+VPJlR5x/hZ2L1CmZte5oHe7WPR
	 qZr04fqTzX2xH5StcNz4LRoz+Q8p1425z4xwO2VnwDClkp/Q+xOzgcl2SLmlBx+P5wjXa
	 YRlTJQBK+m+RJiwH39H0NaGKMPT5Kj84hFcDWWdjIbL+JJSfYXS4rR/fFB3h2FqTRiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AxM5u3pn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E7606A334;
	Mon,  9 Nov 2026 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AxM5u3pn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995761F008A1;
	Mon,  9 Nov 2026 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794230581;
	bh=fhisNBn0BzaXUq5B1/963SsszL0EuOShr+ENAKfQrwc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AxM5u3pnulaZDTRxqBXOO7MtqN2VOJyKVjcnDvzdeEN1liBLquqhh3XSouvPi1Tdt
	 JPw3dADKY07MVX49sjw5HlAczRMdV7ZHEj7Et8HfnOMDwiCxjRqmCOH9Lfzlx5SKIv
	 JSYJFpE7l7jueWPEI+c8SeM5BDchwDETxCsB1MXOihMW+U+C49Sju4R6Nf30nAb4Vf
	 8Phkd1rTku0kJN+F94Nu8iJy4/j7nEY6Aw8Z84nd5OdNnEaRnSCwZMFyAJEFsV4E+0
	 INif3H54mcLlDW5v9WHRShC8SSOC8LD0e1IlpKaSC2vCLVey6u7EQrrx8oGoTVpsrp
	 zayG9XdZVF5dw==
Subject: Re: [PATCH net v2 2/2] selftests/net/openvswitch: check that a failed
 set keeps the features
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, jhs@mojatatu.com,
 paulb@nvidia.com, dev@openvswitch.org, linux-kselftest@vger.kernel.org
Date: Mon, 09 Nov 2026 13:23:00 +0000
Message-ID: <179423058020.994134.14656142555028492016@kernel.org>
In-Reply-To: <20261108123424.2825403-3-houminxi@gmail.com>
References: <20261108123424.2825403-3-houminxi@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In test_dp_features
  (tools/testing/selftests/net/openvswitch/openvswitch.sh), the…
- [Low] The patch adds CONFIG_NET_CLS_ACT=y and CONFIG_NET_TC_SKB_EXT=y
  to tools/testing/selftests/net/openvswitch/config but leaves out…
- [Low] selftests/net/openvswitch: unsorted CONFIG_NET_TC_SKB_EXT in
  config

--

selftests/net/openvswitch: check that a failed set keeps the features

This adds a set-dp command to ovs-dpctl.py and a new dp_features test to
openvswitch.sh. The test checks that a rejected OVS_DP_CMD_SET leaves the
datapath user features unchanged. It also adds CONFIG_NET_CLS_ACT and
CONFIG_NET_TC_SKB_EXT to the selftest config fragment so the recirc round
can run.

> diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
> index 15685d2428139..d93eac0f08f7b 100644
> --- a/tools/testing/selftests/net/openvswitch/config
> +++ b/tools/testing/selftests/net/openvswitch/config
> @@ -2,6 +2,8 @@ CONFIG_GENEVE=m
>  CONFIG_INET_DIAG=y
>  CONFIG_IP_SCTP=y
>  CONFIG_IPV6=y
> +CONFIG_NET_CLS_ACT=y
> +CONFIG_NET_TC_SKB_EXT=y
>  CONFIG_NETFILTER=y
>  CONFIG_NETFILTER_ADVANCED=y
>  CONFIG_NET_IPGRE=m

[Severity: Low]
This isn't in the right place in the sort order.

The fragment is kept sorted with underscores ignored, which is the
order the netdev selftest config checks expect. In that order
CONFIG_NET_CLS_ACT fits where you put it, before CONFIG_NETFILTER.

CONFIG_NET_TC_SKB_EXT does not. Compared without underscores,
NETTCSKBEXT sorts after NETFILTER, NETFILTERADVANCED, NETIPGRE and
NETIPGREDEMUX. It should go after CONFIG_NET_IPGRE_DEMUX=m and before
the CONFIG_NF_* entries, which is also where
selftests/net/forwarding/config has it.

Putting it straight after CONFIG_NET_CLS_ACT=y breaks the ordering
for the rest of the file. Could it be moved down in the next version?

[Severity: Low]
Should CONFIG_NET_SCHED=y be added to the fragment too?

Both new symbols sit inside the if NET_SCHED block in net/sched/Kconfig.
Nothing in the tree selects NET_SCHED, and OPENVSWITCH doesn't either:

net/sched/Kconfig:
    if NET_SCHED
    ...
    config NET_CLS_ACT
    	bool "Actions"
    ...
    config NET_TC_SKB_EXT
    	bool "TC recirculation support"
    	depends on NET_CLS_ACT
    ...
    endif # NET_SCHED

When the fragment is merged onto a base without NET_SCHED (for example
tinyconfig or allnoconfig plus the fragment), merge_config drops both
symbols. ovs_dp_change() then still returns -EOPNOTSUPP for
OVS_DP_F_TC_RECIRC_SHARING, and test_dp_features skips the recirc round.
That is the case the commit message says this change fixes.

hid/config.common and tc-testing/config both list CONFIG_NET_SCHED=y next
to these symbols.

Also, the commit message says:

    Select the key and the classful action support it depends on

The Kconfig prompt for NET_CLS_ACT is "Actions" (tc actions), not
classful actions. Could the wording be adjusted?

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 21444657a0404..e2aba1e40d559 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -1409,6 +1410,72 @@ test_netlink_checks () {
>  	return 0
>  }
>  
> +test_dp_features() {

[ ... ]

> +	sbx_add "test_dp_features" || return $?
> +	ovs_add_dp "test_dp_features" dpfeat || return 1
> +

[ ... ]

> +	ovs_sbx "test_dp_features" dp_features_set dpfeat --features 4 \
> +	    &> /dev/null
> +	rc=$?
> +	if [ $rc -eq 95 ]; then
> +		info "tc skb extension is not compiled in, skipping recirc"
> +		return $ksft_skip

[Severity: Medium]
Does this leave the dpfeat datapath behind on kernels without
CONFIG_NET_TC_SKB_EXT?

ovs_add_dp() creates the datapath but only queues its removal:

ovs_add_dp () {
	...
	ovs_sbx "$sbxname" python3 $ovs_base/ovs-dpctl.py add-dp $*
	on_exit "ovs_sbx $sbxname python3 $ovs_base/ovs-dpctl.py del-dp $1;"
}

The queued del-dp only runs from ovs_exit_sig. run_test() calls
ovs_exit_sig for OK and FAIL, but not for a skip:

	elif [ $ret -eq $ksft_skip ]; then
		printf "TEST: %-60s  [SKIP]\n" "${tdesc}"

The script-level EXIT trap doesn't catch this either. run_test runs its
body in a subshell, and ovs_dir is only set inside that subshell.

Every other test that skips after setting up the sandbox (dec_ttl,
icmpv6, psample, drop_reason, ct/nat) calls ovs_exit_sig right before
return $ksft_skip.

Without that call, the dpfeat datapath and its netdev stay on the host
after the run. Later runs then reuse it without any warning, because
add-dp reports "already exists" and exits 0.

Should ovs_exit_sig be called here before returning $ksft_skip?

> +	elif [ $rc -ne 0 ]; then
> +		info "the recirc set failed with $rc"
> +		return 1
> +	fi

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108123424.2825403-1-houminxi%40gmail.com

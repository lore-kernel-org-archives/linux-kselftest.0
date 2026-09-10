Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E1C484254;
	Thu, 10 Sep 2026 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043235; cv=none; b=Yw1Bv77QVBdJnhl7TN94nIvTNHQv3Y+Nc5jOnefG7GZaEYXhTmhJuSubEiOPcTdHkl0K6gZoiHwOtdzz94SrClmndaqlsyXG251kxrteYSxGcTdqTspb+Ujy0K9W8S4R6RxQr23GP1CVkh51gR4ISIpqdqeLpS1VbfAoBk/WfgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043235; c=relaxed/simple;
	bh=XS3EAcYLwnUqmUzTOvAWeHgJjnAcdWUI6NWrTs/TbEA=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oBODWX9/2tIzhsu9yYJjjV0S6VoTngyDOdYGUh4bsRwLRARGd2V8o2sclsKD8ccpK3OuoHXTWqBtYqLlZE1lwFBY/hLsM7BqTCTnny/+/ImzK0GWdHNFIpyKd9wmmKgMVi1l4e3Sw2ydWFSt7fVRx/+OJZeI1j728GTbvpbjuxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhcJenGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhcJenGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2651F00893;
	Thu, 10 Sep 2026 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043234;
	bh=P95AAuvzBO6JOelDPVoR2QHaxFSlmbYkQZsPoZIqGYg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OhcJenGPLMmX5ZZSSrtNyL0Je/XWkutzzmdGVPNkygdjqPH+Jgy6VPktrNt8vVMIs
	 QsCD9R2jF0f0a8IZqH5I/ebZq6K1W4M8x0xI4ZFZ/h5YpV1ZTrwai9wXgEKev19j3x
	 HX5YAafSFqu0GCr+KrLtJD4Eq83/SWPybCYy0PYGqa7eiOuYTMCtUyL4atBWkc9p/D
	 mhX8QM4vPbetsU9pLBs4I6IlWGBcoZnEbYpfIvPRHA9BB8nLk0HECvW4MuSPXQCxQK
	 R+D3EztZ64nxGySswXz7uAXixJNykUIlweK1CyfSeEXi8Q7+8C0Z6KaJVOLSXYQSo2
	 5j8K3GPr1ZQ9g==
Subject: Re: [PATCH net-next v4 2/2] selftests/net/openvswitch: add SCTP NAT
 test with port translation
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org
Date: Thu, 10 Sep 2026 12:27:12 +0000
Message-ID: <178904323283.219967.9770445964877842050@kernel.org>
In-Reply-To: <20260909122521.2687193-3-houminxi@gmail.com>
References: <20260909122521.2687193-3-houminxi@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] tools/testing/selftests/net/openvswitch/config gains
  CONFIG_NF_CT_PROTO_SCTP=y for the new test_sctp_nat_connect_v4 test…

--

selftests/net/openvswitch: add SCTP NAT test with port translation

Adds test_sctp_nat_connect_v4, which runs an SCTP association through a
ct(commit,nat(dst=ip:port)) DNAT and matches the translated tuple after
recirculation, plus CONFIG_NF_CT_PROTO_SCTP=y in the config fragment.

> diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
> index a825e0b5c88e..fa90475dc388 100644
> --- a/tools/testing/selftests/net/openvswitch/config
> +++ b/tools/testing/selftests/net/openvswitch/config
> @@ -7,6 +7,7 @@ CONFIG_NET_IPGRE=m
>  CONFIG_NET_IPGRE_DEMUX=m
>  CONFIG_NF_CONNTRACK=m
>  CONFIG_NF_CONNTRACK_OVS=y
> +CONFIG_NF_CT_PROTO_SCTP=y
>  CONFIG_OPENVSWITCH=m
>  CONFIG_PSAMPLE=m
>  CONFIG_VETH=y

[Severity: Medium]
Should this fragment also request CONFIG_NF_NAT=m (and
CONFIG_NETFILTER_ADVANCED=y, which the changelog says the SCTP conntrack
symbol needs)?

The new test's probe uses a nat() action, and net/openvswitch/Kconfig only
has:

	select NF_NAT_OVS if NF_NAT

so it never turns NF_NAT on itself.  In net/netfilter/Kconfig, NF_NAT is:

	config NF_NAT
		tristate "Network Address Translation support"
		depends on NF_CONNTRACK
		default m if NETFILTER_ADVANCED=n

With NETFILTER_ADVANCED=y and no iptables/nftables NAT option selected,
NF_NAT ends up n, and in net/openvswitch/conntrack.c the nat attribute is
compiled out:

	#if IS_ENABLED(CONFIG_NF_NAT)
			case OVS_CT_ATTR_NAT: {

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 1160f8ed7d8a..138a705fc359 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> @@ -1199,6 +1200,98 @@ test_nat_connect_v4 () {

[ ... ]

> +	# Check if the ct and nat actions can be configured.
> +	ovs_add_flow "test_sctp_nat_connect_v4" sctpnat4 \
> +		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
> +		'ct(commit,nat(dst=172.31.110.20:5555)),recirc(0x1)' \
> +		&> /dev/null
> +	if [ $? == 1 ]; then
> +		info "no support for ct/nat actions - skipping"
> +		ovs_exit_sig
> +		return $ksft_skip
> +	fi

[Severity: Medium]
Following on from the config question above: when NF_NAT is n, does this
probe in test_sctp_nat_connect_v4() always fail so the test permanently
returns $ksft_skip?

That would leave the SCTP arm of ovs_nat_update_key() with no coverage,
which is the path the changelog says is currently unexercised, and the loss
would be silent.  The existing test_nat_connect_v4() fails loudly instead:

	ovs_sbx "test_nat_connect_v4" ip netns exec client ping -c 1 -W 1 \
	    172.31.110.20 || return 1

Would adding CONFIG_NF_NAT to the fragment keep this test running on the
reference config?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909122521.2687193-1-houminxi%40gmail.com

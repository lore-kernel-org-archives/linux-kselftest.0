Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749361;
	b=vibTcjssxX27EYQ1LnVCX9bl3wxEUPh3WPL9OFxfcQoatUL4fGRL8FwasHkA/oBS0PzC
	 z3x/P2Cgc9eztMKX9tV0jvwZJt4FD6R1+du7fOO7IC5JDEZAGTHpLTMKNjsQUbrweOCwk
	 vyfUagOCw4QJCVGpLjYN7A6GVyXPAP6dPnAX5wrAcm42Ns0o2qPaBfVCtl1/aAC3uQwFI
	 USP7erHO9goXXh6j4cwQnP9xS9KpSeA41crs7quVbwJ6nA+zg1e46v/cNKGFd/nB+GVhx
	 InD486nMFr+spADPtmd+BEEKTDmvx8PtLA9ULR/RO5IhO0Y17EM/Tm6VkD55O9MQH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749361;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AwzPz1C3gIQ9+RIv9+cX+w6Gx9n1MzUYIRfzY2PwQrI=;
	b=b2rt/5zhkkff0ohQxaeTD3U68mzdxurFPZ0uEiEwi/yGsXO4t8qHcLpLlWn3IoYbT/V2
	 JfP+3qNvNqTaiUpLIkmbduw5U9KJaMq1TN1h00CDV2CwuxkiIopA9p0clnUuC37zWG6yx
	 BFMmeN48dsE4iiqIFfGfMCYZIYGFWeHLhGCc8BtzuI5IHcputLm8yd8AYGp8gHjJCl/3p
	 oozti8gsfEz3xjXuPM5ru4Aivg0f70WW+9BEOT2+PgBtpEfCvDWe7MYXA4T1zQQndYmQO
	 QyXtskRzNwr/368cmhyvbhJdDlvmDExnlySTuSeFC7lLxjWRQAy3Sli5/AJILutipMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZb4c+sk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3257606A682;
	Fri, 27 Nov 2026 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IZb4c+sk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D781F008A0;
	Fri, 27 Nov 2026 03:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749360;
	bh=AwzPz1C3gIQ9+RIv9+cX+w6Gx9n1MzUYIRfzY2PwQrI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IZb4c+skPttETRDu3hXQJ36R6SE9bS2sLQ+V+8YUn+YFT277Ua6/kD1PDXe7WHU9N
	 o8e5peTXRJfJY8YuzRtg2AkOIAaMS2EfbTzMv60vEwd+WTztjUoNnMYfzQjPdAZLox
	 n1FUGHemHuhTtcFTQKDCacHeh91Y4CuS1sC6uk4+903HTtGiZKHxKnsXnG09HbqxSi
	 vpCMgBQQt1pMIoyQetJndUWyJ69GcADm1f8mUNDIHd4w3sOKHhSPsjt3B06o1JhgC9
	 jFciok/Qx09NBDNdI+AG17j2Vax0Z6jqut2S/52J8EJOqg+WOpMfu9onwfJcXdcSiN
	 lx//5yXl8Al0Q==
Subject: Re: [PATCH net 3/3] selftests: bonding: add recovery updelay test for
 broadcast mode
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 tonghao@bamaicloud.com, razor@blackwall.org, shuah@kernel.org,
 jiangjiehua1@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 03:15:59 +0000
Message-ID: <179574935907.3135.6831461021438057155@kernel.org>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-3-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-3-188e5538d6ca@kylinos.cn>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new mode-3 cases in recovery-updelay.sh pass whether or not
  the companion fix "bonding: update slave array on link change for…
- [Low] The commit author is "Hangbin Liu <hangbin.liu@linux.dev>", but
  the only Signed-off-by is "Hangbin Liu <liuhangbin@kylinos.cn>".

--

selftests: bonding: add recovery updelay test for broadcast mode

This merges the mode 1 and mode 2 recovery updelay selftests into one
recovery-updelay.sh script. The script now also covers bonding mode 3
(broadcast), and the Makefile installs the merged script.

> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

[Severity: Low]
The Author: line is "Hangbin Liu <hangbin.liu@linux.dev>", but the only
Signed-off-by is "Hangbin Liu <liuhangbin@kylinos.cn>". Won't checkpatch.pl
report this as a From:/Signed-off-by: email mismatch?

Could a From: line that matches the sign-off identity be added to the body?
Adding a sign-off from the author address would also work. The other two
patches in the series appear to have the same mismatch.

[ ... ]

> diff --git a/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay.sh b/tools/testing/selftests/drivers/net/bonding/recovery-updelay.sh
> similarity index 72%
> rename from tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay.sh
> rename to tools/testing/selftests/drivers/net/bonding/recovery-updelay.sh
> index 9d26ab4cad0b3..05edf9915cc0a 100755
> --- a/tools/testing/selftests/drivers/net/bonding/mode-1-recovery-updelay.sh
> +++ b/tools/testing/selftests/drivers/net/bonding/recovery-updelay.sh
> @@ -34,12 +34,11 @@ cleanup()
>  trap cleanup 0 1 2
>  
>  lag_setup_network

[ ... ]

> +
> +for mode in 1 2 3; do
> +	for delay in 0 200 500 1000 2000 5000 10000; do
> +		test_bond_recovery mode "${mode}" miimon 100 updelay "${delay}"
> +	done
> +done

[Severity: Low]
Do the new mode 3 cases pass whether or not the companion fix "bonding:
update slave array on link change for broadcast mode" is applied?

After the flap, test_bond_recovery() in lag_lib.sh only checks that ping
works again:

tools/testing/selftests/drivers/net/bonding/lag_lib.sh:test_bond_recovery() {
    ...
	slowwait 2 ip netns exec ${CLIENT} ping ${SWITCHIP} -c 2 -W 0.1 &> /dev/null
    ...
}

That covers the case where no slave is usable, so updelay is ignored. The
companion fix handles the opposite case. There, a stale usable_slaves
snapshot with count == 0 makes bond_miimon_inspect() set ignore_updelay
on every pass:

drivers/net/bonding/bond_main.c:bond_miimon_inspect() {
    ...
		if (usable_slaves && usable_slaves->count == 0)
			ignore_updelay = true;
    ...
}

Without the fix, this is what happens:

- create_bond() enslaves eth0 and eth1 with updelay > 0.
- bond_enslave() puts both slaves in BOND_LINK_BACK.
- bond_update_slave_arr() builds usable_slaves with count == 0, because
  bond_slave_can_tx() requires BOND_LINK_UP.

In broadcast mode nothing rebuilds that array on link change.
bond_miimon_link_change() has no BOND_MODE_BROADCAST case. The rebuilds in
bond_open() and the NETDEV_CHANGE handler only run when
bond_mode_can_use_xmit_hash() is true. So recovery is always immediate,
and the test still passes.

Could a case be added that checks a slave still waits out updelay while
another slave is usable? Without one, the companion fix has no test
coverage. The revert patch says the two patches together "keep
ignore_updelay correct in both directions", but only one direction is
tested.

Also, slowwait waits 2 seconds, so the delays from 0 to 1000 ms appear to
pass even with 45fc134bcfad still applied. Only the 2000 (borderline), 5000
and 10000 ms cases seem to tell the two behaviours apart.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-bond_broadcast_updelay-v1-0-188e5538d6ca%40kylinos.cn

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D903243DEDB
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166707; cv=none; b=cv7M5Y9J5rJKilyvfHv1B+55oYP1hWAQWCrJXbJc4dYRu5q2JNnnCxiHJhCbHGH6U++xvFeDCKl30F1IUru1FQ8QovneFCmo1JGZnzhKPzMXwBocKU3BHSvog+jgZjb44vUBwNCvW9c8db+Gvut7+23ZkjM9iwhXb7naa6xUcTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166707; c=relaxed/simple;
	bh=8x/UT7yNCTBqE0gUbAyrfvJfTd1tBx2IpOQcX0TQguA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=klMUUCVbGX+JACGwM3YB3W83tnlk+13a/DqlazqEn0WO5YSD0knQkCQLiATe+aDQ39WxiuJIeZNvjrq7j49Ui0WerkIoHbQYhq1wya152cuCkrFpX2ue1g5eWPUAYFvFrzzmtUA3w+DWlJNA4cpUFRXGLW/SWZgKHv74DDfFDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3Z1dajA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F79zTtP/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3Z1dajA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F79zTtP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790166699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy4LAVksYVGANuIsEoVI9Hlhk9VjhocmxupJMIEdc3A=;
	b=I3Z1dajAXntSF8JdkDSgAO+hE0GWqcAQB0xQSvo5MVokXMSfW7SFQRHrPZAj419cFQL4/5
	JMy5C96a6xq6Wmd65Gy/vRjFfjs3RmlNHKrw1bkw37Dto/eDBwhTW2ik0bVSWd5Q1XULMI
	vxN0mu4uB+sGj0ECuuSXd6AOCIr5laQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-CAr5eZR4P1WV1IqUpvDePw-1; Wed, 23 Sep 2026 08:31:37 -0400
X-MC-Unique: CAr5eZR4P1WV1IqUpvDePw-1
X-Mimecast-MFC-AGG-ID: CAr5eZR4P1WV1IqUpvDePw_1790166696
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6c17ec1dso10506695e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790166696; x=1790771496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Iy4LAVksYVGANuIsEoVI9Hlhk9VjhocmxupJMIEdc3A=;
        b=F79zTtP/hh7NXSoV0hgTs0XnfR0n4jFilo5p8MnmpgqprgRUuqcW5/J9C9TUXONxYi
         jaaCIecJqR3X24e5JHGHiCV7pGhzBPVz69Een4oCwzkHvoLu/xiNZ/BqbJdjk4Fwb/2X
         /aIoFXxyZdTulerNfORiCaEOkfcZvxawhWDgZVaTFs+8tRRq1czNE4teKZo9Uf2/TtYl
         W5n1b+bPCAUOOdlJDsNBqBwR5DDfwvxpfAcCdBIEG6P8Fb9ltN/gonqqee/gr0au9Ace
         +WCb3wPFurTmNgf83Mlh3mmQS7jZkWCmmmaWTp1nSJjsVcNmyhohjS0c1uvyIvldYDtF
         qaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166696; x=1790771496;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iy4LAVksYVGANuIsEoVI9Hlhk9VjhocmxupJMIEdc3A=;
        b=IiaSNw0F5o6ZBO+j9mdmE/lm+3vnS2Q924cNI9Sut4/aX9t3VPjXJdcNMHXQt97TC4
         uPbSs2mNd3kNviPMkWQN/iLdS2kUGkdzM3oBJuCLSoRFrJDeXwkq4gYX7kvvxM2Y8i7L
         XWLn2+mpdnrA8dZf0cKxlmwrJ8Wh8RWnGtOXKuR1kvBChFQd/nYXOarmHi4NZ9Uysozb
         fnUu76Nn77VUgsdr7MlC/NIOfHWWMgAfdvIpm0Ef7DDJ1/3GKnQ33pQYJwEMGj2I23T2
         IV3/jFV56uhvaE0m8GFQSAJ0u3086zKrOMqVEzK4REJEOMv7JFIql5lBqya3pW8yalOr
         /7Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxjVr7CpPBuMV7xt/tRRymx4hEJ/qU5Q00UsLjEzUZsBfI2kKvAv3YkvG949k6G2Gg1bXf71r86e8Y595KScxI=@vger.kernel.org
X-Gm-Message-State: AFuF++nGPvUJrlVtoyGzF/4KBkct3dvsYh7gQ5ax3piLDgOsuoaYNvVO
	lgXWusofDqzfG9Yho9PH2ZD4CZLXYDucREWlum9hAgpwbCHo0GuSD6FCRExyKV9lgRkYbif49U7
	X9cIvDFWum2d7x8y4Uv1TPVrib3yMhEy497yRqskkrhV4aEu2PnrFc1LyBE+toqtE7v+TKSM7fP
	GbBwtJhcLY34Iv/2YeVP5LMuwUwVtrZxcDzk2gEKhsS4L5JcAzBKvjciw=
X-Gm-Gg: AYBFou2v5U6iq17v8IWyvXY5e+yzSR2jgOp0SdzpCJ+Ha/JRhg1JfD/WiflVu5uVMXq
	KXV1kD3qRSt32nzW7j0Ueubezb2mHSBUqTMhLj84N4tzewE9ZqIQQ/N4Qqiw3Uobt+btI1oQtyI
	pq3QfcYmoxFX+NMtstBVRKZzA57EnwuogfIPFqMjV66vsvVhfie7/vt521kNygHmP1zFhuLo5gO
	fnkP5N6luUAxDTkcO3v8Wj0h+xlg+DqHJiWQb7ptzjh9P5ku3OjeLy22k/5AqJb1qafBlIJs/TB
	va+VFvkaWD1EslgKHvGZXW8nAmqKJ6Knh1geqt7doSnJV3CU3HDd8oenMCWVCm+kOzs3lnqIeXl
	xkEREPdQu7PRjCWUbM3H1D2DWCaCW
X-Received: by 2002:a05:6000:4023:b0:487:10b5:a88a with SMTP id ffacd0b85a97d-4886705fb90mr4236763f8f.9.1790166696320;
        Wed, 23 Sep 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:a05:6000:4023:b0:487:10b5:a88a with SMTP id ffacd0b85a97d-4886705fb90mr4236704f8f.9.1790166695767;
        Wed, 23 Sep 2026 05:31:35 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a19bsm7197338f8f.25.2026.09.23.05.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:31:34 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: netdev-bot+sashiko@kernel.org
Cc: houminxi@gmail.com,  netdev@vger.kernel.org,  echaudro@redhat.com,
  i.maximets@ovn.org,  davem@davemloft.net,  edumazet@google.com,
  kuba@kernel.org,  pabeni@redhat.com,  horms@kernel.org,
  shuah@kernel.org,  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP
 flow key test over IPv6
In-Reply-To: <179008950943.2160803.15856491533624064435@kernel.org>
	(netdev-bot's message of "Tue, 22 Sep 2026 15:05:09 +0000")
References: <20260918144647.2024095-2-houminxi@gmail.com>
	<179008950943.2160803.15856491533624064435@kernel.org>
Date: Wed, 23 Sep 2026 08:31:31 -0400
Message-ID: <f7tpky49mjg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

netdev-bot+sashiko@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] The promised skip when IPv6 is unavailable is incomplete in
>   test_sctp_connect_v6().
>
> --
>
> selftests/net/openvswitch: add SCTP flow key test over IPv6
>
> This adds test_sctp_connect_v6 to the openvswitch selftest, mirroring the
> existing IPv4 SCTP test: icmpv6() flows forward neighbour discovery while
> ipv6(proto=3D132),sctp(dst=3D4443)/sctp(src=3D4443) flows gate an SCTP
> association across the datapath, with a keyless ipv6(proto=3D132) install
> expected to be refused with EINVAL.
>
>> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh
>> b/tools/testing/selftests/net/openvswitch/openvswitch.sh
>> index a31f7fb6882d..aa84fafc3201 100755
>> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
>> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
>
> [ ... ]
>
>> @@ -700,6 +701,114 @@ test_sctp_connect_v4() {
>>  	return 0
>>  }
>>=20=20
>> +# sctp_connect_v6 test
>> +# - sctp(dst=3D4443) matches client-to-server INIT
>> +# - sctp(src=3D4443) matches server-to-client INIT-ACK
>> +# - icmpv6 NS/NA flows forward neighbour discovery
>> +# - remove flows and verify connection fails, reinstall and recover
>> +test_sctp_connect_v6() {
>> +	local t=3D"test_sctp_connect_v6"
>> +	local v6=3D"eth_type(0x86dd),ipv6(proto=3D132)"
>> +	local payload=3D"SCTP6_DATA_OK"
>> +	local rxfile=3D"${ovs_base}/${t}/sctp-rx.txt"
>> +
>> +	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
>> +	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
>> +	socat -V 2>&1 | grep -q "define WITH_IP6" || return "$ksft_skip"
>> +	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"
>
> [Severity: Medium]
>
> Is this gate enough to cover the case the changelog describes as "IPv6 is
> unavailable"?  /proc/sys/net/ipv6 only tells us inet6_init() ran.  Only
> ipv6.disable=3D1 short-circuits it:

We don't do much to check that ipv6 is available.  The ICMPv6 test
doesn't do any additional safeguards.

> net/ipv6/af_inet6.c:inet6_init() {
> 	...
> 	if (disable_ipv6_mod) {
> 		pr_info("Loaded, but administratively disabled, reboot required to enab=
le\n");
> 		goto out;
> 	}
> 	...
> }
>
> With ipv6.disable_ipv6=3D1 instead, initialization completes and the sysc=
tl
> tree exists, so this check passes, but the module default is copied into
> every new netns:
>
> net/ipv6/addrconf.c:addrconf_init_net() {
> 	...
> 	/* these will be inherited by all namespaces */
> 	dflt->autoconf =3D ipv6_defaults.autoconf;
> 	dflt->disable_ipv6 =3D ipv6_defaults.disable_ipv6;
> 	...
> }
>
> so the veths created for the client and server namespaces come up with
> cnf.disable_ipv6 set, and address assignment is rejected:
>
> net/ipv6/addrconf.c:ipv6_add_addr() {
> 	...
> 	if (idev->cnf.disable_ipv6) {
> 		NL_SET_ERR_MSG_MOD(extack, "IPv6 is disabled on this device");
> 		err =3D -EACCES;
> 		goto out;
> 	}
> 	...
> }
>
> Would testing something that reflects usability, for example whether an
> address can actually be added in a test namespace, match the promised skip
> better?

We don't generally have a check for this.  Maybe it makes sense, but
that could be a separate cleanup if it really is needed.

>> +
>> +	sbx_add "$t" || return $?
>> +	ovs_add_dp "$t" sctp6 || return 1
>> +
>> +	info "create namespaces"
>> +	for ns in client server; do
>> +		ovs_add_netns_and_veths "$t" "sctp6" "$ns" \
>> +		    "${ns:0:1}0" "${ns:0:1}1" || return 1
>> +	done
>> +
>> +	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
>> +	ip netns exec client ip link set c1 up
>> +	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
>> +	ip netns exec server ip link set s1 up
>
> [Severity: Medium]
>
> These four setup commands in test_sctp_connect_v6() discard their exit
> status, unlike the surrounding calls which all use "|| return 1".  If the
> ip addr add calls fail with EACCES because disable_ipv6 was inherited by
> the new namespaces, does the test keep going with no IPv6 addresses
> configured and then report a failure at the association check below?
>
> Would checking these with "|| return $ksft_skip" (or at least
> "|| return 1" with an info message naming the failed step) make the
> outcome match the cause?

See above - same answer.

> [ ... ]
>
>> +	info "verify SCTP association with port-keyed flows"
>> +	ovs_sbx "$t" ip netns exec client \
>> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null=
 \
>> +	    || return 1
>
> [Severity: Medium]
>
> This is the point where an unusable IPv6 setup surfaces.  With
> ipv6.disable_ipv6=3D1 the connect cannot succeed, so run_test() reports F=
AIL,
> while the changelog says:
>
>     Skips when the sctp module is missing, socat lacks SCTP or IPv6
>     support, or IPv6 is unavailable
>
> Should this configuration end up as a skip rather than a failure, or shou=
ld
> the changelog be narrowed to say the skip only covers IPv6 not being
> initialized at all?

I don't think either is needed for this series.


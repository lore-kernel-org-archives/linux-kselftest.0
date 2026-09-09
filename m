Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E62583ABB
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964134; cv=none; b=oGEZWA8Dwh6kC3uvc8gI23isKnwcPBPxKdYZ1vmceTrPfjTgYANtSytuFObT6yDCwE93fX+vFkUhbd+TcGh/nwKUoH2iPCb8yzBpQy7WnNIMvtqG5cblAyBPKtqyI6kdPaAdolbH/jZOdSwE1j2LnaZleaysPgcLWQGCudU4vPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964134; c=relaxed/simple;
	bh=5q5Kxm1o6yjpU0G2siLoIK/IYDFj/Yajqsg2XUqzmxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EDAMf0bzuyzbzpeg6Hx0bTVETlmf8/QfdeGsqvkrD3Dx145EWNzwkD6Pq1BxWHvuediofcTDU1xZbbtnM86mDZlkpi5CdNJ/O8+Kaj7yGqiMbhHuw8HYWRZTz94RUGT+LrW4VCHerRJ5Hrt9Vnjznucl2MKkznyX7OxfkwLOTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJGsrI6e; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hg/82Qv4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BJGsrI6e";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hg/82Qv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788964132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pw4e6oik4dRUDIn5qml2Np190c3xmC7+uPRws27S9Ko=;
	b=BJGsrI6eNmBO6On+zqfDBZHCaYPLwFI/T7mbQY/edg/GJMBQvZgtymnEt6WvptHsXf0NLJ
	GPhy7GKwuOL4f1aH3WFkEu8r5UpBpWvPHC4M3+v4bwNOf1WN3jS1oVWoGRIPZLncb+W3zA
	/dDqjY8BlCxZuSA933f8tRivs27X92k=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-HVkzzSfPPgSZzLSLtqc4kA-1; Wed, 09 Sep 2026 10:28:48 -0400
X-MC-Unique: HVkzzSfPPgSZzLSLtqc4kA-1
X-Mimecast-MFC-AGG-ID: HVkzzSfPPgSZzLSLtqc4kA_1788964128
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso8348562b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788964128; x=1789568928; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pw4e6oik4dRUDIn5qml2Np190c3xmC7+uPRws27S9Ko=;
        b=Hg/82Qv4t+B3UNtfe7xQvlV8voTWqcNEQXPAWUwf0U/zNaUZ3BbAA62/JPpiJZ6C9a
         heWu4XyP+tIDBQIuYRpGD1AEv9OYjzCi2eO5r8zdKdmutxxbBfK8NAUeC3sGLnayii59
         wygPcl8wRN0zhqdZ7tqWosvovariDTSqu4FLEDzKfeYl+O8JRPqPARsaMMI4ffeKNczB
         RbDjhCHdP+OfzneI/WG0LQsBRXLlzJfQY3hVhg0bj/3OiadZov3/bc1NwJORGRFdbJb5
         HU+Tk3WFVL3e8wbjgEVtULOByeY9zkX7Rs7441IV+qfp+vOUV9KqaRXj70RPsemzRRDh
         p7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964128; x=1789568928;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Pw4e6oik4dRUDIn5qml2Np190c3xmC7+uPRws27S9Ko=;
        b=BDv3wa1NLbwoRxbquzlhViupVVGRyTvbm7XoP5I7hxLlJL/1yqdTIClHW396mxluRI
         LlHukfWg555AEVxaVTDRU8MUT1yCBdcU0OV20VK89QHm1J6M1tHQ8lC66gCJU3MuqdQj
         Ud/+eKlhsv7dYTy6uv5DXGfNwMA4JmIZ1T9DaAKsBhgenPZpHZ3TNN5sGjvix6APSHAw
         LhhN2c3J3Nx+kQuEflwHMOQT6IGEhRGwuAaNvSqVwDuHlyVdQDH1MrpPyH72lnS5PBCw
         hBtwfpn63wVC2PtCkeplbnqAuIrp5ICN0N/i9DjeVWaRAyzBi4uY6wMAQOtBdMGWvYdw
         1KXg==
X-Forwarded-Encrypted: i=1; AKwUvBxS2yoaGgl5WJ3mnpu9mWr+RLovNPumePNmnf5ZGs/4st4FV1Ytw2+M1XAT+M5S3rUPqCdj+DzHluk73E5/EqI=@vger.kernel.org
X-Gm-Message-State: AFuF++nw7B9Ljc0AQEdM5gR237Z1ZEZRCeThzkDUSTmgFNvTTPXtkh+v
	xgEzOW8z+dDpmU/MD0T56gC4BgPPfzAmoeR5LCxWKUVBV6AySEPOeFhRcmJIkbBOUjmaNQkD9vx
	HCCU8UNLT1pn66Q0EjQ/Qctd8txm1GhLcM+i0wtilBxvTrHNkgVjzTkPcFgtb1YXTOT7hQg==
X-Gm-Gg: AYBFou1CFlrtzK48pm6/a3WdLVVC03F5RWxI8w3GW69zqrLjCglXNYd7/6MBYb02lqp
	eDUUnByH6KzBw81o0JqfjopwYyzCdfc2CC7TgrMreNHjZCh1aTlvPdHpKGgDs9NdfCZqdJBNCwu
	HROLokUZmxKTUjwdlDiaQ96/uEzwCaGCpwjZv8B28MJe2C7IHKSa/EmJKFcyuQY8R+8QCYLcmiB
	xgSr5QNYN8oDuye4VApJe7S5BxnEqUqPETCNkXSoF/JiUAVVY8iregN0fe57LStDQcIDPw3CzKP
	dNLviEXsBqkj7hG+SLoWL9q+J1mp/2QrPjA0ZPQQf+DVUKVqkgF9BL+2Bc37VC/spAXlcBO/Hi6
	1yjjlrbezYYErC8CFjFGAnXBRIeHy
X-Received: by 2002:a05:6808:130a:b0:4bc:d58d:6cff with SMTP id 5614622812f47-4bcd58d8b6dmr10621174b6e.43.1788964127876;
        Wed, 09 Sep 2026 07:28:47 -0700 (PDT)
X-Received: by 2002:a05:6808:130a:b0:4bc:d58d:6cff with SMTP id 5614622812f47-4bcd58d8b6dmr10621128b6e.43.1788964127326;
        Wed, 09 Sep 2026 07:28:47 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96babc2c3sm18029742b6e.0.2026.09.09.07.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:28:45 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  kuba@kernel.org,  pabeni@redhat.com,
  edumazet@google.com,  horms@kernel.org,  shuah@kernel.org,
  linux-kselftest@vger.kernel.org,  dev@openvswitch.org
Subject: Re: [PATCH v3 1/2] selftests/net/openvswitch: add SCTP flow key
 test over IPv6
In-Reply-To: <20260906165251.1176875-2-houminxi@gmail.com> (Minxi Hou's
	message of "Sun, 6 Sep 2026 12:52:50 -0400")
References: <20260906165251.1176875-1-houminxi@gmail.com>
	<20260906165251.1176875-2-houminxi@gmail.com>
Date: Wed, 09 Sep 2026 10:28:43 -0400
Message-ID: <f7t33vio5wk.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Minxi Hou <houminxi@gmail.com> writes:

> The merged SCTP test covers only IPv4. The SCTP branch of the IPv6
> extractor (the proto=132 walk after parse_ipv6hdr) and the v6 side of
> the SCTP netlink validation (match_validate() requires the sctp() key
> whenever ipv6(proto=132) is matched) have no selftest coverage.
>
> Add test_sctp_connect_v6 mirroring the v4 test: bare icmpv6() flows
> forward NS/NA, and ipv6(proto=132),sctp(dst=4443)/sctp(src=4443)
> flows gate the association in the same three phases (flows installed,
> removed, reinstalled). After the association succeeds the test also
> pushes a known payload across and waits for the listener to log it,
> proving the datapath carries the association's traffic end to end,
> not only its handshake. Skips when the sctp module is missing, socat
> lacks SCTP support, or IPv6 is unavailable; an association or payload
> failure with the flows installed fails the test.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
>  .../selftests/net/openvswitch/openvswitch.sh  | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a31f7fb6882d..0926e304ed88 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -34,6 +34,7 @@ tests="
>  	trunc					trunc: output truncation
>  	icmpv6					icmpv6: ICMPv6 echo type match
>  	sctp_connect_v4				sctp: SCTP flow key matching
> +	sctp_connect_v6			sctp6: SCTP flow key matching over IPv6

This series has a spacing alignment issue in the test list (line 37
doesn't align with the others).  This is the third version where basic
formatting issues appear in this same block, and it is indicative of a
larger problem.  I do understand you're trying to address feedback in a
timely fashion.

I need to be direct: submitting patches with preventable formatting
issues suggests they're not getting a careful final review before
firing off 'git send-email'.  These kinds of errors create unnecessary
review cycles and CI burden.

Before submitting, please review your own patches with the same care a
maintainer would.  You should be checking the functionality, and the
architecture, yes.  You should make sure all of the feedback is
addressed, yes.  BUT you also need to care for formatting, alignment,
and style consistency.  A pre-submission checklist might help catch
these.

I'm setting this series aside for now.  Please resubmit when you've had a
chance to do a thorough self-review.  That may take more than 24 hours.
Please don't rush this important pre-submission step.

>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -700,6 +701,100 @@ test_sctp_connect_v4() {
>  	return 0
>  }
>  
> +# sctp_connect_v6 test
> +# - sctp(dst=4443) matches client-to-server INIT
> +# - sctp(src=4443) matches server-to-client INIT-ACK
> +# - icmpv6 NS/NA flows forward neighbour discovery
> +# - remove flows and verify connection fails, reinstall and recover
> +test_sctp_connect_v6() {
> +	local t="test_sctp_connect_v6"
> +	local v6="eth_type(0x86dd),ipv6(proto=132)"
> +	local payload="SCTP6_DATA_OK"
> +	local rxfile="${ovs_base}/${t}/sctp-rx.txt"
> +
> +	modprobe -q sctp 2>/dev/null || return "$ksft_skip"
> +	socat -V 2>&1 | grep -q "define WITH_SCTP" || return "$ksft_skip"
> +	[ -e /proc/sys/net/ipv6 ] || return "$ksft_skip"
> +
> +	sbx_add "$t" || return $?
> +	ovs_add_dp "$t" sctp6 || return 1
> +
> +	info "create namespaces"
> +	for ns in client server; do
> +		ovs_add_netns_and_veths "$t" "sctp6" "$ns" \
> +		    "${ns:0:1}0" "${ns:0:1}1" || return 1
> +	done
> +
> +	ip netns exec client ip addr add fd00::1/64 dev c1 nodad
> +	ip netns exec client ip link set c1 up
> +	ip netns exec server ip addr add fd00::2/64 dev s1 nodad
> +	ip netns exec server ip link set s1 up
> +
> +	# NS/NA forwarding
> +	ovs_add_flow "$t" sctp6 \
> +	    'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp6 \
> +	    'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
> +	    '1' || return 1
> +
> +	# SCTP port matching: dst for request, src for reply
> +	ovs_add_flow "$t" sctp6 \
> +	    "in_port(1),eth(),$v6,sctp(dst=4443)" \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp6 \
> +	    "in_port(2),eth(),$v6,sctp(src=4443)" \
> +	    '1' || return 1
> +
> +	ovs_netns_spawn_daemon "$t" "server" \
> +	    socat -u -t 1 SCTP6-LISTEN:4443,fork \
> +	    OPEN:"$rxfile",creat,append
> +	ovs_wait sctp_eps_has server 4443 || return 1
> +
> +	info "verify SCTP association with port-keyed flows"
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
> +	    || return 1
> +
> +	info "verify SCTP DATA chunk crosses the datapath"
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" \
> +	    <<< "$payload" || return 1
> +	ovs_wait grep -q "$payload" "$rxfile" \
> +	    || { info "server did not receive SCTP DATA payload"
> +	         return 1; }
> +
> +	ovs_del_flows "$t" sctp6
> +
> +	info "verify connection fails without flows"
> +	ovs_add_flow "$t" sctp6 \
> +	    'in_port(1),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp6 \
> +	    'in_port(2),eth(),eth_type(0x86dd),ipv6(proto=58),icmpv6()' \
> +	    '1' || return 1
> +
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
> +	    >/dev/null 2>&1 \
> +	    && { info "connection should fail without flows"
> +	         return 1; }
> +
> +	info "reinstall flows and verify recovery"
> +	ovs_add_flow "$t" sctp6 \
> +	    "in_port(1),eth(),$v6,sctp(dst=4443)" \
> +	    '2' || return 1
> +	ovs_add_flow "$t" sctp6 \
> +	    "in_port(2),eth(),$v6,sctp(src=4443)" \
> +	    '1' || return 1
> +
> +	ovs_sbx "$t" ip netns exec client \
> +	    timeout 3 socat -u STDIN "SCTP6-CONNECT:[fd00::2]:4443" </dev/null \
> +	    || return 1
> +
> +	return 0
> +}
> +
>  # psample test
>  # - use psample to observe packets
>  test_psample() {


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BA38F947
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 17:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926812; cv=none; b=slTb1wI3lQif8tzpsykhndgHFS6ne/EvZCFtEpCATJrUrkshFCf05tRCSTbTA+xR+3GZZvbyVdZ2/ja1yTclPii9U0dc7mXXTbBHJ8jvaKgUU0ROK2jeS7Th+lbILDjsR0ra/u7IuX6QotyqHxZWaenUHkWCQXR1pZQ5xvq8b2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926812; c=relaxed/simple;
	bh=7UEHOxjpf1RZfoI3R9qQR6jFUnvNcPN68KSn3tDiX34=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r4cpGiaavntqE5rDPHcpfZ001w1TcZJh2SxeibU5iWGsWuwEEA1Zofs99OnOynjN0S1vugx2vjcMPIXv+Uugav4PMaA1gUH0elXdDURy6bTgVmwxhK0ByPE+9y7bAluynKFdG7hK/gwJHE46pxE6U9GGl6jgtmfSp/kvsZE0s9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VsEcX+nK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VsEcX+nK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782926809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpY/TtcLsNQNp6y7nANvL4cIqjFKgOOo69hrHs2qUsI=;
	b=VsEcX+nKT53VQe6K1h3/jmAyVyC6F/+1XAKhAukUrYagvJydEep426CSoeOVhJyXKGJtzw
	uMi3Nm12Hl9v6cnJOoFI9X1ZvIkIlsV6FPYj/sBjyfBy05BquDhVaeENv5ku7Dd63ajr09
	wlRo2p91nbkZnFYni6HsgmSX1GmxHAM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-HqXJenIiPTqWN95tZzp4yw-1; Wed,
 01 Jul 2026 13:26:44 -0400
X-MC-Unique: HqXJenIiPTqWN95tZzp4yw-1
X-Mimecast-MFC-AGG-ID: HqXJenIiPTqWN95tZzp4yw_1782926803
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA4FE184A0B5;
	Wed,  1 Jul 2026 17:26:43 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B45930001BE;
	Wed,  1 Jul 2026 17:26:42 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] selftests/net/openvswitch: add output truncation test
In-Reply-To: <20260630102208.29140-1-houminxi@gmail.com> (Minxi Hou's message
	of "Tue, 30 Jun 2026 18:22:08 +0800")
References: <20260630102208.29140-1-houminxi@gmail.com>
Date: Wed, 01 Jul 2026 13:26:41 -0400
Message-ID: <f7tik6y4o4u.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Minxi Hou <houminxi@gmail.com> writes:

> Add test_trunc exercising the OVS_ACTION_ATTR_TRUNC action. The test
> verifies truncation in three steps: first confirm normal forwarding
> works, then apply trunc(14) which truncates packets to the Ethernet
> header and verify ping fails, then restore normal forwarding and
> verify connectivity recovers.
>
> The trunc action sets OVS_CB(skb)->cutlen, causing pskb_trim at
> output time. With trunc(14) the IP payload is stripped, so the
> receiver drops the frame and ICMP echo reply is never generated.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

NOTE: The subject should have had net-next I think

>  .../selftests/net/openvswitch/openvswitch.sh  | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 2954245129a2..fef21eb4a129 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -32,6 +32,7 @@ tests="
>  	dec_ttl					ttl: dec_ttl decrements IP TTL
>  	flow_set				flow-set: Flow modify
>  	action_set				set: SET action rewrites fields
> +	trunc					trunc: output truncation
>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -443,6 +444,71 @@ test_action_set() {
>  	return 0
>  }
>  

Most of the tests have a comment in front of them that does some
description.  I haven't been good about enforcing it, but at least I'd
like to see it here to describe what trunc limits are being tested (in
this case, just limiting to 14).

Perhaps we can also add testing for trunc(1) since that should reject
(or both trunc(1) and trunc(13))

> +test_trunc() {
> +	sbx_add "test_trunc" || return $?
> +	ovs_add_dp "test_trunc" trunctest || return 1
> +
> +	info "create namespaces"
> +	for ns in client server; do
> +		ovs_add_netns_and_veths "test_trunc" "trunctest" "$ns" \
> +			"${ns:0:1}0" "${ns:0:1}1" || return 1
> +	done
> +
> +	ip netns exec client ip addr add 10.0.0.1/24 dev c1
> +	ip netns exec client ip link set c1 up
> +	ip netns exec server ip addr add 10.0.0.2/24 dev s1
> +	ip netns exec server ip link set s1 up
> +
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
> +
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
> +
> +	info "verify connectivity without truncation"
> +	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
> +		10.0.0.2 || return 1
> +
> +	ovs_del_flows "test_trunc" trunctest
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
> +
> +	info "add truncated forwarding flow"
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(1),eth(),eth_type(0x0800),ipv4()' \
> +		'trunc(14),2' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
> +
> +	info "verify ping fails with truncation"
> +	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
> +		10.0.0.2 >/dev/null 2>&1 \
> +		&& { info "FAIL: ping should fail with trunc(14)"
> +		     return 1; }
> +
> +	ovs_del_flows "test_trunc" trunctest
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(1),eth(),eth_type(0x0800),ipv4()' '2' || return 1
> +	ovs_add_flow "test_trunc" trunctest \
> +		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
> +
> +	info "verify connectivity restored without truncation"
> +	ovs_sbx "test_trunc" ip netns exec client ping -c 1 -W 2 \
> +		10.0.0.2 || return 1
> +
> +	return 0
> +}
> +
>  # psample test
>  # - use psample to observe packets
>  test_psample() {
>
> base-commit: cef9d6804030793cf8b8796fd6936197d065dd3e


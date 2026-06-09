Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72440B395
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009837; cv=none; b=MHbx9Kl/7Rp1593NU3W4Giu03wxn/Qry06NfeARP+XIOK6kYS8/hCr9rHgt5hL7a7jL4kM0JpgoADUBEpphwel/bFsJCN3n+srXa5V8m/WMx48dBs+b+qVVhSVmIUMiwUZPqqza40WibBqne2qt6Dq3f8Was+9It+0osK3Bdh8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009837; c=relaxed/simple;
	bh=GaOLgQslyWp7a5kLYFLKYx+o5cHDquI3aEiSDItK5t0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y8kBfAoiz6baD1wAGc02ciHATZyQ1Vp9EDzQfHI+v8EbNamYvrQd5BtSIuowj6v8dG2D7X8GeMG4RQW+CuxF7iuh2l3LL19+byH+oxiiBDgd1TO4GvH1HZQcS0Io1RV/Z59v8TQaRpj9cbxVmNoFTn9RKPWISt9AhvsHRbI5jTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DL/KI8B5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DL/KI8B5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781009834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i8I64MBW6eLAXF/vYc9bg28DHRcO9L2MdGHC99IA9vw=;
	b=DL/KI8B5ZgIV2z7AxpukH0F8bs5XLukqRBjIRw1VEowc64jIKI0FxUCIjcgnoVGX876o95
	E7QyVDI4JBf35dSRFeT2nlGm+jaHv9+OWicphcMh1MLuhPa+fG5nLrPL4BxcIt4nsksg4O
	e6rufOUGFV5vAjgvM6magJlbK3RFMKM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-zxyvu-sLNiuk92GUwyN1Ng-1; Tue,
 09 Jun 2026 08:57:11 -0400
X-MC-Unique: zxyvu-sLNiuk92GUwyN1Ng-1
X-Mimecast-MFC-AGG-ID: zxyvu-sLNiuk92GUwyN1Ng_1781009829
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B280195DE63;
	Tue,  9 Jun 2026 12:57:09 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.65.94])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93D86D6E;
	Tue,  9 Jun 2026 12:57:07 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  davem@davemloft.net,  echaudro@redhat.com,
  edumazet@google.com,  horms@kernel.org,  i.maximets@ovn.org,
  kuba@kernel.org,  pabeni@redhat.com,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4] selftests/net/openvswitch: guard command
 substitutions against empty output
In-Reply-To: <20260604163016.3929371-1-houminxi@gmail.com> (Minxi Hou's
	message of "Fri, 5 Jun 2026 00:30:16 +0800")
References: <20260604163016.3929371-1-houminxi@gmail.com>
Date: Tue, 09 Jun 2026 08:57:06 -0400
Message-ID: <f7t7bo7g9ct.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Minxi Hou <houminxi@gmail.com> writes:

> When ip-link output is unavailable, when the upcall daemon log has not
> been written yet, or when pahole does not know the OVS drop subsystem
> ID, the affected command substitutions silently produce empty strings.
> The caller then passes empty sha= or pid= arguments to ovs_add_flow,
> or matches against wrong drop reason codes, all without a diagnostic.
>
> Add [ -z ] guards immediately after each assignment. For test_arp_ping,
> also align the MAC extraction to use awk '/link\/ether/' as in
> test_pop_vlan. The drop_reason guard returns ksft_skip because an
> absent subsystem ID is an environment issue, not a test failure.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Thanks Minxi - these look good although this is probably better to go to
net-next since it's more like enhancement rather than really a 'fix'.

Reviewed-by: Aaron Conole <aconole@redhat.com>

When you post next version make sure to target it as such.

> Changes since v3:
>   - Corrected subject prefix to [PATCH net] (hardening fix, not new feature).
>
> Changes since v2:
>   - Fixed missing 'net/' in subject path (selftests/net/openvswitch).
>   - Removed --base flag (prerequisite-patch-id flood in v2).
>
> Changes since v1:
>   - Rebased onto current net-next/main. No code changes.
>
>  .../selftests/net/openvswitch/openvswitch.sh     | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a415e9dec8cd..82f066a0ceed 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -360,6 +360,8 @@ test_psample() {
>  	# sFlow / IPFIX.
>  	nlpid=$(grep -E "listening on upcall packet handler" \
>              $ovs_dir/s0.out | cut -d ":" -f 2 | tr -d ' ')
> +	[ -z "$nlpid" ] && \
> +		{ info "failed to get upcall PID"; return 1; }
>  
>  	ovs_add_flow "test_psample" psample \
>              "in_port(2),eth(),eth_type(0x0800),ipv4()" \
> @@ -393,6 +395,10 @@ test_drop_reason() {
>  	ovs_drop_subsys=$(pahole -C skb_drop_reason_subsys |
>  			      awk '/OPENVSWITCH/ { print $3; }' |
>  			      tr -d ,)
> +	if [ -z "$ovs_drop_subsys" ]; then
> +		info "failed to get OVS drop subsys ID"
> +		return $ksft_skip
> +	fi
>  
>  	sbx_add "test_drop_reason" || return $?
>  
> @@ -491,13 +497,19 @@ test_arp_ping () {
>  	# Setup client namespace
>  	ip netns exec client ip addr add 172.31.110.10/24 dev c1
>  	ip netns exec client ip link set c1 up
> -	HW_CLIENT=`ip netns exec client ip link show dev c1 | grep -E 'link/ether [0-9a-f:]+' | awk '{print $2;}'`
> +	HW_CLIENT=$(ip netns exec client ip link show dev c1 \
> +		| awk '/link\/ether/ {print $2}')
> +	[ -z "$HW_CLIENT" ] && \
> +		{ info "failed to get client hwaddr"; return 1; }
>  	info "Client hwaddr: $HW_CLIENT"
>  
>  	# Setup server namespace
>  	ip netns exec server ip addr add 172.31.110.20/24 dev s1
>  	ip netns exec server ip link set s1 up
> -	HW_SERVER=`ip netns exec server ip link show dev s1 | grep -E 'link/ether [0-9a-f:]+' | awk '{print $2;}'`
> +	HW_SERVER=$(ip netns exec server ip link show dev s1 \
> +		| awk '/link\/ether/ {print $2}')
> +	[ -z "$HW_SERVER" ] && \
> +		{ info "failed to get server hwaddr"; return 1; }
>  	info "Server hwaddr: $HW_SERVER"
>  
>  	ovs_add_flow "test_arp_ping" arpping \


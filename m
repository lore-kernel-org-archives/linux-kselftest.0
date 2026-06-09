Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36682404893
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781008988; cv=none; b=nZBkf9efcniEr257CBp+teVGjdLk75WNUYRpdMC+m74uBco47D+vt1h2dBGsK5+VkaPHfuozOCYY/DThcM8t5djuW5PEwkuodWYnRceu/v2qvQ9skWSbghoGKGiVY8epwWqGmn8FZyasSxAvXN2r3ZYMNjtrmKap9ckreGwatuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781008988; c=relaxed/simple;
	bh=eQcE53H57mmugtVAqmdEXxaSypvWnM/iYQmtRBz9Vpc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M7SGGrnuIvw8Fu4kuKJ+9tRC1C2cujRVeLQxzWeAq/KFsRdHCP9gSOLJTQR0o5eBN/xd0wcAbLwBQnhitMUcIoklyL5W+QRAHLyWYgS+LpuNussQWll/QM8lOC5c3b8cE1X/BQFGpGdgTU/xuQ7MzY65TXhVtF5CsfxVctxo7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6yQP8Af; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6yQP8Af"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781008986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxR+44t8/qx3fXoBokd6lsS+BQ1a++aQUffFzkcdiEE=;
	b=C6yQP8Afc5QupbdodTYhGsFEw11FW9Ozebou9nIeF5m1k5FefHQQkpRpeBn8H1Qh4C64Ru
	xzYv8x9FMVbueYJAjnIcJx4LDpaAc1ZU1khjqXrNcwvUTMHW6ZK5LSzgQRKdHHX10LxHqp
	2d7d3MQZJqO8/zJnP1eWuTMihCCNitg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-uxaodqk_Mr6SZsfHb_7zPg-1; Tue,
 09 Jun 2026 08:43:01 -0400
X-MC-Unique: uxaodqk_Mr6SZsfHb_7zPg-1
X-Mimecast-MFC-AGG-ID: uxaodqk_Mr6SZsfHb_7zPg_1781008979
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D8D41964CF2;
	Tue,  9 Jun 2026 12:42:59 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.65.94])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 876293008B38;
	Tue,  9 Jun 2026 12:42:57 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: echaudro@redhat.com,  i.maximets@ovn.org,  davem@davemloft.net,
  edumazet@google.com,  kuba@kernel.org,  pabeni@redhat.com,
  horms@kernel.org,  shuah@kernel.org,  netdev@vger.kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org,
  amorenoz@redhat.com
Subject: Re: [PATCH net-next] selftests/net/openvswitch: add flow modify test
In-Reply-To: <20260605124222.963815-1-houminxi@gmail.com> (Minxi Hou's message
	of "Fri, 5 Jun 2026 20:42:22 +0800")
References: <20260605124222.963815-1-houminxi@gmail.com>
Date: Tue, 09 Jun 2026 08:42:56 -0400
Message-ID: <f7tjys7ga0f.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Minxi,

Thanks for the quick turnaround with the test!

Minxi Hou <houminxi@gmail.com> writes:

> Add mod_flow() and the mod-flow CLI command to ovs-dpctl.py, exercising
> OVS_FLOW_CMD_SET. Add test_flow_set which first modifies an existing
> flow with new actions and verifies the change via traffic, then modifies
> the same flow without actions and verifies the kernel handles the
> no-actions case gracefully.
>
> The no-actions path is unreachable from userspace OVS tools (dpctl
> mod-flow requires actions) but reachable via raw netlink. This is the
> code path where Adrian Moreno found a possible kfree_skb of ERR_PTR
> when reply allocation fails after locking.
>
> Make parse() skip OVS_FLOW_ATTR_ACTIONS when actstr is None so the
> kernel enters the post-lock allocation branch in ovs_flow_cmd_set().
>
> Suggested-by: Aaron Conole <aconole@redhat.com>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
>  .../selftests/net/openvswitch/openvswitch.sh  | 72 +++++++++++++++++++
>  .../selftests/net/openvswitch/ovs-dpctl.py    | 39 +++++++++-
>  2 files changed, 108 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index a415e9dec8cd..71190bc662f9 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> @@ -30,6 +30,7 @@ tests="
>  	drop_reason				drop: test drop reasons are emitted
>  	pop_vlan				vlan: POP_VLAN action strips tag
>  	dec_ttl					ttl: dec_ttl decrements IP TTL
> +	flow_set				flow-set: Flow modify
>  	psample					psample: Sampling packets with psample"
>  
>  info() {
> @@ -193,6 +194,23 @@ ovs_add_flow () {
>  	return 0
>  }
>  
> +ovs_mod_flow () {
> +	if [ -n "$4" ]; then
> +		info "Modifying flow: sbx:$1 br:$2 flow:$3 act:$4"
> +		ovs_sbx "$1" python3 $ovs_base/ovs-dpctl.py \
> +			mod-flow "$2" "$3" "$4"
> +	else
> +		info "Modifying flow (no actions): sbx:$1 br:$2 flow:$3"
> +		ovs_sbx "$1" python3 $ovs_base/ovs-dpctl.py \
> +			mod-flow "$2" "$3"
> +	fi
> +	if [ $? -ne 0 ]; then
> +		info "Flow modify [ $3 ] failed"
> +		return 1
> +	fi
> +	return 0
> +}
> +
>  ovs_del_flows () {
>  	info "Deleting all flows from DP: sbx:$1 br:$2"
>  	ovs_sbx "$1" python3 $ovs_base/ovs-dpctl.py del-flows "$2"
> @@ -300,6 +318,60 @@ test_dec_ttl() {
>  	return 0
>  }
>  
> +test_flow_set() {
> +	sbx_add "test_flow_set" || return $?
> +	ovs_add_dp "test_flow_set" flowset || return 1
> +
> +	info "create namespaces"
> +	for ns in client server; do
> +		ovs_add_netns_and_veths "test_flow_set" "flowset" "$ns" \
> +			"${ns:0:1}0" "${ns:0:1}1" || return 1
> +	done
> +
> +	ip netns exec client ip addr add 10.0.0.1/24 dev c1
> +	ip netns exec client ip link set c1 up
> +	ip netns exec server ip addr add 10.0.0.2/24 dev s1
> +	ip netns exec server ip link set s1 up
> +
> +	ovs_add_flow "test_flow_set" flowset \
> +		'in_port(1),eth(),eth_type(0x0806),arp()' '2' || return 1
> +	ovs_add_flow "test_flow_set" flowset \
> +		'in_port(2),eth(),eth_type(0x0806),arp()' '1' || return 1
> +
> +	local fwd_flow="ufid:00000001-0002-0003-0004-000500060007"
> +	fwd_flow="$fwd_flow,in_port(1),eth(),eth_type(0x0800),ipv4()"
> +
> +	ovs_add_flow "test_flow_set" flowset "$fwd_flow" '2' \
> +		|| return 1
> +	ovs_add_flow "test_flow_set" flowset \
> +		'in_port(2),eth(),eth_type(0x0800),ipv4()' '1' || return 1
> +
> +	info "verify initial forwarding"
> +	ovs_sbx "test_flow_set" ip netns exec client ping -c 1 -W 2 \
> +		10.0.0.2 || return 1
> +
> +	info "mod-flow with new actions (change to drop)"
> +	ovs_mod_flow "test_flow_set" flowset "$fwd_flow" 'drop' \
> +		|| return 1
> +
> +	info "verify traffic is now dropped"
> +	ovs_sbx "test_flow_set" ip netns exec client ping -c 1 -W 2 \
> +		10.0.0.2 >/dev/null 2>&1 \
> +		&& { info "FAIL: ping should fail after mod-flow to drop"
> +		     return 1; }
> +
> +	info "mod-flow without actions"
> +	ovs_mod_flow "test_flow_set" flowset "$fwd_flow" || return 1

This is one we could also verify with a grep as well::

  python3 "$ovs_base/ovs-dpctl.py" dump-flows flowset | grep "$fwd_flow"

and just check that it has no actions associated with it.  We wouldn't
need anything persistent since we are just checking the reply.  That way
we know that the set has updated the flow as well (instead of solely
relying on the drop).

> +	info "verify drop actions unchanged"
> +	ovs_sbx "test_flow_set" ip netns exec client ping -c 1 -W 2 \
> +		10.0.0.2 >/dev/null 2>&1 \
> +		&& { info "FAIL: ping should still fail after no-actions set"
> +		     return 1; }
> +
> +	return 0
> +}
> +
>  # psample test
>  # - use psample to observe packets
>  test_psample() {
> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index 3342e295293d..9113473d425f 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> @@ -2702,9 +2702,10 @@ class OvsFlow(GenericNetlinkSocket):
>              self["attrs"].append(["OVS_FLOW_ATTR_KEY", k])
>              self["attrs"].append(["OVS_FLOW_ATTR_MASK", m])
>  
> -            a = ovsactions()
> -            a.parse(actstr)
> -            self["attrs"].append(["OVS_FLOW_ATTR_ACTIONS", a])
> +            if actstr is not None:
> +                a = ovsactions()
> +                a.parse(actstr)
> +                self["attrs"].append(["OVS_FLOW_ATTR_ACTIONS", a])
>  
>      def __init__(self):
>          GenericNetlinkSocket.__init__(self)
> @@ -2738,6 +2739,24 @@ class OvsFlow(GenericNetlinkSocket):
>              raise ne
>          return reply
>  
> +    def mod_flow(self, dpifindex, flowmsg):
> +        flowmsg["cmd"] = OVS_FLOW_CMD_SET
> +        flowmsg["version"] = OVS_DATAPATH_VERSION
> +        flowmsg["reserved"] = 0
> +        flowmsg["dpifindex"] = dpifindex
> +
> +        try:
> +            reply = self.nlm_request(
> +                flowmsg,
> +                msg_type=self.prid,
> +                msg_flags=NLM_F_REQUEST | NLM_F_ACK,
> +            )
> +            reply = reply[0]
> +        except NetlinkError as ne:
> +            print(flowmsg)
> +            raise ne
> +        return reply
> +
>      def del_flows(self, dpifindex):
>          """
>          Send a del message to the kernel that will drop all flows.
> @@ -3013,6 +3032,12 @@ def main(argv):
>      addflcmd.add_argument("flow", help="Flow specification")
>      addflcmd.add_argument("acts", help="Flow actions")
>  
> +    modflcmd = subparsers.add_parser("mod-flow")
> +    modflcmd.add_argument("modbr", help="Datapath name")
> +    modflcmd.add_argument("modflow", help="Flow specification")
> +    modflcmd.add_argument("modacts", help="Flow actions",
> +                          nargs="?", default=None)
> +
>      delfscmd = subparsers.add_parser("del-flows")
>      delfscmd.add_argument("flsbr", help="Datapath name")
>  
> @@ -3110,6 +3135,14 @@ def main(argv):
>          flow = OvsFlow.ovs_flow_msg()
>          flow.parse(args.flow, args.acts, rep["dpifindex"])
>          ovsflow.add_flow(rep["dpifindex"], flow)
> +    elif hasattr(args, "modbr"):
> +        rep = ovsdp.info(args.modbr, 0)
> +        if rep is None:
> +            print("DP '%s' not found." % args.modbr)
> +            return 1
> +        flow = OvsFlow.ovs_flow_msg()
> +        flow.parse(args.modflow, args.modacts, rep["dpifindex"])
> +        ovsflow.mod_flow(rep["dpifindex"], flow)
>      elif hasattr(args, "flsbr"):
>          rep = ovsdp.info(args.flsbr, 0)
>          if rep is None:


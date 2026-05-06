Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4E481A84
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081962; cv=none; b=Ux0WJ5xDzoCcZWybDOSfXmR0FRFOwqUmLRoXpShKYAeNTSepjkccLkFnB1xTo34ZPlRFgR1VjTfm5YMLpmuDApEnMjM6vs2nEiynn838RruO0TQ5HvZJZ/dit58ZtWN5J5ZhPT2MPtbgNl/iEijNVkssWWIpbcPetWNUuMQ3xoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081962; c=relaxed/simple;
	bh=jb8PaiYBstonzXIxPzDVwI9v+hNrkI1jfouilqdCaWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bb9dnN1tYlZQQ5cANNAZz8Tuy4OI8whxXrdWP+Oh2a+/J7S2oJIsSsYBgcNmpeNTQbMQRDABEfoDz/VdDTiDBo0Ht52QyUUO+SUuKIWOJ1a3kMt0Aa7A1gKixtZUAIYrvm722sTjwufGVDMz0OuV8HkrzMAjbD716Ry6+RVY6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yl4eatdz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yl4eatdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778081960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JqaVWLxDMt7hNWZ0g/JqJQZyuPyDy7odCawJjhc620E=;
	b=Yl4eatdzVgY/2xxmhBvTEry2pMceYAvio0Yx0zRiN7exmuoD8ovWMtLX+3OHtU/GwNp7BT
	mCo7V6S83+qi8oQB3kw3FEOHwfRyJfxSnGKenluFn1Hnbf8fPAPH+XBJJK6h4Td6xr/zcV
	d2UUnbtdprw5oe51W+RVwxnt7vTi0pQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-GMFQ7vkEOb-vQwWfQe80Vw-1; Wed,
 06 May 2026 11:39:16 -0400
X-MC-Unique: GMFQ7vkEOb-vQwWfQe80Vw-1
X-Mimecast-MFC-AGG-ID: GMFQ7vkEOb-vQwWfQe80Vw_1778081955
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A80DD195608C;
	Wed,  6 May 2026 15:39:14 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.65.142])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D94B219560A2;
	Wed,  6 May 2026 15:39:11 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/2] selftests: openvswitch: add pop_vlan test
In-Reply-To: <20260506131218.1880852-1-houminxi@gmail.com> (Minxi Hou's
	message of "Wed, 6 May 2026 21:12:16 +0800")
References: <20260506131218.1880852-1-houminxi@gmail.com>
Date: Wed, 06 May 2026 11:39:09 -0400
Message-ID: <f7tbjestun6.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Minxi,

Minxi Hou <houminxi@gmail.com> writes:

> Add test_pop_vlan() to verify OVS kernel datapath pop_vlan action
> correctly strips 802.1Q VLAN tags from frames.
>
> Patch 1 extends ovs-dpctl.py with vlan(vid=X,pcp=Y,cfi=Z) formatting
> and parsing, plus an encap_ovskey subclass for safe ENCAP NLA decoding.
> It changes OVS_KEY_ATTR_VLAN type from uint16 to be16 to match
> the kernel __be16 wire format.
> It also adds push_vlan action support (parse/format with range
> validation) and removes the unnecessary MAX_ENCAP_DEPTH limit.
> Patch 2 adds the selftest using purely ping-based verification with
> a push_vlan return flow for symmetric bidirectional testing.
>
> Tested with vng on x86_64, all OVS selftests pass (including new
> test_pop_vlan).
>
> v6:
>   - fix non-ASCII characters (em dashes) in comments and commit
>     messages

I just commented on v5, and I think those comments still apply.

In the future, if you will respin a series that hasn't gotten comments
yet, it would be preferable to reply to that series somewhere saying
that you will respin so we can make sure to always reply to the latest.

> v5: https://lore.kernel.org/netdev/20260505124957.1239812-1-houminxi@gmail.com/
>   - add push_vlan action class, dpstr format and parse with range
>     validation (vid 0-4095, pcp 0-7, tpid 0-0xFFFF, CFI forced to 1)
>   - remove MAX_ENCAP_DEPTH constant and depth tracking (bracket-depth
>     counter in encap parser already handles nesting)
>   - remove start_capture/stop_capture helpers and tcpdump/pcap
>     verification -- use ping success/failure instead
>   - remove modprobe/netns pre-flight checks (other tests don't do this)
>   - remove ethtool VLAN offload disable (unnecessary for veth)
>   - add push_vlan return flow for symmetric bidirectional ping
>   - use ovs_sbx wrapper for ping commands (consistent with siblings)
> v4: https://lore.kernel.org/netdev/20260504123713.555461-1-houminxi@gmail.com/
>   - fix all checkpatch line-length warnings in new code
>   - fix pylint W0707: use explicit exception chaining (from exc)
> v3: https://lore.kernel.org/netdev/20260503120946.51869-1-houminxi@gmail.com/
>   - encap_ovskey: MPLS type "ovs_key_mpls" -> "array(ovs_key_mpls)"
>   - encap_ovskey: PRIORITY/IN_PORT set to "none" (metadata, not in ENCAP)
>   - _vlan_dpstr: cfi=0 falls back to tci=0x%04x for round-trip safety
>   - encap parse(): check return value for unrecognized trailing content
>   - vlan parser: boundary check + raise-from for exception chaining
>   - start_capture: || return $? to propagate ksft_skip correctly
>   - on_exit: moved after resource creation, not before
>   - ping success: changed from NOTE to FAIL + return 1
>   - VLAN interface creation: added || return 1 error propagation
>   - netns probe: distinguish EEXIST from missing CONFIG_NET_NS
>   - sbx_add: || return $ksft_skip -> || return $? (match sibling tests)
> v2: https://lore.kernel.org/netdev/20260501133924.3100680-1-houminxi@gmail.com/
>
> Minxi Hou (2):
>   selftests: openvswitch: add vlan() and encap() flow string parsing
>   selftests: openvswitch: add pop_vlan test
>
>  .../selftests/net/openvswitch/openvswitch.sh  |  77 +++++
>  .../selftests/net/openvswitch/ovs-dpctl.py    | 322 +++++++++++++++++-
>  2 files changed, 389 insertions(+), 10 deletions(-)


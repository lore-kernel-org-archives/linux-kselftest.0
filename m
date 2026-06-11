Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E50409126
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781185508; cv=none; b=DjzNVsLQf2l2DM67G5QnBgBpsdE0Oh2XmsR+3/rt3RYTrGs7Ach3/0xS64UwVLX1R28XpzFAYRENj7lQ0e8ZwJoXjMRl/hzhSMjQGIbqxaLcRdOfvFSVDr8Y2k4Ay/1WIUJ8yfbkvNhe9saBHkqzXuAsb1lQdeWsNlzmaiRhDFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781185508; c=relaxed/simple;
	bh=9I660twNq07kzK95bE4HEQ5h/eHeVHsC0f/zvk3pQRI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kIjBdsU0gfpZXS5P/DNutu5jkqsxUctO8ZidQ2CwEdroIZ+izbutWMyw8bKPQiQcJkh0U5ZjDWlUHDyu6/BLg5eUYm3MVAm2A+rW+l0qaaHZNUlevzIf2cLyFSRqxdMqdibtOBtWYeXUcorVjlRZVjEgAcJVRXdHcXGqt1SQlhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGHswiMy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGHswiMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781185506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9I660twNq07kzK95bE4HEQ5h/eHeVHsC0f/zvk3pQRI=;
	b=HGHswiMy+RpfgSw/0xz2MiuubomKxH9ySzNtDpHWUT8WAQLyomuVGqke2UzjDdTT4DhouV
	Kc+tNM6wlCsnsRuQbwcuMIzAyLVM2J3DnJ0KvwMaN/kiiCtdmxfiqxLYz0kYL5sk/sOuk+
	fQIXSFaI6pdMDNc0D8+ze887g4tGpwo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-A2omzyn1P2qbUPNxtcVxRg-1; Thu,
 11 Jun 2026 09:45:03 -0400
X-MC-Unique: A2omzyn1P2qbUPNxtcVxRg-1
X-Mimecast-MFC-AGG-ID: A2omzyn1P2qbUPNxtcVxRg_1781185501
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3616219560B8;
	Thu, 11 Jun 2026 13:45:01 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.65.94])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D457C3008B37;
	Thu, 11 Jun 2026 13:44:58 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org,
  amorenoz@redhat.com
Subject: Re: [PATCH net-next v2] selftests/net/openvswitch: add flow modify
 test
In-Reply-To: <20260609165725.107484-1-houminxi@gmail.com> (Minxi Hou's message
	of "Wed, 10 Jun 2026 00:57:25 +0800")
References: <20260609165725.107484-1-houminxi@gmail.com>
Date: Thu, 11 Jun 2026 09:44:57 -0400
Message-ID: <f7t33ytfaxy.fsf@redhat.com>
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
> After the no-actions set, verify via dump-flows that the flow retained
> its drop action.
>
> Suggested-by: Aaron Conole <aconole@redhat.com>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>


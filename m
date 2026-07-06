Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BB3E92BB
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349406; cv=none; b=VNa+xiZxiapx8TpwVfRVXrWa1sCA4EmnihFs3olyrB7qQ1XdetYl2eEQZCuYj7+hhSg4vU9e9JVOQ/NSJbJFiLMz5y0EO42pZkXzz1uGJejohhRpoFbm8KqiA9IiPa1IPruhKswvNuZIy0M9ef+Y3Nq2rFZftOeaG6DaZKcIhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349406; c=relaxed/simple;
	bh=Rh1vgYbukgGycrzHGH8cwNVmcXUbb/k0vTFxH+uWsOA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SzoatDT+WIRvCY99P3blAfNQqB3rOHzv2NSxWfVOLf3yKdCvbkt0RaLP+zn8MB01aJX49YkeaiSaBB/5t6bLajnIw2WMm0Vm1hO1N+HBKT1hp7GGJ5e+LjtxiYI+zm0+qFbzddS15wBAbAjn326UXZg8MbA0YS+ZXXVg/bwBzqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a1nKQNFI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a1nKQNFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783349404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy7BN6o8CJa8VD49+oAWt1VcR6U5zC7d9Pjayl7vxeU=;
	b=a1nKQNFIRWj1ukymrHsdgm9cwMzAhFg1gruXmZhm9NAS5ewKUd8V3gLM1QKdyNosNF9/rH
	eWzZIX9EfkU5+lF0amKvHwcZWFJR8Zayj0X6wG6haOrq19O+CAyX3m1goufyVrwRx6exWm
	YjRCfIPSJEh2WSG1qPkBRBSO+wgQ2w4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-zjKFGZzlO6-asScH71gwLA-1; Mon,
 06 Jul 2026 10:49:59 -0400
X-MC-Unique: zjKFGZzlO6-asScH71gwLA-1
X-Mimecast-MFC-AGG-ID: zjKFGZzlO6-asScH71gwLA_1783349397
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E6591955D8F;
	Mon,  6 Jul 2026 14:49:57 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04A7D3000B52;
	Mon,  6 Jul 2026 14:49:54 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org, kylebot@openai.com
Subject: Re: [PATCH net-next v3] selftests/net/openvswitch: add output
 truncation test
In-Reply-To: <20260702074926.1174810-1-houminxi@gmail.com> (Minxi Hou's
	message of "Thu, 2 Jul 2026 03:49:26 -0400")
References: <20260702074926.1174810-1-houminxi@gmail.com>
Date: Mon, 06 Jul 2026 10:49:53 -0400
Message-ID: <f7t33xw2mwe.fsf@redhat.com>
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
> verifies truncation limits in four steps: reject trunc(1) and
> trunc(13) which are below ETH_HLEN, confirm normal forwarding works,
> apply trunc(14) which truncates packets to the Ethernet header and
> verify ping fails, then restore normal forwarding and verify recovery.
>
> The kernel requires max_len >= ETH_HLEN (14 bytes). trunc(14) sets
> OVS_CB(skb)->cutlen so pskb_trim strips the IP payload at output
> time; the receiver drops the runt frame and no echo reply is
> generated.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

NB: There is a note from Sashiko on this about a pre-existing issue with
trunc() action.  That issue was discussed a bit offline, and I think
someone/someprocess is going to submit a patch upstream "soon."  That
said, as with all actions related security issues in OVS, they require
giving a process CAP_NET_ADMIN, which is quite a powerful capability and
generally not advised for the average user.


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26B2DA759
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781556318; cv=none; b=gy2zbSPT/2QSC+Y4yAle8J+REIG4NYva3GEXkfqvcI3YGSdGVTRADs4R6tfUBfgvlv8f5vRIpZQ8IPF/V0zvhC34IOegquGGqWsjf4rWcIacObHrHv8VxnXNJi4roT8G1h6Mf0Oox02rKbY1kFxIqX6TE1zYLKjf1Rw04oLtAp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781556318; c=relaxed/simple;
	bh=KanPUGtLInNYCa8h02lUaJ0jH4YGdy4claGcmGBLxpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PTSsuA6AWjmrGMDlqNMQyVrzYgsau9pU4hIQcKMLSuupb3DtMR+IIgezfmbolmefI/yB7wz4dd1mpXU7xB8JH5gEaZJDJqqINYf5X8flbCNjYDLasvdkvqdlLd/v3po+5a5oeJNXSDjOjJk9hzGjBedYIiD2EqP6f+a+EFz+bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2viaD4Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2viaD4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781556316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KanPUGtLInNYCa8h02lUaJ0jH4YGdy4claGcmGBLxpE=;
	b=D2viaD4YtcK5kZHERGPywMwZ5k4sQFHOmnzrG9gW3qzr56tS2TS3tjB/HaWU2+6FpH/DKt
	qTS3ADn8SO9IjNKRzLGxVfILi167V9Lcph7LVDi6UVBN3wMgO3fI8adbbuO0M1LvdDDGSV
	jGJl/2pv+PyFcCQHrsVWcYu/CtyK8pg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-Ic84ZJvpOASsSanHKJULdg-1; Mon,
 15 Jun 2026 16:45:10 -0400
X-MC-Unique: Ic84ZJvpOASsSanHKJULdg-1
X-Mimecast-MFC-AGG-ID: Ic84ZJvpOASsSanHKJULdg_1781556308
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5BA581956067;
	Mon, 15 Jun 2026 20:45:08 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.89.66])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E0DB175F;
	Mon, 15 Jun 2026 20:45:06 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests/net/openvswitch: add SET action test
In-Reply-To: <20260612130503.311240-1-houminxi@gmail.com> (Minxi Hou's message
	of "Fri, 12 Jun 2026 21:05:03 +0800")
References: <20260612130503.311240-1-houminxi@gmail.com>
Date: Mon, 15 Jun 2026 16:45:04 -0400
Message-ID: <f7t1pe7ednz.fsf@redhat.com>
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

> Add test_action_set exercising OVS_ACTION_ATTR_SET with an ipv4 dst
> rewrite. The test verifies the SET action in three steps: first
> confirm normal forwarding, then apply set(ipv4(dst=10.0.0.99)) to
> rewrite the destination to an address nobody owns and verify ping
> fails, then restore normal forwarding and verify connectivity
> recovers.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>


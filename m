Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660794192F0
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009699; cv=none; b=R4oFwBPFnY4tbbYh/6SIbv6KBSGVFsiO/KwL7WENSERrGb4O0egywHzTr1kEAtE0aQT6N7dMXLX8ciiQh/ejZQ0g06b1ZUFAZ38b63tnykDytXWSu23AaGzAqrq3Cok3XeJmyQG/eQmjEylpAFlH+Fvj/M8x5fM1AzH0mjQoWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009699; c=relaxed/simple;
	bh=FbmqELwkZE15Mwc2UsyKsCGlGrQeI7HFMN12yDJtqbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rbtOm40Q3HAV7JDcJQnSLkW6wlCBXWZFzBg7WjlSrO7IOjgZCZqp7BGmGfJ6gChtQEs4PnRYFXWMOGpKJx37ZbvzHCuRcvAchBraHsh9InQ7pUCRGwScyAjZOEjGApgv+y53RPRj88H+Ewcx6bnrFeHJfH8jh376oDFE7bW4pWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Km5pfIXY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Km5pfIXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781009693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jSwQh1BOvnch4QBcgj6oKXjw4gnvSRB144OhFDs5fPs=;
	b=Km5pfIXYykXm+wSuatuQADEQPQCUqLzVnTPBjwUWNz7CDQ91BGRauThIFIeSK5jvosXBw1
	n5QBg9vLyaOx7hg5dFNp+99r8l6so/m4FUqvI4kfn5MOrAPnPhH48q8fprIhXju/tMy1g/
	gp+9phm9NSoZ4JTdp/6FnB8ibZi94P8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-6IMNcjKDMfaDbJohaQ0mjw-1; Tue,
 09 Jun 2026 08:54:50 -0400
X-MC-Unique: 6IMNcjKDMfaDbJohaQ0mjw-1
X-Mimecast-MFC-AGG-ID: 6IMNcjKDMfaDbJohaQ0mjw_1781009688
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A4941955F25;
	Tue,  9 Jun 2026 12:54:48 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.65.94])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8CE1119541B0;
	Tue,  9 Jun 2026 12:54:46 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Minxi Hou <houminxi@gmail.com>,  netdev@vger.kernel.org,
  davem@davemloft.net,  echaudro@redhat.com,  edumazet@google.com,
  horms@kernel.org,  i.maximets@ovn.org,  kuba@kernel.org,
  shuah@kernel.org,  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/openvswitch: guard command substitutions
 against empty output
In-Reply-To: <c530d07f-5841-4bfb-b296-b47fc0ce0614@redhat.com> (Paolo Abeni's
	message of "Tue, 9 Jun 2026 12:56:17 +0200")
References: <20260601115307.1411211-1-houminxi@gmail.com>
	<c530d07f-5841-4bfb-b296-b47fc0ce0614@redhat.com>
Date: Tue, 09 Jun 2026 08:54:45 -0400
Message-ID: <f7tbjdjg9gq.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Paolo Abeni <pabeni@redhat.com> writes:

> On 6/1/26 1:53 PM, Minxi Hou wrote:
>> When ip-link output is unavailable, when the upcall daemon log has not
>> been written yet, or when pahole does not know the OVS drop subsystem
>> ID, the affected command substitutions silently produce empty strings.
>> The caller then passes empty sha= or pid= arguments to ovs_add_flow,
>> or matches against wrong drop reason codes, all without a diagnostic.
>> 
>> Add [ -z ] guards immediately after each assignment. For test_arp_ping,
>> also align the MAC extraction to use awk '/link\/ether/' as in
>> test_pop_vlan. The drop_reason guard returns ksft_skip because an
>> absent subsystem ID is an environment issue, not a test failure.
>> 
>> Signed-off-by: Minxi Hou <houminxi@gmail.com>
>
> IMHO this is net-next material.
>
> @Aaron, @Eelco, @Ilya: WDYT?

Agreed.

> /P


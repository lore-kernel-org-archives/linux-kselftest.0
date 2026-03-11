Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0B2773CC
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233339; cv=none; b=ovz2DSUNIImeZBbD/CWwZ4h0YSXcRXRe7am90sLIKRRzJOQWuL3/8W7moQ2huk6FSLgzZOLnhUJ9hRIOksM6RYGm0xElOlPHZypC+5LmEEedpA1tM7cnFe/s3uREjwtoklqkbRLqL4kI4ANyUDSV9FiDT+Dt54MsoSRiaPbyY8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233339; c=relaxed/simple;
	bh=xcZpsPLRj4+t91HOPhvrSX6TCcutsqBZTrGwFvx+E0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=boDu1C0Xzvx6F6on/ba+OsSIyZAv4r9v+A3fRxnHLvHMju+Bt/QpT2l+9ZVNoV8nSpGGQ9jAYfJRrpGi7+zQNt4HwP5Cad+2QcByYYbykd9cqKRB6qLRoyUts4xLePo5XOOqB8fM2EOhBIjFdaiZ9oQSPgFs9L7rk4sbNyRttaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SAlBq8xa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SAlBq8xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773233336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J8EogtX9KqkwlCTtPWzX2zysM9V7W8qju+U/TiK9m24=;
	b=SAlBq8xaKDTk7UsRTkARpe/A7MQQxjlyiVU/cDzCOI4SIRoq+K0l/VveKrxqBdO/Mf93ac
	x/uSwsbZCFrskifwoi9HXU/uZSL0UdoTQ2apX4G8WyqHivFQd97CcCtrrI+GhcTKvutOxn
	aaTr3EJwMjCq/fSNTlNE/qJxpWx7HXE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-eeoS19fpM2eiU-KewMbZQw-1; Wed,
 11 Mar 2026 08:48:53 -0400
X-MC-Unique: eeoS19fpM2eiU-KewMbZQw-1
X-Mimecast-MFC-AGG-ID: eeoS19fpM2eiU-KewMbZQw_1773233331
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A86119560A3;
	Wed, 11 Mar 2026 12:48:51 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.88.168])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBCD13000223;
	Wed, 11 Mar 2026 12:48:48 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Ilya Maximets <imaximet@redhat.com>,  Eelco Chaudron
 <echaudro@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>,
  netdev@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  dev@openvswitch.org
Subject: Re: [PATCH net v4 1/5] selftests: net: make ovs-dpctl.py fail when
 pyroute2 is unsupported
In-Reply-To: <20260309152013.565216-2-aleksey.oladko@virtuozzo.com> (Aleksei
	Oladko's message of "Mon, 9 Mar 2026 15:20:09 +0000")
References: <20260309152013.565216-1-aleksey.oladko@virtuozzo.com>
	<20260309152013.565216-2-aleksey.oladko@virtuozzo.com>
Date: Wed, 11 Mar 2026 08:48:47 -0400
Message-ID: <f7t7brir0pc.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Aleksei Oladko <aleksey.oladko@virtuozzo.com> writes:

> The pmtu.sh kselftest configures OVS using ovs-dpctl.py and falls back
> to ovs-vsctl only when ovs-dpctl.py fails. However, ovs-dpctl.py exits
> with a success status when the installed pyroute2 package version is
> lower than 0.6, even though the OVS datapath is not configured.
>
> As a result, pmtu.sh assumes that the setup was successful and
> continues running the test, which later fails due to the missing
> OVS configuration.
>
> Fix the exit code handling in ovs-dpctl.py so that pmtu.sh can detect
> that the setup did not complete successfully and fall back to
> ovs-vsctl.
>
> Fixes: 962e8a01eab9 ("selftests: openvswitch: Add version check for pyroute2")
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---

Still LGTM (but this is already in net-next as 0bcac7b11262 so does it
need to be included still?  Actually I think it should be in 'net')

(including tag just in case)
Reviewed-by: Aaron Conole <aconole@redhat.com>


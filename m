Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE13D6466
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828033; cv=none; b=h31yHq6wDEInQYaQdG56V3rk7Ej0JmU98vS0PJcNhjr5G4JrxJ/CMlqe/5tT83XjJK3E+rp3KbNRGmw6007zfQA7zXIT/hR0QLsaWbsLR5Wbdxq0p9omAhV+tUg4jaES3/Ldhcp7ffdLt6wOxTmaUiN3x+Ctc2r8w5iDiQvsi/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828033; c=relaxed/simple;
	bh=Sv4xPSqe/Lw3o9sgsUySZxvwXDH5uG9frkm2sFB3IiQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HYPgywoqf9YHDdUb9YDB7B+O9RTeZ9jSgHosS5PL8c+khaH7Fxmzn+TB4ksLk2IdRWgtcn5qCijglibJH4MPkUFpzQPB+hSUNI2znXpJEdUTzWUN2bSeEtkRpK/BeOw04fVxrC3tht9hWA0+dpazMRo1JJD6nQL7TpdLMZmsnZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AL8bI0jd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AL8bI0jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778828030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZAeat6OEtCU2HoUDGx/9XhjLgZNjEvUYNHT3F6GC4k=;
	b=AL8bI0jdYsRQq8Pmpu3RxZ0PBnvHM4huDcsYBwFDZVDOUoCig7nlpP2kPS2P93M4xqb1h5
	+qUTINOXAb7KHmhPwo55tb7FnRusXiIadp+seCtZSppC8NySdt5sKuhlxmLJcui7ysuvb6
	EkqyVAq0k6lvQdu93ADiTtHeHkTTzmo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-QnA3Wtb7P5ucKcz0EIOB7A-1; Fri,
 15 May 2026 02:53:45 -0400
X-MC-Unique: QnA3Wtb7P5ucKcz0EIOB7A-1
X-Mimecast-MFC-AGG-ID: QnA3Wtb7P5ucKcz0EIOB7A_1778828023
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D8F31956054;
	Fri, 15 May 2026 06:53:43 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.221])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46C6F19560A2;
	Fri, 15 May 2026 06:53:38 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  dev@openvswitch.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org,
  echaudro@redhat.com,  i.maximets@ovn.org,  i.maximets@redhat.com,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org
Subject: Re: [PATCH net-next 0/5] selftests: openvswitch: pylint cleanup for
 ovs-dpctl.py
In-Reply-To: <20260513121240.2590767-1-houminxi@gmail.com> (Minxi Hou's
	message of "Wed, 13 May 2026 20:12:35 +0800")
References: <20260513121240.2590767-1-houminxi@gmail.com>
Date: Fri, 15 May 2026 02:53:35 -0400
Message-ID: <f7tzf21noy8.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Minxi Hou <houminxi@gmail.com> writes:

> This series cleans up all pylint warnings in ovs-dpctl.py,
> bringing the score from 7.62/10 to 10.00/10.
>
> This series applies on top of:
>   [PATCH net-next v10 1/2] selftests: openvswitch: add vlan() and
>   encap() flow string parsing
>   https://lore.kernel.org/netdev/20260512070841.1183581-2-houminxi@gmail.com/
>
> Patch 1 converts 86 %-format strings to f-strings.
> Patch 2 fixes misc warnings (unused import, bare except, unused
> variables, redundant expressions).
> Patch 3 renames classes to PascalCase and variables to snake_case.
> Patch 4 adds one-line docstrings to all definitions.
> Patch 5 suppresses complexity warnings from pyroute2 constraints.
>
> Tested with vng on x86_64, all OVS selftests pass.
>
> Minxi Hou (5):
>   selftests: openvswitch: convert %-formatting to f-strings
>   selftests: openvswitch: fix misc pylint warnings in ovs-dpctl.py
>   selftests: openvswitch: rename classes and variables in ovs-dpctl.py
>   selftests: openvswitch: add missing docstrings in ovs-dpctl.py
>   selftests: openvswitch: suppress pylint complexity warnings
>
>  .../selftests/net/openvswitch/ovs-dpctl.py    | 794 ++++++++++--------
>  1 file changed, 428 insertions(+), 366 deletions(-)

Thinking about this series, it might be better to go a bit further and
just drop the pyroute2 in favor of using ynl to generate the netlink
encode/decode.  The value that ovs-dpctl.py brings is the ability to
interoperate with the ovs-vswitchd odp encoding.  That we are using
pyroute2 to do the actual 'wire' format of netlink is incidental.

Some of the work would still be needed (I think some of the f-string
adjustments) but that would allow trimming a good chunk of the code and
let us just rely on the in-tree ynl rather than pyroute2 dependency.

WDYT?  Ilya and I can work with you offline if you are interested in
pursuing this approach.  I think it should make the overall code much
better to work with, too.


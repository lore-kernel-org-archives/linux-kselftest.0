Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1031377EA4
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372054; cv=none; b=jWsI3bboDrCZaKFNyc4dOnNlR6O+3g0DuhGY+7P9MvaW/UYf8kWj3S8ilasCvczvGIIjRFGu8Fhp3PMdVEwSzaIVR0ed91RtziBlJmHyjDOgNDUE/tbDdf1uMmhTTKJzCMbzY3/PyfGFY8vj9YKGs0U7BkDx161XeWeal8czW1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372054; c=relaxed/simple;
	bh=V1aYIRFuyyT5/+K+k6imL2TLIXjliRelxkb+H9Aa8MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V0typw96+cVshN2WYo+V3s6rsN3rdbVA4XOn0BFFe2i8Ll5IX6wIXMQZ8l9JfOr8mDv3Zv4jdeKaRGnKkvvp8x569buWNWLag87Y2guDcviQqJzpUQRtEznvszRjcd6Jmgn524NJZ1wieBo6SkDLGJnJdkwZIvvhbe+O2dU3wNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=INxoD1Za; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="INxoD1Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779372051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1aYIRFuyyT5/+K+k6imL2TLIXjliRelxkb+H9Aa8MQ=;
	b=INxoD1Zap9BKFn+HpZASuc+g0MD5xkzDi9Fv5457ccQ950TCAtjaVjslMkyDbOU/foLShC
	DPUStB2lgzTpelQe+GP5RcZSHz1aw9/++JVMbL88e5ftLNfBmK9J6PKW4L9MhwpJUdSXSA
	xo8RI6P4PwwSy0+oV4hA7ueNFkDFOrU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-OPtzuasWP7qNTrW0sjX7Fw-1; Thu,
 21 May 2026 10:00:45 -0400
X-MC-Unique: OPtzuasWP7qNTrW0sjX7Fw-1
X-Mimecast-MFC-AGG-ID: OPtzuasWP7qNTrW0sjX7Fw_1779372043
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5896A19560B5;
	Thu, 21 May 2026 14:00:43 +0000 (UTC)
Received: from griffin (unknown [10.44.49.174])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2887F300019F;
	Thu, 21 May 2026 14:00:38 +0000 (UTC)
Date: Thu, 21 May 2026 16:00:36 +0200
From: Jiri Benc <jbenc@redhat.com>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook
 <kees@kernel.org>, Adrian Moreno <amorenoz@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Matteo Perin
 <matteo.perin@canonical.com>
Subject: Re: [PATCH net v2 2/4] net: netlink: don't set nsid on local
 notifications
Message-ID: <20260521160036.413771e9@griffin>
In-Reply-To: <bd9c0751-55ea-459e-8b22-8bd24abf235c@6wind.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
	<20260520172317.175168-3-i.maximets@ovn.org>
	<bd9c0751-55ea-459e-8b22-8bd24abf235c@6wind.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Thu, 21 May 2026 14:36:12 +0200, Nicolas Dichtel wrote:
> I still don't think that this is the right "fix". The app is broken. Even after
> this patch, the bug could be easily triggered again by a third party.
> There is nothing wrong with assigning a self-nsid. It would be a lot more robust
> for the app to assign itself a self-nsid when it starts.

On the other hand, does the patch break anything in practice (as
opposed to in theory)? It makes live of several apps simpler, which is
not a bad goal.

The only scenario where this would introduce incompatible behavior is
an app that self-assigns a self-nsid and expects to see it. That looks
quite stretched, doesn't it?

Not that I have a strong opinion about this, though.

 Jiri


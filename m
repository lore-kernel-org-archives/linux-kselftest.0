Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58818345CCD
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775445379; cv=none; b=cy/aHV6SuAbeDwQblF+7XQreIh/SbNzbleUjDKpBSLGZikJU096FbWFiwWhzmUsseGNOTpOYoS9PzXoFtMshOSexL3T6WGTZd7UDSIee7dd2/2QSNLu+jj0GoTQrjAofZRBkgT1/h8qnftIh2YeZZybo2Vsqd/kRiSdAcKd+J+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775445379; c=relaxed/simple;
	bh=/eDkYQo7a5je++iDm7bRbd9UGT8HKSvIHeataQheuzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxjIdS2njpFdFFbyLSjuGsoXws5llrgGGMhc+vePKV9L0rO8gMnKRi9BUqVl691becpn5EQ90IeYh8qgHJFVqWlHWo/Juy1jE7eQ6zVAjN79Ur4LPySeor/TcpHnYbgkArpYzDz0vyUjxpoCKOQuRE5aqd68NHj3U9QpPaUcmmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AmaJaXB9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AmaJaXB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775445374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+XkZmZxSuILbEe46ACk9QLBVEgOs+2E681lvuaxSZxs=;
	b=AmaJaXB9jpHQZfri4mLnxd9JhCWr9O7fRVIBqeR+2Z1QsEOGu6No2SuQSLkUaoX/2riYjZ
	BWSD31JPPzO6YBs+6QSCHpMEfMjx004O6peSOZyECqbvyvcO6/s2i4wb0HXFKmoQZV7Lmh
	yzBGmGCoySBBg5chrWSmpz02sBB1PVE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-oca2hmvjMVmUQcq7Uh8Uiw-1; Sun,
 05 Apr 2026 23:16:13 -0400
X-MC-Unique: oca2hmvjMVmUQcq7Uh8Uiw-1
X-Mimecast-MFC-AGG-ID: oca2hmvjMVmUQcq7Uh8Uiw_1775445372
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D404D19560A3;
	Mon,  6 Apr 2026 03:16:11 +0000 (UTC)
Received: from fedora (unknown [10.72.116.2])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BD011955D84;
	Mon,  6 Apr 2026 03:16:06 +0000 (UTC)
Date: Mon, 6 Apr 2026 11:16:01 +0800
From: Ming Lei <ming.lei@redhat.com>
To: zhang <zhangweize9@gmail.com>
Cc: axboe@kernel.dk, csander@purestorage.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	shuah@kernel.org, ushankar@purestorage.com
Subject: Re: [PATCH 1/2] ublk: reset per-IO canceled flag on each fetch
Message-ID: <adMlcc0EkqUNpMbu@fedora>
References: <adER-jg0JfkE4I8n@fedora>
 <46c04059-03a0-4488-a4a5-4bb93aa46a1e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46c04059-03a0-4488-a4a5-4bb93aa46a1e@gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Sun, Apr 05, 2026 at 09:02:30AM +0800, zhang wrote:
> Dear Ming Lei:
> 
> I just looked at your solution, which is to reset immediately after each IO is claimed. This solution can indeed effectively solve the blocking problem. However, if there is a task that is repeated and exactly the same, then the process may run repeatedly many times. Do you think we should add some logic to handle repeated tasks?
> 

->cancel_fn() can provide the forward progress, so it shouldn't be one
problem. If the userspace wants to repeat this action, let it do it, and
kernel won't hang with Uday's fix.


> Reviewed-by: zhang, the-essence-of-life.

Usually we show the whole email address.


Thanks,
Ming


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1BD3815F7
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 14:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485215; cv=none; b=Bqt34acBUgYxQR01gqilXaRnWA+GLP+ildK1E7KMmHPAaqp+MwznHGRi3PK3P70wt5IQSiFm6qmLvklnBklyYhSAEuI1LDRCnm7HNvQFKLJEXsBt2UndlG+lzHVy8MywO+bj4mnoVM80U2eJHJ/6UhJdjJMHvOHqjqIqy8k8hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485215; c=relaxed/simple;
	bh=aKSQ2ZVGkvao/eVywKfII0uZIlmGcGZLrY1/PzfFO3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=se55gJfpuGhZBvvek3+kkJG9KSLlGdxx3Ovhec4ilw+q/+SU97bPRB90ZqjEWGjvR9xp2ClSxyCk3Ramjj9WyzAcEvKiyv0/JLqLynFbRMWYmCdPP2MrM2G7cyfhQUJh4TwnW8iOQT6YP7aUnRAK1aRn358QDDXzldEIt8cKhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpmC9JEM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dpmC9JEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775485213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xb3SmyTMflX7e14Y/snX6rv+cb99PfchcmElu22oqzU=;
	b=dpmC9JEMBUB+XrIQJ3oKr7L6hxD1WclwqqJb1y6E3TLhxdb7GUA8l6Esjs8tfyijQRxiFW
	raOK9ZkxMzD78XspGnO3oehQlrEoju8F13GlPBkR8IiO++TPKtPF8o8IKR3q7eH7fVM6w4
	NMB8w7JU1t3ejh5OiAy6YP2dEBhqovU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-dq3aW5wqMz2M4uZLE2PNig-1; Mon,
 06 Apr 2026 10:20:10 -0400
X-MC-Unique: dq3aW5wqMz2M4uZLE2PNig-1
X-Mimecast-MFC-AGG-ID: dq3aW5wqMz2M4uZLE2PNig_1775485208
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98E9F1956050;
	Mon,  6 Apr 2026 14:20:08 +0000 (UTC)
Received: from fedora (unknown [10.72.116.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3846E1800361;
	Mon,  6 Apr 2026 14:20:01 +0000 (UTC)
Date: Mon, 6 Apr 2026 22:19:54 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Uday Shankar <ushankar@purestorage.com>
Cc: "zhang, the-essence-of-life" <zhangweize9@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Jens Axboe <axboe@kernel.dk>, Shuah Khan <shuah@kernel.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests: ublk: test that teardown after
 incomplete recovery completes
Message-ID: <adPBCsV1OmNrGLUl@fedora>
References: <20260405-cancel-v2-0-02d711e643c2@purestorage.com>
 <20260405-cancel-v2-2-02d711e643c2@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-cancel-v2-2-02d711e643c2@purestorage.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Sun, Apr 05, 2026 at 10:25:31PM -0600, Uday Shankar wrote:
> Before the fix, teardown of a ublk server that was attempting to recover
> a device, but died when it had submitted a nonempty proper subset of the
> fetch commands to any queue would loop forever. Add a test to verify
> that, after the fix, teardown completes. This is done by:
> 
> - Adding a new argument to the fault_inject target that causes it die
>   after fetching a nonempty proper subset of the IOs to a queue
> - Using that argument in a new test while trying to recover an
>   already-created device
> - Attempting to delete the ublk device at the end of the test; this
>   hangs forever if teardown from the fault-injected ublk server never
>   completed.
> 
> It was manually verified that the test passes with the fix and hangs
> without it.
> 
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming


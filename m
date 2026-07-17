Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687693DB326
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784328806; cv=none; b=XD9tQf4U+LlIo0ZfA/xx8ecfgrmV2DX4IoOY3/HfQ1i4wVBWzbTbuBjd4ZHc2MCs3/jkYvbPzXyx6kgG7L4wFBpkpzMeuXPOUiGGDcchlhpSjLPoWWpTpUjsoq8mHS9o5eHsuswbDLOUdKsKb87fFS5tl+dCEHxclZO7sgkxsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784328806; c=relaxed/simple;
	bh=rBlTtEvEu48QrU4UOk/dTtv5mfpsBIMdN4l8qrU59+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCFj7Qc9E6clVMq8k8afpMzXiMy2T6Iosyia86FY6PtZBF9JtTENAftIZSzpFst8OUuHyn4rEh15pGmdS7aag/cZfyjyBnGpR5f4W6WD5cRI0b2Oc4Fyf0/PV1it/CNm3qbUBWiLrGu0tom5OS7Ia8Bb2N2V3K1LCrbCw4802ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfeFDwYM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfeFDwYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784328791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ERBEr5lH7XZ9UOf4HHTWATIp+uGXPajAksvlCkL5w0I=;
	b=PfeFDwYMSut0hNn+pSgDa5B0979rLCZx6L3SfkVcbk827geZsx6yA+8MdSZ2wDj1EXkJBK
	lTz96VYTFunFWwisZgkeI6KC3p0FYts142+IMmIz2Eqn+iFijhE3JkKqBQgj8UYmm/f2mj
	y414o7f2CZT9/KJN2PQx3dt1iFRsgO8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-6AguZ8i6MTKT105P3qQ-RA-1; Fri,
 17 Jul 2026 18:53:09 -0400
X-MC-Unique: 6AguZ8i6MTKT105P3qQ-RA-1
X-Mimecast-MFC-AGG-ID: 6AguZ8i6MTKT105P3qQ-RA_1784328787
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6613D195D008;
	Fri, 17 Jul 2026 22:53:07 +0000 (UTC)
Received: from [10.22.81.98] (unknown [10.22.81.98])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A657C1588;
	Fri, 17 Jul 2026 22:53:05 +0000 (UTC)
Message-ID: <fc9abc04-b7d3-43ee-b51f-4c4b22cd16f1@redhat.com>
Date: Fri, 17 Jul 2026 18:53:04 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-cgroup/for-7.3] selftests/cgroup: Fix minor defects in
 test_cpuset
To: Tejun Heo <tj@kernel.org>
Cc: ridong.chen@linux.dev, hannes@cmpxchg.org, mkoutny@suse.com,
 shuah@kernel.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260717191814.989215-1-longman@redhat.com>
 <b4f0318df0a206a12d4a59cf1c52808c@kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <b4f0318df0a206a12d4a59cf1c52808c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 7/17/26 6:32 PM, Tejun Heo wrote:
> Hello,
>
> Applied to cgroup/for-7.3 with a couple of typos in the description fixed.
>
Thanks for fixing the typos. I did make some careless spelling or 
grammatical mistakes from time to time:-)

Cheers,
Longman


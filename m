Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724370;
	b=35eVVaOaP++U9ihW4ouf9JewzRSjgAB/Kkdc+rQPCDeX/N3hOJgJM1/TFc4f+MqMZaqm
	 ITM5KslW7BkXxIMWXsGXK9cK+sqoJkxwPES1MAhTwtjsE13L5jT2EToBNJIsHvnHt2MMs
	 VPFdBrTfSHWooxjBV7tT0JqFUHpfiU6x+m5Bkc+xAR4jiX4UQyTQwk4w+GmXTuVw4yYGI
	 nXpVoASZKjmlVZs78L/+QrfZPDQuiwCpIXrnC3nz1JGZ+9r2Hig3617Uz4z6THKC+j3ZZ
	 2XFJRVAqB93OmWkEUeL6RrzWMVwWzrsyx5QV/WiCcpgDILgC+3oLbfPbAUNWLT9wgvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724370;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=QrQxpAgOB38zPWPykzyeyLu30lUbfa9ddi7dGDk1YNA=;
	b=BX+9XIVHrdb2Kj55bykDP4egogwhNWUR4WjsyjDr0kyNgpAYK5OfiBt0ZBTPQcj8Fqwu
	 bxUv94hjM+7FEtiBaa7ep4xaOO1w16rDu/bEWv+hha30BxguWc/dVTd/vN7pq4gZVnoz3
	 OHXLA3bELngQD7uZbEyd0oiJelhH1MJcV2Wv+T5Cyvu4o+9SLKO0ojI9k08Q7vrcAlVce
	 1a9xZUSVPQyTpKrfEO+gb2c7FqTeGDa2Z5AtRKOipOF2ZU5KJ+4cc3LBxvuzuSXLiAMez
	 xnXcInrLLurvXWgY2dyr14ncDAMyoeqe89fsqYjF9nIWDWocLDtE8TIKQeKPBowiOhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iZzu06Zt;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A196E606A329
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 16:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A196E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iZzu06Zt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793724368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QrQxpAgOB38zPWPykzyeyLu30lUbfa9ddi7dGDk1YNA=;
	b=iZzu06ZtlqzR1vHiN8GKNeAVWZPV2Uz+e5l+7vOWUnMNf//IddEzZD/xngwn5Ko114YweC
	kXapQ32LvCDjSm+7azIz2O2tUJigjw53D919NRqA/c1XK0dmw+aGj4aqJgAo/x3KwkLxTd
	IxPsOLeUkHL2kL6DIElMuXpB8u9lK1c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-inK9B4OPMa6z1NdhMIdAQg-1; Tue,
 03 Nov 2026 11:46:05 -0500
X-MC-Unique: inK9B4OPMa6z1NdhMIdAQg-1
X-Mimecast-MFC-AGG-ID: inK9B4OPMa6z1NdhMIdAQg_1793724363
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BB3319560B7;
	Tue,  3 Nov 2026 16:46:03 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 734531955F43;
	Tue,  3 Nov 2026 16:46:01 +0000 (UTC)
Message-ID: <33024a13-9706-486c-aef0-aeeb2193c8ee@redhat.com>
Date: Tue, 3 Nov 2026 11:46:00 -0500
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] cgroup/cpuset: Fix some more bugs in cpuset
 partition code
To: Tejun Heo <tj@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, Johannes Weiner
 <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261030190701.78308-1-longman@redhat.com>
 <886a562b52b1c5094142d547a8336457@kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <886a562b52b1c5094142d547a8336457@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 11/2/26 3:04 AM, Tejun Heo wrote:
>>    cgroup/cpuset: Fix incorrect CPU accounting with parent's
>>      effective_xcpus expansion
>>    cgroup/cpuset: Recompute effective cpumask in update_cpumasks_hier()
>>      after calling update_parent_effective_cpumask()
>>    cgroup/cpuset: Do housekeeping check when isolated child with root
>>      parent may get more xcpus
> Applied 1-3 to cgroup/for-7.4-fixes with the following tags added:
>
>    Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
>    Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
>
> Two issues I noticed:
>
> - Three of patch 1's new TEST_MATRIX rows end with A1 as a single-CPU
>    root partition, which has no sched domain, so they fail the ISOLCPUS
>    check when the script runs with -v.
>
> - The comment at the end of the "partcmd_update w/o newmask" block in
>    update_parent_effective_cpumask() still says there is no need to
>    adjust the parent's effective_cpus. Patch 1's new expansion branch now
>    does exactly that.

Thanks for noticing that. Will fix that in the next set of fixes that I 
am working on.

Cheers,
Longman


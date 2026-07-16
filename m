Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78643331EAE
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784231303; cv=none; b=MaVen4ug5hoLo7StVmYggUSXQaLiWs/GqtV+g/RrDfGPS8c5R+yIw4KeWnN0TF9QndZtqXorqRrU7gVxK+Xzol/bW+PFaF1iAkkbAvPoSmFXhSCzBr+eiIG6W7yKeDKb02Q7xOdVd2T/ESHqrr5/eoLfIvjVx1NoJEpSgu//KMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784231303; c=relaxed/simple;
	bh=qQfDZcOwpsC/ym7viy17zcW7VyMpPG6ltPOCakGf4D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXXh7dc6sbktcAcM94ZQ0hyE0dmng2ZTM61aEZ8EaQzdphTVI89r+ppdsdvIIziiXtYPtlmiF56cVN5OdoHBrNLoSX4rH86vRH4vpkoe7CdJ91Q+r6f6n1Gxu02EHv8l6tp3wkg0geGWewSQpGANDnIHeCmC+Y9fxj0RugOXmsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eR/4SR6H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eR/4SR6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784231301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJKAFa8oeosBI92Gp2QeuHfio6KyGkAKoYstY+5bCeQ=;
	b=eR/4SR6Hac0AgIhgW8puPEaD53xNib3y1i85QKgGM29vtZwnvDSNKgACiCW+k+pXwRZZ64
	s6Fysq302IexP7vCvwlNtT5d3+0CGORAoIQF9oDe92Pr8g1ESuSQCOVnw5GYEk0aPh2eDp
	nZNeqX3mXlz53EUlHm28LS+SMcBxghY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-0yTq0A8fOWKabBrDOd6apQ-1; Thu,
 16 Jul 2026 15:47:11 -0400
X-MC-Unique: 0yTq0A8fOWKabBrDOd6apQ-1
X-Mimecast-MFC-AGG-ID: 0yTq0A8fOWKabBrDOd6apQ_1784231229
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 530B41954224;
	Thu, 16 Jul 2026 19:47:09 +0000 (UTC)
Received: from [10.22.65.113] (unknown [10.22.65.113])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C9B0B3004082;
	Thu, 16 Jul 2026 19:47:07 +0000 (UTC)
Message-ID: <e431165d-4227-4aaf-bae1-f44810d76ade@redhat.com>
Date: Thu, 16 Jul 2026 15:47:06 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next v3 0/3] cgroup/cpuset: Support multiple destination
 cpusets for cpuset_*attach()
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260712235510.373125-1-longman@redhat.com>
 <007856c9-3506-4888-9818-8e4630b37fdc@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <007856c9-3506-4888-9818-8e4630b37fdc@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 7/14/26 4:57 AM, Ridong Chen wrote:
>
>
> On 7/13/2026 7:55 AM, Waiman Long wrote:
>>   v3:
>>    - Swap the first 2 patches as the original patch 1 can introduce 
>> serious bug
>>      without patch 2. Doing patch 2 first will be less problematic.
>>
>
> Would it make sense to squash these two patches into one?

They are unrelated issues. That is why they are different patches.

Cheers,
Longman


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017191;
	b=0M8hEYKUsJl8erxfQg+LQJbFlGSHORW2nf+PNcqk7ZYGUegezNMVjvkhGQizg5dEYPoE
	 bko0tSOW0LcvYi/9EXTcg1+UYqJ8P8BZBuPvDN0PFiKBf7u54sWKq5iA9ZBbTzU7xydNQ
	 FBufEs0Q7Gkko5oSRtP273N9bpDtmtg5EuK8rMlExQhWodoQz31kdWWMrDZRn6p+bJ3PF
	 ZdVn31DpX9YBgPSBVT9vmRJIUcussdy2Koo4S7LfB/XUV4kHrX1+QJKMk9z/XFSQ32drp
	 fbZ24mgDNOIcRSn2CQxu+aGb3u3KegajZUfuwyECYyLBnAlRZUAa9Qy6NKAHn1by1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017191;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
	b=XSJuuHU1UMbhlhl+2L0fXE786M851xcnu9d4DMrvweXNZODsyI6K6ZpSfTNfvLIC9HLi
	 eBBkGmkQ7A5Ym/t7qbupozFjHZUIreGp/KeVkSYIKgTcIKFo0nqbZXmQM4Gh/f7Pr8sqq
	 29XebVFKRvILzYFgxQqD5jJfgGGfKMxInVpE2IU+yf8Sp6Z+YT8SI8SQpwNqsWM+xxsj3
	 W7ln6Ig0nj38Y9HEMaXRd6iGo13D9ce4ju5Vhtg3sXEBj6AY6bO1WfpRXsVl15fWS55af
	 5VmWBEBM2fHSxIoFskUckrpm1IGLa5OC48ts0wykNedzKd5yh7C1JpGRSXE3jxE9mCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GntU17sT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TGw4wEhA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B5B606A330
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 15:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B5B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GntU17sT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=TGw4wEhA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795017190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
	b=GntU17sTwCEPiLDxsAqaaHOhZPXKJ7NLXyZMmlw3JzRCYtB0alzbzQZycSXIpOriK7VLHv
	t8hAaNRiK99MmrAtT7qhu3446lEtrafcw8570cbYm37YyB5TDVQWZnHfOAuKh2yrlzPW41
	PT4IZ5RMTOA4Sr8sl9fSZETH13RTWSk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-a7k1hOAsNqK1QWmnBbFrdg-1; Wed, 18 Nov 2026 10:53:08 -0500
X-MC-Unique: a7k1hOAsNqK1QWmnBbFrdg-1
X-Mimecast-MFC-AGG-ID: a7k1hOAsNqK1QWmnBbFrdg_1795017188
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4915ba023d4so835186f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 07:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795017187; x=1795621987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
        b=TGw4wEhAEYz6dqxQddcwF2q5nSNk0fQ5KZjLd4qAAC0huj85vW++9H7xg052kqQirP
         4/7ZflEl59RJrPbO/EwbDUqXwmzPJxlBDlLJ6s7npb3cYtAN2ekn4ofpZVQwed46KD2c
         Eqs5qRBbPDEBSz2TL+ZkYV7lvc4UvrGUUE9R9vhHD+DOnNoRQUchIlmhv7hs+g8wY2nL
         J0JBUz2GRuOtN6+q4vogAaMvpb3HTZlwBUp2c/VYqaiYtc09cziupcrDNI/jGLDgWAfZ
         cGBjqv0W6tTxOfu4dSrjQALmErhn9ZYqntp25FkEf9b/XdZoC5XKRUbvE5UBGfnETMIh
         vWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017187; x=1795621987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a85wi9zMKa3ITk5iiE5QycHbAdVE4Knzk7eFGcpu7xQ=;
        b=ceMXCyaKxDMP6nnW4x1H7g0eiY9wC24fmLSMs50Q9M0kZvSWFbnv9eKr3jsGd9dyNf
         AwRcnV91ZxPXziy5WnLvmsb1prDHax+55aLR+zbLUgaTbh45ZbnXr3Jwf1Chexqy0nCj
         FXNkfS6T8quyHfEqHE6ytXT0D/BTbdP+kgBjJ18cyoJuNojDtAtiZ97DLuLgKRs4+42I
         8awpheyxZzOORRSPcVoCAfU9cVTq1BpIjVk2wkNhcIAeVGJuJywgU5dLrlxEtOje0ph9
         uLM1fF8GlE2m7c0y9DiSDVhIPlb4JfhDaXOoGE5m7dVXBjI9/2QtVNDqGFk8VR6XlIaC
         WbIQ==
X-Forwarded-Encrypted: i=1; AL+hErHJ9ZnJQ+m18ltluPzInSPEy7ZHdbpUkDk9FtEO+czcJs9jxK+91gaYAM4bmUKcikkAsC9ruq8WeeqkVPTABp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IDQWaczbYsILni4vfrXKVqzoGgVezD/mCJaMa/voCjnrlqOAb
	UrefDuXu1cbl87oqU+WugncWTCnbF0hTdGToajnoGQY9dM2kxCqtQOBdnNtVQu/ktUIpzXcasD+
	gdxGIQevjmJ91NwIYp8k8MdFZT+OCOsEuYTC52T2wHmLx5NdbopOTbnF70GaltQ3WgWxYxg==
X-Gm-Gg: AZFdTZf/2PGQE7aW5KP9X0Y/Jr8sAkjLO57a6V60X8BK7bdsm2gLY85vu2/HlRgImV0
	m5yU+/FOlB/ksczQgvjW31hvAyyggS+LUI1Dgs02zb8ibil3azw/PEbiMVeSZ2IM5MRFbJcRak4
	KThzg+BoVgidPJ+uiteUlhHnmqOKM/tEwNMkJxcOhveI5bYOpf9QUv/OTZEEiZ9ktizkJMdkmg1
	IvuYdJQSWGxarhEllK+pcMgDxXhrE9889C7+NBJmluw0l2gP6Pu7mtUvZfFGfby6GkxZ3uClCFE
	pqlg2M5R2e5dZB8fYfnDlnwZS7AQ1lozprNBpqRGSpHJ6p41cNkDIQt//ik7FQc58MkNBVUkm5I
	0PDpCY+t465Dk+3W4D/LV4ABcojaGG+XzHfM3ayZv0dQoAjBjQxJYFy2JCuQ+G30mbUDuzFvE85
	GzinE=
X-Received: by 2002:a05:6000:310e:b0:4a8:7115:fa0f with SMTP id ffacd0b85a97d-4a87115fd47mr1608213f8f.32.1795017187551;
        Wed, 18 Nov 2026 07:53:07 -0800 (PST)
X-Received: by 2002:a05:6000:310e:b0:4a8:7115:fa0f with SMTP id ffacd0b85a97d-4a87115fd47mr1608144f8f.32.1795017187160;
        Wed, 18 Nov 2026 07:53:07 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65683d5a2sm5699651f8f.43.2026.11.18.07.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:53:06 -0800 (PST)
Date: Wed, 18 Nov 2026 16:53:03 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v7 00/40] sched/deadline: bandwidth accounting fixes and
 selftests
Message-ID: <av3J3zMfkRplg-N4@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> Hi Ingo, Juri,
> 
> This series fixes 36 bugs of SCHED_DEADLINE. Most of them are in its

...

Thanks again for all the work on this!

So, I feel we are making progress, but the set keeps growing/changing.

While we spend more time on the "upper half" of it, would it maybe make
sense to split the lowest part so that foundation fixes can start to be
merged. I'm thinking 1-8, 10, 13, 14, 16, 20, 37 (37 is not a fix but
harmless). Not all associated test will pass of course, which is not
super nice, but we know they pass with the complete set and can maybe
come later.

Just a thought, happy to continue iterating over the complete set.

Thanks,
Juri


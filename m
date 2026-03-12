Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B03624A3
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324817; cv=none; b=LB/fXCsKnOUUlY0bn5BFYigzjsj7I+D55ydhxbB4+pCjzDHoBanNYJGmkWDFgdMftcwghGGaCSKWkhaJdkToDjTQdPHa2nhnbx6/vfo+74KbUCXFozLXc+kafox2sd6qBRHQJ+KNnHazn3ps9D7BiEPqVl6YDeeZrgaIJGm9V7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324817; c=relaxed/simple;
	bh=E/XmKLa+G7QTfsAtBTxdPf4DFsDENLQT+1NNaiiAnrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWK+kHFytFMpp9IayqoSN/FFJXrowvJUwfhfm4YxKZ8M6eL/mFVY+EpysVv5YZaGp0knzsPCtlZMmHp7XNzEollgubsnLhAhihyoXHFNiQcfjWXU8cPoJr7LXZiRlnAkWO9PPh3qjEPwv/tR04fYCnVu8Dz/4RBs47kxg+Dfjh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S+HZx0WI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0CTr+GB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S+HZx0WI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0CTr+GB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773324815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E/XmKLa+G7QTfsAtBTxdPf4DFsDENLQT+1NNaiiAnrc=;
	b=S+HZx0WIL3kYsnIYHbfYkQXK3j1TwAWS14BxlIZV2GZE/sSQKBfruuby9DOI1V6qTkuNQj
	1jI3gsjpSyySszrIQCr/84wl+wdhdYkr+ffJqzYrbqlCLWzYb4vq8NX2Bs9GzcysIhP+XP
	/p5bssPZLqXm4tUgOxylB6M+8/4Omso=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-a3ESu-7aNJyY8we2MiggFQ-1; Thu, 12 Mar 2026 10:13:34 -0400
X-MC-Unique: a3ESu-7aNJyY8we2MiggFQ-1
X-Mimecast-MFC-AGG-ID: a3ESu-7aNJyY8we2MiggFQ_1773324813
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-439af7ba802so1129420f8f.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773324813; x=1773929613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/XmKLa+G7QTfsAtBTxdPf4DFsDENLQT+1NNaiiAnrc=;
        b=U0CTr+GBo3wBvOtBIxFrohwB1fSyL44Q9cyoHaX3LzJn3cY+FYTvdT8SNxG8gxuhlb
         XIXLFdwbi0CJcXrbvYWvyuCS6XY6N9um/jUu3hC5ZS1qiQtFdPnvItdeLDFGYJ6d9Ohj
         RrmlvhS/e9DTos+nVriMV0RrVERmCN9E0xOWPcVtDKaGidmdAhaUv2e+7S8UCJkKLOe6
         fxhB2akUBUeMDu82CvZeJL3GF9T/RfUwkGtK6heZO4rR20MZQtzfhEv6d+osVL+1RhrI
         plJMq76EY9zRQkyS8YLr2NIxN6ni+znydSOF0eC/sXhJ+dqX17QJf609WgY0KLYZsEbY
         ObNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324813; x=1773929613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/XmKLa+G7QTfsAtBTxdPf4DFsDENLQT+1NNaiiAnrc=;
        b=BpUNr8bU0HB/KgL1yR6seOQqvJIrWFgCNZu1U2qmdlFLPP91R/1pG9Xt+2ADQZ1kQY
         HYPMT6JRn5pDaWaX+xf6VwfHJbO7h68vrnedTQ96+y1/FlU+up3armwUPQb8p9crmifB
         TiMgsR/BWqS6L+u/+LqSmSCGOabg5SwFkbKqDJZvNeKfpnD0tYSKvgK+0RKXxzLtLquZ
         mK7wL/kSQylsIhkOk0QJpMLWiDqPzKHlQUmhLwmP5Xnp6Y64dKA32KKRH4/TsaXJkvsQ
         d8HIjqBJVBWEOjuQx4M9Ta7NvuYd+RhH8i67arp9IKZ2o1U8gMsGPiEYye/MGmpBPB8i
         QNIg==
X-Forwarded-Encrypted: i=1; AJvYcCXQhwutL1zazINSdzZvT4jtajXOMV9UjNrM5Kn/9e6VW9NLMO4P/yqHgAZ0RWaqegBmC46fGCdwC/qLWowaIi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHWvD4hxFRh7uRpWhpmjAi7ZlT+t9qbGHngtaNcQw9mfRnTpb
	DCFCkK/oZIqic85jdzMo8heEaNE/QzrExLrY3Iqv+l028ytVW9IGSJSXdd5ZNQI1FPjCXOHAzIU
	+4y3C4Y8dUwHCLYfJelq4jV5IOLNQVvDXSvJqe+i8OZwjiPgqPCOHrWF4TI0AZAZxy3C+ZQ==
X-Gm-Gg: ATEYQzyVIR+1HeOe63qGCFhy95KC25od8RDxTh86dA6BAUhquuCUhWRL1xrQca6WMsa
	UU0l16EFR4AO/1+vYU1Qd+so8z1QL3gT+X15laIDbO055MVimSq6Sf2XMPrngWjOVa2aEu9jsDq
	CmD2rUekxabZ3irTIExILdMkEOMpQSzD0GJEr+gZtyGF0zYx9K19aXDVpqRiVS4lAI0whaS5iMX
	xJmWIplz/nMmhde1rt0cwGfJCAOIfDbt9HO8n+RKpKIteqOjdgSkDBRlgSyUc2iek/4qYU0tURY
	aTFe46WVGNGLoqNDSGiVcOOQTBGcOHWoky1Z0YaY6kqG9UNy6Sz+/xwgccqCZnnv1LBPohzmOmv
	i/45t45/r7M99ihOn+GfmkRl8pKG9TTxsr3H3bxRl0oETn/QSCWY=
X-Received: by 2002:a05:6000:1a8b:b0:439:d8cc:3628 with SMTP id ffacd0b85a97d-439f8423ebdmr12571929f8f.49.1773324812606;
        Thu, 12 Mar 2026 07:13:32 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8b:b0:439:d8cc:3628 with SMTP id ffacd0b85a97d-439f8423ebdmr12571844f8f.49.1773324812021;
        Thu, 12 Mar 2026 07:13:32 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm8153776f8f.12.2026.03.12.07.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:13:31 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:13:29 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 5/7] selftests/sched: Add SCHED_DEADLINE bandwidth
 tests to kselftest
Message-ID: <abLKCcyNNU5bywkd@jlelli-thinkpadt14gen4.remote.csb>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
 <20260306-upstream-deadline-kselftests-v1-5-2b23ef74c46a@redhat.com>
 <129bb66c-74fa-4795-8d79-6c8e10a66e17@arm.com>
 <abFsuvsmEdoypYs4@jlelli-thinkpadt14gen4.remote.csb>
 <da6b6b85-25f1-4b22-9638-d68b161331a4@arm.com>
 <1d09f674-0c0b-47fc-abaf-6db6b01c775c@arm.com>
 <6e2ac024-04d1-43e9-b209-939e622724d8@arm.com>
 <415c7e66-11d5-482a-84b6-d4496c597c1a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <415c7e66-11d5-482a-84b6-d4496c597c1a@arm.com>

Hello,

On 12/03/26 11:30, Christian Loehle wrote:

...

> For completeness, although I'm sure you can come up with something equally good:

Thanks a lot for all this! Will definitely incorporate it in next
versions!

Best,
Juri


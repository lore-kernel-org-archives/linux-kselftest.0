Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4239DBFD
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323196; cv=none; b=UP37KQ8/IV5pM6wPk9xNHEJzmR4Z1YiKsuSqEas+y6ABHaq34dr9vXEB3iYZhmzbdB5i8h6wUXJt1xrGYakDn8paD8FJQ3DR2UL59l/T+kntkhanddfwLXv8qAj/ta8aZXMS9IjdgmB8fJxaM1YmfWTl8C7MFmbZTwho/VdJ2Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323196; c=relaxed/simple;
	bh=f5eH5RegOkM7tGHSLW8Dz7E6BRWVYutqTpKrSDIEH2A=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=KO/i+ap/PEjUHutw6gGuxazU+qPQlqc/ZiiEktl061XjmC8dxZRbCQQu7kYszhEtb+/8Axzq3agptjrM52UaC7xBS2xh9O7PrYPR/pAQximMNnPu0/y6Y4JkRhlaFxJB4ksBkQyVlhANL1//3ElvrPzeAHoT9hPX35bRdf32zDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=el8akokK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=G0JybkEC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="el8akokK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="G0JybkEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774323191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bba+U3knOzeMlTadL9yBzgVDq+/4BqrOIHttcs+EzXc=;
	b=el8akokKKinVVGu4tam0/BgKw6KOwc0AhMEmaMfrBirPhmpCQUP9ZraY12U+2UqpfcKDpH
	4PTWEKUJu7UpLAuVVEIme7z+Dr+pBCGB3v00+QDeyoiRnZC0KS2rP5CbZNawZMVombzELh
	NnxYCxYLLxqfU+Ng5Y5bDWZ0XcF0CsM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-EgWTQNsMO4qy4bWzXLuAvQ-1; Mon, 23 Mar 2026 23:33:10 -0400
X-MC-Unique: EgWTQNsMO4qy4bWzXLuAvQ-1
X-Mimecast-MFC-AGG-ID: EgWTQNsMO4qy4bWzXLuAvQ_1774323189
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48531e6012bso67316845e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 20:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774323189; x=1774927989; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bba+U3knOzeMlTadL9yBzgVDq+/4BqrOIHttcs+EzXc=;
        b=G0JybkECPPKgl7jP5qzZW9XuxC5JXfTTOgYCR3mhb0y36p4p2xhJIY7P/jfVLzdJWy
         OZ3dHyYLqqG1SdP4JzIDCoYY8nB+9fOPevO2OCtM/Ob3qjKHuUWyFsSEy3vNjl2KD18w
         5mHMuFfvov0kdw9ve33hYp6jzsTVWS+mxodQUkkjdaVjCapJJaHnitwpWQMW/bDddhOP
         KCBtrXxgA6plpLXbMQS/CVTUjivoE9Zj3w+3Yt8BKrGnaWigcXhfGcaoDUesOiTKVFkE
         IiJFd1tw0Ai/4FhY8Bmd00T4d4opPNQ+FpEsi5nCPE19dGSz9JAS91pOiBiM+DAzC/lA
         jc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323189; x=1774927989;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bba+U3knOzeMlTadL9yBzgVDq+/4BqrOIHttcs+EzXc=;
        b=A3SAnyrjKxIqmGPf2yjJI1C/SSVprYJBjXJ28iIF6YQ9pTJliXgvkCfMO+UGYA7BMI
         JoNN77Q5NtGTgWtUuzXKHexxY6oY9oURj8rgQg4GASiGkBqpnsLIGDUMOkysjFMrJUYd
         nHyYXOz+N07Yuk9maXbNgmeKLlwZzp0DfL16exupSrjI3GOKG3RgPSq1zjrcpz1ZQCjt
         lmBvKAHeFmys35KEQ+XTGJeK4y6ikYzR4f7ANvMEEzFSo82fYxvd7xt3jNZTpDWLiwgP
         qQEO1uka5KNuLIQsPqJVEWHxdAseyRCkd/VW2Kxdz1czxf3ccHIEkWSBeWgbY5kSnyU7
         KGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKAb0A6oY0OnPL/oVi1JY5zT0qY7CSqQXb36EMVGwBWBncExbN1Sx3HKZSXGS07xmH/UyvVTFBx2XgbK4B8GE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2cfeTyVVyJkQNmdUCbSEyTyK5Pd4qTv4ZXjgOQO1uVOJOft0r
	sHw5AulmZ0Tdel74KgKKKvnZkOWgCfd9c4Yf9u1NpLn7CR0qzX46pRHyAmP4/xxlUC+5wx6natd
	JBYQUa3c6SVHt7C8rzfm1dWXVj5WKahBZwR7qF4TOQDr2/I5EvsMaXDdh+rqFjQvWlv6xIg==
X-Gm-Gg: ATEYQzw4v+gj+0wm1+7SD4NcMOt2Ho333Fx/cSOP/nMf7FA/67Jgs6VyGImmVIUMD5P
	14L0QQVPbmlqnxh+Xmm3xqpFV+gUQgy3f+F6pFZG7s/Yniq1hn/l/pxmWMpmuaYC4ftLeR4tyui
	W/h2Ev36Pm+fKbZsykbAOFKVIZbRnNkUgnjqpBf/ombalBjT7vlasO/ZtLGfChZh4SxrehYdjyz
	F6PExdVqgNCPFqb1oNqHxp2o1g01w8mK/nwlKKWanPGkA7ztiLU6xnZDF82Z9EaSVIfvApxgcHs
	cW39DH4/b0uOH1vQAYxK+9M5py8adhjx6a6ln2FPUPcVJdIp+XOtdR3k+nC9QY+4eKc1frTD1uc
	XG/gEz71ALoSvK+6S1/YA3f1iX9861Y5SLgZ8sbNQEe+DaXehww==
X-Received: by 2002:a05:600c:3112:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-486fedb8c6emr207657855e9.11.1774323188793;
        Mon, 23 Mar 2026 20:33:08 -0700 (PDT)
X-Received: by 2002:a05:600c:3112:b0:485:3f72:323f with SMTP id 5b1f17b1804b1-486fedb8c6emr207657675e9.11.1774323188210;
        Mon, 23 Mar 2026 20:33:08 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711022f37sm11668195e9.9.2026.03.23.20.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 20:33:07 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Aleksei Oladko <aleksey.oladko@virtuozzo.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>, Ilya Maximets
 <imaximet@redhat.com>, Eelco Chaudron <echaudro@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, dev@openvswitch.org
Subject: Re: [PATCH net-next v6 0/4] selftests: net: fix false failures due
 to missing features and host interference
Message-ID: <20260324043305.260d26ac@elisabeth>
In-Reply-To: <20260323195813.7ebccd88@kernel.org>
References: <20260321215908.175465-1-aleksey.oladko@virtuozzo.com>
	<20260323195813.7ebccd88@kernel.org>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 24 Mar 2026 04:33:07 +0100 (CET)

On Mon, 23 Mar 2026 19:58:13 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Sat, 21 Mar 2026 21:59:04 +0000 Aleksei Oladko wrote:
> >  tools/testing/selftests/net/pmtu-test.sh      | 2492 +++++++++++++++++
> >  tools/testing/selftests/net/pmtu.sh           | 2492 +----------------  
> 
> I think I asked twice already to fix the test instead of wrapping it in
> another helper.

Oops, I guess both me and Aleksei understood it as "fix the test _by_
wrapping it in another helper":

  https://lore.kernel.org/all/dd1f8981-b8ad-4a4d-b6c8-3333fb05c93b@virtuozzo.com/

hence the current version.

Aleksei, if you need further tips other than what I was suggesting
(assuming the only way is to run everything in a namespace), this could
be another idea:

  https://git.netfilter.org/nftables/commit/?id=a9cadde4add1

-- 
Stefano


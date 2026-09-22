Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E31C3290D1
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061595; cv=none; b=h4IAIfxxAzFqrkyslPoFWKFLOG6lKGxJArMIjXejkTGvUuK45HXZIqTmAQ0GR83yk/1Yjx7U7408XFk3NV9mnoArlPYexX9bMty1X58B7BRt9xameIOgMYj8n/T/nIO2WA702pDDxA871IDPDMAnWSIm05SwbmXeeNkyvzgUA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061595; c=relaxed/simple;
	bh=mBX4z2VJhRPZnv9f6eQyJQ/gucy6LJHIvxxPIGWeDPw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ti6dQ7eZ7Kp2KhHan+3A9oAhh66DieDrC59TbEbeP3Hg1gFSjv17qrKI60WqIoEdlxpZ13ipR+G4TOaMl3MwnzXCArFCLJ6jSpa9FsfucX4o6v0aDcizyVxXha4ebeGuZ/b4rLMkz3nNj0QnLn4K8soTNYhtLL5yd8km5QmcVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=o3/CuWWo; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="o3/CuWWo"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so1280229b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790061583; x=1790666383; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBX4z2VJhRPZnv9f6eQyJQ/gucy6LJHIvxxPIGWeDPw=;
        b=o3/CuWWo1PNUAQzOW4VOrvb7FyAvpDmJDdx5zblAUMKpafdyosFoUUN0EGLrYf1H9H
         HRiCQU58GlLwmX+aJmppZrbZpvm2isMjnBoz/lUTC8rm9lh5y/bu3MSZ28LklMfB6rKA
         GnQvfh4XB0xToVwDXLraDThRPDZ30agSIwGOBLYKauvzd+LE7mYMZJFHI6a0P8g1KRLW
         AjI4Rc+WyT3wPJwfQUCdnTx/ge5tKzg1XIzPQJTYFo9PC4KXcZBOjbeJiH3ALsl+73q4
         SLIMnPn/7DJplJcEws7vknQvNs7ngV97rVJlCnF9dJeyGm1hydpxYbV+3JcTl4OEUYFp
         04wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061583; x=1790666383;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBX4z2VJhRPZnv9f6eQyJQ/gucy6LJHIvxxPIGWeDPw=;
        b=2FP6na/13cOZU5TVGTD+v4+Nh0VCJYIjZZu3+6vUljk2nxPbWM9nnzgLRuxFmIgTCA
         ZwD+T/SQG2a4lYERkZzuqgn+0ywrj9OtuyPBsvzAlWdc/RVcaJYXp6e5Te3CV5sqZePd
         9p4awDMm0r5U3CSqJTrOszruDuCNi+0McFHo1rgsECL4hDXspI5VuLCQxciFfQ1meEzm
         VUFloBJmJrP8g8zaRb+W+y3JZHAzHJ/QbJKhZbANK3DhgFwaRl3sZ46ZvArYsoqBtqZi
         KhCTfvJB+URJGIVjZVUF7OzFURC+82pS+xe8ERB4Ep5i/DdVec/wIJg61AKQd7oPxJ35
         ouww==
X-Forwarded-Encrypted: i=1; AKwUvBydn3AP/itNOnu9SPbw8dQNREIAqmGa+WgOkLmaEOaPDm6jDQIQXWWkbbfgSlBWSepBh8IwxFlokosphQoIYO4=@vger.kernel.org
X-Gm-Message-State: AFuF++mUuLAtUvqn7YkUCKBgq7/45vAHQxmWQxggH3aGwOp9qtPNyswN
	SwtwZ6iaVkprtO4B8qjqPpzmmJ3VAp1J3NvfOwvOFro6jU28k3AsCvLdSMT2Vz71N4w=
X-Gm-Gg: AYBFou1ncI2h7LvXhkE6e+Xq0wELWK09d2S0F6zXzksEzm0YBoXofBqpQSmgYyQtc1K
	T3YxpAGBEZYt9ylhnIaGuA+3oHWjuwhH7FQl5+CDJ58kQytfUMZ++JeRb2DPpZ4wmy0inA0h6RO
	BDtmbhAvEQWYOiNNm7Cci3H/4NrZ+NNeuG3X1oZESle8xaVf4UI9wq8avRkU6IspkVx+PqS+r6w
	eklLg5RK/qVGKZ2UWYzLs1ICHZBKKHTfclTJjJDNgVCIL/0bZkh3KYXfvnyLYijdCVUbQ8woy32
	a94VI7yodV0qAzuhj36SoGAlvsDkJGANt0Qy5yoQnB8CTpC1iiduK4tGQipvDC+u5emypXiVUua
	LPedtQLfn5Ki0u7zoOk9LVHqF6kiX3o6e9MEM3kjNiGLpUF2+HgmPl6kTbfPnFbySkcu/0XiCdw
	MUxOzQZxPIgfXHzxfIKyQ/pSb+3hfDhKgrPCrBPtBrTvr4Wda4A4a36ddEnc1AI6+Oow==
X-Received: by 2002:aa7:914b:0:b0:878:3704:e0f6 with SMTP id d2e1a72fcca58-87c8cbd2624mr162498b3a.28.1790061582980;
        Tue, 22 Sep 2026 00:19:42 -0700 (PDT)
Received: from PC2. ([175.193.106.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c324cf14fsm397422b3a.22.2026.09.22.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:19:42 -0700 (PDT)
Subject: Re: [PATCH] selftests/mm: mremap_test: handle ENOSYS for userfaultfd
 and add missing newlines
From: Park Tae-sun <ts930@dgu.ac.kr>
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Park Tae-sun <ts930@dgu.ac.kr>
Date: Tue, 22 Sep 2026 16:19:40 +0900
Message-ID: <179006158019.123863.10328178989374348836@dgu.ac.kr>
In-Reply-To: <2e0a8157-a529-4355-bd7e-11ef0234b825@arm.com>
References: <20260922065143.118702-1-ts930@dgu.ac.kr>
 <2e0a8157-a529-4355-bd7e-11ef0234b825@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sarthak,

Thanks for letting me know!

That sounds completely fine with me. I independently ran into the same
issue while testing mremap_test in QEMU on a minimal kernel without
CONFIG_USERFAULTFD, so I'm glad to see it addressed as part of your
larger series.

Feel free to add my:
Tested-by: Park Tae-sun <ts930@dgu.ac.kr>

Thanks,
Park Tae-sun

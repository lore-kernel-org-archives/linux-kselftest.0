Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D33308F2A
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315268; cv=none; b=Gec+z2UfrPT6+B6ZYDBump5JiIp83gCx0+Mt5GcGkl/etSmlRTO3SBtGLZZ3JJCE2q8pgHAwy+9kjKzI2xXWfiyDjpd0mup6ljIv9Id5TwXrWVGgUEZjtrjQAPIHc0s+A6w8IehCJCEmXbwf78hQBHQx+Rwo6//HUr3GP1Nnmgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315268; c=relaxed/simple;
	bh=ghOsQH0i03fY2GUzhcx/Dmw646U50YyZQKib/BtHePM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZT6IzRzUSac9q4ezWF2Lv8EwvT1vg9wuUQl6l8jVid9w+YhZgHIBW9FdbIBcgyXBDbkr37aY5gDSqw1daxD7n7V7EjJ41VwB1rW8Omf8IoGzKp6E5RhdkPMmVhKqivYmQwx/rNys6uBmsrQtqd+A9gBP7J+iwg1DJBr7xAYiJyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dcXyJxcX; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dcXyJxcX"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so9395565ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787315263; x=1787920063; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaWe4JF4LkGOzfYb71LTLii7vw/bVDORz5LSIphD5nY=;
        b=dcXyJxcXLg2dUWBnZlnJHED6vvS+2GROb6UoysPh+k1hbpQRjkuK8wwhtSzTqtkYMY
         1ITAbDilGz3OrmOq7jE54PUNfvbxBAYg9KOn1UvOE+E4qzhU7zK6yKtYmNHRTpjE15Jb
         HXpkw9jFe6vVQBkcQh933cSZv55e78uxwVFrBdzBVB1rB2QA/CtjMmV8audC4XFkwnji
         gkyfas3d9tJJ+i0IwKxQFSWJErcximIJIwTOR6kV7iEAyeYT5GgfZP1hBWW1dH8PvpZK
         riwGFrwFe/oAKRbzkha0wHUknPcn2OitNknxTAAqV0YuSg9dAjqJ/34iZ4v0OWjPe3cP
         eadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315263; x=1787920063;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaWe4JF4LkGOzfYb71LTLii7vw/bVDORz5LSIphD5nY=;
        b=bL/LYpHWNDz5K175xGuz+edPxG0QU3zZlWw43MhmJdsYiQ8uP8TXCWZXuXnGe6tzJ3
         weUaj+8lKlT6LY8qPfxZbmLiFvmuYhcbOp+cVCD7DEDMsUY4jyczO32Jgw7BMN59z4OD
         +WUQXFlBkxtmKYdBJDZ7uaXX2qllbzmoS6VTb0mRilRpzQTgSO4to7/Th6E9Y9fI+6kL
         BbnL8y/AJMfayPvN/bKJ4+PZR/mvgtYZ7mmWG7a2ktzFCnUL/rUgUcinhAVRYZ6yWhqy
         25qC1GaksWtGB8Th04OA6uy41lwdZThDdmRBRYPl9CKKx0bQWYTz+z7LCh9bZTzSXxNn
         /lhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqicnwX/FYxCqB2ysP3pRGBIiKXRaK/ChKksSAGJWU8nV40di/797rxr5fHZGsWxggnB8AXerFltyUJTBfyGD0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHyf0LCe6I3jS5i+2IQlM5YmOSRY4JcdkT94NFTxPa76gyG6Cm
	L8T1W1rIKo8RUBz2phQLHDoQsSe3/kzLJWNlWxE+S5cUyUH31sghn9v2LQcljQpDUEiqdg+YX3i
	ygD6GKw==
X-Received: from plbke8.prod.google.com ([2002:a17:903:3408:b0:2cb:97d4:2e28])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f78f:b0:2c9:9a2e:dab0
 with SMTP id d9443c01a7336-2d64ad92e17mr120961765ad.3.1787315262558; Fri, 21
 Aug 2026 05:27:42 -0700 (PDT)
Date: Fri, 21 Aug 2026 12:27:42 +0000
In-Reply-To: <20260821053808.1216172@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260808061934.400892-1-gokul02k@gmail.com> <20260821053808.1216172@gmail.com>
Message-ID: <aohEPpTSkLjzv9fM@google.com>
Subject: Re: [PATCH] KVM: selftests: Fix the bounds of the SEV debug dst
 buffer check
From: Sean Christopherson <seanjc@google.com>
To: Gokul K <gokul02k@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 21, 2026, Gokul K wrote:
> Gentle ping.
> 
> This one is independent of the other two selftests patches I have in flight,
> so it can be applied or dropped on its own.

This is on my list of things to grab for 7.4.  We're in the middle of a merge
window so I'm not applying anything at the moment (I start after rc2).

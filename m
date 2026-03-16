Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3FA3B2FD1
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836610; cv=none; b=Yv9ji4cHbUKWStONyCnKunlPxaEw/PtGhLdvZSELq8OWaBsKio8jCG6/XkgLDwk7jqhpo2909VrFscA1JmdSHmm08p8gTyPizlFI+xUqFqRX6JKCmsTD4LQoMDNPy/3xglYOmkyhbIYkU4stQOfdwO/RbrpdPHZdbPfzKmSRJKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836610; c=relaxed/simple;
	bh=4C0FenBlKdMfYcukbw1u+9HyE9KEWSAVZT2pNCv6zuI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=UG/sgGoWSi2f81v8zdg5DGtBMFbvVLWa/evqVCOXGH1OtxqzLmPfX0nu82kB4+3pVFPJCx4fC/P4QfR6sbL87KOzyJFoJTXAGkc2SH5/DAxBUXlOZqiA7+daVETM9tgMpbhWI2EHstUGY3zNJ2H7mfYUoNWsWVP9T8ltSiHqOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFMdpwbm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFMdpwbm"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b190easo4970939f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773836607; x=1774441407; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4C0FenBlKdMfYcukbw1u+9HyE9KEWSAVZT2pNCv6zuI=;
        b=iFMdpwbmir4JR4Xj11VpeVK+TTUvJP05jUmoE4d9rUgt/rFYDhaVxV5ajrVMKQoQ+s
         wtpJweALQNRwD3UJm0DzinkZw98iJkwddRJm3ZhVubpMK4N9YpRDqde/oZuJh7Jnfq5D
         I46OocjoSdW176sbgov6uQQ71ffOtXkdK0ljHD1qVOYhKuIIeGaYvH1EeHI7LgHX60D0
         ycayw5uoYywXUAGjNjLU/D25Bo87Zxgngs1vgicLwvBqG1juQDNQrifTEHSwrNO7UEbg
         TjDEsoMPg++OjhIad46C6/ePT7hh4wZZdsWLevVqUhIBBX3sEW1mBRu9AFQMWKp/iGnr
         AIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836607; x=1774441407;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4C0FenBlKdMfYcukbw1u+9HyE9KEWSAVZT2pNCv6zuI=;
        b=SSnXDBnp+Dz/mfM58VHOdtoiZxiiV+/NYgieBUMEYahu/WOu8kUM406WjlNMPzcqBF
         LGRZPk7nsSTFmdyIIOB73WhFF/zXtX9/iMFYXkLiMXBXIdqS+GSt/s/vozldTPDoLwkP
         jbFC98DDlRSeSUnyBjHAuRMQQRQaa0q20vAlZcr4BtB5kzAnc8E+SCQ7BDn8cK3B0/VG
         PqhrTChrb57pc7ajjnf0hx+fZ7CekkpOVTitfMPbYMHLR0/v08S8lWQQaRbrg5kMhAkC
         2O1SafAPrXpyEewp4g4tcjqjLbGNoRo8dLZY449QacNwu8VYs6+aMumb7FJX998VPA3M
         JBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxEP3iUPqMiol3VOMSAAxJunmDh4/pwTPINLUfJviu/rUR20MrHzD6uGAUcERoKDSfy/KM0LSRyaEoGrJvKpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziErhRqRfUlezSTDWUTzYMwOu8YpXI0NUcLnuEOFQ++jmthJjp
	Oq+TQHJdXcBnjx5Sd0n+FZTujbQ/ke4t735vGHUXbYRFuqOBqhzgL0LWDN2WQA==
X-Gm-Gg: ATEYQzyMtcl5HgZ8xgfr9nqM5MFkEGl/8imOyfLbeJpI4zp6ou7JKe55EwE5unFxa2N
	h951F4JkcEb1ePtM4iSMwJDvbIEtOPFNEPkRJgIe9MHLQlfCaj38Gn/ilXLvwyiwKVlhglQLKK9
	1VbI1NNbHFy3d+b2q0g9C+8dOLi0OJE9b3Ad+qfY3pcMK7YqN8wfuvaVrPf2Ujp+VBAp3YGLpz7
	8CnEWXAPpGiYmrvx0JNAAvok0MzG/9DXuiToRM/zP4cE26CT4otKsa2M+vbii4ssqJNrBQxIyuZ
	ZYpCGe9ZAFZJesVxF02S+9f8WfXhk0XzPTV/Uhgj/IsFwDaCd85I61IX7cHOSHr6p2B/0FbfdBX
	f7vKv3BgM3eOqj55dxFdBa7oluHpl1ZupDnoMzFSVUWcz129+Q+gmmuTFNpE/6KDuvJz36h+TWQ
	g9ftVgY4+ObgP6BuJnoHf0fNODNw==
X-Received: by 2002:a05:6000:4008:b0:43b:42d3:31ac with SMTP id ffacd0b85a97d-43b5264dc3bmr5081888f8f.0.1773836606582;
        Wed, 18 Mar 2026 05:23:26 -0700 (PDT)
Received: from imac ([88.97.103.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852ab3sm7793952f8f.12.2026.03.18.05.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:23:26 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net,  netdev@vger.kernel.org,  edumazet@google.com,
  pabeni@redhat.com,  andrew+netdev@lunn.ch,  horms@kernel.org,
  shuah@kernel.org,  sdf@fomichev.me,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: rework policy access to support
 recursion
In-Reply-To: <20260313232047.2068518-1-kuba@kernel.org>
Date: Mon, 16 Mar 2026 11:31:56 +0000
Message-ID: <m2tsugj9hv.fsf@gmail.com>
References: <20260313232047.2068518-1-kuba@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> Donald points out that the current naive implementation using dicts
> breaks if policy is recursive (child nest uses policy idx already
> used by its parent).
>
> Lean more into the NlPolicy class. This lets us "render" the policy
> on demand, when user accesses it. If someone wants to do an infinite
> walk that's on them :) Show policy info as attributes of the class
> and use dict format to descend into sub-policies for extra neatness.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Donald Hunter <donald.hunter@gmail.com>

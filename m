Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C212221FB1
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806011; cv=none; b=eGK4f8fZqSvmSawgXw9FoHiaEINqS9pxxLsOFcdQeMBPLPD47IXeBPxysnN3XIaz3IU0vMNX15/eWPfhLy7DZ9mBZyt1MLuOYcf8ntg/Ro3HMc9yp2hm1WBmZBRdVLimeMwq2Od8EYYLMNqXc25Ct1LfD7P7iaxaKmy6KkqbzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806011; c=relaxed/simple;
	bh=sdDGYrHeAWacIUyfKNMp+p7ytNhIh+eztoO0wVn8KQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e5CJ8YvzkVAGlfuR5Am5GMWXu4ct8YWVpa2WgHm1p/Eq7nCC9EHuIjdipYnz9glTvdc5sd4uk7l4DJPbp0GgF7n9lJAkBgDrVy1VyuwMYRzW01L+IxJeyguU13N6Q+OrH45RyHKjuxP+4O76wFyryuHtIHTcCfLQrL0Eea8++q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks6PXP/P; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks6PXP/P"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35990245493so3489627a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772806010; x=1773410810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk0hhHCfbKxfhVzW+kzXBAaDl6vDlZoTgh4BXmvqu64=;
        b=Ks6PXP/PCAuGu6YWLNqGLVSrbst/+XZXrzVohGlc4JytB9m/saxpaegmv9cIQou5Gc
         DjC7WLyYjrbVnOxGvLIVnc+gCj2inD8nGafvTpNF11ZVKmBUqzCogj4Ng0llegjdCZgO
         NAm3ky3UxLpUr6T3FdnQAxgRXn8Y/01+DW8n40siuKxAr+FPcm0fRr5LAHtnyZeH6RFw
         wyPHKzT9fHSKsxA32B+iAxjRsBQi30L/64/jH0qRpEB8zrLvSDi1CFhZV4kEOEpsnAZk
         chjEKZGHWDSHnY9Xb0lBPhHRtIHcAaeVyj9L9d2fx6QktdNpy/iHlXgzglh8z71pDmxg
         7lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806010; x=1773410810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pk0hhHCfbKxfhVzW+kzXBAaDl6vDlZoTgh4BXmvqu64=;
        b=Tn0tW2IdhT612oSkctoQVaaj7bx9v5ycWx41tEYvKdhSEW9rWJzYX1sZdv4O4VUcBG
         bqVFrJ05iKEZx4ZIVOZqRTQQm61Lg/nLiBycIB6S8XSK/Gzn0lgQ19SaKKLLO1Npb2oZ
         VtKvdv6LHlEYnh3YSpiw3y8daRkFKyQKFVgV/wiFzw89W4BqYZSFg3OOu/RdnjGtCuBU
         O9R6aG5unzSMf0tlABeQ1rLWJVFHY/axFoIzbyXhXUCcCz/39Hb+dxlbktJOMo9GL7a6
         p4WFIL8ipLi7lPHkIn2TNaSgV4cqZ82GprGYpQGklccvmg0dIAuAGWqaKXgAz0/M+hSo
         i6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzuJdNT+wMQLnY7n6En9ms3QnhpoPQB+96oOHV2PM8HnIKq8uaF0GEEUdK4o+3Rasv/2ljKKFysiy2u8Cf5BA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywub6lY1v6JpTuH6tIeTYER0itNYsU3mTCIR7S44PZ/Hi+vviRj
	apQSo7DQ4I8G2lR/5xECyztioywk8nn1gf8s8PZLCNrL8LFAsALmiK8C
X-Gm-Gg: ATEYQzyCY76YEcLCe/QeoKVXmTdz7cKitjWA5+DXvnwK3lXztAclgZYTrx1SEn5UYa0
	+lvhzilXN64XNq8SFSbf1VkTCfG+wkilbFQCGu8orzSKJCUaKEHmqWmeA3WBm/F2Dw3YidYIFbf
	iDbBvR+cAVrxgAEEsw0oY3zb5vDWSS2I+thKPMbSRs8Y4NggMUxzYOEkQazRLbXBmvzHEOvVsZ9
	8JGj4AGv/zqTCY2rQmvIhjVmiw7CF7sI2z3X58RXgs6povT5/Ka04xoyaXiQB3FEaMKLbGg4AcO
	ltH/VH9nHWybDJc83pyr7L2XSSETwEsYiLE6841WLdYMIAQg6hJniScgHKJFBuEiR+GnKfNn8wj
	fvQIg4oSXMWYR9MGQ2+7BHYNCF8FYM2vK6MtztjSFC9ZD99kGzzwqoBCr0BfRRaIwKBpAYlWVkA
	5IkS1Tn3QZ3EktssQw9xDWK6g/N3R/+G4453mWfEWM2tF5kki5BDeEjY2C0yePcuajXiLNaDkmM
	tQ=
X-Received: by 2002:a17:90b:33c4:b0:359:806c:7a94 with SMTP id 98e67ed59e1d1-359be233997mr2133785a91.7.1772806009846;
        Fri, 06 Mar 2026 06:06:49 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d60767sm5380734a91.8.2026.03.06.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:06:49 -0800 (PST)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: arighi@nvidia.com
Cc: tj@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	void@manifault.com,
	changwoo@igalia.com,
	linux-kselftest@vger.kernel.org,
	Su Zhidao <suzhidao@xiaomi.com>
Subject: Re: [PATCH 1/5] sched_ext: Remove deprecated SCX_OPS_HAS_CGROUP_WEIGHT flag
Date: Fri,  6 Mar 2026 22:06:44 +0800
Message-ID: <20260306-reply-andrea-bypass@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aareTeuAos9-Mg2c@gpd4>
References: <aareTeuAos9-Mg2c@gpd4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

On Fri, Mar 06, 2026 at 03:01:49PM +0100, Andrea Righi wrote:
> Please, when sending multiple patches, group them together in the same
> email thread with cover letter email, otherwise it's very unpractical to
> apply and review them.
>
> See Documentation/process/submitting-patches.rst.

Thanks for the feedback. Apologies for the inconvenience.

I resent the series as a proper patch thread with cover letter:

  Subject: [PATCH 0/5] sched_ext: bypass state machine cleanup and selftest
  Message-ID: <20260306140325.2710927-1-suzhidao@xiaomi.com>

Sorry for the noise.

-- 
Su Zhidao

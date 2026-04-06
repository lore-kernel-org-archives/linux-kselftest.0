Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3630283FEA
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775446655; cv=none; b=NBOPXe/PVmaOySeB7I23iA/P+SeT0YddSo570x3JbtXQ0YuzmBwIYIJ35BorfD6FfCEU5XO/sztULCiWw9f8hYoD6/g/zrUmrSFe/x8AE6MME1krNVCbzB3tjVoVR82j7dNX/BU8FaZ4EnzeDlA9Rl4wEZsG6p2vu9WfgJGyIh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775446655; c=relaxed/simple;
	bh=23vKraEQA9+Xs0hus4h8jHXPVRTYv6DHGeXNeuMkdgQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=omLmRK4NWM3J2AQtzz7O+WV9J6BC4XVS3WFE2/Xd2LURXouGhfZxDsT04PcxRWSNr++OeI+UOBrYN3/Ct0JqnFPaVRvfqW21EqU8ZG8tTKpoeregbgK4OIqrYim5oPefq5nN4z1bmUxIRhuU9lfiHltlIfy+WcB/ZFVzE7fJXsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVXqiqz1; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVXqiqz1"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c76af79f029so1317934a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775446654; x=1776051454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23vKraEQA9+Xs0hus4h8jHXPVRTYv6DHGeXNeuMkdgQ=;
        b=DVXqiqz1bugRosGJt/kBSQdAGhlzE6cSfG36O+W2rVsicUz/RtbRZ9UMuV7kxIz0CW
         6egKRXa+iAbBuMkxf1SwAv0+5tMAybz0iSkz8dolOUcmJW+Y9A9Xgxr2RmQaS67YA39/
         OGO+IFUhVtEw9Kh5NgTLipv1HY+I5oyPUPu0gS0x94Maq75uRWEkHbo+DMzIp3gRRMmr
         KpACHBE6I/XkswtJzF4Uv759q/hxp6EWk07t+dlXFQFn9SOQvsk2AeZvE2YZyQM+/Num
         TV6vyV5WAizcaRTbGeUygP5NaRyx2gG4dIIoNr+bPjLFFvBnmCn6ZLL+CaKSdBgr6JJW
         kGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775446654; x=1776051454;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23vKraEQA9+Xs0hus4h8jHXPVRTYv6DHGeXNeuMkdgQ=;
        b=QMAz1+WaJARUtTe4NlzBVl9WRPBZOomFjDQvuKVP+CuZk+7QDLsSeOVQfguix80ZnM
         +XsSn3O8EC8rjlmNijEvBatXuVdVLKxRPkJSFk+98QY27eHTuH1LqIwO3tIYvERlm8z+
         0E2wtS98B5/Dfs1kfgDotPX/cG6UVg576U082WUHr3ruZpN8UtbqERapiTtTIXnCUl30
         2IwwjmSGzdDPjObT0GMfMRpK579Z2kiyGwgHMCdchV5d37cl4Maei/vppDm2EFJkmEuP
         iASOVKNMrg7soJucZm4LR7YRmI3c+Em7GieZXmhqHgLELsfSXavZ96Z7tFt1FQVYv1RP
         iNng==
X-Forwarded-Encrypted: i=1; AJvYcCUarNdz7fIm9cTlh+Bw5rosMf0IsyiSqjvFeO+elaPZiYVYBwe44GOxaPnd0ryaRsBMPR6QlHHo/yumqD1O1kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+nVIr19D1oHTe8WrwCvja6unes2WZVY4nDFG5iu5hyTHylsK
	iQsWiG50obKNBJma2TnXTz8EJ1clpa0XY3yrZ1sCV52ocy/J+uAiHMSS
X-Gm-Gg: AeBDiesdQ06aIm5ViswhAE9wRMqwY7nvma5hx2BrAM2rULSocCAjlSruRHhgV0in76z
	InFZo+fL4kV9OSFFD2dEjjv1Ef0+Dqq1hhZWsXpmXh8ItCz9uZlV/ci1pkw5Ewlu49QHFtqy7Fm
	siWuOCaJtugOzyxLG3UZLWNtG/q/Ce/xKdhPGWwW4J5vGCNywEYRVf28+tFc+YzGrjKR/YY5ioy
	pzNd1I5bkqkN6wLaLMU9Jt1duHI90MVMVgKEdGwrfP++AvF8WhKA0dtDM86Bq+C9hw1kjHW7Eyb
	g8EY8PbGkpcYmWMU2P537TtqV0oBZJAZm/ZpD4D0XIrHcLcNZf1U5ZCUlOTluKBL310sgX1L847
	blAUIvaJHFI7eVslI8KmO88RwB+PWEuLi+WO0n15Zhty2+ZAJc2V7+8SWZ6PqB8/fjUzIptZ97s
	CdhNogfCbAilra6Ubsp40G+go=
X-Received: by 2002:a05:6a00:4b50:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82d0db53786mr11441160b3a.30.1775446653568;
        Sun, 05 Apr 2026 20:37:33 -0700 (PDT)
Received: from [127.0.0.1] ([142.91.102.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm13049098b3a.12.2026.04.05.20.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 20:37:33 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:37:22 +0800
From: zhang <zhangweize9@gmail.com>
To: ming.lei@redhat.com
Cc: axboe@kernel.dk, csander@purestorage.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	shuah@kernel.org, ushankar@purestorage.com, zhangweize9@gmail.com
Message-ID: <27d823e3-6a37-4ed0-9681-17dd04f9f816@gmail.com>
In-Reply-To: <adMlcc0EkqUNpMbu@fedora>
Subject: Re: [PATCH 1/2] ublk: reset per-IO canceled flag on each fetch
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <27d823e3-6a37-4ed0-9681-17dd04f9f816@gmail.com>

Hi Ming,

Thanks for your clarification. I see, as long as `->cancel_fn()` ensures forward progress, the potential repetition from userspace won't compromise the kernel stability. That makes perfect sense.

Also, thanks for pointing out the tag format. I will use my full name and email address for formal reviews in the future.

Best regards,
zhang, the-essence-of-life <zhangweize9@gmail.com>

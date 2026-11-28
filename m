Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834039;
	b=UtLbvIytMRfqvHlm1wvrnHKQVzyRzQJvoKEqih/cmWwCwbgqRB8njz7bI+w5LEZclUmC
	 8kImI9PlejtFpZdSPIzG8g984pzmkvWG18go5h9YNFQAHm5eqmcCxNhYczLJWRtorm+0k
	 /dMLJixHRflREqpFQZw8jznKPrvujOtJXP4ptYGvoxrQXbgtwOwIEs7+zzkvIjdpcWTOO
	 luQzQ0xU8cTdLHw2U6BU3gxUMnbO++kfQhNSa+LQddRRAEKmTC6cOOsx6CuVIO6cQZOod
	 3YhXMr/jflFys7LIp8cBssqv9pXIsuBqfAkrNWRZYcfbvD9i9Rg2AAjyt1AowVJsj8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=9T+HdmC6Yapk1iAmngRWLiL6+qpvVAULPjY+mcoJnZk=;
	b=so9E0XwdZ73wqnqRqbbjAuKAg2Oub4TN89v6x2vDWvhTK9lVGMG9YjMcTH0XqiGqt3h8
	 9oDlO3gas5ftd/Lof48aCkN/NAIYiibotXS9qWCaM0S6sYmo29CXZOU2r6OGU/kQxrsLE
	 t0OndhP6CK555ncTfHACObKHOISHrE+dh4Eo9pXkjJH8QztR9IHN1lbd9BSiy7lJPYOTe
	 mns9alYhbgm5EFY/ewDYY2cZRRx1wEkf7GwC03oMMYJBVh+MCtfC79GTCwBcZ7xaeuA/r
	 ZRa0Pw08RAbjj3aM08EmnuUsYrQ1ECxMCLP1x9ZVozN1GL+GTED4N27w4nR+DH4oilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b="pi/9tMDz";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E04606A32A
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 02:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E04606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=pi/9tMDz
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3866a784546so12038529eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 18:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795834038; x=1796438838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9T+HdmC6Yapk1iAmngRWLiL6+qpvVAULPjY+mcoJnZk=;
        b=pi/9tMDznb1a2G0E5fG4M6K4VKw9WxwcQlUk/AFTQmWkc06yYSLnn3wxS7EnVqDZgD
         S2FHbi/Gul7MCq9a1AsBJsvC2/vW1+hCog60VfabTHM7VHuiPhoO8hjr2PfD2IBv+Op0
         SG/5zx4sm8+TuiRU2y+Lnfi2/RMWN3RyGwEJQNgZe06gV4kNVpxcNlpyiNhnp3gEoTYv
         vxxwS0WYwN6nlPrMxQLZnslg2xZH53YM2zmO2L5UDJfI9iPV8o3ENRqveWFVShmkv6zJ
         Zw7Sj37OiGhEJxuoRY2PxcLX6wmRya6LsMCN0sWGVUehkcpVIx6gSDdx1s74soDIMtOU
         zmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834038; x=1796438838;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9T+HdmC6Yapk1iAmngRWLiL6+qpvVAULPjY+mcoJnZk=;
        b=DvGuChSV/uj4RVyjIyTPkKcHU5vEeIwahR7n9F1i6DvByiuLACwlyUc9VojRB2GLi2
         O+XCKtwM+njE09JSmGCeCiAIUtBB011SUH7+B4xfVN5c3CU/WEHuVNZHRMLnNa6H45J+
         7brOsfgbuBHkParTWPLv7g9NinYrH0Wf5NpGFzGbrshDalsmNc/SW0HSLX8VVMT3/Clc
         2FxDvMqXV+mxjcRyAxlJPyhVeCBp+2WtNsd643UjcfW4UfFFjZLfRfP3IxH3FhNUscQX
         E/GfTmCj8pNYFmzpY4Ndvus/pIxClyL0N+x30NmxLuedkcl9x1vpNknqJqkLuBntHOsx
         gKHg==
X-Forwarded-Encrypted: i=1; AL+hErEJrhr/RssTvDauw7bTmRRlHnUmsACjg5PqMczn0sc11k+75VWUpJHWjlHfV0fUjv5S6JT9+oxwpmxHFwJxcTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bx09Ryb2DB8Ts6zXQ8qe/oPzMpSEziJ2krXIeIsGDf2u1ZTVp
	fR1OfhabiJdiSuSDxR0fLAaQ210r9ftUP/GKXKp7tJLehYf/ceD0j3iZvuNd5z1ke/A=
X-Gm-Gg: AZFdTZeB7mcHWR0f1yh2EX/xXqSJ9b2ytYzW66ogfjJRjZUEUJ9HWROnC1ib5P+MWr4
	xm7eIZAfkGgVAEQeF/DJPH65F2KaHQ82ERhjKPBq5fK3eVncgZVnVzHD3jMuo3laq9VWEnHOVQM
	uuVvKjI2hroMQVlLo08o5Q2EzqxEjtUGEjtcsTmgPTR5tsBTBqo+CjVYqIc9fQX6EH+2zaUOwNi
	qCiSLaV76ANzVRnd6Ps4a++3viO4bUKSGUhSXKy7B0s9WRlobzuCqAiLHcccWaOC2OJv3WdoBm6
	2cZAeWJ4UubkJyWwyAmsky9hsvsycUnnQReidT9ddbL5/W2jKIhetFu0zDXZh5Zk1xAAzSN9SYS
	g1aLm3iJrPcrYOrkwTpCMsagOy4S2nzvK3rSnVHv9ZiOuH/U9aq93glZyldfzCB6VIytkNKYU5S
	yIwueiPza6kUTOTuLoJkRy+dqc0Y6Jh1C+m1zSHuLgzK9DLhUSFV8FG1C1AbVOVsLCcq6mFY39b
	J1wgRoRQuL3VWT4UC+lBzlPD8PzyqLjanoKnixWRgFZ5ygbAxgqhtEsfrrBPT4orU0l7EGBKPuA
	gBruFirmSDSPiQvStSj17hSZUkezF1xNiPCuDalGhE+BmryHlW0bdfvsY/PowgTiHKX0OwnQ0s3
	+PRuIRtFE0IUdeMJOUgP3bZ/2U2dHTFymE/LoVgZJCOQcoaUP
X-Received: by 2002:a05:693c:60d4:b0:369:fe81:a575 with SMTP id 5a478bee46e88-3857111f203mr31707810eec.35.1795834038348;
        Fri, 27 Nov 2026 18:47:18 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm134059672eec.3.2026.11.27.18.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:47:17 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Uday Shankar <ushankar@purestorage.com>, Shuah Khan <shuah@kernel.org>, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261126231706.1303486-1-sashal@kernel.org>
References: <20261126231706.1303486-1-sashal@kernel.org>
Subject: Re: [PATCH v2] selftests/ublk: use the configured kernel UAPI
 headers
Message-Id: <179583403747.86956.3400056102579303630.b4-ty@b4>
Date: Fri, 27 Nov 2026 19:47:17 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 26 Nov 2026 18:17:06 -0500, Sasha Levin wrote:
> With generated headers in an output directory, the hardcoded source-tree
> include path falls through to distribution headers. New ublk flags and
> structure members, including UBLK_F_IO_DESC_SIZE, are then missing.
> 
> Use KHDR_INCLUDES to consume the headers from the kernel under test, and
> add the headers target as an order-only prerequisite of the ublk
> programs, as nolibc-test does, so that a standalone build installs them
> first. Baseline builds fail on the missing definitions; GCC 14 and Clang
> 21 builds succeed with the output-directory headers and target liburing
> development files available.
> 
> [...]

Applied, thanks!

[1/1] selftests/ublk: use the configured kernel UAPI headers
      commit: d9667b1a6a3387ef934667b9a2e6c099eee0e4f1

Best regards,
-- 
Jens Axboe




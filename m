Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C34936DA1A
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 06:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366144; cv=none; b=Ptr+bG+F5+KJeEDTaf5BK/a64GpXj2gHp9TX4WwsjdRQ3gvXvYuEkPOCrRNc2TeC/JFVv3+/rLsMy17z4bB0idveNLyo8linm/b9V05oOxcmUp+wLWtLjoDg8UqseZobuP09LtltxUZyN3mH93fXYrt5SrqFhpBZlCta7pgdFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366144; c=relaxed/simple;
	bh=vY19FPTkTGgFEXUz7E3y70WuMjZlCOtv+gJ53myAkDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwFU1V9BuPch+EnQ9qrI/KGALRCDl2PQU39vCt3WTPH5x6KcQwjGIo6v62NbU1BHsnAzrgo3fxINZVuwkhVGKd3y88d4P+3T5eh3/Lzdg8EO0/Wf20F2gxGCEZwoSHNjnDvmm2OqL1fEDGkhXYB3iXOgG2yQBGYcLmFYRZrEEGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COyYFlfn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COyYFlfn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2545966a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 13 Sep 2026 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789366142; x=1789970942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vY19FPTkTGgFEXUz7E3y70WuMjZlCOtv+gJ53myAkDg=;
        b=COyYFlfnBHB8v/nx/XshDjDVasJem7bV/4x/RJsm5p94eA6I/IuAUEAEZrD0ztYd0V
         KhmmC/WHUenAv0tXqwTk4jxMeoNPMpN8aqYx3sz6ZO0LzgbomykliekNj1d0CdT5DQB+
         D8zv24mPhrzfPM5wpGzT8Xyns9MlaTALyscP5E15sZxXRqQxWFBx+aAsbnJQOCI+Ra8j
         hLH9qw+OATINzvgrsZ36FV4YoxDYsvS5nERzHwT9gQNMQGmddO23GtgELPDGiNF9M7jY
         8Ev0llDmjFg3ZQ8kydEiMPEU9AP0d8vpZhbU8PoNwpu3nd9NwY31WOnJmrogCkEfVP1z
         UATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366142; x=1789970942;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vY19FPTkTGgFEXUz7E3y70WuMjZlCOtv+gJ53myAkDg=;
        b=PmrKDw0chhswWFDE5Y24GmcFNmMXcdVtwXkFgN3nPALzOswQe+br1Rm8+eqJG2SARt
         3vylA0tkSX30e2j2R3rvINyJEJVD4eVQywo1LXck4Dn4sPPVb2x4+4y7J8paJOTrUqvg
         FtY3fnvOLzM4zmiggJA51odwHHgPz/+Cz5heTwTEExKhYN16yE538AeV04KCamXDT9Xr
         wWnjRApXhMDyx1gsJVoPM8KPZFBcUkbrky8rIDf4FGbBl2g4uaLzCom4HqI+ziDB9JmP
         P93wUIYDQIg1MqBwwSFbcJLafhmPcPE0oR0m3uQ0KjfPnNA+KOafXNYMb01kKUE9Awv5
         qn2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVdLnDvEMcuOL9pEEu3xSxq+Af7nVd65y9NZuM38+v5HQMmxWxwtxRR5NpW5VXn8Ls2iiNXH5nk12Fb0ySOuM=@vger.kernel.org
X-Gm-Message-State: AFuF++lDrdFqkHd0lGB6TfeNxXZeKtBq5q1ZjNzfM64TXiiCKXxEQUNh
	K7/pkjiVaVInqrx18CRbZAmecCdX9PyorB3iyMRVsjip4KhxJJWMugtq
X-Gm-Gg: AYBFou1tgAjjeGujKxi1ijyxSV8W2EHtHaO8sUY6dxFInO32SrwfTnw2uKvr5+YBIgj
	I9F7Qy7Mt7d1J7Gz7Hl6aALWbgFlIF7GQJKY00sWMJYemjClJuX/9PQCH7kIEx5gPFa5M4jRjse
	WVn2EBMkop/yaZ+HgBuzEf8MEf5s1bKwN0KoYjjVyF1Ddj+T4ls3yrvJaHAXbzLhFUa0vc2lbI/
	YFBmpMXuMy5oWsZ9+BJ0WVVAtjRsUj6fhtK/4ah6sbrBhc7czvpE1/BAMffUM46+NUEbFzbbHMW
	HrhgEXSEZY9ULcfpz3Y/fwkDSHrsbwWr6O8xARVdV5/1AUO0jbnv6OhqPS3EDwrAlk/1GpYiRgC
	I7boDTtN55JBFzkutTvA7u65hVrZbOWKXC2SrE0URAh/OUS5b1XTlBqDCu99UZaWj2tdXvnXZxp
	FzVMtk5TcbW8oBdPTHOJOUDAZrACxQI6nzHbgEstJT3eeHvuQEjDXqGlvqzkjvM3NFK0vlmuM98
	hg+MfJSZOvjWCnPSJYTUvw5cPPBjnKm7oyzXlQS
X-Received: by 2002:a17:90b:264d:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39debf6d6cemr2759878a91.5.1789366142037;
        Sun, 13 Sep 2026 23:09:02 -0700 (PDT)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a252:ce11:2d53:3638])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9959ac65sm18651790a91.16.2026.09.13.23.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 23:09:01 -0700 (PDT)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: Pengfei Li <lipengfei28@xiaomi.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v7 08/10] selftests/ftrace: add a stackmap basic functionality test
Date: Mon, 14 Sep 2026 14:08:24 +0800
Message-Id: <20260914060824.4003131-2-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912090213.C77861F00893@smtp.kernel.org>
References: <20260912083753.3426176-1-lipengfei28@xiaomi.com> <20260912083753.3426176-9-lipengfei28@xiaomi.com> <20260912090213.C77861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

> Should the commit message be revised to reflect the actual test logic that
> intentionally skips this comparison?

Yes, the changelog is stale. I dropped that comparison because the writer
resumes as soon as reset() returns, so the counter is not a stable sample,
and I forgot to update the message. Will fix in v8. No code change.

Pengfei

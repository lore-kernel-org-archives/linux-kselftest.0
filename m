Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4960146D5A
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 01:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775350962; cv=none; b=hz5fEl0K5rLO8645kSiuFLejAhM87TRxHwyujUtrP+qi6JfC28t2XoRLTwnuqBS7KM632xbiW1Dq5dQlmmq91EY0v9iA87t8kQSSbLrAQIh3fkK9cRjDQlE85ndMdSp+tSd1PfjcUAjOv/E0H8zo6qKexBY42CuMvOWMPxdLXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775350962; c=relaxed/simple;
	bh=RkkpgAgAsSSrkQx43Xwidf/ttpShpZFawi7OuU9ei6Y=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=PLdQbbDoi3rzO6z0H+23kCGkWdEA1TJRqPEn4Ro5xJhRHyx4F4juvTTeRZI8/enky3ngrNtg/H6bE3owy0JkprX0LsGe3IpbSfAAPTGaDT7PueHX5kk+9/53TETAU6xZxhk2fF6c/MahXLSlMdBmn9c3VnL2eKctQWVAGcnbXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgCSk2GJ; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgCSk2GJ"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c6e2355739dso1202734a12.2
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Apr 2026 18:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775350961; x=1775955761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiTt0Fj3wfOXNAWpy/sFPtcd5f5ZN7PSVBwEcFw7PXw=;
        b=NgCSk2GJ8eHC+KRxgGtbB7tjxWBUyIqZQN50hMOrbdBtFrlWxn4wYxFR8xFy4QDbVS
         zE862BT8Cby9YQOYhTxnY6vkWqofRIgUGJVQ695S8P50KxU5/5ZzvAjbyHAAG+ooGVhB
         Y/nHvuJb8Y4B8FzzXUlrmvSr0XUbsz9AzvWUfiEY/1qk51c4xXCa9zb8sdcHIFn8OS6r
         Hooqr44aXe2diEfkawIlIV1pLURVM0di5Vp/dBuv8R5tZH0rYqFpIhbKiGboqCouoc5x
         hlUkFstvYEUlFu2gfKDTax/sylhrdiZelrIY2ovQewkQMY2OIkzlax4qYBOOWt2aisLP
         T3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775350961; x=1775955761;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiTt0Fj3wfOXNAWpy/sFPtcd5f5ZN7PSVBwEcFw7PXw=;
        b=J8Qr7nTXzgnfvUkrbRVqOzKQpmEBUhdYCaZcDvctZCUnyccu7L5wuxreZ/Efo+Z8wV
         9neVoR/a9Iz0Kl0ZaxlnlGAiQyFJ/564oJRX6tTZVO/hGwoeeirrKX2Ap7Az4JzostoT
         yLfY+tNIVnnMgfGFFZevn9/nW0jVxgxyrVZ5x67s7Vra6yIoF2DI3/prij4zaGPOF6Zt
         /X/gh4Z/KKroPpLoQwz6A860OIzfQzyLTi+HCzRsRzhFIuiu+Z9hmDRA0AsGIodtzloX
         Kauz4YmarAf/QE5qHrutikvSlRbWIGQD4WXmlZ1veVg4AWB0i3TgCCQ/dMtytMS/7q//
         B15A==
X-Forwarded-Encrypted: i=1; AJvYcCV70Ki3N8hj62S7NxTrnZ0Hp1jOSNGF29+d8z+J4e5IRXowsn+AJlZzy0dQ8DvNZOYqYRsJtgPG0nkMmqm+aiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/2ik/OR14ObIzK1fOoeeWbyQdXs1K2JymOb/SNK6eaLQ6uT9
	/8Dxf6t4IQ/fvB0HY8DMQHpJUBYgoo5gf+FtZ0p1Idqdiwo+C8DG4i37o0j/amjBJ8jRYEy+W2g
	=
X-Gm-Gg: AeBDietnA8kBorQKdHoStdAdxUCHkpXEEbQp0C1xsEkDl6LA+rGRaerw4TCESudTTaf
	LF+gfoDHNv6ItlXgQ68ej9XATGeLrPNBibF03evDWxObxUVTbuek00erFtazmr02a6rBSBtSlZI
	8BS4BnNLVpzjGyXHvncqqCNlsf6yKjFiqUbVXmQzmaVnij6lMl6ebAOvmlF5xdS5Y1b3SAfXW7U
	eVHxsjCwtTMFfEH7clKvgWT1rS/t1eNStFqsKNEmrcx2E25nboQaZRzQvnwD+y+cDFbRA2BfxJ8
	utlk8N68Tny/tOoXAeT85CXJ2kfgxJ/xw6eZsff0sza+bd1b6Rn3gibMIsa7SOmYooegqW/WU4D
	vUtS//SJrYhEmibWxuNJ4GfR/44qZGC16zowG/Ym6E2SVFH9M4tGQ9USilTDWKCObRDO+HMdgoO
	+pLpibT59Oi1laYvP2eQasnXw=
X-Received: by 2002:a05:6a20:a11a:b0:398:9301:b9ae with SMTP id adf61e73a8af0-39f2f11b8a1mr8103554637.52.1775350960975;
        Sat, 04 Apr 2026 18:02:40 -0700 (PDT)
Received: from [127.0.0.1] ([142.91.102.47])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6477bbcsm8552260a12.3.2026.04.04.18.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 18:02:40 -0700 (PDT)
Date: Sun, 5 Apr 2026 09:02:30 +0800
From: zhang <zhangweize9@gmail.com>
To: ming.lei@redhat.com
Cc: axboe@kernel.dk, csander@purestorage.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	shuah@kernel.org, ushankar@purestorage.com
Message-ID: <46c04059-03a0-4488-a4a5-4bb93aa46a1e@gmail.com>
In-Reply-To: <adER-jg0JfkE4I8n@fedora>
Subject: Re: [PATCH 1/2] ublk: reset per-IO canceled flag on each fetch
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <46c04059-03a0-4488-a4a5-4bb93aa46a1e@gmail.com>

Dear Ming Lei:

I just looked at your solution, which is to reset immediately after each IO is claimed. This solution can indeed effectively solve the blocking problem. However, if there is a task that is repeated and exactly the same, then the process may run repeatedly many times. Do you think we should add some logic to handle repeated tasks?

Reviewed-by: zhang, the-essence-of-life.

-- 

the-essence-of-life

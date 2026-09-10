Received: from mail-oo2-f29.google.com (mail-oo2-f29.google.com [74.125.231.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396903C3425
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073730; cv=none; b=Ef7Q2PkGsNL56jBPHIrvHy08HrMiRs5S5DKX5TWMRdiMdPhjvFpckJJHyw3PIQb9sIEOiOnkZRUrQgQf5rkdAlkILxZWwcW5M0Q/XYB1qlQ4w33QAjWSceTgMm+FoT8x05GqtYXtsQuDEW8miWg08KlpihZtnRcC+zgL+FJlfBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073730; c=relaxed/simple;
	bh=Fv3RXwZqn495cmiP5raleJQljDMbicO0SAG8ncGK+vE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lZICF7p0VZjEBLuC5hov2PXvO6l6z+oQ0aKTFozWuXQdYFUnw40O9rNNCftqhwflcPymF4oFjyFfGDkFrIOPJhbm6GXM6iSmstMGmYS/yhM+tBT0gPjX7vp4FRRYsYSZsKsqaYBS1mnmfiDQLEzT7yF/Gvqfk/SvfzUrOEYTbzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=A8NUqVSN; arc=none smtp.client-ip=74.125.231.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="A8NUqVSN"
Received: by mail-oo2-f29.google.com with SMTP id 46e09a7af769-7fcc35eeb48so159738a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073727; x=1789678527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByTA2lPgAWA1USbCn0cljtTYE5VkX9SiQfJb08kxXuo=;
        b=A8NUqVSNyCFkg1me5LtwdgVXWPC4Vi+Bj5Q7ilEHrvaL+3qa/Q3m4l3DQ+pWbQgYq5
         C++tCPxe2VgSxnRA+A7FfBH/fkOGZLqq0v0X7T+X+KB198mdoAdiQKZaMslOAEqIDGLy
         DyfnGhvQ0ndVxJGXhSIunSMNrNjF1n7zUoi8bgRuDaMn+sBrCnMy8f9+c12ZcVxfYRJW
         k29zF8x4TxpVqKFw3JOyNVaUO/N8UzaQKOrzcaK2TuT62WXU6j+geFd3K+G85GreBIt/
         bVxhfudPgDXC5IE7QMUomMyJcYa8qhjl98LFp5wjbLVq6QzIap8cT0kcIJHRazZPRpSb
         Qe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073727; x=1789678527;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByTA2lPgAWA1USbCn0cljtTYE5VkX9SiQfJb08kxXuo=;
        b=Op5ZJJQgpz16bf+x5GPb0yDemSztGEoBuh9si40arQuy8aiBze2X8XusoGymhHfiJt
         iZXJ2U/c/O5iD/hyCm34FE5NHuwnhzgoQ7JxhOyvCzvLMh0Ct4T3slDcKnxv75gaptNU
         0ZYzJTOq7tPvVYHdFfF0qD/ylgZ2SLuIq3OJ/bzenO9uxi5jQdgEBZ/vjnt9Ta2CD0ru
         tW6YH6AhXpkLX/FGTMpNDLQ5dE/C3uNvloQt+GagdzMf0cBkD9Jg6dxPWV81h5OqklH+
         SO6X6D5EVmqgvEqkjUOst8m+wuly5eGARfsRlWB8ukTIniBV4iXBhDcygaIBZkMIWUjm
         qNZg==
X-Gm-Message-State: AFuF++k57jPKmIMJbh0sP58BPAx2BbhEQGvPHYVvTGP/iqPgh1K7/DEu
	6r9RNWQNM0kTeptSxns7r7xPlCppZRs9NCUjgypotUJM35HXufhrJgyVCMEPGS4w5Vs=
X-Gm-Gg: AYBFou1hdAFUXHYUMU19G7bW33WgQ3QNnteUb1xfBF1YZYP1HlXLht0DgxO7o7Sk4de
	azq9mMTPncD9mT27C54kLJjgxM4NT24zoIIpEoniSMjfNtZKhRx0qY8p7JAP3NBh87gEHW8ikPV
	FYvgLf9A3Os1igvXFpWfyEV9RTga5mj1X4hmlFW337TLrpZBMRNmlkvC/P1f8133Jf+/dFihPsC
	9BLL+lEvRKrJeQMTqF9fgdyj51lHW3yXX9OoIirEIN6KQRe/k707ppx6t+bbZlHPKEBga4NJJT8
	ofEXDXBzrpj6E+CDyAt89OppDXdnsRwFRr3/f6oYBP/y7LubQnhM7rWLmsbNRyZfc0zyezcGc6e
	EszaJ3UT3x4K4ZrtBm+9RoEDlHk7l9AVMGdSEH3FPFEkPPZG9SBb2+NINzjRnF7+4zu5gbGpWnP
	mFgDUYM2FJWdCYON7Zb/gVLWLy+olUy601MizOmpMAP05+Dq19eBM9qtMhrvfP8k1NhMFREpD/j
	qsCYrh6YjpLip28ea7wC5K+fMinxkFWzGIlgBcgcgKJgM00ZPI=
X-Received: by 2002:a05:6830:3746:b0:7f4:d16e:45f9 with SMTP id 46e09a7af769-803fd138783mr996256a34.7.1789073726792;
        Thu, 10 Sep 2026 13:55:26 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:26 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kselftest@vger.kernel.org, Mahmoud Nagy Adam <mngyadam@amazon.de>
Cc: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909132602.68852-2-mngyadam@amazon.de>
References: <20260909132602.68852-2-mngyadam@amazon.de>
Subject: Re: [PATCH] selftests: ublk: install test_common.sh and trace/
 scripts
Message-Id: <178907372584.484803.15302806925021302928.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:25 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 09 Sep 2026 15:26:03 +0200, Mahmoud Nagy Adam wrote:
> Every ublk test script sources test_common.sh from its own directory:
> 
>     . "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
> 
> and test_generic_02/12 additionally run bpftrace against the scripts in
> trace/. Neither test_common.sh nor trace/ is listed in TEST_FILES, so
> "make install" does not copy them into the install directory and every
> ublk test fails when run from there:
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: install test_common.sh and trace/ scripts
      commit: c4fa55f85c47cd5d54d717fb8170746edb10292e

Best regards,
-- 
Jens Axboe




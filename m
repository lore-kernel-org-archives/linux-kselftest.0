Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01F53E3C5C
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779968321; cv=none; b=r+xpUggyxFWDIF8Qoz5AKYI/1yrXxafhDFkAmrZd+c1va3e501BvtXAf5yLY8SNuPIxk4EWtfvlRkVKKmQA3NMqaGoIRyVlecWr0Fy5R81Bb2ylpEi8R+yiwZl4qkau5ZUSCpTGSbw4vuMWF3aF8tqKTZVsT1nOF6LExk8hAxIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779968321; c=relaxed/simple;
	bh=8SGhWui548Ba99aC04WiP1c0zgeXquukggh5KrEpsO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyXpQDry4I4V4RHHTRniQX5qvou7O82WzQsZTitcdY6rIoFmjm/WGs62Cpfa7YVmcVkeeYJnOmUpF8X2V+0iXDY/l85sT+UxskhWbqkwGZze8eB5Oi+8JN51YcjRSSl1kZ8SBcpGddjmMxY65mzVjW9Ktab3VO554mbqC+yqElQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I7IZwJ8J; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I7IZwJ8J"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so80485245e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779968318; x=1780573118; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6iVKaZFS4nKqR7/9di1Ry0iAB7LixT3fLx6eL1lYRgc=;
        b=I7IZwJ8JqrzE9eh3Rf0W3/pvwd7nkWC0Pk6pPieLDoya0v72CYiTpS7C5dd9D1/gLU
         CjvbWAzn2k2/3d/KGSI7u4GQU5PvaMXiCgS6IO/75GQXRdJlOuqgWrKcJ7JJeWMpZ2Vt
         DdBKm5kLrpyVh3HpStuEHBilU1ehctOnuCF7G//wnLCczyVA30lzsXM7Qe6U/WpzvnXs
         R/grAYDPfoZicVasS1EJV988VbnwzJ4mb0xR9ltX8yIsSPRCZsCK7gYBz+CMXaR2dyNq
         gXGDqOmSaT1yr0Xao7FzWwj8nK1ApD4PJc2fsGPJI2U2pV//EI9LPiAh42SK6ftCtqRA
         q9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779968318; x=1780573118;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6iVKaZFS4nKqR7/9di1Ry0iAB7LixT3fLx6eL1lYRgc=;
        b=LC/o3mk9tXQJehvNiDMCKfo9wXKyr61T6s8Pp4P59wVetoqQoOJdCip3U9FpgvxXES
         nqiLJ/QfKVsxlhxERhmUhvZ9bgBFrHIhoazKfv1aSMavY3NdcPhHPyRg5uiN5qNlI/K0
         N00+dUcKxijEqcHAgDSvvlaRmhmS7I6Qo8jfPg7duHA7q/drTVVXNm3SNfGQYQKITItd
         yqzQjiW4XkpcVddsLxGh9klMCyorSBxXTF15Y8lZgRVzhBgcGuypHSLp5DeLHt3zTyuO
         Uk0dUsnB3Bk7ANrBsytW8In3v/Zgt42k/h1HqX2dU85wnIdH/M/myNy2/OFRo4nn09J/
         qeQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CG+KjbU/NB01r0LqfPaDfQIBm/wGep30HrWHWSjsqOCCHHu1EMvRBBjih/qj2lsp+FZxpRU2PjMuhRlkIKo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXoqnennxM9+caUPY7GwXbvEyjjFUqRKAVzQ2IEzmzll+50pZW
	x7xwnWnvGq/Ti+40ND408mILNswKKDFrsLXM3F93xAOs+WxOs5M+QKAxyZakGIqreWc=
X-Gm-Gg: Acq92OEEPvfrXkAulog867eibwh5lpuGM2/GT21fwUxf8AIK2kmYoR3rrz/OMU4dcCi
	/+UKuWMFpBw5sr5U147MtZ809UYydCjeeWLsXNui2v9C0gFhputEU+uKldzJMPRHYmV/aG1Wtl7
	t0rEnIs1rD/cGi/bRXDfo60GnSyFQgCsM4m7uVptAk4lIHsG/LUxDE+U1O80mDBLyY2S2WUTEP3
	XLEVi0guukcx7IW9Y9MJmdL/skV2R8pdyz5QfVOhgOHneIbUci2WSD+xz2a6GvyXLLJtOmchc6V
	djt//EL6H3X5TWbOPQ/2/blBiZyzuPJVbkfS3kjcDLFbmZvUXtLdb01cNzZZi/NTX4JxH0muc+s
	Dtv9FiMyqptAYN4TJurUI3T5POT4hyoMTgZsR3JsGqL3kSHVZnffmYnigwkwXwI+mcXOlyfA1uM
	AU511a+/rLvuIoKmS1wDWBEywNlg==
X-Received: by 2002:a05:600c:1393:b0:490:3890:605b with SMTP id 5b1f17b1804b1-490428e0bf3mr440414935e9.31.1779968318318;
        Thu, 28 May 2026 04:38:38 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b7a70b9sm15593635e9.12.2026.05.28.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 04:38:37 -0700 (PDT)
Date: Thu, 28 May 2026 13:38:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Qiang Ma <maqianga@uniontech.com>
Cc: jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, shuah@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: livepatch: set LC_ALL=C to fix
 locale-dependent test failure
Message-ID: <ahgpO1vi4kj1WQqn@pathway>
References: <20260527095929.1504032-1-maqianga@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527095929.1504032-1-maqianga@uniontech.com>

On Wed 2026-05-27 17:59:29, Qiang Ma wrote:
> When executing the command
> "make -C tools/testing/selftests TARGETS=livepatch run_tests",
> the following error message was reported.
> 
> TEST: livepatch interaction with ftrace_enabled sysctl ... not ok
> ...
> livepatch: sysctlo
> : setting key "kernel.ftrace_enabled": Device or resource busy
> livepatch: sysctl: setting key "kernel.ftrace_enabled": 设备或资源忙
> ...
> ERROR: livepatch kselftest(s) failed
> not ok 5 selftests: livepatch: test-ftrace.sh # exit=1
> 
> To fix it, set LC_ALL=C.
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

It looks good to me and I think that this is a rather standard thing
to do.

Acked-by: Petr Mladek <pmladek@suse.com>

I am going to give it few more days for a potential feedback.
I'll push it then unless anyone speak against.

Best Regards,
Petr

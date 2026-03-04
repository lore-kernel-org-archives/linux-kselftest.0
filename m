Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309D3A1C9
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591672; cv=pass; b=CcQCAdWJId5m6UaOAAAbd9gkRx+EOr+Mc0j1bBrxqMwDSxEkf9BFnrndlk0oLM4ONBpuMxCUyZ8HeX/1yuQawHA+LO0VwXRDQ44hPwmGUzp11zoyFwOtV5ZyvlseDqUQiOLtVwEop7U+4ORqCyQX7eXYwd1V0sYoPAk3Eixifpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591672; c=relaxed/simple;
	bh=lLvfMUPCqqBJTSJhP3cm5kFNukqeKiBLJqApsgrzImA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XK2JxQTuZzvCBwOyvfaq5r6NU0Za6vMFBd3GxXMRNR5frITHn1gvAw3QvZfRqX43HR6qigrPsDShR7z04keUN8X5fWkq7epSaLPxgsxiLqkV+OauCJwgrATvJV+lE5WzmsCzdP5dil/McHjoFhs7NHk5DBnwu9Rzv6QBRjhuQrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWeJPMEZ; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWeJPMEZ"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4042fe53946so639578fac.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 18:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772591670; cv=none;
        d=google.com; s=arc-20240605;
        b=dgNHE8xf8Oj+apip9E1OaIj18Owhfb28hyED0JNubyUC0DRYZjKzXnRz9FWpivrqUM
         F3ApZsJfRJJ88Ir0g7O0A9xr96tdaEFF0jXwx3SunF5nCVj8rNi73pewzXWO70ZO1jGt
         qTLzwKvLmg45h23wW4AW3tl2nJTbnoGv6m1mJ/LsHdVFAX7i7exg4zC/p/MBqKyOKuWx
         CY9BRJWeQhRZkIRGYHEZc0WOZ7LdvGWS/1JQPYWQ4DMvRNeA/Rw1XTdN/rwsfjGKDndr
         F3uxRxejGzqLF6JKWxfphfnWSIPvgOw4sZozk0O34aRWQEwD5IL4fJ3mWgJ+AYsvRufr
         /rwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FzAVneWa3Xh7z4I4PhJMo14ZSKYpGv8t7blqiZcWhHc=;
        fh=vzHHnUvyx9H0idaRvJLleRI1Oh+F84ExanPUpBVs3Q0=;
        b=X1mvApjH+VhE285UOydmab+r//Z1QgivPc8mlaQkqrXyosiq/zS9JIkkZF0o/byqIZ
         /UGsAWLRO1WqTXv++cH+AEgmUInlXBMjnAETDjlccuFcl67nncTVU60PjI6G1CrWplsg
         bFrAX+i7Xb3SCTzhrFapmXDB0N/HJe7Fdgahzhx0EjSm44a+Z9ed/TVhY3W5GdDAkonK
         ADBUq3q0GP0CE8SHK/5gfWzObjr2RQXwUhjM48xRV9XLZI7zU4XDmohTJ89Qo62DEcpV
         7L2oX5m+Ns0X+8Kh7eY9x1awOxZnkViH/7liYiybqOtIz2os/H3Hoy4VDSfOLKH6a8kS
         cAiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772591670; x=1773196470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FzAVneWa3Xh7z4I4PhJMo14ZSKYpGv8t7blqiZcWhHc=;
        b=FWeJPMEZZ/Q3rcIJtvOumUZQzhFso8O6EppM13EgWSHMMq3yfMpCSyoZgzf7ZjksDf
         3qZ1IUVQGiUc2Rh2i7wejXoEZEebiBs8gYw05HXAzE0r8Tag7KveUGbf6wZAOMzgSOVa
         CmOKTYzubD7hRr5HBiPU6QSntd3PM2AQN1D+U7Et9PquoQCyFovcXLwSZQvWb4xC2idR
         YRFl/pCgqnY0m1jn3bUsJY/yIoWU7uGRhT2vgza3/pnTdHZRAjLZhgBf86hqunGRMnco
         KN2QyNnoRXFl7KP80DquIGGzy1lF7mHeuKUjYLlkcanCxF4/XAWIZe+zxdV8K1gl83jn
         PnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591670; x=1773196470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzAVneWa3Xh7z4I4PhJMo14ZSKYpGv8t7blqiZcWhHc=;
        b=eYJGvdzYTy44Rea0fxNMDkJOrCxFI9sFAWufPi7hhgol1yJnOgqc7zHSf+UsUS946z
         BtYWFAZZ05IEYiuZEgBGXr/qsaTolSVdkm9wLTWWuaZCaIcqtVZNHXdBwARs1uBLuKOG
         q4Ebj7Ma8daErkqIE4OGjbeg7/QwOpnMEEgyIYCoVcp4X0HGihJaMcTVO4E4A0dTVMcF
         4+jF1Tmg+0TUa6kWrolDCpjHiSVxp/B5M+z5pcg/nVOIJg245W4MsnNYpIndILu3QPrM
         BUc4WvOW736Y14Ys+VD4vkyDroKaYhDe199gyvCveRFoMu4UHtihXiApp/Zv2WgpeX7K
         zX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWQfDOxkQLx6JSJCR8rrmM6dd6z9u5EUq9tFHwN7LeHV9K6k71eP9BVXEBKNh1VyvJzPVt2olApHcASl1sU5oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCH5g9kALrMBMIMIHtqrdorh+4k88EvgM3uE4PaR2KFKIdKpDU
	xsrfXcHCa247dHzpDvr7AkgHAKF4ZbTOcAh50HOLtT+n7joUQhn7jY8miwqbYguk9GXtvVpmFVo
	tjYu+BmmkdXdtuE/M42bHVNfboJaBTqpdqGQLY0g=
X-Gm-Gg: ATEYQzwZ4Rl1RsCcZp6Qqa9Lu2SkPMnI7yA3gpVeO/HA5/DnKFFeUlVWBwg0YK9oYcR
	w7yasBH+83ePNjwqDO6pPau2f81rgwbycuSyF3taenR6LRAMizX2Cujtu/76dlJ3JSueMmYKxmt
	QuFrvr00mTylSaDZE3dKMfdGD7yzO9aLJyAvBp47DJAnEvwApHVLX6QOhXnRA5+0yDWpSQByV1O
	Wn/J65eYTveVSs1oBpMqwnDmAgGt/Xi8XmJDngYe6ZIiRPQX8RNoXUg6c+xM5i7x7pmbSDw6n34
	+bLMMqUtF5Q61P+ysFSv8JCxQoINX9CezmdyHLVYlSG1aF+d/szmGAZ9pGjDJ5jjXzdATi8=
X-Received: by 2002:a05:6871:72c:b0:409:6ea8:5f7f with SMTP id
 586e51a60fabf-416ab595928mr311211fac.20.1772591669896; Tue, 03 Mar 2026
 18:34:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228074735.10438-1-mr.navi8680@gmail.com> <20260303181700.25878b2a@kernel.org>
In-Reply-To: <20260303181700.25878b2a@kernel.org>
From: Naveen A <mr.navi8680@gmail.com>
Date: Wed, 4 Mar 2026 08:04:18 +0530
X-Gm-Features: AaiRm53dKDZnJe4vn8tGAY5vLRHmWRPeD1MU5t8oKL40T2N30omzntlRAwwQ5EY
Message-ID: <CACQ1SaB0cnBgEAiX0iTM+WXL0cXYOsoi9wMUMvpcK-04hZLhAg@mail.gmail.com>
Subject: Re: [PATCH] selftests: tc-testing: fix list_categories() crash on
 list type
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, jhs@mojatatu.com, 
	jiri@resnulli.us, shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How did you find this issue? I can't figure out what's calling this
> function in the first place.

I encountered this while running the tc-testing selftests locally.

The script raised the error:

TypeError: unhashable type: 'list'

The traceback pointed to list_categories(), where a set(map(...))
was being created from the 'category' field.

Since 'category' is a list in the test cases, Python attempts to
insert the list itself into the set, which raises the unhashable
type error. After tracing this, I updated the logic to flatten the
category lists and collect unique category names using set.update().


On Wed, 4 Mar 2026 at 07:47, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Sat, 28 Feb 2026 13:17:35 +0530 mr.navi8680@gmail.com wrote:
> > list_categories() builds a set directly from the 'category'
> > field of each test case. Since 'category' is a list,
> > set(map(...)) attempts to insert lists into a set, which
> > raises:
> >
> >   TypeError: unhashable type: 'list'
> >
> > Flatten category lists and collect unique category names
> > using set.update() instead.
>
> How did you find this issue?
>
> I can't figure out what's calling this function in the first place.
> --
> pw-bot: cr

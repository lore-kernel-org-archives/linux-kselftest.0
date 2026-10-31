Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468356;
	b=KqRQLRzpO/xkzm+i+rTg2Ie7ki197KBXUz2XsAVir1udExA9/GyXSIcsAt5qCvhgZ8/0
	 CytH+M8zBL1dRrQTnTDF1Oju6/IJBFD1u0vElF8vCE3R6rYw/HUTmLh6+YqEQiqVX97Sa
	 ZmfT1or5+MSzYoo7EJd/VqMQaVb2oQPsLeagWoDuFb8s1cH3+KqK/+1CaSRUVKR0ZHTtQ
	 VVDbI0IcjUzX5qAW3G9bQA+VPu9GAdPKivQwXwDLfeg93CQ9hsLUbz2TqnoB5ib9kGJKQ
	 vnoRXgYaloQrh9MeWjpK7Wa28tnLL88RRoJpgVDJntDr7jGdCZBTgut1NlpVWnLYLaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
	b=5JIUSehOkjKFZJ/WyZfi9SsRuZMYLpiy2KFKAG0Dqgyz+CuVwoAWj8D/w66lqtZEwjD5
	 fh5iEp06qjvw8imDGK0azbKxDJ02nv/oNBGmjfp3JuWIWjZ0uKImny4vpm8BbVFKW9X8v
	 jCtBqK/16pIOYlpyPhLnHSYqIziaCI0ATWBo8TzTOcwdTpLBeZ7O0m9rrIZ0jLvaBPAcV
	 bYES88nUuVXSuV2YRxDAMS6B8+spWJhk4ZAj4my9tbLfxc5wPWEqLrm2yaqe6vRdWNbJW
	 fzd9Cqi80jVWDruhPoWcIrRcBg3Y7EujTBOHeG++2W4FzJuPv9y2nwy7KaoXzTPERSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AylsZbl8;
	arc=none smtp.remote-ip=74.125.229.134
Received: from mail-dl2-f6.google.com (mail-dl2-f6.google.com [74.125.229.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED542606A31A
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 17:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED542606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AylsZbl8
Received: by mail-dl2-f6.google.com with SMTP id a92af1059eb24-1ae5089e28aso20029c88.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793468355; x=1794073155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
        b=AylsZbl8rD/zrNKDrvJnSKn0FCOCurNXnYVPihbd2lSu/OdLgTm6IVDAsekTWCxioF
         EAiIMkmxAcbysGVh+GzJK5fPmJaTOlJFVfDkHn42S85LoLvm9PO1VKl21FRIl9n8pRhg
         BrusB0ZG+yGAU+AhRyzbo5FY7gX7DeCM1wZCwUKkHl0Jv3+mifOFQAfzfWd+RbmsJm/e
         Vep/I5DjYulWWM4KCntGv4D9+Wd9X5xEOknPKleKu3jE36AgAyANSbEHOShTPs2xue/5
         CTXEIBUQkP/lcJVne52Pvo4jzz4F0pIvdMK9/yyFME9eSFQ8U2gqcfFhTyPnhQBbH7Sg
         GN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793468355; x=1794073155;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
        b=05xwv7LeNyMjb8FW7xZFvIfZocHA/+lhYn5DBGK4aqvAew6iTlrYgJ0fRB4eBVe8HR
         h6U75/IMcEk4ZQ9ErsW80sDNABPYF0l8H552EtLRnED3lkdzKnOqFZHbRDC0dJ73vFnF
         TFlL5bLoHGVFut6dVxMCvS6oXVmo3MvSDFumgDuwEhbYbzeGpFfvNvB4AL7xIY6fPAah
         HdlNxVehTCwNORcbJU+DPID75FZcl3QRQGpILWXGOece5zZRR1HXCKovBNLEkWQEGnrZ
         fURfU56jP4HoPIsF2QkwoGSVS2HqISNJ+KyyKZvIeDa0YfZRU3Sbt/ecr3uIBnp2SNZd
         /xcw==
X-Forwarded-Encrypted: i=1; AKwUvBzxCMQCqGcZT47GC8hUIly76WozFRabwtRJ9tTSpdVHkXWMpufB6GlTUdjt8bYApvCAv+N8Qw2odanHb1i1n/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLupeZA+4ZU5mHPtLYgkdj35CKtouRyY4QrWzD7bKdbv4gNAjE0
	2o9sjFMkG2ZsPamTVnXZQ9rplaeBA/7jalR02XgaYBT5QVZWG03zJFBB
X-Gm-Gg: AYBFou0QeG9uR+O3sZdnfllilvM80gFClWtKcUmJz7eXBBNiB5bWo7Wg9wr/YrAF015
	L5SYnR31nSORv0/XLAB/DsAunpl/X34BYspUg4slGy+dWkCr9nY9bhUAGQK3ohdgyYfsrhvC/F3
	XVRLKjxQvzMgy0GHSU9jAEahMmMP01jG4a6+WmvGZ1PiRBild7fNRhC9t4+q6wFtfUyeieqBZ0Z
	ZU55nXYttiBuvmK9qyCzbEf0A+BsExo/qjnn/L2JyKJTfKUZ7bmbBsyrmZQd9f7TpFEZgGe7+4b
	fzSfgxKAMx+/zMOhspDMAKQw9Uo+kWuWpTytx8wKimRNpWMwlkD/sgl6FdrFFkGKyd8+Yx/wM8+
	hhf2TuwDSS8kXMJRauwt+E6CqfTzY5LOAyR8PCVnrHKY7iT1iSnjUSlpV0GR07NCUJX+jBTDn19
	Mvz9fbS2lj+GvrgN6MEAODOiogJZliHULeiTwL1UPh6TWRhwZR7V0ZzT0Fj9F0Qtn7yBsswxFjW
	uad09bdP59eSkSGHqzHkGAXYqHZjwf9FGgmxkfk4hxe27ppNSqjjyGFHW6x64sI/t4LNZoFNro6
	OYYHaKGMjgmXb+qndQ/IJ0M53+I5v8jF9YD0v3d/Jfj30O+0+6mYna+UyZhB2dkDD7Ag+35/KWo
	P7zFWdvxAm08qaC5Em+MSZ1ZkHhAHJusBRg==
X-Received: by 2002:a05:7022:258f:b0:19e:78fe:9d67 with SMTP id a92af1059eb24-1ac5a680801mr9985603c88.9.1793468354679;
        Sat, 31 Oct 2026 10:39:14 -0700 (PDT)
Received: from [192.168.50.20] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm19811655c88.13.2026.10.31.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:39:14 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Date: Sun, 01 Nov 2026 03:34:41 +1100
Message-ID: <179346448183.4.15545164251841296990@gmail.com>
Subject:
 Re: [RFC PATCH] selftests/damon/sysfs_memcg_path_leak: define ksft_skip
In-Reply-To: <20261031153858.84302-1-sj@kernel.org>
References: <179342136087.2.16978105493403840270@gmail.com>
 <20261031153858.84302-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Sat, 31 Oct 2026 08:38:58 -0700 SJ Park wrote:

> Thank you for reviewing, Aveline.

Oh, looks like I forgot that. Thanks for the reminder.

That also gives me an idea: maybe I could build a modular tool to help
write emails. Building on b4 might be a good starting point.

Tested the non-root skip path on x86-64 Linux with Bash 5.3.20:
the exit status changed from 0 to 4.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir

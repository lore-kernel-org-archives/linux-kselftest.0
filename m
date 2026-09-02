Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067237E5FF
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379222; cv=none; b=q105NBCyVeJVoUksexYgX8sROLJCPByBxU9rBTT/SyRZR8DcAaPaiq+47KYgbHdcmtjI5cmF6UPWyA0J2OZmWSrFdOejEfK0iry+O7nF1ija/MdQVk31EP/rBQI183MpFYQKiG2up4c7mp/r0wGZQPyg9CpBJr+4gGoAFf8+Oq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379222; c=relaxed/simple;
	bh=InDs+YF8Rr2GVIXpPTwQq2qlM5wTAldEfN0J2IQdGYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRnia4ltepNUfDtsrm3psEMiw8CnCLeSnFNkY4GmAnJB8w0aeurXkRpiXyGqFozE8FnsE1Mgzy0NelUZnJ37bUO5I0ZGMVu445L4vWMW0NG6BLIFk7yBGk6p+ZNNZU8hN/KL6RlZ/H/Nz6GAEuEErsXZsunZgC7N4Gw4SjW2i2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUaWQSMw; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUaWQSMw"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b5b727be96so936502b6e.3
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 13:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788379220; x=1788984020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=InDs+YF8Rr2GVIXpPTwQq2qlM5wTAldEfN0J2IQdGYA=;
        b=aUaWQSMwvBzwZySrhLChY7fL3N7BBxTnLROl/z1kUVxsOng8p395VveDiYV3HxAajI
         7ycSKtTdmdJNdn00sfVIOaz1a4e9EdtjBNylgFTGVh6JlUXqQdz8t2L6gmUS5ZRzXz0H
         CH9+V5mU/OKDbvrFohGWC64YabfnYKnzYQ67Lyuzwzp7myJF8ZLZe10IqK+AhY8wkbNY
         c1cMfI2MKDoC/84c030kbtU/n1bMuZFsXUkvC3Mntvmdb2P4WB/AE+dgD4KZJs25iPUN
         NPwrC+gubo0KaXXCMrdjb3TJJAfroecyUNgJFKPr8K06/dk5+JhOcvPyoYl911TDFMWr
         e7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379220; x=1788984020;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InDs+YF8Rr2GVIXpPTwQq2qlM5wTAldEfN0J2IQdGYA=;
        b=D2h7VYTRZWx6LbvhfQz9G6aAOPv36C1RuXQJQclJXHenHXtqhK/CMjcCwEcjrH6Rb4
         0lb36hgV+PVUPvEe0fqvh8cFL7nWBHqkWbo9dHbSgzi+L8c5d0CUTwc+sMlaa2jpd2m+
         mdCAGcnfeZJUGodDGm+uKtsSW0CM/VSQ89VLtuu5GYl8/jJBewD7xQ/H1jsTmbYdwvLP
         Iu5/1zkd6VHter8bpWMK+Y5XqmFpTbUUTP3vPD5V61JFvRCk3pWzxzIlmHAZ9l5pGdus
         KYtg2iuNLbT8Qgkbzu5e06UJqQNtQRjuR2s8dNZCAfgUoz6GezSMGNuSuE43AnxfHLgF
         ukbw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd3nslzCqvbXZPn1iDPEpCqR3E+bjb5cmTy6PtkswxUWUWC0l9eSepd+lcveo8zdETxK/S0mDnVXJYrice1WI=@vger.kernel.org
X-Gm-Message-State: AFuF++mt1ZNiOBe0x9OKblIwKJnFllCM7PEXNT4mfiJC12ZnegXBre9b
	BJIQ3A7RuQxKiA2T9bKiCTVbIT8M9nyWHzd2lRuFB6FiRR1K50wQyW8W
X-Gm-Gg: AR+sD139yI5gr6OsduKXv/XtqWh43UGDeE/7oxNETwn874ndq4gXFfooQOiTki2sc35
	smQS8mwgEMdQusHEk9pIQwXlPF8fWa8gcTg+O2uA51q3Cm2deTTU6lY7rqmr4HrymFKciFl7HoM
	8VON+LoioHxlg64/609H6o98QAloicAK59uMpSkW5EKUx4jwgGIkwICSVQR1vipzIlSyEbcJzc9
	MQd0lkPeqYN6RQFqHPvrVoqvINDGy5L8QS2aQcxsZHgjUUejPS/e1+rMWhFomBsLqwcyrm9Hsb3
	9RDL0p9+RTDL8lwEZzlTdjKY8Phj7a9rOB9c9eu4B0qIJvjniSExZiJzOYH+4zsGKwTdJAKjKnX
	sDib/NVhqYhXeMhyweWJqCyXck3MyKuUknD4VT2275QdrCK6cVyPH15gBXFpXwZYWOp9L/rP1EO
	tmW+lXgH8DiabYxs84mT4Y9kMQBA08O7K0b9Xq9nfrk2TVUM49+m3s1YMmpwDMVq4P8aZSMCY6T
	wCEZzu5oaRuTJY4Jg==
X-Received: by 2002:a05:6808:1512:b0:4b3:79ae:1495 with SMTP id 5614622812f47-4b6bc65c863mr6085404b6e.5.1788379220030;
        Wed, 02 Sep 2026 13:00:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:f::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b69b214817sm2976454b6e.12.2026.09.02.13.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:00:19 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroup@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] selftests/cgroup: Skip test_no_invasive_cgroup_shrink if zswap shrinker is enabled
Date: Wed,  2 Sep 2026 13:00:15 -0700
Message-ID: <20260902200017.3847858-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKEwX=MD_EcAaLzMGnMytVJ_KTGmv=hpR2h-DD+w0oJRjzkg6Q@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 1 Sep 2026 14:04:22 -0400 Nhat Pham <nphamcs@gmail.com> wrote:

> On Tue, Sep 1, 2026 at 12:13 PM Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> >
> > The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
> > has zswapped out more pages than memory.zswap.max, that it does not
> > trigger writeback for other cgroups. To do this, it compares the
> > writeback count in a control cgroup and makes sure that it is 0,
> > and compares it to the writeback count in a aggressor cgroup who
> > does expect to see writeback.
> >
> > When the zswap shrinker is enabled however, there is an additional path
> > to zswap writeback, which can happen independently of reaching the
> > memory.zswap.max limit.
> >
> > The writeback counter cannot distinguish between invasive noisy-neighbor
> > driven writeback and the zswap shrinker work, so the test becomes
> > invalid.

Hi Nhat!

Thanks for the quick review on this.

> I think writeback in the control group (zw_group) happens right during
> the first round of memory allocation, but there shouldn't be any on
> the second round (as the second round involves writing to wb_group
> only). So if we read zswap writeback counter of that cgroup (zw_group)
> right after that first allocation round, and make sure delta = 0 after
> the second round, then that should work for both shrinker_enabled = Y
> v.s N.

That is very smart and much better than just skipping the test, I'll
take your approach. I've sent a v2 in [1].

Have a great day Nhat! Thank you again!
Joshua

[1] https://lore.kernel.org/all/20260902194521.3652178-1-joshua.hahnjy@gmail.com/

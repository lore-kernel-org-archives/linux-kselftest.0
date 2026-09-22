Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964B3F106E
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108908; cv=none; b=bDySNPv5dNl7q71DBFjW2E2i+ed0SOdMZmsdrmeCXENBBvfpwZsRdSpxm/hz4LCr0q0ATS4q0UwUaeymZi9xp6u7kw1+froKFAOEck3Pf2DGUrjuRgM74URv2rtsypgRcMlHiaQzzQ47tlwCTytG7J5L42lQTLa19xIOE22HIAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108908; c=relaxed/simple;
	bh=NfI/Dm5EYDMnMTAl3fxv1BGBbGtmkx+otpGuTeOYlsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jPOaDToJeCxJLE9hl43enu1rF2F0klrBmLnzDwdyz/FkuWHzVKI7FgcF6N2B2qQWoSqcq5M3OotJKfVugjvA2kKYAvjLh1ki4+PkZyc57YfNiW2utcH/h3a2MAMR43ZttMH3sxPWRqwrklMhJao2C1meryqsohqfByD8aBjYVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLoKu9Pi; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLoKu9Pi"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43db0c29so5607067b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 13:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790108890; x=1790713690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfI/Dm5EYDMnMTAl3fxv1BGBbGtmkx+otpGuTeOYlsM=;
        b=iLoKu9PibrjdE+0KXt2I5NdT/KxaARyi/cT91yQ0X7v1DBZScbUJh82s+ktxskfEIb
         a78mg2AOtdVPxtOolm7BsvMWfgQCouiJ0bsVRSLHmcZ+z1yGl0KNZWLBFnFa0Tu51iKZ
         vnF/3BWV99qMzLHNyHuIWYK0v37tnXdhzDdnXRAjPr6ryyZulmWf8/Hk5uZdd1F3koNs
         /K+lOfaMAr7+9Lh0aNL4INlBbayYGvLvmJL79mnzMPSV4Zs4M2yUlbJBC62q3L9Q0E3G
         y+HNhfCFmZ9DEFK5zmDKFc1dn0MRS9tN61Ib0GzTFt1OZRXF4er88UzNKTmDgZB6x+zS
         UDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108890; x=1790713690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfI/Dm5EYDMnMTAl3fxv1BGBbGtmkx+otpGuTeOYlsM=;
        b=RuAVB5DaJPfxmFHeql3zkJyd23hRW+Dw9j0jhgKS+hOAJ76dV1bpbZYTWmr3B4dAnw
         jKR1R0BU6mF2S1r3uGDP3OTwJN+tP09Ee23HxXnHaZ9s4tJkV/URc6nsOXxi8NyZ36xD
         aX+dGFrF/bdpnH7Djz1s+rgyz+wyk4hsHBA4RQUZEK4uMGI4sBW5sdNPn8z+DMe7g5m/
         GVbKxdiKjQjgqaPDmES0+xHYIWMbINtjq4+wbyUR/QmgjqKsoQ4Jfy+oGf8oaaTCLdlG
         OfLtCQ+fCjOvn6Sa60e+WAagC/nPll6HS+adOBKcscOVsOyiBrlakUsDQObT5ocBOGXv
         inzg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ4y3iotdbgg3PB858cD6mQxZ9u4og+dM2FOBsgLfu5jln5eMwcrHPSXF4SYEAQidMIr8V4BY6fNHHrpMCO6M=@vger.kernel.org
X-Gm-Message-State: AFuF++nT4sP2Rrl/1oG0XUS/l6fMimaxGQ5n8dSWdVVeBzgvDF47osYf
	gyOu4pdBKbt0MLpP/Oz8dV9Fe4s75ydltDS1+vUfinqaceiqyrrNC9Ey+fqWYRIJ
X-Gm-Gg: AYBFou1LXdM+SIAQSE4wckOxnf+HQUCxnQADqNHhtXk4u3+mBjMhLfAUrS7KDlNv2tX
	qz4cXiz2q8TgbPxjn5QQV50/OnjY5I9NpP99+W0cgxSx0XJekwJoRfu4sKTptXrQcC63LeCvJf+
	KMfpLiivikzyAxN5TqPshMfhvqN88JObElIET3vFuZtVu5NPdUmvaiUKFBHUyu9ImP4I58aaeXu
	NWP5p6wzxQ7ZpObnNBov6NPt84migfVvQPmzSSzNy2pNRVSMEMkDFGKT/9pfg+t37GlEXkKEP8H
	GO4lNXITINVZ5DBLZb4OraGQYmVDSRkSajtfqZdy9NXprqWuSUHK3kcZPkBK/HWOa2wh4PxMLSG
	KdnOaXpx7qOx2vOI3vXtnjsi1FdDisgHcM5XNspGe5xp2u2YGgBmIS1U1hdW7/QSxgRzEe9QEmt
	YKqAULaRW2ua4Ip4BUuLp/0BUB950sZrJymNoSBZmojXPcnV+DEl/fQZ/zoC2OOKwpxN+RWCIzm
	cPa9N562ANVR8JyO8ENq0y8EYSJ/RRh9h+h3UQfbVb8kYk1ZL1PQDIv/MHujUPa/BI12JBlrfuq
	RaxNSBtMgQ==
X-Received: by 2002:a05:701b:455a:20b0:141:4951:f150 with SMTP id a92af1059eb24-144f90adb56mr519266c88.18.1790108422631;
        Tue, 22 Sep 2026 13:20:22 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:f16e:2102:25ad:9cdb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9820ca5sm716854c88.3.2026.09.22.13.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:20:22 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v6 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Wed, 23 Sep 2026 01:50:13 +0530
Message-Id: <20260922202013.25126-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179002340755.2160803.3742716999091408861@kernel.org>
References: <179002340755.2160803.3742716999091408861@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review. Replies are inline below.

> Is this paragraph describing a change made by this patch? The diff is
> purely additive and net/sched/sch_fq_pie.c had no delay or avg_dq_rate
> conversion before it, so the new fq_pie_dump_class_stats() is not
> replacing any truncating computation.
>
> The code that actually contains both of the described defects is
> pie_dump_stats() in net/sched/sch_pie.c, which this patch does not touch
> and does not mention, and there is no Fixes: tag.
>
> Could the paragraph either be reworded as a deliberate difference from
> the pie qdisc, or the series extended to fix pie_dump_stats() as well?

As you noted, the diff here is purely additive, so this paragraph isn't
describing a fix to existing code in this file - there's nothing in this
patch's history to carry a Fixes: tag for. It's explaining why the new
code uses div_u64() and a widened u64 intermediate: to avoid a known
overflow pattern, not to describe a prior bug in this file.

The bug you found in pie_dump_stats() is real, but it's independent,
pre-existing (net/sched/sch_pie.c, ~2014), and unrelated to whether this
new ABI addition is correct. We'd rather not fold a fix for that into a
series about adding per-flow statistics - it deserves its own patch,
separately from this series.

We can make the paragraph read as a comparison rather than a claim about
this file - e.g. "which can wrap" instead of "which wrapped" - a
wording-only change, no scope change.

> Growing struct tc_fq_pie_xstats from 36 to 64 bytes is visible to
> userspace in both directions [...] Does the accompanying iproute2
> change parse defensively, e.g. copying min(RTA_PAYLOAD(xstats),
> sizeof(st)) bytes into a zeroed local struct rather than bailing out?
> [...] Could that reasoning be added to the changelog?
>
> The alternative would be to leave tc_fq_pie_xstats at 36 bytes entirely
> and emit a separate struct [...] Was that option considered and
> rejected?

Yes to both. iproute2's fq_pie_print_xstats() already does exactly this:
it copies into a zeroed local struct and memcpy()s only RTA_PAYLOAD()
bytes when the reply is short, so a short/zero-filled read still
resolves to TCA_FQ_PIE_XSTATS_QDISC (0) and prints normally. This
reasoning is already in the changelog - it's there now, not something
we're planning to add.

We did consider a separate struct and rejected it. fq_codel can put its
discriminator first only because it was designed in from day one;
tc_fq_pie_xstats already has nine fixed-offset __u32 counters that
predate this patch, so a discriminator can only be appended here, not
prepended, without moving those offsets. A new, separate struct would
still need its own attribute and its own print callback wired up in tc,
splitting one qdisc's stats across two code paths for no added
compatibility benefit. Extending the existing struct was thus better.



pw-bot: cr





Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1F4A2A4B
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445046; cv=none; b=sIe4u90Q92VEvdpeCcLzsbtjj0Vk8heGd6eyx7qlPNV8wFhLO44XmW7u3+eEMmNqYnZ17kZYBf0/GudOQTUko/NoSZoEFW/CZFdUknrHbMeR4KzB47KmqbCsyYZ1w7TacylfmYbBnkOw3hmyJMbJzVT/KLcxt7UWY+J8q6mblbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445046; c=relaxed/simple;
	bh=grbSD99wnbBQjbz5a/guFkZGFX6aK7WNXYkMNE/JzbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIFpERRprHSiqRqcHtci4dbg2894v6Qas2fqFeSr8h0lIqQ9gcFGgfv8mR9nygFUCi2g0PN9cIttCCXFsiPE3P3yY3BDcTyV4L9tN1ErMI4wxCD6udBO6/NDzDKzERu804VBczDilH5oI9j9uqh+I/MIbunWm6Kx6yKkYo86+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOYurI94; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOYurI94"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b1a0d75a4fso1334957eaf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788445037; x=1789049837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcCW6+/z3gty5vQ5bRmZgnTdisuOcsWk7AuFt/Gu6MM=;
        b=QOYurI94eBhCsm7GIovBe1qbVZIqPNiHvos/4RtFCcBOjOZ12nAzHNP14mwKrqYgnH
         pmAzOfjVcAFAesdrH0FgPpLqafI4FZc+Ex3bDHHM9VmKgpnGv69jftLgt4q2NSh3cvIp
         xV3v2UYGckSQrno+u6Lf7IS7UkP/LAEtmEMHUuJqBBNn0NEH1gS5f2FgkvQjRJ8DI/je
         g7fcDC5gniABI9l9Uo0RlCpvC/DeTE16o5QYQ8CVXsLWkbrk4S01gx/dZdS0u9NolutW
         bWZZQwW/dZIDmqMumyUWAW5xsskT77U6gDRnfhvc/MiVHoeqwF4r4eElOAgn8F9AL/IE
         g04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445037; x=1789049837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcCW6+/z3gty5vQ5bRmZgnTdisuOcsWk7AuFt/Gu6MM=;
        b=BVILChdG195qmyseR9/uiI3YmRQR+zx/SJsrhXn9YK28c9r6gevRdhA9YzdnwfkGUq
         GLiObiRouz5amR4ncbheKXyWQk8JG67vvcrMv6fVl8ErIuo98FdFCQAcUHMqXzz89G5k
         m2yP5vFulkwkifSAa0NkYsSoBDsbyK+GlLfT5MIrw2vTl6b97oOiYf3tk9EEq/nWfL70
         pB5FFDlHbK5yK0k46kGhbaKpb+LIh/TNGCYim+/NygeYc61igQsPsfzk+B57j3gI9lDO
         liiaVA0nvLEiI4wdX8aapKdAgrr2ZAI4pDWco3mV5FLGkZbn6BwqZoeawL4VtoPN3QTJ
         IhBQ==
X-Forwarded-Encrypted: i=1; AKwUvByOx3J9LzbepfAHu4JGe7vILrxqRLzEM1NcIm42t3XC4ywYOhMNnsH1sx5cGW3QMnbC3R5QbVQgIZAflekrq9A=@vger.kernel.org
X-Gm-Message-State: AFuF++nHRT3nd3wsJYQkRA3XCRtY5BufQ4WwX/eLkf/sxImB9GFnzzYv
	t9Eb2mm1QH43guf2Lhz6hAe1n1lTupkSivxaIpYppbQpM6sw+1RUvnpWA4GM+w==
X-Gm-Gg: AYBFou3rd3vEMo1tF1/FuTIcncUp1sVgS/JvzPvUql/GkFk4WoA7UEjKif7dZMzGQdk
	8Sk2jh81kS44RkTBW6mKlyIow/p0/pv3oLwB1X0VuxLSYb1QwJ9VzfN1HFzIMcKvgyN8UBu1rIr
	vDM4Pl43Ryr51i720A4I3WeYAGuFtR9WNgELRuu+LRSRQd9JOpolbk3urjIHEm1TMjntojt3ZZ7
	/cUCptGLQbIVSFlEEu0a2nopccQqv3+5WPEjheRWMhyIIZdKUJtANHysbbzLAPgJ3D0s6NukK2t
	DMTgMEtAyngxpHVotQC48/oi6So2xjgCHz8dYMQl6NnKl3ruvkAVHBIp0oZUffyUEV8LDBVBXHG
	iyTJ30lzo7WdO2QsltXOXkWhmzP48hZunAqQLKUW7fX1mrdl/Ed/lzOBWLRR9FpLqSLlbU0orVa
	cZurbl/IZx6BE3QzD4HP7P5z1l0JE+ieEhSLgMZDgh/hGheKcs023Fa3tm6lisc/7cnE6eZdR0G
	xoLzLKUpqxFoTF5FBc=
X-Received: by 2002:a05:6820:a0e:b0:6b1:4fe1:9464 with SMTP id 006d021491bc7-6b47dfac321mr10573094eaf.22.1788445036581;
        Thu, 03 Sep 2026 07:17:16 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:1b::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f3292c0b0sm7715350fac.12.2026.09.03.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:17:16 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Krush Chavan <krushchavan@outlook.com>,
	"Chengming Zhou" <chengming.zhou@linux.dev>,
	"Tejun Heo" <tj@kernel.org>,
	Michal =?ISO-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	"Shuah Khan" <shuah@kernel.org>,
	linux-mm@kvack.org,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] selftests/cgroup: account for zswap shrinker writeback
Date: Thu,  3 Sep 2026 07:17:13 -0700
Message-ID: <20260903141714.595256-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902180408.05b925ce05359cd4d7f96894@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Sep 2026 18:04:08 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed,  2 Sep 2026 12:45:20 -0700 Joshua Hahn <joshua.hahnjy@gmail.com> wrote:
> 
> > The test_no_invasive_cgroup_shrink selftest checks that when a cgroup
> > has zswapped out more memory than memory.zswap.max, it does not
> > trigger writeback for other cgroups. To do this, it compares the
> > writeback count in a control cgroup and makes sure that it is 0,
> > and then checks the writeback count in an aggressor cgroup who does
> > expect to see writeback.
> > 
> > However, when the zswap shrinker is enabled, the victim cgroup can see
> > legitimate writebacks not triggered by the aggressor. In some Meta CI
> > tests, we have seen this failure mode happen.
> > 
> > Instead of checking that the victim cgroup has 0 writeback, compare the
> > writeback values before and after the aggressor runs and check that
> > the victim cgroup did not perform any additional writeback. Note that
> > this can still lead to probabilistic failures if writebacks take longer
> > than 5 seconds, but this should fix the systematic failure case.
> > 
> > Fixes: b5ba474f3f51 ("zswap: shrink zswap pool based on memory pressure")

Hello Andrew, I hope you're doing well!

> Thanks.
> 
> I do support backporting selftests fixes.  We want selftests to work
> well in the kernel with which they are shipped.  But, as ever, we
> should include a clear explanation of the userspace-visible runtime
> effects of the bug.
> 
> Seems the short answer is "false-positive test failures" but we can
> perhaps do a little better than that.  Quoting the failure messages
> would be a good way - very recognizable.

That sounds good to me. Unfortunately it seems like the selftests
aren't too expressive in terms of why it failed, so this is all that
I was able to pick up from the selftest logs:

ok 1 test_zswap_usage
ok 2 test_swapin_nozswap
ok 3 test_zswapin
ok 4 test_zswap_writeback_enabled
ok 5 test_zswap_writeback_disabled
ok 6 # SKIP test_no_kmem_bypass
not ok 7 test_no_invasive_cgroup_shrink
ok 8 test_zswap_incompressible
# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:6 fail:1 xfail:0 xpass:0 skip:1 error:0

I'm not too sure how helpful this will be, but maybe it would be better
to amend the last line of the commit message to say:

...
than 5 seconds, but this should fix the systematic failure case
and make "not ok test_no_invasive_cgroup_shrink" less likely.

> > Reported-by: Krush Chavan <krushchavan@outlook.com>
> 
> Relatedly, is there a Link:/Closes:?

Unfortunately this was detected in our private CI workflow and raised
by Krush, so I'm not sure if there is anything we can share.

If there is anything else that I can add to make this clearer, please
let me know. I hope you have a great day Andrew!
Joshua

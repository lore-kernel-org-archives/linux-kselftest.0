Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319324A99B8
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364195; cv=none; b=uwqh7hTGmr9wNLDlUE9EHvjkma3km9z+WKYEZpSQnV4xEmHuUAuGCTZku7Osy6hqYp/ZV3oSPmhko7gkPmPxasTce+MrJ760Grz0fVBWiBPzS0yGIVFrGkiiOua/a0+OGi24VS9fZPLPvVCdBFEKgQjaiKk+noNPXSLwop5nrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364195; c=relaxed/simple;
	bh=ZFUyQ3mpVFiKVb7A5VcBIH1Co5Fvu1RaKkX3s7o6tGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3RdEU/h7ALODgo2IKetR4xeUoZ5HRbDndibmYO2XJp695CpXIX8wpuADVj95/6WntzYXwBz+u2uZulVmPdik2BOS9Ctedfp8/MIyDxngZlJR0a5qzW7XMFMK2U4BWZX/FV6UPDomEdwL1SS5MVv/gK81aPacHxZy+THZb7xSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2KduuWA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2KduuWA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39927410578so2301522a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788364193; x=1788968993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z89yPC+uk4DMPmL1ApFKYR0uaTYQLE6V3binhup5tUc=;
        b=O2KduuWAfkVdRWxD+/ksCFlj5vrWDHcc7Si9jr2crMQwMHIoolozIBSnd2el5Gqzln
         XrLS7ak+muLUiKyKp3G7cbvYR2yl1f7qgpeca31GqeJRo6svtxnPpnMzyvKKMx3vHWKs
         CbOU7ddc2h5GS1/oz8+oF4vPU7leqDiCZkekuqca7O/BZBiIrgT1gynJsaaxXi2uJ0/K
         xG4832qlyFbqomLCx/FTMCXf718LehgaJqA5jN1OODFXDKl68rQJi94/PTqRzBAg426a
         34G9UhcmtURSXhIzAiOg0YQXFHM2xSq6g+JIz9/TNRrYAtnP4MFVc9nH+/LsypkGEhhM
         YgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364193; x=1788968993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z89yPC+uk4DMPmL1ApFKYR0uaTYQLE6V3binhup5tUc=;
        b=ocGCymw/x/49SatKNMRXYC/p0iGCGctHH8lRdiF5sgymbvGh3HwmPJmN77SkkdfNTz
         0LsV16fzOyQ2iITPHbREMr2S/bH56Ed/5z51iCipxnHCVNFfm7DIFJZ7eXNdTzmdwTNS
         KCxxP6ldg5kktTIl1pOI/rWtE/2x3w4JpxXpnjOD3KKol10J+HTr/3JYFhxYEyGd0HVx
         CUcR0gIDrF7P4KIbDHbA51Vy1/sZEkuaOc65b6V3d0/F45fFIngB5guZUe8b7dQrf3eM
         hUTdA6BRLMVHTEmwBhTwH4B16xK1K9H0m/mhJUW4aKmoleNkDSnzA+ZwnW1NnZoM4TiQ
         ngKA==
X-Forwarded-Encrypted: i=1; AKwUvBwCz3BZaX/wa/0dV3jtimAd+zmJl6voLtoGguk5ry11SXxT00QP3+KHDIxZKMnj0POTdRhPWwRLRAKAw6zN0F4=@vger.kernel.org
X-Gm-Message-State: AFuF++nceFG42zVAZ9SaN1W4v5xNUiiV2D692IcZ1A5pRiwNSM5xDE5Q
	huH2y+RTgvpvhY+kgYhcNuEXmxceUL54r25YXBFsb3NXlY9gFUI52MsU
X-Gm-Gg: AYBFou3X36JK/iD9PSU1CHT8ECF6GLi+M+dCAbgE/d8pA1fIPOTM5ScCMVjKenDsag7
	tm12je5aJDvyqG19/Y11yANds5pGJTrFbUJUjMsFnVjUIgcYhQBOF6SHjdIKXS1bgH25BLSfcq+
	jQedVxukOYIa730ccLYia+ti9agSwgWHTEousrHzjQoNgTSqnHgrsZFIN/PaTcG+XAGu6FGTJE0
	NnW5eIMWjk/PzXqNY/qFJY46wgaq1W/IRAgnOhTBG/a9MqwztonR4VYs/wj64psMA4LByaR+nSk
	t51T1ennqt/FYOncRDSPedmPm6v+D3qkYSrbBoKBt2dfe5wJVhEi/0d1d4E6yxXujl1KlJGIV2H
	8HQTlCpFxBvV7fx5ROEke3tT5dg/Kfcks7xodYa4f5to0ghMQ0PbSnlzCdhZ6yyQb9V+7kGT/KE
	d2v3op6k5rx17o3D9J/1XMm8+Tv2xfofYsnKCma2Taf+JInYlFQ8pDlMLv38E=
X-Received: by 2002:a17:90b:57eb:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39aedfcc06amr9073487a91.6.1788364193126;
        Wed, 02 Sep 2026 08:49:53 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08300ba2sm81417a91.1.2026.09.02.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:49:52 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@linux.dev>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@davidgow.net>,
	damon@lists.linux.dev,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 09/12] mm/damon/tests/core-kunit: test damon_nr_samples_per_aggr()
Date: Wed,  2 Sep 2026 23:49:42 +0800
Message-ID: <20260902154944.4035059-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151955.88892-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  2 Sep 2026 08:19:54 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 23:08:41 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:
> 
> > On Tue,  1 Sep 2026 22:47:42 -0700 SJ Park <sj@kernel.org> wrote:
> [...]
> > Both `sample_interval` and `aggr_interval` are zero here.  Since
> > `sample_interval` is the denominator in `damon_nr_samples_per_aggr()`,
> > would it be better to keep `aggr_interval` non-zero when testing the
> > zero `sample_interval` case?
> > 
> > This would make the test explicitly cover the divide-by-zero protection.
> > If the `aggr_interval == 0` behavior is also worth covering, perhaps it
> > could be tested separately.
> 
> Thank you for your review and question, Kunwu!
> 
> Yes, that kind of additional test case would be nice.  Please feel free to post
> a patch if you'd like to! :)  And no pressure, no rush.  I will also consider
> doing it myself if it seems you are not interested.

Thanks for the feedback, SJ!

I will prepare a small follow-up patch for this test
clarity improvement.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

> 
> 
> Thanks,
> SJ
> 
> [...]
> 

Sent using hkml (https://github.com/sjp38/hackermail)

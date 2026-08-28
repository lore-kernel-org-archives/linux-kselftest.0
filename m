Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B70442FD4
	for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917133; cv=none; b=bIjdYdP0lMPmX07KsDJ17q2M1x4nd7NIRF/VRVdn3IUXe5CHbwctIg+Bf7KOMLlelqXPavrIdQ6wYlkFHREsiCKWixd7ueUfIsB7E0rCmfWernEGLbPNsb9m4pHPtXzoct089r8VfiVYRpCOHccJAXfaZrBBaZ1ewnhcBy+iIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917133; c=relaxed/simple;
	bh=Yolc/DBb3H0lcmB9LTt9clnWPPbQNHzwg7stvh1CO/g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=spmYNDlY5foNv5zrw+xpKqFvZjzcS3xigF9lpia1RCnu3/A7w9lU0NNFQcnS0L6+t+RgAx1SN6wxYXhzhloZXyzu8wvv31wheV/kGTJGQV/griV4WWYrIMt5k/N9sBHxJh+ImLJid6jEY3FaKd2sViioRhf7rvZNBsTrBa6IHsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctHiZf2i; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctHiZf2i"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6c166bafcso11291075ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 28 Aug 2026 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787917116; x=1788521916; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yolc/DBb3H0lcmB9LTt9clnWPPbQNHzwg7stvh1CO/g=;
        b=ctHiZf2ioYGt3Jm1wRubl+N493WD802o2/6q4EsXAFGV7NvtfWLpKdwcM++uWxiAnY
         oybNAiwJrxGkg2ltpRBMMxJ51h+aMkffcv4m3CS+WoFgN3rTTiGYJaRHZ0S/Je6OtYjf
         KXO77M2AkaZRQY5t5/mxYE5XhRIEjPpmDofE3xEXyNxxhoKKbIWNtj2dbHoWo+J66e0H
         c034Gtp+YI9dGe4OHkmL7fBKXx4kP5+e+DtqpdaY2MeLV2ghUMZnwrLEwkFdOJlnSB7Q
         WJWyHIQfSIIaWN0kuVzR1FnHa5n/v4IgzlT5S+e7nddtlBXcezVNC8h9SqSA6S7Jv1aT
         MPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917116; x=1788521916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yolc/DBb3H0lcmB9LTt9clnWPPbQNHzwg7stvh1CO/g=;
        b=s65kUKkSy9lK5ev6/NH3HR1mT+EDWJ8dL017vRjVl0eI9cOoRIsUd4r+NL90lq8VDv
         KUqlY2jJCy7wuSFclxpoIi/kV2X/iYMBpWwD/TZVX4F7aubhLSnyK07nFxoswRgIaoYn
         58k4ZamMu9IEYy/UoyEIRnMn4zkilhS5N/OJCBjw073W3Z+1fy3SHixu/sscThz/QHmC
         zxkERvPplXu6KgCnKhOZ6/NZYtHvDXFMGrLlQDobfZ2wAaAEcWukWqaylwS2aGeLIf43
         lvmC39/amQ46D2OuXdoi9gjHM9D9DJMqdiqkZpVjvaBQXSfgUZ8UjcvctrqJdToWzRGt
         npjg==
X-Forwarded-Encrypted: i=1; AHgh+RruWyOLgeC/jeu8VG9pZwstT9YCVBK6beY7OD62WAxuV2xx0QhGiWvBN+aLiCNjMEwSLbn9ZeH3ljrgBXIHRdM=@vger.kernel.org
X-Gm-Message-State: AFuF++m+3Xepzpl8f9cNf9r6eCA36M+FOMGEHGLnHgA0T+h3ZOz8I3qh
	lO5JWyjoswmAvYfEYkwrH6cvQWy0I5MtH9FIWMAsW3kDgqPiQbhBOdZkVOFhQ8zPQ5631ia9q9M
	W2Q==
X-Received: from pleo10.prod.google.com ([2002:a17:903:210a:b0:2ce:d12d:d6f5])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b08:b0:2ca:e62c:9e96
 with SMTP id d9443c01a7336-2d74dc51c7cmr135512585ad.5.1787917116239; Fri, 28
 Aug 2026 04:38:36 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:38:34 +0000
In-Reply-To: <20260813063503.4023719-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260813063503.4023719-1-wakel@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260828113834.2354953-1-wakel@google.com>
Subject: Re: [PATCH] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-rtc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,

Since Shuah might be busy and hasn't had a chance to pick up this patch,
would it be possible for you to take it directly through the rtc-next tree?

Original patch & your Acked-by:
https://lore.kernel.org/all/20260430120313.4078185-1-wakel@google.com/

Thanks,
Wake

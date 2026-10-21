Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590092;
	b=OsXKHQyVlC34wURzI8SuHJh30zIDb5e3bYchVHTOcAKsadzXO4riAIdGQcecdMo355qC
	 yKwajPI+gOfp4WzL0eU1bP3x2hKKg77D8IWgs13a6NGmPzrySKq0+ZbyfwqH12shfJleI
	 wHt/Yt5Qd5wXA1J81SB5zfL9cfZfgJtMcKd0nYn7tRTY4xE1QYY9u07LM3IeyhLbbiE2B
	 nlYuaKbC6UY9WJSy3R+IubvJcZysdN/xVGftArOq+yGNb0+UENDyVH+m/VytUMRpsXKTG
	 DuLJEJOsWphEQfQZL3uvX9jr9YBCTj4q9J+q/p8Jss3LnOTuAXxUivX2JBD1Y0/zVqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590092;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
	b=3/IUtLE1O5NMT/LjSvFLnSYLHDqejLIA+rCLaXYRxcSU7TxsKJiiKwNJpI7UhtYHSjAc
	 y8xobgm9TXpvoGxkUThRoV7wMSMaMvBKgppjKPERwyZVRVof8xnku6HI6HYFm6DGDpTVn
	 KyFjmxry61MfS363CKF2muyKruWe8cMBKRW/nZtLkDgNmPl5xtcol9KLqWhWBDnrCLKsB
	 /p+JR99ShwPY+re44PwdkGfSj4r3hZs5mBVZnTLIBuxGJCihXmQvd1V5LbofdsR9W9ckr
	 ox/1Dog60VMpiWiDr4pW5djVfCTzfwHfPVJ7vlIEqViwhmlxVFDzWVQPOhhkNWg+LJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJccSif+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Vo/gfEI9";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AC606A319
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0AC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJccSif+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Vo/gfEI9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792590090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
	b=ZJccSif+bN+wWXyGEe70tSLHpBhUNKw0dUGHPnIPyltiCoaBWjcC58SFVAaLz0Dq5cvDxs
	Txus2u7TmpuEeQgc6SZ+uXGb/dIXpAhe1It6Upyqt1dg3THwyVx1zNktg5/4M4+R4W1I3M
	nBIDvkDIt35OOulnVaS2TEDXzjxgsjQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-d8GlXscvN5GnEdfG4x99GA-1; Wed, 21 Oct 2026 09:41:28 -0400
X-MC-Unique: d8GlXscvN5GnEdfG4x99GA-1
X-Mimecast-MFC-AGG-ID: d8GlXscvN5GnEdfG4x99GA_1792590088
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso191301385a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792590088; x=1793194888; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
        b=Vo/gfEI9F7cOYKyEkehqA4dhNl61L1PyaKEWjqfDE9h+GyilCPgN0m1zGnyJr8l6YM
         r1BwIo9//XFFPmgh/EPGavymTGTf2PPrfVMpMfXyEl9FqTM20+V8jer1c5Iow1LooMws
         R+Kc8KACz+wEeIERwWWlcaVQKN/45NaX8kx282N/eCsp9NTh1vY2GyfP7eOD5dyjufYN
         UdbL1k9Hy4RQtHUUObvNjwKsELm+fSSbqhSq52mmYOGHta3DTMHqucm/i9R1ZqrKpjQ8
         nBGlFT9g+dkBQyX+agD9c/jM64Um3npiCOFTa6iNWLTzHmLHQmiegVhRGLToTrscKtkC
         q54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590088; x=1793194888;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bv850EBQTH85bFk68nVgqk9mnj/LRa+SIuQDt9yO3k=;
        b=ADjBxSp0q3oHSBrYHN0q6N3AiOUxIQQpmyApXo1kQchFaJGP7vuntVU3kPE+/ipwVr
         Xonp/k6GvDNtNAJxdwLX67zAtczXW7RrnqWNW+hwh7jPtOqgfma36N89g/mTd077Phts
         hto3F5h3870OZFw52eqESU1ciVO0RbcFKqL44Hwg5G+yPN18n1B028VAKL42z62ERtMI
         LZZ7hKy6479uRNq9b9WwSpcIL4YCAlsEmXlhJdYrj+FwJrr/Rl6efwI2WeYKP/IauUSw
         i+oQqNKe30TqBPA9no8a0a4r6jA2b2k3NGpa6JzVy8mvtkJ2yQvVFuKsS65zQYgjOL/C
         /IFA==
X-Forwarded-Encrypted: i=1; AKwUvBwxx3rZ808aN3hPxLrWSlBcAp5RjRE6rSKiCp3KXMWPB//GP80fH48KaZxFPWsvEHFgnCKpGIVIPGenqtpQ/uI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5H8zZfuet9/SUXybkzXqRTdz53jbD2oD0Ry3clkLcbNpm6pcO
	ZI4Muo95XqtHkCp0qQXF0eJeW6ztG6OIKFOP23TgFkd1z3mmNT7oYItNTWI+/TTAHMwFhG6fjtD
	QNksSQaYbBxmG4xvcwuV3PvV9GdDKugFBmY3z2S/+NV88TY855dDvPkmTy1QBHs1SdaZyAg==
X-Gm-Gg: AYBFou2fSzipvm7aqng36/d943AtP0Yy+uwsZ60kvyFrADj/UdTEzxIQyYk9j3QoZeU
	mpQ4c3BukbvQ5LSCG3wLLeIW5xKyKEXiXYs/g36ofEJqJTPCU/yxQ9kDoWO2fjS9pAX6lSyFufB
	/zXLgmq8qfJ5P+rZrDjV6SLuB9QaIbvFUAu5KtFiYVlw5i9X5ysStmTqIGnzPyE0PSN9502OBbn
	U17EGrorfZy6wHNBZGSGAQd5fa5P6QvzkGz1gYaZ/lv2DcDj10si9D5i6uNriAvfqcum8Cq3FQo
	VXtUSGccOE0e83dqztt2e0I4U+kS8S6Xhu3lhGY8pw/BW05vw9NCUnRqNq8Z2ttFlMBwdEFSkqY
	W3LEO4OJBCaXVlEPozYPtMic0lJ6v0Ds7w5zbXH2ew7BFI36goN6w3RhHrF2twD2beUQ=
X-Received: by 2002:a05:620a:2b91:b0:939:f978:c1aa with SMTP id af79cd13be357-93f57ecf03fmr403504785a.11.1792590087906;
        Wed, 21 Oct 2026 06:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:939:f978:c1aa with SMTP id af79cd13be357-93f57ecf03fmr403501185a.11.1792590087408;
        Wed, 21 Oct 2026 06:41:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56d9a495sm259379385a.13.2026.10.21.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:41:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:41:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Alberto Ruiz <aruiz@redhat.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v8 0/8] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <atjBBPgt72Pug6IY@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
 <87wlrcsmv9.fsf@bootlin.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlrcsmv9.fsf@bootlin.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Tue, Oct 20, 2026 at 12:11:06PM +0200, Miquel Raynal wrote:
> To be fairly honest, the discussion at LPC about how to handle this case
> (and the transition) did not exist because time was flying but I do not
> generally like the approaches were we introduce "the good" alternative
> without enabling it by default. It just makes the transitions endless
> and more painful for people who already suffer from a problem. I am
> fine keeping the old behaviour available, but I would be in favour of
> making the legacy way available with an explicity flag, rather than the
> opposite. We may break users, yes, but otherwise we will have to support
> the two calculations forever and nobody will ever notice the new
> alternative.

Honestly making the new behavior the default would also be my preference
as well. I think it'd be good to get additional opinions about this.

> That being said, it works! So:
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks!

Brian


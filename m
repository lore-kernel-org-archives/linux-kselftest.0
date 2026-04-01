Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF519382293
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775078954; cv=none; b=MKJKU/4S7OgXvXzXbAyVnPhUCmX/8x5VlbV1qK1on4RoZFcvG+ITh6wHWyqW5aqlWtcMpKYSoP4zSEYZHKkWd38cwTW9KSRV+76UI2HMp5Rt/oDZcFHyTwGiQvSIsed3kYM2/WFpooxWxdb9STMO/Ibeqt4wMs/UIaswCW59QLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775078954; c=relaxed/simple;
	bh=GHZCrvs/D2lnf1tNNwAY3tuDLJpJ1NRojRPOhXECYoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/JIYrT1HtkTfbAojsECSDk605EAWBF36LvrTYNMTu8mGH6z2yM6d1+UWlQ2IXJieaVO/zEddgDMOKhCkRB9rCiIbL0CV5W3AimSKDkeI65zzwBnqIXj+Nr2drJwwffzNLz4DGzjmM9Kq+KSkOTjjXWIVXUVdSfZeO9JLo1N0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlvuSRM1; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlvuSRM1"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c66eafc1easo501746eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775078952; x=1775683752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bShaikocNKRsezTXMpZ0Yv/7QT9ffmKUjnagEWeH458=;
        b=DlvuSRM1g7OgVWwIEJ3PqBoR4u7VRs3z6gY7Pv74Iy/0URkYA7r7Cnta91eq8H2vYd
         7kklwlF1DcCA7KVng1AKfTNSzMs4Rx/oqVA5vH7UFT/EyCXDofPovx01DiYsZMq8ydLX
         rWchPPdiCMPU3IDE/a6JbzM5vvK5urCKYLPtqfyYGwmtJDI5FtF0o5j45sd558426YX+
         wm3GuD0JnW3JNziId99t7kRXyX/LzePR7O3kpWTNOLWek74wYWjhTDHcH0rDryL5+m3p
         ayKa+/J76c2Pc6jKdWsYm9WoyYD4qIR+rBwtqIbWcm4zn+fwDiIpaKu7+yfgTWUNljqk
         +0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078952; x=1775683752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bShaikocNKRsezTXMpZ0Yv/7QT9ffmKUjnagEWeH458=;
        b=FqeTGRTdg800TCpX+db0uOFO0O1qxKkeavgB+xv7Dwq/bmwWXbznMHW5EWkuNKcVdg
         HaWbftoD322LNWK2CtI8nEjzdIZOv1unUu0Sl+Dis+8deYf9nQnIzDUzlRiz7cPBuKGi
         kUGPOzpLWuGW3KVzQWr/8a5Rt2fl6ewUvkNPcl1AI1D9UXU7qHjIfnzzGeLxx1V/vb9C
         azS6ttOtiT+mJwZaI7Z1/ze5ClRAqt0U5Z5YWwDDmicQddPufgki2sxHVxhyw583NniX
         EzN9rkQkMXmC+Xv4L5A0lo6tQVK3NdxCf8mHVyoQm5V2flu5Do2Ajx471ekqCpIdjlE+
         +fYA==
X-Forwarded-Encrypted: i=1; AJvYcCW/KTRhjOKvp0ixiu1QyJVaWaMASJlyYZavGXJqatC4qH7u0VYE0R+0o0DNJ2SRR5+Du5G/fNLC8qWRUHp+jv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJy/5+uQ4lFexTa1WS3xg3YjWwearSyQFRJkO6DGfGFO06Zul7
	Jm0Z8tc1C9XE8ReWn4a4Ef2w1jhwWu/rE8ufUL3il0kyWfFiwobwcXs=
X-Gm-Gg: ATEYQzzJpxmPrj11GV0qi6W/1gveMkFDHhFOaNZVbw6UVszqqkG64b/FkhwUVI0O1A4
	ZC2pKghtPeTbrKEmH9j0qnbSv3JKLEbZ2gN22tFol8h7C551qJIpHUTYSOA2bVoe0X9IQnRj5qg
	G1O0NsBLnSNKV17a8XCrIu3nMt6Muv42RPvUQZl25otUtZWm9583+O8pzvSSrSR30r+OR3mEPAF
	G33GZi7D4Nzeg3X8R0G62rbzxdP1YziuiSJdVY+YLOShFlN/6k3Wln9Ie6MGFih6IsL13Fs8zZz
	xLt2FWqp6Q4M4Re4zGWpsTbFB6aMSt+amlCaQH9TbtN14RylMk0BCp/DyqQbIC6CVDUTfUaI9wU
	GKGxXOxUS4rLt5GKhDaqvYwF81Qi0lTjEgWeeRV1jWoyzvz8TSDne5bDm1M1SPBOI6RBOrno9e9
	uWeaz1R25FcAB0sJVsWWWJX02QT7LgI9DF1PVaqGrsnadmN6t1ZFIE9xIKBd86WG+I1KQjPFjD0
	aFnXHDlwZ1R2YVjLg==
X-Received: by 2002:a05:7300:ed0e:b0:2c4:ec89:be0 with SMTP id 5a478bee46e88-2c930e6bdd8mr3177283eec.9.1775078951786;
        Wed, 01 Apr 2026 14:29:11 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm880756eec.19.2026.04.01.14.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:29:11 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:29:10 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, petrm@nvidia.com, willemb@google.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: py: color the basics in the
 output
Message-ID: <ac2OJvW8ZfzDFtHr@mini-arch>
References: <20260401183309.378671-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401183309.378671-1-kuba@kernel.org>

On 04/01, Jakub Kicinski wrote:
> Sometimes it's hard to spot the ok / not ok lines in the output.
> This is especially true for the GRO tests which retries a lot
> so there's a wall of non-fatal output printed.
> 
> Try to color the crucial lines green / red / yellow when running
> in a terminal.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> This is a bit of RFC, I'm not super convinced this is worth
> carrying in the tree? Please Ack/Review I'll apply if we get
> 3 supporting tags.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

(not sure why you think this might be controversial)

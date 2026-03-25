Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19723932DF
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425500; cv=none; b=e/JKeQ3CZhWIviD5N84lub3RBOn1e7YjCLd8i+CqHptCCN4tImsO4KGAZMtQV0ZCRWfrkNtIptKTGjEEHZVeYi0jTsQDYx5G/CanHInxFMkeEeR12g4py9Sltz945M7VJ+4I4GkgJW23u8KJUE/tNm3SKk592Duf5tAF+2sAQIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425500; c=relaxed/simple;
	bh=Nhap5OhlbJUhpDgM6+uH8Oq9B9taI42X4+dQ4vkduGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mgt+cOSmkbbi7iCi0Rjh9TOSVKWyKSckxX1m+WIn4yA0z+HJJ2VLQKdgXMpjOCcX6vdeQ0lhQobUSwMnVbXhzQ0qNjfX6+ro6q+9dEEFrtaIpwrVQXIsPHzJCmU8W1Gk2OcAeMb9bj3e22ywgaTWMMsNUCM4r3TommSGzeWOFCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADRnxOma; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADRnxOma"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so23741635e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774425496; x=1775030296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hp3ZUuQmKrx5ida+JuBhp5jYyBoGT9U4aJdscJfGhLY=;
        b=ADRnxOma4KaZIVu7gdekTzo8IeuFtoeqOT78gJndnAJsesAWEuxWtv5hGdXrn6DxDD
         wBrKUh6M9PA8ayfpY5m3BIEVh5wKvPkY1lw2Im93zr0ST9jH3059gUu9dVY6CF9J6DiV
         dBb9rahntY4i1UI6ndBM45UcInJ1Mo0cwAmvrpAKTZtyIJ/izp5Ag2x8XEeG5IKGv8nT
         U2fEmbtyH4W6OqZFl44FVQGnHY8Kkibwpsh8SqNYpHXawAUh5itFTUTprXcQVMpSJUDN
         3TATwestEqL6eesNA+p/8j06oIzUSkEe00/ROgjHFmOmTk3K6JxWobjQQXWkZOXEXaZY
         CQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425496; x=1775030296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hp3ZUuQmKrx5ida+JuBhp5jYyBoGT9U4aJdscJfGhLY=;
        b=H/VmmZIESLrfzgUM8wh9tTI61gVDmmytMRuDd2MmTgC0Hf3T3DaPTUVdZ+723o6wGa
         g8OZwtouqFQLYBQ9LPXP6k98KTt56Ddy807KbJvlSzdOTrrFesT2bNV63A6QJWSkSQV9
         HgX35xWD140Ph5DS5RMVjYAmkoGqSD3JCGQuAqzV8vu0cadaJlT7LaBmfPc2FkXkkAMB
         LwEH6GS7x9suBYK+vaDGN4FEQ6yf5RhnpBR9TcvvksR3/fBasmjUHHrCddLasHOEs2o/
         4CTc6Hz+Hc1nDOj7P9KPn0UM0BhidUBmiGZngexAiuslMPDbnhPiSDHhQQWnZl9h8SpM
         44FA==
X-Forwarded-Encrypted: i=1; AJvYcCVfWUjfidEDUyDSRogyujevTjjTvTOXnKvEgw4SuIOmxxYkVR17yUPtw68/z/rZ+8A/BDzlWEzTToZnDdTxHFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLJ2oJUCjMfoLjSFM6lg78ugl3BEQODIpRAo5NI/b/6s0TWw/
	YyYPPPYPE9ehtubTUGJA4sBSI4piiXeO/1YZIuMXUEY887b0BLNn9h0m
X-Gm-Gg: ATEYQzwsd1AqawfsgRjpgoNdWFRk+4qWI5gva+hxNL2fxS7XowW+jIiuAJqlU6JoR9g
	vaTR4bi71F4+geGTtA0Cmu8dPChbOQ65qJFhZ2vvL6w+GS9Hu5o7Mp23M/JanYTk8yJukRjrpQk
	EUKfvD6Jh+2rr+pIPXxnQ2yVxTPS1/r7ezKFVPA4bEIx5WcZKUymldmgfPbdJGlaLYAh1J/ELL7
	2jeNJwcPFDEDe9gLdgRn95y6bVRrKXffKoY5AgrQ0ngKd0qLp7daJ/Q3T+qCMIHj2mCS890mezm
	/yKIq84jqL3aD25/3dKqMYJq6M5HL2a2giwOd5CUkLmR8cm4mY5cbOxbD/BUdv6k6Bkxpyxa+nX
	gq2My1TcnKKr+WpPbCFmIUT3J4gzxW1vuryC8IW/orLWGWV9LWshHJnmkMOdFifel2GSeQXiMNn
	HrB1faczXcsC9CeOgP58Ta95h+UeB3kdJfm7PCmXbKej39Nb+hpDdGd7o6DP4JGQ==
X-Received: by 2002:a05:600d:8453:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-48716051e4emr24433745e9.19.1774425495723;
        Wed, 25 Mar 2026 00:58:15 -0700 (PDT)
Received: from gandalf.schnuecks.de (p5b2e2f9c.dip0.t-ipconnect.de. [91.46.47.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487172a72b6sm21687395e9.3.2026.03.25.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:15 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id D1C4F305DD63; Wed, 25 Mar 2026 08:58:14 +0100 (CET)
Date: Wed, 25 Mar 2026 08:58:14 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] tcp: fix scaled no-shrink rwnd
 quantization slack
Message-ID: <acOVlten_N_5evGX@gandalf.schnuecks.de>
References: <20260324205301.1361608-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324205301.1361608-1-atwellwea@gmail.com>

Hi Wesley,

On Tue, Mar 24, 2026 at 02:52:58PM -0600, Wesley Atwell wrote:
> Hi,
> 
> This v3 addresses the follow-up review on v2.
> 
> Eric pointed out that 1/3 does not need the added packetdrill comment
> and that 2/3 compared signed free_space against an unsigned
> granularity.
> 
> This revision drops the extra in-file comment from 1/3 and keeps
> the scaled-window granularity in int space in 2/3 so the comparison
> stays type-safe. The overall approach and reproducer remain unchanged
> from v2.
> 
> Simon was right that the original 3/3 only showed the explicit
> rcv_ssthresh-limited ALIGN-up behavior. For v2, 3/3 was replaced with
> an OOO-memory-based reproducer that first grows rcv_ssthresh with
> in-order data and then drives raw backed free_space below
> rcv_ssthresh without advancing rcv_nxt. In the instrumented
> old-behavior run that shaped this test, the critical ACK reached
> free_space=86190, rcv_ssthresh=86286, and still advertised 87040
> (85 << 10). With 2/3 applied, the same ACK stays at 84.
> 
> That follow-up also clarified why the broader 2/3 change is required.
> A narrower variant that preserved the old rcv_ssthresh-limited ALIGN-up
> behavior was not sufficient: earlier ACKs still stored 85 in tp->rcv_wnd,
> and tcp_select_window() later preserved that extra unit because shrinking
> was disallowed. Keeping tp->rcv_wnd representable across the scaled
> no-shrink path is what lets later ACKs settle at the correct
> wire-visible edge.

So, you are saying that 84 defines the "correct
wire-visible edge"?  That's a strong claim.

The test in 3/3 adds OOO packets until the window calculated from
free_space is 84.  But why stop there?  If I added further OOO
packets until the calculated window drops to 83, I can claim, by the
same reasoning, that 83 is the correct value and the initial 84 is
wrong.

In other words, this is a very synthetic scenario that can be steered
to arbitrary values.  As stated in v1, I would really like to see a
packetdrill (or real-world scenario) where the old behavior actually
hurts (after all, this series claims that the current behavior needs
to be fixed).

 
- Simon
-- 
Simon Baatz <gmbnomis@gmail.com>

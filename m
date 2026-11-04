Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816160;
	b=K7uiYDpXoDOKYx4M9uIhMZsqXDzKrkZMqkabJdR8GkP5UY98pGGwlaIqcuB5ade4Nu6p
	 0RJTGRbkrXIDwf2VjJGtz3BLjThsXC1ub2QxN9rENVPUmm64J3+oGn8Nb70CZnXAhlaEZ
	 R1P5VhIub2ovbEgiLZDSDekmTzw1dvJ9BHE3LIeEnw+rowfbtWLLtfeQS8XhhOt8GmNOj
	 uquq5tmzB2clfir+duiiuU/d6se6vyh1hS9ZkafaY2U91jQpBqryFxbBrMuSUuyxvzrtn
	 qnjF/5iumdd5NQyZAUBqZtUTERQNl4f88PBoHqftVhMGnYv0H0SVr4f2oZqLGpBPAFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DnkyCFwfTEyghMwBbYx5eIEahNaTNIOnK3R3J4LlqI0=;
	b=t2+flnKyhfhCUcaiVR3sdXg0pa9c6/XhF40CEdYJxIGh51ddultGrL8ifxOHpax6uZpK
	 sqxee4dNg7trA/uANdrZfILt0PVthGI856vV/h7Xj78CSiz8MHpVcuyYag9KMgEalnu6e
	 84ftpsdZjcP/h9AG4QpifxZLhqcUnkuvYrSVTVi8GvxThXkoHFNr6RXZSZxi094DJmytd
	 6Kzm+uB19AWGuZlvnV7c2vBjjn9tViOvF5TMwFeUDfEcJNtzLg4o9KPch+bA2YWqmvuxL
	 eQSVb5oDdzvA2X9YMdpzN4Ac3cgC6oNZOkhSQ3LhzKqsBnEBDKXdX9RZAhb1UTkzjCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dh++Upn4;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7366E606A332
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 18:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7366E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dh++Upn4
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89f639ba307so458912b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 10:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793816160; x=1794420960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DnkyCFwfTEyghMwBbYx5eIEahNaTNIOnK3R3J4LlqI0=;
        b=dh++Upn4ZWf7TCTz0JkNT4qSQSDu2Uaew4OU6cXSrs7FN7XOMXZsdZov0rgiApzPdc
         j/ns2tZ0F2dx8nx41mTa8X6jql6kq29Him+xrNExnL/EM7kKeBV8ig+90HaAGgqZAnT0
         LMettOORnr9NA//uos5+vFkmDNagJBGWiOQsed3rCndc7d9bJkQuY7waS+JLgLTTTOOy
         mBOzI23pKm7CIAMKMPrEoPNirsQWVh5aoYVmAVqFVvbXlVpht9LmGTxRgpyaAIIXSUp/
         oTAYhipNNWLuQs/zyCPXYHTZAnXDgPYTakhqHWuy2hrQCEQL/YrC2pcCxPGbjZ7j36ME
         pQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816160; x=1794420960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnkyCFwfTEyghMwBbYx5eIEahNaTNIOnK3R3J4LlqI0=;
        b=0xiswcP+VUCKBEO3UvgnkDCCLKdlBD+qwTGRZHPgoYyNsYCahYU/zo+E163hAO5Jyk
         uTrDuWd3zONFwUH+CVfbl8yYioE9AeNFMLMDd8d40ikTeb5GP1gHJ85Ekxjjoon5XWHH
         ENxvO8LJndGkEH2hrbkQZYvT572GaR6Tv0Zb6GuTyQFyxOk64pivoYWhSV0mns1Rykfs
         9ThKxI6IRnTme6kw8ZycjMIqiwy/qGWPeydcoCAbH6g9isGLCjKZF8Q4imrWt66YWCAx
         NsBp+f334gPB+Lny2EG6FQGQykVzAAbXxw1sChqgLUtEGl/14eCX6XctHcPye02WaCB3
         RYiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKBTbY7yxVjAY5HdaHlRtMKcF0NDE6t69fEfRhb/Pw0CveE0PQ61mwzCKDfnEUjjS+7lRJZjCPUDlRitaa6sY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cLjwk41Opp87fbxUmwGophJCBBwgjIBD2K/rDYkIKnr3DWHt7
	Yx2T+Y6l5dhDQLLTv2+4V6EUvmn0xi6iXdY6/eZq6A344fx0ERUaaPzjhbeakgipWg==
X-Gm-Gg: AYBFou0fWgR2cuyJjqs1e+8v3YgBMGil7XMotW6eTp9ROpa6UQB0ErB2iKCiya5pH0o
	3dbnEzLD6uL7pQtBvh6q/8I7XVYwMgPN82cBKGsHuvK6EQxFtW0tcJDJdxWlDHHxAS7NXN7ms8Z
	oOUqt7GcwOdezTkyAmSTjO50cPLq7ZsLpnFzO6tClqW3D/A8g3IkGNK+ihxrr8d9j5z67RrFN58
	FnQdi1nTV/Q6XbBhD/P4CUpYkNSz+YIiQWnO7xi4lOJwvm57J/yylzugBu5A9pcN9nfxzi6oh3F
	BBjO/eujQQqZOHQHoT2HbbtahOQbXB6tL90YBFFROm2q3MYpoJD8NZi7M5pcm2ZZESo0zp1SFoh
	D9o2hHTy05qlPmpgLh4ij9vAUgVNJg1jqfgF0GStcm0sNkc1W/5p4T1UcMGxTzch/Voa9bag1aL
	WfjtzkoaP2MMzOKC1NnYLoQEa3jCWmNE8MFKkODDk/MEyZ/oBQ/tdzz43kwfGVWPVb0jvfWLosu
	MgyPqlhjKTSkjy+JQ+Sjx+vVtcyd7C6RC7r8TLP5OIJsHrcUvkg8rpyxxzhBWu82DK6+do47Ei9
	BWewUnnfKJ71yrJKZ5+3RDAXXWmd95sA805NIXpV/xiOoXWHeobm6bemtX3D2VCm
X-Received: by 2002:a05:6a00:3c89:b0:886:46c:8a1f with SMTP id d2e1a72fcca58-8a9bf0466d7mr13529775b3a.35.1793816159117;
        Wed, 04 Nov 2026 10:15:59 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bd3ad6fsm1246841b3a.55.2026.11.04.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:15:58 -0800 (PST)
Date: Wed, 4 Nov 2026 18:15:54 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org,
	Abhishek Sahu <abhsahu@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 5/5] vfio: selftests: Add test for device power state
 transitions
Message-ID: <aut2WmTGY9M8BM4U@google.com>
References: <20261029203324.1637772-1-dmatlack@google.com>
 <20261029203324.1637772-6-dmatlack@google.com>
 <20261103153553.6caa7d7d@shazbot.org>
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
In-Reply-To: <20261103153553.6caa7d7d@shazbot.org>

On 2026-11-03 03:35 PM, Alex Williamson wrote:
> On Thu, 29 Oct 2026 20:33:24 +0000
> David Matlack <dmatlack@google.com> wrote:
> > +/*
> > + * Put the device into D3hot via config space and then close it. VFIO must
> > + * return the device to D0 when it is closed.
> > + */
> 
> But we're only testing that it's re-opened into D0, there are multiple
> ways that could have happened.  It's pretty common that a guest
> shutdown might put devices into a low power state and it's brought back
> to D0 on close, on reset, on the next open, or even on the reset in
> open.  So I don't think we're testing what we claim to test here.  I'm
> not sure this specific D0 transition is observable, even if we were to
> resort to pci-sysfs.

You are right, this comment is not accurate. The goal of this test is
to exercise closing a device while it is in D3hot. The close should
succeed and the device should be in D0 after it is next opened. The
transition from D3hot to D0 could happen during close, open, or anywhere
in the middle, without changing the uAPI.

I'll fixup the comment, changelog, and test name in v2.

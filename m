Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6AF27702D
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659380; cv=none; b=VVJuMYQmD24PS5kO4moA+/IYwyUwG7SpSEBguXE2MVUe3WBRvHnsMDSvtYD6BaCBvtiDXmHGE0hFJ9bMW8ZO3aiKbeCa0+hWFY8nrFfFktXDLPB9bdlSweIgT51m2Zz2bqfyy5Pye3wim2AHRkj7jfzL5yUSMlQiQPdsEqO7Xhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659380; c=relaxed/simple;
	bh=4jmmhwQ9HX1nE0wu5X/8gnKDvmvDMxjNyuG7KPrwFyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP0OYMjiJrGgs7oKsQB9O0EWl9MhHLs1xeDBjKTVHMfnNBKEcHdOlj1QnMzOZU1P+S+VYBtRWueCJayMdEPHiZ2AIf/xqXUtp3m6LOdkd5Fj0E2IWyafXu7okpBiGnSwU9oUwKACo9ufwRTZRXh6NeZnba+IVEIXcWaJXR/adkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwdQWneu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pg8DR4Zc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwdQWneu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pg8DR4Zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773659378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ1qCUPpj4bfVKkIIWkXXV0ps2+j94E+3GVF/7CvIho=;
	b=TwdQWneuxH+XPY5fg4W31LtUzZwvs9cfCZ9dRdFiRTRqPq5HjSQG3cmFuV74Ua76gsC4uR
	U0F1zxc2w6xIU79k5AOg6R2+CobJckyBOc8SM+sXtadubrjpU2TpI+f72fTtKOoC2vE5hb
	d+egVbs6e5h63Ek4ToRyjGYUzu8woQQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-nc53vDDgOE6RmDBfbu1BFA-1; Mon, 16 Mar 2026 07:09:36 -0400
X-MC-Unique: nc53vDDgOE6RmDBfbu1BFA-1
X-Mimecast-MFC-AGG-ID: nc53vDDgOE6RmDBfbu1BFA_1773659375
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b42fe9031so677940f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773659375; x=1774264175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJ1qCUPpj4bfVKkIIWkXXV0ps2+j94E+3GVF/7CvIho=;
        b=pg8DR4ZciRU/ukhYwrOaX5lhErZFYQYqqGkF8dOZBruSptnLZupCiLBDh7he1CAsoj
         OwMo2wYzzCgoWmiCIDr5UKJUx+mOnWSeV9IdoW/xKbCXQIjXY/ewQ3ikUHOziqinGCbd
         7RakQrOrF7YGCOxR0brm55nfK4kwkQmjycIgVoP+C+3OTevfsvvFm0a9LAyZh/VDC3Qh
         YxlJ8WPAr2TO64ipKdC4jtOdJUPFAKZMDK5jOf9fJDDlN4as6ujUXPyjMEyCVKR04E6u
         l+B+2js3mM4UFo75FrSa6i6fCQb91jF/XifK9rEfDtdt8VNXav8ivTnHOfLkP1rukbFo
         Celw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659375; x=1774264175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJ1qCUPpj4bfVKkIIWkXXV0ps2+j94E+3GVF/7CvIho=;
        b=YwYZD8tBDoXlKJZvWOPI+NL1xgYpJ2FFI1q3ru1b0Rjm486QUCxC2SqRE2PlnbtVjO
         43RppX7XQVZQn3MAUbU6KgLUCcYup36XItWBDc8cl2vglgjF8sJhBmWDktIEZNG+3LP1
         gfg5h8BzFWJr9RrtOK6rBiOpR+Jx2DLnkR52uQcdHmtUO3Iv9+BFsAGfFREsJjpZH0CT
         7CdPjF5CpwNSwfkJxaHYUblMsr8Y+ZnOl9/LaPA7JWO3t7aWx2+kEQ4cEdlVkids8vGu
         lP2+7Laqe5u0OUnvMMhQgJ5VqIScqXAKrIXMNHaqzJFj2gx/pfjObYZC/LPIfmBgi6qF
         mzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPRDUDX4rGM0X2obEGyEp7mVvyvLwwcyTOCN8I2kqIwHIXY6y1iwwPbcNd9lWkfAlDIFOpgYBl5pFOgMShgaU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7A/jyKID+T1JsYVM4JdNWzW71eP5JIipI4DmgI0V6AmhM3g9H
	0fv4wnKAWAW+jpzwsvJ3P/zJuhpofNhVY/Uo7DkxlqldTDAtAcqvgpRyNwi10fw9vzM5reAr8yY
	jkJ72Yx54eiwP5u/tp+NujpE/XI/BwK+Zig5IrafLBl4pFplUSYeJit1D0finHJhnyGa1fQ==
X-Gm-Gg: ATEYQzyGLykLYVQp7lfBq8XjPfzj7WIszMUlGz0kvaoZLWU7t9X7o7qxa4hP1E8memF
	YLRlO7rAt43CZJKXJVc1W08yBFSn464zOA5qbAs1p3wLgenBZ6q1Ek7TtC8wvGG04HOLqC8DNV4
	dRylzdnoW3GnF5uQBxD9uTnRLQ6ciVALM9ViZWKOHkjZ/yea9ScAc+zE+d/vlhRlwpkGfcbBaJb
	AiDuocao3T9TZMXXubU1qEv0Amjs0el1XI3Ku9KFQXYPMAVPJMAmhZEKOG6Ar8MEYA4lcwQPklZ
	8TlCMg3F4tT39/FIX3DQfSyw/QvaVcNpI5bIthvNqqTQxB/UT6V9Ec9gBP4y9tavKdzMfruNv3A
	Gsv2smfhI/TKDKvedR/Z4VtwpPkNGP+mSo7xMKNzFVq77eITKob74/bQ=
X-Received: by 2002:a05:600c:a4a:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-485566facc8mr211849505e9.19.1773659375345;
        Mon, 16 Mar 2026 04:09:35 -0700 (PDT)
X-Received: by 2002:a05:600c:a4a:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-485566facc8mr211848875e9.19.1773659374904;
        Mon, 16 Mar 2026 04:09:34 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm1212991845e9.2.2026.03.16.04.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:09:34 -0700 (PDT)
Message-ID: <b042de90-79e3-4976-9bbe-b6df3266caea@redhat.com>
Date: Mon, 16 Mar 2026 12:09:32 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/14] tcp: preserve receive-window accounting
 across ratio drift
To: atwellwea@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, ncardwell@google.com
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 dsahern@kernel.org, horms@kernel.org, kuniyu@google.com,
 andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com, jasowang@redhat.com,
 skhan@linuxfoundation.org, corbet@lwn.net, matttbe@kernel.org,
 martineau@kernel.org, geliang@kernel.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 0x7f454c46@gmail.com
References: <20260314201348.1786972-1-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260314201348.1786972-1-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 9:13 PM, atwellwea@gmail.com wrote:
> From: Wesley Atwell <atwellwea@gmail.com>
> 
> This series keeps sender-visible TCP receive-window accounting tied to the
> scaling basis that was in force when the window was advertised, even if
> later receive-side truesize inflation lowers scaling_ratio or the live
> receive window retracts below the largest right edge already exposed to the
> sender.
> 
> After the receive-window retraction changes, the receive path needs to keep
> track of two related pieces of sender-visible state:
> 
>   1. the live advertised receive window
>   2. the maximum advertised right edge and the basis it was exposed with
> 
> This repost snapshots both, uses them to repair receive-buffer backing when
> ratio drift would otherwise strand sender-visible space, extends
> TCP_REPAIR_WINDOW so repair/restore can round-trip the new state, and adds
> truesize-drift coverage through TUN packetdrill tests and netdevsim-based
> selftests.

The series is IMHO significantly not trivial. Can the end-user meet the
relevant condition in practice? How? What is the net benefit in
practice? Is that observable under usual conditions or require
exceptional circumstances?

I think we need a strong motivation to merge this kind of changes.

/P


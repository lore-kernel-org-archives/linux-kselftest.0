Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C812868AB
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 02:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770604780; cv=none; b=tG1L6omBwCegKs1u29fvYsh5bWWUaOz3tqEvhUF/MG2qkZN7yPID+7OFpVI6fhkN4VPwuytWwAwoYPuBFQjyBKzkggSP3feHwkaygeypRSaTIYFdI1aRZrGdTQHuOXlSCGYlcmNTPv/Ui5cxRV4Z7W2nEN9nX1W2KgWmG9Mbp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770604780; c=relaxed/simple;
	bh=Dyqcoo3l1nUDiS2sC0rr3LvrOLDTeVtTXp4q+Se3w7U=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Bi4KFrbFXWzgz5IaymNc2pHzZdxNsXVoDhwcXucgflPhwhUrLM4oSD1thnK2BER9T1ei/e+41UWa2jQ08rCn+Dtkp0huiMG/M+6WGG97BMRWCaypQVjYemaKhRrDkwqRPIAYRhYmNOM0oEAPA5wbfKHqgqdlSRpLcRNjZ9tg0Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW0JAQoN; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW0JAQoN"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7964f1405a0so1105387b3.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Feb 2026 18:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770604779; x=1771209579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzmTmGA9U4NoHGqPknBLmfObKJ7TSgXNKWJaNi5i9mw=;
        b=iW0JAQoNEjyVIt74uTX6YEW8f7CawiIJI5+TOTQzZ3PZPjMfo25MyJXUbCp3qDhS+v
         On2NKGbWV/F3TsJQ0D8S90E7d+TohOYO4tJyFjOkUzJyMHVmoYtc7d/USggQmlJdX8yF
         +6tD2m+SjUtiSyNk485wE749yreVi5GJoBg+t9dkQ11/jZcq8D4h53O5wUWwJZQvS2/D
         N7DajpFHf9VlW/2uXoOs1B4gNW3bDQJHdPSeb3RM5O0LZ8gH+1e+h0fYp9xdv53Mm6bP
         ngwsrbs+Ko8JHMH8133mY8Ino9beAIQiH65FMoGvemrdBmQ3j9HFC09EEcAmf7dl39wn
         d6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770604779; x=1771209579;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzmTmGA9U4NoHGqPknBLmfObKJ7TSgXNKWJaNi5i9mw=;
        b=RzuMhg4WdM/bHJUfcgf32Xq+ri3zghTdrjboclmHJll+ldszllsPL2z4/lmgC4MOCj
         U+s0B8BxxP8g+rFkOe1D4e5KBIdHipTZTXW+OqReWaltXbjWVNtrFryJ7ob7dGhBAV/g
         JmdnCwG0Qlx3NSLlYw7V1ZwOYG1hi31f6Br7U5VnQi7ON3AEvuXjU/bGYIey81MQxlSz
         Nude8okIjXVtrEY5xEmSg5veXWe5Q5sXSxPsCZRVJQSt9qZdsh1CRikxp3ekvQcsh5DD
         mzk8/wX6hMWCBcbQGdVj/akrtVwfbZFprm5sHSMyUbCAoLD+TUKMeI5dkRmKZ/m6b5oB
         hFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9VX+wUlZcrhZAd3obK5bj4xchBtamodamI/ykmqTqEiueWk1Au8yb1FNnFnQvEMcXkfuFpsgVCr3hwUzSxZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya7rC6qTKJAi284DIJ2iFi753ofNBST6T254nm7mkkQbaE+2Tt
	KFCp3QBtoL8y22DHiSbCfqjT+/D2vpiMi/J3R2hTDprGLI7gfpyD8MSu
X-Gm-Gg: AZuq6aI7Zyv2hjDAhCKitxquRlepZyeYb8/gEOf1cUznwQgU8E7tYm6nOdERaPlHrJ/
	uh39aD+FrrcsMI+RVkOP3vU+jTKrh5UBgRmYsBfAzZzduMEZLNsakAduFlcjE0bTp839ll22yEQ
	B886a84vt7wkwHvMH+w0AMUa39opYN+mTK5DWUcExKQLnts/sussbUod3MFZM/xfeKtmyFb/E5e
	0tvdUko0Ykf8xPhm1Rt9+xeBvmhtLf73BttVeCtUIe2fLntgIYIL1UdP8UfouI17kci+Pjd5r99
	11S9Kga+PnRXqIkeydvpmi4XnAL3cqhoMtyxdkjke1E45Mc8A8Z8nsNVyo3DuGA/9BUKRMcDk3j
	Q/EWo+/mS5J4NTnsqLx7AYMOy6MjLUUJC7XLaK+QPkLLEjdTX+3jWJlN0QX/4XJwFlqVrWo817F
	Vgk/b4m1vG7nnaBF1P7eb7eykkPEPBANaCOPvSAIr+ybPj37X7qARyhl32rLE=
X-Received: by 2002:a05:690c:9b0a:b0:795:616:434e with SMTP id 00721157ae682-7952aa91578mr105276447b3.16.1770604778920;
        Sun, 08 Feb 2026 18:39:38 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7952a1d9b38sm80237017b3.27.2026.02.08.18.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 18:39:38 -0800 (PST)
Date: Sun, 08 Feb 2026 21:39:38 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 donald.hunter@gmail.com, 
 michael.chan@broadcom.com, 
 pavan.chebbi@broadcom.com, 
 linux-kselftest@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.743811e01cc@gmail.com>
In-Reply-To: <20260207003509.3927744-7-kuba@kernel.org>
References: <20260207003509.3927744-1-kuba@kernel.org>
 <20260207003509.3927744-7-kuba@kernel.org>
Subject: Re: [PATCH net-next v2 6/9] selftests: drv-net: gro: use SO_TXTIME to
 schedule packets together
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> Longer packet sequence tests are quite flaky when the test is run
> over a real network. Try to avoid at least the jitter on the sender
> side by scheduling all the packets to be sent at once using SO_TXTIME.
> Use hardcoded tx time of 5msec in the future. In my test increasing
> this time past 2msec makes no difference so 5msec is plenty of margin.
> Since we now expect more output buffering make sure to raise SNDBUF.
> 
> Experimenting with long sequences I see frequent failures when sending
> 200 packets, only 50-100 packets get coalesced. With this change
> up to 1000 packets get coalesced relatively reliably.
> 
> Reviewed-by: Petr Machata <petrm@nvidia.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Does this require having FQ installed? I don't see any qdisc config
in the GRO test.

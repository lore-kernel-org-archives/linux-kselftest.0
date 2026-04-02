Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6C4414
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 00:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775088207; cv=none; b=idjgNBP6X+pCO9/2fevb+rwBr0oUlzN/DvNgE0f0pHWVLaCM3aHqFEvU7+2uIxvXFSXCLIbXSZAhgjBJEHN1Xm9EMiojqMlcAquzLg2iSv8DbgVG2XTukYLN+yDAi0WezCtldXAVheokpsHtcvWuJxTpgmQ4CLppc4/e4NVbowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775088207; c=relaxed/simple;
	bh=Y1N1O73Noe11Ry+7RkTMEumTw7rqGwyAy8VKzzmXGKo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=c+sXipa+/qNeE74yZGQ1DA4b/g9IGlFuNsHMXscGiitZKpTHR6vL6/DIsnT9IoxFBRkGrnx1J8PNGuen6kCF2z5Qx5iodEVD5S3JVWWldCceMpz2vPG1t36J1hKUTHuju2+I2Ovovwz166zhpREA4ip8KQmcqj/rEIQajmmKSY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPN/b5ZL; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPN/b5ZL"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797ab169454so4654427b3.3
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 17:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775088205; x=1775693005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFQs/ETxRhHEXZRT2NHqizkA8V+kgzkft9bf3gQGYO0=;
        b=RPN/b5ZLrxh/lmz2VNh5HxizGmAmkDcnQotIwRZUeP0KGzIZFp9meHscoCvEGhVR7j
         br9UChpW0a8A5sk/2CXXEXAyUZb6dUPGUWA7PprJJ2scxIec8vBfgZ29NNlTvWHl5uae
         AYROqUK+VDchMyFn1rXp0RIc7R4skjfaAbXAGnXtd9rxEK5Gi+2slRdiH5S6vaxM+YHo
         4QoCJ9rAQCbP4Oj7GbUQnT0J8bBnG7HTs5QrZ1cnFFCGMa1jIXwzyC9u2mp6sa++ZCz/
         vue92duaZAC+nyy7c3+kj6PX790uXIuD7U5Sxg/rVBr8FjkRX6EI8vLfn87H7MDQ+A0S
         6e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088205; x=1775693005;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFQs/ETxRhHEXZRT2NHqizkA8V+kgzkft9bf3gQGYO0=;
        b=RPueoDUFtFbdxsyVAKweaYnYjXvJNjnaR3qaRPvW6uk+XL/T1z+atRicSR2UOSL5F9
         /pZYsZvtVqnoiD8KP/4Nqf1JPZ4xyMTn+yXQgM2yDyBJV8jt7OxXdEDdB8041Cu5oPj+
         xkBEwtclfusjskqaT1AUMb2JiCWtbZSmxCSQAKWOBJHEehw6wgNus8Bp89lgAunoLhMj
         pSxulViplRmHS7sIiuNxd+zSUZBhfuNhLO0DIzEANwfU8JdFFZDldFwN5i7ipcAT7dVp
         WoNFWAt4nbV76yCIYDgtIoIzIhSe/bDD8fp/Drg/alwq0wWu+fv7ddkn7toEUVIOK/HX
         FiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9hFHjUnkEFPAsKkmp/4Bl23zqT7rrmBV6oRFC1YqVPP1svw5DwMNWhzA4RNB9l+Wk1mjrM0/zA4Gqqj0Cq6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbC8ajoolMtCFTIFIiR8R+rfYlNhb0hgYE7E/dGz5P93X16Fy
	j8lTZPHTrBxvD47B6cNNvNa1lzm2ZihqCIfje72xa6ZfGRfIjZsEkhgV
X-Gm-Gg: AeBDietDpSrIMo0FIRExkSkZrrQ1YtgxZ6/Nv829xj0pSaV/ghiEr2ftnY8fJSKmfzR
	+q5pRbsEcKWp0GcUHtV/02kB2dl6p8jsBAhlpQ9fP/jZDQAA1CNQFsGqTAeUs+f3lF3TzuKjFrA
	hcv4gAuvdE69iiUkpclyfQB/EwzEqIOfaaC13ZYPZs+zu2PTtfDAmfYyDL0l6IObUYWLEpfrtHT
	vQu/oR2LzqpDmPyrNXZ7qUmghvUZfyZkX4HVMQpbNfJFDibD+D2dcQPmPcca4CPoA3tXMpCScWm
	BKGh1/qCN/LjOjcVco4tKDsZ9cET41TXc/lpB0ir/YjbjcupfM8koaKxV55V0fNHAYlJMKbcIdw
	5bXfBtSE+DfaaBhLETRD55PQ6hWLS5S2SbwCnE+m2eUfnUMbclV253+VZ91duz3ObAKtRysNb/Y
	JFtrNwZAgsXyWULcUmFMl7hp6t0vSeYQXOioYfz23VU6vWN1S3MK0F3iM+yzNkc8OydTElYP4/4
	Ia0lZq9gcz/49o=
X-Received: by 2002:a05:690c:698a:b0:79a:bf27:fe65 with SMTP id 00721157ae682-7a211944c03mr62480757b3.35.1775088204878;
        Wed, 01 Apr 2026 17:03:24 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e22b926sm4778687b3.5.2026.04.01.17.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:03:23 -0700 (PDT)
Date: Wed, 01 Apr 2026 20:03:22 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Stanislav Fomichev <stfomichev@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, 
 netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 petrm@nvidia.com, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.39df795951b68@gmail.com>
In-Reply-To: <ac2OJvW8ZfzDFtHr@mini-arch>
References: <20260401183309.378671-1-kuba@kernel.org>
 <ac2OJvW8ZfzDFtHr@mini-arch>
Subject: Re: [PATCH net-next] selftests: net: py: color the basics in the
 output
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Stanislav Fomichev wrote:
> On 04/01, Jakub Kicinski wrote:
> > Sometimes it's hard to spot the ok / not ok lines in the output.
> > This is especially true for the GRO tests which retries a lot
> > so there's a wall of non-fatal output printed.
> > 
> > Try to color the crucial lines green / red / yellow when running
> > in a terminal.
> > 
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> > This is a bit of RFC, I'm not super convinced this is worth
> > carrying in the tree? Please Ack/Review I'll apply if we get
> > 3 supporting tags.
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Willem de Bruijn <willemb@google.com>

Minor aside: I don't know exactly how to exhaustively test whether a
terminal supports colors. If unsure, an inverse approach to err on the
side of caution may be safer. But overall +1 on the intent.

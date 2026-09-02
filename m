Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96D148AE39
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350036; cv=none; b=q2QmsNbViSRw7z/N7q8I5TEMPc4qeIwOwSKYdMiamtZlJdzEysS6F1tx7kk6Z8mkNue2rMaJ3q0Mpg//4KUPYNEHcJcLuQPP7tlsCooJasTRiLbHzLILxx/JrKGGBpNS62TKNYnTJBipjD3zjtPgoC2m5Xqhnvi5xikfKIJUGPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350036; c=relaxed/simple;
	bh=kQyWTKL+sEk361d+eKwwxIfLx9+6yokYO0HYcuHWLNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q15MWODUFpsjZ7jQHR+tiLY0sAVqxxY5LWo5H0ELhNrOxHfK5dYe8ysUj9xKpuOTJJcX+uwHX9pwwqNyVfYx+AlMX8Nbo77ebeAgDnOUoJUFcXXc/6KpxDu1sz4dJwJRJNSMpULkCxMP3+2RcC7PRK+Ht/ILKL2fUJXcorL/tvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bns+FcVl; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bns+FcVl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8f265cbe6so8739165ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788349999; x=1788954799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kQyWTKL+sEk361d+eKwwxIfLx9+6yokYO0HYcuHWLNg=;
        b=Bns+FcVl4cBip5L8Ge7Ze2kHDKakek3TNswqeS7JuFoBSX1rkWVDXVv4qz7SzgTfpN
         iW4+12PLYkACGhxO87QyRQ/D/hxqMX/6U2MEsPeaC27H5kkhQjbu6nKeyLORyrDqt9ND
         ci9PEC5Ko7iL2kC5UDIm5fIqYIPUDWUE7Q22VNRHF+4y+j8oTBqIIpJZDLFj9y61j7NU
         99TTcUS3ypk4chghOSCm/Rj4W5LN85hkMbhAPM8lqlPSo0QH6AZy39huyzNh6IavPjN6
         /fcygmcmcRPF5QcOTw1Y2drwXsVvtv8t9sIWD9jsIVlxpv1w9ldyqwEFgaOFDu9hbTX8
         n1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349999; x=1788954799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kQyWTKL+sEk361d+eKwwxIfLx9+6yokYO0HYcuHWLNg=;
        b=qo/IwjCqqX30D+SmemXkvKfvc7LWtPvcavZnECysZFBkHn0iamTZfD7RLdKloI482g
         2PQduyD19eHxjDufab/7Ddu9pcm/GYwpyurwu/5kWaI44FM+EN5EMZCA/AQlJt7XCdMf
         1+aOnDrivU+qo2Xq2X+gOi/St+tmYOnViUi0ATCN+Q/r4rjkxtAqH5axOPQDgY8i79fC
         BX8E5aHy5n5Tq53CYKnIlLGJnkD5yBXqgnY8c50F5VJ6UarAuMdW80QrkXjjMO3mFEYG
         DMnNlN74XwAxdkhtYxQNV22D2ujd+3J/AylZ7SI2KODqsicuIR1II/kZjm83Zv/cLomj
         GcGA==
X-Forwarded-Encrypted: i=1; AKwUvBxgah+o31Rj6WZPch57+lbTXDiZWfyH+eDRte/B4Z3pE9+bI8S/Zzdl65nkGRmZ8pDDr3R74lQWxuBlmbTLt50=@vger.kernel.org
X-Gm-Message-State: AFuF++k+y/aVidy93mTTCBulV3D/Avek+7GO8fXdeE4sATMt05myV723
	fmEDBB/zqmyb2rlh4yJCs2Y9z4uJHaiVoQRNn/k+GEOImfz7k1BNaA0M
X-Gm-Gg: AYBFou09PpjGyv65fdD8K7k4xARt6S71DJX/dwqYs8lz3KybQhYBPQO1UuUmCNhI28m
	G/B62DkWYONIk2RhL/r7aXxiWZYmovR2Mu6n/bXog4EG9HIk0ie2TnOw5e84yHSxzn1TLbVqjWa
	AflHFDU3qLxQuhiWdHHtQePsnQsnmyCpHCNH1lsawZYNK2FZkwB6gKAX5TebTSuuiCx0hUZorzc
	aU7D5G/Z3OidVwoDMXoTc2VrVp/VSbnXsX0hkWXG5mZWfFE1tSNabzZ0WysZtQ2h1K4sutg8OX/
	Sg40wbWsqjGKT3LRN1N8j7dL7Uf9HJONRXm1IVVCS1mVeKYnVYxfXtCvMQwPyrIbfrjiJS0kxBL
	undhgtSXnu8u/1LjLLozWIa7SBY+js9KHyHqSLuo+vgSRT8tMayLOAfwEWCZRpP+6L1EaVky0B7
	0aZEnPqPdV6G0Zu3egH6u4Q6nL/Eyw9AMCPsCBvnOC05HGj8zu2OewY2sO+/sIPcIJChBsecIN7
	Vs=
X-Received: by 2002:a17:90b:17cf:b0:398:d286:344d with SMTP id 98e67ed59e1d1-39aee178e92mr6171529a91.22.1788349999114;
        Wed, 02 Sep 2026 04:53:19 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e9ec9a3sm8352811c88.3.2026.09.02.04.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:53:18 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: kuniyu@google.com
Cc: hangbin.liu@linux.dev,
	liuhangbin@kylinos.cn,
	dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in nl_add_rtattr()
Date: Wed,  2 Sep 2026 11:52:54 +0000
Message-ID: <20260902115254.3544355-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAVpQUDd-HeM4XTufJsBchZq_Lb0in188aawzZUYPjRAGEzZjQ@mail.gmail.com>
References: <CAAVpQUDd-HeM4XTufJsBchZq_Lb0in188aawzZUYPjRAGEzZjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 11:49:46PM +0000, Kuniyuki Iwashima wrote:
> It's not flagged since NULL is passed via nl_add_rtattr(), not directly
> to memcpy().
>
> Also, the behaviour will be well-defined with N3322 in C2y.
>
> Given there is no real harm and we do not bother revisiting this,
> there is no need to change that.

You are right, and thanks for the correction. The NULL is laundered
through the function parameter, so it is not diagnosed at the call site
the way my changelog claimed. Together with N3322 making this
well-defined, I agree there is nothing worth changing here.

Dropping the patch.

Hangbin, thanks for the review as well; sorry for the churn.

Thanks,
Chaithanya

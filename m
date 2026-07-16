Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D342F6FE
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212744; cv=none; b=M3Nq0Yr3DP+WtsTqSPz1ogzjB9UCBuY4/6rExUpKRSWm94RqUvV5yGdDnfGc2FKU4bgwrhX87xVF2vUaILw1H/rTVlw+q1TXbUqNAkzCWZ0FQg1mQAQv1UURB8o8HJeIz8I6yamZduXrDdmjeo3YXVipGOPb1jQYWkjWJupjzAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212744; c=relaxed/simple;
	bh=qsT0+91EEk7IFRz1wumgRWzow/otcNxlxulqB9I2Yv0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rgwN89mc4VpHko7rDLuiPgumxpADnlx9jC74unPvc4ANfUFqCkWPa1PQYOiU+dsl9ZeovP0oWA7C1VGIBbiAQN8m/T2dIuFhcSovZ5DyMEaSTN97QL+r2OFQWrPDYnOIu7SYy4x+TxuKt1Gtt7hIgAdp7F7q1bsC5MhxGHh+TRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEE7fBUE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEE7fBUE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49544f26c43so392455e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212739; x=1784817539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsT0+91EEk7IFRz1wumgRWzow/otcNxlxulqB9I2Yv0=;
        b=pEE7fBUETwTp5JCdmbuXhVGK0pJvBncvCe8G4F2dn4nq2IzpHiWGOrxFHmTj98oZUt
         Yjf8lxO/E60mafmG9VJeo15a7klW0oE1ui7mkbcCL9tPbc0wiPJhKkZb3i0OPWNRtoI1
         H+2NW1hIJDDOV7l1Zc5HekFUh70hf8ejougIZQeJgIwE3fLRw0V6Vhshf1JIIvOBfTx3
         teuqP6lYgktuzh4J83aIyO3XeFG0AZBlFSL5LlwMqDh47aXiHpMjTn3SvuRWKarg+2Z4
         hID/r9hD8TAP1tcy82Pw19rmIRAOBeBhqjeGzLcqEEdEUJVoPihyQl3kIXhFAUFiTTE+
         tQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212739; x=1784817539;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsT0+91EEk7IFRz1wumgRWzow/otcNxlxulqB9I2Yv0=;
        b=FwtBgfdBnXroAGst/GSf61mirbH2rUDrqlB11tRaZnVlXgOoWD+K7tbjisdSWenQ5w
         kgOJhFVKCGJt+qWriKmJNpiQn0sK4yxjUiBE/Sisii0he6WDbPBWNmya3G+3yePsl0qB
         PiXBnziLrMihfGK3yyIZKtDnJptdjJRT58dOu6olb87yYs5N3fBL3uh4yMq1EANIYqZl
         0qOWS8See8xJgjcVzjto4+wzpHfzGUtcENBgykvAYkl5Ow4WX5hryLmcBNrqbeZqM3e4
         /gu4mqZsaGgxhUvqGTxPYPb1m+ejJBXjJhkbde/AH5uWRh6/5crnbs8XhXaOTjrdG3ji
         Wp1w==
X-Forwarded-Encrypted: i=1; AHgh+RqMYrCbem0CYR9kz551tc+GtIfACtsCx/3dgC1N8mqr+dk7B0nr7De5pDe3XTR2S1sjd/RS/2I9B1uzY7GrHss=@vger.kernel.org
X-Gm-Message-State: AOJu0YywTO75dJKQsMyAOKmQggA4w102lDlE91TGrfnaWnfzraHVyvKI
	pp+TqlHbw+/cfHN+pa0Rn91fs1Vv7BxQbrmLDPs3HBjx1+svEh1HfV//
X-Gm-Gg: AfdE7cnPQeuYTUQeFgOzLu7sARY3j+rQDJKbfBs1S9mWHv5W+WtOCw7CLMURi2YzvXg
	8PxKCUrG6kLNsJneF4ncKi43hVcbBD+RTiyY+5xS/lySN21LIqmpHvugvslc5AfXUw+9j7gmiad
	zFTHthsEqUtpnJSPlA5btE2UatudnO28JbRIgnuxYqY3e2F9pPBVavelK66li6G2b58XJ5kC9/+
	iVRLl/jeHKC6mjAJe+LNJ+f3WutBako28aJT1cyLACPtKMSVT3oE0rTMJUw+xcr7iMh6YSueJPo
	sm7pzrQOqUTaN1Vk71bUfhcziHuN7YQItt8OvE24V2pVe8oLAkQp63bwMhwwhcla2Wxjf3RsYMF
	OIoAYSR65YZYJ8DY0NBhoMAjPfzZxzHTXQlv1eb9HtsNDj8dRHRIqIEzNZ0gmECQoewTq4xJ/d+
	q/Cat5aQrFLFzwzXvxRRxuzKF2o6mElZf639na6WF917egPaVc6LVTRL5JnBOG0RQz1BAOn2s3T
	KiPA/zT0Rko9nRow5lWvaRuk79KcQWO1gLDn1SVGwthU0JgY01MEPLgSI57
X-Received: by 2002:a05:600c:34cd:b0:495:4044:11fc with SMTP id 5b1f17b1804b1-49540441311mr33025625e9.7.1784212739282;
        Thu, 16 Jul 2026 07:38:59 -0700 (PDT)
Received: from L-022584.energy.envision.com (dynamic-077-187-169-051.77.187.pool.telefonica.de. [77.187.169.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e9425asm100233605e9.11.2026.07.16.07.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:38:58 -0700 (PDT)
From: Xin Xie <xiexinet@gmail.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, David S. Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Felix Maurer <fmaurer@redhat.com>, Luka Gejak <luka.gejak@linux.dev>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/4] net: hsr: emit RedBox-MAC TLV in PRP
 RedBox supervision frames
In-Reply-To: <178420323080.16062.11665494757602926366.b4-review@b4>
References: <20260706134131.61659-3-xiexinet@gmail.com>
 <178420323080.16062.11665494757602926366.b4-review@b4>
Date: Thu, 16 Jul 2026 14:38:57 +0000
Message-ID: <178421273771.87.2937123145126003737@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thu, 16 Jul 2026 13:59:54 +0200, Fernando Fernandez Mancera wrote:
> The indentation is wrong here, could you keep at the same level it was
> before?

Sure, will restore the original indentation in v4.

Thanks,
Xin

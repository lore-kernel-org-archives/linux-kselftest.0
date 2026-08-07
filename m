Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D18215F42
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 00:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063449; cv=none; b=uv2jw9N4AAvDqm07pXysmsZtmQ/nlbK9wU2H7kh8sRv3NoNLIeTg3BH8PiyoOZ+ulO0wcudSpOco6lN0fPA01a1PsxcU5Ewic5e503L08s/XuxQ0Wfi0C+5upOoDRhVT7oZxeBGz9uY/x6AvrZ0X/+Gc0YlzMvUIJLb9frs3ygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063449; c=relaxed/simple;
	bh=7F0WO47YLDdnH3Bto1WbI3izeTqoMoCzy8FLEzEym8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QOQEIMTXhv5WkBemxXfW3eLEUTZrmA2BSw60eYGCaPeS6OBkFJTftl0S0t8d5FTq/AaSuIjn3qh5HeYDrxGQFu/UJhR7homINSx7MyvY7GmpvsoS1Ynp0DUQECYdxwBuQrnILdWuqoe041iWl6Adcaf+f44B4rbvscZYo8xqLCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tou5L8Q9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tou5L8Q9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84847482584so1165754b3a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 17:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786063447; x=1786668247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjMghYk7h9CcanBnTxm5ojK1G8l4mis4T01GbEO+9sA=;
        b=Tou5L8Q9LUqH2wngf+3gaz1B5QPJ14+Hzw7wCAfp26KmA6GZiOrl0IDH7uT+/pijr9
         BqHplvAPehycnEAxWfn6MEK6Koaq4ICgw+usKABNSdW6RjklEv4HAl0jXQwx5KwELJyc
         uOaYqMHgasJopHSHs1/i5zzCiZ143pXZOoAXW/r6jtAfmezsvpNawa2rmBGFtnKW09YK
         MPnPi2INIuLGK/U/ARSj1UzKmQChMYQCt0eV9fMThgoQOgR5/0JHfJ6pdzMYjMVi1CSa
         xssADrp8VuBJaxDA8XrWPqxg77yL2l08Osu1ujTX1pthluIjpFORAJHOe+QYqSqLTj/c
         uANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786063447; x=1786668247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjMghYk7h9CcanBnTxm5ojK1G8l4mis4T01GbEO+9sA=;
        b=M1zK7lVx2wXGk2wjXEWQViush8P7OKQ+Zz9BmxrmmH01/HyNbQt30ApW1FW8lrgsmK
         9RrpwAwmhJFU/78SzVem2y+e7afAlACcKaZylYBEKk+FVtDHRZ3h/0IABULgV6LAVe3j
         o1EHgpJiwPJ3JTMNd17jHDe6+DXrKFwfis1rn3s0G+KXoBads+sb28xYrOKvW8Ww7xyG
         tiOJAeu4DhKvs58lZ5FfviC2BkloRJdsZQ+/66XxYAuys/+13T8d2cC7lsdP3T163YMi
         nfLJlqXKB/k2srTMxCxiRm5BbyPBYJcCfeY2Ed1l2YKy78mI2pOt5ZHy2JRp+3/m4p0c
         JkVA==
X-Forwarded-Encrypted: i=1; AHgh+RpV6AP1DbPkHxs0XejCFm51CPKNUlGk/c6Pc1zRTE/lhzknHEr9C+82fENa/+zph7sjMmiXcSmOPNP3WTt9Eyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPNNenjzzDCHV/0wOWna72YRbGLEB/vtzzHUjbfUBDrHLg1eur
	XK5U9HjtLVxGISFfJRsicxF3kNLJpktayAoEAXbGuZ4n6rp526pV3DPf
X-Gm-Gg: AR+sD10F82dSdJ52OSn22nYLze7T+f8LADMQhMEGPqiL8zXed+3rLDaPalahaFKi/Ai
	HcKXgTRgB+hTngRKSAyn0zerXPWjOT9KERTZ963xNdQUiIAD5tLn1wwE1d74FQOuXvXoRQZQF0h
	HZx0qE2m6BwsDKMrikp+UCmmJHyO50Z/PWDUBISQNtQC94EI2MZeHS90K+PbeElAaOU2wwGUxIE
	ChF8vHE8PqolHcuuIsMyIiZI480A4R9ATUVOI29VqfZkkzcml+uV7kyUf3HzcAm6f71mrvTSdpK
	8KZoKFMG2v0E+CHWcsu6JYqzw711Ib7H9vL7qp2FxlJ8wTbWM+rbLo52GP3pp+QZfJ7Q0Ljl+Lr
	sJOa/vvs83Xg5wDVIPoK4GN/tUfX3FNGa77KNCmX2rfftG+bAfNUlRHNZMDyANeohVckI70bpYg
	k8rtUHJkIq+s05pnE57FmYGxSUV8qE3C/9PQbLJa+Tej6kQqkNFlePRfCdkRH6lRkUQ1bPgg671
	9R9/qZNAmdqRp6/
X-Received: by 2002:a05:6a00:1798:b0:84c:2d22:7307 with SMTP id d2e1a72fcca58-84f47dd0acamr7705941b3a.13.1786063447425;
        Thu, 06 Aug 2026 17:44:07 -0700 (PDT)
Received: from patterson.cs.ubc.ca (patterson.cs.ubc.ca. [198.162.52.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a552859sm172922b3a.42.2026.08.06.17.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:44:07 -0700 (PDT)
From: Ning Ding <dingning04@gmail.com>
To: bpf@vger.kernel.org
Cc: memxor@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Ning Ding <dingning04@gmail.com>
Subject: [PATCH bpf-next 0/2] bpf: Compare iterator types during state pruning
Date: Thu,  6 Aug 2026 17:43:18 -0700
Message-ID: <20260807004320.134069-1-dingning04@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Iterator stack slots can be marked MEM_RCU or PTR_UNTRUSTED. The
STACK_ITER check in stacksafe() does not compare this type, so state
pruning can treat these states as equal and prune an unsafe path.

Compare the type and add a test where RCU protection has a gap.

Ning Ding (2):
  bpf: Compare iterator types during state pruning
  selftests/bpf: Test RCU iterator state pruning

 kernel/bpf/states.c                           |  3 ++-
 .../selftests/bpf/progs/iters_task_failure.c  | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.43.0

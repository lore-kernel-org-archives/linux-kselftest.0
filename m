Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BD37700A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 08:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773821313; cv=none; b=OReyPV0JXrc0p2OXj2JT4a1zCtYioWIDkXiRkp6uVoFM8aa+E0VuijK9Xhs1+3zm5mWf4kE09NJw7HOPJeWwq9pJ0222AWPgXkhDYAopCv598X2DMWkz647/6SQ9VZ5IAX2qhmnJCKBFMryVYBS5v7PBD+qpT6GK7nqDmudL4kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773821313; c=relaxed/simple;
	bh=MqJ9ZODeYbEt0R/xkzyrWcY/8t2782x/WwNEhSmtbkQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=S/PUKdy+8a77fHCmXNB9yHBBGduhE7CiY7TH+iq4HdjzjipLUAAF/1j6eBhu0HPnvo35Of0msqaMjEe/sxTf1suQ5UeICASFFiqC68VNtR9xDmWQ1wqny/22ehtfgu/Krvq+3xkXKu3CrOTgT0oR6yxYn9PPQ+j4ZFMu1j0a1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hmazur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o6fEQN37; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hmazur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o6fEQN37"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853b00f9f5so69323725e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 01:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773821310; x=1774426110; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mdYdIRk6feS5LmqJGvOQ7B+0xu4yK3/jsJnsUSbLLIk=;
        b=o6fEQN37pScovNkRKghGHvFr6BB9INpdqsMK6FQUS9yCBDtqjc3cd7hBVbiVcmZi7k
         Z7dsvJQU6vM2VCfAUBkXXO+sN+O86NWYliW+aB4jdmHjUtp2u6A1VDDKubRb1FDUNNT6
         A57TMFvrm0lIcexIjZxxMVLPdmiX+hUCF6VhdR4lNJ4BeZUFKuVRkCPzZdL+kGR1WnqA
         E8gYYDyf24aTq/Zj23IIfpmaV1bun6REPbo0jlLLa2sjMKKVavSmSlDM2BbOvvYEbPuN
         v4aH0ojWWKtvzdHoosNnp/u/HxlDWpj7r4CiQocOW2BE4HknDpdzW9ZOu7kvE1lG445X
         GXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821310; x=1774426110;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdYdIRk6feS5LmqJGvOQ7B+0xu4yK3/jsJnsUSbLLIk=;
        b=nw9mBxnQ968Ur/mZeOfYR5TwuD+qpBeTlIvUO+nzrAdoJK02wrqd9XgNoUSXaVZAy3
         5PSfV57pPQtMbSN3iB1bNTIQxXvlYATZB8QTQOmt6eoH+YJ7Nb2t2EtRSVwjnbpx66uK
         u7brXczgKRtuWbC2Z2shDgYJt8697CfhoQ862S/8+Um1A03/YbzoEYUM7O8z9OobfDvx
         2KfNPCH7f8HR/pjsVEbNqqCvJNwLswbh9neMDq8WR84KYwXFDow9kZbikuTBFiLBzqUc
         guIAlhfVx4A7cv0ULaTKcOvTwb4oSqfR5MiAjycf35TTrSvjmDCErh/xzxGibqanfV0D
         yviw==
X-Forwarded-Encrypted: i=1; AJvYcCWolpU0UDNy2h0gHFMcYM75jy57GKR4IlY2MtagSf73mTKdvvzN8enxDb1tZg26qlR+Zn/m3q0q4eeMWrWfgv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWPsbb74eZJK0W7oW0tFjjXbZ1lytRJK8+m0g8yDqjLBkplP3
	oDMvJTG9Ly+1jaaZcKpwytgpFUUuj890vIy1JHhCB68Rq5Pm0W3iD4+tczjp9ddf9+GouP5M0SP
	rkUXnyA==
X-Received: from wmcx8-n2.prod.google.com ([2002:a05:600c:c1c8:20b0:485:34ec:2b75])
 (user=hmazur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4ed4:b0:485:3c2d:d02b
 with SMTP id 5b1f17b1804b1-486f4444050mr39767575e9.22.1773821310122; Wed, 18
 Mar 2026 01:08:30 -0700 (PDT)
Date: Wed, 18 Mar 2026 08:08:24 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260318080825.3063959-1-hmazur@google.com>
Subject: [PATCH v1 0/1] Make the script complaint with 'sh' shell
From: Hubert Mazur <hmazur@google.com>
To: Shuah Khan <shuah@kernel.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: Slawomir Rosek <srosek@google.com>, Lukasz Majczak <lmajczak@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hubert Mazur <hmazur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm sending a change that modifies the script a bit to make it
compliant with the 'sh' shell. The reason behind it is that the test
cannot be executed on x86 embedded devices without bash. The introduced
changes are:
- /bin/bash -> /bin/sh
- Usage of env $UID changed to command execution $(id -u)
- $FUNCNAME env changed to local variables with function names

I'm aware that the last one may be the most controversial since it is
not the most elegant one, though I didn't find any better solution
to retrieve the name of currently executed function in 'sh'.

Please take a look.

Regards,
Hubert

Hubert Mazur (1):
  selftests/cpu-hotplug: Make the script complaint with sh shell

 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


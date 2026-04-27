Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DFA2DCF74
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320446; cv=none; b=ajmFhrBKV+lVJ5zTFg9y4JMCSvgKDbHB+qv7hOHMqERIm+T44iew9VgpD52sjAahwFvpM/E8MKXugbQ3u64MNufn1Y2Sa9eELRCCCha0tecpaLxMH1QtuG2IfErlU1PDUXfOj1D5ZrBK8HXUu0OUL7cA/nXLfB+DTMqtfbVm9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320446; c=relaxed/simple;
	bh=osTiiro3IxZsGeCMwBwBSn5iJ8R0rtUACkCefsd1IEQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R+zKb5az883hp/Pg8RpIfi1KtwOll1N85AsSOxnZVpO7zrqsJIfFXJ0KWBqIo3sKK0zxiJBRURgPXOYmEKOTY/T4AktATyJz/aM7wIacaw1XkvYvgUj3pFqJ5Y9SsHHjWt3CkJpzjchVcIWqXuHm4iGFAA1FraTMGZYVfdjvnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ne92yFc/; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ne92yFc/"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12dba1e866dso4964331c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777320444; x=1777925244; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/yGKMg+XrZNzI5+vLlMmASgwaU/osa+swuiqcWMStY=;
        b=ne92yFc/pta+rLqbURfhBBnzBNqVIfdyiSW6cwCFyLhEqzmXMOeRsM6mxGoUSGTip8
         dBl6W0vX8Ma5Sqb2gjQhOFZ3c5L0uLx4991taOVI/GgLboLCwGd+7QkIXpPN1hskYjcC
         Sd1ifWDo5clx3hE118Y1EBy6FJADgUTUsPjTJXM9SbNy8Tf2Y0ba2So8wGJI8f8oCtI/
         x6l3z9Nnvjsk4Z+SLPT/VazBp/6+MniFXNOMXIMen3VepaCaPI+W7KeBTE03ZreB73Zz
         uUmH3dBkM9/XNn8ovns1WQjN7xa94bLqQJDDb8DnR215nMQPZ/9WZ2PmcT5Z50GVAH6v
         koAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320444; x=1777925244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/yGKMg+XrZNzI5+vLlMmASgwaU/osa+swuiqcWMStY=;
        b=CYrY373DsSsh57mX/PR3c2yMkhtUEUwRFR3SfAPmkIv+VkFx4iRNwVOnVc2aZ1I0eE
         xGO/xKJR1ZMsLD2+qXi+xJhT7WQb7mI4b6gb6R6S0PJb2sSpTyN7Ef5uTn+PNIolqezh
         xV/hBcreRThWydoST1+6sqLOSlgkxNIlpAKWNNyDrAYa+QlOiQLfgqDRxzul42jYmLJX
         N+APsYv3T/EAW/J+aPntbf7K8t026sRz0IU7F7DPpgBUx+oSnR3HU1/7SmGqcXe5z445
         EREmp4zA766qUd4AiaSfP5xI8GgHjm7QwflPoW/mOtRFnPNUBGaZH8MrrT8O3X+ME5yb
         cCKA==
X-Forwarded-Encrypted: i=1; AFNElJ/hfmnrxou9Ov81PAdoapkRDIcaNw1PjguXhavcRhvNnPzOE/pauIYDja1WhxLuUMu4jgZtxRy1JSpThUNnrMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2tnk53R5O8tYY+E65qndB5WpRmTLyaQKFkKWWUAA4bM0Z+bv
	KoRwaXBH/Lo+/KL6L1ymAHp1EQlStybUK33LmKV1OuOe95nPcYGspDxYAsxQwSSG7oECZ1Tovdk
	J+KDZKfxvpqD//+uO716Tj6h8kPFAA6+B/w==
X-Received: from dlbqq3.prod.google.com ([2002:a05:7022:ed03:b0:12c:8db5:2517])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea25:b0:129:1d25:f1da with SMTP id a92af1059eb24-12ddda5975fmr136288c88.3.1777320443972;
 Mon, 27 Apr 2026 13:07:23 -0700 (PDT)
Date: Mon, 27 Apr 2026 20:07:22 +0000
In-Reply-To: <20260415232106.2803644-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415232106.2803644-1-aniketgattani@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260427200722.2745849-1-aniketgattani@google.com>
Subject: Re: [PATCH v2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

Just a gentle ping on this v2. I've addressed the feedback from the previous version. 

Thanks,
Aniket

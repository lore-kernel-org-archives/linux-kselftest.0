Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965173ECBF3
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506594; cv=none; b=P4YWxxprBi+2DOQQJBJ7hoVrk3+rQRv/u5g206eEfuym9eSTeSpJedcGXfu0XtP9zevkuAIKSOQaU8iFjuhWSc+/vMAJYbtJjae1BSYC/UMoY/ATtHSI/Oi4gD00gK0IwZ1tMJ4fP7KjD0tdKO+KE+zc484OqFdFqMztyjCOP9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506594; c=relaxed/simple;
	bh=SZNfq+U9n3x985DbHaankrwq6lQqgPLZMKPvxc9aSu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MquJbRUiGmUl2qeEvT/rGniEi+UthlvhRnZEplQdDqalVPMXyPYViRtCKJ3lJh0G2VXNIJdwNf46fQ+Mm8rp0oFKdysdZBzKzku375ohZiWxUjCEbI0VttwTXORrL+uBzf3+O8N72cVEYHnu/Rg0TNv0JoWGYpVENADk5KKUZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YW7uJepC; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YW7uJepC"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so1772781a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506590; x=1779111390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOFE3ehNiNk6algJYrLucEv0fxL7pkMWqS8jdXvY7Mk=;
        b=YW7uJepC/6HjTt+PnLp5QuhbbRgG2pceJi8Hk9FQksPBk8x6kg4+zs4YZt62yhIyWo
         tJBlOGjY9hin7DEkM5lbwrYMw1uUcIE8Mdw3+T+IpXSDdvUfTjULXatPaUbTx+T4Q6R5
         5UwxCl83uSXipnZVNoddc+Nt8WuMUBqcwhZW6QCUlKYI1H+AhpuGrvd0T3x8Dc1nGa34
         ZMP7aNYkL57URmclP+cpkr/7SKgJPwmbSEYvLGHw66O+hKFzPcWoUxfTMm6hwpHbSd9j
         fW+obcGaaq32x1oQskwKKq0JSAchxiSjN5r090oG1gS/9/KVhhPRqKDioURGlIV16pF9
         I3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506590; x=1779111390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EOFE3ehNiNk6algJYrLucEv0fxL7pkMWqS8jdXvY7Mk=;
        b=h6Br+i67zv0c4zvwKIoeQDowPM/7tH6qBh1NzwE04PvCAiZaH2EXd0DPRERqnRcXvL
         smkSn0VQ0ePYvjzbxiDMRUZWrKy1HTkvN6kICLJT7qzZ5um2CGeFKbQ1w4SQ25Kk79jF
         Q84q52i5fLYgvWnt5E5/8gls9OQ6jLQhGZTzOo1vVEyPXd7B/ECtjV6PFHra2vkys7nn
         PztvpGwCJ915nD7kF0XA91/OeQh3s1n1sERC4qbXxdPtFKHJR5YcwgrRGsHzsCCS+qYl
         rLR9Ihcy0H1PLd6wqRnhVz9Ju0A4X6zW1e8kIXi9Fhm+VV65ZjABU6LiwiK2ad5Mrxr8
         s/Vw==
X-Forwarded-Encrypted: i=1; AFNElJ8jy4ad2N4SRTuRYbI2Mx28OxqM3dX34WwaDUHdQ9wkcnvf1kxFkcYyU0fWI5jO+liA1ThnvuyQB1Gb0xV0O9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBt0rBy5uTGxVlK9pDvSKZR2awBcjXxWVCeDtkr8VfKcNwka9
	d7EluWwDxQSWZ21Z/mkC9ElAAHLRO/BU5X3e+u4dLPAAJk+Du5WGFxXBmoaZpIil01c=
X-Gm-Gg: Acq92OGtYZZVhle1BgXtUi3JJanS+pe068SqCbhoRQXiNIRFiJvbkVLySM2I4JibZLr
	qvS5Gh/pFWrb75mYW3znCQATQfPl/KTvyMMK7HcNb1nI6LvY9Uzxx5VI6dyOoH+7yqe7bfgcFBA
	4bES3JZCEIIURnwYhgigASelTFeJXNJfvzo0qUCT5u0FN8juiHAYg3othfXFAFjd1OWikRcTo/r
	iNBIYvOdviDVBj1GzfR0N+4BWyZjn9pO1UNnue9WSOMk5Zp9opZqcmVus+llJO9Ql6FxkbIZ1Vy
	Ynd/lJT25TTjR/q2f2s3CcLHUVCcGO0gM4Zaxrb2/iMOdqYNgsiAJDN8CXLHeeaFmoGTlTNWbLJ
	Gdpkv45und2Gdn8lJrZOzK4Q5th7kUefZK+hYrM3SEwwXA4oTHtcu6j/XzW99zmbIjm33vIuqZv
	/PPYauQClyNWcLtIEa/k+pPRawCQcRGeo/DF6znuTM7kg=
X-Received: by 2002:a17:90b:38c2:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-367d46c6798mr10065289a91.4.1778506590008;
        Mon, 11 May 2026 06:36:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:29 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:46 -0400
Subject: [PATCH v2 01/10] riscv: hwprobe.rst: Document EXT_ZICFISS
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-1-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS as bit 0 of
RISCV_HWPROBE_KEY_IMA_EXT_1 but did not add a matching entry to
Documentation/arch/riscv/hwprobe.rst.  Add it now.

Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc68..b1a84ac06da75 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -391,3 +391,7 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+       as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+       extensions specification, ratified 2024-07.

-- 
2.43.0


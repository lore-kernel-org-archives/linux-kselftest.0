Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4DC3B9600
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323504; cv=none; b=KdlXs0vEmCnBDBNuwfAiT3ZdYHL3glwC3GrjURpU9MQKn1EbLOb/rkkzpKJ+qjf20RgE7GXN65fDIMUtn9gvNkTOayaM3SBc3alKDPeyWhWTCaI3cEeG0t2sqIJCG8UDpEk3roymKdE0VfYZ1Cb8XACES9moMx3T5lbkBK7ipW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323504; c=relaxed/simple;
	bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlJQnn+nbE7cBcQmg67gli4dH6CdGeqekRk4K4BDWxFpeZLtq4POy0mejvb8DPyXgTL6/WnReGlxFsaq0YVcJM1V4FvvwHfe9odsV+Yl1tTDmkS1/TgmujaudVSlW4/hjBouNr3usbeM9Ah60A7s18Fwm08mtx4lrMYyxJA6aLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahzTl8Jt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahzTl8Jt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so16866105ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780323502; x=1780928302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=ahzTl8JtnOtAGdwVfWPYnEz4Y7keBb60tTuXNBGU/m6nVYPY5TaEnehVmvv9LQZCYq
         PbaOC2oVwIK3vpVGf9fli1FRakJlZGp+sOAEjvqzN0IzWp/aHOvgRC+WuBrrR1u39g4Z
         ah5N8u9sqRMtIKsvR2wKLjiKdFNySmKzqy+iyTWHch9nmlO6ORd0VttdJGSZjYvXt5WW
         nkh3cfGvleHLpmKhVNzFuGKDRGSQNIBZmPlCTR6Ld7sS1oY4WmoYnRzkEgNjFMRIxPB3
         FC4jOxREW5PHMxNEMKAO9nLQXksDRjtnX4xj0VVu+PTwMM3vPWgZc1FFYxh+tpE4XLwX
         p4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323502; x=1780928302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1xQ7RR3f6W2gygq8YRntn2oji9dZ7t4CiasDB970Y0=;
        b=QcwlPwmF3v0ZxLho0XzLl+VWh6s43Wc+Iyx3DZB9x41ZrI70P75ILrFSXHCqyeumow
         I0Zt/aSTSTvhRS7GicWaml2kID2kD1op2G9ZMMhe1hQXJVtSsgiub+Mi5OlQgcjv3ww+
         aSI3sdFh1IX1XFw91VbLD0wQYgol8VnbN75s6EG0JNRXpyX4HcbTqH6+TUL6e1BaQ//J
         x91HL1bIbJcL98ixpTOqEXCHcWFE4ymfe3guPL6xMiAXRLJAbee8C7VkEnT9bEVxQTJI
         sAMOZ3MmDHRJ8mjIpOqPxrtbiPEGk1x7MOr5+zElLryVojYSL9FEp0qqjmnVp/wuS1u8
         UoNg==
X-Forwarded-Encrypted: i=1; AFNElJ8rbKSd+irL6jAMFBls6WlsG3b+iGOUWobaWWmRS1KsgLilKA4bHHukRzv5fuWlwFB3BBcFc8ZHNZOlJMpshNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI4ZMvXSa1dQGWlR0L/8Wozc+vVCcxi5q+QYcDcGV9K4OcqAeJ
	Z8XWUNudE2JXhnsBlEBMh9zb0/NULiKqakPcQ+tg1o02qWdcVYz3dZxH
X-Gm-Gg: Acq92OF8KXvf4Ny8WQHySR9BhGFTSEcVjSY712LedF8JwGHE7a4M7Ql+kbmGxfeDuw3
	KafJzoDQB8Y4nhAL8K6CWod8PWGJYQ5RwjLRfbfk+LrmARuT269/QI0L9yZWkM+8wmJtnvo+KjX
	2Z/dv4BX241OC/ELKC0N9ek74msSeqsuqpLgnvxm57nJJXd8l1lsSRbjDrAo9PygBj1MbpdQic7
	0EYmVA7PV0mTR55eImSanN+XQbRC1yeSVL4vgyzdDNEhGHdZyR20D4e7/ZVnycC+E7DW8SWcnk2
	RT0NBug6wQzPveDfUrMzPOqxPZOLIwc5+CPPoF6X63IaByr61JvyAJzbgDsr3hQxhicU2SYe1Bv
	L773rUZMabvCCjB+vIezF3HHcZkiXyXF7Y0LAiUmEoXP6grg9tW2xHYdYF6TZo5vDtu+NkBdkWB
	BlSDByUm+mPshN74K8/a9FCySWwrVOXDF9tg==
X-Received: by 2002:a17:903:286:b0:2bf:2369:a131 with SMTP id d9443c01a7336-2bf368786bbmr133870415ad.34.1780323502187;
        Mon, 01 Jun 2026 07:18:22 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::40e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm134646855ad.69.2026.06.01.07.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:18:21 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>
Cc: Guodong Xu <docular.xu@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 03/10] riscv: Standardize extension capitalization
Date: Mon,  1 Jun 2026 22:11:50 -0400
Message-ID: <20260602021638.158707-1-docular.xu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com> <20260511-rva23u64-hwprobe-v2-v2-3-21c5a544f1dc@riscstar.com> <CAAhSdy0pHPAMRRR-Mri735zLu3ymr=ePQ7gA6zZ11BkHEXj+AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anup,

> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks for the review.

> @Paul, This patch is independent of other changes
> in this series. If you are okay then I can take this single
> patch through KVM RISC-V tree.

There is a dependency ordering I should point out. Patch 08
("riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection")
uses the upper-case RISCV_ISA_EXT_I/M/A... macros introduced in this patch,
so it won't build without patch 03. I mean, if patch 03 goes into a
different tree on its own.

But of course, I can rebase them onto your tree if patch 03 lands earlier
than the other patches.

Either way should be fine with me, your call.

Thanks,
Guodong Xu
docular.xu@gmail.com

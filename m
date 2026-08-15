Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E221A457
	for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786806138; cv=none; b=W8dRm4qwiLnQqAfELtSW0z6DLAOaixZcoKsY3E0yIih/7TjFXk7yg6mXq4ofGfiTAMvoNUDjCOWXW+Ii6LdwDR5H8dD9sAVYOP6+SY2XE2aYe0mNPCKhXbZGBpFQjgQXryGkKWTgwIQYo9AmnEk+mp2dMxl7PMDHbDYoGVDpgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786806138; c=relaxed/simple;
	bh=EbqUSbxnlQHcRzjEdjJhxWY8yLtgyWwJdG/LIYZkXjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=guLGqBx6+LOqYZtUMYnpMs71ExMEtDzXLcOvsIhrjhwEbzLHWkUeQm5MRbnkz+PKxFlx6LMeA2yfodIBmpYx6k9mNlBybuNDjFMVzNkHa+sgSpZcBy3dthW9lKoL4uqY6RV8grVxRd3mN2TFU0TRzZ8GSCa8r4bGmomLSGgJRT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMmTQKNn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMmTQKNn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so15109535e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 15 Aug 2026 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786806135; x=1787410935; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbqUSbxnlQHcRzjEdjJhxWY8yLtgyWwJdG/LIYZkXjo=;
        b=FMmTQKNnWAAo9foEx1BH3i0WuLk9d9bIgRL/w23G2v/w/nw6T1besVUXxXQZJClerw
         k+Y3JvYGFyaQEsge3oWkxHYHLTjUs0mjxcKUGZY9Dwhu+uPdQ6q+qdj5ymEe+ICpOBxN
         ysKtHZm1lLo9qqEwv6bfguiUpqMJQ1Sb0vlcrMxchvXXRUq9kIO/r/SoPCpaBjf5htVv
         nFtPsPODHRiBbKeVMsFNuAAAc2S2jfM+aaPPyedSXbtnbXsC45CtTCBHYRVsXrX4UR6N
         PbXThyoHxBt2cLOt2J/VtJQvbHKRMLhFbjU3GeQPCxH+QJgFmQYeUFDqU65Pa3ys17xm
         AoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786806135; x=1787410935;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbqUSbxnlQHcRzjEdjJhxWY8yLtgyWwJdG/LIYZkXjo=;
        b=a9sB7SyAciZ52ScN4q5SswOTDMS2YQQybj3LuegUG/fjW57nYv09avAaZhkg5fdivM
         VGPMIEuOF7x2/WikqJTZC96ZMSL33x793v97xzLX98Ok/9uDyDD1FchmgwAop+ksBT3q
         tyayi4At4Mi3Zm9fIaUiI7tpAI2OaT9P6zLRDqco6CArDbOPNsroNNNZLervIhUt2vlu
         yha8s06SVXpJqURFM4LnyxEeR5REGyFnMGBaoZPCLdDrPIQBnZuK8fIBiAZq/vtbPTtT
         TOANyvkqUw6EDuv2ysD0DqFuMOcnXhwDvTUFmuozqj2IIBzN+IopYxhZhdI4GW/Ux8yx
         Pzug==
X-Forwarded-Encrypted: i=1; AHgh+RqpjJSO25QvenR4Psx/JGdS5NVwDfJ85J3coEK2InkQ0MpmKo36gFtrg/6Yj38z56CQ68IaSpCK5LUuJQpe4ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJyYXUvopcVITe6pZFC4Xx8O3JqGLUYVxKc+T1jHrBza9A9Ge7
	yfSwc8MbChiG2/NmBwI9uAhduRDiDsXBJ3scP/XWJMbO2X1W+/lQG7o=
X-Gm-Gg: AR+sD11PakUm9w7nz3LowZfYmuSPo81EHOgfwWsPVo1pWdS02tVFSwSmVLXoewvUP/e
	zg78002DcAVnNjuHIMSXFUP25FvdFqwqFivY9YZx94vSwYUOZK726bH59ZOLNTLMtDlqdXOhXMI
	Y/nRkhqBJLcCM/YNQYSg+ION8q6v21CfB9wk8gcWHnAzznJRQyhGH+qN8P+1ruwCM0zu0+wiyRz
	ma7HwgPg1Co4NdA8C8QcLBHoNLEiNEcC2U9tNc8eXheSSKHKj5szdBoWCCQ6usL9nmgDqABaZcT
	r/rz1AHzReZZeAw2WUmttjS+tjucAZo/mqOY934O0aarfByxOXvA3x9iczlPVqyk8pbwdJwOkAY
	u9pC0hF4Xzb6/0+VFIwjEltJIaglZ2rU+PwR0ExIUpYKxjhfA+O1RzDYODfRk7weAdoLcns0TUO
	E0cT3GNSc25ZTvtpmByWwvcHkjOEyFxszAKs+8M8lx0Qn5QnY7JLmskpFDWhSk
X-Received: by 2002:a05:600c:4f56:b0:499:7312:2d5f with SMTP id 5b1f17b1804b1-4998799eb7dmr203923655e9.19.1786806134927;
        Sat, 15 Aug 2026 08:02:14 -0700 (PDT)
Received: from p183 ([178.172.147.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998fcc1b9esm105402305e9.2.2026.08.15.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 08:02:14 -0700 (PDT)
Date: Sat, 15 Aug 2026 18:06:02 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: joyetamdk@gmail.com
Cc: kees@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	shuah@kernel.org
Subject: Re: [PATCH] selftests/exec: add missing SPDX-License-Identifier tag
Message-ID: <b1a53c0f-98ab-4f40-b295-a7839a5a3a8a@p183>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

> --- a/tools/testing/selftests/exec/recursion-depth.c
> +++ b/tools/testing/selftests/exec/recursion-depth.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: ISC

The license is OpenBSD, not ISC.
https://cvsweb.openbsd.org/checkout/src/share/misc/license.template,v

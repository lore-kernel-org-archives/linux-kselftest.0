Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CBC2750FB
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 02:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773023689; cv=none; b=lFMYe9H7GvrWJhWuOdJjlXGmrsZpNIBMbuY4QLaIDnYCxO1wSiusti6TIqA8HOAk5O4tVKbIvSssqKband3tCz8sJ8EBSrUXtbxeyzLI3CUxb8C1fLawbPeRCffOxWl4vGbR61XXlqxw+Y8MY/pWIkyS/l0Qubb6Axm43Ucrf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773023689; c=relaxed/simple;
	bh=/eGV/1xbIJhwm6XIn7cfQH/SY3x1TXbIwB1K2JCBqls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mg5URuOLa7HbFbzCzsD9lohm8AWoxVMWD6kNs5LnylUrkmJK7q3CBl8Z8LLvcN6tFhZc7bB+u/89pPUqQ5G4yyRaJs3rKhEJD3/3+0A0fsb1CsZo/50Nxfyit8uvr/nEACelUh/2fzEprqxjvlf7dw6/Jk05+ZU7XWiqVu+5fig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlNgRc41; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlNgRc41"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so6636602eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773023687; x=1773628487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEBd1cs2oe7i2LMTBttxBgMKfH6i4xUsDVFq4wSxJlE=;
        b=AlNgRc41hJiiInX17wTb/Tywg+AiCdlCt0VQSHL59Ii4FH+Yx6VO+HmOhinB+E5XFR
         4Mn2Bh5sgtu0Ur3AGts8ERo5WIgVz4LkjN1SrmbxDxBuZhgBvLCJRfZl+ZY9Y/FBeQ/3
         c0JFLma7EYQJRe7lnjhAYMoDZrGmWHuoDazuZPvTyWbT4ACHfJulY2L0FZufWuoIqZ6h
         Tjcc3z61pyh+r8ozHsNJahZivCcC3+/Wr5ndOO7lYEshWIwvse7uAoQuGriiu/e1+7ub
         WorE7Nr/nYaDLDzzu8s6/wns1EZuBfke1N7onND0zmt4uk9uQ09Lyetp8Fmekk/GkAaM
         OWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773023687; x=1773628487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rEBd1cs2oe7i2LMTBttxBgMKfH6i4xUsDVFq4wSxJlE=;
        b=e8m/+JCCwmP3jH0GeVaCGwvKU53jrM0hetlgdM/Q15Y7UMGqv1PUOvUUsliiFGhWJR
         tLijQp8WyAh6tABQJ4++ify737iQOvlrS1WcOnDWPg26MIOlnVHzbdpc7KI8NsCq9v9Z
         0S2w/KM0VOF6eQznK8cyjGhtQ8FtfBTEgpIRgA5FI2C3CPPZhmHrcUs0w1BXavf4VRCp
         xF/Dwr23bN/drkZYdgqD3BepEXF9n6RMbr8LsoFbZYWjAj6wi4j90Yzf6li5WcyX+q7i
         CyxMP6vnMcDV9FeNFpZGB1G4LagIIiykBBSHD8IAPdGbdTgOOmtpybgJgUn4R9rgYR4h
         GL4g==
X-Forwarded-Encrypted: i=1; AJvYcCXa1LcfWMGxPWgLBNKraNKIlp5BQGkDBdyTcJbGeRDlHUFeqUnwZPiCcwy7dAqQEpa4zFCvM+vdaFbZW2R05aU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7btMPUlbwzFJayDEUnf48YU9k6ft2hA8YslQ63mjTtG/ojs/A
	27an/LrPVz/CL8SrX/KFvYOIUFcNVqMRs9nr4L9jrMDICO3tLuDaFarl
X-Gm-Gg: ATEYQzySQvhBaKa4rTKv+K7A04admj51pLdf0uSQBV5GqxxcTh2OiBGB4BMGOgFGlP1
	fJ6avEAd8lT6DspN8KT4pRq52vhuMEzf25EBhc+JrPdMLQndqgckNN8BHLaIAhRpa+3HQeSWs91
	+zpnd6YlTBroFiGHlNWsdHlaMN4skJLreBo6m3q5JOjh6OBAmfBLrdHjkDQR6s4vBkggeZNrLSU
	c24w9euJDfioiJaE2L9D+p4z1IrxxANejilRm5ZF5GGPsXJdh/OIzun1bQ3d2QedX14X1j+WwIF
	6N+h+9URnDfaH/GKyuTZrPE1+rMKOJXbu1C172+MlWz/vqwfA5VAhJNcxVVOhzpXRdLCw326qun
	I0D64Z/jhkGu9lRmHPRM6WdlaMU1myHM7S0xcIqURytrYKmSngIWAd4SOgwNSLvw9LbDTXTZJQV
	GHDqp4yf3nQ28uKanSJ885ZAnRyjWY1QegeCs=
X-Received: by 2002:a05:7301:3d1a:b0:2be:fe8:8aff with SMTP id 5a478bee46e88-2be4e03b3ebmr4076299eec.18.1773023686622;
        Sun, 08 Mar 2026 19:34:46 -0700 (PDT)
Received: from localhost.localdomain ([104.28.165.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm7076193eec.3.2026.03.08.19.34.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Mar 2026 19:34:46 -0700 (PDT)
From: wang lian <lianux.mm@gmail.com>
To: sj@kernel.org
Cc: akpm@linux-foundation.org,
	brendan.higgins@linux.dev,
	damon@lists.linux.dev,
	davidgow@google.com,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH 2/7] mm/damon/tests/core-kunit: add a test for damon_is_last_region()
Date: Mon,  9 Mar 2026 10:34:06 +0800
Message-ID: <20260309023406.9784-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260307195356.203753-3-sj@kernel.org>
References: <20260307195356.203753-3-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> There was a bug [1] in damon_is_last_region().  Add a kunit test to not
> reintroduce the bug.

> [1] https://lore.kernel.org/20260114152049.99727-1-sj@kernel.org/

> Signed-off-by: SeongJae Park <sj@kernel.org>

Hi SeongJae,

I've been following the previous discussion regarding the bug in
damon_is_last_region() where the arguments of list_is_last() were
accidentally swapped.

I have verified this patch by running the KUnit tests on my arm64 native
environment. The damon_test_is_last_region test case passed as expected,
confirming that the fix is robust and the regression is effectively
prevented.

Tested-by: wang lian <lianux.mm@gmail.com>
Reviewed-by: wang lian <lianux.mm@gmail.com>
--
Best Regards,
wang lian

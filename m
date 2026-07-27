Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD1F41BA7C
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167904; cv=none; b=RG/3eLFoKq+GgLUp9586w/Z/OaJ0LW0toAS1XNowWqsxyAIq42bWvJgEEvxyPZf4DtgIU/Mhn2K6J8ZiJl/+gJGIIxsgsNTMAqCupsWTUpugp3P5SiXIaCN/jjeL2Mqz3ePmWn3NK7ckfv5nw4ggrEy5DeVGbgszodxfplj/tBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167904; c=relaxed/simple;
	bh=BX9bwe99deEPi9NdI6Iq20Xhh6lQl753kSnAChLiVCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iJlJs1YGRcayCdenh4lDlS6EwpmwC4MQTcmcubFIi16oFQG2FLZTs61FgokdVJ3qaIWYpAx2XFrnL/FhxF0i5Xol6B6E1E05zeW6RFLom2j+PtZwJ1ivkQJjE9oqHZh9SZMjQCc+9lfoUzLRU8q8YT24hFqGjjDzwlVsqufOqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axx8WdBP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axx8WdBP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485b358552so3028934b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785167902; x=1785772702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX9bwe99deEPi9NdI6Iq20Xhh6lQl753kSnAChLiVCM=;
        b=axx8WdBPMQBNYO3ou4JJzC2dw3+ly2NtkJDHJPvBNjOPukdaBaMnXOiSmP9/g7ZkzA
         DJj/5WnSKRrHHZ6ijy73+XOIgo0XZKy8WjeIV8bLD9Q30FVGvE6YpZBPptD91Ar2GV3N
         yQ9PybahKK0HF7FzEN+ZPYftKr9ke4W8HcFbDXeG9bO7QqzKx+g+sil0z1GFphB5730T
         RgJPWV8HDL+K9d/H+5otXiMtG6u9weLkwZW6i6sNVi+Gfv6xZ+MmhCzhbggnaAVSGxIE
         f5cng3IE+mCYR5TyhsMLKPZxSAoH5TTi7Ap5LYO482aUoOvuWxU3Lo93UBtJ+WtJ5c2Q
         bzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167902; x=1785772702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BX9bwe99deEPi9NdI6Iq20Xhh6lQl753kSnAChLiVCM=;
        b=m9HRwq/4Xjr3VmEBx8fyMGSHD1TNhgh1ycxblv6KFN1wSh1I9Gbwu7tawPcI5SKszx
         Jrtz4JPdZuZ886aj3VoV5riwcAXF2E19uLGVEmOJM7hrVGCiH0mGGTLeflHvQb//bs1T
         XndpNP65TyqDY2kLWlRXmTNP1rPnzCuPCerC0rJJRCjN96l5v4FD5lAc5rP98PDEwhUU
         MnPXWNpoBxjrqSZTYz8a/fITwYQCbRqHlEdJm/gsTg0cDsLFO8kcuUIVLcD0ZD+zOXOp
         C6az9zQPMuHBPDbaJhFYDDexqkLnEQbjFfTJDwRlKjko4Zf9bx9AyfdkjYg2SvV62dKX
         iVIw==
X-Forwarded-Encrypted: i=1; AHgh+Rpqmno0osJtkx/RYspYJkgZlGOGXRDFDsdqKjQ+k4DW5j+W9+xhNjzkBs4b8DfBP3zR4dpaivUEV/ZJ7DWwVfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPNmYHNB9j9mz6v12QVh9PpKucGBVb2iKy2AM/7fDXCiMN6Cu
	mw4n7T61FjV7Os0w4Jad0FutaYTnro0ZAO5w8g37mzIAOkr6VKepdkZQ
X-Gm-Gg: AR+sD13nwrsd24D7ggp4snoL5L4zTDvWFs8gYGl8ikk1cZB79O66Ot5xwCiQn/QJwyc
	g5wg/fEeJmNhGxav29W+NDCKEGc0pujzUr5RARYwwRgM2Oh58mRYInwCs7swdQqlT7UNYS3B7gD
	xTfn2PVC3AvTC6LhSZBbNY3S2bJ0YKzyZZVBHY5g3wELuypF/pb7LslWp+oBfJ/fFb0Upsn2dsd
	k3omTwpEmoPV8MD5swtzIbo6GNqi5lStsz49lyQ9w3sSY2oBiZR/6t4GkNnXxWm0r7s1lTxcvQn
	oycz/mB7D0lKQY/vx49ebzi+HNYTFT6sCWGVNDd5iu7u/XDNivyXnoEDDGsS6bFH0dXDM4l/Ack
	30w/5C6AkLvDV7bNjL3n32pcp63D9GtwaTBVq21ZwTXKcU+NIv9f8TdmbR0JEWajIj4PhGxHTqJ
	/vClvWNm7HknsenkAxAZn8TkdD0ZWrNfJwl9q9BFs679cRIRXgGHjIV0BFVpiLmH1wQZyeFOeq/
	Ox1dP67c7kTRr7V8XAkEcPjMgCLb5CLLO8+vLhmrzKI1E20ldQl0YsBbwrPrw3TYw==
X-Received: by 2002:a05:6a20:a10a:b0:3c3:7ac4:dac7 with SMTP id adf61e73a8af0-3c6c7d8e60fmr199334637.45.1785167902516;
        Mon, 27 Jul 2026 08:58:22 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:8b84:a60e:2cad:e760])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88978600c88.15.2026.07.27.08.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:58:22 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next v3 1/2] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Mon, 27 Jul 2026 21:28:14 +0530
Message-Id: <20260727155814.6454-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720154635.627948f1@kernel.org>
References: <20260720154635.627948f1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Paolo, Jakub,

Thank you for reviewing the series and for your feedback.

We double-checked the formatting tweaks and confirmed they are not
required, so we'll drop them. Any unrelated corrections will be moved
to a separate commit. We'll also fix the commit message indentation.

We'll incorporate the suggested changes and submit a v4 of the kernel
series, along with the corresponding iproute2 changes, shortly.

Thanks,
Hemendra

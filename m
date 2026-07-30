Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF363A380C
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392560; cv=none; b=m3hA+8s57alqJng7qX13oBjcFT3NDNwyN8Yv+Lz2syStwaLdE6La0AWGlZgZK0NnkllHsIO9WF9N7Wk8CRmi6LavNdoZv4LCecQg+QfmdmkfoBEEINj4XiWVV9xhioFsr1AtmdK2twz4qtT1ZZqyY7dYjcPigMO0wVgEd/+BkPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392560; c=relaxed/simple;
	bh=uldTRRVa9c/tCcNOs6iZjqPkfMw464rcNKGkwQnBrQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOgwhKzIsxPYyMbsONcgB9sin3z8qDvL2Y5MG0MZrtKr/ep9/LB16SMHF1wTIsohYFdSYbFANRiDSXUDNTYH4u18fNVS7y5QSQ2yxm/m+m6jMrNKsCKefpjr+f9t6ANpmAg7KdQnn0KB1mEcuRHTCIjqoARfyzFls/nWeHimjb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayi7tEaJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayi7tEaJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso4790055ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 23:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785392556; x=1785997356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uldTRRVa9c/tCcNOs6iZjqPkfMw464rcNKGkwQnBrQE=;
        b=ayi7tEaJqvdzhCc191SwOCF5Q1kpzwL4fZ+SbqgV2xe763oKiAm9yA8DeNEq1MO+h1
         hRWf8A5pxS7EwLz/679gdVInf2eDRl1g16+klNEyB+Ww2mtJ0jPeSaIh4ydN1gvR22+z
         WLe20pbWye44tocCkLOy2Wc5XuF05l6nstM2pNdSVJljH+Duz/BPDlOh7QrvtCvF7DUr
         mwu/+nu7E+x+Mq1hTdHK+bWRDh4NdSnanDC3GX7LrtVmE87z7QDUWjD4TFQe+CgHrym4
         3aDYMloUfnHR0Khcr+DRwirsEsRSttP2moAoNF9/mXQLDvJIqUX6Tsx38oxLYZkjcjMp
         WwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392556; x=1785997356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uldTRRVa9c/tCcNOs6iZjqPkfMw464rcNKGkwQnBrQE=;
        b=IyjKbGAOq6w9SSdSUG5yfNuz9/Ydce5XO1r23t7RbWU8s+f/0VTH8CKDL2XFyTsZ3M
         Qs97QfP7I8fL2RH9Uucic+AzVkleZDagQJJrzjQtMDxJcQjevD5kl7t+QXgdQ9eizb0B
         jmtFwwFkw1KTZZhcwLBgwlgmUSt4yzSr36Iyof/X5JQCoTeWMr3UYgRdY7EwEtf9ZGUP
         5pS/b0+RPAN7Cjg/TgN4mwhna45Uu1NQVIZBXpr73d6wce342w9hEJv4XDms0kDsCmYt
         PXJdOYnai0FUuMp2mriMJZ/ujcozltmoNv7YFkkHt+UQRnYd9+PnpZSBc4Nv+e8GHesl
         MrUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVdrM+GaCfYcietYwLZCUittpck/H6frdrrJdugnkWbz482/jC4Ft6iFXwWxAjfNzWnuYd/09xs34UUKkoDXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6niTNyGaaX4aED8T6Uj9roHWok/RV6as4jCSiB2/bTNQOcBip
	WMNU7r0Jw2BrKKu4Sc1XT1RoBntUNNjOPI0CCpjA+CA/cExT0Nz3XY9Q
X-Gm-Gg: AR+sD12kuAtpx8xKMY7LOHbSDfc2PgWZtN0LIF/v2f8cWyxCXlDhNPDnreNzolShq6M
	LwNUhvu/aTkxWiPeii14P4g3NQ+VWuhURLHccztEoqH4VbjRv2fGR3Yyo13t72lGdghod4LMG+8
	KlaJACpt8lwZJw4erEgFOegTk8UxRrfEs2LiUYy5hUc8MwMkgi+e6tgXnCfzQlrF/MnIMxQ2Fum
	WnWx7gF90IMKH9+cEkeYyZNy6QL/nEO+X4wC22UD/b5Nhx5AEboU0laM5q904mMAP5WZIuz3osR
	ev9k2xQNZTQT1OBhLxPgSf28eoRccTo7J/ZEbRfxK2HcCCN/IMMf9AoAuNAGd5QCBxvsAdHzDxq
	CUokHvW8eTkd6+5+z1Dp0IJR8YeSHckiQrioKe51JRBAqvDyRaXNswMzGjMb0lm3jPwIb39EKRT
	TFMU47EeRahkbRwCM0oW4JDfzWYuEnCHac/Po2Yb7b/QdYWU5pWNUHqHyCL/aCtj3AICnLrhoPn
	O3s
X-Received: by 2002:a17:903:3203:b0:2c9:c517:d08b with SMTP id d9443c01a7336-2d036fb0eb2mr9598885ad.22.1785392556213;
        Wed, 29 Jul 2026 23:22:36 -0700 (PDT)
Received: from apt.tailc82bd0.ts.net ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a468f7sm21149025ad.28.2026.07.29.23.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:22:35 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: hank20010209@gmail.com,
	shuah@kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/zram: fix kernel_gte() for POSIX sh
Date: Thu, 30 Jul 2026 14:22:30 +0800
Message-ID: <20260730062230.11461-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260607095732.71823-1-hank20010209@gmail.com>
References: <20260607095732.71823-1-hank20010209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Shuah,

Is there any further feedback or progress on this patch?

Thanks,
Cheng-Han Wu

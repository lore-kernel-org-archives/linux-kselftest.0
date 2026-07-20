Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C3B449EB1
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570064; cv=none; b=OkkB86eniU4wKxmvD5mnGT7ZsyOICSuDyAfLX2kUAAGEbv3hbegBbxIaLLHkxVoDTqsPmDWFoziBjgyzJK5EP2idvkmUd/VfkJzL5E+daT/aE9x56HbNDMeFs9hwAyZJkSXs4fW3Nueqh52WrrYASfIa8k218yOu1Ijy/OtwxCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570064; c=relaxed/simple;
	bh=QdDo2hPyGr7KyACORnHU+oSr5Gx/Gwvx1tS/f9lpj/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rQs2N0ORX3nQa6sSjAuhHfQkl8dWmvg9/U04oTEguXbfucqFCn/hOJDcQzZpq9IWNexonXwkVKCy7Q8T0eQbtRplb0rSt5KUhCd5PjtzF2tZfqY7oI8ICDXU14JcSSKGhr4a8W7AYBDeV4i/3gg5eGltxn7rUkLsJCpTevu3B6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0u7tpjO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0u7tpjO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so8254725a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784570056; x=1785174856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKvx+e7IPeEaP36bgwUEzZfr9oAgeFFSn833EXmmU/g=;
        b=W0u7tpjOPa8OvzP0iAAhiYDYU+6Ort717IwW4aVXnF3+lBRui+6HWRALdu1VLq0uNm
         uCuT9VfhfasVfiqgiJi/T/8+MFvJ4N9w5D7kFDYLijjURo8czLuBMEJZN15+EZKjVEiG
         lyD2AXU+HJR+K67de32tS3PQzzF3BuxXcVWr+Xs6pGmJcFTrRvZiC79TsRVbUC68ndXr
         ME92jcltOCD41PO7kWMaT+RdUjysSawy+3226JkQXtTz/ELWYOTbVDRJwKnjHOQKKvQ2
         N3ecuZ4KL6gFTnRpucaAsdfuQo2Gzae2BqfXl2QRDC7KBBWOyet+Jl9f0FUsO9e1GAon
         IBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570056; x=1785174856;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TKvx+e7IPeEaP36bgwUEzZfr9oAgeFFSn833EXmmU/g=;
        b=q6TfTpGct0GBCklMnfIWjU/9WCqziW3yyHSQx5QvqID9oH6xoXOnanRhlP2JUUCp1E
         Ve+FVo9ZQsH1pzaWWqx/0ZcPEiiMUIC7w48YGNq4wxitktv2EmgbKpjkOZ455brEqztW
         pEDLldTsxcc3quX6TRV7LUdEsN/WWkLgaRVjRDA2IVzdQddigHiO+NPr9xXtsCeSLjBK
         ITG9Uf338QMZHJR51b/fkKkEoklrmL5sKwvTm0Z6Pb7YPOYJipUIi76zF13igJTf2TaO
         vMUaEH6/2ixLYESKnSgyFkQ/r0/EbfM2dqG3n/Tl18mCiuE7d7rgJFbYWuP+6emVQ+it
         LQWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIwJcS8BLQjeABDMQIl8/m9A75zLYyPsWWIRPmIwVee/CZhqn/aV8bFexujVwlnOX6KpeNRaRmTLw9QjE3i7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbEDJ5SARew6xQHzqNDNfmRjpVUlUPvTyeZlMenyK93SG2gMms
	rlZ8SYHeCU5fg1TRiUSdHcBRFFdzFME8WyZj6JO+j3KFcFO+0GhC9p16
X-Gm-Gg: AR+sD10Wi9pNz8nt99a+7fy42PppT9LIbFfM9n8At35vRB2fasZMhcMhK0wDEl5mZV5
	3+lYq2eY95cCz3dN/7rO8S3xmzrkddh5nuvH7rjd1u2mk/SHcXB310sPNc5VjXiM4eBM2fQrFrX
	5Brx6ZgH7M+dmbU/hcUXeccO78TpQNNo4XchRv8lu7q2abiUEAXVYq+FzIVzCqxTKKkcuMbgG8W
	VXCwyeDRjTuIL0Fiw8m8VkcZwOX6eDA0TrJqNfHjSjjT/w+tCrE+jSsJPUYk+pagrovwOxotfhg
	lj9Ehp/4uwtcgVvQH7aGeveEzvCvJm1mnU2gOvA+zb8xU+PdsbW7RwL4pt5eQ+0kyTFpfAMFL16
	kAi27MD/gpTG+P8gdDVxuJOgzerG/oylqzU1oysQ/9fJ5kKAk0lIh0XQzs4jhcPaLoEbgk7EX
X-Received: by 2002:a17:90b:1c01:b0:381:e74f:8a6a with SMTP id 98e67ed59e1d1-38e4b46c879mr15804943a91.16.1784570056406;
        Mon, 20 Jul 2026 10:54:16 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm33370583c88.15.2026.07.20.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:54:15 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 0/2] ntsync: docs uAPI fixup and timens selftest
Date: Mon, 20 Jul 2026 14:54:00 -0300
Message-ID: <20260720175402.44338-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Short series for ntsync:

1/2 docs: align ioctl macro names and struct field order in
   Documentation/userspace-api/ntsync.rst with include/uapi/linux/ntsync.h,
   and note that absolute MONOTONIC timeouts use the caller's time namespace.

2/2 selftests: add wait_any_monotonic_timens to lock in the timens
   conversion in ntsync_schedule() (negative CLOCK_MONOTONIC offset must
   not make a 100 ms absolute wait return immediately).

No driver code changes.


Iván Ezequiel Rodriguez (2):
  docs: ntsync: align ioctl names and struct layouts with uapi
  selftests: ntsync: test absolute MONOTONIC waits under time namespaces

 Documentation/userspace-api/ntsync.rst        | 33 +++----
 .../testing/selftests/drivers/ntsync/ntsync.c | 87 +++++++++++++++++++
 2 files changed, 104 insertions(+), 16 deletions(-)

-- 
2.43.0


Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB538C414
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781291364; cv=none; b=QGFJ7lfCqeNe4bfzNzEmjv9cyrNoB8A44Z84y7F+bfDQueXQwh2T+lvRJDXcw8Cr4RBmK/YGenVXHBBuelq8eebP6wmkqFWYcTXjx+E8rchup1YfhpNS/IDe89JyU0G1HRSzpWpT+A6dK85Fy0CefGtCohftrE1Pe9l74h3kyuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781291364; c=relaxed/simple;
	bh=yKA+ZzX6XcYhDv+LWR2Mk2bht6hMBJSX9q+2jBi6BiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QbFyMkIKuvc92YMsSkDI6l7jhdjlXQTF9IBL4ShJX9E4kCbNQYPhrH1771T/m1S/laFUbpy9+bea7StTr5aGDxZyM4JewQhJPHjAf6zi2YN9y1YIMpEOj6+G+y0md4CktdEJT0Ufoau2i/B0x8XGN8Rfjk6siG5impVSNzVDfDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxsG7OTA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxsG7OTA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0b9328c4aso11192645ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781291361; x=1781896161; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4L3vRJymTPS0qt6L5cUW7zrlkl0+scsI7rVDfbLQutE=;
        b=DxsG7OTAfEswUiofcEZgU4C6MGzD8OlDzXfOGJAfD+skZOWyZlxsZvHwTOy5qhLJoS
         lni68xIvEl8xAJ1XoGhwb2NWe1n/zwdKDSgXwsuTbSGSt/QSB6jGh5O9NZg1rShQnS2S
         7DN1MSbo5iL3R08TPX3obYlyV+kZ20U3vKqcU7YD5tD4hhEtvW72D1HGleGNNb6M58M5
         sZFzq6P0Rkq380SS7NbI+KQBvrOEgojY3KjXS5vfINOjFBtKcg12IpzYq/BVDcOyhTrF
         Ue6D7U2lqq4hn0wpS55Et64hQ19ZdKWo6JWXMlq785B6La1vu+qil6hkO+lqOLS5HL47
         c8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781291361; x=1781896161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L3vRJymTPS0qt6L5cUW7zrlkl0+scsI7rVDfbLQutE=;
        b=UDCPJV0YWfzTjBU6VYRyEj3LRFMlVbNqTYgMjIf+5DND7W9XOtYEw7Q9YyuQtTjP/i
         agaMUrG4sc7oMId9x6G21aeXULlx4fSFxORd0t06OQJ5pZwXYa87lzUDX2olcUvgO/M6
         uiVFAN/9wMwobIIvRy8HMJBRw3bpfUK6zJ+0qhiPVI6XQofam4xFJeK8+Gg5iJtSB/Qm
         OCaxVH7k/5mIj6oisbTKubPVAtDzm9b2U6OKWRqVUP6qewwqbT8pRCAFLIADZh1ma+et
         W4pcs+TMKkINOkORsq4ad8++kTg+JpngmG5zaU+PM8C8T/Ctkc8SMA5fscREYzh9PQ0X
         vIYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jbTxwzZMOTOX1nWA0TQIjYrHqchI4sNhoJEuITeY4BYQ/LAYGGWQ3pmcAcRapsFWt9Za22+gVYxqREZ5iDLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1wJEqPmHRrkG9IfNNKIxLJoj8eL2Ta/aY25d+55rCu2eNSZB7
	Shz9enEPeVGoduC60IF28mwfIFoVlvNORwGkaAPNPsjwvbTHUSKW0WJ8
X-Gm-Gg: Acq92OGh80tRwkG9jJ3PhiOzjvoaWmim5Z6dSBbgZ400A1t/jUMekwMAYtZJTvkFlvo
	CrSuhWA/svNKS1Eg+vR0NmTKO1+2UCH4QK4YwKIXLjCvJWvnH5wEoFTVKnEoKSRcd2kXegSuSxL
	xOamnfWoEDhC4btIDxjVtWWFoRpRNoS//KmF7tWqXmjMgAwArjLStrecsQR50a0lnnrqcN7Oae6
	EAppx/K94i0/XPk1UM0f6jgG/NuBgBwsF/X5ICBq/scB9peE9uPWHY8MkA6HFJyGs80kCqmyN0P
	BZKXaEMCHQCsrkWNt9c8QTi1WGv8ULImzdtvIsCm9H/GYPiIdrw5+wxDgYeERyi9N61dzVn+FiR
	5fKvdFZv9vqNhyWT9lfI9jzrJlu+t7DbX5hv/UKdMoPTpJ46MQ7U1jWd1Esahuzpx2ztqtTDhcJ
	O7vgkuvvxZ9Lt4LaFHAZ0=
X-Received: by 2002:a17:902:ce8f:b0:2bf:11ed:3d64 with SMTP id d9443c01a7336-2c411c7997amr52161945ad.18.1781291361424;
        Fri, 12 Jun 2026 12:09:21 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:5a::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a43c9sm27661395ad.41.2026.06.12.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:09:21 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next 0/2] selftests/vsock: improve vng version and
 quirk handling
Date: Fri, 12 Jun 2026 12:08:40 -0700
Message-Id: <20260612-vsock-test-update-v1-0-7d7eeed3ac8f@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADhZLGoC/x3MQQqDMBAF0KsMf+2ABiqYq5QuQvLTBiFKMhVBv
 Huh7wDvQmcr7PByofEovWwVXqZBED+hvqklwQvc6OZxnpwefYurGrvpd0/BqDkGLjlHpofDINg
 bczn/5xOVppWn4XXfP6AnZaFtAAAA
X-Change-ID: 20260612-vsock-test-update-fcae9ffced52
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

As vng has continued updating, there have been two things in our
selftests that have been affected. One is that newer versions always
emit the vng version warning, and two is that we have a workaround that
is not needed in newer versions.

This series just updates the version handling to allow all newer
versions without warning and version-gates the workaround to only those
versions that don't have the commit that fixed the root cause.

Additionally, we add function for comparing major.minor versions which
is used in both patches.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Bobby Eshleman (2):
      selftests/vsock: accept vng 1.33 or >= 1.36
      selftests/vsock: skip vng setsid workaround on >= 1.41

 tools/testing/selftests/vsock/vmtest.sh | 47 +++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 17 deletions(-)
---
base-commit: dfcc2ff12925d99e858eaf539eaa4aaaf81fe2a6
change-id: 20260612-vsock-test-update-fcae9ffced52

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>


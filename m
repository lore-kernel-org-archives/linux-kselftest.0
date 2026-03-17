Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895913624C3
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 22:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785385; cv=none; b=Ly2spIV5q/zSFTqLwkGdtokXAkIhNX9fUdr2OmNy11aEi0Mmfv3Tugz29NbpPGXp6qopl9OelOfcsdOUn6GnLFy+pXxESkzqU9LkvBn6r0LlUpTsyJ7FsqTaxQvgK4lpUt4fqeSMWl6Bdv6HUxSEPSjQ6OmT+U5pRgw5Ln2q8rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785385; c=relaxed/simple;
	bh=ccqpQikEVGKBGw0ltsN2mllZ0nk/M9oUDNdcseB61A4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ukj+An2aZuGH0WCor2hokI87FgBqRsaFydoyDPMHsBd59bQt5JpFcRB8dUYgeoQhFf8S8WpE9KUdm31aJOH0sJgPSEjt8bMe4pcTeF11dm/VphvOnuxx11VxW2cLs7MthJqESL2i6zw9KfvKzxVwROIjZh5+GjBj1yj171OEZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZriffEZ1; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZriffEZ1"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a5fb98316so19599997b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 15:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773785383; x=1774390183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XDkvz71rFjofuSbw40JV4KJk/HAj2618RlBdKEjDpw=;
        b=ZriffEZ1JTumtpp2UjboKELpyeEU9UtZ9fdojxUK3Jn67kMP1DhhOcuW0uGNLZwqFk
         uBdnhqLZiQuaCiIr19ONg5Pe1ghFa0KB/HZC/LuZwM8Pp2FdU7hHx/hDyPOp2XZzvmW4
         Xwx8Ft1IcEmVPZ9dtgUp9Ulx0NrJDIhoi3tnZa6acn1I4O1LlD7il0NTFzlPWehQgkF5
         gLaynyCXpdTkIcGLPohNj6yQuEBieusJdNLLNRvzm6hcuc6w3H28ydHsxpIfC7/w38Z8
         4inv3J3PZipPAsx3/71vhx3FbG16K3lrRcHbZC9/9ytTHzYzgEVdbuXZf/1vLmjrQx4b
         5+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785383; x=1774390183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XDkvz71rFjofuSbw40JV4KJk/HAj2618RlBdKEjDpw=;
        b=pyDva62WwoZGg8zBuSHGmHcCM5fBOICLebjFenNT0hSVMELuNmYvD74C3V/nApcCeo
         vW08/uiiPOFSdqkE44544wFnp6SHLpjOfiA6uTmmk7jDhjl/SC1TEIgpebuXR2ENjL/1
         9imXFEFzw4a9ptpSNLBlCuyp57pIEGPfNfKsczoqXtR7Tl9i9OGE8wZGe8G8onxBVkkQ
         VWQGUd3kNy40mGJ0YFg/1CuDUWqpaNBkt7/eVuaAXRONi5HROPoe7VrUFoRiDtP0x7ya
         bokQWWUd9Aw3O28gKENyUHU6kwtwVoyiYf0LrbG3RLjqxkwJPMMUt0ZQBC6JKOtjD3P5
         n+nw==
X-Forwarded-Encrypted: i=1; AJvYcCVB8gDSCr3k8WK1C9bCOLGOUXhccTjYJZMA49pP3LGySkzHykdkGtDeZEVO9PEy2/z/nUuh0Hq24UgPDftQmB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3GVWbr5Hyi8U8OQFGSLJZ9W2y5q/gcfkumUJYlxZJRlPx4bUp
	FtSbfZbO+YzZZfs5hBNy4fZH3vxRQOkjLbbQDH1gSqx2b40b2ddJHX+z
X-Gm-Gg: ATEYQzzFyinwx76slYfgP9wVR+vtMwvyH535gHfmbZ4F/UxT0HdvNPaE2PQWQFUegJf
	wX0smvu6Mb30UBqVHfpoDuhjykxR/PdH7MQsB/VMzDt/1EPcFALUEOTzLg2TsCLRKPWaCNSS5+j
	drYPBX2BMGHmSauGY1rYpAd7B0aqVXhfBPKCuQafoZilpKFrVJ6yVy5/poikvOBQpGzPgfahTJE
	DtSx4PuUf/u0z8z6vHLSgOOQnqxrqzdsZc5vPt7TLkiLD47gOIOfF8fW7D6ZC78VCne/j1II+AU
	KC4ly6crynDLpITHITTu2rc6ed+Eky/YgcCDMmOdU0xy9IDQ1qZhtyOYSwfPaBaPzZcK2Cdy7F7
	O3emW1BrResVX0BSJ34RF3CYk/O2KXfQrYYFo1UV6C6KygrjqS31XbM7VH1cpG2edKwONUgN9as
	Z5qmFLybqB7EwY7M87VCQUiA==
X-Received: by 2002:a05:690c:6d81:b0:798:4fa4:c6a3 with SMTP id 00721157ae682-79a71dbae09mr11240077b3.62.1773785383515;
        Tue, 17 Mar 2026 15:09:43 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713d1d29sm5642337b3.14.2026.03.17.15.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:09:43 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v2 0/2] selftests/vsock: support nested VM runner
 for vmtest.sh
Date: Tue, 17 Mar 2026 15:09:34 -0700
Message-Id: <20260317-vsock-vmtest-nested-fixes-v2-0-0b3f53b80a0f@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/RuWkC/42NSwrCMBQArxLeuk/yKdVm5T2ki5K82iBNJC+ES
 sndxZ7A9QwzBzDlQAxWHJCpBg4pghW6E+DWOT4JgwcrQEs9SKMMVk7uhXUrxAUjcSGPS9iJcVS
 3xffezOOgoBPwznQCsOIBkX72XmDqBKyBS8qfc1rVyf/oV4USvaRBX3tn1GjuG5X54tIGU2vtC
 5rA4hLLAAAA
X-Change-ID: 20260313-vsock-vmtest-nested-fixes-918fd4d3a961
To: Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

This series fixes a few issues trying to launch vmtest.sh in a nested VM
environment and were discovered when trying to prepare the tests for
netdev CI/CD.

When taken together these patches make vmtest.sh work both on bare metal
and in nested VMs, regardless of the outer VM's user, coincidental path
overlaps, or filesystem settings.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v2:
- Address shellcheck warnings (Paolo)
- Link to v1: https://lore.kernel.org/r/20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com

---
Bobby Eshleman (2):
      selftests/vsock: fix vmtest.sh for read-only nested VM runners
      selftests/vsock: fix vsock_test path shadowing in nested VMs

 tools/testing/selftests/vsock/vmtest.sh | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)
---
base-commit: 8f921f61005450589c0bc1a941a5ddde21d9aed9
change-id: 20260313-vsock-vmtest-nested-fixes-918fd4d3a961

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>


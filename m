Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A454763
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773446451; cv=none; b=VzWtHRe7Ktw6MIc6mxtBfggpaZ36S+Ayd/005TqUPoYItOIhtCltIRKwE/J8E+btcyN0yFb0FWgBw+YjEzQ9OyecSOzFUG1FRWM/mSUf8f86FvPQZDkSziDJ5aAHDIAE+7yzhMMSbpffILrpQQCqlRNirV8Eok+KfcSjdgmVxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773446451; c=relaxed/simple;
	bh=SzNVxez9V7PcAZk5QZpuj9c+Tw1VVy/fO1zY3LpJVPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GGH6eGAakOACr7C5R3oUC8bNnBfJAxk8mYwXsARcejPWPCD9tQ/wnT9DCrsLORlMvAJ0PE5oigXRukv9av15Y63atZAoAVK3dJZdFEkE8/afijwfTCz7k0EKmSp/7as6UCXAdHqpa/iz67faTzizpVzbS4PFD0MI/x/kP6kWdhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QN2vWmB7; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QN2vWmB7"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7987531082aso30283597b3.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 17:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773446449; x=1774051249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNbQtouWXaM1HjP+6LQU3raUMR1ZrEf/jm2QyUp1DKQ=;
        b=QN2vWmB7n3xuS/e1Uh9/uWXSL4iSDvOe272H/UGq/jF62o76DizbTK4/4XvPxuRFe4
         cgdaddZjqW78NeY2hZoWk5oSOZc3BQnYifOv+EmmldtgPFtvpG/Avj4LpAusxHlHva8b
         +8nFU24KdWKPHN3MdnKSgXAF8c0JTA4rSqz3Kf5tgnD6Tn52HTX5M9fomXHgv5TCw/9q
         HOeEblGPxYxG6UegVl1kEhgYXi4TfBYXZHb/fPg/b8G7HJuNk8kxLvjkFe1QcO9XavhW
         TaxWe7SGOQLf7SrPnlAIdy2D/PKHsRsRDho7Ff5G3dumCqmdTgCqLoKHcqpm4lijkzVa
         sqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773446449; x=1774051249;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNbQtouWXaM1HjP+6LQU3raUMR1ZrEf/jm2QyUp1DKQ=;
        b=hF6r7mw/TW4ACCGoVQHHzRe3b0XZhmtrzbrbAZI2iJEhwsSgpcMFiplhPBnF1YpTWu
         9B1VmxXjGnXX8b2R2Xh+fuvk48IVdvVGvF0i9vGlQmw7aPyKAJh41XarfUSW9IByVGYh
         ze890jgiNL3UYEmxGvHVc1yrvhl5vHllh2a5ie4a/aAfe0fO9bXE8LfG1O6blOFicrWq
         7nO34+EtFHOtxlFPD911EVgL8QH1pXSN5Y9wBR5p3k9RZA4u4UYp2An8qv0pz21phbQK
         XHaBapFYO1GXv4Vu+VdpLYsvW0NKmcfQGp7xCCsuaIRJlICXgLr4GJ1eXb3yg4kbS1iI
         viaA==
X-Forwarded-Encrypted: i=1; AJvYcCUflWlayELF0c9bGzFy81GM4MQOK/fakZaVPzz18GmWTT7F6igPweAOfHp55FX0LlJdc+lDU1Hgo7v2on9ArPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdA58r4lvJebcsXHuenKj9GS1kwA/NgnsZ2PPlrx+ar40KVvt0
	WnN2VvYsnBA0bicpJ8jVBaMZIJF4CHBeT+C6k31pmipj6kmhLV+YTnpPvKYZiw==
X-Gm-Gg: ATEYQzwHW8cZVckgNOC/cLU33nz2kAoLDyGWZiuFB6zTFZ2rOrm2dcyzAuGkU6EEYwE
	ETBLpuoEvPNMOMMkT/P19wBvHM3MzSOje4ckmC5ukH/otW97c6jS3ZsdW/RxWfbX6gKKgbrkCRs
	DWeHFgBHI3+SdW2G79xJ3nIccC7Urszi0ydU9WbqByKH8eAHvoGGQANu0Zr8WwNtObUT04MEOeH
	XoeZaCF/zdi2oMG3JJoqgrNT6BHNVBYc8UWX0g/BQtgL8ehvQ0gupRmDmy3Lqz/RZKSX7Igqmgc
	djSaKg/IUkWGerDqjvKO0ih1i3+2xl0BC5aX2SOEZuh+NJg2n9hqqIq1IzWy/2ZVX+QK8xM6vH8
	Z6+aGRmkp+eNvek9lFLW9Y35OIDCMSefAee1lEdTM2FvQqugNYBIdPcEBhV4QR0AltOFuc33hYh
	xtIV2T2F05Zo11hBaENMO4SQStQKBX4nY=
X-Received: by 2002:a05:690c:ec8:b0:796:5a14:87c6 with SMTP id 00721157ae682-79a1c0892b5mr54774307b3.4.1773446449477;
        Fri, 13 Mar 2026 17:00:49 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:7::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7991923673asm55811097b3.21.2026.03.13.17.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:00:49 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next 0/2] selftests/vsock: support nested VM runner for
 vmtest.sh
Date: Fri, 13 Mar 2026 17:00:13 -0700
Message-Id: <20260313-vsock-vmtest-nested-fixes-v1-0-d0e6274c3193@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6ltGkC/x3KQQqDMBAF0KsMf+2AMUVqrlK6EPNtQ2ksmRAE8
 e6lXb93wFgSDUEOFLZkacsI4jrB8pzzg5oigmDoh7H3zmuzbXlpe1da1UyrjLqmnaaTu67xEv0
 8jQ6d4FP4BwS5IfO394r7eX4B8SxAJXUAAAA=
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


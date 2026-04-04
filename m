Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFF83016E3
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Apr 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273040; cv=none; b=T5LfTuh/4g6yNVy6CcqqW/+Vtlj4PGRwANbkLnccgI3lxfXSnZ4WJRZR/zbLWI3Zp4mFNM6JLEYANGeTb+nadg+bNAJT9/fwbeXGnMmGDa7UA8jYdTrMO7qgf9JBwq+3J7TMGAO4US2U5fNyeBiiYH8E3/T99s0VQoacq/5frxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273040; c=relaxed/simple;
	bh=Qa67TNFCcOH4tBu5F084Y1/qAc7QBNf2XwPUgfimvlA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KMT+fVPCRtLSul5bg1pJxEGEJDuO2oRMYZIi7cULcCJXFxm89uo4BUcP6ZYWoJBTFqQMK3jqtKXMvKDff011LjH6YfhuEx53ZmYqK5PGsLXJmvrgGCckVOMX6laiHdsOtxkkKMxolwfhYPOen6epsbNzhTkyvMEhlr57oOr5Ezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=QxGo4Q6I; arc=none smtp.client-ip=209.85.222.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="QxGo4Q6I"
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-8cfc795ca97so206906985a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 20:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1775273037; x=1775877837; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLT8JtQvCSx0sAb011tcnSbwaL8+sDojsYJGa3R1ebY=;
        b=QxGo4Q6IVMsEvW5cIdcsza7dk0hZRQhfKPYEmHB7pwM4nFWEwhLmd3PnE92Hp8fRMc
         wwm/cdtmvKJI+jFa0iwoWkdIuPazkWilRRwN/t3gGaHUgzzv6zMep5kGCRchImHcuFda
         UsTpsutR3SyOpgVpvGeUsKhfxKBgYdAXHTNI0ce9YscB3ucdZTclPbQPELm3aJSkhA7N
         n5EPZU5iBYvuxZ6oymKlB0DWQ5X/nxLDKaI+vCYSmea4G87/3Da2ruVsygAYQ5xm/7ye
         5SWv5JnJKT3M6aaN7eVvInFqO0PNDOfRi5Vh1pgYxvEa3w2ioYw4AVuNvUcMXYfTxJR3
         0j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775273037; x=1775877837;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLT8JtQvCSx0sAb011tcnSbwaL8+sDojsYJGa3R1ebY=;
        b=Cw/NBykAS6rHHx1nbVzkZOlTTwtdcsnSR2HHyjogMl23KNL15qilqebrCpcUGqq4PB
         xbXS1c2yRzvVOqI4z1YZa5GeY+i++iGqbmDjHNtJ+sgG7ULHcvWlIynb95h57IBgoAzb
         91qpPhcA2/tL6IxMx42nKLI5cDhVH1Jf7BepkLnpdd4w7IXbwWOyJTWlrhU4PEB2JHOK
         Cw8McCziDHJ7W6C+9VpaqsXGIV9y+G9hVGE/xd+kUnbOkyCHUlwFjGX0dPuW/Opjjp4K
         22MV+blIyI3xmB6XmapC4xBWtxsESDchhzvC0w8zo66sf1w3VzQTBIC+njOfgiVK8Uki
         FJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47JPR/T+x4gF1qKQqiqfmXZWreyg4t9RZDUlJ8fzL78LvA3V7qxXTcssz3uP72DH2uou2bRlwPn4sZwfV2Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6hWWD2xm5mADTgiF/s6FhBFzP0/6SCukloaj6OtgjJC8EgkX
	Y4d/ehaUz3rGpcD0LPviSH203yvMXXijMYV9bktlLkRk3ykWPmCnxhGIy+7ED22vVq6MN6Thc6K
	VOU2MIdoHMMa9zpkGMZTB5DKZCoz2uqawwb9kLDz72W+g47bHgXak
X-Gm-Gg: AeBDiet5v0TRFwrJB2l9bGY3DYxJkuILnJRMpLPdVJvE9Lk8BeiHx9L4ALqLwD+SdWF
	EgyhdK1bxlwpdSSNfsle8oMwVLu8rI150DmltUFzZGlCG7H+BB+nhaA8X4ggWGI3D/ymuImTzip
	H9S9G4FAjpnR1KbbKX/Dyf1DrZn+/yb94Y0B3yA/OF/ziVMW9fI6c3M73zr8fZR1u+MdfqFSm58
	+zPhfimrppaEc73IVUH+E74kx0rYlGOlowTiBxZWrZyHSt3WxKTUtLNwrGK9NoO37LaOY8YlZXB
	cPnqDDqrnlnGjOalgSMhkcNz42QzXmOlPZuFhi7T3GCZqBGcpfK1/vyTdQifhHAIV4EvUFfa8EG
	1Fo57PwF0VrMaknieLtPsbPkmJKnturNGY9uWuf9k
X-Received: by 2002:ac8:57d5:0:b0:509:3025:ff59 with SMTP id d75a77b69052e-50d629c83femr78341571cf.20.1775273037465;
        Fri, 03 Apr 2026 20:23:57 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-50d4b9939c4sm4583371cf.22.2026.04.03.20.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 20:23:57 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::2c94])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 9CA8734023F;
	Fri,  3 Apr 2026 21:23:55 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id B7001E54F59; Fri,  3 Apr 2026 21:23:55 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Subject: [PATCH 0/2] ublk: fix infinite loop in ublk server teardown
Date: Fri, 03 Apr 2026 21:23:54 -0600
Message-Id: <20260403-cancel-v1-0-86e5a6b3d3af@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEqE0GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNj3eTEvOTUHN2kJLNEQyNLI1Njk2QloOKCotS0zAqwQdGxtbUAilB
 TPFgAAAA=
X-Change-ID: 20260403-cancel-bb6a1292534c
To: Ming Lei <ming.lei@redhat.com>, 
 Caleb Sander Mateos <csander@purestorage.com>, Jens Axboe <axboe@kernel.dk>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

Fix an infinite loop in ublk server teardown which can arise when a ublk
server dies while recovering a device. Also add a test which
demonstrates the problem and verifies the fix.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
Uday Shankar (2):
      ublk: reset per-IO canceled flag on each fetch
      selftests: ublk: test that teardown after incomplete recovery completes

 drivers/block/ublk_drv.c                        | 21 ++++++----
 tools/testing/selftests/ublk/Makefile           |  1 +
 tools/testing/selftests/ublk/fault_inject.c     | 51 +++++++++++++++++++++++--
 tools/testing/selftests/ublk/kublk.c            |  4 ++
 tools/testing/selftests/ublk/kublk.h            |  3 ++
 tools/testing/selftests/ublk/test_generic_17.sh | 35 +++++++++++++++++
 6 files changed, 104 insertions(+), 11 deletions(-)
---
base-commit: cdd71b7feb3674d14c5edd9c133242ddf9a363f2
change-id: 20260403-cancel-bb6a1292534c

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>


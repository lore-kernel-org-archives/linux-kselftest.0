Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8F1F5821
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706561; cv=none; b=KrVTgJmhn886X6+b9YQMfRVAy8MKyMGFzN0k1wnNLig3RaRxYMInnvlTIkj41z90MVrPveLE10ZVDCMriSD3bJE5PjnHJrMAheE0HiOsF8RbXwRLqsY67f3BHR9M7TbEjnzzU/c582WUq/sdi7Db1aXxAPPVWcVkzVyAOuZGuoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706561; c=relaxed/simple;
	bh=iA5K6wx5Rr9WjxZPHv7Hpr52/qinKfyGN3R7ONwAlGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AkA4CY3Fjq7V1/t7TylxoUijcUSy66xnVi2E38OjM70Vm265O+EV6Iwi33PCmWUObHrmWzVT+Vb/8fJZZNZTKSUuC6hsKO450pp7P7LxLShVBm40H3rjWYqzeHMFcIlzxrAOoHP6TCy6F5H5RLy3/qQdVpovSEnh4YwmBr9ifF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpueKVdL; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpueKVdL"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-824c9da9928so1614872b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776706559; x=1777311359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLxu6P32beUmPQD9w7sln6A8YJW6HDO82tuWh3CCTxo=;
        b=CpueKVdLh+PU1LckRfIYtfYga2O+eACkMIuHJvsv1R+ONgZwyxdSfcNj3tIV+r4n40
         tB6yQeTk7eXxRBRe4mHtn2WI5u88pLTnb6kgAVx3qR/T2nQ5NSUgQ0d8wlZfvleqHpNO
         dAOHH9WXk2ivQaJC8WNDXyoLAvVmnrYLpRRr5SouNemETTRc+86PMikwVmJlVEhbBqBl
         iJU6JfWjW0N4df7DZIlztDLqC4zzt5fckm9hpfPwYWK1V4fYRfFYLCJq5eL9liDEvn5P
         QvARzUS2a+wmZgSlhBwMm84lOWTXH5eRfKStzDnrzmaEAkjAR7PAHHZ7hXANnNZ/ISAr
         YzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706559; x=1777311359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLxu6P32beUmPQD9w7sln6A8YJW6HDO82tuWh3CCTxo=;
        b=Qxp2ryOjilWdFyr6OP6WpJNyb89Omvg/jjn0hyxOdX74nLUr02W0tRn4Ocyx6sIFuB
         ONIbpxzOkoMXYZlyeJMtjZIrPqTsUk9TqCB/B9g/UyDGKu1HBQs4F6Ft20snA2eOC/G5
         i3V3j++IKgjXBpkAKWsQEUVV7e/rECkf/ED+GTNkvDl6xeXzKIbmCnz/zkgEMOWAn4Gd
         6WCdqITspjf7DCEt390SmNR33ypkxcPl/yw+fs0WMz3Jnu6kCrjvF1a2DxDseTmCz6np
         vtXhRKGz77ZV4LQbDbjQn+oRL5fsL7DzOE6jvGE+SoiH0U8QJlPedPalPdTmbhWb6LbG
         Z1aQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3bDlRYxoCsxmoAtOFoDwD7LOQcJeVambpSYvldwH3+6IAk9hdFfbNMOuS03QA7z79XzEpnAshe1jFDnTECSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtXCfivoKzll6hgCIxTu5wPfhvkqAMjqrRt49OXEK8ffOK0HR
	jkJUqktBD0S30W/BZMknFADRUVur5aksFjgW7/aoNH8GXT0RKHj7jC0c
X-Gm-Gg: AeBDieuzBBJDVCOuMKR/wJPQ/tHO9Se5ex3S3JCXjONOXXEZ4FTOgOFmOhR3Llk6DVO
	G+Zcj7thz+9Oyut8efYA6jsroXw7mZK00SfCZYQjZ2TLeZVjECLmZaFHCBtUut0lB0nG1VnNriw
	lkebdJOE30gFNaSTu7aPgvRFSopiDY0e6FCRuJVlP91ZBGlb5CcoJ5RBkmgAeIMecDybhGly3dD
	rTsfTH8ha4TasrSXR0rU5EOm8ackr/hL+pcsvphrcGU08PyVI2KOZ2ID/UL+TppqbMQDIekWTzh
	GXM0hEWjPibvfW8QRRj+L2CSKD/wjvxUMS767Oxen5CmeztRVxr6uOd5Ufn1kHEhfYPUAYvUfEL
	fyJCO8e/mEA+yEY9/AjuGdS8XdDy2KdR59G/nAHjLBTV+bExw6t/9fh4xf4J5cp9mcAF9f4gwSn
	uogbiFPSoxAL7hRtT+UCyie1lxrv0dDnkucZCht56kJ7xBmcnqrvk5
X-Received: by 2002:a05:6a00:1bc6:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-82f8c99159emr15003162b3a.33.1776706559520;
        Mon, 20 Apr 2026 10:35:59 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm14120164b3a.45.2026.04.20.10.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:35:59 -0700 (PDT)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH RESEND v3] selftests/futex: Remove static keyword from 'head'
Date: Mon, 20 Apr 2026 23:05:44 +0530
Message-ID: <20260420173544.55288-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

'head' is defined as 'static struct robust_list_head' that stores the
local variable of 'struct lock_struct a' raising the Wdangling-pointer
warning.

robust_list.c: In function ‘child_circular_list’:
robust_list.c:522:24: warning: storing the address of local variable
‘a’ in ‘head.list.next’ [-Wdangling-pointer=]

  522 |         head.list.next = &a.list;
      |         ~~~~~~~~~~~~~~~^~~~~~~~~
robust_list.c:513:28: note: ‘a’ declared here
  513 |         struct lock_struct a, b, c;
      |                            ^
robust_list.c:512:40: note: ‘head’ declared here
  512 |         static struct robust_list_head head;
      |                                        ^~~~

Since 'head' doesn't need static storge duration, removing the static
keyword of it to fix this.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
v3: https://lore.kernel.org/all/20251125051333.17934-1-ankitkhushwaha.linux@gmail.com/
Updated the patch name and msg as suggested by André.

v2: https://lore.kernel.org/all/20251118170907.108832-1-ankitkhushwaha.linux@gmail.com/
Added changes suggested by André.

v1: https://lore.kernel.org/all/20251118162619.50586-1-ankitkhushwaha.linux@gmail.com/
---
 tools/testing/selftests/futex/functional/robust_list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/robust_list.c b/tools/testing/selftests/futex/functional/robust_list.c
index e7d1254e18ca..ef21a7ec9def 100644
--- a/tools/testing/selftests/futex/functional/robust_list.c
+++ b/tools/testing/selftests/futex/functional/robust_list.c
@@ -509,7 +509,7 @@ TEST(test_robust_list_multiple_elements)

 static int child_circular_list(void *arg)
 {
-	static struct robust_list_head head;
+	struct robust_list_head head;
 	struct lock_struct a, b, c;
 	int ret;

--
2.53.0


Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E29D2AE78
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772499643; cv=none; b=I0yDn5F9yV+nbwgHmJkDewQUTjog8rnA1G7W9zF0XOC0DAkfAQAt5fMk0IfabYykuS5SxEtmiy0Fxz18dRSZiZSJwDX1Qbi0g3IRa5EErpsnc7YjZTry+9mQW+nZ3yfOdpJoh16XBH147uIKBQBIuYA8JzL/YHlLMZvzWld8KOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772499643; c=relaxed/simple;
	bh=q5g61Mq+z5tPhBoMmVca7ubhPTjnA7nxuIqm+Fwj0js=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hV/jzUNdI3fk4h/gT03lCTYoNviTJwtSBrCOcFhczTuPBdsnGuy5FKJnDJ3TkA/d1m5fuXc2zNG1k/lK+3A/BjXxs5loyLTGh6702hf7EHk01GLUu/oRGpAzcI0WQCk3BltF2QocLec5ALHOwX4Rp7IqvmQ2IkqdG/+GpBK9Yc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QoYCiBWP; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jordanrichards.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QoYCiBWP"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1270dcd11c1so6735645c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 17:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772499641; x=1773104441; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zm1LTC1JWmja4CORTzDR8ARPE6yG1MLArG1qV/pvpmI=;
        b=QoYCiBWPsxYW4SDyHvhSPjX7naLJhOf4oQ0cwumClgX+hSWCcyL0UcwZOxhKdAK0P5
         UVvOM6Y84t4W4rbP0336f+sqqLNfsHwcJqjxeWB+RwIliCdb0N2oh+8LxAbQGTQNVckJ
         FHu2fsKfmaTqd36iIqWkDhhLiVmymTJGZwNA/w8QI6k0TfS+Ebulqg/LyAOZx1RxD7+8
         JzsOrSYmg6Q14KKChkGEPHluDHaatKy2VOZBs2vDNBdZ3pde8dYk3gNlFCltz7J0Csi0
         FLgywZ9P5eOLqCRIJ+SGLzDkApj2YsUdLFapv95YvzQAOrDY41sMNlXmGn+PplqYI++H
         YILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772499641; x=1773104441;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zm1LTC1JWmja4CORTzDR8ARPE6yG1MLArG1qV/pvpmI=;
        b=nypxBj8SH8tCjxzF8FloUrhJpnjAndIf6y12eea9+9mr37o33vhUz/OwQbSIGce7va
         lelwhxE8t4VUJ8s8EG8+o2TyVY1UZN9Mkz9HEc3Ei8OZx1TFlYXSHh6kxykUBKTDdSOP
         QQbjP79f0x1Mv4umcq4DZxmLkkUrw2wooLzZiwxtW4TfKRg7q1tfcD128wYx2HGBpp21
         V60cjL55I/sxad3nxd47qKWlxewWoH8q0yn+yJdpBDBB+tz9BsnMPtadeH6t4+ZPB+WT
         yU6xuQEQoWaoOuJUOH3c7Ay0BIacy9Y/QnbWSG4RlVAtgJbusbYiKCU9EwlZt7izGMbN
         +14w==
X-Forwarded-Encrypted: i=1; AJvYcCWpdfyXk7IWO+yom6CVnRXZUgcuo4Z4dfHxvhlp/ljGqIbl6xXfLWh/B9WuIa6sePdr7/6AT9wrZOb30kxf65c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfxXgKmF1dPOVV2GFWuOSo6+vdbf6wP56toUouvjquMFvN+/w
	e+Al8ChBbwIl91Bvn82VpDv1xv8EFkq5GfvTr04iBg8HMo6sfmrPhSftR+sdhQLYM7LaLsCwkbk
	a3SHWaaGPnlQ5bFxxQ7kJnypoAW2UhWhwOb9R4A==
X-Received: from dlbqc5.prod.google.com ([2002:a05:7023:a85:b0:127:5503:dc9e])
 (user=jordanrichards job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:418c:b0:124:9acd:3c4b with SMTP id a92af1059eb24-1278fd2ad4amr5435794c88.42.1772499640432;
 Mon, 02 Mar 2026 17:00:40 -0800 (PST)
Date: Tue,  3 Mar 2026 01:00:37 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260303010039.2969125-1-jordanrichards@google.com>
Subject: [PATCH v3 0/2] selftests/liveupdate: add end to end test
 infrastructure and scripts
From: Jordan Richards <jordanrichards@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Shuah Khan <shuah@kernel.org>, Willy Tarreau <w@1wt.eu>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <linux@weissschuh.net>
Cc: Jason Miu <jasonmiu@google.com>, David Matlack <dmatlack@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jordan Richards <jordanrichards@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series adds end to end testing infrastructure required to
verify the liveupdate feature, building and running the existing
selftests on supported architectures.

To support executing the selftests as part of an init process, this
patch series also adds ftruncate() to nolibc.

Changelog from v2 [1]:
- Removed unncessary nolibc/sys.h include in luo_test_utils.c
- In ftruncate(), use __NR_ftruncate64 when necessary
- Add ftruncate() test case to selftests/nolibc

[1] https://lore.kernel.org/linux-mm/20260205222329.2419035-1-jordanrichards@google.com/

Jordan Richards (1):
  tools/nolibc: add ftruncate()

Pasha Tatashin (1):
  selftests/liveupdate: add end to end test infrastructure and scripts

 tools/include/nolibc/arch-arm.h               |  11 +
 tools/include/nolibc/arch-mips.h              |  11 +
 tools/include/nolibc/arch-powerpc.h           |  11 +
 tools/include/nolibc/unistd.h                 |  35 +++
 tools/testing/selftests/liveupdate/.gitignore |   1 +
 tools/testing/selftests/liveupdate/config     |   1 +
 .../selftests/liveupdate/config.aarch64       |   2 +
 .../selftests/liveupdate/config.x86_64        |   2 +
 tools/testing/selftests/liveupdate/init.c     | 179 ++++++++++++
 .../testing/selftests/liveupdate/luo_test.sh  | 276 ++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     |  23 +-
 tools/testing/selftests/liveupdate/run.sh     |  63 ++++
 tools/testing/selftests/nolibc/nolibc-test.c  |  51 ++++
 13 files changed, 653 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/liveupdate/config.aarch64
 create mode 100644 tools/testing/selftests/liveupdate/config.x86_64
 create mode 100644 tools/testing/selftests/liveupdate/init.c
 create mode 100755 tools/testing/selftests/liveupdate/luo_test.sh
 create mode 100755 tools/testing/selftests/liveupdate/run.sh


base-commit: c95c8315909f078d16bffa2687346b4c63baf0a1
--
2.53.0.473.g4a7958ca14-goog

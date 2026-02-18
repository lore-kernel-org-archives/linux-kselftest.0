Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035AB2C21D8
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443993; cv=none; b=YmzmuRoLi2I5LEa53PHXYV/lcywEpwm/tK0MZPC+H0CKB+wwqD49wMTML30AABMFnrD1j1orGTTbqMA1QD8kB8ekyGKvjLxVlyjuWHT1qIVFckvMvwNXNg9QonmE0cWSnCf0xT+7o7uOvwIeE2MTy3wrD8aPU+AHd0VSjwFkg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443993; c=relaxed/simple;
	bh=vBUAyAbacjfaRDxMQvWcGcFT+qxiW9zxnAxYnB8luFk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rQ5I6yfuG5/jYP8j77NWi/ksEgTxaW78a/U+3f3K7pzzOGgK0ryLBr0DvQ1GILEJ30cXR9y6bR+YE6U9Jum0mb6MD8351YmaXAJ75eMOCRM774vp0N7FHUwf8zq+xReY0zQ1yYu5HTe55uT1nCh8aFwiswzxxxXf1eH9DOSZ+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sx0OPOIa; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sx0OPOIa"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-896fa834290so2556776d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771443991; x=1772048791; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wD8Ttwe5Tegj8OFrv2Q7m/YBq2wmzpAVQJC0WJWjYy8=;
        b=Sx0OPOIaWKiPVDqmZ6/1nDkemz2/bnRQk+wq71fMB9aSQC+fSWcVVtf51GmyPIPdf8
         Cj5NcF67MXUrcBupt+d4vrMB9sPqM5gP/3E4xpcoiiBIfnBaLfSyAmy3uwH9egfcnov8
         6gwgq9jHhJGfYO4Q5AMnlv7H1ix7sW8q0TvJfh9wxQiR27gCg30oYswyZsb1LJs4Hhka
         XPjzT9taqY47eGOdDl+H3/GijKWX77wrhg6dvuCtwJs/YYZGkq8WH0EAbGPMTjO6Bmts
         624vbkG4YrDOFuapSKKIE58XqumLyYgkuYIEIQOR6nIcLvBkKXpEX8SuhtFfk5QlGXLX
         171Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771443991; x=1772048791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD8Ttwe5Tegj8OFrv2Q7m/YBq2wmzpAVQJC0WJWjYy8=;
        b=nshWVXx/amozf5u3qg9nyx7u+vo29Opff4b68+xinhFn/e2VlX9W56kW7Q6Bb+KfI6
         KhlnTnhardsUn0jNRoXxaDSUhTZAm2EsqXXmGTfz/khDEohXehs281hizwQ843r+yQb/
         P78Kqgx0JWCqPBg9/amAVgkqntY8BRhiXlEoBBswrh91FrxT/n18OzmmFlgj7IqyZCve
         25QHVoWO9O2YLafYJTJdxc9UpPkLokOCmwQOuQG79lLJDw/ztWeNl6jH/gtCoZorvSD4
         HKVSY5XYICO7W2hFLSyXR1LsAiAa/K+D/Iliol6rU8yCIDEq1uTGsar7Ur9+1puFdQZn
         YIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUuIaCFgjseG7ZNDSJSX+6zV/UUILsg4mNOkZYx+mM38efVVHPQKFG0giD1pZBd9qBy941NHV9qIVu5jilahPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiba/HQsqp1Hl2vPv2NO/OYmBCZMXxQXlD4j8ujTfH3IBLEj+
	O/3Q4mzUGqB4u5wg8J0o/1w6TW6yaCFEPHMyBk25DL+qZALxAhEi9A1T/NGHDg==
X-Gm-Gg: AZuq6aIbQn+SYPLDoh+kl/F7rxclaqlo2s6+B9D/l/GNXaIdyd4r/hm26wk+1vmPRiH
	v/cy6/+/g2MsVeP/NYZJjZjkNtXIazmFmY5Vj9yjcW3J5V0C50VHlnB2AyWix1OJ/dKLpM0S6RL
	2YtbRpwWY/BwOu1w7KAVZwJBHfc5LJgHUfM57qTtEIMDGf4GWMxYMnOEvUb4asu8J3/Z4x7iF1X
	/jJ9wJ0dZtlJIY6EMlir3FZsEumFlLOvWzF6xhRrgJ7zpf+lc7wi8pMXLQLFlmvoBycKl7LofAY
	tBYnKenbttZVru2wyGrdP5Tnecjsu4Wv7i6Fzfp68bEvVn97+Y71N4P8YL14eq2wClcQoTNGB5r
	ZPP1zvKO8dgzqf/wNm5DdzX1+xSahgyxaU0sqevWyHEpSKjP1BlXcD7rdmjzrkTiYJRgMJMeLnl
	md9j+TrkkTFkfL0FLYVI/GjQ==
X-Received: by 2002:a53:b118:0:b0:63f:b605:b7f2 with SMTP id 956f58d0204a3-64c557eae43mr2160180d50.10.1771438271298;
        Wed, 18 Feb 2026 10:11:11 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fb1d22sm6051799d50.17.2026.02.18.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:11:11 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net v2 0/3] vsock: add write-once semantics to
 child_ns_mode
Date: Wed, 18 Feb 2026 10:10:35 -0800
Message-Id: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwAlmkC/33NQQqDMBBA0auEWTsliWKjq96juEjjWIdiIklIW
 8S7F3KArj+8f0CiyJRgFAdEKpw4eBiFbgS41fonIc8wCtBS91KrK5YU3At9wnfkTBi8IzSm7eb
 edCSthkbAHmnhT1Xv4CnD1AhYOeUQv/VUVE1/0aJQoVXLo5WLNoMdbhtle3Fhg+k8zx//dlzIu
 gAAAA==
X-Change-ID: 20260217-vsock-ns-write-once-8834d684e0a2
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daan De Meyer <daan.j.demeyer@gmail.com>
X-Mailer: b4 0.14.3

Two administrator processes may race when setting child_ns_mode: one
sets it to "local" and creates a namespace, but another changes it to
"global" in between. The first process ends up with a namespace in the
wrong mode. Make child_ns_mode write-once so that a namespace manager
can set it once, check the value, and be guaranteed it won't change
before creating its namespaces. Writing a different value after the
first write returns -EBUSY.

One patch for the implementation, one for docs, and one for tests.

---
Changes in v2:
- break docs, tests, and implementation into separate patches
- clarify commit message
- only use child_ns_mode, do not add additional child_ns_mode_locked
  variable
- add documentation to Documentation/
- Link to v1: https://lore.kernel.org/r/20260217-vsock-ns-write-once-v1-1-a1fb30f289a9@meta.com

---
Bobby Eshleman (3):
      selftests/vsock: change tests to respect write-once child ns mode
      vsock: lock down child_ns_mode as write-once
      vsock: document write-once behavior of the child_ns_mode sysctl

 Documentation/admin-guide/sysctl/net.rst | 10 ++++++---
 include/net/af_vsock.h                   | 20 +++++++++++++++---
 include/net/netns/vsock.h                |  9 +++++++-
 net/vmw_vsock/af_vsock.c                 | 15 +++++++++-----
 tools/testing/selftests/vsock/vmtest.sh  | 35 +++++++++++++++-----------------
 5 files changed, 58 insertions(+), 31 deletions(-)
---
base-commit: ccd8e87748ad083047d6c8544c5809b7f96cc8df
change-id: 20260217-vsock-ns-write-once-8834d684e0a2

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>


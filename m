Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B99B372B58
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297819; cv=none; b=nKm+IYhv47vfj9IuRppW2/iB4sBAwmVjv/GceMbEM3IwTVBSj0Fr2X15vMoooA5Gw8lMJtWCsvOs1XYgyA5/pzdmXiV/iK2lG+dIo8v6b/1fJF+9l6K1jjVXCLI6IHpAbbaaTFXFVzVTGoOyPP+p8KLtRFAW3u5lIAYX5E693dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297819; c=relaxed/simple;
	bh=SPD46zMf+vaQ0dKfzawI5VFezCApZmoz9FyM0dieZKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sgkDB+6JbaZQ/ZMVDMbHMnk5NTykjCGjyXeR0em7UT6xJFiFBcoJxH/LSwiZkvPu2UZTt1rr6BQG1FGWhViyqwVHEPiKFcNrlzaHb4qcaxUxNlagu5mcGGdwT6anMZmCEK0U0ePvtJJzn9n0tfuq/6NIPiNtm5NmSVeGhw4k6fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43d75312379so4263974f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 10:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779297816; x=1779902616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIvRpJlug7n9+LmRFfk3DPM4edMme0ZuT6gdm05cYBg=;
        b=M3kvzxx1owzyFoNsulNoPcy/kl4vdg3sdg4DZb0DQ6E30YKocSb0eVBls7vnY9rxqZ
         DXO7EwRRIraxYP64NKvHbytRO7ZuQvpcHMfKqAzaqMizQFqynTXqz5ssHquCSHgYpkhI
         zneSu5Ik9YJmdOfZLISIm3obd1XLd5cJeJyJrFshvs2L29QUrk6mv+TDt1aKUBV89CtU
         C9cV5Hatc0z/E+PvSK64C2l5E0RE+ljFdpAHgEndPkXBZLOzZn+tRJK/EB3Z61lzhYmA
         UOQgJ3P1hWWIW3aFy0hY4VwPVHI2Q5Ua+EZ/qWdjBVEutHatXz8pQXXkeHMo36qYk416
         yajw==
X-Forwarded-Encrypted: i=1; AFNElJ/EAgTECTx2wrSHaG/KS1C9ZjNNs5lAxSewswTsNn2EXwYiGPE/ARfj8Rk9u4E2n47LvL8uykgWHAVxwXzYr10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn7xTvQkgjyCtyhZx1hrT2fxp46/NWpeX4pIwKmfNThANnHj3P
	ipdzIN2qbhTv/L6zDYo++8B5MH8z0e2NLd90FNWtSTr+o7208RRdadbT
X-Gm-Gg: Acq92OEbdZQl3+KHXBXh9uQ0TT7HMzIYYHvNsHIloyHiy2bALsC3cvXyD6jmuhl0tYR
	/dCut4519q9SJuCuNVCAUHupA681WNXx8ah20qmAY9EY+Hct/9AOhS1tv5Y3EofCrjiXH6ZUYOF
	0UIDxXZzTQa3RiyWsIoL237vN7hq0zEHOILfrLDZwn5G5ey87eXIPkHHqGq1CYQ58r64kr54X70
	opwOnZs6lhRqle9xviEKut3Ee9lp6vzQAMOR17ylZrHdDy0UlwU1SKF7RhbW8S+Yp3nxrPD6u0Z
	oHurnnWlBx3H5szVM8kvSNcYbJKWedrStRdQ8BypCVkSrGbSP4nWVAcyUxJcpOg/+ghf78xYpnv
	cI5oCE4RosZQj7xxzX+O527cNyRi3RptnHQ3p2JWeCNbRKmgu4ual73Y/mwOO+hluQvJOuABPEZ
	hO6tLzdulRTVhrdi8DsNYlMcPX7KbjdESIZrqQcDwg6PnQ43yYD04xMLWLBhg=
X-Received: by 2002:a05:6000:18a1:b0:43d:78ae:b785 with SMTP id ffacd0b85a97d-45ea0d89f66mr695485f8f.21.1779297815622;
        Wed, 20 May 2026 10:23:35 -0700 (PDT)
Received: from im-t490s.redhat.com (89-24-32-159.nat.epc.tmcz.cz. [89.24.32.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm51125580f8f.26.2026.05.20.10.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 10:23:35 -0700 (PDT)
From: Ilya Maximets <i.maximets@ovn.org>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Kees Cook <kees@kernel.org>,
	Adrian Moreno <amorenoz@redhat.com>,
	Jiri Benc <jbenc@redhat.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matteo Perin <matteo.perin@canonical.com>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH net v2 0/4] netlink: fixes for cross-namespace nsid reporting
Date: Wed, 20 May 2026 19:22:34 +0200
Message-ID: <20260520172317.175168-1-i.maximets@ovn.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on some new features for OVS and OVN we discovered that
self-referential NSIDs get unintentionally allocated in the system as
well as unexpectedly reported for local events on all-nsid listeners.

More details in the patches.  They change user-visible behavior, but
the current behavior is arguably a bug, as it makes it hard to use
all-nsid sockets without a decent amount of extra unrelated work of
tracking when new NSIDs are allocated for your local namespace.

Tests are added to check the expected behavior and YNL is extended to
support all-nsid sockets in the tests.


Version 2:
 - The RTM_GETLINK change is dropped for now as it is not suitable for net.
   A fix would require an opt-in flag.  [Jiri, Nicolas]
 - Added a fix for 'nsid_is_set' flag not being reset between sockets. [Sashiko]
 - Refactored the ynl code:
   * Moved recvmsg call into a separate method. [Jakub]
   * Added doc-string for the ntf_listen_all_nsid. [Jakub]
   * Mentioned it in the Notifications API section.

Version 1:
 - https://lore.kernel.org/netdev/20260515201937.2813983-1-i.maximets@ovn.org/


Ilya Maximets (4):
  net: netlink: fix sending unassigned nsid after assigned one
  net: netlink: don't set nsid on local notifications
  tools: ynl: support listening on all nsids
  selftests: net: add a test case for nsid in all nsid notifications

 net/netlink/af_netlink.c                  | 11 ++--
 tools/net/ynl/pyynl/lib/ynl.py            | 37 ++++++++++++--
 tools/testing/selftests/net/link_netns.py | 61 ++++++++++++++++++++++-
 3 files changed, 99 insertions(+), 10 deletions(-)

-- 
2.53.0


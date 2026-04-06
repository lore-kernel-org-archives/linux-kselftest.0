Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA15EEBA
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 03:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444690; cv=none; b=qXH+hNcCXDgMhreQ1ldBHsYQcI5PxfDeyRSaBrsNxtYMTbMF4FQK7ihhqsmABmMauYUjn2AW3C1/UfOQ8i6Sc4b1W1P2MdemWigJJeh18gyC2KtTTytsJemwkQNuYZRzx/yJv+Kt5RACNuXU5WkLp0P52HsLSzPqnzLykwEfhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444690; c=relaxed/simple;
	bh=os2axCD7KWEJ2zFtPn/3cysdH77SPlIUyOJdroZkBH4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZXe1/hqFH21KgF5ykkFwA3quzcgovfPQQI6Pbr8Enyqw379K6zCw27J/axItN3dZDv3awjlhh5SbyhtCdE0VXohCT4N0B9X/qhikrIWObe1a8dBk+ctkuJlXtvXvGZOU/5prxeX54UgmTlkhZw21Z7J1uGzhZJfC6BuIhGdGD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JOY9PGwL; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--marcharvey.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JOY9PGwL"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12c01e42fe2so11276549c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Apr 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775444688; x=1776049488; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RKvbBGoqDQ/nccvfp7In4m/ADJBo3JF7iAojH/CusVY=;
        b=JOY9PGwLh/QQ6c2K5vwhTgMaN/1l9rXOQ3dKPy0KZuzY6GWry/0Sg5X83pIeFQOvyQ
         pWVTHpNc4XGg5CnNcb6V35NdQSYMZeT1iay5D9FpvXYndZoEnigBRDHWXKZnbJtyGvep
         JndqCWrecLHkTEcd3u+Qnue0nPFtGsQ4eXFKJek+525GuMpUJWAsEoFlg17E7oCy0MPE
         4GwqX+suqVY40CSZEPF0yu5JB4gDpY7jA9w6enWwljdCDtMbaNtWNN+s4WNkYE9jxQ8P
         JIGERL+cgO5f4bm+sodAIHDs50ZpQPu6AZhKl8sO+GpdQGEUUjqULjGKPYH6/WibMU7P
         pEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444688; x=1776049488;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKvbBGoqDQ/nccvfp7In4m/ADJBo3JF7iAojH/CusVY=;
        b=CaCC5DiBRJ9YkQrFmzraYhcHY49JoW2MM7FTP8DTQMUenfaMTg/0WvV/V6nDYs982X
         ICUpvqt7K8Iz8RiK/4+dCtaQZD/TFNaMDdoM+0bdICXBQsN0z5AbhjLUDjk6Y5nIuPI5
         MwPQ6ueRJRZqhMaI3+IlfnVy/T5XvFMV7YFWJF4t++mZcXHbKgLxeQkWXC5NKjk0gT1M
         dBSDbf61ki9I/4+ftMqqvCLJ/0fhU/j6icFQup0Jmc+MKz58rmutsmwdqsy5eKjKQ8bJ
         M2sOMxS3fKpba6Tnpl6f8d3bEOctL7t6W4gSKwPjhA/m/cZYw3GC8ZNFqd8YEPZ34IRZ
         YHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbtF4bjhODzbdSM0dTsoxmJ1QJXTKQGLTRbEGFv8AKKyq4QwXAC3UAcRXVlKO+gTJSd0NawW8klchiwNewMDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzca6hZEKWaoHCTrszG7LrSSXQf9jZQtJdYeFB9p+xzQx8krbhL
	ajetWQ0VTwOBIqFbVpvOjW1FkISDH2ewmx22ODNwawBfKzScIQDFgzaaY86IjI4Y1NRED2Znd/4
	kA/IHx62UOqEYAgiShF3m/A==
X-Received: from dleb5-n1.prod.google.com ([2002:a05:701b:4245:10b0:128:d185:c6ff])
 (user=marcharvey job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:61f:b0:128:cedb:33ba with SMTP id a92af1059eb24-12bfb6f506amr5475335c88.10.1775444687791;
 Sun, 05 Apr 2026 20:04:47 -0700 (PDT)
Date: Mon, 06 Apr 2026 03:03:36 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIgi02kC/4XNwQrCMBAE0F+RnI2ku62tnvwP8dAmm7qgiaQhV
 Er/3dBTRYrHYZg3kxgoMA3ivJtEoMQDe5dDtd8JfW9dT5JNzgIUHFWpChmpfbLrpQmcKEh2kYJ
 rH7JBC1apujTHRuT1K5DlcZGvwlGUjsYobrm58xB9eC+XCZb+r55AKmkbpQs4FTXU3aX3vn/QQ fvngiZcQ7ANYYao0daQxq7S8AOVawi3oTJDBhWCRdQtVF/QPM8fGkdw+1sBAAA=
X-Change-Id: 20260401-teaming-driver-internal-83f2f0074d68
X-Developer-Key: i=marcharvey@google.com; a=ed25519; pk=OzOeciadbfF5Bug/4/hyEAwfrruSY4tn0Q0LocyYUL0=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775444686; l=3844;
 i=marcharvey@google.com; s=20260401; h=from:subject:message-id;
 bh=os2axCD7KWEJ2zFtPn/3cysdH77SPlIUyOJdroZkBH4=; b=6qoJqycbWTs4TwEpZUEsidMSsle0xK00/QUiJRc7vpUPo0GazxeHHdwxIc0C/TS+IwgHrh9tJ
 CVOmgEjSDKyDKddy7eyOUcAcAGVKwC2ARFfGTjsGNCBlLoXiWlPTQ+1
X-Mailer: b4 0.14.3
Message-ID: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com>
Subject: [PATCH net-next v5 00/10] Decouple receive and transmit enablement in
 team driver
From: Marc Harvey <marcharvey@google.com>
To: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Marc Harvey <marcharvey@google.com>
Content-Type: text/plain; charset="utf-8"

Allow independent control over receive and transmit enablement states
for aggregated ports in the team driver.

The motivation is that IEE 802.3ad LACP "independent control" can't
be implemented for the team driver currently. This was added to the
bonding driver in commit 240fd405528b ("bonding: Add independent
control state machine").

This series also has a few patches that add tests to show that the old
coupled enablement still works and that the new decoupled enablement
works as intended (4, 5, and 10).

There are three patches with small fixes as well, with the goal of
making the final decoupling patch clearer (1, 2, and 3).

Signed-off-by: Marc Harvey <marcharvey@google.com>
---
Changes in v5:
- Change teamd activebackup selftest in patch 5 to try graceful teamd
  teardown before using sigkill.
- Make the teamd activebackup selftest in patch 5 delete leftover
  teamd files during teardown.
- Reorder function calls in team_port_enable function in patch 7,
  since the enablement behavior shouldn't change.
- Make selftests use tcpdump instead of checking rx counters.
- Fix minor typos in patch 10.
- Link to v4: https://lore.kernel.org/r/20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com

Changes in v4:
- Split the large v3 patch "net: team: Decouple rx and tx enablement
  in the team driver" into 4 smaller patches.
- Link to v3: https://lore.kernel.org/r/20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com

Changes in v3:
- Patch 5: In test cleanup, kill teamd to fix timeout.
- Link to v2: https://lore.kernel.org/r/20260401-teaming-driver-internal-v2-0-f80c1291727b@google.com

Changes in v2:
- Patch 4 and 5: Fix shellcheck errors and warnings, use iperf3
  instead of netcat+pv, fix dependency checking.
- Patch 7: Fix shellcheck errors and warnings, fix dependency
  checking.
- Link to v1: https://lore.kernel.org/all/20260331053353.2504254-1-marcharvey@google.com/

---
Marc Harvey (10):
      net: team: Annotate reads and writes for mixed lock accessed values
      net: team: Remove unused team_mode_op, port_enabled
      net: team: Rename port_disabled team mode op to port_tx_disabled
      selftests: net: Add tests for failover of team-aggregated ports
      selftests: net: Add test for enablement of ports with teamd
      net: team: Rename enablement functions and struct members to tx
      net: team: Track rx enablement separately from tx enablement
      net: team: Add new rx_enabled team port option
      net: team: Add new tx_enabled team port option
      selftests: net: Add tests for team driver decoupled tx and rx control

 drivers/net/team/team_core.c                       | 237 +++++++++++++++----
 drivers/net/team/team_mode_loadbalance.c           |   8 +-
 drivers/net/team/team_mode_random.c                |   4 +-
 drivers/net/team/team_mode_roundrobin.c            |   2 +-
 include/linux/if_team.h                            |  63 ++++--
 tools/testing/selftests/drivers/net/team/Makefile  |   4 +
 tools/testing/selftests/drivers/net/team/config    |   4 +
 .../drivers/net/team/decoupled_enablement.sh       | 249 ++++++++++++++++++++
 .../testing/selftests/drivers/net/team/options.sh  |  99 +++++++-
 .../testing/selftests/drivers/net/team/team_lib.sh | 172 ++++++++++++++
 .../drivers/net/team/teamd_activebackup.sh         | 251 +++++++++++++++++++++
 .../drivers/net/team/transmit_failover.sh          | 158 +++++++++++++
 tools/testing/selftests/net/forwarding/lib.sh      |   7 +-
 tools/testing/selftests/net/lib.sh                 |  13 ++
 14 files changed, 1199 insertions(+), 72 deletions(-)
---
base-commit: 3741f8fa004bf598cd5032b0ff240984332d6f05
change-id: 20260401-teaming-driver-internal-83f2f0074d68

Best regards,
-- 
Marc Harvey <marcharvey@google.com>


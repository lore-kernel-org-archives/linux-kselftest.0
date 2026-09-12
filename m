Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661913A782D;
	Sat, 12 Sep 2026 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243485; cv=none; b=uoqTlSQY58KLjIfrcGgfm18Dfi/yRSTSEPgi+D6r1VnaiRm7ncvI8T/Dqod0g0vNexmXcF6HxF5pu8omRTaxevK7hNJgxv6n4252rB5HWYVen/LCu/W+g/zPztp/Dc3aP+1iDzBEtwrUs3ZCiqFOSL0n1NVp8jLCrfrp8WOk66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243485; c=relaxed/simple;
	bh=2zxrbLxjDfsvOgOFJKLXqLO0qxQcu+qZp0dGVRDDjkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+6tgOJRx/UYn8BEacbd/Q+pTgjD1xAhVcaC+jUNZTrTeLr3d3CHYGfms9MLVE1EI1vx1gyEAkK2TNmJfv0UWswBqCijrleQjRjn2WGAvEHB0DWNTgxPH1xx0Kfd871b+vNu6lf3ivv0E7VLfqCybKzFGcDlqDWY7jhdn+zumOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyiIAnB8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyiIAnB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2671F00898;
	Sat, 12 Sep 2026 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789243480;
	bh=DuKE8luoVRIZxPq32WsysBA2MsrquFd+/P7wRz2kOVg=;
	h=From:To:Cc:Subject:Date;
	b=ZyiIAnB86ne0BkMXK2Sen43ZLgTnhDb5oQaji14lr4thFsCLb+JNtk1RnUPqRU4vX
	 3Jd65o3QOWyoE4fb/+KZwKuy0K3rU73ypBunkhgQIrQBaq898f4Hsg0vME5Ykow2+x
	 aKTlw6jgqmG3RM8xkLWBCjWsy/YInCHzvk016nrTqTRhzuxdRh4sAUWvcrntUj4wkx
	 ZrUQHx5ZcK37z8i2jAX/e89h9lcz9lG6+nBHIcQ8HiKws9pl2wWHbwGnE1yn1mSDa8
	 YSjzoqiocShA/uVvZR8wAzncBmlPpZbhUOyDZLko6J/52PNI6XfisZehYs6qQJnP1h
	 /gJ0i1oJzk/7g==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	daniel.zahka@gmail.com,
	willemdebruijn.kernel@gmail.com,
	donald.hunter@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 0/6] psp: correct notifications and device info around device assoc
Date: Sat, 12 Sep 2026 13:04:20 -0700
Message-ID: <20260912200426.121025-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We recently added the ability to associate a HW PSP device with
a software device like netkit or veth to be able to make PSP
usable from containers. This stretches the visibility of a PSP
device to multiple netns's.

Correct two minor issues:

[Patch 2] skip reporting the main ifindex in remote netns. I'm not sure
if we had some justification for this but looking back it's pretty
confusing. The ifindex is meaningless in another netns, better
not to have it.

[Patch 4] correct the change notification when net_device is removed.
The "leaving" notification had the removed netdev still listed among
the associated devices. This made the code simpler but really it makes
the notification impossible to interpret. Add the extra code to handle
this right, exclude the removed device, and send a del notification
when last device in a netns is chopped off.

Both of these were discovered by an LLM scan of the YAML spec,
the spec itself appears to not have major bugs.

Jakub Kicinski (6):
  selftests: drv-net: psp: fix linter issues
  psp: don't report the main netdevice's ifindex to associated
    namespaces
  selftests: drv-net: psp: check the ifindex an associated netns sees
  psp: notify about a disassociation once it has happened
  selftests: drv-net: psp: factor out creating a netkit in the test
    netns
  selftests: drv-net: psp: check the PSP disassociation notifications

 Documentation/netlink/specs/psp.yaml       |   2 +
 net/psp/psp.h                              |   1 +
 net/psp/psp_main.c                         |  16 +-
 net/psp/psp_nl.c                           |  51 ++++--
 tools/testing/selftests/drivers/net/psp.py | 180 +++++++++++++++++----
 5 files changed, 207 insertions(+), 43 deletions(-)

-- 
2.55.0


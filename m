Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2283B635C;
	Mon, 31 Aug 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197709; cv=none; b=BRwZYCSXYhtugrSH4pcI40NTO+9AgsgKvo0hWd/HRyMoS4jipGkLPkZCRq3FG6c11nHp2qAWLiGsdflqy5pxP+KgZgRUb8bdNtwLXkukkYMhQRjE8pjDsAY4V5pUltszgkv12AHPCJBkrNE39nRTDh2PFzk2B3syiVzS9fFGSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197709; c=relaxed/simple;
	bh=ZSfTSV94UG89a5dXkx/V0XuOV6jYQwvx0OpQMYNs58M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TAlfI+kEayHoGi0zvOuITu8qA8Ci4wK0rsegurFaJsmFKkSMMgRDpNVy+qQ4yWfzZU7aKUBfzzH1fCqIeZbR8Lvu/qxVZbz6x+gC7uNkZHw0gX/zIVZvLrGJWQ7Cl0mip0kdvBLG1BB+scmJqnXx/QY6pYzkrXRTrI0w3Xkmc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=CrSSgXf7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FHMhvOs7; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="CrSSgXf7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FHMhvOs7"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 44889EC01E9;
	Mon, 31 Aug 2026 13:35:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 31 Aug 2026 13:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1788197707; x=1788284107; bh=B9
	MHRYIq+smi9ATTmQdbFCEBlyvFA4jJ0+a1GYuGMGk=; b=CrSSgXf7S2mJtPpGzc
	FEv16/1l+nkPsUg/rKIJ9oI+mUe+DSY2sByzWACa/VLkEAoZq8NOn94M7/6NIvYo
	ftA8J+hWvzEItTiIO7Uc9lyjgNY0GZl1AKejJGw4TqNLCiJ7A9J87ADj/LPIP4zP
	s2nySSFdvBu1lzVnvMUCjj25b++o3KLmV7Pcy41v6cJPyJDeGCByatDUXZax2B6w
	driciHYrJzzt41lPWhDaBB4Tt2lT6QUHPaqWRfOx6MYKQRUforYzn8FJmQUEBVVa
	5U62SfPfbrFzMs2y1opbqIjuxLQzoN9L3DssTLEshHwjNxuyLzbrqQfOlOz0w7r9
	gL8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1788197707; x=1788284107; bh=B9MHRYIq+smi9ATTmQdbFCEBlyvF
	A4jJ0+a1GYuGMGk=; b=FHMhvOs7H6zMUpah3TU/oKCU844lurYxjcvrRfImZ33c
	TyU4Xkfl8hfqci2j8V6D+adwh7xGqd7C6Qo/lSjjnhWjj7FTiKtadNqxd/4ObCor
	NlB186ZeIfejNHySb/jqCC0U6UlGVt54bCvFTD/tT/ni/2nS4wTyjxD9cH9+sWye
	8ogGMDnHTB9YLfzMiFjzl0Z76W0MryVnjV+cbvf5aOOFJw1gLB5vd/My+t2OkVMv
	iTaRlYPPDcXyv0IbArfv3yP9bf3mbqQ2hZnwJpt32a7uuM1lLhiG0KcS51RVv4FY
	n/XBcp4t4Paz89781lNjGP7NDdQbXy4PuKfc2t4nZA==
X-ME-Sender: <xms:S7uVagHoZgiM9KjuRFKzX5AgA91KjOhFI4AhU0jYtcaKt3YqBnrXEg>
    <xme:S7uVahi_n4nCKzLpK2YZk5O_kFscrD4mcKNbsNmNeDPX0QxraML7PMGOx325_mz9s
    t7nxuXZU2wxIBTGI9GhZL80ZgEBnCXM7NrnGmuxYm9HLAbbeAiuKXI>
X-ME-Received: <xmr:S7uValuvTqJnYGkDA8L6CfLqgST9mxOKLtRZdGSiL3vgSQmcnQpcUBMOMXLKtM3_LxhBIxSPDb0vy_a--GukoUn7OwBMsw>
X-ME-Proxy-Cause: dmFkZTGDnSdqODSSefgmklLUvKwBokqckiggxWYF/fE+h9DYDb7IaeyWQqpcIzTJFdy/Kl
    jfqIaA4SFtngWezaufy+M+2VQay7H2iC3LPAwjZlorh2th3ueLbwmbqo1KA/+AwRGTRIpt
    y0y3jkljtLIYWR3mwWmz5jXEzB2pz145UeJ64B70MKSipuLfWptetAOa03oyiqT+2CJeEl
    Ixsh4TcFh7J5ydbZW4iH+ckpC9TS7MBDV/UIurewEEMBK35pdPs6zNzTbkoGYu3dEWgIWH
    pFo7MTDARcmVrroRgdWM6QeiNApyTNXmYbhbpUxyWV6ndMHjdQqR8Du5gLdVhEP/MA9eKg
    vAxyq8Khjs0fvlU3HeVk/IE//wjK2DmfgCpbCYGvrXofK0+qQK4awW7MnVIETWLjUqDL4V
    l4PvFlgkBbyMSSjBzVbraevaRtBZiEqdYztpyAzT9rzj/DxMtnHbsMySnS7CKDWnNTeLIJ
    1FbNYXLz9wP4x4bLsWYwoA/efZmlF5CtDOdwe17CPmvmmiHUuLDt4abw2vV8suBqX3zWWN
    lQu4NSddZ785uDD39WJcEWNXegTtrEz2zvx3CQt8gEq0BxW7/Va7ULFaPIrl6NEB+65jDG
    BAYs1JmliV5WuMR7H3VT75OVwKSd3cdSccd99YFDt/zgRENWb9X+hxMYv7DA
X-ME-Proxy: <xmx:S7uVasvxaMEA-28Xx6QJu0L9liAhq1ukb_atfrBakqgEYgtYkLMxdA>
    <xmx:S7uVaiGZXYsIIvOrpzlMDbG1zVgeDP_VTJO-2e44PJHpPAKnmjnuQA>
    <xmx:S7uVavOrvi25z5X91kBIbrWMDAaclQe7DXZdgdRUn5kXxIC-1lr9PQ>
    <xmx:S7uVapKjeta5MgFbcpMpTjNw61L4YkaGWT7flgMgvyrUCPDZI1FgfA>
    <xmx:S7uVavsoesvUSoI6Yl8eBp79z1x-2OhBPYKZnGHhmE1lHFVXYFYfRpQb>
Feedback-ID: i80b64ba7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 13:35:06 -0400 (EDT)
From: Juanlu Herrero <juanlu@fastmail.com>
Subject: [PATCH net-next v6 0/6] selftests: net: make iou-zcrx tests
 multithreaded
Date: Mon, 31 Aug 2026 12:34:36 -0500
Message-Id: <20260831-iou-zcrx-v6-0-02d1d012f0fd@fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBQFr1Le2g9pkRi8irho4lO/i1SStISW3
 t2oy2GG2ZCZlBnnbkPiolmn2MAeOoTnGB8UvTXGYAZrXH8SnWZZQ6pCx6PtjRuND2j5O/Gu9be
 6ILJIZC24/k2e/YuhfE/Y9w/7bxlldgAAAA==
X-Change-ID: 20260817-iou-zcrx-e8e46108a0bc
To: dw@davidwei.uk, netdev@vger.kernel.org
Cc: io-uring@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kuba@kernel.org, asml.silence@gmail.com, 
 pabeni@redhat.com, shuah@kernel.org, juanlu@fastmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; i=juanlu@fastmail.com;
 h=from:subject:message-id; bh=ZSfTSV94UG89a5dXkx/V0XuOV6jYQwvx0OpQMYNs58M=;
 b=owGbwMvMwCWW/91SPSt7w03G02pJDFlTd3s2cgqd+ZHbWVzffjtlHce3PwdXTV0iK82fvzTrz
 Jnrp0s/d0xkYRDjYrAUU2TxeCnSojG1ovGuaoQgzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFPdIsXIcL9d8TrrMa/WU2GXrmY9dEytqWFRvMoiP9NJSvfl45UCTYwMT21SCk/
 PmJDWyX/SuSEl9TB/ZkLY1qeLnx1e1nj+z8vvzAA=
X-Developer-Key: i=juanlu@fastmail.com; a=openpgp;
 fpr=48E9148428957881DD2558116FF739276A6BB0D9

This series extends the iou-zcrx selftests to be multithreaded while
preserving existing single-threaded tests.

Patches 1 and 2 are prep fixes/cleanups. Patch 3 refactors the server's
global state. Patches 4 and 5 add the multithreaded client and server.
Finally, patch 6 adds the python side multithreaded test case.

Changes since v5:
- early return in process_recvzc in the oneshot recvs branch (David)

v5: https://lore.kernel.org/all/20260814012348.46958-1-juanlu@fastmail.com/
v4: https://lore.kernel.org/netdev/20260729221825.42773-1-juanlu@fastmail.com/
v3: https://lore.kernel.org/netdev/20260722203950.58550-1-juanlu@fastmail.com/
v2: https://lore.kernel.org/netdev/cover.1776444379.git.juanlu@fastmail.com/
v1: https://lore.kernel.org/netdev/20260408163816.2760-1-juanlu@fastmail.com/

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Juanlu Herrero <juanlu@fastmail.com>
---
Juanlu Herrero (6):
      selftests: net: fix get_refill_ring_size() to use its local variable
      selftests: net: remove unused variable in process_recvzc()
      selftests: net: refactor server state into struct thread_ctx
      selftests: net: add multithread client support to iou-zcrx
      selftests: net: add multithread server support to iou-zcrx
      selftests: net: add rss_multiqueue test variant to iou-zcrx

 tools/testing/selftests/drivers/net/hw/Makefile    |   7 +-
 tools/testing/selftests/drivers/net/hw/iou-zcrx.c  | 407 ++++++++++++++-------
 tools/testing/selftests/drivers/net/hw/iou-zcrx.py |  50 ++-
 3 files changed, 333 insertions(+), 131 deletions(-)
---
base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
change-id: 20260817-iou-zcrx-e8e46108a0bc

Best regards,
--  
Juanlu Herrero <juanlu@fastmail.com>


Received: from mail-yw1-f229.google.com (mail-yw1-f229.google.com [209.85.128.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4BE330321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131624; cv=none; b=tM74qsTimqBW/winUGkvwFubd4SDSUKSFvfDlkzjzMWCz2TE2q/GNy84ewbQrUKrutMNYARc46vTZfjUnWJwlLKzXOFiYncFl++sRXG88nbcjOBCcNdpnlk4MfGZS0Z9U7R4muA0rtzXC2AQ+iqbnTtQSyRREwBfGslGuVTNYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131624; c=relaxed/simple;
	bh=8FWsUKAx0XQu6h00AjRIWTiBlRzwTZCXgH3YD1OhsR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XmEME4UIADreQwKZ70zkpf8vFDotVMWP1CSu0JJY4+VQAYg3wK6YSxGS+AvQA808XhbnTBpRHd3raWdpYs6pmPt919JV1wxiPx9OWv6mEDPDVvioGvpu3Y1vjtovsC42RGpjph++y0J15Ucc91mLHeJ449uLYe5XvsI1dbgsVg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=E8FngZFt; arc=none smtp.client-ip=209.85.128.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="E8FngZFt"
Received: by mail-yw1-f229.google.com with SMTP id 00721157ae682-79495b1aaa7so11016877b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:47:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772131622; x=1772736422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFEviAmcaNb+8G40CA0bDZoCBrqK5bbiSG6l9u+wjCE=;
        b=E+kbOuyB7HX9PZP/QH7vONDuXwIgMQ/5gfBPUeBx5eF3kU7XZfB3fYn8keqkF4FMeI
         lZld5dG1RaaNdtlK9qO9Us+UZybiM8PNwwxP3F21dmT5rUBvfmfGmPiaqkUa89uxfGR6
         p6NRc8ypOJ8PwoNetMBgns40F1u8YKii7rI+0RyJCy8OZ7j+ZmHeKnQLyhZLQ9FQG048
         F2/vxQaTrhcOX0PqfcD96xzKtllVRazbyueFXqflwCAD4ur7qSmDHusYzfIz5BQl7C7A
         4YtHEJUcC2V//x7H5UJk5jFFzNsUBMbZV7nqHEOviFgAjVJYpUHesmN9bZi+RXMJ4iPW
         tmtA==
X-Forwarded-Encrypted: i=1; AJvYcCW6vAjLGnlJ4NhWRqp0y0P6unvBRRPjaaKDmcsogw/5B3ws1EaZxA22puWx45TfrAcWqOarR9tqjP8j6tx1Q1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPs3BIC3axyH5QyuUB0bGX7GRYji9rKIG8xu7sKe74Tylx/XNr
	2ZkyGy3ybpdmzC+Z35hjNkaCmHowg0ZfuUk9/DiTwJaSPdFrqTiZtxZe81dHTgv4J99nAvRpThM
	e68Aqvka7Ig9czpoZoieK13ltxYjq1PM2fZ/ftfVZ1IMNqUy0ExAh6XcAPzpr9KuINsS6FNbQ0S
	aXDnqk5vDnEQwazSW6e5hkLdSpCnAEyP58EwEFKvjvydjOQmUpMA6rUZZsBhJR8yx0J76yewIQJ
	crR6IVQEwcOCptm4ktNfVD0vUE=
X-Gm-Gg: ATEYQzznEPsNsx9u+mE/kf0w9/bWQo69R1INc1ar27+JOGOPjKuuMHJVvCdvkNYLJxG
	MMnYA/FHMT3RUf+KxzGYtbgWGuGd7PF8dSxkk+eFEOAJNIAE/n5biE2eesSd+dTN4WqmHTkQJ6H
	JF8OkRnRa+K0Swk9Hs+CQ1VMy3aZSYN7M+Q2lXRq6ji664X80e1CUvHN5Me9z/REAJA70Es5Kmr
	vz5Ig6FfWN7FIhJZTxamWAJxan37MhYNCjSJ8uH5oyQsPoBTBg5EV4qJ6enDb82K53rIB61ZAGd
	NtG8mFef/cfYDzg1Ccnak059txO/qq61uIjFjs/GYjU86uNBVIjxj+vPKb5LpFNwY4GNpz9cj0N
	nZVAzY4cGWncSZOBfTDOR27TfPncDGESICTvW0LwWzXGUaUlMCqXRUgqjSiGod+wlBSzSSezQND
	GEQsMDjPEDvDUwpH6HiZne2xyDyYfwWIXKno34990+O4iHKvQRmNGVXyTcGQ==
X-Received: by 2002:a05:690c:4d04:b0:796:3f2f:a326 with SMTP id 00721157ae682-7988553baa5mr2141667b3.28.1772131621939;
        Thu, 26 Feb 2026 10:47:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-79876bf33b6sm2955017b3.15.2026.02.26.10.47.01
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Feb 2026 10:47:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4817f3c8so715102085a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 10:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772131621; x=1772736421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFEviAmcaNb+8G40CA0bDZoCBrqK5bbiSG6l9u+wjCE=;
        b=E8FngZFtMMFzbYk5MVNaIDe15eDGfkZr5xXJu/fBWnGbYmlRq92YQP9RnJnDxDJJDM
         5AKuL2OY1jzwLCwciAseF8OJn88Mv14VMSgClrjJgqW3KeGkzVQviAG3MevDi9CqH0gd
         YgDtaVv7GJM6I1ZZHC0lZL7j3qeARpe82OnKQ=
X-Forwarded-Encrypted: i=1; AJvYcCX7Q7DEOQw9/nMR39GgXG7+Dx4ZZ89c+vPDH4xrZtZlPfb3fk8UUf2gBD8r6cs+aMzoTk72GTeOGtSkBA6rWhE=@vger.kernel.org
X-Received: by 2002:a05:620a:4151:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cbc8d8658amr35985a.20.1772131620886;
        Thu, 26 Feb 2026 10:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:4151:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cbc8d8658amr32385a.20.1772131620238;
        Thu, 26 Feb 2026 10:47:00 -0800 (PST)
Received: from lvnvda4076.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f5c41sm255721485a.24.2026.02.26.10.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:46:59 -0800 (PST)
From: Kiran Kella <kiran.kella@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	daniel.zahka@gmail.com,
	willemb@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jayakrishnan.udayavarma@broadcom.com,
	ajit.khaparde@broadcom.com,
	akhilesh.samineni@broadcom.com,
	Kiran Kella <kiran.kella@broadcom.com>
Subject: [net-next, v3 0/2] psp: Support PSP Tx on logical devices like VLAN
Date: Thu, 26 Feb 2026 10:46:52 -0800
Message-ID: <20260226184654.3180648-1-kiran.kella@broadcom.com>
X-Mailer: git-send-email 2.45.4
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch adds support to allow transmit on virtual devices if the
bottom most underlying transport device matches the PSP device associated
with the transmitting application socket.

  python ./psp.py
  TAP version 13
  1..29
  ok 1 psp.data_basic_send_v0_ip4
  ok 2 psp.data_basic_send_v0_ip6
  ok 3 psp.data_basic_send_v1_ip4
  ok 4 psp.data_basic_send_v1_ip6
  ok 5 psp.data_basic_send_v2_ip4
  ok 6 psp.data_basic_send_v2_ip6
  ok 7 psp.data_basic_send_v3_ip4
  ok 8 psp.data_basic_send_v3_ip6
  ok 9 psp.data_mss_adjust_ip4
  ok 10 psp.data_mss_adjust_ip6
  ok 11 psp.dev_list_devices
  ok 12 psp.dev_get_device
  ok 13 psp.dev_get_device_bad
  ok 14 psp.dev_rotate
  ok 15 psp.dev_rotate_spi
  ok 16 psp.assoc_basic
  ok 17 psp.assoc_bad_dev
  ok 18 psp.assoc_sk_only_conn
  ok 19 psp.assoc_sk_only_mismatch
  ok 20 psp.assoc_sk_only_mismatch_tx
  ok 21 psp.assoc_sk_only_unconn
  ok 22 psp.assoc_version_mismatch
  ok 23 psp.assoc_twice
  ok 24 psp.data_send_bad_key
  ok 25 psp.data_send_disconnect
  ok 26 psp.data_stale_key
  ok 27 psp.removal_device_rx
  ok 28 psp.removal_device_bi
  ok 29 psp.vlan_basic_send
  # Totals: pass:29 fail:0 xfail:0 xpass:0 skip:0 error:0
  #
  # Responder logs (0):
  # STDERR:
  # #  Set PSP enable on device 3 to 0xf
  # #  Set PSP enable on device 3 to 0x0

CHANGES:
v3:
  - Enable 8021q module in the net/config for vlan test
  - Guard against a race between psp_netdevice_event and psp_dev_unregister
    by using psp_dev_tryget/put in the linking path to ensure the psp_dev
    is still alive before propagating it to upper devices.

v2: 
  - Simplified the psp_netdevice_event() to return if the upper device is
    bond device.
  - Handle the scenario where the psp_dev_unregister() is invoked by a
    driver before the unregister_netdev() that can result in stale
    psp_dev pointer in the upper devices. 
  - Fix the vlan_basic_send test to run on any lower device and not
    require nsim.

v1: https://lore.kernel.org/all/20260121073517.3323332-1-kiran.kella@broadcom.com/

Kiran Kella (2):
  psp: Support for transmit on logical device when the underlying
    transport device supports PSP.
  selftests: drv-net: psp: add test for VLAN sub-interface

 net/psp/psp_main.c                         | 117 ++++++++++++++++++++-
 tools/testing/selftests/drivers/net/config |   1 +
 tools/testing/selftests/drivers/net/psp.py |  81 +++++++++++++-
 3 files changed, 197 insertions(+), 2 deletions(-)

-- 
2.45.4


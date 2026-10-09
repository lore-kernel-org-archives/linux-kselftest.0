Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74772D7D47
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578817; cv=none; b=fx3T7cP5LruBwwNui6QlUKCPMdl/SldhR1FW278HuNj2sYp4NQJT2+kFjtzeoafI3WSd5H8d8YZF4gqkdCGbANM06fbKIF5vS1uebGL4FfF11urCQ6bb95KkqG5FjHA154KoEcmXVKs9c00gbhNzvNHhzaA03W9k1ACJ5FyQKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578817; c=relaxed/simple;
	bh=OEoYXf594kXH/PufCoCOA5IH4kEFLBjOLJOrYOSsGHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SL8Ts21HP9ATrotyYFqXQ9esoU3P4Vs0RwnnCMkS+U0whFQFCyX+Dg+37JrtOTrnmPe28IWyqZzjZz4BwFJNw27/2Ml3+W+s1OWm9uLaA+j4mOjA+XukmKxqn7/g/Isotw010PDe6YTBIYwAMKygscX8wjcnopnXJ/o5jqXmxxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnXI9u1t; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnXI9u1t"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6dd059478dcso208722eaf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791578814; x=1792183614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L/WzjD2Sk1tXen1jf+f9JhxxyIkDVMdpUa25GlOoTn4=;
        b=VnXI9u1tbTeOP3zVJU1NwI9bMqSzyUJ3UJmuQsknpvzDpk5RVaDxVlbp9wAlNAeEb6
         yDV9RuayRVoGtNNqphfJtIyNMhqPeZXbZIIn6bdRyyEJMRIaAHvbiLmpcOVqgCmHK+HC
         Tg45gAg7GgLByY7Z7exDwYal3S/VD1Sx0xfCANxBKvs7UP8UGEXVcX/OpJGr8WLSpSX0
         miEeZISIAdFWi4EfMUB5bPrV8NISAb8Wb4TtrWDHa2rTQrKBfhpCNs2jA7rXNtvC7Q+q
         ZaCSZ0wduvCASlcRkAJN/9A/Y/jpw4fMkRsTjWhdDMM49726+WhL3LsjX0olp5F/gdx+
         cOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791578814; x=1792183614;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/WzjD2Sk1tXen1jf+f9JhxxyIkDVMdpUa25GlOoTn4=;
        b=YN9WGzty75bKYPBWG9dtDObhHO95B7+7L4f3r4+BiTtmtu9FDqQNPoPDNa6YN8d5n0
         +Psfx9720cq/ZaE76k4ikx9ukCbsvZYNhHAdHrcFzpkxdNVOlYlzmK5zpeqAJ2DlWwRO
         p8xGrzQBmgUCFdaHuCE98kTNg439ctOP+gYImNXwr8etKKJxiyHQaxqMD36XFoFQGO76
         VkK2kDR+Nk8xT1Qp6zy9QDntD1KNm6UFf6M5b708vKZ2FumJi1qu0zX6C3WQYqNpNeCT
         UUXoRIIoAOrH6e6VMXnA8WKfON/FstaqmnsbYckETg3pAQzxR7lfuN7EpQpJ5Ra1oLoa
         bMPw==
X-Forwarded-Encrypted: i=1; AKwUvBxezQk5YJ8WyhRSQceoJaBmOen+1x1GZwcJ9qFevMYKk5NMGfif4kxrLA4lh8HIdHhrUJLk9GzGr4mITKmcy5E=@vger.kernel.org
X-Gm-Message-State: AFuF++nxPW+ZQPWyZ4CNFEjARDlhztQ4fXz7gjBuxScFukQUOAOhRux+
	yHd/+NKCWkQsvYSWbXcJIKkt+ps3CKvH/Vu73WWRF1PIjj4WV7uVtDcR
X-Gm-Gg: AYBFou0ON+N54DMYFbQDdd9OfllQwBK4+NhvPWGtr8Ds+J5qiJJ1rJBKh8EhXeFc2dc
	fTgH3W4+DTipacIKFRF8rJlxCimlgg2hJb1AyrRiqi4hMJZVU2fVh83fTNEjqRS6bBVvCf6xxoR
	90y6MQwp9xMWy0s9Y+V4xUGU9YjuRBi57WBjos0K9QZqSHSU7BMlNXbe1Jdlk31B/1todCRNW4b
	E19TV2zM4N1rsHdMrVpaCiYsoHCBTLQDGgEQZx2/GM8sybAuE5g0fiVKDmIz5phcalEUtDZJOAP
	NuCogMmgUjaE3jRTPuuVXaiIbIxaWVY5uQSh7CkRsi620rEQ1ZU+1a3X7F4FCSSpxrrJNS1ePUQ
	kFxE4nTMAifpyiJDLdDTIiXdKqoia0sCf0FVkXWTqg3JTZeJNvUsHxpKe/hNifcxUpJ6j1KZJLF
	2biV3W/4PGod6eXPNoaJo7DRjVolKyKxm3/+AJirg90dCoW2+iqwX8pnGPWpV1dWgCDgs=
X-Received: by 2002:a05:6820:1907:b0:6d8:6b04:cf2c with SMTP id 006d021491bc7-6ef08c7a69emr2385271eaf.12.1791578814263;
        Fri, 09 Oct 2026 13:46:54 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:2::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ef00ff3b83sm3117493eaf.6.2026.10.09.13.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 13:46:53 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v2 0/7] psp: support rekeying psp protected tcp
 connections
Date: Fri, 09 Oct 2026 13:46:40 -0700
Message-Id: <20261009-psp-v2-0-5596ab50f677@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFSyWoC/y2MywrDIBBFfyXMuhbji9JV/6NkIWZMBhoVDSEl+
 O8V6ebC4VzOBQUzYYHncEHGgwrF0EDcBnCrDQsymhuD4MLwNiyVxKR7oPBGO+0UtGfK6OnslTc
 E3FnAc4epmZXKHvO354+x+39J9dIxMs6051KhmL2V5rVslj53FzeYaq0/5F6qbqAAAAA=
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

The PSP architecture spec states the need for rekeying connections in
the event of a device key rotation. After a device key rotation has
occurred, a new rx derived key needs to be generated and sent out to the
other end of the connection sometime before the next device key rotation
occurs.

Because PSP connections involve two different keys at each endpoint,
one for decrypting ingress traffic, and one for encrypting egress
traffic, there are two types of rekeying events that need to be
supported. From the perspective of one endpoint of the connection:

1. rx rekey: we need to allocate a new spi + decryption key pair to
   provide to our peer.

2. tx rekey: our peer has provided us with a new spi + encryption key
   pair which we should use for encrypting traffic immediately.

In the case of rx rekeying, there is a period where it makes sense to
accept packets authenticated from either the previous or current spi. To
deal with that, we allow a psp_assoc to remember the last spi that was
valid on a socket due to a rekey. If authentication state does not match
the most recent assoc, the stored state from the previous assoc will be
tried.

In the case of tx rekeying, as soon as we install the new tx key, we
have no use for the previous one, and it can be disposed of immediately.
The only catch is in the case where hw uses a key handle in tx
descriptor state, as opposed to inlining the key directly. In this
case, psp core needs to be sure that any of these unaccounted for
references to key state are gone by the time it tries to sync a deleted
key to hw.

To deal with this race condition, we introduce a different path to key
deletion for psp_assocs removed from the socket during a tx rekey. psp
core will use bql byte counters filled out by the driver to determine a
conservative grace period where key handles can be disposed of.

Lastly, some test cases for rekeying are included that go through key
rotations and rekeying.

There are some packetdrill tests that are queued for upstreaming [1].

[1]: https://github.com/danieldzahka/packetdrill/commits/psp-rekey/

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Changes in v2:
- psp: support rx rekey operation
  - copy old rx state by value instead of pointer to prev
  - place non-datapath fields at end of struct psp_assoc
  - disallow rx rekey when socket is not in full psp state, or
    dev/version doesn't match
  - require the new rx spi to have the opposite phase bit from the
    previous one
- psp: support tx rekey operation
  - place new assoc on pas->assocs list instead of psd->active_assocs
  - disallow tx rekey when socket is not in full psp state
  - document rekeying in psp.rst
  - reject tx rekey on SADB devices until deferred tx key deletion
    lands
- psp: defer tx key deletions for SADB drivers
  - replaces "psp: add driver api for deferred tx key deletion"
  - use bql byte counters instead of driver callback for grace periods
  - only defer tx key deletion when socket outlives psp_assoc
  - document driver requirements in psp.rst
  - allow tx rekey on SADB devices
- psp: add core tracked stat for outstanding tx keys
  - replaces "psp: add core tracked stats for deferred key deletion"
  - drop grace-periods stat
  - rename tx-key-cnt to tx-key-count, only report it for SADB drivers
  - warn about outstanding tx keys in psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - split psp_responder conn_setup_psp() into rx_assoc() and tx_assoc()
  - drop Reviewed-by from Willem due to psp_responder changes
- selftests: drv-net: psp: add rekey tests
  - add tests for rekeys rejected due to psp state and version
    mismatch
  - add test for rx rekey rejected without a device key rotation
  - add rx-assoc, tx-assoc, and key-rotate rpcs to psp_responder
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - new patch
- mlx5: psp: implement deferred tx key deletion
  - dropped, bql based grace periods need no driver callback
- Link to v1: https://lore.kernel.org/r/20260204-psp-v1-0-5f034e2dfa36@gmail.com

---
Daniel Zahka (7):
      psp: support rx rekey operation
      psp: support tx rekey operation
      psp: defer tx key deletions for SADB drivers
      psp: add core tracked stat for outstanding tx keys
      selftests: drv-net: psp: factor out psp connection setup
      selftests: drv-net: psp: add rekey tests
      selftests: drv-net: psp: add a tx rekey drain test for SADB drivers

 Documentation/netlink/specs/psp.yaml               |   8 +
 Documentation/networking/psp.rst                   |  64 +++-
 include/net/psp/functions.h                        |  10 +-
 include/net/psp/types.h                            |  34 +++
 include/uapi/linux/psp.h                           |   1 +
 net/psp/Kconfig                                    |   1 +
 net/psp/Makefile                                   |   2 +-
 net/psp/psp.h                                      |   8 +-
 net/psp/psp_deferred_del.c                         | 231 +++++++++++++++
 net/psp/psp_main.c                                 |  25 +-
 net/psp/psp_nl.c                                   |   4 +
 net/psp/psp_sock.c                                 | 113 ++++++-
 tools/testing/selftests/drivers/net/psp.py         | 325 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 198 +++++++++++--
 14 files changed, 970 insertions(+), 54 deletions(-)
---
base-commit: d8674294aefef02266c4d47ad10131f1bffbe534
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>


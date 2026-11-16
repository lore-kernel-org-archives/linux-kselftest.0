Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830687;
	b=TlbNvOQ2mgdqjPOSZloNGur7f23KVA91kQsWy59XzyZ+FkA80GQThepaASUXj0IQJrzE
	 Ol+Lg98GpAy6Xd8vJA07TqMOKkCyOWCJM/O4paR218xr4/aSWU7E3b8uojvW7mX+dJdoU
	 tcqUpiDgkKtgT4YTGnsCy+WFE9bvjuYezuMrSy0o8iO7mJNEA2CtCkrDiI706c2AsYAJU
	 yOzQywGmQAziN/ZWVwBKvL/jc/+DgoE0w70Bz3yJDfe/gUInBKwr2ArG6gTLf3MsqH+j8
	 ilL6s6+mnaDBS1QRQp2Y6Rqsft1/qKq0wXLTX1yY7iHzdxU1lxGvLYM6XAPsM1NQ7RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=w+hLSSBEQLeaadJ4ehRvrNvghPc5ZJYcY8eWYUFvqOA=;
	b=fgU8TiAGm2EUFU9xdEjuhF3if2ssPEIIQsjpO0v/mtUnD6Sg2xdWuf+9o8OisML01heg
	 pv+g+9ydkrZTkvn4oGFyDEsD1KO2fEeQ+B48EEfQ7hThn77tOIAaEdA2db+NP3+nlNa0n
	 qW2dmejJh8qIbtSmj8k7gGisdAkyjg82EUEuigJGhhZwdC4rjEm1wMPqiGk9s0VUgBTSU
	 RE+MoA+EF9e6cNUqLxsVMisvTYimOMtzHX+mOHO/z67sWHeTTDHsVbRnfedF3wacvKvaX
	 JU1phwZ6RT08kvcVA+/6p4dFPrkIbG8yIP4zygDhdh6G173ZSr8nZmnyvH/dTgyJmgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6ZQDB61;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC5606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6ZQDB61
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b37c7d767aso19668137b3.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830685; x=1795435485; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w+hLSSBEQLeaadJ4ehRvrNvghPc5ZJYcY8eWYUFvqOA=;
        b=R6ZQDB61rzhvhYgQPcmWrTeolhLyLN32JqAJH7MI/omFjgFHMvVIpXo+zR84zcrSgw
         qYz3BPAqeMsqfoyxQbCnXsC9BAzK35cZZLYTm75I8urB4qwsg10LYufBTuarq9IALGu8
         pqj+ENF59L8XQJisukjrq2nksGwx+54ksp3C3KqTGKUASXuw9Nv5ihCKJC9Q4qD0qpS1
         s1aam+e4pLVvCr6i93Nwg3Hc16/cbtIRGxNAu0/GronzX458ySXXfT05ncBDXiLR1/vk
         U4sU6Xc7mJQPOfK/GxZqNYDLPHWdTEcs75sjI3WtpZJ2C24jEvsuSxgoC3YkrQLICpxI
         zE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830685; x=1795435485;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w+hLSSBEQLeaadJ4ehRvrNvghPc5ZJYcY8eWYUFvqOA=;
        b=rBMg4sIVEGojNqkK3fl1mTetVbyf8Wu7xeRzhfDcegIV/+W0oIz4VCt4UXNBzGQE0Z
         XgOUC52EiDFoCfmiyu7F2BfUaeBbnfs52WRoJW0ibnLBTckkzMS8W9E7ZL7SwmFB6Fd+
         ZWvrRTPqODw6EG5GKlUOnh6i5fDe1YFLjCp8E1Iwy6R3ippMQrLekvu7dPdRR11ZTd74
         U4kt12amX9GDceqRzRhLdmnk0einunbCnW7GD9m9E0e758gdS/A3k2mzxaUABKHCLxYf
         1qu4+w99Gefzox2NaGMuDrx/6w88VjC9Ny7DtVe1pYJKOeRxx+bj9cj7WjHR7tN3V5Kd
         uFiQ==
X-Forwarded-Encrypted: i=1; AL+hErG80U4ibaj1J41zwIpTLAkFJK8c0lyXmm6jmayYC48pBrMm4mXQAtmz5ZQAU2AJ4KZ/JvE7iHz3od9mj8d6Z1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a2jBLsU2eoHNMusgHmjXbWrlFlyiAFIQcLXAPsODe9VzmtkuZ
	GZ0Oo+lzNG1wFYBcwdOTXEXzrSY8Ein+IAncldxO3zVanJDi/P9V7uHHTC2LIB2j
X-Gm-Gg: AZFdTZc30Qly7ulVMnHyxJ/UO7wiuRa0BZiVDjsC7y0xmTZAEgjDM7QrM6DGgaUhEQU
	5PQ8BI/GQpWx12dj+fKVj0YEmjdZwQi0sTglgCksJ/ev/2Ddmv6mArdF+h2MxqQsgUzqvE1DG3y
	SYr0S3PsFtdf4aWjVm0g8pdBXkfYrvWfEAs1n9Q8E1cDlskdVJrNDW+yCmEVzOSFrxAy342MK2Y
	JkrXNIjeWVf7jD/t6nGicnwO6HprizIxJHbcHY06ki2zJrC/an/u6jdPDQvfxT71AtXNF7ku4V5
	WaNolTyf/+WE9MxERGWbPk6juDfQwty+x5alsM6+acSbMRBFkOhvwdI9vdGGKBIctb+HG6o0cka
	E4xxyae6kRqNGMSpFNfSEEk+tj4c/jqc65yq8T2VlJZy75ucKtPDovaX0rC9CuR+ER86BEfAkND
	TogoO87W64c3Nahxp62usfMEE/wGK/4Kim7tdYTGG9zKPR2qlfKWgAFcHqFQ17s64bjBXQ46erQ
	GE3TDkYo+WM5taighPF2ppt6UahP8VkKn1FP8qE5LAGOc0POQ3xTLjtDcczBbJf/S5SJDewNFzc
	vMKuugsRtWdNEkk5D+raKGP33ztIPAXq85Iyr9C+oogZ1wIn
X-Received: by 2002:a05:690c:3181:b0:8ae:1acc:ad33 with SMTP id 00721157ae682-8b4aa305fd1mr44071397b3.58.1794830685512;
        Mon, 16 Nov 2026 04:04:45 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9fae24sm83783927b3.41.2026.11.16.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:04:44 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v4 0/5] psp: support rekeying psp protected tcp
 connections
Date: Mon, 16 Nov 2026 04:04:35 -0800
Message-Id: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPx+moC/13MywrCMBAF0F8pWRtJ82rryv8QFzGZtAH7ICmhU
 vrvxlQU3Qxc7py7ogDeQUCnYkUeogtuHFLghwLpTg0tYGdSRpRQSdLBU5gw0zVQK4UWmqP0OXm
 wbskrFzTAjAdYZnRNTefCPPpHno9l7t9LPC/FEhMsLGEcqLGKyXPbK3c/6rHPPtKPKQlpdkNfR
 jRS3QSxsqr+DfuaksjdsGRUbQyrrVAV/THbtj0BnDagwQgBAAA=
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

A note on v3 and later:
To keep this series short, I have split off some of the content that
appeared in v2, and also have planned future work that will make this
feature more robust, but not necessary to start. Here is the current
queue of follow up series:
 1. core tracked tx-key-count stat and SADB drain test case (from v2). I
    see this as able to stand alone as a series, and I also would like
    to report key deletion errors, but will have to touch mlx5 for that.
 2. core to end grace period if BQL is stalled. I think this deserves
    its own series for human discussion.
 3. Rate limiting rekey uAPIs. This has been suggusted by the bot, but
    whether or not it is needed depends on a bit on the deployment
    model.

Original cover letter:

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

Future work can include a time based rate limit on the rx-assoc/tx-assoc
uAPIs to prevent an untrusted user from creating lots of wasted PSP
assocs and consuming SPIs, SADB space, etc. For now, users should use
network namespaces, or otherwise not present PSP devices to users that
could abuse this.

[1]: https://github.com/danieldzahka/packetdrill/commits/psp-rekey/

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v4:
- selftests: drv-net: psp: factor out psp connection setup
  - drop closing the data socket on conn_setup_psp() failure;
    preexisting and not needed by the series
- selftests: drv-net: psp: add rekey tests
  - reuse _recv_careful() and _req_echo() now in net-next instead of
    redefining them
- Link to v3: https://lore.kernel.org/r/20261106-psp-v3-0-a8dd38f5a727@gmail.com

Changes in v3:
- psp: support rx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count it in stale-events
  - drop the requirement that the new rx spi has the opposite phase
    bit from the previous one
  - keep prev_generation valid across a rotation when the prev SPI is
    from the same generation
  - document rx rekey in the rx-assoc op doc in psp.yaml
- psp: support tx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count the socket twice in stale-events
  - document that the previous rx SPI also stops being accepted once
    its device key is rotated out
  - drop the claim that the peer accepts both the old and new SPI
    after a tx rekey
  - document tx rekey in the tx-assoc op doc in psp.yaml
- psp: defer tx key deletions for SADB drivers
  - document that Tx descriptors must be completed or discarded
    before psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - take key lengths from the kernel's rx-assoc reply instead of a
    per-version table
  - close the data socket in psp_responder if conn_setup_psp() fails
- selftests: drv-net: psp: add rekey tests
  - drop test for rx rekey rejected without a device key rotation
  - fail fast in _recv_careful() if the peer closes the connection
  - in the basic rekey tests, run traffic across a rotation before the
    rekey, and rotate again after it to verify the new key is in use
  - drop unneeded key rotation from rekey_rx_version_mismatch()
  - carry the key length in the responder's assoc message instead of
    deriving it from the version
- psp: add core tracked stat for outstanding tx keys
  - moved to a follow-up series
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - moved to a follow-up series
- Link to v2: https://lore.kernel.org/r/20261009-psp-v2-0-5596ab50f677@gmail.com

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

To: Daniel Zahka <daniel.zahka@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Donald Hunter <donald.hunter@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Daniel Zahka (5):
      psp: support rx rekey operation
      psp: support tx rekey operation
      psp: defer tx key deletions for SADB drivers
      selftests: drv-net: psp: factor out psp connection setup
      selftests: drv-net: psp: add rekey tests

 Documentation/netlink/specs/psp.yaml               |   8 +-
 Documentation/networking/psp.rst                   |  68 +++++-
 include/net/psp/functions.h                        |  10 +-
 include/net/psp/types.h                            |  35 ++-
 net/psp/Kconfig                                    |   1 +
 net/psp/Makefile                                   |   2 +-
 net/psp/psp.h                                      |   8 +-
 net/psp/psp_deferred_del.c                         | 231 +++++++++++++++++++
 net/psp/psp_main.c                                 |  22 +-
 net/psp/psp_sock.c                                 | 114 +++++++++-
 tools/testing/selftests/drivers/net/psp.py         | 251 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 192 ++++++++++++++--
 12 files changed, 886 insertions(+), 56 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>


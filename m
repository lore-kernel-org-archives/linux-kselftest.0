Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634329;
	b=xFeGzJgkXDP8x8m5febeNgsz0DOB5FWzr/eOBu25vx0Pi5WfuUiKu5AMGrEGSBRB6PcQ
	 4QvQvHC8bxKC9WaumbdYCT427q0m5wYBaC6wfp2gICzrllBTKXvaeZE5nF+LJiiIdMfRc
	 8gvtovW7vMjxpRzBq0mpISeWPzuj7oeO9JsaXO0kElYn59szIfGP85GToin2l0VXpF1lP
	 fJMfNMXKkP3DmEP52+pLPmN2GA1QohCnuy0NZb8YUKux34HDAemJ3pAGE1IZOONQsWbv/
	 Gx1+WuabW1KtbOrqZZ4o9UstGIjNCNn135aA4mucsoztse83sQijlUoQZpkbPDYnNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HijCuOpDuAK6PXX4hhiO509M0K5rwPq4Jmik4wLwBWg=;
	b=1wjOZB4Up7deu7EbOsF6qRHVDn1NNabWz9PV/2pOBdKE9Og6gDF+Sgdp/SfJXxjsfS2E
	 I04lMS0Q+b3Yg3OnSXpxt2sBCWhxwhVnKaQdWA77Ly4uJSQZNeYU8ZE30vbXJ16DsDhr7
	 JJLBm6LINstJZqf0CkAWhADrJgtQ3TOUC8XjdZBVbyFCjosN1hWxf/yX8EPlne4e8Vmfz
	 /93FntZhCXHEOe3+jL4WrNZVo+MPMfDUBwIDY1IADYcEIu++EjLBdbr+D+wkN9bRFZORd
	 qAX7mJ6E2DoV4vF8HCqZMzJUqrxqHDYEfHzfyFwk3d0DqEUF1WzgiqME4toT5dTnC/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ILYd2YrI;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CF7606A319
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18CF7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ILYd2YrI
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e64d52949so118083585a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 18:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792634328; x=1793239128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HijCuOpDuAK6PXX4hhiO509M0K5rwPq4Jmik4wLwBWg=;
        b=ILYd2YrI9qIwIWCdoSXQ/yf8+4firDkwcRlIzKEP39SUfiLAhJkv4itz8By0QiL+Kd
         rD8RDzoD7hOIvbGKLfiDKMnDRkJNFl+xoHiiOk/Ruy2tYO9zDjDlyFs8ePUZkhGKuDuX
         CCbm6QhGx9uKUsVYqhWZSDE8kdmv6lBl6sHgOSUXC3Ur2EBXvtU+HcdcvTrcVG1DlkRU
         SJOLLRni9yGQ3JkmvKLXKCUD924DivrYXhXhJro6ZhKqjRR55XZ9WnCvmEkQ0F5tpm4o
         91zWN3hElWnI4Pr2ttxEyEf7b6m3mHwFQLcOrNX7g4k1iutCDDDshQP2L0Kbx4wbKhMr
         25pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634328; x=1793239128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HijCuOpDuAK6PXX4hhiO509M0K5rwPq4Jmik4wLwBWg=;
        b=q4k1MFvR9Q4Ww03ha9F18tklPfoz3/pewOeU2oJn5sLyk7KbdC72Zb9DWZNMhygcBP
         tVQxc/tg54dEZecnVecyu3CfNDV9crEa1oZfJxttLQNY518/WXQtvzxGNLVrcFg4usYa
         zduacZ8ODK3XhXVuyUmaZKiKqIBHqR3BtSsKPRhnjEtxaUY0bbaMBz6rn0uZPimNfCZP
         LCYbF3n3G8JpjAt/m3VUMSOqdmnvDPtBmq8u9j8ynesX/3APPKoztX+6NCgcMye+XkA5
         DUK7TLR06rxZLNyyfrxpZG0+nMs0XeBtwJZrKehDzG7O35JDg6JIaHII2pAhRtYD+VZR
         zzaw==
X-Gm-Message-State: AFq9FYLrSmhOE2EAJzx5AYkRa4VD/cB7WDEBhlEBpQJSKyJKhdsxdBgM
	1iw8ZjmQvUi779R8Fda31EmT3ERt3ASJpMXREo2QwaRawalj3xdZA8hACMcRZSNDjEOqVaApmCS
	lx9P/
X-Gm-Gg: AYBFou2uW2RrYBEasVLgw9bzsHd/WA7s7WDkXskOSBnEa+aLCWVwn5Yqbqn4qbMTcnk
	+Nq9Grm9nn0FOmLRE6OxR9oxwT9fIHS3Nqfn/JXllR1a1v8UiryJY22nvC8j5em+tvDhd3CTOGw
	LqaTdSkI6ixds1HHT6Mik8O4Nu8V29PV9o8Yo/WQIfdITeFHIUqza+XalVxjKMRKlJ5x/yv1fs1
	5jK4qMcWdWk6LtiX06rj4Bw847DI0lE4x5I9M67M4gyG4eNmhZaESoI/te9fyqEVH8r9EqdWLqm
	Pw7ZuyiQ4TdPf5WG56o4mmHK1No3C14GYwdRR0uRBfqJVePhXQmZ3xowOJmwHg6NK79i2brVH0s
	3YI9o/8rn20X+fOkJbDXbQA3G5UKS/qnDajmRlf6yuh5ko0ZrbxYg27k0VFRFQtmVHC+gNNkAhz
	hxmPJeQ88LDkBdHFxCFQ7j8FeSI7HMA7IvrvSynQbslNgoxA7oerIdpwhRIg1F4IX5l6eA/9mM4
	BUUNcIYDuLsL814gpS2+s8SufvWs9tnazJxRacfudMOUrPP2lClmEbel55EH+9F3XA3iUwn88WO
	v0IFzYM94JiPGSPyQcBW3iFslqRw9vOy6BLGFgSZZbUWj1Qu0NmlL0IuHpnn8IBXkZmr/5V2jI5
	j
X-Received: by 2002:a05:620a:2989:b0:93e:e4d1:797b with SMTP id af79cd13be357-93f57fac2a1mr783266085a.56.1792634327158;
        Wed, 21 Oct 2026 18:58:47 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e247ffsm397383285a.39.2026.10.21.18.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:58:46 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v3 0/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Wed, 21 Oct 2026 21:58:38 -0400
Message-ID: <20261022015844.2795816-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, LUO sessions are frozen automatically only inside the
reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
iterates through all outgoing sessions under global write locks and
freezes them serially during shutdown.

This series introduces the LIVEUPDATE_SESSION_FREEZE ioctl on session
file descriptors so userspace can freeze a session as soon as it is done
with it, rather than delaying until auto-freeze at kexec time. Because
luo_session_freeze() only acquires the per-session mutex, userspace can
also freeze multiple sessions concurrently in advance, reducing kexec
blackout time.

Once frozen, no further files can be preserved in the session and
subsequent freeze attempts return -EBUSY (or -EINVAL on incoming
sessions). During kexec, already-frozen sessions skip the late
auto-freeze step; if an early-frozen session is closed before kexec, its
files are rolled back via .unfreeze() before being unpreserved.

This series is based on liveupdate/next commit 27be83a12b24 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
v2:
- Rebased onto liveupdate/next (commit 27be83a12b24 ("Merge branch
  'lu-pci-preservation' into next")) and split out early session freeze
  into a standalone series (tmpfs preservation and its per-file user
  argument plumbing were spun out into a separate series).
- Patch 1:
  - Drop struct luo_file_set_ser * from luo_file_freeze() and
    luo_file_unfreeze(), and rename the session helpers to
    luo_session_serialize_one() / luo_session_unserialize_one() so all
    of struct luo_session_ser is populated and cleared in one place
    (Suggested by Pratyush Yadav).
  - Unfreeze the session's files if luo_ucmd_respond() fails in
    luo_session_freeze().
  - Update remaining reboot-only wording in luo_file.c kernel-doc
    comments.
- Patch 2:
  - Add checks verifying that non-zero reserved bits and freezing an
    incoming post-kexec session fail with -EINVAL.
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (2):
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE

 include/linux/liveupdate.h                    |  3 +-
 include/uapi/linux/liveupdate.h               | 25 ++++++
 kernel/liveupdate/luo_file.c                  | 73 +++++++---------
 kernel/liveupdate/luo_internal.h              |  9 +-
 kernel/liveupdate/luo_session.c               | 87 +++++++++++++++----
 mm/memfd_luo.c                                |  5 +-
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++
 .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++
 10 files changed, 207 insertions(+), 63 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog


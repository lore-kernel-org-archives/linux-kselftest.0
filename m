Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F826A1AC
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 00:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789778800; cv=none; b=BibkWHnE3TMHvdD4l853zCWGV3uNU3SELoOca7HA8EnF0wKFylZz45IwVafsX3SFQA5hR4fbCqukFtZz0UENbxINk9TgreZ1e7LGxctTz7vgacKeTFhCiZgTlPo68zbSs1/KizopJGe+nkvqUNcq8QFXKhkSQ0LE38PRv1n00io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789778800; c=relaxed/simple;
	bh=z/BVWTKT2tlSDr4ZPRfzPMMZSRQwWl2YRFIhjDJgbGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ItVNoanAjkScgLrG80/vsbFHJtnTBQ5RyxIINj5lVWNdPq2hHAWaePbSPTD3U1ET11/LnM2EhWH0GG7TK3dQr1fpWh6w4tmjNN7l4AmccCIOE/3I097e2l3nKjwey0mM0wKAPrNJ8BNayRgbuouiV6QZxFZyFbbKkx9Ygy3wtaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TizPJzJN; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TizPJzJN"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso1033166a12.2
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 17:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789778796; x=1790383596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfM6UCZtzoFFrTjdj14/vVJVL8UR3GPz2RxKfZlHRaI=;
        b=TizPJzJNRqq72R8te2/XzP2pzEniUaevKj/g5ir1jAXJG7ZpxuRJIK0VrpsL6j6VWJ
         /UJ5O5jqW7in9HtAQWaOcgRSH19NXCCbYg/wWSydG+HDCgxz9jybQdK6IlpguWBHnk8i
         tlXM3AMUfYgxRBDAwWfs0WSIoIQejqhGrUEhgxR1UKSYHStc5xZpY5P+45VRRvPGbB/n
         vPmv7Mjt75DbzygsYPAYg2RzaA7L1ncrf8ev+s8fgI/hH26qfBCSn4l0v0OOA0IyftUj
         aivSbbC32v2v2/QSuopK7z5fnTdP/j+VXPSpDDxaR337xgd8TIKGYF+5F8vuP7njqssR
         WJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789778796; x=1790383596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfM6UCZtzoFFrTjdj14/vVJVL8UR3GPz2RxKfZlHRaI=;
        b=Qsc+IUBY5LMA79Yg/D2ou5m9nU9bApT1sYLxypRjRnuF2W5ietWy0JP7N8pRvNcAFZ
         PL6m/mORGMOCyF2xaQtfqqK79hN1vAA7iF8E+OhPsvsUF15FSQkXP9T1aHNyLEBoyQ1C
         X6i19oX2qcuGQeWUqJuoPxOJAugd7tPmjE3Wg8br0cHsI3asMhW3JLhUhz23an3zN/Lv
         KNtR1qi+21NWLbVgUUw9nakJNRWg+PjK7RvZRHT21nuZMQ8/SstOscPucieCqfNfkAvs
         UiZcNne+W+5spZ8oT4kUuBW7TlQejXiMv/Wz6HeaKS0zAxPOXIbI7olfVD+24lN/pX/1
         6jfg==
X-Forwarded-Encrypted: i=1; AKwUvBy4uwheU9MzbXzQJNbZXwyEr1/i0kFoVb+MKGnOGwR7+ZQet1Kg7Gv8b9dSzVUsH4TNDA/uIzFlytKXxsuukww=@vger.kernel.org
X-Gm-Message-State: AFuF++lJWLDUt1tGD7U5p6TFG9Qu+jIczhOWm4kVCOfpYql+8zCiOBkv
	+Tkr35nLKxC78yDh5YRj5hM8vhuN3gdBmcml6Ko6OAP9GzmQFxAtSgM=
X-Gm-Gg: AYBFou3yq5DzKYH/nE1M2ccz1+j1nN9GEK3b2sJUvscJ2cQEI6ZR5G/UhOlUYyLTqAv
	WRUGPm9n/4Cvq9JNijCr684vxK98jB9OVdlrFHzBFdyL3LiCT/2DzThSzY/Wn4yziPhtdIFLEzU
	oqXljlvszcIqsP6FQK97Bs9GOGqW+MkX8+kTND0jrouPVJnLZC3Cq0dw2GtqCDKTINgKTnbzjLG
	MjpIRVdGrRsje05LqVEPx2S7m64e68QgV0YK/7LslZnwMbU1U/m/TEmK/4pgaIbwpovaLRQb8Jb
	IuxvCQvB8yani0KDtSSehmP+ffcDTMjvOF5gBNQ4iJdet5y5S/MpUGclPAJo0s2tt6m8iQRErda
	KaJpN8XlC4/aOtkYvrVZn1SVXpp86U2kHxZT49uO/W+oziBdUiyLoPXtIAUdto6cPSd8qdn4298
	iViiIc+2DoWm9qen+CxVoGS8w8/MuSxL7e3xduCn/n2hsM5Cn6dufAW44C/KoHfG3UETHS1ogUD
	2YBFbA7iduSpM3infOK7D8HDVOAl0akVzqgSU0=
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr10838895a91.16.1789778795844;
        Fri, 18 Sep 2026 17:46:35 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:45e5:9e39:6356:6164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c169dcdsm1927166a91.2.2026.09.18.17.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:46:35 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v1 0/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 19 Sep 2026 09:46:28 +0900
Message-ID: <20260919004630.1159895-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on the source lands in a
destination VMA that was never registered for write protection, and
nothing clears it afterwards.  Patch 1 clears the bit unless the
destination is RWP-registered, which is what the present-page and
zeropage move paths already do.  Patch 2 adds the test that catches it.

x86_64 defconfig plus USERFAULTFD, TRANSPARENT_HUGEPAGE, GUP_TEST and a
swap device, under QEMU, base 17e7b8eacf4c:

  uffd-unit-tests                    before   after
  move-swap-wp on anon               not ok   ok
  the other 114 unit tests           ok       ok
  uffd-wp-mremap, 38 tests           ok       ok

  pagemap bit 57 at the destination  before   after
  swapped page, dst not armed        set      clear
  swapped page, dst WP-armed         set      clear
  swapped page, dst RWP-armed        set      set
  resident page, dst WP-armed        clear    clear

  MADV_COLLAPSE over 2 MB at dst     EINVAL   0

Donggeun Yoo (2):
  userfaultfd: clear the inherited uffd bit in move_swap_pte()
  selftests/mm: add a test for UFFDIO_MOVE of a write-protected swap
    entry

 mm/userfaultfd.c                             |  2 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 61 ++++++++++++++++++++
 2 files changed, 63 insertions(+)


base-commit: 17e7b8eacf4cac800a4fc89a28729df72a2dabda
-- 
2.53.0


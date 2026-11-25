Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570732;
	b=5GPa10i2tG6WB9CUFh03+VwljBFJnX+WJ+wEH++clMBNScHjJOW3xjKt3olKhQapUCY+
	 BvpaFOu7rF81D2xn27MvwY0MPJXKL5q8W/8S/dsUYPDzhZPIXL4UbT41fraKHkiMOVGaT
	 +Gl1lpjmJSU6QvVYk2DTtwafwFSB5nYs88gDLgjMy8oe05PxsSPWIRCvkVIb1L0ppiVoV
	 fOZ73FXCX5iZwQR1j4L1tdR5DnFSq/EimH23p80fIIBHGhmj6fZpZg5yqEMBVgbW3GXvT
	 GojxLj8R/H8hdIXalLzOZLmojR5X7CWTbxIuPqXbKvXMuexR6r2kjk3prCj4z79NaMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psYMV3ATiJmswPO3YapZnD4ib64/nAD9OzDIxn9t9vg=;
	b=ucEhDbEO0oxtEU/jcbvqMxUMrVcBPM/9t1gxWxZMXYCYDmmbHtZgF/qzmzz5IKQOQZpG
	 yQbLchjF7oL/ut3XJ9aCSE27pEwGlnEm9MRisM/ODWCWHy0urVobXfUa+tIO5GczIf2+I
	 zLFYGlUo1T+Ri6PzW606XszBoykVzheW/0OFIeZHUeOMH1r/S5rFFLAFV5IB0yGVUw5oL
	 BzFfoWPLvi1s20KxU0Xp4DHpqcc6VNCCXthgiOtcOfw8dnVNF25oxs4omJNRFD776SyX7
	 VJuz/jQrSvRx+lzXFkhUTlXONI7PuQK7tHKx+Vkm6LyA8HXE+gcPMekovwoUDw3OozQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RNrhwEoD;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6F606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 01:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RNrhwEoD
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f04244c3d0so42473135ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795570731; x=1796175531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psYMV3ATiJmswPO3YapZnD4ib64/nAD9OzDIxn9t9vg=;
        b=RNrhwEoD1WQ5n0+frjYfB0/+GkDgPyndYCWL7uaPT+rc+yd1ieebM04HIsjbGE8yvI
         LwFYU7MiiCGgyAvqYJZj1d07rcrUfbxdVV0YOCGN6Z2t71mS4cAsDTLxrzIMpkSLAPtx
         ZkQrv+sASlgpuH3CB5Ohc3oR8AY7giH0Ulro63myIsTk0ma4TJZY0X1uNx5AXAVzDVTb
         X9VA6kAGdhxr/pj/6Pbj86JOeWNKDG2DfCN2gZQtfv1ytTBCGubehvemHBqSiPWqIQQh
         H7bIjFbBTxSu5uMisOhL+6TsxEQvsMnmybcsgHR1rEGdrGWyt9tQ9guhjquYLh4gZZis
         CfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570731; x=1796175531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psYMV3ATiJmswPO3YapZnD4ib64/nAD9OzDIxn9t9vg=;
        b=dqCqmTmJDO0cjTPWKqMaKnVmoaeoP2KYW64ZTZ3c34Ic7Q9ZHHGcfvNAB3dfOO/KS2
         ExBcSfVC62Qtx0qkLS7IvpQuvwygQIPcM4/VkI1Y2QDaF3yaICLz4A7BMMFdanSVXw0u
         +LJ0ulDi1uML+u10XE/Avm37TV/Z3APo7av0TGakVOXu4A571NkHqLFUY5r6PngtNnh2
         U3cgDiTIFa9DvVqhts8AghEHtSOgDEwil8tCgHMcwCAktms8Aoc1zh7qHdWvoYgcIbUV
         kHU2Yx9mN6tVzfrTXhnGcjS3HlTvhbajPdbg2aB7pd/2yp1j4f9MVMrI5unKJwK31jfZ
         HYoA==
X-Forwarded-Encrypted: i=1; AL+hErG+BEziAc+SyXPcS5j5yXpJESpi8Od/tYXbOUmTqGIRgiw8PDnnKYjPg012Nse+SYJTVfCCoakRsb9R36XSVzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NJovvhrYJwTzOP53Zlw67P/lG4npgNl3nfk+RGa5ZhYZksqmq
	xZDDKPI+i7oQzb/4ouh5vNu89loaPS0qVqCvlnfnu2/tEZw4zLhR1393MS97tjEqhwE=
X-Gm-Gg: AZFdTZdZuRUz9zbz7H1WJGpVAabfT3woEsz3bIEMWDkHZO/W+eY5QXsvn42fE8tXOXh
	pP2GLwsVzSgy0aBqajuDC/xqPvDuBE1SRaO/4X7RGqgjdEMmdsJVk4uNz0XOVd1//983tYcVQhm
	sh8bbQVIacxj0zOa3yTa0bz3wourglWgJjST1HFhKcL7w2N4G8mgqXnjwaONgUlJr+QZwMNKjKI
	TZ+ejeXr0MNL2P9T5DdfskD2oGMRjAeu50aF2aVTUgUjFEu6NSu7pCQSIjKtvXma0Hc/OpN8j/Y
	+dcaPjpYSHR6SYwT/JK1g4oOVRe/mBFnFm9bHCcCI69MExfCwN1Uo4w/8kNXqViWhwiyNXg10ZU
	fbxzyOPPWs8u+yAULAvca9WytL0dpAc1s6jVa2JwgXxpLwU9pXDldJF2u93/vXSTEgri2BXLddA
	4cFygLZowIxBAGpOfSsthJx8YkdzmBs3sXzjy78FBo0qF/vU1r2bD9Njf5vWO0UtkSRKVcPyy1D
	7gafsu/lBKZ21KimdcNLrXLBV3tFlXYrCheOd03RS0faBUv9s0fkBXP+Z30gFzI2GW+GAkcINFu
	N1TbBzGU+kKJH2sAydczgGzq96nHrjeF2TKYk1lUzyE=
X-Received: by 2002:a17:90b:4c8b:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b41cb20e72mr17587652a91.51.1795570730703;
        Tue, 24 Nov 2026 17:38:50 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm25108088a91.9.2026.11.24.17.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:50 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	narcisav.kernel@gmail.com,
	Joe Damato <joe@dama.to>,
	Eric Dumazet <edumazet@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net-next 0/2] selftests: drv-net: uso: test small MSS
Date: Tue, 24 Nov 2026 17:38:34 -0800
Message-ID: <20261125013838.3823834-1-joe@dama.to>
X-Mailer: git-send-email 2.53.1
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

Greetings:

Jakub, Narcisa, and Sashiko previously discussed [1] how small MSS might
produce unsegmented skbs on bnxt; Jakub suggested that USO might trigger
this condition.

This series extends uso.py to test small MSS sizes. I ran the updated
uso.py on a bnxt thor1 device (with SW USO) and the test passed, as
expected.

I have not yet run this test on a HW USO bnxt device because I do not
currently have access to one, but I think extending this test to cover
small MSS is a good idea regardless of whether a particular driver has a
bug.

Thanks,
Joe

[1]: https://lore.kernel.org/all/20261120154835.0f56c410@kernel.org/

Joe Damato (2):
  selftests: drv-net: uso: check datagram sizes at the receiver
  selftests: drv-net: uso: add small MSS variants

 tools/testing/selftests/drivers/net/hw/uso.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)


base-commit: bc686737f555b9d406d2fa80fdc69c85be6eca8f
-- 
2.53.1-Meta


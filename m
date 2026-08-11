Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259152E285C
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 04:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421354; cv=none; b=K3XPJ41vzM+WwsSqEIJ440qEGaFwXMxTrUB6DuU83u+SWHTRVnvwMtCw5IW906hCW94j0fQbsm+OcFjV3TFs4TA4xLdtSNlVIxcNSRU0AB7fMK1TftciU89sFYyhszFvOthnhOLx9Pl4AbA0K/KcKpufjPYXQ8JldEZoOFG7ei8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421354; c=relaxed/simple;
	bh=UCB0aqX38bCGfqeb+Q6Ir9SGHftrsvr77s24jRVQ2N4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JykrTCRjLqMlIPoz6yiOMHBCDB9GrORZZaQsBJOSnxDOpjhgkp7SVgN8X9FyCpgZj7uoOGqP2yAumbmB6sqEn2hcxONFzTO6EhOzzDa8b+qvg1D6N5woLU8/XCYZPqPxJH89VOjBPztcPzGptq4J1VkksH7hIY5grTJNRJylnGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pVTLis25; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pVTLis25"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso1937139a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 21:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786421352; x=1787026152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zWXHO5w8Ni1sSCNzQtBM0h6+HBrXqed94gT9w5G/cZw=;
        b=pVTLis25uzeyFH2lKSc4q+/uaC3qM5/OpyXzbyoRblnXxf4wfFrP1KaFXJkt4BxbLL
         YsqJDlD6pyPSbAjGFFKRM3LL9TEgqhKiTtjs8NANtjwMyJLXR948V2YhhZ8rRclrVtQb
         /opoRk5O5o2ACsGy6OtSIKIHJ01urwjtZEbFoNz3ngWn/CVIXZpeENI1T6bQHcvNzvLz
         Ifm4Ae55bApxZ/pjKV4NSkx9Z5G7ArU5eICC7qWOZHwqa6Fmzh6IyKPTWX+rwclpYVGq
         c4RQzPz63IcoTVWPaGN9OfmPXJypchsJRENY0bCEEYZ9YQGwzWlmUrUjNooUaefLIOko
         JzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786421352; x=1787026152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWXHO5w8Ni1sSCNzQtBM0h6+HBrXqed94gT9w5G/cZw=;
        b=pKR8iYiuLnhWYTxaHAqndAHD3p8n479DwVj59xheYkZEsHUvBaZv1CbImL6koPjuVS
         F7rZmQ/3jqWw4fa8qin0yJqfB8Pe/jrwSU5ElGJ52IdeTEqLEXAWjYJMyomLhFh2Ykxn
         SX6S7ZLHbs2yyyza6s3zUCBU1VnYLkf9X+0W/v+xPhlPFUdGUBp1kkEs9ZOoSf3jr/Qe
         /aLd/i0zi552keUOfkzcNfH3K/XoqFhEgycXXrglzHmZX34YLN4yxyR3hCV4uE/XXUJM
         A1e81R6UiVnjG0ynjw54FLn+8+8O96FnUh7so5fYEqAxmM8Io7HeEA5bQA5FqDwgXAYv
         nZEw==
X-Forwarded-Encrypted: i=1; AHgh+RpHH+zg7JzM8m/UPlWbUS3+rYAXqEBM1a9geSHpOsT7uincGwX3IOxxMJdSxaMJmD6j2pv3buGVjfyTLOlj/H8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE21fZh1lRRCxrvlGZ4JR8AXJZb4z241Dd1yyxo0yYlyxI8ZnQ
	bkEYC9hkAXe3cefi0UiSCyGyJIXHvDm6fGNXYWP94kbv+KErpwEMlkou
X-Gm-Gg: AR+sD120Ruy/qV0hisp8qCl54McEhVT803eylDilrOGTr2Dt7lAsH0sC/5hGMwhpF6/
	JvcE7c+5tsZaJ9HlJZlPdbkMSWixDzm8YzOUhFCJ6vhjBj6C20w9L/6RBa2RN8k/Rk4p8NRhAuq
	MkTb6hwiBEnG+FfLSeajlBewCJ2p2eMrsZyx8k+3rjM0nn2kXMK4jjD46oyeQWgACVdJDcf4K8X
	2LUMHZxa/Xblshktc3PCZIkUgVU3Fd9QZ6/TzlJ89CgTGSqn0JEBHCmBXEip3UWayk2MDVZ/hQQ
	lWpbhLYCflVGBIRCDvhY9Knxfd4QGkCc63ATevZenbQ2QYBMYcLAHP2xI3sKWbGlz9aOp+GRXHi
	CUfpC3uD8qnjgYLNHf3wXWsqVBJi3QCc/nLLF3EhmgD92N7FI6NF1gSRLp5JmB49CtXXJdpx6Bw
	anOthMD8qRQXslMXkNbwsHZpHyIkefVL0vE7P2gFYrEozkX4P53PxqNpRI/wo3rh6OXalEEJfj4
	xwqxXfnnOk=
X-Received: by 2002:a05:6a21:4cc7:b0:3c8:e140:63a8 with SMTP id adf61e73a8af0-3cc2ba60827mr877093637.23.1786421352444;
        Mon, 10 Aug 2026 21:09:12 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c65005accsm29307eec.31.2026.08.10.21.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:09:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] KVM: selftests: SEV: Sanity check the launch measurement
Date: Tue, 11 Aug 2026 09:38:57 +0530
Message-ID: <20260811040858.1984593-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This replaces the TODO in test_sev() with a sanity check of the launch
measurement returned by KVM_SEV_LAUNCH_MEASURE.  A full attestation-style
validation isn't possible from the selftest because userspace does not
possess the transport keys the PSP uses to derive the measurement.  The
check therefore verifies the firmware-reported blob length and that the
measurement and the nonce are non-zero, with the blob layout described by
a struct so the buffer and field sizes derive from a single definition.

No functional changes from v1; this posting only adds a cover letter.

v1: https://lore.kernel.org/all/20260807121308.1885737-1-hemanth.selam@gmail.com/

Hemanth Selam (1):
  KVM: selftests: SEV: Sanity check the launch measurement

 tools/testing/selftests/kvm/include/x86/sev.h | 12 +++++++
 tools/testing/selftests/kvm/lib/x86/sev.c     | 11 +++++--
 .../selftests/kvm/x86/sev_smoke_test.c        | 33 +++++++++++++++++--
 3 files changed, 52 insertions(+), 4 deletions(-)

-- 
2.43.7


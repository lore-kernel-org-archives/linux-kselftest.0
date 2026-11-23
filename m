Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428443;
	b=jkot2pbr/47DFLtwBmeyHzd9keRUG65NwKLUdruR2mcdoIKot4DcbNZhIb84+Xp48C1D
	 6Lkj4dmaSpN4gk7NU6VMiyrGeqMvzi4iS2+cki88q+h1mDxZrfj/E/6dS7PqP0qDvrrBa
	 Nx1xHD45cuw+DBFLLHMXdh4iMGQoU7Gu7JNFsFmOkYyc/B7Uwbt2l29WKFnqHlBi6wngF
	 5ZAlm+16JY/SPSnPCKS+whShWt1LMenBQpFQ4SIuO+Ynn3NSlGvsCgasIRf6/AS7QXhyV
	 QoXRUJGPllJov+EuR4vzZ1icbxJR4p7Jzljwr8dfT5dJ8BZ/1bNVlTy5xUoXyglL4Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
	b=U/zdVnIvCSTf01IEBpIFBDX0osaMdVVEDGBDaSJNyO717g0sTImvGamZN58acf0An094
	 X0G8Sr26ISBWH5LvcX9QLSXn6VVTNrjgJ440spa4oYXTC1GBzA5mNKetr0B40xN/DrB5w
	 dFNBTaCybxXhhNWJrbb6MEhoksH09RN7vqyCoXcNoUNXhOvckX0uYnsxing6u5Ufacm6G
	 67tbS89zjl/FVeZuEvbhrousdZ9jz/8FDbKAT/MgNh73USiQwJMwEaViHnhAnIL0sycsV
	 xwWZeOv2XE67DllstYjx+Rr2CxErydCBrAGRxN7lqMtJQON/wyiZIsyaM9KYXCSl7/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBw0kU1N;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D9606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBw0kU1N
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so8584969eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428442; x=1796033242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
        b=ZBw0kU1NfuA6MMWFZd7loTUe6EObCzE9PO+rq4XlEa3TcdREvmtLf4bUe9hjhD64fu
         HS/LcN7/9x+lK6mmuMUW1IahoFvznTlrAuq58edyJ8dsCdOmbv6cp9MNTb8g15Kkhu6A
         A6OmSP6fDWRrHs4SxaqVXJLA1urjyRtsifcEsziyIPwPksR/h7+RmL2++5EAtvlsfuQ1
         mQfUvFIXP0Ghc816rVF5xXut3sDOYksnaMNm7slg7orir13++tGmQFCbF9ti611bi1f2
         uqI2XX5SSlxuYIM4blteogqPM6FXwUrwxi560hj4NrbeihKKWQmLD4ZNzxMH+OVTBAPx
         skyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428442; x=1796033242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCV7rj7O3YjHOcFzGHR54dLdeKT96fbmxzbKfW4RNF8=;
        b=lgNwAivjWQcVkCCR7jpZy320esmaTv3fjxqo1BtKvShbiOAdYRsAtVKuSPECIrXb/w
         BN9+b1oaSc428viDJ+KT5uprAtsOIVTZHMEpCJpx/Wiju967a6GCoh5gqBHbU3dyhE9i
         36ekYb1UujsAK5PbceTQkK0WRUNemsnKUSnN4fE5XUt9jCeEaPTX6O1fWLr/lhbaxR2o
         qtRHH4szy3JqzX7uTu+I+SnLAsN1Zi+crML9tKmZSwXzrGpomiQFsJ8FFdT0wDiJZSsn
         pHHAg6a9Wt/qv01FrPEnISsorzl6ZQb6exrdZzz3gqz0EGjteCBX5yzrfH8SK4kB7+LS
         wDAw==
X-Forwarded-Encrypted: i=1; AL+hErHQoNSiLqr3aGOD65T684beLSpJK1EQpgfck+uZ6hqmazW9hWUMtpL2I/7PAOFLHz63YkTcm233/lCvbnt/Rj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Coe5R/z8aIALGdfkcws5piQZZ66Eld8PA2NioFSrW7j36STz9
	FglT6nZMijsGZUoGeem+4jJfG7JHforL7+9OcX8fgxKEnSXZcfTr/GBo
X-Gm-Gg: AZFdTZf9r+9Z0bwhwNqvWVExjEldWU1q7Klzhu9jxuTpi5hjzbEQOrjn0iJTerKOQBX
	h4xv/lSSa7bZPNZcZrhqovDAiLmqEiRTXNKDE7wrtL3DVFHTP4zCZep5gXMDFYph3+ZFmuIW4F+
	7jRHkoZZXvB66YAjm/YsDvnyDcr6RuSGsbvmsuvAEOD8vxGUo2zZLQqoBpiIb1e6DdOjLe188jt
	RreJvy5PFseaWPOuOPWlcqV4vl2/SW+p7Hf/udr1qbCFHY+akId4c4DHOL11O0JVUcDbTFTZnFJ
	uxf8bwAdGVqvIoAH78JbuqYBCkE8jXsA5HOj35qQDH4POqXNIPjU56galIcHC7OzN3Kdf/E4m2N
	/cDTzx2YynrKo3n5WqqsfeQTGjik5Y2x1XwZpTN4hUJZsIw5yuVUHJmUebcBEtnOf5q/EnHS8iE
	vK4WqR0eW17A1X/o3sjHZjaMOrlyUDCuv0z96sDagKXeBKwGq0M7k57j0b2CqAW9epXAR2ZbSDU
	/mFfm9L6gTCiSv0AYn9agsx8TJcRHKEh3lo2pAnNuoi7ifePS3YQuG7XRCpc/GER5tBUl6mw4dy
	/KL3f5nrVQyCJK2t9lOj5hkYq8/8ei51ndKBwjiaww==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr5039152eec.31.1795428441777;
        Mon, 23 Nov 2026 02:07:21 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm34145673eec.15.2026.11.23.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:21 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage and a VM leak
Date: Mon, 23 Nov 2026 15:36:59 +0530
Message-ID: <20261123100701.1679376-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Two small fixes to the LoongArch KVM selftests. Patch 2 frees the VM on
the PMU test's skip path. Patch 1 came out of routing it:
get_maintainer.pl did not name the LoongArch KVM maintainers for
tools/testing/selftests/kvm/loongarch/, because the MAINTAINERS entry
does not cover that directory, so this series would otherwise have
gone to Paolo, Sean and Shuah only.

Based on loongarch-kvm in linux-loongson.git.

Patch 2's hunk sits next to the one in "KVM: selftests: Convert comma
to semicolon" [1], which is not applied yet. They do not overlap and
apply in either order.

Compile-tested only. Patch 2 builds: tools/testing/selftests/kvm/loongarch/
pmu_test links for loongarch64 with a GCC 15.2.1 cross compiler, using
glibc from Debian's loong64 port as the sysroot. The binary was not run.
Patch 2 changes the PMU-not-enabled skip path, which only runs on a
LoongArch host whose VM config leaves the PMU off.

[1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/

Gokul K (2):
  MAINTAINERS: Add the LoongArch KVM selftests directory
  KVM: LoongArch: selftests: Free the VM when the PMU test skips

 MAINTAINERS                                      | 1 +
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.54.0



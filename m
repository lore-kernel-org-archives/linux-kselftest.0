Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669474;
	b=Epa11iMiw+jycETNi97yhR3AYGD/TT6T0vNDeTvAywtg7Xgv6bejnjpSpbLg1/ZFFqts
	 8RrI37OO79F2LfbcOpSnckc6AQhile9VRLqK6VXpz7732hMLlMxBc7qzRkB8TDl93ORVJ
	 TjsB/nu+5h3mSuaVnR2YH1XvjELmRDVAkgYCkHHANmzRceimZaedZT4ZRzmIdmVx/zy2D
	 EkGnnHi2fTjeGpGkQU7rP83twBBWT8jxy2hT7/kTcCCnCFqgpEDtVZkW4U9Wv0EjhJbtK
	 t6naN48G5YhIyWnoq+JEh158TbiZdRzd4nodQf58zekil1xBnX7/T+FnRo6mvdkXpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
	b=W2v5zSOaCd3MUZBH+d9TjSjTrK5zvc+ZK7pp0cjIrZIeJ6rzrBQXDB0bI0c3w4Alxjcn
	 hZq3Gt4FHQIbjKxrjDUhBO0Cc7wRfjrwZ4yF4vQc/FI1p9kAPVR9R6X6Hi4xPM/AvfO5U
	 99v2D05YuVu8ED/eZEqh0luAf5Abwz0PHcvBI70OJznCbP4W/WTQfy2UxrOw9UuFZJqbl
	 OMZs7mDkidDxS4iSXqI1F8SpCetclwxaQok7YzB7KK0zs4z41AMYFr0diuxe6+bdYpdVb
	 kVmbpaYYSf7I1SqVMbXwcVJ0otd2XDVqPy7tkwiBZ9LjG8bmWwJ5+m5bqs/YuhCR05A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSap788I;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF00A606A323
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF00A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SSap788I
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386cf1041cdso2764616eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669473; x=1796274273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
        b=SSap788IOw1yVidTGDD/J+2IJJb94ev+hCn0OpcJgWvkGWGGYHTuxmSu/1TSDBP0PB
         T4KhNiWgQ2tFEN6HRPZ/0KewqchUw817EEqwMHqwPkb9HtlMutL/9Pv6pdw0JVRaeH8Z
         arlf6dPFN4DMXrKrgqtuvlWbxoqmuYTYFoHMl+obUjhkpn+FvoV6yOnbQLf2NX0AvBvF
         9qO+MwPFR+RsxAtbSPeyUd9ednF7D+0gzosH0lYJHzmnLtCR6+VQeGWVSuJ9WpW0nOK3
         y6GnUp78612GhohYS2pn4d6HTiPrXxMk0kLFzMPtk+pK+WzB0f1sOSWFKG4rUgpOsqK+
         la3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669473; x=1796274273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crGGYNxEXyJKntahkm8iE1ek1YTEyGg3pNiPWsgpCVA=;
        b=Xlqt57Jc5P3scMBROB5jV2N3PVB0/GvoeWlJ4PkTIjVM6j185C/OBf8SbwiLl23fXs
         qXfxx0WNlN2V1s1iI2tvp+3W7hIQlY8hczHT09PUAf/FMFJEATewxYsZg9+aRFL0seLP
         tyIJ55zYxA3IrVJNizXeoc8Z9FbK0JMlFFU+RZ0eZSyNjQ1TkICpEaHLNjN+M9IpT5bI
         mcyQ4Rz1RF+rS+HwZrO/52yTfPDhceZXs2TUqRJ9CaMv/tWv3z3HzVT+2dlgAU0pia5j
         DxpIiQHK3s200flYG00ophbuPclwU7z/Dc3TS9eAZ0ReOXFu1bjSVUOAjcJV0HVbVNvc
         tCfQ==
X-Forwarded-Encrypted: i=1; AL+hErFPEs/kJfyZwzjVK9GsM+dpH741mVvWyDYItvtXEDXtWBhllN9dIrAvYt5DDaCgg36YrWa/uBqEV+XLS8hRPCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JeaPWDj+pqb//curnTCR0xU+Zgtd7RRkeZ/EV4FevbsAI6E+X
	avE2MLVmNE7tYb5Y66H/iWHpTyUakj3Kl8SHXwrow3QSj3rJnwx4dc+xOijXeQ==
X-Gm-Gg: AZFdTZcejy2U+STv10By+yPyEoUs+W3lxhDdRujaXkqUJC4mQ0/77Qq6E/jnd2qi+za
	Ef/0aTZM30OvzAW35yBo/FgcNmyIPRhDZWMUclGyuqGE/bTPLzMLkchZbFGlJuER3pvpX3aF5fC
	8at9B4+k286CpzqMAnpqJEyxMGAtZCW+E3Dj2vIGOHcUnfib9ZGLsQjI/njRBR+4ArJf4lk5qys
	zLtUhk7GzX/eImTdlwhP03JVuSKmifktgjHLjO7gmOiH6MvfCxDGI/lxnK4nffk3qytCi4XeRXJ
	YJ3ZlPqRqsmUT5Rz28zDopNwHQgrEBxTfwx1y7ZrnHpn/DD94hnsg8WGqhQ+O4EKlozAF4Wi52X
	6u9kfNZY3z/Wy7V+sBPGE3Oz/RN5pKK3vkOs2otMJezSliBFZGJj8AuwGC8Hk7rXDYiTmnu3cZ8
	4d35FVrBqt311xHnG7oPJ1e7C0EzW5dgyUgHJr9YGJqFpKCaDfyK6Q/yP7xufoFKaVSmyrKCQQi
	6tsZCm1UgzgReiIu01Ti+Yd3nPJacb06lbMFwrXeH5IZBAai+CRHY+9PiVXllXee8ZgkTVb2jRk
	dJJ71YTgjiBPBBeM3egttAnSieRC0h2ZOOSoQ3bDuA==
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr20736555eec.24.1795669472707;
        Wed, 25 Nov 2026 21:04:32 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm60776540eec.28.2026.11.25.21.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:32 -0800 (PST)
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
Subject: [PATCH v2 0/2] KVM: LoongArch: selftests: MAINTAINERS coverage and a VM leak
Date: Thu, 26 Nov 2026 10:33:50 +0530
Message-ID: <20261126050352.1957454-1-gokul02k@gmail.com>
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

Changes in v2:
- 1/2: also drop the lib/loongarch/ line, which */loongarch/ already
  covers, so the entry matches the other arches (Zenghui Yu)
- 2/2: unchanged

v1: https://lore.kernel.org/all/20261123100701.1679376-1-gokul02k@gmail.com/

[1] https://lore.kernel.org/all/20260428053204.1018608-1-nichen@iscas.ac.cn/

Gokul K (2):
  MAINTAINERS: Add the LoongArch KVM selftests directory
  KVM: LoongArch: selftests: Free the VM when the PMU test skips

 MAINTAINERS                                      | 2 +-
 tools/testing/selftests/kvm/loongarch/pmu_test.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.54.0



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187508;
	b=EiaTQTlOjeCnj/TZHu7Ryqc5YbiGtGpcafCxTcvDsQfmMdembki9vQyWOwByHvPDGfmK
	 TvKu+Vzf2w5ZuZT+p61QCkWGa6HIox0qMFgEYUrn+dVLmIgmchB58Q8AvCjYuid42Z2Fe
	 5IwrsnzmYy/tIoXfpkqMzZsVMDTJ5JxEEiALL68ErB7B4vUHGxqaQS82o+6FM72/pG5VX
	 4/md2B2KtXYLo3S6W9geSV+0Ijlyv6NJD4d/pFU/g9199mwD+MzpTdpR1aUqma36PZoEN
	 soXp4lYsKK8Zd8Mx10btotxvTLC1IM6if4eYCMFDbVzSjroYz5WKUrSuK4xkXnnKDfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
	b=k+oNIjeDAhNYWQFM31efoUZjsic8mTJ78mKczRJu5ZfIevvjIiZXhFY9+h2QyOF9+rcI
	 gvj8imv8zAjnv7stO3Q+jOhRcoT7K7RVIPiOWqwfx/DqEDbGt2fllKAu1xdNqVuZ7ZLbV
	 l3Lc41BlWxcqGOjgH9SQxbkHuZGGIK+7YlFMdWpgNgAxJqBvFOhdpOHeojAJ2lKiV6ECk
	 fw7T1zdbmjxY8G0oAHLjcHoErvl2S3cOAzwLnSpKXTkp43Z6hnPxil4DjPwxrjz9HnLZ3
	 xnvJrvznUGOvAhVMLOq2w3tQqNpGOLdJhqMF0qU1s7S7u9hDunMHTIjqf6ic9dbWbeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stefion.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXa1F42C;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8199A606A332
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8199A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stefion.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZXa1F42C
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50715e8328so91445066b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795187507; x=1795792307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
        b=ZXa1F42CV8EvlXMpcNdvdH3rAUyDMIKxyQuxbWmODfEAlrPkm5gY5G82sDTRUZ5uzv
         35TZYhgHC2PIPneKtcXQ70b9m4NHXau+C9PXL9HT0GhzsQWBmluwa2STfULgVVDt+zgu
         xbA230ph485ISpYl1i9zk4dD9splPYG3JNlj/vn7MZCAI0WQrV5j0altX7LIhsHxU+rR
         sA+zhTjlxHUGn+pJVOWpRJuzzp8J6tYLDsClad0cYKONX5aVvLXMcUUA8owtm6p53VFu
         vWxlOT6M5GKa7A5ivvGjsoOiABW+nwQrmTy+4TUB/FNV8RtRkcwbgGbzm883mZwN6N2R
         OAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187507; x=1795792307;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9L5DYVZJmCTJDhX0/RtB0BzmznmCbVTr+mYGMw33Evs=;
        b=xV+r4q5bcZDHUEKj8N1322tuvRs3J121n37EMYPLKY9SD+pwJ2GsAchVSNZmsT5I3e
         nkwjNoFr8R12Sxyx6HQLvhpSYToJbJQ8bWIE+anb6o2HNAGq0oqakET3+SoLHzjARmYo
         4f7sqVoyct71dvEe4ra1wlNKf4W/XyVcASUOYc5shPB5X9odQMAetmH+4YEF+zE5tMG5
         o3IC8B8MPlagrwfpXtguC5T6QipqNrEvzqM6PWoG2PBSyqaje+zW58kJUrWOEjl1Cskt
         cGLCZ3Ml6eIDcjIUW4FxxtoyT71PewoanvqBKq6EMjTnjzd0Gvy+dCxgRnPC1FoD34ZM
         z+ag==
X-Forwarded-Encrypted: i=1; AL+hErHFtYIYIeiukiOprDBJmFsh2mbktuLDfNOHmGheV724y2KDwYQEqxXdaI8tvl34W9ldgDGafTE4XQyFYFT6Q08=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eA4AS7Gxg7dMnRPSGez3mK+NzjIllp9dCwafMjUN4C37PoHdn
	znlONCdTRxfYfdgD6XFTpC13xgd/2sjd81nKHf4TdrNNva3iqq94RB5WUp13jxA1mNwnKTZR5V6
	6psiI2wbNwQ==
X-Received: from ejnw20.prod.google.com ([2002:a17:906:52d4:b0:c46:7c51:47a0])
 (user=stefion job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:69ca:b0:c50:f024:5219
 with SMTP id a640c23a62f3a-c513ab48468mr252861866b.40.1795187506339; Fri, 20
 Nov 2026 07:11:46 -0800 (PST)
Date: Fri, 20 Nov 2026 15:11:14 +0000
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120151114.3708208-1-stefion@google.com>
Subject: Re: [PATCH v2 00/19] KVM: arm64: selftests: Tests for protected VMs
From: "=?UTF-8?q?=C8=98tefania=20Ion?=" <stefion@google.com>
To: fuad.tabba@linux.dev
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, 
	qperret@google.com, seanjc@google.com, seiden@linux.ibm.com, shuah@kernel.org, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, 
	"=?UTF-8?q?=C8=98tefania=20Ion?=" <stefion@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fuad,

Tested this series on top of v7.4-rc1 under QEMU TCG (-M virt,
virtualization=3Don,gic-version=3D3 -cpu max -smp 4), booted with
kvm-arm.mode=3Dprotected (protected hVHE mode).

- All pkvm_* selftests pass. The only skips are the self-hosted debug
  (breakpoint, watchpoint, single-step) and SVE cases, which pKVM
  doesn't expose to protected guests.
- pkvm_id_regs fails with patch 1 reverted and passes with it applied.
- Each patch builds individually.

Tested-by: =C8=98tefania Ion <stefion@google.com>

Thanks,
=C8=98tefania

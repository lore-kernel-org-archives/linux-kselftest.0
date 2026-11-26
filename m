Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669481;
	b=0Lx8urQNBkB4X9qQzd3hvefimgyXoMj2gV+zp/35PHPNO14iBVBShqzmeaOmiyTivyWr
	 zqbM2KJCr4Vjf0WfntemQQkPs+2wCmR0M0ioiKJXvuRkTTwi9/4pU3F5sQcDv2ddL1Ww5
	 LFGKMW21wtluW0WIJYfRLGvoxFHSZcf14nSLdM4OQ0h2zY/nYWCQ3r1Eqb6x+wnbaI3Yy
	 Nvt4pv38MpT1xf8WEaiEBEMpsO0HZsCN9NDgEvnLsdQrfKjoHpnj8hqWxaabEmY4sjqW9
	 J5s70CyZTUzpfUw7GTxoM26Hrb04PB2gvqFnbuV5wpcf6VU6LVTgFoXWgBB924bjDtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
	b=4KndjAoJvC2mpLJ2W2XSlvUy0J7j9zLHnLNisJUhPeBZpf05MYis4U86HVoEHkPvMfst
	 7ZJK/4VtGvBe6xfIc2VJ4ebqD49S/YbgYY7QIFLUCcIRHhz1Zt9YjWfPVESiMGlrEIloV
	 quiU+TeYK16uuTrkCtZ//2pHC+E2REThfKjdPKNvl3pYeiZ/x5qClq98p8WRLh1jSqcnz
	 M1MjsHUZ5AWgakazCKxx+5V0p9fDsDpihTqbEjJ/yAvYtyhwYcfWDTkWlXrBYyjdTJlZ+
	 LftxoW6LJ9xbJ8T4kUbAe0AkdOtTm3yuud/eudOWOlb4dnrSPpg8nAxD7YuQyuuJWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnTxjq8t;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F6606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 05:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F6F6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PnTxjq8t
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14036107eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669480; x=1796274280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
        b=PnTxjq8tI6kCOP/bPiuHjw9C4iCyD6ht5hwFtgXbCh3meDVFqTxo5OLiizJ2qpReyh
         QhIOfsEQBp/f7ZQ6yr9Owr8iYS8YaGc7TPtFrHgArzrhX+TUp3EKXrqitdrvnru+8UP4
         lhZfjlJ0FZuIi0lC6pv5HL4XaZR4NJpFpsr4zcWOMEqsX2e8bmj1X2rgrvMdrD2XcdaS
         J2lreDfdAfxiFStLZNbD052GaMmaIVnODlmbuDi0rfKMQ7UF7wZtADxXPt+YzqEv3nVx
         Lfnlmh1Ka/Z4661KecWLSYq9stGu687K4YCbxAFkzb6t7boQcSMiDHKNy7VTJ4zvrWE8
         iPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669480; x=1796274280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cH1jlSFhK0mGHsLxV8dy+u0fQutnOY6cmJtrmOpCEuo=;
        b=HPVd9QtZTTkXMTwwmS/F2xdaJa74qjylA6HbMftPSPP51kPZ8KgJrbFCODTq7N91aj
         dOqGO+CIN2kaOHfKvzUgpnQrqdq3xdkQvA+whpkR2xbvZGSwP6pv3iKjxYLmArOqJ4dC
         Kmxuo54FICQDOy8nZ0C/zvMaJ8dK7z5mU9zTOPXLG8WFebF6maL2wf8ll/Uuypp5Z1mu
         69l7/mvlw+KnD6khhCz/MX3uGDo2sWJd8svJ5VLfHFa9bN8J+cX7uRZTH2Pd2EEM3qIN
         efILqbphhtYyCJdOOIdGS0YbOrOApkZKMbBfNAdGj4xA9nsDo/J3eWDWX8u4r+JRLo58
         LUow==
X-Forwarded-Encrypted: i=1; AL+hErHvL8R24slUc1a7aV48TqHR06anqdKy5nOBHMw4lcyXzRuP7UrkQ3efvUg2xIrJykX7pzj9OwrTKDjuZOfPPOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8gC07+LoKp2vdd/0GrCz6P+Q4HL4HQwpUQCKhid728ND9SgH4
	T7JtnTMi+BNRm0+j/3r5/QhDziS43K+MKkR32mfBTw2b6z157Yr4yqAo
X-Gm-Gg: AZFdTZcnnYAHEvfQdEbKYnMqc4u3jBpi6OXszFKWBDutKxi9XqHs8TBUQ6tEP7ALqj9
	n8j32DkvFzcgCygIf7sfoc9YAZSai+Dsxw0zkKcCtND5encauTLtoHDH9zomrkzdBoHZE+8wyGK
	t7uCWsbAZ2dMTIimJz7OEEPEne/Fx8OG1v970StPpADfjLqAg0eLBJoL7es5IL9hIho8bOjgQ4N
	UQx5Lv5AeyA+/GQMmieiCcf4mtvzTwXhELu48TkWz/NRsToBzrtP320FGYRUeCtle17ZvdUS4+Q
	APDaGIpmJloFN1x1UiI0qMVQFdrU6RLPSip6NYiIDn45pF2AzW7pLHooPzZ7uiaK6cnN9KfT3Uw
	VMJp5Rw7xsNanz8X//Z6u/o1PdgyVZNL5Kk7KkRrxggLuvcLvi9sutGBfVHWsMuv2jDtEaQ/BRP
	mhjCROnqVI6EQVMeKW5Fyi3MEApcIErwC6AjR3mOM70UBgJ8qlhIU538zzWN+5whMP9jimB6YDH
	ef8+bOd0bFYd3hHvxaPVZC9GwabJx8xA1Tt6KbaG+YtUrgFK50wvmZ7A6Gdt41hdgqHC4lfW0eZ
	YKgohLum9/pnQ4OCvyrhMvnSQvMKhjEI6E/Akny+4Q==
X-Received: by 2002:a05:693c:41cf:20b0:386:dfea:4434 with SMTP id 5a478bee46e88-386dfea468bmr861041eec.2.1795669480162;
        Wed, 25 Nov 2026 21:04:40 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm72015532eec.11.2026.11.25.21.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:04:39 -0800 (PST)
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
Subject: [PATCH v2 1/2] MAINTAINERS: Add the LoongArch KVM selftests directory
Date: Thu, 26 Nov 2026 10:33:51 +0530
Message-ID: <20261126050352.1957454-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126050352.1957454-1-gokul02k@gmail.com>
References: <20261126050352.1957454-1-gokul02k@gmail.com>
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

The KVM/LoongArch entry covers tools/testing/selftests/kvm/*/loongarch/
and lib/loongarch/, but not tools/testing/selftests/kvm/loongarch/,
where the tests themselves live. The */loongarch/ pattern needs a
directory between kvm/ and loongarch/, so it does not match it.

As a result get_maintainer.pl omits the LoongArch KVM maintainers and
loongarch@lists.linux.dev for patches to those tests.

Add the directory, and drop lib/loongarch/, which */loongarch/ already
covers. The entry then lists the same two forms as arm64, riscv, s390
and x86.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..801de15e736f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14326,7 +14326,7 @@ F:	arch/loongarch/include/asm/kvm*
 F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
 F:	tools/testing/selftests/kvm/*/loongarch/
-F:	tools/testing/selftests/kvm/lib/loongarch/
+F:	tools/testing/selftests/kvm/loongarch/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-- 
2.54.0



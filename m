Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106CE3E4506
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004436; cv=none; b=BBMz+h39A4YIKlj5xkoeTgTkJZBDpEAXP0smzt+yrDrJCcg4TTPKfi6S5C7TUxbrbp2Sh12x/FKMDZp/Pm5NjrwvbYhL1Iwx1iuXk/196GsRrtLisVJ5k+0BY2FHjgt7ShPFsnaqD70guU89gS1BE9Sr+nWb/odM/t/tW1LKGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004436; c=relaxed/simple;
	bh=k0hD3nyHCHFB2BQgUJDhbStcyvlUvLbfa+Q4kql3Ps0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tLaKdE92SOQ+EYpb4qXyzUGT+F3CqXlAFxysfQZv01fiPmJWpAHCfZoAwqMOkmyGfDRCd1JZV4j0Lu8lqY69fN/Gpe6v6Li8TubTAEy0kIvIB2doAURf1mOnDcNpi2XD0FV41X0vdk0UP9Io0MtFVlyjw08feESBmRSZJKmVty8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckVzXo4k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckVzXo4k"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49987fb18c0so20632785e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 15:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787004432; x=1787609232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0hD3nyHCHFB2BQgUJDhbStcyvlUvLbfa+Q4kql3Ps0=;
        b=ckVzXo4kEg+06iD3IHXvzqqK51KCajDw2jMVPkZOAJpChp2q1UTvefSVGkpyQS5V/0
         US4nw7+0t6ClkM9MYC0zxZOKwILBH+zYcJSblEq6hhTE2ZLRiSHCLh0DBISO02SJIHuc
         EI7LXKIaifkn3L9+s5/021iIjJdCdrIMAFCiC7hIbhwU6ZZuUkunCiyZbc7c3Z5JSmhT
         qZXzC3R/CJQ80kCvZ0dDuR0N5pkQZNASt13YXkJRaTZ2HcoZmQhPPxLgCwfV5xbzK6VJ
         8Kf0K6wQ62FynXjJVMjBbaT5Hn6BL/lfF61d37i/KpSmOTgGSQRYfe8q/YPK8SRXeiCa
         KmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787004432; x=1787609232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0hD3nyHCHFB2BQgUJDhbStcyvlUvLbfa+Q4kql3Ps0=;
        b=XOul0uOfXvuGEoWuLEHqlZyIQ3Ap8GAUz6HQAuzdata2nUZMHRuHmIR5bF8KWxN45A
         N9ynvMs3wVhi91LfBL0Ix62Q5dOyQNyWXeXCYbcgkEaf6z+nzAOC3aK788y5skc/Mj7Z
         Gjuu/wXaP3TfYugssjaaHr4g6k7B4lG2+xTAJaS7EwX07Qgm/oLDlgpOflr4MgPnSyav
         iHEuR2POVAKreqIife8V/dMQgyoE+4INo0EG0/ravf8N0qsTHjq/DNQZuIqBbtMfgnnB
         imTh1GeqLC+ZraFiyG9d1Zrnah+kFjKZGNlMeUA0TjIGMLSeUFshqFKuEB8BexwGUljq
         Gr3A==
X-Forwarded-Encrypted: i=1; AHgh+RpjdMuzbieF2Hh2xnsWaMQUR8oCTJvHb7giWWcyjsWYeVaM7LQ+XWLrv/Nh34JEr+XqX0XlHQ+mpEjv92HOa8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+sNzVbPehjkb8uunkicm/d+TP8zr+r+RGCkS4Kuo5CbQk3Dw4
	5n3vbp6ygYIa0Z6fBXWLsiUTeTIYpWKOaIzBkW38WOemsgEQdA+qfcp2
X-Gm-Gg: AR+sD11Tma8s0hp7QbXWy8XqvePTatIKh023rooKqUqeeWN/681WuQ5RdxK5zhSY3ZJ
	3VCGSSpVk8xtjUvHvHGqM2hAKfB5pz2z+dkcWeVSp78GPp23GeGmsQmvF+fHVHMndBKAiUoNxPd
	5EtVDgAYsfRRRS4V4aqHHZRFOdRFHisX3o2SnoYU5ifnYBqBGs+1zEEFuOSxShEgK7aSMsj7lZd
	cszaRwu9KlnfWihJRpiUx72e2L4q3gkFfyHobgr2uTiGxWSeUiRN9zCRtPVczOK471JzppJwyab
	oyeiDYKhewt9gWWazW9n7BzgNDB2qEQzkCWrCvPupeCIQcoBp9rfTUD0WdX+CgJsC3cwmKyix0c
	ltDu4mhm9iSO+d2ZZ8/UehheVrvoh75wwCdHkNOH1Z6d1rNPZzSDhwZMVoV0qi7l+lRp7fi1L1F
	o9U/ZEsT0SVL1SJrrolBonvnCseJXBBZEtRAVdbDxgrMEOpWpOhM1pNBxPfSjI7kZtXuTNQwHMD
	j957eD46NaXhQ==
X-Received: by 2002:a05:600c:4ec9:b0:499:8ff5:8ec4 with SMTP id 5b1f17b1804b1-4999fae4f07mr47296775e9.3.1787004431647;
        Mon, 17 Aug 2026 15:07:11 -0700 (PDT)
Received: from hisam ([2407:d000:508:2027:2845:c930:d20a:3e10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998ac6afe7sm192259975e9.3.2026.08.17.15.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 15:07:11 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: kvm@vger.kernel.org
Cc: pbonzini@redhat.com,
	seanjc@google.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
Date: Tue, 18 Aug 2026 03:04:59 +0500
Message-ID: <20260817220457.554823-3-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260803170825.925561-4-hisamshar@gmail.com>
References: <20260803170825.925561-4-hisamshar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this patch; it has been on the list since Aug 3 without
any comments.

The musl build failure it fixes is still present in current trees, and
the v1 feedback was addressed in this version. Could it be queued in
kvm-next?

Thanks,
Hisam

Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA772E7635
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 05:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784872184; cv=none; b=AcC3MZ/kDjyr6JXIBhVjSsNlYk8cUUpclip4sSs14cAwwiKNglqn06l/tsQebDcZm+Ua/kUDuzpH0O+4HM13ote3lRUOd/vGlSOYLbUX5VZIGGHHIC/n9YiNguZ6+atn8p06WXxZ9GHDX4IR4Gysv/wUD45s+4sioNnAO4PJiso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784872184; c=relaxed/simple;
	bh=vTrS6u95axiTXKffO/fG5JQNm//HQsyfvfXU1AbDuVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bfNhAW0Vn82Aq65+4ZMHp3hxCMpRLDCEJ1FBhC17q3aEPiqx6vl6IFMwdBsdUzQ2YxFTKkF2ZmywrvrTi+h9jhQbati2nDyqlyqkHFTl7VE7ATIa4w0fax+U+0x5py1VITCxVi40vyTPYE3LNga/DQCUIElaU5kdRc0Yt5aWM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hVax4+wr; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hVax4+wr"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso61595a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 22:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784872183; x=1785476983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTrS6u95axiTXKffO/fG5JQNm//HQsyfvfXU1AbDuVQ=;
        b=hVax4+wr6k5QfVdTGDMpDHqFbni4gIFMFN0z/RWJY4L1BhpRJH1B0lNJw0zyLExQcP
         ZWknnL4bf3oaYwcntkkMsK20ytEagYgvh0iGBay9qSuj23yqPJUQafjl1Z5qqev8+ljW
         mH2TqGTqEtQTsmfU3OI0RVNVeovFgNH22tbzWCfAyuiIIx77Q7utMQuINuFmMs+9QWNF
         2z5RYHXIe3nTdUaY3z+K0IPy5pb/rRZ3iSK95gYqQ1il28fyw9GS7euDIG7q587JQ/yQ
         Q064z5kcVfpwmYezWtgQ2BbY3Las7es7G7iM1JS5j3OLk9Z9b7FnzyGPmQaCrwAEY9y5
         sUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784872183; x=1785476983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTrS6u95axiTXKffO/fG5JQNm//HQsyfvfXU1AbDuVQ=;
        b=nF1ijBENQFSR46OG/TyBb4Jr47zVWehuuZjpqHWpsIDXj2fNEGV36saS/soNZH1SLH
         0Ge4LgX0w2J50E2T/v+9vm//MKiqbo5ge8oarK33IRUKg6KAMPNyA4WBTkRXTMv+6l1U
         7PH3R12G0zA7xLp6glHsuyChljvDQbmCLYejD5x7SFXIthnyxiUI4xUNO81mICIh3qwc
         4N47qkp9vYpYWtjlvAAsi+CTfQz7WXV0cZzXUmFgW9yOzNexM07Yw+ECySJeZf9Hz0q+
         gXCG0M7l1npuRgCo+ZLZ/QB8OrdZ3fkG+i18HNjLAavDP1mVgjjM8sdpuM6nSKC+0NKt
         w3pQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6oa1QbDgTrii+JzYsH3QNoSnzHJ5Rns0XVh9ZUidKF7U+D8h/kOt1gMNT/pzpdznCWfVBzubYPq45/6ii3U4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy13Bs7twfxhc2roLTzJYDXszuAx+jUnYmHw/UGDGIe4jL1lKKs
	uacSeRSpZGDX4wUqQeeROuk/EB80d6nHUj769o/j+zw8pPf22k2ISZXjX7HtSDy+mCLStKXcpTF
	LBg==
X-Received: from pgnd8.prod.google.com ([2002:a63:7348:0:b0:c9e:a22d:15bd])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d44:b0:848:4ff5:5316
 with SMTP id d2e1a72fcca58-84e2b8a5696mr7008910b3a.19.1784872182349; Thu, 23
 Jul 2026 22:49:42 -0700 (PDT)
Date: Fri, 24 Jul 2026 05:49:40 +0000
In-Reply-To: <20260713020053.3897259-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260713020053.3897259-1-wakel@google.com>
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260724054940.3457448-1-wakel@google.com>
Subject: Re: [PATCH v2] selftests: timers: Make sleep time in raw_skew configurable
From: Wake Liu <wakel@google.com>
To: anna-maria@linutronix.de, frederic@kernel.org, tglx@kernel.org, 
	jstultz@google.com, shuah@kernel.org
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Friendly ping on this v2 patch.

It addresses the feedback from v1 by adding the usage documentation and -h/--help support.

Please let me know if you have any comments or if this looks good.

Thanks,
Wake

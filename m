Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954934D3BB
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770296160; cv=none; b=Inps5bXE58eACG71FeqxWgLJvUfI5/vyf9LhSC/Red5UTPNnOET4bAx12MTh9IFnfh4OTrJL6XtWejG+XrJya/fW0YnnvM+YuSkLWw0Ac4gMgQpm0g6Gy7t4EofHKhhrRszzjhSXytt1mBsK+swmz9J/H7N2VYbf8fNcyFWYdlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770296160; c=relaxed/simple;
	bh=GSF3GMzynwkCshZ7kizNQpLPGCKsO3X5EUXhE/ESrIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OkbQgSPaFTm9NVmNSQNOU6O5lMc3qnBJpwCoP7R2/RPbELb9hl4cNtkxUXO9yfBfQUq9eaK2AdDHW65ckzehzw2s90cTSMTyODK/2kAbq9Y6uUmwhMMEBJ3VmjlKPazxyX99wrwXxhf8CunV2Fc4lfdAw2dpAU5FcpwFCnrvhfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps2eMCj3; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps2eMCj3"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a9042df9a2so5099605ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 04:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770296159; x=1770900959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSF3GMzynwkCshZ7kizNQpLPGCKsO3X5EUXhE/ESrIY=;
        b=Ps2eMCj3FFKPY1nqOrQRxUoLXsl0jd7OA45BOy1NmbpXp5ZaW137McRJV2gKcnNk0f
         rbRX/7qWXftxSiaC0X9cy6BecS9ltdTWTzVErporSYYoZhwngiHkVzIBZP63vWnRGzzX
         fDUOl8MFJbl7aGuu0ZSEDjVSd0QFwDltUd63h/3VmhjRwwJ3LsSYQCDgJ8lyTCZklWte
         PpBaQftFV2qYIiNSiqFwMTj0QBqwsoHSO+T3ElD0VRaUMlQNnvnJlRLBtQJRqyYiDWhf
         cgW7ustzy8p1+gUlewqZEfdO4kNXMHKumVJ3CuCa+ZgH6OSXyPdJ1R3IeXfuWAPSdFbW
         VI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770296159; x=1770900959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GSF3GMzynwkCshZ7kizNQpLPGCKsO3X5EUXhE/ESrIY=;
        b=T1jEo/ulIs7lidpnIkDOhnNT6Fh+AV498y3GKy60W7IB8CH4PvONLuz4CM+zvi3TnV
         J+KK33TdcQCqngBw/Kr3NkA60EQTxhxjEy5l+7aXxpWbu5IJjUpU7BqsLVdF8dzr+HG9
         7nhDjPvH9YhQFJwx/i5hqXjzxNVEGoLL9QK7NTbZYcPa5zhpSYqdPn4uEOKXYLPC/5cu
         RIJPw3Al/GmipHyULhRquuAfeAhog0rX0zF016YfCuaSSfj/iCnWsWCrGRBQxIboWFmt
         ocp+idKZ3diZWpZeXheRtVgdBTlfX0CEL3nKgcApIwY/sj+shoz6Cm0pgVQ3HD8U8DHv
         Ab7g==
X-Forwarded-Encrypted: i=1; AJvYcCWS2KVpJPYM+FlkmR2ia/9dJBnFaDBAwAt9VCTQzbw4AmMPAisHLyDpiNh1Q/4EKltJ4qg6c6GBd9NCpo1bO54=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLjRkO6jpVPNIZ7Eh8d+4JzjKavXjpbslqyzuD9vqTXc3L1IeD
	MqjEqqDCx+UPHx8sVe9sejigaqVO4Tk256oXacxlgFC7CSajrCrmVk8=
X-Gm-Gg: AZuq6aKrW5pdlZtaVCnwpzUO/wfD7T63YzEUYxspXZqudvcSE07imYg3waHv8tEup2W
	6hJjKVSLuJMoEOFH3VVQHvUoVEsaA0XFn1iiuAZQp+C9HFf65/lbMw6xlJsCgSsyDs41/xqfSbO
	sOEEPqbhBxWDwzFiI0S7YI7J8D61AYCoW0m2MVTy317Krdf5FawOJ6yeXxe39nBD4ZDvRvWaX7G
	YYNT3MU7RzwGoyi4IxEZ2wC6G1nRkD6ML8wvSz1NMeg0zEnyd8NrmOAAyjn5XkcunJorFUgAUPJ
	qMmh/fRaJMn5IVtuA3X+mZrcfR5uHDxAWs0eb6WnyhtP+RYNYq0ZGAzc3qXO2be2JgCP0Y/3smn
	Tdh6vrPaz+qV1pqez5BJzbSIIqrO/AE53k0Mclx8jpXKcshRrQlYu4y7fkHaUA60i5rtNACIxeE
	J7eb17QKlojAIwFNg67Wa8kGMpTHP51w==
X-Received: by 2002:a17:903:350b:b0:2a7:6aa5:68f3 with SMTP id d9443c01a7336-2a933fb0cf5mr63521385ad.34.1770296159482;
        Thu, 05 Feb 2026 04:55:59 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93386b5d2sm54006755ad.24.2026.02.05.04.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:55:59 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: amir73il@gmail.com,
	jack@suse.cz
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	repnop@google.com,
	shuah@kernel.org
Subject: [RFC PATCH] selftests: fanotify: Add basic create/modify/delete event
Date: Thu,  5 Feb 2026 21:55:09 +0900
Message-ID: <20260205125534.3286-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAOQ4uxiax3v03XeSP-MRHUqx5WTa67qOjtusSw=M-Tk0zARv6w@mail.gmail.com>
References: <CAOQ4uxiax3v03XeSP-MRHUqx5WTa67qOjtusSw=M-Tk0zARv6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks again for the detailed feedback and explanations!

I completely understand your concerns about maintenance burden and
overlap with LTP's comprehensive coverage.

I agree that improving LTP's fanotify tests would be a better use of
time rather than adding to selftests.

I'll shift my focus to LTP contributions instead.

Thanks for the guidance — really appreciate your time!

Jinseok

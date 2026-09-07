Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DC23AB88
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 01:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788745135; cv=none; b=jVg1dRodrcPjaVV0GUGdziYK6jDA2iHjRnI9j+LRmqwMSw3S+5DYEGeV8nu8+hlAPIeWxUEctQhAwnZ3JTUqf/RiQCTkj2gGkMR+fl4XH6Vc5SEpMphLyJLjihoP1Esm5Q+eaTB17jzTzOTxaCiS5+i9iJSjKdgojr3wTfbktLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788745135; c=relaxed/simple;
	bh=Rcc/NX5FEJFOxRXZ9DDTD7xInDmsvLTzC5w5eWduUkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJfoWXLVlxU2LroL2AvVAV/7M6i4FDZd+UXG8esvUcuJID/HIQqWuDBJREIKVfPUzPJ4lwPkJraGF2aNs74u8ArzluoPuivVdauyOEKPvtM2WVfUIX5u4CGwWR1ihQR2aKc90ASY4xO14IAww+/rwxdHg7zJEzKlHbWdX7qJj88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAcq3q5L; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAcq3q5L"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d01663d816so20098925ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 18:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788745134; x=1789349934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcc/NX5FEJFOxRXZ9DDTD7xInDmsvLTzC5w5eWduUkk=;
        b=rAcq3q5LGpkv0Pl5cMfV8+G8mepihWjJKUBCY7IADKf41AzoHkCjhSb5ilbxbPkXKX
         KA/ZCN9pUY9ilGmzvDGmS2aNx5Bldm2u5nVERQLVyi3fRsynU71UcgamIu4448dav0Mi
         6YweFLcS1cJ178hzrTgIlbr6EPaaryM9QAPbjLX+jolrDP5jUiSqYMHADzqxb26y8eVH
         JpBHWtJuw7INLx9G7zDNHYZQRTJvLZPR3UvuxVG0t6f2CL0jL+5wi66K6no5rRC9kEsM
         KFrH9x/Ui8cuxqOIoigvGjODhHP2zA8GO+zgOPRmJB55KFVhA1R67vQLN3cCyYYFWG6d
         yj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788745134; x=1789349934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rcc/NX5FEJFOxRXZ9DDTD7xInDmsvLTzC5w5eWduUkk=;
        b=NRaLA/jli+UpPlNL909WYYRgcZrvTlQptc/kfwBYaU3JDS6T8IWX+nrwGaHMyrqBXB
         hX2XFd7dw58IAcOPm00Gk4Rcu3WgKuwwFmcCRbBynnuTKAtFh4kgpYUf+7hmE19kYnML
         ktRV7LOkQyKhxSNC45XhWXZ3EIUzzSzqipXCiEevrJUjlYBfV2cKstMHMDzDtDfMz+1o
         C263GPYLXqcAkPsiidH5RsFajHEnNyWUmZVWlVLVwrYSsh0PONqgpvrnxM3nzg9oPiPJ
         BGfF952EalH3itt/wfLA+7vV0W8DKOeaxfSgzIVcm1ThgzDccSI4hb/YCdaER5gOoaWN
         dhlw==
X-Forwarded-Encrypted: i=1; AKwUvByU+Gvbcs29MquOXOVYG88U2e1Zv8wHT5nynTHel9IzfKzGAeojSyn08BKXCF3HxWlvKf+xBkVY4/Dx7U9wod4=@vger.kernel.org
X-Gm-Message-State: AFuF++lPMrv74NyR1nb88uLOw0PzbD476j40uOyXJv8QqPB1Q2NqQzQV
	ib9tN0GyLfBDZriDxGkmmQzQrPP3voqKz+Bq0wX47+A81ww2iAZnVve9
X-Gm-Gg: AYBFou0lOelGcwIuAdxDFWJo4t5WELLxjhUgt84dx6sguTLSKoh7pofiTiDYcO10KZe
	EHXTWHdr0JU67kpPP15AfHLXbVQcm5r7RARSg3w8cYFCxE4FCXCQiDVTteijCmx/R8WO/Ei4CCY
	3hxQRfl4IqukUrZYFKcDmrJwJCo7NgRMaSxdHvUEjTltq/XfaiPmzbibt/TOqwMhSYFRqjgWjzP
	rXSox4dyIzHvsIByKJ2E/5Jref/7CMBMI3JtnhDm1zr33gazwXtMx9g3sZB2ILrmjWpyD/J+yNE
	wIImaEMjE8jZDWJk9nnnFBW3cAH5dHT9EY39tHCdQjxIcwTiCTOmQ8vvz01QlppxiAb4X6xW1x4
	JJSXhi7x6Ee8HPPtEJ4L40V4M2UwpT4cM4isae27D4mLNlALO4pz0FQNyjVyDympItnhE/rE339
	6t5MKpsOMeRjSkWZHRko6zAWpB9YwQovD0wA1vYgvWypWSMxFbpb+tvjDz1BMPeCyE38Lc4MolD
	T3WkIjoOdC47D5G757kyDVNnJo576GD51EeYLFbXlRtF6lvMK9l
X-Received: by 2002:a17:902:b114:b0:2d9:1dee:43e3 with SMTP id d9443c01a7336-2db12757f17mr188382005ad.18.1788745133792;
        Sun, 06 Sep 2026 18:38:53 -0700 (PDT)
Received: from secrnd-cstp.tailb7f510.ts.net ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14996a3asm36305435ad.46.2026.09.06.18.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 18:38:52 -0700 (PDT)
From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: Sanghyun Park <sanghyun.park.cnu@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Pu Lehui <pulehui@huawei.com>,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>,
	Xu Kuohai <xukuohai@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 2/2] selftests/bpf: Cover attach type checks in link update
Date: Mon,  7 Sep 2026 10:38:19 +0900
Message-ID: <20260907013818.51624-2-sanghyun.park.cnu@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CABFh=a6YEtiZdcC51LXbZKTKWoXxCk9PSe5jtn1R-w_EWT4aUQ@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Emil,

Thanks for reviewing both patches. I'll come up with v6 with the things resolved.

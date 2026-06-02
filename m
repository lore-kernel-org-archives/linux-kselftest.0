Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198C6399D0C
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780435604; cv=none; b=SlzN82YWBjZri1whLqezLv7XVbrR1UHqgJEJ58IhotWV0U8OYv6y+MXSwg4i2mzQ5tWdtQ6nSdnVP07vd4KRXB+tj/AKF/hoDNF+AyeGGRWcJby5IMz6H0MZ6QhxNrj8L7XkGp0a5RzmzfcmbTMUkuVDIME5+8ZooWa7rXoRdUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780435604; c=relaxed/simple;
	bh=dXfphc9xwtT9J9Mx9nqk/TREcXFO8JL1ydyTeyM2RLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISEgOeAg5Rf4jQdDfCgYWqrLEm559Hyi0uqXaUNKVYIEWVc9dj+vwPRF4O2l0r6fGFp5nW0hpaf5LlSJJEVkhGXRVylbE8QnDn9uflr/RfX5/vWN0gxBXTJtccotF1X5iSvv0QpPbiadiLfkovDNSaLSghRADIvPxOW2eHxImBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgnzSV6e; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgnzSV6e"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so6928189f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780435601; x=1781040401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X+F9JE3lvSde2aXKa2nn0C2FzfJE3VdMHUXsv8Plio=;
        b=CgnzSV6esF+1TCJsKAi+5U7iGvsASgdRpAR7RUZ0iAZWg6Ry8JXDzzhHDg4R43PrUP
         4+PRNws27ToP9i6eKFlE0keA6Rl18gc6LqFlh1Jv+kOg+Z9JfdnT0KgKbtF9qaPcmv7C
         XPjz1Ak3aVKiQiHXG+7Yew35qijmalM30gi1T8QSdVMbxlJFX8PJA4Cf7N2gPLDKM7yL
         q7FpeX6gBV5F76UOf1YF4AO+8nbUYQauoE6ky0H5zqB761ek8tBDF//qLoQo3aqImhVc
         2uhPM4plPECUokU0erjQXYaWI+HHyx/K9gKuvAP+VogI8EnLeoNjMXEKuV/pbSnv207G
         FPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780435601; x=1781040401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X+F9JE3lvSde2aXKa2nn0C2FzfJE3VdMHUXsv8Plio=;
        b=coMt9RdZkPBErMJKEk5stxOlTvvu6B1rPB7OeDTi/HMVaGcuQiTeHuAz2rNBiWIXgf
         FNyoNrtd6lP3DFntSPOXsOnsiJLULf7mTvdzmEpWzneUhqYhbZoIqL1d8590knSbabfP
         QoCArQQ16WmVIYK/yvckkLVDMwgqGm2DCMR6BhEpWg/oeG2lTvXr9o7ug5yeNyQy895U
         N51SIM4cn5YCIVJYMCN/nLADVyMcSH4nr2y82lfczWLQksaohbEAFsqDZLfygJI4LUgS
         rljqVhusx4XOTt3uLEegSB3g7N0ccUwxOmGoyz1nrIJ/3ShMuc1iz94DiDICA0APH+Xv
         MLAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qSLH/GbqdrrYSH09cMQh9iXu4slVjGpfd2Dk60eheC4UaCu5EGSasIvvJE6EKm4XwIJ/nS4YrtdPf146eQCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTw2ylLHM99HkQWtwUMRgLEIc8zk9onQxcItCZOsJRDsnUOTt
	+SSaxoA/ZEgB3wgS5oRFnDz73A34gavQhb2xCuD8iKm91bmWXAYG88+v
X-Gm-Gg: Acq92OE3ja0SB8sWOlNP/laVy6bsfAzHrCAe5AKbLihf/8ZfaOnxbMZgxFRT2pV0tCN
	JQ1XcW7LMr57zAENn369I2Mn7gsNupNMRM2j0HcSKToS0H0vZXaxfHm2OixGQc+wEFMK/D7zZ4a
	eglpgmbd8raVAqDsD6hHP2R5RINmVh2tyFMQkJlVwvI/EmKEPICxwb+njJQgOtukFkEHVoOK1Iy
	QuxcgGClyW+GNmN4Wd4o32/YCCHEgL94eec73xY09h1Stsko1fcNEES/RhJYIwCXseMx+IjkUyV
	3a0QUHcwNVzf6gRwArANBaPStkvc6T+HoPCNIVzXtfFJCJHQpLXiEP/XLT9IFMp4xOaO4ldOq5b
	xqekdlcdFRatYm1d2pH2h5iRLCzd6EgwV3chqoK5HRyA+JgzXeUES3VyVdEhwi8mVNwa/OgNcQM
	V9LbKvC2XmJkUAEzpa9w7b3jiaKxCPoQ==
X-Received: by 2002:a05:600c:c174:b0:490:b2a6:8c2b with SMTP id 5b1f17b1804b1-490b5eb82b2mr8862715e9.10.1780435601484;
        Tue, 02 Jun 2026 14:26:41 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490b614261bsm2203845e9.26.2026.06.02.14.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:26:41 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com,
	aik@amd.com,
	akpm@linux-foundation.org,
	andrew.jones@linux.dev,
	aneesh.kumar@kernel.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	bhe@redhat.com,
	binbin.wu@linux.intel.com,
	bp@alien8.de,
	brauner@kernel.org,
	chao.p.peng@linux.intel.com,
	chrisl@kernel.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	forkloop@google.com,
	hpa@zytor.com,
	ira.weiny@intel.com,
	jgg@ziepe.ca,
	jmattson@google.com,
	jthoughton@google.com,
	kas@kernel.org,
	kasong@tencent.com,
	kvm@vger.kernel.org,
	liam@infradead.org,
	linux-coco@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	michael.roth@amd.com,
	mingo@redhat.com,
	nphamcs@gmail.com,
	oupton@kernel.org,
	pankaj.gupta@amd.com,
	pbonzini@redhat.com,
	pratyush@kernel.org,
	qi.zheng@linux.dev,
	qperret@google.com,
	rick.p.edgecombe@intel.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	seanjc@google.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	shivankg@amd.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	tglx@kernel.org,
	vannapurve@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	willy@infradead.org,
	wyihan@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	youngjun.park@lge.com,
	yuanchu@google.com
Subject: Re: [PATCH v7 34/42] KVM: selftests: Test conversion with elevated page refcount
Date: Wed,  3 Jun 2026 00:26:30 +0300
Message-ID: <20260602212630.27012-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-gmem-inplace-conversion-v7-34-2f0fae496530@google.com>
References: <20260522-gmem-inplace-conversion-v7-34-2f0fae496530@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>:
> This test uses vmsplice to increment the refcount of a specific page

I recently submitted a patch, which makes vmsplice equivalent to
preadv2/pwritev2, and it was accepted to next.

For now it is just an experiment, it is possible it will be reverted.

https://lore.kernel.org/all/20260601-aufweichen-dissens-ausrechnen-0d9b84728113@brauner/

-- 
Askar Safin

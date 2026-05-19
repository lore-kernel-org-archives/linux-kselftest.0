Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F73DA5B8
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176044; cv=none; b=dkDQb0Y9GavUiNydwLCe6zpCZfsJGLC8PyDgSSaGKia0LtpKonaKxjD9uNxn2WlyEWDVXEj9QSpNxixtqhnUTI/3GrppkHLbh751GL2kUp1/EpaMBwRY1mEngJ+JbOn6GWs/VIRLMnqe+nQ9EYPyxMFrehC3VlZxCvBoR3/U3JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176044; c=relaxed/simple;
	bh=Q8sRbbzeaOIcO4WgX9w/sPLDmiN17iIPXjvqTnre0mc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mVGZ4QX3JwiCbWpnGsR3ptBIMj1JPL1+Dj76yZS+rfackLDev8AdGHr2A9PxXOF6P+6YwGVHtWYPkDaklqtejl6lco2ltZt2cAWWxap9WgYg64FDSGWS3AYB0y0zePqt68Id6xDshjoezNdwqfJNswIKAxgHHuMoO50qGnenZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bihoaq/Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bihoaq/Z"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso32772765e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779176040; x=1779780840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQEb3SnKmUgEZvX6aq8UF98SecrpTH59w1+qmzmaGdE=;
        b=Bihoaq/ZHArooQC3y5pEH4c5ffjtBSl4jlazy4BEGUtWxcPGeEWx6bzkWHXBcMqAZ0
         qmWc6rvhJMdqewjXmHr0m7O1EhHpv/9zyOokLVuHHC5Q6Q03DYbynITxcn+YhbZ9vHxw
         cMG9EaiYeWWRISpmJGN1b0rsT96GejkY1TcaMNwdSMXnID3IKi0jhw+OXDBxDDYGLCOZ
         2+bX2NfCgmo3Bql5dPMafe5Ml3ixRXGTg8hVlOQAd3mkitmNxgWB7zfo3J9oh1zksUKE
         jMDzUHnFAEDL11GVJoM3vxCaUzZXNp1E0fNUGoxYcaH3K+aIDoussof33j1DIhLIpORz
         t5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176040; x=1779780840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQEb3SnKmUgEZvX6aq8UF98SecrpTH59w1+qmzmaGdE=;
        b=ieU+kpLuGb/7UjtBRUcoGSc0ZROsLBS/o96s6KMvkUCu/+9u8C19K0CBwQ5hyWRrXl
         cePFgvzcqdBbU3lRXOOKDfkmumxhZLYCRisLsQW8lXAuDUHc1j3izEc51gwIjG2msWcJ
         y7/Nvdkaa+dXlm+wkHsOKeUKMKFLURQL+fQFfyzncUOkjNxyCIWLutXqLKP30hN3MANU
         u3rrXHLXzlLKl1otcnDP2/yB0NjT/e+HTC+ZJGwBXX6j799hicSpIjUdA95ZVZVX8iqc
         Kp9IrRzpRyZ//+VV0q+EvnDda5UH8E0ZOqcLdJ5I/sJMWrQwq44Yr7I1ceEy7YGGDHbL
         x+5g==
X-Forwarded-Encrypted: i=1; AFNElJ/bjJhWMo4omQcFsazPk2DLSSdEcfBOEuWrmPEqYEHf4g/Fa3m4RNe4w74rXNfzu2E5ikCCvkrq7Z/JgpYA4FM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0YOl4yd43Uy9BeEsiefFuXXV0hkm59RK+tHku6YfNlV5rxub
	wAsfAfLC/j5ZjA+OfclF7ORC8g1W1P1n4Vp0RUn6aolTqPPdOTRnHgbY
X-Gm-Gg: Acq92OHgEY28ToIiu29LY1ekqFOWZXxut9p4B9kIpcxQl9ziGyJw+CdtVMjjEPeomjp
	nZAmBL5AlRVMgtGcsYc0mkxmsqRYAPuDFHZ7T6l/mlsOi8wcRobAGs6ai8mRqSbSYpIJdZyntFs
	qrT3QKkJSIfdEtShWwSZFqZTSZvjU8FOHWk9EoDeg2SCGb/8kQtSllBIHrZIdssBLGbv/gf+JOt
	WHOnNzZN6/myq9O0aFg2L1Fiwl3aTpGVmjdx/TGAdLKLt9djjxHMIB43TlItQNs1103Wdq5aRNF
	vCHjAziZcfVWFPiUfMIC8NSRq+nF5Qj2+dPdwlLxoiiLZ9R2Ih8viBNpgEEzsQxqbb0zd4P6A0a
	LgRwTXPJv1gMR9Gz+6Vtdl5+GBaXfkUd2Pcx+8XnA3gpz9CzPQDd4xpUic8JoAI9l6S/CJLPbbO
	jIzv6TeGNPsKK5dbXo0crDVZiJo6Rhvhj9ObbQ6GqGlprzU1+e0Mg=
X-Received: by 2002:a05:600c:1d09:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48fe537fb44mr240677305e9.11.1779176039621;
        Tue, 19 May 2026 00:33:59 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm191476755e9.2.2026.05.19.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:33:59 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: SeongJae Park <sj@kernel.org>
Cc: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>,
	Maksym Shcherba <mshcherba2000@gmail.com>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/6] mm/damon/sysfs: implement update_schemes_quota_goals command
Date: Tue, 19 May 2026 10:33:52 +0300
Message-Id: <20260519073352.16587-1-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519001703.99264-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 18 May 2026 17:17:02 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Mon, 18 May 2026 22:09:28 +0300 Maksym Shcherba <mshcherba2000@gmail.com> wrote:
> 
> > Add the logic to copy the current_value from the internal
> > damos_quota_goal structure to the damos_sysfs_quota_goal sysfs structure.
> > Introduce the DAMON_SYSFS_CMD_UPDATE_SCHEMES_QUOTA_GOALS command
> > and integrate it with the sysfs interface via the 'state' file.
> 
> Could you please further elaborate why you think this change is needed?  What
> is the expected use case and benefit?
>

Hi SJ,

The documentation (`Documentation/admin-guide/mm/damon/usage.rst`)
states that users can read the `current_value` file. However, the
kernel currently never updates this value in sysfs, preventing users
from reading the actual metrics.

This patch series implements the missing logic to align the code
with the documentation.

If the design intent was to intentionally keep `current_value`
internal and not expose it via sysfs, then the documentation is
incorrect. Let me know if that's the case, and I will send a v2
that drops the code changes and only fixes the documentation.

(Apologies for missing the cover letter where this should have
been explained, this is my first patch submission).

Thanks,
Maksym Shcherba

[...]

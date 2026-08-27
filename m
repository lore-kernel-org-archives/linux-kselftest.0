Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA6E33B97B
	for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 07:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787814540; cv=none; b=KsC0JyG3MRaF506JsVFAL6gvvYdsN+fLisVaN6vUqAyRBRtv0Vh/a9bCWqgsUyysXWUsDlBE8wTO6AoWaJV9VTuMaQw2xak26Wa6Sv/Q06eqm0SoL5T2eRBGE990XAvUzvyQQq5KsgDv0PlsyF6yxI4pD9MCWS/9nXyhEHRbRg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787814540; c=relaxed/simple;
	bh=sRd78QSJGil0ZcUwq3GxqGHQF3GnG4W0ymqk7CGnnE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1IZi3qoveUppzsIP8VmkpKt/YF+VMfqsACTOJR2xVpAk2zOJAj+ifx/XXXm906cUnBHPefW+98njWINoLlH2znVDApxz0WEXse2WZgTmknepoC3N1YwQL4rtVl8jSL2CmmR5kLRvDYnL6rELc1po87dkmX4ObmPif/2MmltJm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haR/eqIa; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haR/eqIa"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1250902a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 27 Aug 2026 00:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787814538; x=1788419338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRd78QSJGil0ZcUwq3GxqGHQF3GnG4W0ymqk7CGnnE8=;
        b=haR/eqIaTOhAA9p741xIu68tyWti+IJ3KXLfj8ZaJ87VR8KjzOk3RC6eLl9SrFlnaS
         aPsGxzhz2e7/2Nyy17ThiYBApAWBMia6LWQSMD98FqpZVySqIloMPVxfu1GaO77OhLPf
         pE4idmQp5Zr0KFJNEru4LhhcWxlgHECgby/CFJnw/1qTed0hZV26FJsFS2XGT5ICtfde
         TmYYwjUojfD7aUky/QoaAjtMDC1s1xFHb6AWBuFL9HgCTtRa/A4GHOd0j2MMRS7XzLtK
         RLLeXzfP1yz17ZvFtY+6PVHWk5hqfv0+I5CMA3umvUeFawwsDTvATiJUMdd/JINjekih
         SPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814538; x=1788419338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRd78QSJGil0ZcUwq3GxqGHQF3GnG4W0ymqk7CGnnE8=;
        b=E7qd+yFjvj9juPrnIkWvuBPXn5RZnZHfjjL38kowuHBuUMbcJgGKOyMo8YND+clY1R
         znrliPeFVjlCJubvZseYoUjkPGy/x/zkjEmS9fxziCp7Gk17Z59Dv3l3pDOVUlLfdBxB
         BUQsmjg9uPXKh+LTtR2zomhqhHw4Kd1hL9J8QnujmLIvhTQB77sPvtUSvvNprGUEAtzF
         bitzXj4P7Z3iCnCbcTJThSIGSRmCq5xou8enZ5peoxVyUnDw60BHFOy6u/Z/PVMNzuJp
         0YXZI3gduOWmb1/YPJGVPmNIdHt0jE12e3V5CE6ByIm+4T0pVykRP1NyNCnDwEUoOA98
         Ajig==
X-Forwarded-Encrypted: i=1; AHgh+RojMMoDW02073fSS/CNJoF0wRXpsiZ1juxxWgAKX1sdDb/buyiMAUCuc+OSS6D5jZzLwWIUHlW2cVSeTvRGeUM=@vger.kernel.org
X-Gm-Message-State: AFuF++n36J+O1nLSo3DMK52evJA1PcxGOFlO7KfMH54A4tgBquSewYZT
	bh80+lZOPcvIwCGW0rLjE62BXjd1v2iVlPKH8H9c7Gz8Ec4o/LH+Dpf1GgKnc8b1
X-Gm-Gg: AR+sD10kCpPijDha/5J/aY9jysCTlHsNKNIq0BxiiXviPeqW/zBLw2Emw53mpoepnaY
	G0QOj2oJ0AHr2g5IZQlVhuMzdoVnu3ctEyc7J7D5EuumG5W4aO9LqBAr5c0OhMgHaPS/xm2fJXH
	UJis2iUNUR4+arVOlt1uH97KrLfl0xw5ZeM7u4HEMsgjehX0cW5icLEUj5g+nf7DosYtHVsZfrY
	7LrcWb6jJjBaWdIpbHfI2WXcPnoDKMtpTC7dmWBrqhJ1aOY2ev+Dd+qR9PnvCpi8HBtncXNCN3V
	nyFEX/vm0f33FyhNZ2uRrZLdhNenTSYBXzODhBoOEuWOZzvMb8cMDf3brEgfhO3NdqTukhUc0xl
	1bNdBTemZSOA1tmHIOzPvI+jeNaU4hexTq7nIWQ/UQK/3l0Yg4o3NAj5louS3CC98SdbLccd37U
	VqAv/n5LnBaU0V0GUxh/SKrlsIApMQ0vt8JKfuzwTgSZp5HcfObawC+6kf9KtgyQvWlr43FL0EY
	ijnkcY15nm2YOjd6yYsiL6njyj2
X-Received: by 2002:a17:90b:5102:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3966d370333mr28339383a91.3.1787814537645;
        Thu, 27 Aug 2026 00:08:57 -0700 (PDT)
Received: from Anshuman ([103.161.223.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd82sm13559447c88.2.2026.08.27.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:08:57 -0700 (PDT)
From: Anshuman <anshumantewari123@gmail.com>
To: david@kernel.org
Cc: ljs@kernel.org,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mhocko@suse.com,
	nico.pache@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	Anshuman Tewari <anshumantewari123@gmail.com>
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
Date: Thu, 27 Aug 2026 12:34:07 +0530
Message-ID: <20260827070407.4108-1-anshumantewari123@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ao17EcW1-iNN4Y8i@gremlin>
References: <ao17EcW1-iNN4Y8i@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2026 at 01:20:59PM +0200, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
>
> Nobody after us needs these parts of the argv[0] string anyway.
>
> This patch is inspired by previous work from Anshuman Tewari [1].
>
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

LGTM, thanks for the cleaner fix.

Reviewed-by: Anshuman Tewari <anshumantewari123@gmail.com>

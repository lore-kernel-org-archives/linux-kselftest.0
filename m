Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB883E958A
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334583; cv=none; b=mIM+lBYtqrvqBPuxKDsPDbVquTEDcAbZ9lJDjG27qIM58wVC8glCyFyvRwlnpYdtXuCKQUBt8EwKxNgeljF+bo+8YlWsI9Ue1p56x7aX4SsNnINUgNw5PSpjFgljqIw05CYx/bJusGvEGhtF9qemBOMg1BVNsW1OAPXFHwkCnhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334583; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaicUOJAnxPk38vM/r6pPhVKq/G7GnQauhLvZRekYziesDSXh93+dNqfdzgnItkIEPaM8zYdkP43KHjkAq6OfhLee6TtTZKb3pwCa950+Jwa5v6U8y7VzAkTBJy0FsnyPUUO12xb8nFffxUnWUJMleSmR6oGGSM/EU6mNSf0NpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgBSwq0X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgBSwq0X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so9768315e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334572; x=1774939372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=BgBSwq0XGX55XxIPHkyReappFqNPHlYbS9wRox59BhY2ggelsZwG3qm3tAES+H8Wo6
         xUxtExLkAphLnNdwGId6ojdg6SNgtgBBoWu25lX0PL7BglUtngFLRhI/95DV+Dp8nYav
         Z1USzY0G8VLWMwimeg+bCFqrnrjOfYk99G9fxAxj9BqAF+lEuR/MRzxu6NXgpynfFwNm
         6X7KzIHSkh//xhBxNDrv1kroTDXtZUaMw3uhbGltsaCATeqsKT7VglrUHHUWpsi/vBAt
         QisqXy8QtY+5GTVDlCgt1n4pipKTAmbiCOXtOPi0V+8X3CDeK8CpNOVTc5Nsw5JmDM4S
         ZPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334572; x=1774939372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=P9ZGGHHUwYisUFSIbV88I3YOfeYVF9I0DXHKwEsa8zpRcxyDR8xQ+9B2vaBow6VtHr
         7XIb3vtTBI5VjIHy5Ms1ik+9Lyq20R2cgaJLzPCgSFOT8+lZLVgfWhjc/rdObSkgj5n9
         ChYvwiGSyDDEuKEqwx17y4hxFgFUcvcGieVkX5giyXRdhJykq3hfp1feT0bERkiyVAGQ
         beD3o/VM66uTs7U8lnXLC3/dC+ZfvolyR63uHC67hMlNF3p7MzDdhtiLNoQXmrLp7r3m
         1LJOvItANR/fknvGc1a9pc5mCLSAKh80iJTvHcQRs1DuyJQWJcjaSXWggCkH+ONX8fbc
         cieg==
X-Forwarded-Encrypted: i=1; AJvYcCU951uK/OPtej11eab3vyr1y/91FUh+pmH08KXC2CgLmTvVcjrP4vVbulw4WqZK31eXcbp9heJ2F7Ppm+gX9kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YywM8wApHBnWzeb08hsxE5jCDHuZ2nxCzSo9LDGRuB3tRpOlfk/
	cXO/SikVRWYxBd/siHc9nFIdYoht0as/R8x+hWSpFfQxXBMLO64l7y9j
X-Gm-Gg: ATEYQzzSY6Tmldv5Fk+Sbtdr6kpLOiUnRh70IG5N3yUHej4j7Vrr7624o+lblzHRZLi
	l3b2QTaoMNRFaMbiiHk19bTtZM1opcKq8aBFH4X5np70WWfwCXT84uXGJY+3j4vTrY05e6ZfoMq
	jJSlVPljQng1YLFsZHFXdO6pMoc0ChHoGZKAuZHIcZO8Ti8r2UaE9Qt1V6UVeWcyrNemLceGwcG
	H5+bD3WmMEKuS8Yg+mCV/wrtKL+j/aKiqA9yQHJdvPS4KHM/4wTEgoJM/raOG3r7JaNUJ9e0frE
	YJ8Lf1ZNK2PAo83KZawkXR7wrCzko3j8ZQdTVLI7Mx1L0bcUNBzUv5i5ElNDUJHe1KbpH8BLyf5
	eWtnGaLYjX7BQNok/DTrh4OVxRes14vaARhvy6KbQC5Iivd6Gq7T8K2Llyb0dESXdW04O28PIwk
	B7psBE0pKFNi+7p2oqY+g=
X-Received: by 2002:a05:600c:8b31:b0:485:9a50:3369 with SMTP id 5b1f17b1804b1-486fee304c4mr210200845e9.29.1774334572299;
        Mon, 23 Mar 2026 23:42:52 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48711116cbfsm10881105e9.35.2026.03.23.23.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:42:50 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: dmatlack@google.com
Cc: kexec@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 00/24] vfio/pci: Base Live Update support for VFIO device files
Date: Tue, 24 Mar 2026 09:42:47 +0300
Message-ID: <20260324064247.3271583-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
References: <20260323235817.1960573-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin

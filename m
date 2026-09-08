Received: from out-zbxj-a77.jellyfish.systems (out-zbxj-a77.jellyfish.systems [198.54.127.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9954EBACF
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861384; cv=none; b=K4xtczH3TZNzA4MjuQ1RCT5075N5Mfq/RVJTmy2ybqcSoUB3Xt71ZyxQ6UzJuYOsBKjL06SUE3tPDd26y40X7nFvJA4Ue1r6TRpv5AAukHAnL3uk4Id7f9DDBufIQuzYMsT0peQAwOkhviU5vYtE+fdJXkrtseq45Av5QY2irFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861384; c=relaxed/simple;
	bh=vex2Z7sk6yPXZz+/u0iVKmqeypvzt3JwnfHpdqCuCKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C4FoW/fnSumUfWAzcPxykBJgQqD2FMx61CgChHQvJUvSG8muiG8wXQsDfyUNto36amTanoOVCQrtpzpTmPjRtyhjRSPVbWu45dCdCj1Lo50fgByThzdrgPyoJBtN8M/pXblfiTnRDNxVN1SRl1kMPB/v5FihUUq5OE9ZLrx8Qis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=DOSSsjQb; arc=none smtp.client-ip=198.54.127.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="DOSSsjQb"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hfK820ZX1z2xMb;
	Tue, 08 Sep 2026 09:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788861366;
	bh=vex2Z7sk6yPXZz+/u0iVKmqeypvzt3JwnfHpdqCuCKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DOSSsjQbdN/z7OIrg9U4fpJf+gF27UzsoJU7SIiwOhePNsP9hOIH86Lq+YwzYyOIO
	 V4KfB4V+Bhll4ZQO1ogTvJvzoT7ZRHwTNgsI86SQhrBeDapcQmGAMyKMMBCqrvS007
	 amy3q1tRlGoCXBWnrXRjUSYw7g/Zq9c8c3aY2RWt/NSgOiouCO635eY8gtr+1N9odD
	 iPNSteugwez7jHnBRGzfz9sg8BJ5oiiXmfqdJrXrrvj8qED0IiwG2skeCve5hi43+p
	 RXs4wFCE0Tvi3R9zXQJCq6dWQwq6U+7moCHBlAvOhDNS1cVKBM7go4U3cqVXOfbNel
	 TVdyyeY3r9rcw==
From: Tianyi Chen <hi@tychen.cc>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jsavitz@redhat.com,
	hi@tychen.cc
Subject: Re: [PATCH RESEND] selftests/mm: Exit on invalid command-line options
Date: Tue,  8 Sep 2026 17:55:34 +0800
Message-ID: <178886112560.138404.1757557703285138272.mm-cli-review-reply@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <519ef70a-679c-455f-ba5f-3841730873a4@kernel.org>
References: <20260906135444.749144-1-hi@tychen.cc> <519ef70a-679c-455f-ba5f-3841730873a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Thanks for pointing these out.

Unknown categories were not validated, and an explicitly empty -t
argument fell back to the default selection. A missing -t argument is
covered by getopts error handling. I have extended the first patch to
reject empty and unknown selections before setup, while preserving the
default behavior when -t is omitted. Validation uses the existing category
list in usage(), so there is no second category list to keep synchronized.

The ptrace_scope setup was indeed outside the category check. I have added
a separate patch to run it only when memfd_secret is selected and its
executable is present. The behavior when that test is selected is unchanged.

The v2 two-patch series and focused validation details are here:
https://lore.kernel.org/r/178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc

The real mmap and memfd_secret tests passed in the guest. The configuration
write check used a disposable file at the sysctl path because that kernel
does not enable Yama; it verifies the script's gating, not Yama enforcement.

Thanks,
Tianyi

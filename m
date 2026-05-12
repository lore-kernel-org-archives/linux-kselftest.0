Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429E523D290;
	Tue, 12 May 2026 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595052; cv=none; b=bVAR0R2kjvsSFcJSsm2BbScu0u1G98v8j490S+Zfx8DovSQTdl6TxcAf1EejblnqF8xXZQdUxY/VKlWX/ZKowPg7fOEQRbhSBVH0VXlIzKaRWkqwGLuraMLxD2ht3kw5C+7O7YVpnljl88p7XITXhlAOhnoUprodIV6XefoaclM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595052; c=relaxed/simple;
	bh=anjlqCUoPbEaiZ19uaavn8uvI4scPPxpypmtBvx16XE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fyKib+syiNBh6qUQDuPum/3jo9j1+N8Yf3yvYrKYALVPeGsaz+VUju6vo56gtr2vjfGF3he1gAkrc/TP/LbN9rHWIJrGZh51OJCEk7/Ni4m/1zQ0WY9an89NtFT8I/LXleimFGDqttmzW+KBvMvi3ZWxaGutvdWZ/R4JH1JC7bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLBC9DHS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLBC9DHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B8FC2BCB0;
	Tue, 12 May 2026 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778595051;
	bh=anjlqCUoPbEaiZ19uaavn8uvI4scPPxpypmtBvx16XE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SLBC9DHS28emqubhd4NrBcWrLVdJZKmDve1jZ/ycL5EUF0aCngHlZRI7Q+ac4+jSv
	 Fn/COdzXAZxzZoGd4N3+4cx7wtfAB39uxiA0ZmaTK3W8m70vm8n2mobaZyty34a4OK
	 Y5FIlJVilBNancIc9JKK3hr/zQX/zMPxLno5EEwZLXsFPQ5EgnzArTx9kbyPvViC/G
	 y2t5JuwbDOG2KGkTSdS/GpJHTH/AwDH+mqQujcjeiIECewbsH4UltssS2a1fRwkGwh
	 4adPzZgqCLoD/37zMVOHgPk6OfIFV7IeqWy9V/9evzeGcFrZkvXklp2Cv8JB3jmq+I
	 xddlA+mWYRhcg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH 5/5] selftests/liveupdate: Add stress-files kexec test
In-Reply-To: <20260414200237.444170-6-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 14 Apr 2026 20:02:37 +0000")
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
	<20260414200237.444170-6-pasha.tatashin@soleen.com>
Date: Tue, 12 May 2026 16:10:48 +0200
Message-ID: <2vxzh5ocafbr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 14 2026, Pasha Tatashin wrote:

> Add a new luo_stress_files kexec test that verifies preserving and
> retrieving 500 files across a kexec reboot.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

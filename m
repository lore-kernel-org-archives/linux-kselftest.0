Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497B91C84DC;
	Mon,  1 Jun 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323602; cv=none; b=XMhFcNEEACWAMctEoJBCqpxMxhKe0FuD2eKQsG3ojMxZqrh6Nq8cK5iYB3I4jTBUPPQlPSjhPMf475C4dj3H0qlIcbZ9ECzLKsJSwe+8tpcUln0g/W3tr3zdnY8FqZDZu/QBjmmZgDMocS89+JKoV6YAbpI3bIATcnX/T/gjeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323602; c=relaxed/simple;
	bh=gTcBWNbT9agy0S8H/JO3qkMSLHQCDoW6gAoJAtnC1/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k6b8gjphzZIKPH3Ld/GQRxSMqs+gIH5xtVbJL18Mftc6c64JZiza2jDvVk1SduPt7TtxwLj1sylE7luxAixZFcPsEgZOupLOu4I1Dv8UbMcg42TI29ndZhPMGlwFPHiXJmMdJ4LQ1hU7EljXy/4NnHVUp3+oirJuIvzMsH+t0R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBxSk4mH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBxSk4mH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8611F00893;
	Mon,  1 Jun 2026 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780323601;
	bh=UOzybEzeLExkH9mUl9oBfp93NZv2EoV0lRz4YiNg45Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aBxSk4mHUoODPHO12PREt7EgMTEXEXpHHJMcvZe3Vj+AIchbsf4rNiraqBIyY6eX1
	 2lIPQiH14ZViB/aO962wV/vfy2NPH5cUJNjbg4Ueb+xFdvhfkoqf4C/0LmHee76TPw
	 G1y7++6qdg4AhI5A44YjrrmPBR4TBL+6BrlMjWCdFXRP22vxxThNpHfDx5LwxHNOTb
	 6rqVRRP/vSRSya8f84xsWMqmbd/4DhaxZKbnXzCjvTBl+gbBCkPkG88joWnHnS5o/L
	 lnX3Wg28hqTzwxADnDOMWa93KPLkugVqAmXGl5IAUJfJUU0fxBhNcZ07/Jw6CsU6b+
	 05evwhABEcYyA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v4 12/13] selftests/liveupdate: Add stress-sessions
 kexec test
In-Reply-To: <20260530221938.115978-13-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Sat, 30 May 2026 22:19:37 +0000")
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
	<20260530221938.115978-13-pasha.tatashin@soleen.com>
Date: Mon, 01 Jun 2026 16:19:57 +0200
Message-ID: <2vxz33z6filu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, May 30 2026, Pasha Tatashin wrote:

> Add a new test that creates 2000 LUO sessions before a kexec
> reboot and verifies their presence after the reboot. This ensures
> that the linked-block serialization mechanism works correctly for
> a large number of sessions.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

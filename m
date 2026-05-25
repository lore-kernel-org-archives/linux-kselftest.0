Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F493AC0C2;
	Mon, 25 May 2026 16:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779726375; cv=none; b=rhB8FAMQSJiPbwmgo5LPPGjwmkrlk44Fc1gxP243XvVahdgfG6BmoTQssQdsxBWu/x3bR+VglTazZtmm8vx2G2gX1fnt1mOVIkPqR2vzzDDiHURWrHah58/VR5RnKNZPVJLCwWSAKvPcGEl2RPo7wB8T6j76zjuwm0TKhrMbOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779726375; c=relaxed/simple;
	bh=hA2yQh3Jp7wTMBwbq1Ru3RDfm+kbcaEWIUs9SbFuBEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X/yB8Pz1xin8vRvDQbuN6l+cXGre7z1ufLlZop8mmtwxWVHf4B4wAUwJPkd2Scu6FZsA8+zgIELWbILmPi/3m2GWK030bp35geSv7doFocoyKYeojvUB/H4dLWn3WWPAhNzKJO1NzwVT51Mn3cc3yE/V5UuA1qbm22hHOntUj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjko0xfl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjko0xfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4A81F000E9;
	Mon, 25 May 2026 16:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779726374;
	bh=BukyjJ4n0b1AMw2DENX11/eFZaQYpsl8U4gKYqCB1I4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mjko0xfl53oi4XNYCKyMqV0lC7OCOPRG43ZpXvFlmbb2GmQu1zBeQ3vvxrEkDHRx+
	 /DzBIbN4OZP4tqdPfpytw0kVz30WHHlK/zLwudEJf/6KzUPMbTuER54DKBiXs4IJHF
	 NLjTPsyHuQyZOsnvbbf72IvYe15m2t32gREaXodAq/PMbvbSOxdR4jRG67EvLFg3LK
	 uCfAmoKHT3v4n3sPCkbNlVHBof0XAPnuRwVATI02X3is7RlSrnA5xUP6XJPnw+tnNi
	 khTSaV/4iGbuge5+xYy0CBtpT4wIOlu6wcMOqT3rOdL4vQTOso4lcX3V7Ew1HX2iRQ
	 9XloEc9VWjomQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v2 02/10] liveupdate: Extract luo_file_deserialize_one
 helper
In-Reply-To: <20260514222628.931312-3-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Thu, 14 May 2026 22:26:20 +0000")
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
	<20260514222628.931312-3-pasha.tatashin@soleen.com>
Date: Mon, 25 May 2026 18:26:10 +0200
Message-ID: <2vxz33zf78wt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 14 2026, Pasha Tatashin wrote:

> Extract the logic for deserializing single entries for files into
> separate helper functions. In preparation to a linked-block
> serialization for files.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
